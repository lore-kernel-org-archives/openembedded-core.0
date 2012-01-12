Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
	helo=DB3EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RlTnX-0007vy-1M
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 00:11:07 +0100
Received: from mail83-db3-R.bigfish.com (10.3.81.252) by
	DB3EHSOBE002.bigfish.com (10.3.84.22) with Microsoft SMTP Server id
	14.1.225.23; Thu, 12 Jan 2012 23:03:35 +0000
Received: from mail83-db3 (localhost [127.0.0.1])	by mail83-db3-R.bigfish.com
	(Postfix) with ESMTP id 964A420068B	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 23:03:35 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dhc1ahc1bh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail83-db3 (localhost.localdomain [127.0.0.1]) by mail83-db3
	(MessageSwitch) id 1326409415472272_4530;
	Thu, 12 Jan 2012 23:03:35 +0000 (UTC)
Received: from DB3EHSMHS018.bigfish.com (unknown [10.3.81.247])	by
	mail83-db3.bigfish.com (Postfix) with ESMTP id 6DB4C3C006A	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 23:03:35 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS018.bigfish.com
	(10.3.87.118) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 12 Jan 2012 23:03:35 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Thu, 12 Jan 2012 17:03:33 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	q0CN3WOJ010820	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 17:03:32 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jan 2012 17:03:32 -0600
Message-ID: <1326409412-15507-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1326409412-15507-1-git-send-email-msm@freescale.com>
References: <1326409412-15507-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/2] bitbake/fetch2: add support for wrapper command
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
X-List-Received-Date: Thu, 12 Jan 2012 23:11:07 -0000
Content-Type: text/plain

This is for getting around things like CVS over SOCKS5 with authentication
which does not seem to be supported by configuring CVS or some other means
that I can find.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/bitbake.conf       |    1 +
 scripts/oe-buildenv-internal |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b858364..5bb9430 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -553,6 +553,7 @@ XORG_MIRROR = "http://xorg.freedesktop.org/releases"
 # You can use the mirror of your country to get faster downloads by putting
 #  export DEBIAN_MIRROR = "ftp://ftp.de.debian.org/debian/pool"
 #     into your local.conf
+BB_FETCH_WRAPPER ?= ""
 
 FETCHCMD_svn = "/usr/bin/env svn"
 FETCHCMD_cvs = "/usr/bin/env cvs"
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 21b92b0..72fc458 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -70,4 +70,4 @@ unset BITBAKEDIR
 # Used by the runqemu script
 export BUILDDIR
 export PATH
-export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER"
+export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER BB_FETCH_WRAPPER"
-- 
1.7.6.1




