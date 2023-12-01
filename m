Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFED3C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 18:15:30 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.6778.1701454520725718720
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 10:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=Zmb3C19S;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=09xMVp2d;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.27, mailfrom: patrick@stwcx.xyz)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.nyi.internal (Postfix) with ESMTP id E6C905C01DC;
	Fri,  1 Dec 2023 13:15:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Fri, 01 Dec 2023 13:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1701454519; x=1701540919; bh=N3ghcxsxYV
	EpX1ZT4ydmL49mumOPzj1FpkOKBitrl4k=; b=Zmb3C19S1CMLsJ+gzz72O4+OC+
	4M21hJqhN5FRyZdTTUyWgGGFQKTBLKSyztbLa743YeMFL5xirBzSjk/pnH6KOI3q
	7cGrGzpv+M5zdkkvqjNQT8kyHFV7K8WePX1bhdFH4U8N6mKJMGapFCeKe2rPu35f
	6A4ObrRmZH+NQO2yuzbAOPONg9i/HPxls13RNgbM1nFCcW7FBV6tMzh+3U5FnSE0
	oJOL1AecIqlD+BvOmZaCT8sg4keR6eNn+zP5lEW9Pu/TEzTxSYN7h51nrBiaNYad
	KVRLAiWVnmwMIwEUVdUP2Tm47gxtgkCAPHq1Ttlac0ECSMHHTHEdckfJKRLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701454519; x=1701540919; bh=N3ghcxsxYVEpX
	1ZT4ydmL49mumOPzj1FpkOKBitrl4k=; b=09xMVp2dvTWhtj5BrNdifTU8CA6Tz
	V3SIhRWGci0C14dI2ACvbZZ0V6GF7xcqn46JUYj9Mf24shNDVd/SqC1nq1g1r8YV
	ejc6nuIAmffy1ztpIOxyuui/4sGMVincw4izvafB03cOrRwp9zdDTKoAQZgxz/6R
	7+T1IoDS6MSEyO2UzJ11gbuVw94wX9pkls2UI4FwKqnsRLHl1rmmLvLz8JIim6z3
	FZ04+AOJjFbe2qHlmpNBJjCny0IE3+9U0MRvwuUs3qd9KJXJy+ixMN/sn2qzqTWQ
	jlMWVjsyi1DP9QkG6MVz6FHZlwkJ9PqQVka+r5CRbM8aILU456aUF60RA==
X-ME-Sender: <xms:tyJqZRY-cEeuOdgDpKmEMijaYJMLXv8pUw95XrxYtcbpaRXPFvtzqw>
    <xme:tyJqZYZP0NqSehs3XtKHCghECb8w3NtKbONkB-O6ycS1Cw80jQHcKUQEzwe6kufKy
    e6HtwWXy5d8QnDxvTY>
X-ME-Received: <xmr:tyJqZT-YDM1Pb9TUjBe9t8nJ0pLnDEMJoV0eU42ecb0453m2pFRwTOrfl4-qMeS-AAc5PqQVLLPOU2RbOYztdLdSFyD37Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiledgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhephf
    fvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
    ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
    eptddvgfefjeevgeelgffglefhkedvgfegfeekffeihfettdfftdelveefiedvleffnecu
    ffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiih
    ii
X-ME-Proxy: <xmx:tyJqZfrYHOB99kFhBFbMp3oG1-dljUePjZE-HQYEoojyHPavhUNdKA>
    <xmx:tyJqZcrC9GWf7ihqaKS0HivA5LjvT1AlH-HKmSNS15uywz3xULAdZg>
    <xmx:tyJqZVQIV48w4mSGvBhWdDBMUp63jQmrXO9euFtNdStcj8HqHW6mxQ>
    <xmx:tyJqZTTelovzeUTdMbT7low06WU7yjBsr29yjQB05jGXCILajnDRRg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Dec 2023 13:15:19 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] shared-mime-info-native: handle old GCC for AlmaLinux8
Date: Fri,  1 Dec 2023 12:15:15 -0600
Message-ID: <20231201181515.3346703-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 18:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191675

shared-mime-info-native fails to build on AlmaLinux 8 due to its use of
GCC-8 and the upstream package missing a required `-lstdc++fs` on that
compiler.  Submitted a patch upstream which fixes this and am porting.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 ...dle-build-with-older-versions-of-GCC.patch | 60 +++++++++++++++++++
 .../shared-mime-info/shared-mime-info_2.4.bb  |  3 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch
new file mode 100644
index 0000000000..037431ad40
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch
@@ -0,0 +1,60 @@
+From ee15d73fe2790bbe9d4077757523aba276419fbf Mon Sep 17 00:00:00 2001
+From: Patrick Williams <patrick@stwcx.xyz>
+Date: Fri, 1 Dec 2023 11:19:02 -0600
+Subject: [PATCH] Handle build with older versions of GCC
+
+Older versions of GCC (prior to 9.1) did not put the `std::filesystem`
+support directly into libstdcpp, but in a separate `libstdc++fs`.  Add
+meson logic to detect if an extra linker flag is necessary.
+
+Fixes #223.
+
+Tested on AlmaLinux 8 which uses GCC-8.
+
+Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/xdg/shared-mime-info/-/merge_requests/278]
+---
+ meson.build | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index ecc012f..3a6dbbc 100644
+--- a/meson.build
++++ b/meson.build
+@@ -11,6 +11,7 @@ config = configuration_data()
+ i18n = import('i18n')
+ 
+ cc = meson.get_compiler('c')
++cxx = meson.get_compiler('cpp')
+ 
+ ###############################################################################
+ # Project configuration
+@@ -46,12 +47,24 @@ if not xdgmime_found
+     ''')
+ endif
+ 
++###############################################################################
++# Check if GCC needs -lstdc++fs (before 9.1)
++
++if not cxx.links('''
++        #include <filesystem>
++        int main() {
++            return std::filesystem::is_directory(
++                std::filesystem::status("/tmp")) ? 0 : 1;
++        }
++        ''', name: 'std++fs-check')
++    add_project_link_arguments('-lstdc++fs', language : 'cpp')
++endif
++
+ ###############################################################################
+ # Dependencies
+ 
+ config.set('HAVE_FDATASYNC', cc.has_function('fdatasync', prefix: '#include <unistd.h>'))
+ 
+-
+ if get_option('build-translations')
+     subdir('po')
+ endif
+-- 
+2.41.0
+
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
index c7da0ca2d2..ef5df44ad6 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master \
-           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch"
+           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
+           file://0002-Handle-build-with-older-versions-of-GCC.patch"
 SRCREV = "9a6d6b8e963935f145f3a1ef446552de6996dada"
 
 S = "${WORKDIR}/git"
-- 
2.41.0


