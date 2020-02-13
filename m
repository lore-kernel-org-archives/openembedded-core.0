Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 36B8D60C3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:22:08 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id n7so2703572pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lT6ssoRN09IHrR7vXcUuTi7CK9RvpKCw8vfYHDBS2Tc=;
	b=TxVR20Hl8coHj1IBLVwIvRg+LkVBc8RzIyYZrzWht3FYazG5+yyjNZrDWqMErXAbgW
	kFyZY2JPoMijtgPiIOYXlTzZGtLgnVQDL60cVylK2I2sU/+Pjmo8zLc2FVvy7YLCK53Z
	WDlhYqkBgRwIyfhdfYE7VWVSOL6aehILsq30ODpf0JH0hawJ1L41JGVJN0vYkfNx9n02
	lr5TrIr54pcpjFw2Xb0mISajF9m+1oi55a7+0ruhYyxArefER2mac3qlY+YqqoQOGLzi
	Rg86bdyITwY4BIpvCEoLQkHlFKwqf9jhKiJdDz9EW891sIaPUVbjOL/xwxKQirNoMl3p
	NN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lT6ssoRN09IHrR7vXcUuTi7CK9RvpKCw8vfYHDBS2Tc=;
	b=CgpDuBOLQ3e66i+85gOsMcTLhpsfVy3E+N9JMffMko5RmmiYkyujBWmzDJHVcLPKXK
	kEbPLLYGpPGsSJwJrMDqYeLokRZrDGP2IUQFhf8jubhVTO/KeLDbaZoXg2est0EuhEE4
	aM4LHLo07WwL9pV6X2CXCoST4N+H33S9FcodvRMhzfyWVzegkXxsbRSVOKtCFJHVdzjk
	62MbKuAE35Q139R8U8eBO+ajIl8LzHfEPW/x5dL8ppuJFIw43STRDQVfkoda4xJTU3BK
	F/c+CtxYhXGMWUZLPC/VZ9d3zM+TJ0ROEWTvuhJKrZ7f4S6t8HPa5YWXopokmVH7kXj4
	MAZw==
X-Gm-Message-State: APjAAAXSk1SuOPbMpbL3vSZ/pqbEMXN5Rm6D8psk0lhCqu68KRi+nxKN
	SphNSKzMau+8wle3xxB82fsbg9mhbG4=
X-Google-Smtp-Source: APXvYqy04F1EtJ6azql74IycMpYDKhPQcQar7VFxzWVdziJp0GG1FXO4IpHApqw0Hsoz4TIyhPokEQ==
X-Received: by 2002:a62:790e:: with SMTP id u14mr16454717pfc.174.1581582129080;
	Thu, 13 Feb 2020 00:22:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	f127sm1958085pfa.112.2020.02.13.00.22.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 00:22:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 00:21:59 -0800
Message-Id: <e6544c1d527513025147d0cd8426b3a34d1fde1a.1581580428.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581580428.git.raj.khem@gmail.com>
References: <cover.1581580428.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] binutils: Bail out if gold is used on 32/64 bit RISC-V
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
X-List-Received-Date: Thu, 13 Feb 2020 08:22:09 -0000
Content-Transfer-Encoding: 8bit

gold is not supporting risc-v yet and, this will cause subltle errors
during build e.g. autoconf not finding certain features like visibility
and it could take a while to unwind the problem. Its better to error out
early

Remove dwp and ld.gold for rv32 as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 0fb6cae407..a4b9aa586d 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -40,6 +40,7 @@ FILES_${PN}-dev = " \
 
 LDGOLD_ALTS ?= "ld.gold dwp"
 LDGOLD_ALTS_riscv64 = ""
+LDGOLD_ALTS_riscv32 = ""
 
 USE_ALTERNATIVES_FOR = " \
 	addr2line \
@@ -83,6 +84,7 @@ LDGOLD_class-native = ""
 LDGOLD_class-crosssdk = ""
 LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default --enable-threads', d)}"
 
+
 # This is necessary due to a bug in the binutils Makefiles
 # EXTRA_OEMAKE = "configure-build-libiberty all"
 
@@ -163,3 +165,8 @@ inherit update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}_class-target = "${USE_ALTERNATIVES_FOR}"
+
+python () {
+    if bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', True, False, d) and bb.utils.contains_any('TARGET_ARCH', 'riscv32 riscv64', True, False, d):
+        bb.fatal("Gold linker does not _yet_ support RISC-V architecture please remove ld-is-gold from DISTRO_FEATURES")
+}
-- 
2.25.0


