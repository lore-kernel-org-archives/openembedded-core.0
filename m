Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDF4C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 18:22:39 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.153.1701454956702591246
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 10:22:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=kaVIXsIM;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=BBFZVy0b;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.27, mailfrom: patrick@stwcx.xyz)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 0B3285C00DB;
	Fri,  1 Dec 2023 13:22:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 01 Dec 2023 13:22:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1701454956; x=1701541356; bh=8N5feLAZDM
	hVgNh4l76YNQek5CoHOBouR4+tVc9gp3c=; b=kaVIXsIMIU/HVqPoZzu6/lk/61
	D3Dw9FWFFMXWIFGO7dNO4y6Kbwnxobs+MCRQ0Tnj9jUlWgX89760pRUpkCaGZHF8
	O3/guSdrzlbdZNXsAFWoC//axz82q5rLUn6MEOVLx0Et7o0bI4CLgYU8ar43as0t
	EQ0U2DF44Njh+lCAQORsLkSesyY8DrmDmEfbsc4CL7c4Nsz9SjdNuJlZTMyxfGiC
	cmWgMtWsBvo7OX2mXvT1MNPaFEQUC4DXGJUxwcOEa2SQUaeaJRNbG9THB3BEz/aF
	ysLCEdQXvd86Ne5qMEWEJXn+/QLPW8Fy+I5CzS01HBZYZ4jthOV4BrDqllNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701454956; x=1701541356; bh=8N5feLAZDMhVg
	Nh4l76YNQek5CoHOBouR4+tVc9gp3c=; b=BBFZVy0bLeLN91pzoVgP+J6W2ErFV
	xDC+yat/iWnE01R313h/spg8aXKKlb/kl2gaXJcWFIUOqFkzH8nqvNqaUIqZMrj4
	K2x/yCEzL70REGcaOB1uBs6RfJZsJM93rxiAyHozk1gkeo6ibryY60NGLaYdv2Lj
	Vyr8J2U3eOQ7wO1d99UVWD0w4QaP+tiAULWMxPvm3CqEFvML1EfgcqGQDGB8E6EL
	tDeEwzCE4KZnN5am91Ttw3FL2dWZMytrVMf67u54PGAm0M1H9HBHLzAxV0hh9HV+
	ZdHJqlnjZoaMiy9DzcyjvWvj+k4411QiSyOLWPy+vheRzOtoKs06kBxMA==
X-ME-Sender: <xms:ayRqZSrhS2B-lrO6O4KbRrDyD4mAWKuQPZcQ5_nWXS1d1o8nHwdvIA>
    <xme:ayRqZQq3SHNaPp39FolCMYJfdOtqt_a3P3RMPI8GZXJnfXKc_js59jLe2g4SDeMpC
    _4be6dnbQziQjq2GNw>
X-ME-Received: <xmr:ayRqZXNDAcu0WnIQRQOlD1y91O9YmBMMR5aQX3gWKKpT0op1YZ48Zodi_FFj3zq2zgHSe3jwV-FMSoP7vWtmL_Hice9TJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiledgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhephf
    fvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
    ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
    eptddvgfefjeevgeelgffglefhkedvgfegfeekffeihfettdfftdelveefiedvleffnecu
    ffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiih
    ii
X-ME-Proxy: <xmx:ayRqZR52Cr9Oex8KWNTz8uiTX1HF62_v-gkNp3nz8_IF8sbPIs20iw>
    <xmx:ayRqZR4Df-FGqqm9_nWS82Zv55GT4ds1q6md8YjG7xuxTh1KrkBGWg>
    <xmx:ayRqZRjkb4R7IhkVp8ujBPqR17hTwF0WOKUL5jJDWizGdRYj9ygyJw>
    <xmx:bCRqZeg7-kiN7QUDe6X4Re82UDB9ZVmHr2asz1rrC468-VVs4kgbGQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Dec 2023 13:22:35 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH v2] shared-mime-info-native: handle old GCC for AlmaLinux8
Date: Fri,  1 Dec 2023 12:22:34 -0600
Message-ID: <20231201182234.3347749-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 18:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191676

shared-mime-info-native fails to build on AlmaLinux 8 due to its use of
GCC-8 and the upstream package missing a required `-lstdc++fs` on that
compiler.  Submitted a patch upstream which fixes this and am porting.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 ...dle-build-with-older-versions-of-GCC.patch | 53 +++++++++++++++++++
 .../shared-mime-info/shared-mime-info_2.4.bb  |  3 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch
new file mode 100644
index 0000000000..919e12b144
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch
@@ -0,0 +1,53 @@
+From 461d00fcd5c5842b9a56f7462d55d46bf21163cc Mon Sep 17 00:00:00 2001
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
+---
+ meson.build | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index ecc012f..93acd40 100644
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
+@@ -46,6 +47,19 @@ if not xdgmime_found
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


