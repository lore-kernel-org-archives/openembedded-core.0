Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 587F17F4DE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:59 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id f19so5422264plr.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Uano9L6dFqJKf3pju8F/uToOnR952Jv6xKacuwmVa9M=;
	b=nECuyektZee7MNdKA9BcXp3l/S1lcqQPtJ/2ePK2TC2JEiuh/+YJ3uxy6u8G5Kflvr
	48zBTlaeH4JDjOzIhToxq6Zg6KAaHmB/oJyxL9U7Vi5fx67ZF+LoWY4DwDUVLwvl9dUg
	NXPPvRK9Cg3DmpzzvwpaoCjH9v8lV+MyQQJX5c1me5u2tjODPW25skqsZtXh1Ljy68do
	SZ+k6TrtvczIc0OYWpGBhgIGW9qemka/R67hjH2nUbOXQnR6mxyZaHO2PRh7AgxZupcp
	XaPluytrnx8Pt3CQqEi7zpovWttDsfo2yEVzIZ/8VVpjzEbUFfrCpFxvqQyhIa1TpHRe
	Puiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Uano9L6dFqJKf3pju8F/uToOnR952Jv6xKacuwmVa9M=;
	b=QlocP134IR+KakSohTz6YtK0lrxXeG/2GuCJ64nJ7bj7di3rUZGdOUZOthCxDHmsyb
	gSVR3Q5imtlEL64lbpWgtUOpHimhs1UELKcB+02jSNayKRDqhQAFB+I7RdE3q/2V5xdO
	h8WHwMT7+8f9xs9uA0q4aIMQa7q1GQV3x9vglY7WqZPH4Tvhb6WRBqrjZNmeOrQX3XOV
	/25LVndAajQ+n1ri5Aob//7Psf9PeNS37hZGPXm3G8vN5KEOIxwwQUdP6Z3mJNMVr6KU
	w3pA6uPwA/RERZ7WN1401IUSVyw46IdZy4I1gtWSPj8iPyhN/82qXsJXEVSOai6TXb9b
	zkQg==
X-Gm-Message-State: APjAAAUaRi6qBs3SDF+8xMAGx1raYJjx4D30aJoKE5KkeKjfeRsa5w62
	hLMR656ikZT4xl5vMMIMu5wkYs4j
X-Google-Smtp-Source: APXvYqxVix5K2ncbW0VqQ+5V+pNwHjCKZZTW3ymPy4s02UH1+6eYqQGPMEq4bP8dXHk1biYX0wzSHQ==
X-Received: by 2002:a17:902:9889:: with SMTP id
	s9mr25926038plp.100.1567348620313; 
	Sun, 01 Sep 2019 07:37:00 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:16 -0700
Message-Id: <a4929cddea9b7aa923350f3aecbfac5a929c78c4.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 38/43] binutils: Fix mips patch which changes default emulation
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
X-List-Received-Date: Sun, 01 Sep 2019 14:37:00 -0000

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


