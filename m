Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC55C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 19:01:59 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.1118.1701457312516095179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 11:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=JCJFjiPG;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=f+DVsTwg;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.27, mailfrom: patrick@stwcx.xyz)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id DC4025C00E2;
	Fri,  1 Dec 2023 14:01:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 01 Dec 2023 14:01:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1701457311; x=1701543711; bh=JrSiLBWwNl
	9KUbKTX/sLXnEFMwWtKkxxJrExQ0CY/Gc=; b=JCJFjiPG8YVfX9YqqoSGpJsfVK
	CWgqnswynNlMhLwIRQ2xSO+Gp2eMI9n7SkZReJN3nlBhOivPgvDApG2C8FyO1oqc
	iN400ctFWJW6Djnw6LlIFjPW968pRDyVL3b2RQ8zAdmBjm9q/YFLd7WHFDmAjLGA
	8GqCZ1oNrhor++k50QfqSmE/TQcwVucC0NMbQGqmUCZnzx8Ya1/fboZ3JDJvKIx4
	L87u6wVZr8lGyfYBVW/rpVpltvmX25ABJy0+d1iHHD8TZrz3/EORzznxy5Dfzwu2
	JFxrdgThvBbM8V/mcbi1zFZgeG1jQ3kmQsT7u50yYYBWkppyp13/4kZBucOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701457311; x=1701543711; bh=JrSiLBWwNl9KU
	bKTX/sLXnEFMwWtKkxxJrExQ0CY/Gc=; b=f+DVsTwgE3Cb/w0ktw3duxQ7g8eMw
	Q1Yp7zUQCp3uxrtkv9+jdncGV/eWr1Hj1toquPY/ZsXMhAR8dLHWOTEvTkxJjvwH
	Syv56NmHXT4GTX/CnbPatpGsfOE7h7VEoStK544P4H5oLEf6Z2O3CrAO8A5xYgQ/
	h/aNfMU+hR12MXrxLPmQo5t8g4L/OHqPT6cHXIgPjAHtE2g641FHoRXaylRRYDpk
	vvd4tIEmVl2mchHbwzEZRTPO7NL6knNBeUqNhwBP12JoG6GMb8X75szgHXMxgwX3
	ooPN7lQvUn2KNT2XndrxfxsKgtr0ja+4EURlH+93kX/3pNh7xuFMNpIUA==
X-ME-Sender: <xms:ny1qZYRaD8pF3YH42vbIkdcrl7VBwNlnR-7afzq78aul_4xKNkRT1g>
    <xme:ny1qZVw-ggUXffmHKG2ZGgojsmkUG9xGn6eIAyRsfR5sY16wFtLbCYTTFRV_wGmPM
    MY-xMUYzcEqvENjVrg>
X-ME-Received: <xmr:ny1qZV2Nq5gI0nKrTPwQbd0lBHElKnkXnUrpFt1vQWcdKNNgE9MNNYyPQ6pvLR3nYPgD49Wol719WHeWV3feN-n4NTshbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiledguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhephf
    fvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
    ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
    eptddvgfefjeevgeelgffglefhkedvgfegfeekffeihfettdfftdelveefiedvleffnecu
    ffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiih
    ii
X-ME-Proxy: <xmx:ny1qZcAqrF76IFodLhktPwNZqNmky0wLugu0aBjzSzEzNZfgUzeACg>
    <xmx:ny1qZRh4-iKKyHbuZ35iysoqbO1K1UZCIhennQZxDRtEZ00UzldQmQ>
    <xmx:ny1qZYpOkfNGSeN4jZEKr4jTeILmiGY-v89hp4S_YiapIvFYJ5w32w>
    <xmx:ny1qZRIZqJTicMe_ISGLJeGogEuDVTP0b6DRcz5j_qhsr_8hRDZv6Q>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Dec 2023 14:01:50 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH v3] shared-mime-info-native: handle old GCC for AlmaLinux8
Date: Fri,  1 Dec 2023 13:01:48 -0600
Message-ID: <20231201190148.3350799-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 19:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191687

shared-mime-info-native fails to build on AlmaLinux 8 due to its use of
GCC-8 and the upstream package missing a required `-lstdc++fs` on that
compiler.  Submitted a patch upstream which fixes this and am porting.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 ...dle-build-with-older-versions-of-GCC.patch | 54 +++++++++++++++++++
 .../shared-mime-info/shared-mime-info_2.4.bb  |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch
new file mode 100644
index 0000000000..2af6b461b6
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch
@@ -0,0 +1,54 @@
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
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/xdg/shared-mime-info/-/merge_requests/278]
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


