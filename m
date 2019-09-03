Return-Path: <henning.schild@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 701477F323
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 13:43:52 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x83Dhq65021726
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2019 15:43:52 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.169])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x83DhpL7008645;
	Tue, 3 Sep 2019 15:43:52 +0200
From: Henning Schild <henning.schild@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 15:43:50 +0200
Message-Id: <20190903134350.21512-7-henning.schild@siemens.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903134350.21512-1-henning.schild@siemens.com>
References: <20190903134350.21512-1-henning.schild@siemens.com>
MIME-Version: 1.0
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Henning Schild <henning.schild@siemens.com>
Subject: [PATCHv2 6/6] oe-git-proxy: fix dash "Bad substitution"
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
X-List-Received-Date: Tue, 03 Sep 2019 13:43:53 -0000
Content-Transfer-Encoding: 8bit

From: Henning Schild <henning.schild@siemens.com>

The script claims it works with dash, make sure that is actually the
case.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 scripts/oe-git-proxy | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index 2cb995f43c..aa9b9dc9a9 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -64,7 +64,7 @@ ipv4_val() {
 	IP="$1"
 	SHIFT=24
 	VAL=0
-	for B in ${IP//./ }; do
+	for B in $( echo "$IP" | tr '.' ' ' ); do
 		VAL=$(($VAL+$(($B<<$SHIFT))))
 		SHIFT=$(($SHIFT-8))
 	done
@@ -137,7 +137,7 @@ if [ -z "$ALL_PROXY" ]; then
 fi
 
 # Connect directly to hosts in NO_PROXY
-for H in ${NO_PROXY//,/ }; do
+for H in $( echo "$NO_PROXY" | tr ',' ' ' ); do
 	if match_host $1 $H; then
 		exec $SOCAT STDIO $METHOD
 	fi
-- 
2.21.0


