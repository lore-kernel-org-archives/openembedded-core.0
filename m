Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.6338.1595368604531029814
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 14:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S2I5nG4k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id c80so71130wme.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2020 14:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PTkwCX/VACmxd6cHFQTTuV2ttEPUYKSzHD1tbmV0QnY=;
        b=S2I5nG4kzex8xalYFl88/9SV7ckM2YuFJNkSgVENlkE93KrEDFgdgWi0MDm+HdODLw
         gv9//tKS8ox/gS/Qq81lo+871l06tQ+/KFFioZuN0qMUOQIYP8xc0tR2nBc4bqLdPcJ2
         0ESmLKDXJ6j6bbLhTBKVGVdq3D+1dFnWkeais=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PTkwCX/VACmxd6cHFQTTuV2ttEPUYKSzHD1tbmV0QnY=;
        b=aYimrey165YYhthrVlL1m12hrsX7jDI3efn5JV8uonL/gZYcby4lddW0HIo3tI85KA
         VLSUsO/we2mELjv6ksQSsR2er4S/VPr1R/AwaDo45dT4rbv6waw7m72Nsg91akNtpVeP
         IipreMWZjj2M/D8uDG6aUziq9Zm/Z/ObkXdgmGym3AXRiKLBcU7NDCXoAqIhyIwE/xHw
         +soBacUCBk9VfZA57Z67XrqnhuuvfmlJMgf4RifIglOWPmhUVL4k/ZVAUhJCjs9qrdU7
         i/Dq6YDFsz1uhdh6ouZAR23cazxb/qiRsH0XVByQRBA5b8T1mmwXxm9EgBGI/Q2dh0i/
         NGuQ==
X-Gm-Message-State: AOAM532uVE1yersJfBtYQ8dBmbmX2UzSCr0/GYvCEdCJqkPjzySijR56
	W+lZ5/MHHgev+ZvQt/VGA41qAGDQHSlxrg==
X-Google-Smtp-Source: ABdhPJzq7w/4r72Pr0jgX2UA15lVPYJMyyi1zcggkm/tQwFqVLHxrAysnA6O/4jOmHqL11rBZt1asw==
X-Received: by 2002:a1c:2e57:: with SMTP id u84mr6191161wmu.52.1595368602493;
        Tue, 21 Jul 2020 14:56:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (b.3.a.7.d.5.9.a.4.5.7.5.f.0.d.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:3d0f:5754:a95d:7a3b])
        by smtp.gmail.com with ESMTPSA id s14sm26172954wrv.24.2020.07.21.14.56.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 14:56:41 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemurunner: Use tempfile.mkstemp to create pidfile name
Date: Tue, 21 Jul 2020 22:56:40 +0100
Message-Id: <20200721215640.136052-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We continue to see qemu races where qemu fails to write out a pidfile. The
pidfile name being used was based on the parent process starting the qemus
so in theory, a qemu shutting down could have deleted the file into which
the new qemu's pid was about to be written. This shouldn't happen as qemu
processes should be exitting completely before the code returns.

In the absence of better theory for the failure, use a random pid filename
rather than the parent pid so there is no overlap in the pid filename,
thereby removing any theoretical race.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 519aa9aa1e5..73a3efdc964 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -20,6 +20,7 @@ import string
 import threading
 import codecs
 import logging
+import tempfile
 from oeqa.utils.dump import HostDumper
 from collections import defaultdict
 
@@ -65,7 +66,11 @@ class QemuRunner:
         self.runqemutime = 120
         if not workdir:
             workdir = os.getcwd()
-        self.qemu_pidfile = workdir + '/pidfile_' + str(os.getpid())
+        # Use tempfile to obtain a unique name. We own the directory
+        # so closing the file isn't an issue as long as we don't delete it
+        self.qemu_pidfile = tempfile.mkstemp(dir=workdir, prefix="qemupid_")
+        os.close(self.qemu_pidfile[0])
+        self.qemu_pidfile = self.qemu_pidfile[1]
         self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
         self.monitorpipe = None
 
@@ -182,8 +187,6 @@ class QemuRunner:
 
         # Ask QEMU to store the QEMU process PID in file, this way we don't have to parse running processes
         # and analyze descendents in order to determine it.
-        if os.path.exists(self.qemu_pidfile):
-            os.remove(self.qemu_pidfile)
         self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1}"'.format(bootparams, self.qemu_pidfile)
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
-- 
2.25.1

