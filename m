Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5D263788C9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 18:26:49 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id v111so7596412wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 10:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pDOf8Udkx7+JepRQRU/DYKsff+amB2IhwwyFLygpCZA=;
	b=jM+gC25D3Cj3MqPCd+SglGVxMNdzzDXZqTep1P45EtffnuB5qoot10kFKGXrcGeL8p
	SLQPLB65qdTvNqCNP4gj5Pa6tHHE4EJLCTso9yk9rEw8imeamxfWyqSJztDoktbdmqk7
	tQHs+6LBntEEtYWVl97cbsfG7nno7MIurDikv7RAx3tEQfwqc9ZokzRjTQpxib2Gi0u8
	xcvUa8iK5sDf2TGaGw2Cxtqf6npc6idt0w8127lu/nxdUIuWHdIo+6AB0k6m1N+jYJor
	U7QldlOxM/b/ei90/3EtM8vHBPKXHpNizq+5yYwIUtlgUbnsqkBD8ffYNuuD1pSNNiry
	KFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pDOf8Udkx7+JepRQRU/DYKsff+amB2IhwwyFLygpCZA=;
	b=YUIaWEpLLuSszHpXhytYZ6CRZJtBJSKqo8k0ERzobzXDwYa6OMFUFvpFt+6nYAjwyg
	U0tCjX2+iMADOD1mpiRQ6c1OE73DTQjw28kdZwicuOdXum/Wa098mcBxKfEEbygWeqry
	SekZMYG1hrSXtVvXv25iiffW+a6ajkILUooYw9amGDj/GPtXEgwjKaj4eZncXhw8gUz3
	lI13C9Mqh4mawnWb8EAOWGm4HD43D4SYT3Ff04lHhasgVUWMhoVkUP7traun0SNLYPVz
	UIfd+q/xC91Kfq6dVIxRVJ7NgUfPB0Q7gv2aWQ9B7poTpXr0WI2jOLu5ZlzGqZevCyUc
	pc5Q==
X-Gm-Message-State: APf1xPAjlL5bwYtREwPTZaY1XKhTU1d3a98rI5pGlMMGzTQDMdgd4qwc
	V5OjhzBFIMhtVvkf8GAKxuCuPtEd
X-Google-Smtp-Source: AG47ELvad6HvL8BdKqnIohxEGvvO7Irf64nrpzim0wyFb1hsrxdIL+q/t/q92qJQ/iLC7pib4gIVJA==
X-Received: by 10.223.135.231 with SMTP id c36mr2815804wrc.36.1519928809957;
	Thu, 01 Mar 2018 10:26:49 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h188sm4955285wmf.23.2018.03.01.10.26.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 10:26:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 18:26:32 +0000
Message-Id: <20180301182634.20502-9-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180301182634.20502-1-ross.burton@intel.com>
References: <20180301182634.20502-1-ross.burton@intel.com>
Subject: [PATCH 09/11] populate_sdk: install UTF-8 locales in SDKs
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
X-List-Received-Date: Thu, 01 Mar 2018 18:26:49 -0000

As glibc 2.27 can't read older locale-archives, SDKs using glibc 2.27 on hosts
using glibc earlier than 2.27 won't be able to find any locales, so bitbake
won't start and Python can't use UTF-8.

So by default install all locales into the SDK.  Special-case Extensible SDKs by
installing no locales as they ship glibc in a buildtools, and that will have the
locales.

Locale installation requires cross-localedef, so add that to DEPENDS.

Also remove the explicit en_US addition in buildtools-tarball as it is now
redundant.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/populate_sdk_base.bbclass       | 5 ++++-
 meta/classes/populate_sdk_ext.bbclass        | 3 ++-
 meta/recipes-core/meta/buildtools-tarball.bb | 1 -
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index acb91d7d63a..be5970a4bbc 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -23,6 +23,9 @@ SDKIMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("SDKIMAGE_FEATURES", d)
 PACKAGE_ARCHS_append_task-populate-sdk = " sdk-provides-dummy-target"
 SDK_PACKAGE_ARCHS += "sdk-provides-dummy-${SDKPKGSUFFIX}"
 
+# List of locales to install, or "all" for all of them, or unset for none.
+SDKIMAGE_LINGUAS ?= "all"
+
 inherit rootfs_${IMAGE_PKGTYPE}
 
 SDK_DIR = "${WORKDIR}/sdk"
@@ -43,7 +46,7 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-SDK_DEPENDS = "virtual/fakeroot-native pixz-native"
+SDK_DEPENDS = "virtual/fakeroot-native pixz-native cross-localedef-native"
 
 # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
 # could be set to the MACHINE_ARCH
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index d7a08840371..655375416be 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -655,7 +655,8 @@ fakeroot python do_populate_sdk_ext() {
     d.setVar('SDK_REQUIRED_UTILITIES', get_sdk_required_utilities(buildtools_fn, d))
     d.setVar('SDK_BUILDTOOLS_INSTALLER', buildtools_fn)
     d.setVar('SDKDEPLOYDIR', '${SDKEXTDEPLOYDIR}')
-
+    # ESDKs have a libc from the buildtools so ensure we don't ship linguas twice
+    d.delVar('SDKIMAGE_LINGUAS')
     populate_sdk_common(d)
 }
 
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index be37c442104..d98a9c901ce 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -21,7 +21,6 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-wget \
     nativesdk-ca-certificates \
     nativesdk-texinfo \
-    nativesdk-locale-base-en-us \
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-- 
2.11.0


