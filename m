Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A75EB64DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:20 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.26513.1688656035738667051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xQ5Z2oM7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b8baa836a5so5078955ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656035; x=1691248035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3Luc8s+sGY2wDRMEC117qeZJ7252giBDAqUKLlcLXo=;
        b=xQ5Z2oM76YtJv+JErvrqSl8jItUXDolfSzKBhfLUhmMjEYXKuFb47he+boHBKtgJIh
         e4lcZ0ma45lFZQ4fWPtg1AnJlif0N1S7uD57xd0YSPRq11bFXecY/iIGFl3jhWPy2lF3
         dshPxRuKA972s7cTFJw8MhmM19I/77DdkMrF/5RZhKTBn583i9JwNDfTpihoNUTT+Snt
         U8P3nWGls6yjkXUoTOOiwp83vXGSyZp5E3IP+T4finQArJXnUv1tAQbKvEje6+j26nnh
         iYVfwZzhedkjuyCSZkNDAY4x1hQRRpkX57Q5LBe+lQ4SSiwvJIsv6txkoR+YmbNzJtAa
         FQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656035; x=1691248035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3Luc8s+sGY2wDRMEC117qeZJ7252giBDAqUKLlcLXo=;
        b=fOGYEp/OZGsgvkJcP0YRI4bun2ZWZyv7w7No3q8+I9Xbo5Qbkhd0wgaSspJUz5x2fr
         RMmm0wb3zdSOW/08l8KjvcvyaRuxSRxVVR4rf+dRgYfbjO48avLFR8LWl4FLjxlRqUZb
         9UqBfNw9j2X0UTgAO1UKzvbfDPL//BCTtkUiw95RP3Z8zv5WjheA/7HfhA+b5/IJAfov
         i+0ZhqpScV42xFGucxAUHcv7ctDsLWNoCGVlpqY+6FhQ6/Dlcuqpmc4oY5pwKqg5pT9o
         n4Aqv+tRSVZdopnsd11Q6WikdGfQxWfuOqefKHWPHMg4cJeqtcwC9262MtCc2UuxtVjI
         +oAQ==
X-Gm-Message-State: ABy/qLZfQIdd55s2ygvAW6hDEhGtl+7GMg0zzUVpY8Y3TyFZoa2HstAG
	s1iU2vF2bHRBCYOztiFtnFLB8hzP00A1WSSpsKg=
X-Google-Smtp-Source: APBJJlFKieEgvIexkwUqDvzm8VTOchjbc6BRGwjXrAuUMUSnLbRUOcxUfippH/revMR7YGE+oRRAGg==
X-Received: by 2002:a17:903:24e:b0:1b6:6bf0:eb8f with SMTP id j14-20020a170903024e00b001b66bf0eb8fmr2768111plh.38.1688656034795;
        Thu, 06 Jul 2023 08:07:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/28] scripts/runqemu: allocate unfsd ports in a way that doesn't race or clash with unrelated processes
Date: Thu,  6 Jul 2023 05:06:20 -1000
Message-Id: <343510b33650c88367f95e8d8322fae92ae901ca.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183970

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
index f275cf7813..729b067a9f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1001,17 +1001,14 @@ class BaseConfig(object):
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
@@ -1542,13 +1539,13 @@ class BaseConfig(object):
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


