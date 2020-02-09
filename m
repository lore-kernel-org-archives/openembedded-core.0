Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4C15960F0C
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:16 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id p14so2421899pfn.4
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ao4ChEP4Ho320u7eE6ejgJt2ERClKoaYSVlTm+wUHhg=;
	b=rx815F58XRMUfYw7ZYnuTpofh9IfbKicfDAPpzXhch3Vxnhb5Jak+hUnx4aRAPY80Q
	VEfTGvgnmqS+GsuAF3pVRNOi/nvM7RtBCuR3fbfnscNDV6YrAp3xwZFFMvOtX8BMAzPA
	k53NIs4F1UxIoiVUduEjRtbtrw8zNGx2cp5qJeoRgqZsktbdIsStGkWAi9huOkzNUeHS
	Yk2vMrLdqUHl0sslwb52sE/RRXRXL6gE2r+cKRw0SIWoWfNUo7saBv+7RxKEcA9zIaRg
	zvd3vvNovdZqWU4bDNtvNYjzuOfjJ9KILjB0vFNMOl8ox8xRsBoUXosMO8oxv02J9HPA
	eFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ao4ChEP4Ho320u7eE6ejgJt2ERClKoaYSVlTm+wUHhg=;
	b=HHMQySCVwCCMNwhk9VFFyN37R25HQ8yEeF0J5PXFK80/IN13yreLfTyfSDreuSuR5u
	4O98ShXaQM90EuPK1wGC+C9q8HOrSWKylHcbdtvIqdnY9aBvn7ZrxV2ui1I7UQHn2As+
	QVkwB9xCT8YgXYB5NGax6EpwgOZDEvkzra1xGSXIoKmKRHhFaYHxtyb02r6IJmxLmphg
	Vy3pNV5seP9St3ca/6WblipfsoNH6FipXgdC6aG+KhEO+5Vukih2Oi1KbhC/cSE7vp6u
	Q5H9EF8gf8Sz25v7LV8puGn9yOA2HJIQThTINXKKW42ujfxhJTt7A5Q9s3p/ib6EmM9s
	TYHg==
X-Gm-Message-State: APjAAAVcQGeZ4d2XtjkDI7LIKYI6Y+QpKG0dwEt16JcNXZzQiEHSfast
	9/Q5KGZmcnqg9wfMgv4zuNhO5U66
X-Google-Smtp-Source: APXvYqwNmrcKA1KpvnVEBeMcEz+7ahrPESSq8n1bomkhv+ZPrFKnH/xpk/dYY2oV+pO77EIYEHtIlw==
X-Received: by 2002:a63:ce4b:: with SMTP id r11mr10170568pgi.419.1581264617246;
	Sun, 09 Feb 2020 08:10:17 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.16
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:45 -0800
Message-Id: <e3cb633f14d6cae83aceddb2e7d53a6f174c9bed.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 17/29] patch: Extend to native/nativesdk and depend upon
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:16 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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

(From OE-Core rev: 5ed0840c93804488cd1c1aba6cb382b2434714a5)

(From OE-Core rev: fd3bd61a6fe5190c575dc968f3a0be9c1cbf21ed)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/patch.bbclass                   | 7 +++++++
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 meta/recipes-devtools/patch/patch_2.7.6.bb   | 3 +++
 3 files changed, 11 insertions(+)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index cd241f1c84..25ec089ae1 100644
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
index 91df6f1ae9..66201514d7 100644
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
index 5d7f55f8dc..b5897b357a 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -22,3 +22,6 @@ acpaths = "-I ${S}/m4 "
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)}"
 PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
 
+PROVIDES_append_class-native = " patch-replacement-native"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


