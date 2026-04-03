Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5941EE85394
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 18:36:15 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2208.1775241371516611522
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 11:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VkxnNPSB;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cfc497a604so247352585a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 11:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775241370; x=1775846170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1SLSffJyK540ztYG0ApNhQYsoTaZuc6tgI2+tgOohY=;
        b=VkxnNPSBr/hVhIvhmJkd92ro1kHhCPntgHv3zobm9osmL99FxpKyBlRK0d8ktA42d7
         kbDNCQey7lQWSDmKlNesE4WmwqSbCyELm0Ms0e/JEGoa9NDvHG91eNocbnlvO/nWVpRz
         48KWxnbfNq4vX1sIX3lURoEaVexOWnZNh0/g2GoL4aD4elFb2iQ3whhUGZkj4hVlhazb
         wrwHMAHtak635JtKTyd6dhMUFEcITW7JAQX0mZHe9hf15oXTvJxgKqjdOi7nQ3YpP82i
         uhFgsh03HRPnJ2FQe7UsBi+GXeh7QL5BFd86yf/NyIEnWHTr0dbDY9FzGA0OxR6m4P6n
         PxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775241370; x=1775846170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h1SLSffJyK540ztYG0ApNhQYsoTaZuc6tgI2+tgOohY=;
        b=K4eBjBvclSXEuPTUcZzmFiHAZw8PbjccuGFTKPIvIKqLuMnXjcmMDgFxWZML2BVsQq
         6qGy1PxJJhfSwoFP/tsR5XrNnrM10SEoPRuWXWqlfvpnw1pAn7X2HOPOEyuQbQJT13tR
         K/yjHZUh8EnGK8qZNzGotdXmPykXDtcUU6RC6i8Due2BNFqkVGZjnCsDpCYHo7+SUYTh
         6ZewGoR+bOc4CoV7wg2rlh8UWOLFENyJudTSQnmQxEgRKZEgOkbVVZaL45iRoMqbxrn8
         rlXQfVDRlAvxLiXAWIrgz11+y4U5nLNVG2PMsWeUDw0xkEgrrO7QesfyyLkeFTmJJrod
         aojQ==
X-Gm-Message-State: AOJu0YxGXDw/hneCbD7GAd1Wao6cafUXzsmq4tI2CLOoqQ7EvtuEZmBV
	MFNTLI8GEFZPMHP/ULdTvWb9k6Z7VVImMRtRnwVyotahjaOpN6chkp77fi1yftsH
X-Gm-Gg: ATEYQzxOsrGnkAa7jXkticcUaFU0hiUFVVjnqB9f8808yQw5Cd+HHM+fHBWrTD/IIZT
	GekFrptMWEbbkQxc+MYBxK11hvETYbWPUQKoExa0hMjq7P36AaMOTyJYhkI9IWs8DMoYc/5/KFT
	nSLFfDDkBxf0yn/1KiNmw5v+j2oyH2CITTRHodtw5EM5slQm+yp2q59LBusKFj1uCmJ5teZ+x4k
	KbYJI7beW7YQ/wYlFL1QXihEwLaEA+xCakZVrg91fTzIQt9kKZiDbmdHe1RhrT2Fssmfptvywmn
	5GBptxxH7KTXNqKLtHTiBAjginDntbyjVaHS8/lVwbXarmKRW5rdGfcWAGsqjMuH7IjKA1yuPC7
	atPqe5lJcDBxnWDXpfEIk+FfBKdzwMEDLFJat2/h34BhWVeLlP6ZaZ3Xr53Mpdm8kDO/Di+Uln1
	QBSJNfgNrT2QN2MK42ps0cOF0VORqfTTlcqbjG3L4PFHYioEBTm+K0wQnn8XAfskgOlQ==
X-Received: by 2002:a05:620a:bc9:b0:8cf:e32e:89fb with SMTP id af79cd13be357-8d41c2bb360mr535395285a.21.1775241369599;
        Fri, 03 Apr 2026 11:36:09 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593ee25c9sm64627916d6.22.2026.04.03.11.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 11:36:08 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: [PATCH v9 3/5] selftest/cases/wic.py: remove test_sparse_copy
Date: Fri,  3 Apr 2026 14:35:39 -0400
Message-ID: <20260403183541.2631883-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260403183541.2631883-1-twoerner@gmail.com>
References: <20260403183541.2631883-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 18:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234595

Delete the wic.Wic2.test_sparse_copy test since it tests code that is
internal to wic itself. Once wic is removed from oe-core it will not be
possible to test this function from this layer.

NOTE: this patch is in preparation for removing wic from oe-core
      the wic oe-selftests work fine with this patch being added now

Reviewed-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Reviewed-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v9:
- in previous patchsets this was known as patch 9/9
  "oe-selftest/cases/wic.py: oe-selftest -r wic.Wic2 -> PASS"
- previously this patch also included many modifications to the wic
  oe-selftests to add a "--vars <envfile>" option; those are no longer
  needed since wic will use bitbake to get variables if bitbake is
  available on the PATH

changes in v8:
- (skipped, the only patch in v8 was to upstream the sector-size cmdline
  option)

changes in v7:
- none

changes in v6:
- removed extraopts options that specify sector-size values for dos and
  ext* partition types

changes in v5:
- rebase with master
- re-split up into multiple, smaller patches
- now that the sector-size re-implementation is ahead of this patch,
  various wic subcommands (ls, cp, rm) no longer need a --vars file
- combine qemu and non-qemu patches together (were separate patches)

v4: skipped to align/combine with other patch set

changes in v3:
- squashed into 1 large commit

changes in v2:
- none
---
 meta/lib/oeqa/selftest/cases/wic.py | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 791d265a5ee7..4e94f4d39abd 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1894,34 +1894,6 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
         self.remove_config(config)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "sdimage-bootpart-*direct"))))
 
-    def test_sparse_copy(self):
-        """Test sparse_copy with FIEMAP and SEEK_HOLE filemap APIs"""
-        libpath = os.path.join(self.td['COREBASE'], 'scripts', 'lib', 'wic')
-        sys.path.insert(0, libpath)
-        from  filemap import FilemapFiemap, FilemapSeek, sparse_copy, ErrorNotSupp
-        with NamedTemporaryFile("w", suffix=".wic-sparse") as sparse:
-            src_name = sparse.name
-            src_size = 1024 * 10
-            sparse.truncate(src_size)
-            # write one byte to the file
-            with open(src_name, 'r+b') as sfile:
-                sfile.seek(1024 * 4)
-                sfile.write(b'\x00')
-            dest = sparse.name + '.out'
-            # copy src file to dest using different filemap APIs
-            for api in (FilemapFiemap, FilemapSeek, None):
-                if os.path.exists(dest):
-                    os.unlink(dest)
-                try:
-                    sparse_copy(sparse.name, dest, api=api)
-                except ErrorNotSupp:
-                    continue # skip unsupported API
-                dest_stat = os.stat(dest)
-                self.assertEqual(dest_stat.st_size, src_size)
-                # 8 blocks is 4K (physical sector size)
-                self.assertEqual(dest_stat.st_blocks, 8)
-            os.unlink(dest)
-
     def test_mkfs_extraopts(self):
         """Test wks option --mkfs-extraopts for empty and not empty partitions"""
         img = 'core-image-minimal'
-- 
2.51.0


