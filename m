Received: from esa6.bmw.c3s2.iphmx.com (esa6.bmw.c3s2.iphmx.com [])
 by mx.groups.io with SMTP id smtpd.web11.27915.1590394999054732375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 01:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=VDHhMni/;
 spf=neutral (domain: bmw.de, ip: <nil>, mailfrom: prvs=40745be84=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1590395002; x=1621931002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=xdMZlRElZ6OZXCi+127ZiFgusoLKG+ZA5GUj1cmanfo=;
  b=VDHhMni/3HbQQ1RcDDPbf0J3VVYxSSYESb58C3DqSYIVNebNT8wV5Maa
   /sFyfnraAa/QcnUC5SspD8c/um/YTbEsbOdi2JtKXPBJFAYYLQxCS5m+t
   UrtERUCCD3ITn2DuThk/Ey9U9GfdFI2yFyRGbsjwQDQeiaXFX+RmCNRnL
   M=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa6.bmw.c3s2.iphmx.com with ESMTP/TLS; 25 May 2020 10:23:21 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw2.muc with ESMTP/TLS;
 25 May 2020 10:23:19 +0200
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp) ([160.48.96.43])
 by esabb1.muc with ESMTP/TLS; 25 May 2020 10:23:18 +0200
Received: from michael-pcx.bmw-carit.intra (192.168.221.40) by
 smucm09k.europe.bmw.corp (160.48.96.43) with Microsoft SMTP Server (TLS;
 Mon, 25 May 2020 10:23:18 +0200
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Michael Ho <Michael.Ho@bmw.de>
Subject: [PATCH v2 2/4] package_ipk.bbclass: add PACKAGE_ADD_METADATA_IPK to sstate variables
Date: Mon, 25 May 2020 10:22:59 +0200
Message-ID: <1590394981-356381-2-git-send-email-michael.ho@bmw.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590394981-356381-1-git-send-email-michael.ho@bmw.de>
References: <1590394981-356381-1-git-send-email-michael.ho@bmw.de>
MIME-Version: 1.0
Return-Path: michael.ho@bmw.de
X-ClientProxiedBy: smucm05l.europe.bmw.corp (160.48.96.28) To
 smucm09k.europe.bmw.corp (160.48.96.43)
Content-Type: text/plain

From: Michael Ho <Michael.Ho@bmw.de>

Add PACKAGE_ADD_METADATA_IPK to IPKEXTRAVARS so it affects the sstate hash
of do_package_write_ipk.

Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
---
 meta/classes/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index c008559..79cb36c 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -238,7 +238,7 @@ def ipk_write_pkg(pkg, d):
         bb.utils.unlockfile(lf)
 
 # Have to list any variables referenced as X_<pkg> that aren't in pkgdata here
-IPKEXTRAVARS = "PRIORITY MAINTAINER PACKAGE_ARCH HOMEPAGE"
+IPKEXTRAVARS = "PRIORITY MAINTAINER PACKAGE_ARCH HOMEPAGE PACKAGE_ADD_METADATA_IPK"
 ipk_write_pkg[vardeps] += "${@gen_packagevar(d, 'IPKEXTRAVARS')}"
 
 # Otherwise allarch packages may change depending on override configuration
-- 
2.7.4

