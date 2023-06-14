Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EDCEB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 13:00:55 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.11053.1686747654830522045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 06:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Qo3VQxNO;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-97467e06511so110078066b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 06:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686747653; x=1689339653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQpKeFJVx+NcMTnemTTKqtKwORTUuTjqP5eimfkwhxA=;
        b=Qo3VQxNONPC74+aHik0Y9u8mfMMP53IOeTBlN1Twk1csA2t7PJRv/WQdtRYxmxuO7F
         jHoThmECDpF2qQeb8d+EfjwXf+OFPTowWnd3LYcQmW0gRIsPrbC0MVQNTi6HdNulAG7F
         jOSt0QPvZEX/TgLzZVt/Ts+HNeqcHVDKXFAiulkKb+IQsb4uzaXm4EeNPUHS1TX/+1AY
         YNWGCb+XLIiSKEoFs22Ye/oS08G/qBoH2AtGcr+bkPVl347JiQF94e9n2DLztCuFyjxI
         sNy37E07BmVIG4PJkBbLrGTFooKPcoK2eowPkvZWcj1cFeceWngJ5lAJjW2AkoJo/WPr
         EdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747653; x=1689339653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQpKeFJVx+NcMTnemTTKqtKwORTUuTjqP5eimfkwhxA=;
        b=gv0dNvuw7747BoHgn4COe1Z0Z/MQiF7r231vZbrBsb1fiyia1lLIlqo7ieN7E6sumb
         ourLZpLomSHnNPIqOajURZTPIzLV1ReF4wGVIrUvKqP74si/qhEHtV0LuCbCnnafBE9r
         Fvl1YW6QqMdiBwg6YTzninSEVkgA4OhvZpl6FxFocPUfqcUd7o0Dl1RdrczNjKZF4WaW
         GVOWhrySY33Fdcn6bkLedqbWD1HFl/mvdAv8IDS040qG/pECfpyLnLiqvi4tvsKtPoGp
         /GjIn+pC4XwwCIH8sD8HNsU8K+22rlSGC2F036O/fvHQCaeo6nYwT21xsqgKRhNa7038
         Vn8g==
X-Gm-Message-State: AC+VfDzoUPdeHBtFJz7uYSw+J2y4EqorJ7iIggdcXNJlgZByKxLYZQnN
	7bNCYWoTtsi+bf+zATQ48/cJSEm1L+0Daw==
X-Google-Smtp-Source: ACHHUZ7ov/TpslGcmq1IRNwd4d86JNKl2gOXSHv0UrMXz42tXvkr8nwEeQmyB36CqVxd5w5yTbzFsA==
X-Received: by 2002:a17:907:7b9f:b0:982:25d1:bfd3 with SMTP id ne31-20020a1709077b9f00b0098225d1bfd3mr6977102ejc.15.1686747652286;
        Wed, 14 Jun 2023 06:00:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b5-20020a1709062b4500b0097456aa5fffsm8028189ejg.61.2023.06.14.06.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:00:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] scripts/runqemu: allocate unfsd ports in a way that doesn't race or clash with unrelated processes
Date: Wed, 14 Jun 2023 15:00:47 +0200
Message-Id: <20230614130047.1587746-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614130047.1587746-1-alex@linutronix.de>
References: <20230614130047.1587746-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 13:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182806

There is already a neat check_free_port() function for finding an available port
atomically, so use that and make two additional tweaks:

- no need to allocate two separate ports; per unfsd documentation they can be the same

- move lockfile release until after unfsd has been shut down and the port(s) used has been freed

[YOCTO #15077]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/runqemu | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index cef5b8d4a4b..7c6f1cb9642 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1015,17 +1015,14 @@ to your build configuration.
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
@@ -1600,13 +1597,13 @@ to your build configuration.
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
2.30.2


