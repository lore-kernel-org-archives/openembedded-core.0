Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 84A546BE2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:07:12 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id q139so860014pfc.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 22:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=TIb+eMfUEVVHuPiUrgeJw0GbmP7xwo3Stgq7LhooQ4s=;
	b=ZP9waFkWrgkWcoBSGBI1IqytOPZOsLOCwv1kADuEcnwN7QWY/jHIzl+sWfhpKOv2/1
	F67S5oDwY36m7zdMly6Y24sadCn8t3Gd5kQ6H2kdoivskC8qDiQEb1opphaltQGzpqIX
	VZyWWS3f50QJg3nK1jM9hKqQV1h4uyy1GA+m93UXLDW5atB4RgN1j7b9C0cFnYq46N98
	zJLizcMTIifEI9u5qr6FcSfmZB2ulLqCOIrjNHLNIPF9dgnoQhgF8/PwaQvdnXQTpSAq
	APPQYzjwUV/MuLbYflnnYw32V1NVxC0feMuuBlZ5Cx17dAXQTB28AWENEafif/YbaUoy
	ZUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=TIb+eMfUEVVHuPiUrgeJw0GbmP7xwo3Stgq7LhooQ4s=;
	b=BBbGYIm86wHcRAqyIHiDNgWtPvH1VpBBxfVzfkDF7iqOLkMikhrI7M9Km9GSeLsQvE
	IxqZrne1ME1/1nc5TR+mQT5UvaAJOMKMr2u9q8VKwehATN+uCx7+EZd+0krVfR2X71Ly
	zYXYAJd0omQGhjNpsTqS5KS5P9i757keishbdGzwVHTlCHVDW+Q4AkjYcQrzubuhcJrx
	sF4uD4lmfsODXR+82SstEu8xaCSET3r6rRQ7PIBLNeULQ+tj/JaI+4KDlFIHe80yT/MJ
	KyzIrkq5LzmHYtWl2+OYH9fJVbUJPyXYxHU8jXB7E6Fk6dQzib0tHFqviNVufooOdowu
	dIDA==
X-Gm-Message-State: APjAAAULWm85BWJYRkn/AxvT5ANCf2hBvy1S1GMOdwsdBAjXXbJlWTEr
	aGGz+uAsWMrNZwDp47n2hUMi2w==
X-Google-Smtp-Source: APXvYqxtnIvHdQu+hyxbDDRkpItqK9N12P2bGedHOO90/RRtcJ6RIpwQvHBanABHwk34RKalgC3Sdw==
X-Received: by 2002:aa7:9e04:: with SMTP id y4mr2562675pfq.18.1566968833512;
	Tue, 27 Aug 2019 22:07:13 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	65sm927440pgf.30.2019.08.27.22.07.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 22:07:12 -0700 (PDT)
Date: Wed, 28 Aug 2019 05:06:29 +0000
Message-Id: <20190828050629.6392-6-nathan@nathanrossi.com>
In-Reply-To: <20190828050629.6392-0-nathan@nathanrossi.com>
References: <20190828050629.6392-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 6/11] binutils: Fix mips patch which changes default emulation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Aug 2019 05:07:12 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The patch incorrectly removes 'mips_elf32_ntrad_le_vec' from the
'targ_selvecs' replacing it with duplicate entries for
'mips_elf32_ntrad_be_vec'. Correct this so that the default binutils can
still handle 'mips_elf32_ntrad_le_vec' binaries.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 .../0010-Change-default-emulation-for-mips64-linux.patch         | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
index ba5e4c2ce5..5f4ac72f48 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
@@ -1,4 +1,4 @@
-From d540e95d05cd7c4b8924ac7b257c14ae0105d0ab Mon Sep 17 00:00:00 2001
+From 958a49749b772660d3bafb80748829cba6bed065 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:44:14 +0000
 Subject: [PATCH 10/15] Change default emulation for mips64*-*-linux
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index 0e1ddb659c..cc65547588 100644
+index 0e1ddb659c..d4f50f0a8d 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
 @@ -919,12 +919,12 @@ case "${targ}" in
@@ -30,7 +30,7 @@ index 0e1ddb659c..cc65547588 100644
 -    targ_defvec=mips_elf32_ntrad_be_vec
 -    targ_selvecs="mips_elf32_ntrad_le_vec mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_be_vec mips_elf64_trad_le_vec"
 +    targ_defvec=mips_elf64_trad_be_vec
-+    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_ntrad_be_vec mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_le_vec"
++    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_ntrad_le_vec mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_le_vec"
      ;;
    mips*el-*-linux*)
      targ_defvec=mips_elf32_trad_le_vec
@@ -54,6 +54,3 @@ index beba17ef51..917be6f8eb 100644
  			targ_extra_libpath=$targ_extra_emuls ;;
  mips*el-*-linux-*)	targ_emul=elf32ltsmip
  			targ_extra_emuls="elf32btsmip elf32ltsmipn32 elf64ltsmip elf32btsmipn32 elf64btsmip"
--- 
-2.20.1
-
---
2.23.0.rc1

