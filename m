Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 156906AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 18:50:37 +0000 (UTC)
Received: by wibut5 with SMTP id ut5so26397027wib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 11:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XiKCJPIEJiGe/zHNEDvIgHG9OKllraoHCrBZNEkwFA4=;
	b=jGiIC2sIakRZtUl8uNy+HFcYf6WNPFI5VILObh0V7ezoIu6GqZ8odIj9Kvh3iQKo4w
	s0bN41lfbhlnDOQ1MWdFRYSsDprgSq3dutTt+gZ1a2azMnsxbWoytzb4jHwJkszPyp7f
	CnERgLoByVTgl+e1od9KEce27PFVGdrdGyQW3WYZM780ISF8+uUjJy3xb5SeGd+Bxeum
	jbqJZTloEM41zuHr9OePBtiOAZ3F0ziBrMHLhSJM0JjcFfjdwx9v/TD4aDYH/QSqWN75
	YY/jLw6+yinGHwuvjedqzMdeRCyEXjZiJUZ8pC6IyoiZTHrTrh98oM4RF/L+/0v5qvOC
	TVTQ==
X-Gm-Message-State: ALoCoQmEcIpTJ7i93T+63Q+XIMVuFvqmHmEPnvVolPK0IfDyG7Wou5LZsCkSzqsvwQ/GD5g4cLdE
X-Received: by 10.194.184.174 with SMTP id ev14mr43498088wjc.95.1433875836186; 
	Tue, 09 Jun 2015 11:50:36 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id fx7sm8178019wjb.10.2015.06.09.11.50.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jun 2015 11:50:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 19:45:55 +0100
Message-Id: <1433875555-26521-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] cups: clean up autotools use
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
X-List-Received-Date: Tue, 09 Jun 2015 18:50:38 -0000

Instead of hand-rolling a do_configure() simply use autotools and disable
autoheader (upstream uses a hand-generated config.h.in).

Also do_compile() doesn't need to pass SSLLIBS as configure uses pkgconfig to
find gnutls, LIBPNG and LIBJPEG are not used anywhere in the build system, and
LIBZ is detected correctly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/cups/cups.inc | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index df47c81..ba50296 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -43,13 +43,7 @@ EXTRA_OECONF = " \
                --without-java \
                "
 
-
-do_configure() {
-	gnu-configize
-	libtoolize --force
-	autoconf --force
-	DSOFLAGS="${LDFLAGS}" SERVERBIN="${libdir}/cups" oe_runconf
-}
+EXTRA_AUTORECONF += "--exclude=autoheader"
 
 do_compile () {
 	sed -i s:STRIP:NOSTRIP: Makedefs
@@ -63,11 +57,7 @@ do_compile () {
 	echo "install-headers:" >> man/Makefile
 	echo "install-libs:" >> man/Makefile
 
-	oe_runmake "SSLLIBS=-lgnutls -L${STAGING_LIBDIR}" \
-		   "LIBPNG=-lpng -lm -L${STAGING_LIBDIR}" \
-		   "LIBJPEG=-ljpeg -L${STAGING_LIBDIR}" \
-		   "LIBZ=-lz -L${STAGING_LIBDIR}" \
-		   "-I."
+	oe_runmake
 }
 
 do_install () {
-- 
2.1.4


