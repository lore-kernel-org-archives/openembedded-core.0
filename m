Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=DB3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RJVlT-0001iW-61
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 21:37:23 +0200
Received: from mail32-db3-R.bigfish.com (10.3.81.253) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.22; Thu, 27 Oct 2011 19:31:14 +0000
Received: from mail32-db3 (localhost.localdomain [127.0.0.1])	by
	mail32-db3-R.bigfish.com (Postfix) with ESMTP id DF9831E8466	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 19:31:18 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail32-db3 (localhost.localdomain [127.0.0.1]) by mail32-db3
	(MessageSwitch) id 1319743878771272_6745;
	Thu, 27 Oct 2011 19:31:18 +0000 (UTC)
Received: from DB3EHSMHS005.bigfish.com (unknown [10.3.81.241])	by
	mail32-db3.bigfish.com (Postfix) with ESMTP id B58E99F004C	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 19:31:18 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS005.bigfish.com
	(10.3.87.105) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 27 Oct 2011 19:31:09 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.339.2; Thu, 27 Oct 2011 14:31:15 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p9RJVEka021357	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 14:31:15 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Oct 2011 14:31:14 -0500
Message-ID: <1319743874-9891-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1319700362.15601.2.camel@ted>
References: <1319700362.15601.2.camel@ted>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 1/2] Add new strace-graph package to avoid making perl a dependecy for all of strace
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
X-List-Received-Date: Thu, 27 Oct 2011 19:37:23 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: Change to use PACKAGES_prepend instead of explictly listing all packages
and also fixing the fact we missed the -dev and -dbg packages before

 meta/recipes-devtools/strace/strace_4.5.20.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_4.5.20.bb b/meta/recipes-devtools/strace/strace_4.5.20.bb
index b3d2aa5..450abea 100644
--- a/meta/recipes-devtools/strace/strace_4.5.20.bb
+++ b/meta/recipes-devtools/strace/strace_4.5.20.bb
@@ -5,7 +5,9 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4535377ede62550fdeaf39f595fd550a"
 PR = "r2"
 
-RDEPENDS = "perl"
+PACKAGES_prepend = "${PN}-graph "
+FILES_${PN}-graph = "${bindir}/strace-graph"
+RDEPENDS_${PN}-graph = "perl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
            file://sigmask.patch \
-- 
1.7.6.1




