Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TViZA-00052Y-HX
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Nov 2012 13:47:41 +0100
Received: from mail-ee0-f69.google.com ([74.125.83.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 06 Nov 2012 04:33:54 -0800
Received: by mail-ee0-f69.google.com with SMTP id l10so341108eei.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Nov 2012 04:33:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=WDoh6cd15c9dEu7tb/q2EgAQOPUMXanWTvU3eiE1avk=;
	b=ZyVhVZOJ/fN83bYZQVmud4Q3cvJTbzOdVeD9DgWdmgC0woX5XbX9/Gft6d0PYGjQ5v
	Y64ta/Fs75Ff6Kfdbm3G5ZqP2FhYs1OHx974uhIdYkAQqeO69kMoyPd6keuvOaIb0J9/
	u/tqxQHC6QWSXDxR/pPCYKDMcNwJ+ZxfREZLF7mGugr3a4meSOr5u5hhYjSRluSvVCW+
	zo4Y3aZbSwIz3KyET6PupSH13Tkqcz6PXDaY7/EwmMvsUvoQzPPvWVfKWHGGN1DTjyA4
	OHbOLWKj8dKH4uwrSDvDrjVOtKoqQt156vbqduL0dHA3sOuX5l0OdQYnjJMuG+FRokHx
	WFCw==
Received: by 10.216.131.85 with SMTP id l63mr392068wei.110.1352205232569;
	Tue, 06 Nov 2012 04:33:52 -0800 (PST)
Received: by 10.216.131.85 with SMTP id l63mr392062wei.110.1352205232162;
	Tue, 06 Nov 2012 04:33:52 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cc7sm7695595wib.6.2012.11.06.04.33.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Nov 2012 04:33:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Nov 2012 12:32:35 +0000
Message-Id: <1352205155-32744-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlMdwrKf9t2rKIvpEaPMnR2F+niXNkJHMACSGBy6BqsEVCK4zia1Oqsk3fi+ogG9iUy2QSqJhFsWmLmfX7xemtl2dOINHZZ3juMHyCZOw08r/oOltP6QjDEa5NL9C8H8w9aP5cMI31MNhEsLagapsMfQEbLRGQWIpkDRZSpSqbqslMRY9zyW28MW6Rqf3u2Ds64lx/u
Subject: [PATCH] xorg-driver-common: remove AC_CHECK_FILE workaround
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
X-List-Received-Date: Tue, 06 Nov 2012 12:47:41 -0000

The drivers don't generally use AC_CHECK_FILE anymore, so remove this
brute-force kludge. Any subsequent breakage can be worked-around in the recipe
and fixes submitted upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc |   10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index f9f25ff..d2c9a5f 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -5,7 +5,7 @@ SECTION = "x11/drivers"
 LICENSE = "MIT-X"
 
 PE = "2"
-INC_PR = "r18"
+INC_PR = "r19"
 
 DEPENDS = "virtual/xserver xproto randrproto util-macros"
 
@@ -18,14 +18,6 @@ FILES_${PN}-dbg += " ${libdir}/xorg/modules/drivers/.debug"
 
 inherit autotools pkgconfig
 
-# AC_CHECK_FILE doesn't work when cross compiling, so we create a replacement
-# macro that simply assumes the test succeeds. 
-do_configure_prepend () {
-    echo 'AC_DEFUN(CC_AC_CHECK_FILE, $2)' > configure.ac.new
-    sed 's/AC_CHECK_FILE/CC_AC_CHECK_FILE/g' configure.ac >> configure.ac.new
-    mv configure.ac.new configure.ac
-}
-
 # FIXME: We don't want to include the libtool archives (*.la) from modules
 # directory, as they serve no useful purpose. Upstream should fix Makefile.am
 do_install_append() {
-- 
1.7.10



