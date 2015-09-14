Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id F0CB876F58
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:31:32 +0000 (UTC)
Received: by qkcf65 with SMTP id f65so60454292qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=RDGY9h2+kU4VAcSX2XInMORtbPhwiGxpyrTH0AfLFBI=;
	b=tFV1oOWYn/1xLGK7gACnzgTs745NL8MOR6lSOGT/s6rOTDygYFPUQc6upW39yBSSE7
	wKCKtStuEvALT+USMGwToG0Nb9bgPfOe5gyVpTscIY2Takh5+jBy/aFhsaWyth16KpJv
	qDFMDFS8z8ZUO7YaZ181s2BZZ3yFY3cURSyoeiN2/OmAL8NETVNQ+Xqj106/p9887ZDV
	7iyqbo0fSzJ+Lo/RA9EsRSThbE8cHjv48GxA55T1tmQs6oBJXMQ71tPeiJSstRObRpv0
	D0P2Kc+fneilDgMw4B8VnZlVnc25U0TVMTbNevxyQqc+oTqB4aylQtwV5teBKVE7PL/H
	rqmA==
X-Received: by 10.55.15.3 with SMTP id z3mr22914493qkg.29.1442248293144;
	Mon, 14 Sep 2015 09:31:33 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w138sm6172059qkw.40.2015.09.14.09.31.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 09:31:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:31:19 +0000
Message-Id: <b9663317a7308040e0ec06ca00d84a906a7c2c16.1442248108.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
References: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
In-Reply-To: <cover.1442248108.git.raj.khem@gmail.com>
References: <cover.1442248108.git.raj.khem@gmail.com>
Subject: [PATCH 04/12] qt4: Fix kmap2qmap build with clang
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
X-List-Received-Date: Mon, 14 Sep 2015 16:31:34 -0000

Adapted and backported https://codereview.qt-project.org/#/c/107464/

Fixes errors like
../../include/QtCore/../../src/corelib/tools/qalgorithms.h:161:20:
error: call to function 'operator<' that is neither visible in the
template definition nor found by argument-dependent lookup
        return (t1 < t2);

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-qt/qt4/qt4-4.8.7.inc                  |  1 +
 .../0034-Fix-kmap2qmap-build-with-clang.patch      | 34 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0034-Fix-kmap2qmap-build-with-clang.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.7.inc b/meta/recipes-qt/qt4/qt4-4.8.7.inc
index 5257e76..d38637c 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.7.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.7.inc
@@ -25,6 +25,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0030-aarch64_arm64_qatomic_support.patch \
            file://0031-aarch64_arm64_mkspecs.patch \
            file://0032-aarch64_add_header.patch \
+           file://0034-Fix-kmap2qmap-build-with-clang.patch \
            file://Fix-QWSLock-invalid-argument-logs.patch \
            file://add_check_for_aarch64_32.patch \
            file://g++.conf \
diff --git a/meta/recipes-qt/qt4/qt4-4.8.7/0034-Fix-kmap2qmap-build-with-clang.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0034-Fix-kmap2qmap-build-with-clang.patch
new file mode 100644
index 0000000..f47a1d9
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.7/0034-Fix-kmap2qmap-build-with-clang.patch
@@ -0,0 +1,34 @@
+From: Samuel Gaist <samuel.gaist@edeltech.ch>
+Date: Wed, 4 Mar 2015 20:16:50 +0000 (+0100)
+Subject: Fix kmap2qmap build on OS X
+X-Git-Tag: v5.4.2~6
+X-Git-Url: https://codereview.qt-project.org/gitweb?p=qt%2Fqttools.git;a=commitdiff_plain;h=cf196a2565235f649b88fac55b53270bea23458d;hp=3070815a24239bd0f469bfeb8d0a1f091974e28e
+
+Fix kmap2qmap build on OS X
+
+Currently kmap2qmap fails to build on OS X (clang) This patch aims to
+fix this.
+
+Change-Id: I61c985dc7ad1f2486368c39aa976599d274942ab
+Reviewed-by: Friedemann Kleint <Friedemann.Kleint@theqtcompany.com>
+---
+Upstream-Status: Backport
+Index: qt-everywhere-opensource-src-4.8.7/tools/kmap2qmap/main.cpp
+===================================================================
+--- qt-everywhere-opensource-src-4.8.7.orig/tools/kmap2qmap/main.cpp
++++ qt-everywhere-opensource-src-4.8.7/tools/kmap2qmap/main.cpp
+@@ -385,9 +385,11 @@ static const int symbol_synonyms_size =
+ 
+ // makes the generated array in --header mode a bit more human readable
+ QT_BEGIN_NAMESPACE
+-static bool operator<(const QWSKeyboard::Mapping &m1, const QWSKeyboard::Mapping &m2)
+-{
+-    return m1.keycode != m2.keycode ? m1.keycode < m2.keycode : m1.modifiers < m2.modifiers;
++namespace QWSKeyboard {
++    static bool operator<(const Mapping &m1, const Mapping &m2)
++    {
++        return m1.keycode != m2.keycode ? m1.keycode < m2.keycode : m1.modifiers < m2.modifiers;
++    }
+ }
+ QT_END_NAMESPACE
+ 
-- 
2.5.2


