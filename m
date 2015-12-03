Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 11A17700F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 23:18:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 03 Dec 2015 15:18:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,378,1444719600"; d="scan'208";a="833872075"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 03 Dec 2015 15:18:27 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 15:09:56 -0800
Message-Id: <1449184196-21113-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449184196-21113-1-git-send-email-juro.bystricky@intel.com>
References: <1449184196-21113-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 2/2] oe-buildenv-internal: preserve existing BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Thu, 03 Dec 2015 23:18:28 -0000

According to the BitBake User Manual the environment variable BB_ENV_EXTRAWHITE
specifies an additional set of variables to allow through (whitelist) from the
external environment into BitBake's datastore. However, running:

  $ source oe-init-build-env build-name

will overwrite any pre-existing BB_ENV_EXTRAWHITE variables.
This patch modifies this behaviour: all oe-build-internal BB_ENV_EXTRAWHITE
variables are appended to any potentially already existing BB_ENV_EXTRAWHITE
variables. (The variables are only appended if not already in BB_ENV_EXTRAWHITE)

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 scripts/oe-buildenv-internal | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 9ed2721..51e449a 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -102,8 +102,12 @@ unset BITBAKEDIR NEWPATHS
 # Used by the runqemu script
 export BUILDDIR
 export PATH
-export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
+
+BB_ENV_EXTRAWHITE_OE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
 HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
 all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
 SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
 SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR"
+
+echo "$BB_ENV_EXTRAWHITE" | grep -q "${BB_ENV_EXTRAWHITE_OE}"
+[ $? != 0 ] && export BB_ENV_EXTRAWHITE="${BB_ENV_EXTRAWHITE_OE} $BB_ENV_EXTRAWHITE"
-- 
1.9.1


