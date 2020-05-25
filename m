Received: from esa6.bmw.c3s2.iphmx.com (esa6.bmw.c3s2.iphmx.com [])
 by mx.groups.io with SMTP id smtpd.web11.27915.1590394999054732375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 01:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=XznlJ3Yz;
 spf=neutral (domain: bmw.de, ip: <nil>, mailfrom: prvs=40745be84=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1590395001; x=1621931001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=2shkVJPRH+HOwLNwnUpdjhIRw39IsVWIwVBcdnAH5Jk=;
  b=XznlJ3YzaN02c9zWm8Lk9x1fcFsWaoabTb8xv0d0GgaGhaf5CLcZwHun
   jzwAR/gQ9bWMIqDXz+/mh34FfPWmjF8xSxKpWaic0ER3A6cOrwLr5D+11
   ZGZGdgNkDNOGt5f1EBb3neSlnhBl5awL3ZnB4JMpob42Q+2kiAeVxRu3u
   8=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa6.bmw.c3s2.iphmx.com with ESMTP/TLS; 25 May 2020 10:23:21 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw4.muc with ESMTP/TLS;
 25 May 2020 10:23:19 +0200
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp) ([160.48.96.43])
 by esabb3.muc with ESMTP/TLS; 25 May 2020 10:23:19 +0200
Received: from michael-pcx.bmw-carit.intra (192.168.221.40) by
 smucm09k.europe.bmw.corp (160.48.96.43) with Microsoft SMTP Server (TLS;
 Mon, 25 May 2020 10:23:19 +0200
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Michael Ho <Michael.Ho@bmw.de>
Subject: [PATCH v2 3/4] package_deb.bbclass: add PACKAGE_ADD_METADATA_DEB to sstate variables
Date: Mon, 25 May 2020 10:23:00 +0200
Message-ID: <1590394981-356381-3-git-send-email-michael.ho@bmw.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590394981-356381-1-git-send-email-michael.ho@bmw.de>
References: <1590394981-356381-1-git-send-email-michael.ho@bmw.de>
MIME-Version: 1.0
Return-Path: michael.ho@bmw.de
X-ClientProxiedBy: smucm05l.europe.bmw.corp (160.48.96.28) To
 smucm09k.europe.bmw.corp (160.48.96.43)
Content-Type: text/plain

From: Michael Ho <Michael.Ho@bmw.de>

Refactor the addition of vardeps for this package class to use DEBEXTRAVARS
and pass the items through gen_packagevar so package name specific overrides
are accounted for. This matches the style used in package_ipk.bbclass.

Additionally add PACKAGE_ADD_METADATA_DEB to the DEBEXTRAVARS list so the
packaging is redone if the variable changes value.

Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
---
 meta/classes/package_deb.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 790b26a..cb723fc 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -283,8 +283,9 @@ def deb_write_pkg(pkg, d):
 # Otherwise allarch packages may change depending on override configuration
 deb_write_pkg[vardepsexclude] = "OVERRIDES"
 
-# Indirect references to these vars
-do_package_write_deb[vardeps] += "PKGV PKGR PKGV DESCRIPTION SECTION PRIORITY MAINTAINER DPKG_ARCH PN HOMEPAGE"
+# Have to list any variables referenced as X_<pkg> that aren't in pkgdata here
+DEBEXTRAVARS = "PKGV PKGR PKGV DESCRIPTION SECTION PRIORITY MAINTAINER DPKG_ARCH PN HOMEPAGE PACKAGE_ADD_METADATA_DEB"
+do_package_write_deb[vardeps] += "${@gen_packagevar(d, 'DEBEXTRAVARS')}"
 
 SSTATETASKS += "do_package_write_deb"
 do_package_write_deb[sstate-inputdirs] = "${PKGWRITEDIRDEB}"
-- 
2.7.4

