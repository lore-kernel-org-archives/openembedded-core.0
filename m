Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.5615.1587735043129385484
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2020 06:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lxym4/pA;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id w145so7701573lff.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2020 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4RYw0d6rEOcrib5vUjLVM5tgiDYxb7Xb+PfkU9RLoZw=;
        b=Lxym4/pArrLMJSqFteH5JfrEsfQSHxiP7hDTg4cSaPXjUDvObJyYOhGR7htTWfyW0D
         Oe1TaDERhz8rH0aFfMGv68T88yCixzV6jaAYIyroqNCCNlwwM3pimrrVS76Fv2Ex+pIW
         HjwpuESnDLAqGksvR4U/gfsFzLvZ1zcQCFrTKGPil3ArHdofiPVakIiA3ZFPu6TbEOjz
         5KhXAWzk/se6C7OVTNe9o1GfyzWVTNvdMOiQ3p9Mx7wMTNHKybJZ/yKrKNil9jZHrJXd
         zemWFZDSVevWx+Qu5EM+kQukKj21f0rtpfJlZ6IuA6S7C07yrd6OVoA8tQzUe9/Djngq
         9D/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=4RYw0d6rEOcrib5vUjLVM5tgiDYxb7Xb+PfkU9RLoZw=;
        b=pq6NcWVlatpCJO/R4ltMON1jowI9uMhlWva9HCt9LJiz/auhsGxfiPUmyw7sXtsGjE
         G9DuqNh7KuH3eRlaLmrD0mSp4ZbHoXk2jPmLrkUiKBD+RCtEBgWz8FAPjWmQsPV8WOwV
         nc4jXIug3e2+xPLvLBTk+1TYO7/jjL7Z8JOPwhtpQGTLAh04DVXcVjk6yUbaYxVsaJJ9
         Y2dsXOL8kXLzMHxB9DmCqEcYR2oMvqUjC48f72BvWtrjV+Gr+nJcz3JuzNZGRO1fgNAi
         d9oq8rzncJv1747bMPON3ewfLFzzSsJaDUfrr6QBswBw/XPMvSl7/kfP0DtiJJxeFh2f
         M9LA==
X-Gm-Message-State: AGi0PuYAAJ1AzbQEdj+EoIzOBs67ya5ApPfPS4XnZveOI4fhNEdjpzYz
	Zq9Z2OZWF87+fTSMhUgRlf4lLgSGS8s=
X-Google-Smtp-Source: APiQypKXPLDstlvkkc4oz9WMuE/Jl1wLe0RMPb7Wnvm8dJ7yOHJC++FSA0HaYSQh4T6POW2JwcGPcA==
X-Received: by 2002:a19:c850:: with SMTP id y77mr6213603lff.45.1587735041013;
        Fri, 24 Apr 2020 06:30:41 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id u24sm3228000ljl.28.2020.04.24.06.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 06:30:35 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	henrik@newtec.dk
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH] RFC wic: Support .wks files for multiple machines
Date: Fri, 24 Apr 2020 15:30:32 +0200
Message-Id: <20200424133032.7181-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If you want to make a disk image containing rootfs for different
machines, the only way to do it today is by calling wic and passing the
different rootfs-paths.

Eg:
combined.wks
part /export --source rootfs --rootfs-dir=target-image
part / --source rootfs

bitbake multiconfig:arm:target-image
wic create combined --rootfs-dir target-image=/workdir/build/tmp/work/arm-poky-linux/target-image/1.0-r0/rootfs/ -e main

This has many drawbacks:
1) You need to know the folder location for the target-image
2) It is easy to forget updating the target (only running wic and not
   bitbake)
3) It is slow
4) It does not scale when you have multiple machines

Instead, wic can be given a hint of what machine to search for:

combined.wks
part /export --source rootfs --rootfs-dir=arm:target-image
part / --source rootfs

bitbake main

If we ensoure the dependency of target-image from main via
do_image[mcdepends], all the dependencies are automatically
handled.

This patch makes wic aware of the machine to use.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 scripts/lib/wic/misc.py | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 91975ba151..51b43b49aa 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -206,7 +206,12 @@ class BitbakeVars(defaultdict):
 
         if image not in self:
             if image and self.vars_dir:
-                fname = os.path.join(self.vars_dir, image + '.env')
+                if image.find(":") != -1:
+                    [machine, img] = image.split(":")
+                    fname = os.path.join(self.vars_dir, "../../",
+                                         machine, "imgdata", img + '.env')
+                else:
+                    fname = os.path.join(self.vars_dir, image + '.env')
                 if os.path.isfile(fname):
                     # parse .env file
                     with open(fname) as varsfile:
@@ -220,11 +225,16 @@ class BitbakeVars(defaultdict):
                 # Get bitbake -e output
                 cmd = "bitbake -e"
                 if image:
-                    cmd += " %s" % image
+                    if image.find(":") != -1:
+                        [machine, img] = image.split(":")
+                        cmd = "MACHINE=%s %s" % (machine, cmd)
+                    else:
+                        img = image
+                    cmd += " %s" % img
 
                 log_level = logger.getEffectiveLevel()
                 logger.setLevel(logging.INFO)
-                ret, lines = _exec_cmd(cmd)
+                ret, lines = _exec_cmd(cmd, as_shell=True)
                 logger.setLevel(log_level)
 
                 if ret:
-- 
2.26.1

