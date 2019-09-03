Return-Path: <henning.schild@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 39F517F358
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 12:22:34 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x83CMZwS031696
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2019 14:22:35 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x83CMYKX002171;
	Tue, 3 Sep 2019 14:22:34 +0200
From: Henning Schild <henning.schild@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 14:22:21 +0200
Message-Id: <20190903122224.18634-3-henning.schild@siemens.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903122224.18634-1-henning.schild@siemens.com>
References: <20190903122224.18634-1-henning.schild@siemens.com>
MIME-Version: 1.0
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Henning Schild <henning.schild@siemens.com>
Subject: [PATCH 3/6] Revert "oe-git-proxy: Avoid resolving NO_PROXY against local files"
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

This reverts commit cbc148d5d93d5f3531434fee7b234a16196b3088.

The quoting causes H to be one string with spaces, so looping over
multiple entries does not work anymore.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 scripts/oe-git-proxy | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index 8499a99a71..10e6560da4 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -134,8 +134,8 @@ if [ -z "$ALL_PROXY" ]; then
 fi
 
 # Connect directly to hosts in NO_PROXY
-for H in "${NO_PROXY//,/ }"; do
-	if match_host $1 "$H"; then
+for H in ${NO_PROXY//,/ }; do
+	if match_host $1 $H; then
 		exec $SOCAT STDIO $METHOD
 	fi
 done
-- 
2.21.0


