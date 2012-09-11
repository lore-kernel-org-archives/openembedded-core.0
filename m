Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBT-0001kc-9t
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:43 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:12 -0700
Received: by mail-we0-f175.google.com with SMTP id r6so507617wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=YjgMyRWxpKiJ2czqYmaWzGAHODmbrnmLuYvuf91T1RQ=;
	b=pqSFNcf/fyKYOwPvYU1lf+fPLwkk84LFW03GFALNibcsNq/IlewvGFWAJK6PRw7Exx
	7ermDZig5XMW5h8oHnm0C3nQzyrfGIsScgqAKTTbTwfD4CHvIsopTfONlmjL5xk0A+97
	bdMpdAzHMUiufcI/VPLYvH1HuisHsl7YVLFigGNc4nn4cD2Fj7W5Cmhfa43c3fWk+DVK
	wbRWJv7yOgusH4sPDIASj0KhqJQnfrVpKyl7mvBAeVcLGn7afW6pMw09teNPfLUJ6B9c
	AYTmxIerOrFcnskW/QL4NbZy6QK+KUklASlW7wvzPfAhRMEf2l9IqFybqkOnLwzocNzt
	RCGg==
Received: by 10.216.119.6 with SMTP id m6mr9922531weh.215.1347391152389;
	Tue, 11 Sep 2012 12:19:12 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:18:00 +0100
Message-Id: <1347391088-30390-10-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQk/++0LQgFgG3jUfNXA4f3UBf1Rd4o5whHiMZ3ufnmoPaVK84sLYgMMXW6Nqy/szGRcrWIS
Subject: [RFC 10/18] libx11: make bigfont an optional (disabled by default) packageconfig option
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
X-List-Received-Date: Tue, 11 Sep 2012 19:31:43 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11.inc |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 85fdbe7..d56aa23 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -11,7 +11,7 @@ inherit siteinfo
 FILESPATH = "${FILE_DIRNAME}/libx11"
 
 PE = "1"
-INC_PR = "r6"
+INC_PR = "r7"
 
 PROVIDES = "virtual/libx11"
 
@@ -20,7 +20,7 @@ LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
 DEPENDS += "xproto xextproto xtrans libxcb kbproto inputproto"
-DEPENDS += "xf86bigfontproto xproto-native"
+DEPENDS += "xproto-native"
 
 PACKAGES =+ "${PN}-xcb"
 
@@ -30,9 +30,11 @@ FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
 
 EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/"
 
-# Almost nothing uses XCMS
+# Let people with incredibly archaic requirements enable Xcms and BigFont, but
+# disable them by default.
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
+PACKAGECONFIG[bigfont] = "--enable-xf86bigfont,--disable-xf86bigfont,xf86bigfontproto"
 
 do_compile_prepend() {
 	cd ${S}/src/util
-- 
1.7.10



