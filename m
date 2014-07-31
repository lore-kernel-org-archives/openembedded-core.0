Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0181.outbound.protection.outlook.com [207.46.163.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6CCD86084E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 10:18:08 +0000 (UTC)
Received: from CH1PR03CA003.namprd03.prod.outlook.com (10.255.156.148) by
	BLUPR03MB151.namprd03.prod.outlook.com (10.255.212.25) with Microsoft
	SMTP Server (TLS) id 15.0.995.14; Thu, 31 Jul 2014 10:18:08 +0000
Received: from BN1BFFO11FD034.protection.gbl (10.255.156.132) by
	CH1PR03CA003.outlook.office365.com (10.255.156.148) with Microsoft SMTP
	Server (TLS) id 15.0.995.14 via Frontend Transport;
	Thu, 31 Jul 2014 10:18:07 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD034.mail.protection.outlook.com (10.58.144.97) with
	Microsoft SMTP Server (TLS) id 15.0.990.10 via Frontend Transport;
	Thu, 31 Jul 2014 10:18:07 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s6VAI43w014750; Thu, 31 Jul 2014 03:18:05 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Jul 2014 18:21:01 +0800
Message-ID: <1406802061-11405-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(979002)(6009001)(199002)(189002)(81342001)(86152002)(97736001)(74502001)(83072002)(20776003)(77982001)(6806004)(86362001)(83322001)(76482001)(64706001)(46102001)(50466002)(19580405001)(93916002)(19580395003)(44976005)(80022001)(47776003)(81542001)(74662001)(4396001)(89996001)(31966008)(62966002)(92726001)(104166001)(92566001)(77156001)(21056001)(68736004)(84676001)(102836001)(107046002)(88136002)(106466001)(85306003)(33646002)(110136001)(48376002)(26826002)(99396002)(85852003)(79102001)(50226001)(87286001)(36756003)(87936001)(2351001)(229853001)(95666004)(50986999)(104016003)(105606002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:; SCL:1; SRVR:BLUPR03MB151;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0289B6431E
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH v3] base-files: set dynamic COLUMNS via resize command
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
X-List-Received-Date: Thu, 31 Jul 2014 10:18:09 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

By default, COLUMNS is set to 80. If possible, run 'resize' to
determine what the current dimensions are. This avoids the final
part of long lines overlap the start of the same line.

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
changes in v2:
* dynamically check for ${bindir} instead of hard code /usr/bin
changes in v3:
* use consistent indentation 

 meta/recipes-core/base-files/base-files/profile   |    4 ++++
 meta/recipes-core/base-files/base-files_3.0.14.bb |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index 0b2d9d7..88ab8d8 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -26,6 +26,10 @@ if [ -d /etc/profile.d ]; then
   unset i
 fi
 
+if [ -x /usr/bin/resize ];then
+  /usr/bin/resize >/dev/null
+fi
+
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
 
 umask 022
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 30b1bf4..07f5c54 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -102,6 +102,10 @@ do_install () {
 	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
 	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
 
+	if [ "/usr/bin" != "${bindir}" ]; then
+		sed -i "s,/usr/bin/resize,${bindir}/resize," ${D}${sysconfdir}/profile
+	fi
+
 	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
 }
 
-- 
1.7.3.4


