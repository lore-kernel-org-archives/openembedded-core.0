Received: from mail-va3.bigfish.com ([216.32.180.10]
	helo=VA3EHSOBE010.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RRAfL-0000vT-DL
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 23:42:43 +0100
Received: from mail63-va3-R.bigfish.com (10.7.14.248) by
	VA3EHSOBE010.bigfish.com (10.7.40.12) with Microsoft SMTP Server id
	14.1.225.22; Thu, 17 Nov 2011 22:35:44 +0000
Received: from mail63-va3 (localhost [127.0.0.1])	by mail63-va3-R.bigfish.com
	(Postfix) with ESMTP id 9A2C316049B	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 22:40:46 +0000 (UTC)
X-SpamScore: -2
X-BigFish: VS-2(zz444fMzz1202h1082kzz8275bhz2dh2a8h668h839h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail63-va3 (localhost.localdomain [127.0.0.1]) by mail63-va3
	(MessageSwitch) id 1321569646360454_1136;
	Thu, 17 Nov 2011 22:40:46 +0000 (UTC)
Received: from VA3EHSMHS008.bigfish.com (unknown [10.7.14.241])	by
	mail63-va3.bigfish.com (Postfix) with ESMTP id 4DF1980043	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 22:40:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS008.bigfish.com
	(10.7.99.18) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 17 Nov 2011 22:35:41 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.339.2; Thu, 17 Nov 2011 16:36:07 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	pAHMa6XD026950	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 16:36:06 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2011 16:36:06 -0600
Message-ID: <1321569366-20167-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] Nothing uses USERNAME, remove it - can cause sstate-cache conflicts
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
X-List-Received-Date: Thu, 17 Nov 2011 22:42:43 -0000
Content-Type: text/plain

USER is the correct variable to use, also this can affect sstate
cache as well.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
I'm not 100% sure about this one but it seems like nothing is using this
variable?

Also one of my build machines (Jenkins specifically) was exporting
USERNAME=root for some reason to the build environment. This was preventing
sstate-cache from being used on other machines where it was not even
defined/used AFAICT

 bitbake/lib/bb/utils.py |    1 -
 meta/conf/bitbake.conf  |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
index 1f55407..bb3409d 100644
--- a/bitbake/lib/bb/utils.py
+++ b/bitbake/lib/bb/utils.py
@@ -505,7 +505,6 @@ def preserved_envvars_exported():
         'SHELL',
         'TERM',
         'USER',
-        'USERNAME',
     ]
 
 def preserved_envvars_exported_interactive():
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b7bcc23..b4335c9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -751,7 +751,7 @@ TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "basic"
 BB_HASHTASK_WHITELIST ?= "(.*-cross$|.*-native$|.*-cross-initial$|.*-cross-intermediate$|^virtual:native:.*|^virtual:nativesdk:.*)"
-BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH USERNAME STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE"
+BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE"
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
-- 
1.7.6.1




