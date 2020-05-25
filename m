Received: from esa4.bmw.c3s2.iphmx.com (esa4.bmw.c3s2.iphmx.com [68.232.139.62])
 by mx.groups.io with SMTP id smtpd.web11.27621.1590392638267639856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 00:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=faFsS5dC;
 spf=pass (domain: bmw.de, ip: 68.232.139.62, mailfrom: prvs=40745be84=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1590392638; x=1621928638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=xdMZlRElZ6OZXCi+127ZiFgusoLKG+ZA5GUj1cmanfo=;
  b=faFsS5dC3vC97vHZQOAhDlXUIyEi0ifC2nbSXi42ncsMhvp5OaIp1nbj
   U/Mh8t3cOCyuftNig1T05bLQPV/bMJ/+xK2Mx1fYkulAbL8s80bF/s9u8
   D4mErMLtDlivilLyYtRnn3TekbgicrMxIwjwnUQAYfX3auvgIykz1Wv/5
   4=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa4.bmw.c3s2.iphmx.com with ESMTP/TLS; 25 May 2020 09:43:55 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw4.muc with ESMTP/TLS;
 25 May 2020 09:43:55 +0200
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp) ([160.48.96.43])
 by esabb4.muc with ESMTP/TLS; 25 May 2020 09:43:54 +0200
Received: from michael-pcx.bmw-carit.intra (192.168.221.35) by
 smucm09k.europe.bmw.corp (160.48.96.43) with Microsoft SMTP Server (TLS;
 Mon, 25 May 2020 09:43:54 +0200
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Michael Ho <Michael.Ho@bmw.de>
Subject: [PATCH 2/5] package_ipk.bbclass: add PACKAGE_ADD_METADATA_IPK to sstate variables
Date: Mon, 25 May 2020 09:43:38 +0200
Message-ID: <1590392621-327991-2-git-send-email-michael.ho@bmw.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590392621-327991-1-git-send-email-michael.ho@bmw.de>
References: <1590392621-327991-1-git-send-email-michael.ho@bmw.de>
MIME-Version: 1.0
Return-Path: michael.ho@bmw.de
X-ClientProxiedBy: smucm06j.europe.bmw.corp (160.48.96.30) To
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

