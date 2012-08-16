Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1T23T3-0006Uu-4Z
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 19:02:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7GGolJm018629
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 09:50:47 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 16 Aug 2012 09:50:46 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2012 11:50:45 -0500
Message-ID: <71f45133289f617d85d0c9072ea3b4d584f5de67.1345135594.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1345135594.git.peter.seebach@windriver.com>
References: <cover.1345135594.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] base.bbclass: Work even when there's no PNBLACKLIST entries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 17:02:45 -0000
Content-Type: text/plain

It turns out that the result of getVarFlags is not a list, it's
a dict. So "getVarFlags(...) or []" does not reliably produce
something with a .items. This escaped detection because our
local build environment never ends up running builds without
PNBLACKLIST entries.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 840ddbc..acc3217 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -175,7 +175,7 @@ def preferred_ml_updates(d):
 
     versions = []
     providers = []
-    blacklists = d.getVarFlags('PNBLACKLIST') or []
+    blacklists = d.getVarFlags('PNBLACKLIST') or {}
     for v in d.keys():
         if v.startswith("PREFERRED_VERSION_"):
             versions.append(v)
-- 
1.7.0.4



