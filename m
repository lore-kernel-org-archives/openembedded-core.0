Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DE6096FFCC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 03:14:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2016 20:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,464,1459839600"; d="scan'208";a="718037673"
Received: from ctan5-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.32])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2016 20:14:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 15:14:00 +1200
Message-Id: <12130280e41c6d75566f36c4d7c34a3c182fc61f.1465787274.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1465787274.git.paul.eggleton@linux.intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1465787274.git.paul.eggleton@linux.intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 9/9] toolchain-shar-extract.sh: allow TERM through into SDK installer env
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
X-List-Received-Date: Mon, 13 Jun 2016 03:14:53 -0000

In order to show the task progress during the extensible SDK
installation, knotty needs to know it is using a terminal it can
support the "interactive" mode on (i.e. ncurses can be used), which
means it needs access to the TERM variable value, so allow that
through into the cleaned environment within the SDK installation
script.

Part of the implementation for [YOCTO #9613].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/files/toolchain-shar-extract.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index d1ce86d..9279310 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -2,6 +2,7 @@
 
 [ -z "$ENVCLEANED" ] && exec /usr/bin/env -i ENVCLEANED=1 HOME="$HOME" \
 	LC_ALL=en_US.UTF-8 \
+	TERM=$TERM \
 	http_proxy="$http_proxy" https_proxy="$https_proxy" ftp_proxy="$ftp_proxy" \
 	no_proxy="$no_proxy" all_proxy="$all_proxy" GIT_PROXY_COMMAND="$GIT_PROXY_COMMAND" "$0" "$@"
 [ -f /etc/environment ] && . /etc/environment
-- 
2.5.5


