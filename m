Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RSBdt-0003T6-UP
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Nov 2011 18:57:26 +0100
Received: by mail-iy0-f175.google.com with SMTP id k25so6180037iah.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2011 09:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=lm8qGC7ZAgqO4vYfj05cfv94Tsppll9THVb2dc5sYJ4=;
	b=WZbv7kj1TZ4MQJwgbDAjWFskPwoYB7VXIxPFNBkPhBlez0kdm4ClObZDHfbwXkUds0
	smrZ2/hBYYujSRWzgjPr6ahgWJp+8wdBPzFuxTmgHzKGdSEMyV7r9m4EPliKWzs5qUxc
	Fq/PTj8r7Bt63xKNMaXUfl8wTXZu7AmP49shg=
Received: by 10.50.12.227 with SMTP id b3mr11472343igc.24.1321811459284;
	Sun, 20 Nov 2011 09:50:59 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id dd36sm34710971ibb.7.2011.11.20.09.50.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 Nov 2011 09:50:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Nov 2011 09:50:44 -0800
Message-Id: <f25fc1cd1775ec3ddbe2e051591dec5dfcaec3ce.1321811216.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <d06edef859ff936294d76bc07523f50eaaa5baf4.1321811216.git.raj.khem@gmail.com>
References: <d06edef859ff936294d76bc07523f50eaaa5baf4.1321811216.git.raj.khem@gmail.com>
In-Reply-To: <cover.1321811216.git.raj.khem@gmail.com>
References: <cover.1321811216.git.raj.khem@gmail.com>
Subject: [PATCH 2/5] gettext_0.18.1.1: Fix QA Issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Nov 2011 17:57:26 -0000

For uclibc builds we get the following QA error

ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so:
gettext-runtime path
'/work/armv5te-oe-linux-uclibceabi/gettext-0.18.1.1-r4/packages-split/gettext-runtime/usr/lib/libintl.so'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index fabd126..9db2eb1 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r4"
+PR = "r5"
 DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native"
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -67,13 +67,14 @@ FILES_gettext-runtime = "${bindir}/gettext \
                          ${libdir}/libasprintf.so* \
                          ${libdir}/GNU.Gettext.dll \
                         "
-FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/libintl.so* \
+FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/libintl.so.* \
                                              ${libdir}/charset.alias \
                                            "
 FILES_gettext-runtime-dev += "${libdir}/libasprintf.a \
                       ${includedir}/autosprintf.h \
                      "
 FILES_gettext-runtime-dev_append_libc-uclibc = " ${libdir}/libintl.a \
+                                                 ${libdir}/libintl.so \
                                                  ${includedir}/libintl.h \
                                                "
 FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
-- 
1.7.5.4



