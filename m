Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE008.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBDAJ-0007gh-Eq
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 00:08:43 +0200
Received: from mail51-tx2-R.bigfish.com (10.9.14.248) by
	TX2EHSOBE008.bigfish.com (10.9.40.28) with Microsoft SMTP Server id
	14.1.225.22; Tue, 4 Oct 2011 22:03:11 +0000
Received: from mail51-tx2 (localhost.localdomain [127.0.0.1])	by
	mail51-tx2-R.bigfish.com (Postfix) with ESMTP id C5DF614D8268	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 22:03:10 +0000 (UTC)
X-SpamScore: 6
X-BigFish: VS6(z37d5kzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail51-tx2 (localhost.localdomain [127.0.0.1]) by mail51-tx2
	(MessageSwitch) id 1317765790700509_6223;
	Tue,  4 Oct 2011 22:03:10 +0000 (UTC)
Received: from TX2EHSMHS028.bigfish.com (unknown [10.9.14.251])	by
	mail51-tx2.bigfish.com (Postfix) with ESMTP id A06521198051	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 22:03:10 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS028.bigfish.com
	(10.9.99.128) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 4 Oct 2011 22:03:10 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.323.7; Tue, 4 Oct 2011 17:03:10 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p94M38JI010861	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 17:03:09 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Oct 2011 17:03:05 -0500
Message-ID: <1317765787-19127-4-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317765787-19127-1-git-send-email-msm@freescale.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 4/6] scripts/oe-buildenv-internal: Add SOCKS5_{USER, PASSWD} to BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Tue, 04 Oct 2011 22:08:43 -0000
Content-Type: text/plain

From: Kumar Gala <galak@kernel.crashing.org>

If a SOCKS5 gateway is needed for a proxy access like git it might also
require authentication to the proxy via a password and username.  Adding
SOCKS5_USER & SOCKS5_PASSWD to BB_ENV_EXTRAWHITE allow for automation
of the authentication request to occur when something like a git fetch
is going through the proxy.

This patch requires the bitbake patch to add extra exportvars so
these variables get passed from Env -> bitbake -> fetcher

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
Signed-off-by: Matthew McClintock <msm@freescale.com>
---
This requires a bitbake patch that was just sent:

http://lists.linuxtogo.org/pipermail/bitbake-devel/2011-October/001453.html

 scripts/oe-buildenv-internal |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 61ac18c..21b92b0 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -70,5 +70,4 @@ unset BITBAKEDIR
 # Used by the runqemu script
 export BUILDDIR
 export PATH
-
-export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND"
+export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER"
-- 
1.7.6.1




