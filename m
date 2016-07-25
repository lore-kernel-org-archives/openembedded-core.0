Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6A7CE606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 23:15:54 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id o80so177493462wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 16:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=cgk3C5YiuxrUzrBqVXEJRjdW2nCN7jaKemMbjZn83LU=;
	b=iJHglp8cf8ExiVounBO30UdbbCvFigDLzRCepQuG4neS8aSEq2HOM5HjhwdtJiD2EI
	LtxBbRqVB3WWYKfPirSC27rZ+u7NI+MOrLDi72ZTlGJAj5vF1IPgrFXaCyWr6qLRdEOR
	hD7Q9gRLyajtPk85omJpuUGWt3y6ULeo8uQnsdUjzIGF+SfWuMX6VOVQSppuBj1F4uv0
	WZhg6cKx3m3cxYHJTJ600TP0y4w9rsGYMNWH1+9B0eg3e0++WsC+Qe8AkxAv1WUz5qlg
	TsUoOG4XjBV8uqBR9louC7su4ZQNhaQFdTzKw9dE5ebBfZPolTRnLeTvdxRW1gzk7f1u
	eBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cgk3C5YiuxrUzrBqVXEJRjdW2nCN7jaKemMbjZn83LU=;
	b=dPSBC4VsbcO1NautYz1BXI+vymkPeKnTUfcZMR05vSXJlT3r0lPsOdxpWTs/HGyySe
	k4oiLSnuw5Fj5USNmolc6oDfFlITGcwV6ugkf7/YUDQTqmyNsCv6Dj83gSemERe43Ngd
	TlNU/j3iNMzWN+ubikp8FfqMxVxU/8AIXM/syIUOG7O/XwmNOZQ1FM5B2AfdcZujeRFV
	KzD9jFhT77ZGDzx0SaKU82gbS1NbiOCv1f+OIKYEKzoF4vcmpLtVTYcQeizcfFnEFgAQ
	yGhx6YFlFlWAJ1vPU3zuDiZ5BGCpTugECp4zKEBh4Z8IonnSXXfas12UMGXXb4N8lbGi
	/gEw==
X-Gm-Message-State: AEkoousf9DFWLX0xNT5fpPEY1afLQey9Dowo/yVGNTIX3TsCW2h4/fChnexDjGOBfvDakv+s
X-Received: by 10.28.61.11 with SMTP id k11mr22824579wma.34.1469488553851;
	Mon, 25 Jul 2016 16:15:53 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	c131sm30049693wmh.1.2016.07.25.16.15.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jul 2016 16:15:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 00:15:51 +0100
Message-Id: <1469488551-17704-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] dpkg: use snapshot.debian.org for SRC_URI
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
X-List-Received-Date: Mon, 25 Jul 2016 23:15:57 -0000

Using ${DEBIAN_MIRROR} for SRC_URI doesn't work very well as that will only
contain releases that are currently in Debian, so currently doesn't contain
1.18.7 as unstable has moved on to 1.18.9.

So, move all of SRC_URI to the .bb so it can use snapshot.debian.org instead,
and set UPSTREAM_CHECK_URI to ${DEBIAN_MIRROR} so upstream release checking
continues to work.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc       |  6 ++----
 meta/recipes-devtools/dpkg/dpkg_1.18.7.bb | 23 ++++++++++++-----------
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index c2215ce..da6985c 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -2,13 +2,13 @@ SUMMARY = "Package maintenance system from Debian"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz"
-
 DEPENDS = "zlib bzip2 perl ncurses"
 DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts perl"
 RDEPENDS_${PN}_class-native = "xz-native"
 
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
+
 inherit autotools gettext perlnative pkgconfig systemd
 
 python () {
@@ -73,5 +73,3 @@ PACKAGES += "${PN}-perl"
 FILES_${PN}-perl = "${libdir}/perl"
 
 BBCLASSEXTEND = "native"
-
-
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
index 5375923..28fdc13 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
@@ -1,18 +1,19 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI_append_class-native =" file://glibc2.5-sync_file_range.patch "
-SRC_URI += "file://noman.patch \
-            file://remove-tar-no-timestamp.patch \
-            file://arch_pm.patch \
-            file://dpkg-configure.service \
-            file://add_armeb_triplet_entry.patch \
-	    file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
-	    file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
-	    file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
-	    file://0005-dpkg-compiler.m4-remove-Wvla.patch \
-	    file://0006-add-musleabi-to-known-target-tripets.patch \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20160509T100042Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz \
+           file://noman.patch \
+           file://remove-tar-no-timestamp.patch \
+           file://arch_pm.patch \
+           file://dpkg-configure.service \
+           file://add_armeb_triplet_entry.patch \
+           file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
+           file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
+           file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
+           file://0005-dpkg-compiler.m4-remove-Wvla.patch \
+           file://0006-add-musleabi-to-known-target-tripets.patch \
            "
+SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch "
 
 SRC_URI[md5sum] = "073dbf2129a54b0fc627464bf8af4a1b"
 SRC_URI[sha256sum] = "ace36d3a6dc750a42baf797f9e75ec580a21f92bb9ff96b482100755d6d9b87b"
-- 
2.8.1


