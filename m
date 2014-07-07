Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1127036E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 15:44:27 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id k14so4548357wgh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jul 2014 08:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=76lUz9bze7jct8mBxL9ghlrlSQXQrRnzPou/diXWiiQ=;
	b=Exah5g+unt1EDn/oSdWrpkdnKPJHoxbLBq50paNAy/LRcuF1C7x33bhZusjStswB3r
	29tjQyrvoplDj2MIY6BfMBqz+s58Nn9hSxT/Oi0TSLRYsvyitEH5jqo9Huyb6lPOfC4L
	mAN9WDsh5ZyZ3b6eOb1s3gqDAeWX2mUSbXt2szYN84WmvDspMMot2b2naj/D4xSO23nQ
	L+RZS/neUD9u7W3n6XAYwoilRjY4guiceuhp9+gddhDutSS4Xx+S1xZMjCdPmuGBG7/D
	nFR1z0/oPMKC9X4DIephGIK6vuT1E2kG3Ck7jK8ZbcZEIDlRz00aE6DN3pVPZCSOS2QB
	Xudg==
X-Gm-Message-State: ALoCoQnOnBV+2Sri4V5OBqfZI7gGgZGa6RnWrpf9YRD4PR2E9ZuLUWOj8zDCeweWzFum/4TPKny+
X-Received: by 10.194.222.5 with SMTP id qi5mr32661157wjc.62.1404747868576;
	Mon, 07 Jul 2014 08:44:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ja9sm116426893wic.8.2014.07.07.08.44.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jul 2014 08:44:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jul 2014 16:44:24 +0100
Message-Id: <1404747864-31615-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libcap: use PACKAGECONFIG for attr and pam configurations
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
X-List-Received-Date: Mon, 07 Jul 2014 15:44:40 -0000

Instead of hard-coding PAM/xattr on for target and off for native, slightly
abuse PACKAGECONFIG to add options (and pass them to make in do_compile).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libcap/libcap.inc |   34 +++++++++++++++++---------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 08f4cfe..a21420f 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -5,10 +5,7 @@ HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 LICENSE = "BSD | GPLv2"
 LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
 
-DEPENDS = "attr perl-native-runtime"
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-# attr and pam are disabled by EXTRA_OEMAKE_class-native
-DEPENDS_class-native = "perl-native-runtime"
+DEPENDS = "perl-native-runtime"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/libc/libcap2/${BPN}2_${PV}.orig.tar.gz \
            file://fix-CAP_LAST_CAP.patch"
@@ -29,25 +26,30 @@ do_configure() {
 	sed -e '/shell gperf/cifeq (,yes)' -i libcap/Makefile
 }
 
-EXTRA_OEMAKE = " \
-  LIBATTR=yes \
-  PAM_CAP=${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} \
-  INDENT= SYSTEM_HEADERS=${STAGING_INCDIR} RAISE_SETFCAP=no \
-  lib=${@os.path.basename('${libdir}')} \
-"
-EXTRA_OEMAKE_class-native = " \
-  LIBATTR=no \
-  PAM_CAP=no \
-  INDENT= \
+PACKAGECONFIG ??= "attr ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG_class-native ??= ""
+
+PACKAGECONFIG[attr] = "LIBATTR=yes,LIBATTR=no,attr"
+PACKAGECONFIG[pam] = "PAM_CAP=yes,PAM_CAP=no,libpam"
+
+EXTRA_OEMAKE += " \
+  INDENT=  \
   lib=${@os.path.basename('${libdir}')} \
+  RAISE_SETFCAP=no \
 "
 
+EXTRA_OEMAKE_append_class-target = " SYSTEM_HEADERS=${STAGING_INCDIR}"
+
 do_compile() {
-	oe_runmake
+	oe_runmake ${EXTRA_OECONF}
 }
 
 do_install() {
-	oe_runmake install DESTDIR="${D}" prefix="${prefix}" SBINDIR="${D}${sbindir}"
+	oe_runmake install \
+		${EXTRA_OECONF} \
+		DESTDIR="${D}" \
+		prefix="${prefix}" \
+		SBINDIR="${D}${sbindir}"
 }
 
 do_install_append() {
-- 
1.7.10.4


