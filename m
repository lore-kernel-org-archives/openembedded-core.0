Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A422D77112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 15:08:16 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id z1-v6so4547402pgv.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 08:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eRgsHA6Ml+jzPaL2iGgMLBSe/IztHz2lgvLDSq0pciw=;
	b=sLMiO4/s7JCst0PbDTQaPJgFhLQE2rrk2X2sbYyQeTGhW1TfozZh4QTjTfSWD3AX/y
	nDkko7yEgEm5OU1JxcchaAQ4fIFWxoldANJUWTc96FZhox4n9g31N4yZPkhRGkvV7b6J
	B8T0E2nyOJ5idFKdXzRRgaKjFMhPapfhmVqPdAvEUtJj5jtBzLy01N6kSlG2hQLLI0g/
	tKUEKaMWO/Xjni9TMz8XDR/PCmuQVozXM2NsitYJZARw/PCTKZRw/1dJBgvA7gtyW419
	C6Sdcm8duUqxrCwg+/BINfqYE04HDZqlPCWb3JsKBvBE63wQGSsR44r7boYrRKyK/tC4
	KAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eRgsHA6Ml+jzPaL2iGgMLBSe/IztHz2lgvLDSq0pciw=;
	b=DM0E5hP6ucsPeEhdwm6kgboV1lKxww3Xm7vf2Qntmi5W4EyrkZL6oSS1EVdOOi83MV
	mQvCKT+1AoHEky8PrkXncNkSfE96e3wvNnqxQiAIaJx6X3Zlp6jtnriVv5QKA5wVVk8T
	IhBtO2JHPPksAmF5rz3WU1P3c6gnXrCe9Xh7oFzVYQtuMsZuswsvRuQHxgtPfhn2gHcU
	HC+4RtB+cWuLBi66OgGIv80dAOpL27U0omTLfd2E0qlnHcE40Wo3qbEnik/KST9g06tt
	8kwogV5KUHeYpDYdZeRsFWHhF4hDWnuwoaX2oBgXqIGRhsv089jh8DC+xzu9X+upXaAJ
	uPXg==
X-Gm-Message-State: APt69E1LkvP+yRii9xRmYnzQtvdiQPdk40N5pdnMZVTtQsUkGTEvDyBq
	UD0QeLSCoK4QHAhs/CQhlWAH+Q==
X-Google-Smtp-Source: ADUXVKKP+9a/0pu3hOoLMs9wwwe3TOYd+XatLnhlmE93/dDCfIeR73brSyRc3mSxZ+GiN7PZg9gQiw==
X-Received: by 2002:a63:7419:: with SMTP id
	p25-v6mr2020514pgc.24.1529075297373; 
	Fri, 15 Jun 2018 08:08:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	p1-v6sm13069521pfp.137.2018.06.15.08.08.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jun 2018 08:08:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 08:08:16 -0700
Message-Id: <4bc140a23ff6b37c22317e822443ab105e8e5d36.1529075133.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1529075133.git.raj.khem@gmail.com>
References: <cover.1529075133.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] gcc-8: Fix spurious mcpu/march conflict for xscale
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
X-List-Received-Date: Fri, 15 Jun 2018 15:08:16 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-8.1.inc         |  1 +
 ...003-build-failures-with-with-cpu-xsc.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc b/meta/recipes-devtools/gcc/gcc-8.1.inc
index d83ba6555e..c5f25f89ac 100644
--- a/meta/recipes-devtools/gcc/gcc-8.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.1.inc
@@ -73,6 +73,7 @@ SRC_URI = "\
            ${BACKPORTS} \
 "
 BACKPORTS = "\
+           file://0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch \
 "
 SRC_URI[md5sum] = "65f7c65818dc540b3437605026d329fc"
 SRC_URI[sha256sum] = "1d1866f992626e61349a1ccd0b8d5253816222cdc13390dcfaa74b093aa2b153"
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch b/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch
new file mode 100644
index 0000000000..68b8962d47
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch
@@ -0,0 +1,61 @@
+From 11dc6b9576b78bb7a8d70491beab7ab4de24c9d0 Mon Sep 17 00:00:00 2001
+From: rearnsha <rearnsha@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 4 Jun 2018 08:46:04 +0000
+Subject: [PATCH] [arm] PR target/86003 build failures with --with-cpu=xscale
+
+The XScale cpu configuration in GCC has always been somewhat
+non-conforming.  Although XScale isn't an architecture (it's simply an
+implementation of ARMv5te), we do by tradition emit a specific
+pre-define for it.  We achieve this effect by adding an additional
+feature bit to the xscale CPU definition that isn't part of the base
+architecture.
+
+When I restructured the options last year I overlooked this oddity and
+the result, of course, is that this configuration now fails to build
+as intended.
+
+What happens is that the driver (correctly) constructs an architecture
+for the xscale cpu name (as armv5te) and passes it in addition to the
+CPU name.  The backend code, on finding both a cpu and an architecture
+specifies attempts to correlate the two and finds a difference due to
+the additional feature bit and reports an inconsistency (fatally if
+-werror is specified).
+
+I think the best fix to this is to treat the xscale feature bit using
+the same mechanism that we use for other 'quirks' in CPU
+implementations and simply filter it out before comparing the
+capabilities.  It has the additional benefit that it's also the
+simplest fix.
+
+	PR target/86003
+	* config/arm/arm-cpus.in (ALL_QUIRKS): Add xscale feature to the list
+	of bits to ignore when comparing architectures.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@261141 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+ gcc/ChangeLog              | 6 ++++++
+ gcc/config/arm/arm-cpus.in | 4 +++-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
+index 96972a057e7..545321b0bbe 100644
+--- a/gcc/config/arm/arm-cpus.in
++++ b/gcc/config/arm/arm-cpus.in
+@@ -268,7 +268,9 @@ define fgroup DOTPROD	NEON dotprod
+ 
+ # List of all quirk bits to strip out when comparing CPU features with
+ # architectures.
+-define fgroup ALL_QUIRKS   quirk_no_volatile_ce quirk_armv6kz quirk_cm3_ldrd
++# xscale isn't really a 'quirk', but it isn't an architecture either and we
++# need to ignore it for matching purposes.
++define fgroup ALL_QUIRKS   quirk_no_volatile_ce quirk_armv6kz quirk_cm3_ldrd xscale
+ 
+ # Architecture entries
+ # format:
+-- 
+2.17.1
+
-- 
2.17.1


