Return-Path: <henning.schild@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 188DD7F31B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 13:43:52 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x83DhqYP025373
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2019 15:43:52 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.169])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x83DhpL6008645;
	Tue, 3 Sep 2019 15:43:52 +0200
From: Henning Schild <henning.schild@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 15:43:49 +0200
Message-Id: <20190903134350.21512-6-henning.schild@siemens.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903134350.21512-1-henning.schild@siemens.com>
References: <20190903134350.21512-1-henning.schild@siemens.com>
MIME-Version: 1.0
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Henning Schild <henning.schild@siemens.com>
Subject: [PATCHv2 5/6] oe-git-proxy: NO_PROXY suffix matching without wildcard for match_host
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

NO_PROXY can also contain just suffixes that do not start with a "*". We
failed to match those so far. Just add an extra "*" to also match those
suffixes. If one was there we get "**" which does not hurt.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 scripts/oe-git-proxy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index 9eeef45dcf..2cb995f43c 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -107,7 +107,7 @@ match_host() {
 	HOST=$1
 	GLOB=$2
 
-	if [ -z "${HOST%%$GLOB}" ]; then
+	if [ -z "${HOST%%*$GLOB}" ]; then
 		return 0
 	fi
 
-- 
2.21.0


