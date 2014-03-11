Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id E9AEC6F811
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 17:22:42 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gf5so5873184lab.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 10:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Fq1hxcwuC3IjzDcRysYhmHKjDYGSZOr/HElVD0eYCro=;
	b=UJMRF91upzwZfUsEGCgMu3UxcK+UtX7QwFM07tbLGLkeiW27ofM9l2ZUZwiJiDicuk
	c0KwhH1z3iagyd9dQT9SxTLPYeczEw+N9BF6fefXgSB2vMdJ2b3toKcOUBMmFIBsnS2V
	HDt9gTuXJ6pBt2M5NG6mvy5kXrwUBeMA5/rVMf5/51HLmU2stt8yrBCANnsWZjLhrkY3
	nuoqXKGtkYz6BHoFJrDVS7XEPP9UEVXrrIxK3nVfk5DeOGx8Bgx6TF+YejZXDwb+qvIy
	vGnmuonCTqjMLfA1D2ivlVnfO4j31AZjWtSzFIcq2qT6S718ZCBB49LcKirmAxVIk+gW
	gVlw==
X-Received: by 10.112.55.99 with SMTP id r3mr2082275lbp.54.1394558563393;
	Tue, 11 Mar 2014 10:22:43 -0700 (PDT)
Received: from neopili.qtec.com (0x4dd4aed9.adsl.cybercity.dk.
	[77.212.174.217])
	by mx.google.com with ESMTPSA id q8sm25806170lbr.3.2014.03.11.10.22.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Mar 2014 10:22:41 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Mar 2014 18:22:37 +0100
Message-Id: <1394558557-4962-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] populate_sdk_deb: Fix meta-toolchain-sdk with amd64 ARCH
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
X-List-Received-Date: Tue, 11 Mar 2014 17:22:44 -0000

Map SDK_ARCH x86_64 to DEB_SDK_ARCH amd64

Without this patch meta-toolchain-gmae fails to do_populate_sdk

| The following packages have unmet dependencies:
|  nativesdk-packagegroup-sdk-host : Depends: nativesdk-autoconf but it
is not installable
|                                    Depends: nativesdk-libtool but it
is not installable
|                                    Depends: nativesdk-shadow but it is
not installable
|                                    Depends: nativesdk-unfs-server but
it is not installable
|                                    Depends: nativesdk-makedevs but it
is not installable
|                                    Depends: nativesdk-automake but it
is not installable
|                                    Depends: nativesdk-qemu but it is
not installable
|                                    Depends: nativesdk-pkgconfig but it
is not installable
|                                    Depends: nativesdk-pseudo but it is
not installable
|                                    Depends: nativesdk-qemu-helper but
it is not installable
|                                    Depends: nativesdk-opkg but it is
not installable
|  packagegroup-cross-canadian-qt5022 : Depends:
gdb-cross-canadian-x86-64 but it is not installable
|                                       Depends:
binutils-cross-canadian-x86-64 but it is not installable
|                                       Depends:
gcc-cross-canadian-x86-64 but it is not installable
|                                       Depends: meta-environment-qt5022
but it is not installable

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/classes/populate_sdk_deb.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index ebb842b..aa2b6eb 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -6,6 +6,9 @@ DEB_SDK_ARCH = "${@[d.getVar('SDK_ARCH', True), "i386"]\
                 [d.getVar('SDK_ARCH', True) in \
                 ["x86", "i486", "i586", "i686", "pentium"]]}"
 
+DEB_SDK_ARCH = "${@[d.getVar('SDK_ARCH', True), "amd64"]\
+                [d.getVar('SDK_ARCH', True) == "x86_64"]}"
+
 do_populate_sdk[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 
 populate_sdk_post_deb () {
-- 
1.9.0


