Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD96EB64DC
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:27 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.342.1688831786408292808
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=RSB1lxxe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6686a05bc66so1694173b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831785; x=1691423785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMuLYDWxv1RP/588SubKOMX+hefTJEbJlYaerI0gXD8=;
        b=RSB1lxxeXgPzYLdGaHsKHEA3fpUUjZNa25mDopVF0O5mIbQ6cinGP8B4g/AQDRzYSr
         AMyNtay06AwQSIEIDqBVnSOLomqYcyfNEJJ8ffNws71ODn+vopMBdAjvqHHOfERuycB/
         sjdpnYDDFonui3KHl21eYqq55cR/I6Jx0VqkkApDCn7HrHFK83W1/ap2oZsNpz3Cfvj0
         lyy3B3kVhqs/ilRPS438xOVLMPlcOrpE3yhP6zHqV1rWkEp9GXadN5fo6JxwLWI/xxVD
         2ZnYNyuEdrlgilhM2jkqtZXNHBcRTS+N6drk9BIbP0RSCBguQMTmHD5ti7V+5O5OwAQu
         A9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831785; x=1691423785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMuLYDWxv1RP/588SubKOMX+hefTJEbJlYaerI0gXD8=;
        b=kTWWTSHslW+wqi2JJnhu07iSFDItPh9SpCVcztIMRXpKMVFBj8O8ZhgxnjuPRwgiua
         ygv27lOTDUGIiwyQSevE+nYYjlf0pAkm1dQ/Ji5B8TUpPcss7EgaENvp/j5C1V5TuJsp
         UUNA4apywbXhaWnfZ8knLByEoQsvlQXzAc2YLxccSGdHWXaklsQ/AqLPdg1mqFNkI4uJ
         xttLPLu7SrAJsNUDAq12V3CymSh2FcaDs/xk6Eg23xrBA1eoaK9PJWFV6GttL7roeoTn
         kzF8DWeGIcR4HoHLtPhYBni7+YrvUVCetNQQEeRjESACjHdZpX1GDrOSowI30spLcAD7
         rCqQ==
X-Gm-Message-State: ABy/qLag9TaVrwmyAXVyyI5ox44AR2Fzy6KCVLWv2/qUtP5d75nB7qSW
	MsxnN2zZkMdF/H/wUwzBqXTzW7B1H+XPnFbGq9c=
X-Google-Smtp-Source: APBJJlHmUOWTEEUti4zauHajy9b4Y7LXnj3lzKOhLC844vxMcUG+Fz4lhIjn0kMLSLLUPO/JvJB8Dw==
X-Received: by 2002:a17:90b:4b41:b0:263:e423:5939 with SMTP id mi1-20020a17090b4b4100b00263e4235939mr6248765pjb.28.1688831785454;
        Sat, 08 Jul 2023 08:56:25 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.56.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/17] scripts/runqemu: allocate unfsd ports in a way that doesn't race or clash with unrelated processes
Date: Sat,  8 Jul 2023 05:55:48 -1000
Message-Id: <816d12f125974fc064d17c735b7769f7a9744597.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184034

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
index 42abda0962..4dfc0e2d38 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -974,17 +974,14 @@ class BaseConfig(object):
             else:
                 self.nfs_server = '192.168.7.1'
 
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
@@ -1420,13 +1417,13 @@ class BaseConfig(object):
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


