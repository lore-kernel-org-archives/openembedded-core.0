Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 60DE37F30B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:30 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id s1so6659539pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Uano9L6dFqJKf3pju8F/uToOnR952Jv6xKacuwmVa9M=;
	b=LVn1QFTYMqkVTFxNHWKHsFoI986kmi4rraZf0KQf4tzmFvaR2cNviYbRXHcJ0N1fhH
	SB1NQ4Zf/mn7/tsr51YJJtIIJsDMXK8zzFerXpJ2MUX5QusN5kIWQN2OG1s182NbEjvw
	Tjqt4HsZHm2EhDZD8uAMuOjqUNBlrcjtCzW/Twgv5oNle+mjxXNrU4/3YMIicZ+itoxz
	C0izwZ2aK8n6xGyO9qNsh+eGxiGVj+CmO7b4aQw/RUhxlz2Fn+uBcm9K+0aq5d0sXnCQ
	+1mIFPEVm2DI8LN+nSwwhSRJQUpgKDwqh4VWWv2+rG46/9HdEpWMqZGAlGtpT5HbKfLM
	9Ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Uano9L6dFqJKf3pju8F/uToOnR952Jv6xKacuwmVa9M=;
	b=qPIc5WB4LJ1A4oQbjWm46zuXWi9bGwnJ0rR7XK/V3PwOVMH2OTeKWMllSxdL818RP3
	GXSfq3s4BiB52x4yGzNY3AREptKN/osnXmGcviLKmJlfgMolDFR7XwMq9zttKvGCg54Y
	IsmI1ITGh6p67VpZZo+6dfmD+pMEQYPJQjRL+Mg6fKPXqld1pC3spHxYxo94PQhw7DuU
	L68BhvyM7fWfUCx3KuFftR1g8XygOa3j07BZxu23/lEsx9yWFFxAAjjynzWg427ZrKGM
	OwmHmIBOyUSquozE8B0WDrdt2JW0S0vJi4gmeLpqWB35AzVmJzjmNGgHeD/hHBkVZaOi
	OZCw==
X-Gm-Message-State: APjAAAX3Lpr0cmR38aoDGtT+92eASb3H6S+I05gYcHr0gE7KQpVi0KQN
	Zb+j+ArlJfr5882AafV3QHkUMd4Hd5Q=
X-Google-Smtp-Source: APXvYqxfqvwMQzxWLeOY3whnsy0ovsLt9sEOMP8HHjP7KrOtnrDLE8Y6AknlqwylG2Oj8fPBeU/wkw==
X-Received: by 2002:a62:fb06:: with SMTP id x6mr19511742pfm.186.1569818911264; 
	Sun, 29 Sep 2019 21:48:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:32 -0700
Message-Id: <21c59450d1c891dadfe1484337bd0a6007a4aa01.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 37/54] binutils: Fix mips patch which changes default emulation
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:30 -0000

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


