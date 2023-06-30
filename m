Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9782C001DB
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:44 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.3848.1688092180673461288
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=zk/Gh+75;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-668711086f4so863496b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092180; x=1690684180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFA3z4Pfa4oTN760iXsE1m4xbMdyGFdi9TtT16Ni3ng=;
        b=zk/Gh+75tumfQEevWcgDSGXglQNUS6aNcdg/2txqKA3uW4sWNnq4MzozFZdmtktAlD
         6amSHZzGxUs0LmrT3bI7v9fjCha4Hb75uXP1pc3FuSfl1VjEXXb4RuT7Af+Do2eMAxhO
         Yrcbu5QxrG5acEHxj4WDRpY3ydGNrl89TbwrsOIK+Hu2yhN8YeBr/Do8ZoBRMGczZhX9
         vFdWCQyNGPkCq94aHW4l0HQyk3gK+xpbrf7aezHeCGmzhNlh1w1OBlQVu76WZIpWsF48
         uf6eQiB8hZfIdVi4wF47pcwJVLXsBU8EJsTAyy+QUBch0CYT7pNwMn4ITfivCI2TUDmH
         dSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092180; x=1690684180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFA3z4Pfa4oTN760iXsE1m4xbMdyGFdi9TtT16Ni3ng=;
        b=HmQPBKF4IYqFztWBgbaxvtxu4Dv8/yLLI3G0mea+iYmiObtpCL5ZND6iPfC1IUPKa1
         qOXwuT2vtz2sLLO1ES3JgXQ2jXPsdJ1TccKbWtPZ6KiLBKTfU8HkXYvW+kR8MyRKXP76
         9V/O3MXx24kqjmXw7on/4y67OBJQ+7UaB20/Etl1t+YHUIoqCkZZhODqvctzp3M7YJ2W
         ve7jRQrcquuTv53HaPG1Y1WXnXkiJGhb0YPQTt3+DP/ostOEKHWMxbPOi8mDlcLHVRd7
         9IrMCzo1+2U4wOQq1I7tzZunrGaHSoFnArHRFR1tHgIamCudEyA/N1cZuM+ThEjBPzVq
         v0Lw==
X-Gm-Message-State: AC+VfDxP8JlVZuj99D04oySXAhorKpSzZE00v90ZC41jrjjGd9tzYU3f
	6rhdCZI8M/x/vjOL8KwUSGUDv7IU/B1G3nDUQans3g==
X-Google-Smtp-Source: ACHHUZ6vxj6Dm0syTMuCCAPHLzqnt4syolyknWhUGGGNK/Gfp7SxKXqv6qg7/yJEQNTGa/xtYC7+vA==
X-Received: by 2002:a05:6a00:409a:b0:668:8ad5:778f with SMTP id bw26-20020a056a00409a00b006688ad5778fmr7283896pfb.17.1688092179801;
        Thu, 29 Jun 2023 19:29:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/30] scripts/runqemu: allocate unfsd ports in a way that doesn't race or clash with unrelated processes
Date: Thu, 29 Jun 2023 16:28:53 -1000
Message-Id: <3dccfba830bfbe89554a5e3ed5c3517d13545d35.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183657

From: Alexander Kanavin <alex.kanavin@gmail.com>

There is already a neat check_free_port() function for finding an available port
atomically, so use that and make two additional tweaks:

- no need to allocate two separate ports; per unfsd documentation they can be the same

- move lockfile release until after unfsd has been shut down and the port(s) used has been freed

[YOCTO #15077]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dee96e82fb04ea99ecd6c25513c7bd368df3bd37)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 50224f2784..ef24ddc6b2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1011,17 +1011,14 @@ to your build configuration.
             else:
                 self.nfs_server = '192.168.7.@GATEWAY@'
 
-        # Figure out a new nfs_instance to allow multiple qemus running.
-        ps = subprocess.check_output(("ps", "auxww")).decode('utf-8')
-        pattern = '/bin/unfsd .* -i .*\.pid -e .*/exports([0-9]+) '
-        all_instances = re.findall(pattern, ps, re.M)
-        if all_instances:
-            all_instances.sort(key=int)
-            self.nfs_instance = int(all_instances.pop()) + 1
-
-        nfsd_port = 3049 + 2 * self.nfs_instance
-        mountd_port = 3048 + 2 * self.nfs_instance
+        nfsd_port = 3048 + self.nfs_instance
+        lockdir = "/tmp/qemu-port-locks"
+        self.make_lock_dir(lockdir)
+        while not self.check_free_port('localhost', nfsd_port, lockdir):
+            self.nfs_instance += 1
+            nfsd_port += 1
 
+        mountd_port = nfsd_port
         # Export vars for runqemu-export-rootfs
         export_dict = {
             'NFS_INSTANCE': self.nfs_instance,
@@ -1595,13 +1592,13 @@ to your build configuration.
             logger.debug('Running %s' % str(cmd))
             subprocess.check_call(cmd)
         self.release_taplock()
-        self.release_portlock()
 
         if self.nfs_running:
             logger.info("Shutting down the userspace NFS server...")
             cmd = ("runqemu-export-rootfs", "stop", self.rootfs)
             logger.debug('Running %s' % str(cmd))
             subprocess.check_call(cmd)
+        self.release_portlock()
 
         if self.saved_stty:
             subprocess.check_call(("stty", self.saved_stty))
-- 
2.34.1


