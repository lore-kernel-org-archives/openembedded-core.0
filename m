Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UXUSM-0002c2-Aw
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 12:40:23 +0200
Received: by mail-wi0-f174.google.com with SMTP id m6so4783803wiv.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2013 03:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=W8ihPeRUaU6SYw00bJfj+3FSNmghzeriylAQbEqYlLI=;
	b=GwoA+bZWZEQYp3Pb3LbyUlW4mGgc1aidiyyzyBEoj7+OEoqyrZpEPWcXVgYjULqLm4
	Rd0vihE8MkAA1MG9h1wmPjazh8TFdPxHejuHtGp5HFHs8PIzeBvnmtvAKJ03uWRzjVZC
	8gcwf1iP3N22UrxrEbdq7PgtwYaPcPgzOB7YeIGasv5roLWA69tknyjHu+nR0ODJlbDZ
	y1m5LwEdUICrp8+Snz1t7neRO6mQ3GolS+Gm2WtXLt4llHh2oBlFkIpp1pSX56ShmpVo
	e1xfX2THL7MQVZn4jsfGERoM3CtvD5c7NmrJholQcie3+Qd5ZpE9DbY8J4lYBFgKKNWZ
	/49w==
X-Received: by 10.180.205.135 with SMTP id lg7mr2042271wic.11.1367403742657;
	Wed, 01 May 2013 03:22:22 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fz3sm3018245wib.0.2013.05.01.03.22.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 May 2013 03:22:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2013 11:19:20 +0100
Message-Id: <06a1154d758be0744da68717b31077cc02ec657e.1367403369.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1367403369.git.ross.burton@intel.com>
References: <cover.1367403369.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkgAi5lyrBLGjMaWQ3CZ5CEtgZ4hx1MRAWzIQeum9xSxvgL+XJVP64TpCFloi4mTSmk693s
Subject: [PATCH 1/3] libsoup: upgrade to 2.42.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2013 10:40:25 -0000
X-List-Received-Date: Wed, 01 May 2013 10:40:25 -0000

Upgrade to the latest stable release, and fix the dependencies.

gnome-keyring use has been removed from libsoup, and sqlite3 is now a hard
dependency.  The optional libsoup-gnome library is now a small stub, so enable
it by default but allow it to be disabled via PACKAGECONFIG.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../{libsoup-2.4_2.40.2.bb => libsoup-2.4_2.42.1.bb}     |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.40.2.bb => libsoup-2.4_2.42.1.bb} (59%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
similarity index 59%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
index 53807af..ef8d439 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
@@ -5,20 +5,20 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-PR = "r1"
-
 SECTION = "x11/gnome/libs"
 
-DEPENDS = "glib-2.0 gnutls libxml2 libproxy"
+DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gnome', '', d)}"
-PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome,libgnome-keyring sqlite3"
+# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.  Enable
+# by default but let it be easily disabled.
+PACKAGECONFIG ??= "gnome"
+PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "211ec6b733d4de33056b56838c88436e"
-SRC_URI[sha256sum] = "32e81220f53abb1f5bbe7d8b0717119df70667fc48e2342d82209ed1593e71dc"
+SRC_URI[md5sum] = "aaccd590a8002b69716f885fa8589887"
+SRC_URI[sha256sum] = "20bd5365bb3e7de70fade91ac82c9dea31636318df90b8c26bc4cde2523a8c91"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
1.7.10.4



