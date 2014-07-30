Return-Path: <ting.liu@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0205.outbound.protection.outlook.com [207.46.163.205])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2E465EEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 10:20:57 +0000 (UTC)
Received: from BY2PR03CA066.namprd03.prod.outlook.com (10.141.249.39) by
	BL2PR03MB147.namprd03.prod.outlook.com (10.255.230.19) with Microsoft
	SMTP Server (TLS) id 15.0.995.14; Wed, 30 Jul 2014 10:20:56 +0000
Received: from BY2FFO11FD052.protection.gbl (2a01:111:f400:7c0c::153) by
	BY2PR03CA066.outlook.office365.com (2a01:111:e400:2c5d::39) with
	Microsoft SMTP Server (TLS) id 15.0.995.14 via Frontend Transport;
	Wed, 30 Jul 2014 10:20:56 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD052.mail.protection.outlook.com (10.1.15.189) with Microsoft
	SMTP Server (TLS) id 15.0.990.10 via Frontend Transport;
	Wed, 30 Jul 2014 10:20:55 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s6UAKqA0006920; Wed, 30 Jul 2014 03:20:53 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jul 2014 18:23:41 +0800
Message-ID: <1406715821-2892-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(4396001)(95666004)(104166001)(77982001)(86362001)(26826002)(102836001)(105606002)(74662001)(31966008)(79102001)(44976005)(36756003)(68736004)(81342001)(106466001)(110136001)(77156001)(87286001)(80022001)(74502001)(47776003)(97736001)(46102001)(20776003)(33646002)(84676001)(99396002)(50466002)(89996001)(50226001)(104016003)(87936001)(19580405001)(83072002)(64706001)(85852003)(92726001)(2351001)(88136002)(93916002)(19580395003)(81542001)(85306003)(83322001)(62966002)(76482001)(21056001)(229853001)(92566001)(48376002)(107046002)(50986999)(86152002)(6806004);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB147;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0288CD37D9
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH v2] base-files: set dynamic COLUMNS via resize command
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
X-List-Received-Date: Wed, 30 Jul 2014 10:21:02 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

By default, COLUMNS is set to 80. If possible, run 'resize' to
determine what the current dimensions are. This avoids the final
part of long lines overlap the start of the same line.

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
changes in v2:
* dynamically check for ${bindir} instead of hard code /usr/bin

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
index 30b1bf4..e6109dd 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -102,6 +102,10 @@ do_install () {
 	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
 	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
 
+    if [ "/usr/bin" != "${bindir}" ]; then
+        sed -i "s,/usr/bin/resize,${bindir}/resize," ${D}${sysconfdir}/profile
+    fi
+
 	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
 }
 
-- 
1.7.3.4


