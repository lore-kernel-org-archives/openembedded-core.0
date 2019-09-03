Return-Path: <henning.schild@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 61A717F35C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 12:22:34 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x83CMZFv003125
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2019 14:22:35 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x83CMYKY002171;
	Tue, 3 Sep 2019 14:22:35 +0200
From: Henning Schild <henning.schild@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 14:22:22 +0200
Message-Id: <20190903122224.18634-4-henning.schild@siemens.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903122224.18634-1-henning.schild@siemens.com>
References: <20190903122224.18634-1-henning.schild@siemens.com>
MIME-Version: 1.0
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Henning Schild <henning.schild@siemens.com>
Subject: [PATCH 4/6] oe-git-proxy: disable shell pathname expansion for the whole script
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
X-List-Received-Date: Tue, 03 Sep 2019 12:22:35 -0000
Content-Transfer-Encoding: 8bit

From: Henning Schild <henning.schild@siemens.com>

This truly fixes the issue that cbc148d5d93d5f3531434fee7b234a16196b3088
wanted to solve, without breaking the iteration over multiple entries.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 scripts/oe-git-proxy | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index 10e6560da4..2f65f0c482 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -133,6 +133,9 @@ if [ -z "$ALL_PROXY" ]; then
 	exec $SOCAT STDIO $METHOD
 fi
 
+# disable pathname expansion, NO_PROXY fielnd could start with "*" or be it
+set -f
+
 # Connect directly to hosts in NO_PROXY
 for H in ${NO_PROXY//,/ }; do
 	if match_host $1 $H; then
-- 
2.21.0


