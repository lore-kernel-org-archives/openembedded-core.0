Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CB6A66FFD3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 03:12:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Dec 2015 19:12:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,411,1444719600"; d="scan'208";a="838942720"
Received: from exxie-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.172.26])
	by orsmga001.jf.intel.com with ESMTP; 10 Dec 2015 19:12:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Dec 2015 16:11:48 +1300
Message-Id: <ad7389ae6f6a79ce04934369656e8bb214e7ab3b.1449803403.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1449803403.git.paul.eggleton@linux.intel.com>
References: <cover.1449803403.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1449803403.git.paul.eggleton@linux.intel.com>
References: <cover.1449803403.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] toolchain-shar-extract.sh: fix ~ not working in path
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
X-List-Received-Date: Fri, 11 Dec 2015 03:12:11 -0000

Fix a second regression in the extensible SDK installation caused by
OE-Core revision 6d2074d477596971dc52027dd87b02af7f39138d - the HOME
environment variable was being cleared, thus using ~/ in the install
path (which is in the default path for the extensible SDK) resulted in a
directory named '~' being created in the current directory.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/files/toolchain-shar-extract.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 606a44e..de8c669 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-[ -z "$ENVCLEANED" ] && exec /usr/bin/env -i ENVCLEANED=1 "$0" "$@"
+[ -z "$ENVCLEANED" ] && exec /usr/bin/env -i ENVCLEANED=1 HOME="$HOME" "$0" "$@"
 [ -f /etc/environment ] && . /etc/environment
 export PATH=`echo "$PATH" | sed -e 's/:\.//' -e 's/::/:/'`
 
-- 
2.5.0


