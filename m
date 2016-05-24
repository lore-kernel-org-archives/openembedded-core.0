Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B991762137
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 02:40:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2016 19:40:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,358,1459839600"; d="scan'208";a="987306375"
Received: from jchang2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.174.130])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2016 19:40:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:40:06 +1200
Message-Id: <8f3a29655613c98c31c41ade3134540a96f074a7.1464057554.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464057554.git.paul.eggleton@linux.intel.com>
References: <cover.1464057554.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464057554.git.paul.eggleton@linux.intel.com>
References: <cover.1464057554.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] oe-init-build-env: allow GIT_SSL_CAINFO from external environment
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
X-List-Received-Date: Tue, 24 May 2016 02:40:37 -0000

buildtools-tarball sets GIT_SSL_CAINFO so that the included
ca-certificates can be used by git; that can't work however unless
the GIT_SSL_CAINFO is still set in the environment in which git gets
run by the fetcher, so allow it through from the external environment.

Fixes [YOCTO #9666].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-buildenv-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 81ee784..3441b49 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -114,7 +114,7 @@ BB_ENV_EXTRAWHITE_OE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
 HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
 all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
 SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
-SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA"
+SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA GIT_SSL_CAINFO"
 
 BB_ENV_EXTRAWHITE="$(echo $BB_ENV_EXTRAWHITE $BB_ENV_EXTRAWHITE_OE | tr ' ' '\n' | LC_ALL=C sort --unique | tr '\n' ' ')"
 
-- 
2.5.5


