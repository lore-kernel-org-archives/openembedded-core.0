Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1STlAD-0006YX-OQ
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 04:37:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4E2RYgp027126
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2012 19:27:34 -0700 (PDT)
Received: from ord-lpggp2.wrs.com (172.25.32.36) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 13 May 2012 19:27:33 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 May 2012 21:28:21 -0500
Message-ID: <1336962502-7271-2-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1336962502-7271-1-git-send-email-jason.wessel@windriver.com>
References: <1336962502-7271-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] bitbake/lib/bb/data.py: Allow an exported variable to be excluded from dependency processing
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
X-List-Received-Date: Mon, 14 May 2012 02:37:34 -0000
Content-Type: text/plain

This change is intended to allow an exported variable to not impact
the sstate sum in oe-core.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 lib/bb/data.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/lib/bb/data.py b/lib/bb/data.py
index c0636e1..a68ab43 100644
--- a/lib/bb/data.py
+++ b/lib/bb/data.py
@@ -313,7 +313,7 @@ def build_dependencies(key, keys, shelldeps, vardepvals, d):
 def generate_dependencies(d):
 
     keys = set(key for key in d.keys() if not key.startswith("__"))
-    shelldeps = set(key for key in keys if d.getVarFlag(key, "export") and not d.getVarFlag(key, "unexport"))
+    shelldeps = set(key for key in keys if d.getVarFlag(key, "export") and not d.getVarFlag(key, "unexport") and not d.getVarFlag(key, "undep"))
     vardepvals = set(key for key in keys if d.getVarFlag(key, "vardepvalue"))
 
     deps = {}
-- 
1.7.1



