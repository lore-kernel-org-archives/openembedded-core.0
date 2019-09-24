Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id B08127F0D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:10 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id x10so363591pgi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Uano9L6dFqJKf3pju8F/uToOnR952Jv6xKacuwmVa9M=;
	b=eMq7g8KTAPM2sjaCR5YA1Ju2uusE0AanbibNwGFZrIyJyYAYvWxliqxIapHTHN17EL
	Zluqrt7a6mWUVfkStTul1ODW3NXyrRAMBEpat3ouliWVHeFYPlrGZ8cOtNnoxpoNXbmz
	KB6bZmU4Y/Q66OOIvsnTMa9l6QgJ6JzuoaAFbe8RHi78BPxdmYxZh2fL25ZNO/ZEmIuv
	EVNGtOy/E3KZwA5CTTLiGOhNm1nHr+vYbCB7M+zM7lU79Nsgna6R7s+enJjfWuPY6ihb
	uIkM0GvbYflh/U9RqY2E1aPrR8sa2ImZzsNNLOMUfb0a9YKFBIcRqrrrHDcRpX4cq9K4
	FQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Uano9L6dFqJKf3pju8F/uToOnR952Jv6xKacuwmVa9M=;
	b=a3X8PMlqUI1CDNaLBNNle5VCMEDvnCqS68qg92ii4xoUwikygm18V94eFxBKc5Pj5W
	tglWBzA/Algl4Z7e71zWk6EZsJnbz//Ef4FAkmgP2jmHVUfRZ60wmN1aRsyLHiDv0U9f
	TkiTmuveNqSFMfq0kUX+39xzg1H+bGr/sSNW6Lw2R+j5+tmkzms+O6QW2i3LDgwdygzN
	NTjt0P9d0VG9wsO38gQeL8XtR91sOIiFtIaGnFflb8vw+qe1XpwIjUeg0xToMMmnp7UO
	BIr4HOpingXlT7VjVAj+N10Y/XrbDJXmfJI9ywTmhdKrHTaZsspNf3JTsmZ2EA31FJ0W
	dQjQ==
X-Gm-Message-State: APjAAAVdAHlS4F6urfgi32v+VT7FnU+U69u/Xzd2I6aAgp5lzy3jk5J1
	RXpltvlejexhLfFjGk5LR5Fe9q8EvFg=
X-Google-Smtp-Source: APXvYqza1+jtarcz/nwcm6CbSFrUnXSftV/4a907ZK28q/SiVgokb7udiIdR98m/7RdTzQ+CifG0Mw==
X-Received: by 2002:a62:1c97:: with SMTP id c145mr734965pfc.168.1569293411767; 
	Mon, 23 Sep 2019 19:50:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:18 -0700
Message-Id: <a4929cddea9b7aa923350f3aecbfac5a929c78c4.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 38/50] binutils: Fix mips patch which changes default emulation
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:11 -0000

From: Nathan Rossi <nathan@nathanrossi.com>

The patch incorrectly removes 'mips_elf32_ntrad_le_vec' from the
'targ_selvecs' replacing it with duplicate entries for
'mips_elf32_ntrad_be_vec'. Correct this so that the default binutils can
still handle 'mips_elf32_ntrad_le_vec' binaries.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0010-Change-default-emulation-for-mips64-linux.patch         | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
index ba5e4c2..5f4ac72 100644
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
-- 
2.7.4


