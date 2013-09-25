Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id D3806610DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 11:52:34 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id w6so4931579lbh.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=qeAv7wYw6D+Y2O1g0ZiwXQEzyssg9oMW1m9WIU8RjLk=;
	b=f4/A5h91pCRXapvGH9wm8UdalRZZjzYy2wVYk3sjUOQoha9E+84Wk9NxEeFURlx3q3
	Sid2X3cs0OOaBVE3y6MBOwilIYjBM1Y4m/jfLDJY67uno5gx6OkZoYN8QAYfKWOe7G0F
	cXVDcMuD50fPLqmE+WODW3MmsK/qsKOhqDQUj8kJoN/RuiYbdtp9jSQe7HHMBJdqGETj
	XuQIDqQDeGC5qo1hR++s5VW49gX8DbNsh2CBpSqRH60JmNRMTzrq65x8fbPJT9ekIwvs
	v0V4gyZGBZ5NfD6HrQHNTY5pYzbLlcQ6WvKqhy+0ZIWkp6urxocw7I8HL/GM4asdpENO
	ccBw==
X-Received: by 10.152.22.35 with SMTP id a3mr781535laf.45.1380109955586;
	Wed, 25 Sep 2013 04:52:35 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id o1sm20703371lah.8.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 25 Sep 2013 04:52:34 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 262B440044C; Wed, 25 Sep 2013 13:52:30 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2013 13:52:22 +0200
Message-Id: <1380109943-11869-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH 1/2] shadow: Add nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 25 Sep 2013 11:52:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a second in a series of patches to enable
offline rootfs creation from a package repository.

Some postinstall cmds are Yocto specific and needed to create a
rootfs with pre and post install hooks successfully run,
using only the toolchain tarball + a package repo.

End goal is to create a sandbox where users of a Yocto
based distribution can customize a rootfs from a package feed
with their package manager of choice.

With this patch, I can successfully create packagegroup-core-boot
with only the toolchain tarball(OPKG). More fixes for a few postinstall
hooks outside of packagegroup-core-boot will come next.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-extended/shadow/shadow.inc        | 10 ++++++++++
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 75b0afc..5ab978a 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
 
 DEPENDS = "shadow-native"
 DEPENDS_class-native = ""
+DEPENDS_class-nativesdk = ""
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://shadow.automake-1.11.patch \
@@ -33,6 +34,12 @@ SRC_URI_append_class-native = " \
            file://useradd.patch \
            file://add_root_cmd_groupmems.patch \
            "
+SRC_URI_append_class-nativesdk = " \
+           file://add_root_cmd_options.patch \
+           file://disable-syslog.patch \
+           file://useradd.patch \
+           file://add_root_cmd_groupmems.patch \
+           "
 
 SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
 SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778"
@@ -57,6 +64,7 @@ EXTRA_OECONF += "--without-audit \
 
 NSCDOPT = ""
 NSCDOPT_class-native = "--without-nscd"
+NSCDOPT_class-nativesdk = "--without-nscd"
 NSCDOPT_libc-uclibc = " --without-nscd"
           
 PAM_PLUGINS = "libpam-runtime \
@@ -74,11 +82,13 @@ PAM_PLUGINS = "libpam-runtime \
 
 PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,${PAM_PLUGINS}"
 
 RDEPENDS_${PN} = "shadow-securetty \
                   base-passwd"
 RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN}_class-nativesdk = ""
 
 do_install() {
 	oe_runmake DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install
diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 6f1723e..43e578f 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -4,7 +4,7 @@ require shadow.inc
 # libcrypt. This breaks chsh.
 BUILD_LDFLAGS_append_class-target = " ${@base_contains('DISTRO_FEATURES', 'pam', base_contains('DISTRO_FEATURES', 'libc-crypt',  '-lcrypt', '', d), '', d)}"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 
 
-- 
1.8.3.2


