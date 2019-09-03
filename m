Return-Path: <henning.schild@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 945D27F367
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 12:22:34 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x83CMZLr003227
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2019 14:22:35 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x83CMYKa002171;
	Tue, 3 Sep 2019 14:22:35 +0200
From: Henning Schild <henning.schild@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 14:22:24 +0200
Message-Id: <20190903122224.18634-6-henning.schild@siemens.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903122224.18634-1-henning.schild@siemens.com>
References: <20190903122224.18634-1-henning.schild@siemens.com>
MIME-Version: 1.0
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Henning Schild <henning.schild@siemens.com>
Subject: [PATCH 6/6] oe-git-proxy: fix dash "Bad substitution"
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
X-List-Received-Date: Tue, 03 Sep 2019 12:22:36 -0000
Content-Transfer-Encoding: 8bit

From: Henning Schild <henning.schild@siemens.com>

The script claims it works with dash, make sure that is actually the
case.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 scripts/oe-git-proxy | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index 8f7b26c15e..2792020467 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -61,7 +61,7 @@ ipv4_val() {
 	IP="$1"
 	SHIFT=24
 	VAL=0
-	for B in ${IP//./ }; do
+	for B in $( echo "$IP" | tr '.' ' ' ); do
 		VAL=$(($VAL+$(($B<<$SHIFT))))
 		SHIFT=$(($SHIFT-8))
 	done
@@ -136,8 +136,9 @@ fi
 # disable pathname expansion, NO_PROXY fielnd could start with "*" or be it
 set -f
 
+
 # Connect directly to hosts in NO_PROXY
-for H in ${NO_PROXY//,/ }; do
+for H in $( echo "$NO_PROXY" | tr ',' ' ' ); do
 	if match_host $1 $H; then
 		exec $SOCAT STDIO $METHOD
 	fi
-- 
2.21.0


