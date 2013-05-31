Return-Path: <kergoth@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 436E46A4F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 02:26:34 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id xk17so1980259obc.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 19:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=JOwWJOOiYDIemCKE/MmewTgh53tEHPAiHiFkxqVLgyc=;
	b=yndTbJa4S51p5JaiimgvXIeiLJK2sYBWVgfEfGzEVy+b6DQ4wlno6oDarngzXfkNsl
	TCF0sIYsilTjmmMMFCBnv0VsuTKi512ob3h1bqknG3U0uAPWMBcSZygEmATcFWckfxM0
	vacKx7a5AVz6TjezZ8hMWD/hTxL0AdsaQ7Ro801Ly6h5zry//gOSuFs8lPw3QQe4yxAL
	tWXgXtI/ZidlhNtQuWTrDFcaRvbK/RkF8XGOUXJOfPCFsCKEy37JH286APdqVPL2kNhM
	3V6vACsuDZETpiVY/h83Fb9FpeyUN8y/dBCnurljvoV0mnql0Jf7ERmnMYJVFVv2yqVv
	CuEQ==
X-Received: by 10.182.111.164 with SMTP id ij4mr5202501obb.59.1369967195300;
	Thu, 30 May 2013 19:26:35 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id sa2sm14397164oeb.1.2013.05.30.19.26.33
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 19:26:34 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 19:26:27 -0700
Message-Id: <0fe6cf7c2d46b329dc868bc5c7a888331cb7bebc.1369967097.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1369967097.git.chris_larson@mentor.com>
References: <cover.1369967097.git.chris_larson@mentor.com>
In-Reply-To: <cover.1369967097.git.chris_larson@mentor.com>
References: <cover.1369967097.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/5] systemd: obey 'tcp-wrappers' PACKAGECONFIG
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
X-List-Received-Date: Fri, 31 May 2013 02:26:34 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/systemd/systemd_204.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_204.bb b/meta/recipes-core/systemd/systemd_204.bb
index e7b9f6a..5a63c7c 100644
--- a/meta/recipes-core/systemd/systemd_204.bb
+++ b/meta/recipes-core/systemd/systemd_204.bb
@@ -10,7 +10,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 qemu-native util-linux"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
@@ -41,7 +41,7 @@ LDFLAGS_libc-uclibc_append = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= "xz"
+PACKAGECONFIG ??= "xz tcp-wrappers"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 # regardless of PACKAGECONFIG, libgcrypt is always required to expand
@@ -49,6 +49,7 @@ PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 DEPENDS += "libgcrypt"
 # Compress the journal
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
+PACKAGECONFIG[tcp-wrappers] = "--enable-tcpwrap,--disable-tcpwrap,tcp-wrappers"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
-- 
1.8.3


