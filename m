Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mx.groups.io with SMTP id smtpd.web12.1205.1617089387239008774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 00:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.129.153, mailfrom: awais_belal@mentor.com)
IronPort-SDR: 17yaH2ToBiIkF13yE2XzJIZm0LJQBbmVsdHsIQBcqSIopRpMYqrikuhEQf+TAaVbQFATfC6+6G
 OnzeEt2v4jUCjYbIKWyEiksAo8fV5XlyIxQ+kn7rdUjr1+RFQTWd2DJtBp9TwnXIsLwEDZ1OnG
 68L0NjslP8dJTLP57OgvZbHTSC6YnNJod5oulG9xKXB/2dKSj8U4n/8apJepv7iX1x6s7ws/FB
 En9SB/TyQq00p0ujxjluIVIL62N2Xvq9MGJ5wkojclbIrtHIOtN3fs+bFBl5OqFhiWQOGiFxng
 9rY=
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="61964245"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 29 Mar 2021 23:29:46 -0800
IronPort-SDR: tOFxqbxakADd46ONY7cbQTmWYG+fOk10X6KNLASfRrOWDuEcIXpdUhClm7bOKZ7+RWP5TG/Vqm
 3zQVZJ3GrQX0bGzLZDUYgzSUb5n//xUIBqQrYZlO2gJ0t2IZh28luZb2g/AkP/OdcL0/50EwiG
 KPk4FrYjUdGNxoTI5iBi10kkGlLx+VU0mB9v83wxvkfDMoJSuPnSr8FcVOXbU5m4X9lMgFlBm/
 BY6V947wrXtZ4BU17JB8g3Lfh0f20/n+KKWI4GrNfSo7hgKn8cPiYtW/UjeNXxyBLqHQ7OdkIB
 y9o=
From: "Awais Belal" <Awais_Belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] perl: allow empty lines and comments in perl-rdepends.txt
Date: Tue, 30 Mar 2021 12:29:21 +0500
Message-ID: <20210330072922.29389-1-awais_belal@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: awais_belal@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Content-Type: text/plain

With this change the rdepends file can now have empty lines
and comment lines. The perl-rdepends.txt generation will be
fixed with further commits to leverage this change.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-devtools/perl/perl_5.32.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.32.1.bb b/meta/recipes-devtools/perl/perl_5.32.1.bb
index 1fafc0a8c9..65db6da2b5 100644
--- a/meta/recipes-devtools/perl/perl_5.32.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.32.1.bb
@@ -320,6 +320,9 @@ python split_perl_packages () {
     # Read the pre-generated dependency file, and use it to set module dependecies
     for line in open(d.expand("${WORKDIR}") + '/perl-rdepends.txt').readlines():
         splitline = line.split()
+        # Filter empty lines and comments
+        if len(splitline) == 0 or splitline[0].startswith("#"):
+            continue
         if bb.data.inherits_class('native', d):
             module = splitline[0] + '-native'
             depends = "perl-native"
-- 
2.17.1

