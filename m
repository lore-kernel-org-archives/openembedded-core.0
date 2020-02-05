Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0F38A607AE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 12:11:56 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t14so2461804wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 04:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tJI6eCpYezEY9tSRpvTQP2pnvtQSKF4kKH+z0+kIcZY=;
	b=CAl84b9d4z4VQFFuLAlIBRva3NMUSyOZQcG2p37a0p5nOay2o0uvG5pj3ipMuDTIAy
	yVN0SPic6byZ0VfzrdtbUgGefPX1kccQeClcWYYbEaMcsBncgUXVMVgqtCzCothhyXNX
	pEQAPJ/192JUc6PbsOl2EfQFzDKQq/DRCWLgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tJI6eCpYezEY9tSRpvTQP2pnvtQSKF4kKH+z0+kIcZY=;
	b=t7P9whoat3yLnF9CS+17HoryNz/3BCE0dNjSo5AlioFrVp+BJf6XNNhigZ5kIhMSgA
	3crOwuTXJBjYlQ3IqRmiRXiiCWW5GzikiLveOxnNXZYGcjHUvm+bWPOsVjst9h9uO6gW
	dnM6UPgKJB2Socz1LIjFvhYVdMt6/pwPT3c7YDoMf9XtyDrwtZ3RdtSSnu0abdV6IA1A
	XeUeZDrMWygIbpY3fKvGPQA+3cF57BYP+C+fqnVQRH5gtz/CH0dHVJPMubsdl05ux8Ot
	IT6cIrKXgmS1rAlyDA0Rbr2j8wfvXuTKZZq+Hath7ad7JIx6ShmNZEz82MSpjE2RcvWn
	0NOg==
X-Gm-Message-State: APjAAAVtZSRGMr18foF4CfnWkczKxTEO4KNcWoew6HDhRl8x62MG180T
	u+TzqhwpP7tMVL7xG0GJnUS1UMgXxoU=
X-Google-Smtp-Source: APXvYqyJRtFH0SFk4qxcZnOfg6FDQhHn1i/TBpaV4k3Ecwk2AjqwTl2DWIOdnoMBipWEoHDA96CH0g==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr5633671wmb.41.1580904717398;
	Wed, 05 Feb 2020 04:11:57 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w19sm7557529wmc.22.2020.02.05.04.11.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 04:11:56 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 12:11:50 +0000
Message-Id: <20200205121151.27880-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200205121151.27880-1-richard.purdie@linuxfoundation.org>
References: <20200205121151.27880-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/6] patch: Extend to native/nativesdk and depend upon
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
X-List-Received-Date: Wed, 05 Feb 2020 12:11:57 -0000
Content-Transfer-Encoding: 8bit

There is a bug in patch 2.7.3 and earlier where index lines
in patches can change file modes when they shouldn't:
http://git.savannah.gnu.org/cgit/patch.git/patch/?id=82b800c9552a088a241457948219d25ce0a407a4

This leaks into debug sources in particular (e.g. tcp-wrappers where
source files are read-only). Add the dependency to target recipes
to avoid this problem until we can rely on 2.7.4 or later.

We could try and remove all index lines from patch files but it will be a
losing battle. We could try and identify all the recipes which change
modes on files in patches but again, its a losing battle.

Instead, compromise and have patch-native as a dependency
for target recipes. We use patch-replacement-native since patch-native
is in ASSUME_PROVIDED.

Also add nativesdk-patch to buildtools-tarball.

[YOCTO #13777]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/patch.bbclass                   | 7 +++++++
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 meta/recipes-devtools/patch/patch_2.7.6.bb   | 3 +++
 3 files changed, 11 insertions(+)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index cd241f1c848..25ec089ae12 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -5,6 +5,13 @@ QUILTRCFILE ?= "${STAGING_ETCDIR_NATIVE}/quiltrc"
 
 PATCHDEPENDENCY = "${PATCHTOOL}-native:do_populate_sysroot"
 
+# There is a bug in patch 2.7.3 and earlier where index lines
+# in patches can change file modes when they shouldn't:
+# http://git.savannah.gnu.org/cgit/patch.git/patch/?id=82b800c9552a088a241457948219d25ce0a407a4
+# This leaks into debug sources in particular. Add the dependency
+# to target recipes to avoid this problem until we can rely on 2.7.4 or later.
+PATCHDEPENDENCY_append_class-target = " patch-replacement-native:do_populate_sysroot"
+
 PATCH_GIT_USER_NAME ?= "OpenEmbedded"
 PATCH_GIT_USER_EMAIL ?= "oe.patch@oe"
 
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 95ebda7fa15..aa55cde84a9 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -25,6 +25,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-texinfo \
     nativesdk-libnss-nis \
     nativesdk-rpcsvc-proto \
+    nativesdk-patch \
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index 5d7f55f8dc3..b5897b357ae 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -22,3 +22,6 @@ acpaths = "-I ${S}/m4 "
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)}"
 PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
 
+PROVIDES_append_class-native = " patch-replacement-native"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


