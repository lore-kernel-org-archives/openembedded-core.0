Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
	helo=VA3EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVVPd-0006El-9i
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 22:40:25 +0100
Received: from mail66-va3-R.bigfish.com (10.7.14.241) by
	VA3EHSOBE005.bigfish.com (10.7.40.25) with Microsoft SMTP Server id
	14.1.225.22; Tue, 29 Nov 2011 21:32:54 +0000
Received: from mail66-va3 (localhost [127.0.0.1])	by mail66-va3-R.bigfish.com
	(Postfix) with ESMTP id 51E92660291	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 21:32:55 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail66-va3 (localhost.localdomain [127.0.0.1]) by mail66-va3
	(MessageSwitch) id 1322602375203259_5663;
	Tue, 29 Nov 2011 21:32:55 +0000 (UTC)
Received: from VA3EHSMHS016.bigfish.com (unknown [10.7.14.241])	by
	mail66-va3.bigfish.com (Postfix) with ESMTP id 29D233A0049	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 21:32:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS016.bigfish.com
	(10.7.99.26) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 29 Nov 2011 21:32:49 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.339.2; Tue, 29 Nov 2011 15:33:36 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	pATLXaSd018097	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 15:33:36 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 15:33:35 -0600
Message-ID: <1322602415-24735-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] bitbake.conf: Ignore MACHINE as dep for MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 29 Nov 2011 21:40:25 -0000
Content-Type: text/plain

This dependency causes binutils to get rebuilt for some of
our parts that are the same TARGET_ARCH but different
MACHINE.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
Comments on this? It seems like it might be better to some do this
in the actual recipes (binutils, gcc-cross, etc) and not globally.
However, I'm not really sure what goes in MACHINEOVERIDES in
general and if it could be something that would cause sstate-cache
to be invalid althogh I could image some scenarios.

 meta/conf/bitbake.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b4335c9..48ae458 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -659,6 +659,7 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
 OVERRIDES = "${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
 DISTROOVERRIDES ?= "${DISTRO}"
 MACHINEOVERRIDES ?= "${MACHINE}"
+MACHINEOVERRIDES[vardepsexclude] += "MACHINE"
 
 CPU_FEATURES ?= ""
 CPU_FEATURES_arm ?= "vfp"
-- 
1.7.6.1




