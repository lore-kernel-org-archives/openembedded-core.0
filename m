Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RKun7-00080N-LF
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 17:32:53 +0100
Received: from mail118-ch1-R.bigfish.com (10.43.68.249) by
	CH1EHSOBE016.bigfish.com (10.43.70.66) with Microsoft SMTP Server id
	14.1.225.22; Mon, 31 Oct 2011 16:26:36 +0000
Received: from mail118-ch1 (localhost.localdomain [127.0.0.1])	by
	mail118-ch1-R.bigfish.com (Postfix) with ESMTP id 877192E0973	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 16:26:42 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail118-ch1 (localhost.localdomain [127.0.0.1]) by mail118-ch1
	(MessageSwitch) id 1320078401329790_30249;
	Mon, 31 Oct 2011 16:26:41 +0000 (UTC)
Received: from CH1EHSMHS014.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.251])	by mail118-ch1.bigfish.com (Postfix) with ESMTP id
	473881920046	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 16:26:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS014.bigfish.com
	(10.43.70.14) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 31 Oct 2011 16:26:47 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.339.2; Mon, 31 Oct 2011 11:26:44 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p9VGQhoH017966	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 11:26:43 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Oct 2011 11:26:43 -0500
Message-ID: <1320078403-23724-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <201110310905.49436.paul.eggleton@linux.intel.com>
References: <201110310905.49436.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v3 1/2] Add new strace-graph package to avoid making perl a dependecy for all of strace
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
X-List-Received-Date: Mon, 31 Oct 2011 16:32:53 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: Change to use PACKAGES_prepend instead of explictly listing all packages
and also fixing the fact we missed the -dev and -dbg packages before

v3: Use += instead of _prepend to add strace-graph packages

 meta/recipes-devtools/strace/strace_4.5.20.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_4.5.20.bb b/meta/recipes-devtools/strace/strace_4.5.20.bb
index b3d2aa5..53df067 100644
--- a/meta/recipes-devtools/strace/strace_4.5.20.bb
+++ b/meta/recipes-devtools/strace/strace_4.5.20.bb
@@ -5,7 +5,9 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4535377ede62550fdeaf39f595fd550a"
 PR = "r2"
 
-RDEPENDS = "perl"
+PACKAGES =+ "${PN}-graph "
+FILES_${PN}-graph = "${bindir}/strace-graph"
+RDEPENDS_${PN}-graph = "perl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
            file://sigmask.patch \
-- 
1.7.6.1




