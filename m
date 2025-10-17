Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E343CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:33 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.3203.1760733565792700695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DJd082Ih;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77f5d497692so3082232b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733565; x=1761338365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFPV9trZYeUPvUNoE77O1pBMgT2Hg6PoRcON2Sho4dQ=;
        b=DJd082IhEkjOcDmFdApHirTO3CFHesNCYVwTaIY35Lc64EsULc2qlnP7eepTneQDdA
         M7uwUjFHBUGm6WbzxJ+lTwsQ/dO6dKSyddapPwUg32tsFIPEEZI/Xjte3wCBh0gLt4m7
         nNhbQPDu0MNKF/Q3XOJlpJBm9VKDdiaXQdBsFp23vDZ9uoBv9hP6nwowNigfHhGrLJOw
         7GTCVMVhGAU+92CtJ5ZVtV38gFYURLChDBhOn0sAzHImDzpbBvAJQL46XpWeS+zP6GSJ
         80vtH3NZf1XwOklO1Svxefan+xuoM8FR5/+hVvOwvQILTKwV8I28ZJ9MaGZ7n/dD7EPV
         2Vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733565; x=1761338365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFPV9trZYeUPvUNoE77O1pBMgT2Hg6PoRcON2Sho4dQ=;
        b=KoOU0yQqfFma4Bjk46CUytB1GzrKiP5vFl8mMTmGMzp/fpWtIqIao0o8Tn9j7ka9m7
         AGmKfprJxoOzQQxjspLTZcgunT1V5Ahx9s2JqFF59Ab1P555Sn+A7l7zSQWuKZr99NkG
         LKqvp4ARB5jNs02thes+23KfY1CoMbnAnQz5mO8ri7SQNHEyZAY15HynYSORCGAgnO2u
         2BnG2bc+VvJ/JwXZfkLWDAhXjkDP28ZI0+Hb1xsWYN6sRVJDTZ1xzgmrdAUwwhC8JSlR
         CQnWAy70MLNL3iAMFX9i96RWac71CQ3qqRJhChADBdOz4stbb5UvUO8S0UV5MO1fV3+J
         S2Og==
X-Gm-Message-State: AOJu0YywGGteesET0tNdU154TThkhmOeK3lfX9+QHN9Rr4AsJxDNe6zs
	IW0V/HD/IXdba1HHObUdZTdnBdA6beubSa2/FSbCg1Qd46IYFxSq1tMC6oACBLHV4/iO044K+sd
	vA7hoeGs=
X-Gm-Gg: ASbGncsjjKDJFd01BAYKjIpYbzpwaWoRtRq8o5XWVpH5W4B1oFoGyjRoNtkx9EjN/4G
	6dLeZ9bh/8hu7Q0Ru3dDUBlZ5o4NHJf7SOlgf+MWjpxmFqLRlWsCKPFsSI3YhdqWIdvLEDzsOdN
	uB7T3Wu4+xTuUDZ6u4cqn9BS98Qkr8pqgVLW54LA33Zylt0wQIC5Ob3Wg2nZzk1yiyCyaH5SDnz
	RqJ3+MKS8VRWtKeyW5cVrLx/dlol5ZBIryn8Y3tKrHWkbVUeDWw1RfFslUDodLHtnL6KTi1qjEz
	1HYLQnFCdgbAL0d7XdgTpOuxrL5Bhd5H52h/2bgFJF+B7O5Lx1/dt74RWqyO74R3zrVp9kG4m5a
	8rPeYhzEkGGFpO1kxah0gBW2Bfeez4k77fUyckTSwe+bUBU95GONHlJv+zanm+e/5zyQiimyfEE
	PW
X-Google-Smtp-Source: AGHT+IFpwCAAYFWWHF7NmW1B87PRhZWA0LeosDOE4vGj/56frZdbQBNfFooNBocEJnHSLtVPoBbd6Q==
X-Received: by 2002:a05:6a00:182a:b0:781:8680:3175 with SMTP id d2e1a72fcca58-7a220adb84cmr5044408b3a.21.1760733564982;
        Fri, 17 Oct 2025 13:39:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/26] binutils: patch CVE-2025-11082
Date: Fri, 17 Oct 2025 13:38:46 -0700
Message-ID: <fe40f3c025d31b262582e0ec9e7b688ae82ee0e6.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225037

From: Peter Marko <peter.marko@siemens.com>

Pick patch per link in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0024-CVE-2025-11082.patch        | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0024-CVE-2025-11082.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index e791cd2b13..a879a1b501 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -59,5 +59,6 @@ SRC_URI = "\
      file://0022-CVE-2025-5244.patch \
      file://0023-CVE-2025-7546.patch \
      file://0023-CVE-2025-7545.patch \
+     file://0024-CVE-2025-11082.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0024-CVE-2025-11082.patch b/meta/recipes-devtools/binutils/binutils/0024-CVE-2025-11082.patch
new file mode 100644
index 0000000000..d712a62bd5
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0024-CVE-2025-11082.patch
@@ -0,0 +1,46 @@
+From ea1a0737c7692737a644af0486b71e4a392cbca8 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Mon, 22 Sep 2025 15:20:34 +0800
+Subject: [PATCH] elf: Don't read beyond .eh_frame section size
+
+	PR ld/33464
+	* elf-eh-frame.c (_bfd_elf_parse_eh_frame): Don't read beyond
+	.eh_frame section size.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2025-11082
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ea1a0737c7692737a644af0486b71e4a392cbca8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elf-eh-frame.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/elf-eh-frame.c b/bfd/elf-eh-frame.c
+index dc0d2e097f5..30bb313489c 100644
+--- a/bfd/elf-eh-frame.c
++++ b/bfd/elf-eh-frame.c
+@@ -734,6 +734,7 @@ _bfd_elf_parse_eh_frame (bfd *abfd, struct bfd_link_info *info,
+       if (hdr_id == 0)
+ 	{
+ 	  unsigned int initial_insn_length;
++	  char *null_byte;
+ 
+ 	  /* CIE  */
+ 	  this_inf->cie = 1;
+@@ -750,10 +751,13 @@ _bfd_elf_parse_eh_frame (bfd *abfd, struct bfd_link_info *info,
+ 	  REQUIRE (cie->version == 1
+ 		   || cie->version == 3
+ 		   || cie->version == 4);
+-	  REQUIRE (strlen ((char *) buf) < sizeof (cie->augmentation));
++	  null_byte = memchr ((char *) buf, 0, end - buf);
++	  REQUIRE (null_byte != NULL);
++	  REQUIRE ((size_t) (null_byte - (char *) buf)
++		   < sizeof (cie->augmentation));
+ 
+ 	  strcpy (cie->augmentation, (char *) buf);
+-	  buf = (bfd_byte *) strchr ((char *) buf, '\0') + 1;
++	  buf = (bfd_byte *) null_byte + 1;
+ 	  this_inf->u.cie.aug_str_len = buf - start - 1;
+ 	  ENSURE_NO_RELOCS (buf);
+ 	  if (buf[0] == 'e' && buf[1] == 'h')
-- 
2.43.0


