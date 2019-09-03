Return-Path: <henning.schild@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4257F31B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 13:43:52 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x83DhqOs011556
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2019 15:43:52 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.169])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x83DhpL2008645;
	Tue, 3 Sep 2019 15:43:52 +0200
From: Henning Schild <henning.schild@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 15:43:45 +0200
Message-Id: <20190903134350.21512-2-henning.schild@siemens.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903134350.21512-1-henning.schild@siemens.com>
References: <20190903134350.21512-1-henning.schild@siemens.com>
MIME-Version: 1.0
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Henning Schild <henning.schild@siemens.com>
Subject: [PATCHv2 1/6] oe-git-proxy: allow setting SOCAT from outside
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

This allows to write selftests where we can mock the real socat.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 scripts/oe-git-proxy | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index bb2ed2a46e..8499a99a71 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -41,10 +41,12 @@ if [ $# -lt 2 -o "$1" = '--help' -o "$1" = '-h' ] ; then
 fi
 
 # Locate the netcat binary
-SOCAT=$(which socat 2>/dev/null)
-if [ $? -ne 0 ]; then
-	echo "ERROR: socat binary not in PATH" 1>&2
-	exit 1
+if [ -z "$SOCAT" ]; then
+	SOCAT=$(which socat 2>/dev/null)
+	if [ $? -ne 0 ]; then
+		echo "ERROR: socat binary not in PATH" 1>&2
+		exit 1
+	fi
 fi
 METHOD=""
 
-- 
2.21.0


