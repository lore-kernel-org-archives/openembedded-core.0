Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27E3C44515
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:47:49 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12392.1784134069145469064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Zd1DFar/;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-44cedfaab6bso2375709fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134068; x=1784738868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8qw51GbQBfsMvbjKJAvD96MlPeh+dr3m8fgKoJadGs=;
        b=Zd1DFar/gynowAOnEx74opsH1fLZdiZ0lC1lffyINgCpZa48zNlBz2BtkMLWd1sFhR
         VsI4zxJ+8vHSQSEcCSOZBPiMsT2rPOpc+JPrBjoiyLwwbOvBSXnDytf8ttW3Bru0POzf
         XJcN5RC5ODS9aOtuLN8YEZVGxFJcX9s9eeRSZ8QcLFuCXNcWboGbPeYnohZKcfMPUQmz
         hM3UMP8w/DhxXouSkOiZDT34MTxodxP3JM3PFGqjSdX/zzdxw466sF1npOJVsB0QNLDT
         VqnJMdn7Pyf0BpZQlsAUjXZZTofW4U+LkrckMIzHFgEydEvC1LTeFmSWyRg0KzKeBdSk
         uaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134068; x=1784738868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8qw51GbQBfsMvbjKJAvD96MlPeh+dr3m8fgKoJadGs=;
        b=YKBNd5D/a6uzKoxyiLImEryZKhcGixDuYd1cj7UFz4MandWpxQ/fFUty5OupH3UIeN
         ArZkhoZxlR+BcO2Zn9PefgTz9dAha7HBtsu9XKIMWOtstaRd+0NdSG4tQmIJOJtPOccp
         854WUIxKqKCA5uQ5O95HI1CJfTZI39EhBv6HeGIdse3bchMGEOwHCtFcEMqWQBUgojcr
         iF5aUHuJF/kHCvqtPe+KDN/jZFsVwsJqCmgEzPrPBOcj2ZbWl73vACF1XVBrE8mp7QCm
         tH7wTd/mE5PcxPh8UyekVdOogPkmrTWtkOkxzb8gFzc/4hZk0hqD5yGRDS0nHMYZrdKu
         1cPw==
X-Gm-Message-State: AOJu0Yyn9PLLpG0PGJMSqGfRsd5xtF5UruMizPWtWNb/+mADLu7CvR3Q
	wJ93iGnVFbFetWyF5Cc4kwtP2b59GwHqvvFmSjJn4gh+dijNwoiQJd5iCj+Shg==
X-Gm-Gg: AfdE7cmUdIGELDXqJjhce/y229Ayy1DqUmADiNA14Gq44srnNDXyg+mlmuY8dEWb3AU
	9qNl9nx7JJTfjmoT3Da6z7Bp5F87zetG/aAjsGwgRgU7e69TbwGlDImNrDICuV9P8X4AkJuZsU4
	K+yNHGbp7vTbcODVfJbIXYpgYnHB89UlQsCincOFyFfTjVjzxMz/tZXKCLLoc+KD71GbrXq5p1B
	2atBX+OOikg/+NUNs5Nii8ywpE/wruOP/KFZecEtNjaPQXTvSMBTmP37RP5DQ516JX0QKPTgD/t
	IShat/IH+3R0YVcUn0BaSwH45WAmijLzFw3nIwMP1aQZBAFqU6VYUthuIdTy6V524ElyVU+D7+N
	djpX6qAQ8IMhxGM8liPkWL3AVALgz6QeFkJhLwSKRcMicSUcY0dKnLEYCmGLBPafUUg3Z83LsYY
	1bEoNk2KX4
X-Received: by 2002:a05:6870:1767:b0:447:9dcd:ad3 with SMTP id 586e51a60fabf-4562b2d0035mr2154064fac.18.1784134068264;
        Wed, 15 Jul 2026 09:47:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:47 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 08/25] gcc-common.inc: Remove LICENSE
Date: Wed, 15 Jul 2026 10:45:04 -0600
Message-ID: <20260715164739.364323-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241001

Removes the LICENSE expression from gcc-common.inc; the format is not an
SPDX identifier and is not necessary since the gcc recipes already have
a valid LICENSE identifier

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 8d95698743..a7f01cd045 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -2,7 +2,6 @@ SUMMARY = "GNU cc and gcc C compilers"
 HOMEPAGE = "http://www.gnu.org/software/gcc/"
 DESCRIPTION = "The GNU Compiler Collection includes front ends for C, C++, Objective-C, Fortran, Ada, Go, and D, as well as libraries for these languages (libstdc++,...). GCC was originally written as the compiler for the GNU operating system."
 SECTION = "devel"
-LICENSE = "GPL"
 
 NATIVEDEPS = ""
 
-- 
2.54.0


