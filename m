Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrYDO-0002k7-H9
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 18:34:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2011 09:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,357,1309762800"; d="scan'208";a="38285542"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2011 09:30:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 09:29:52 -0700
Message-Id: <8d587d3f053f724ca87969096f74e1647b45581f.1313079549.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313079549.git.sgw@linux.intel.com>
References: <cover.1313079549.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313079549.git.sgw@linux.intel.com>
References: <cover.1313079549.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/10] scripts/combo-layer: a simple way to script the combo-layer conf
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
X-List-Received-Date: Thu, 11 Aug 2011 16:34:38 -0000

From: Leandro Dorileo <ldorileo@gmail.com>

This small patch introduces a a very simple and basic way to script
the combo-layer conf file. With that a combo can be shared with no
need to change its config - associated to the use of environment
variables for example.

*Similar* to bitbake it considers every value starting with @ to be
a python script. So local_repo could be easily configured as:

[bitbake]
local_repo = @os.getenv("LOCAL_REPO_DIR") + "/bitbake"

or any more sophisticated python syntax.

This version updates the config file description so users can be
aware of.

Signed-off-by: Leandro Dorileo <ldorileo@gmail.com>
---
 scripts/combo-layer |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index d129175..07b3382 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -79,6 +79,14 @@ local_repo_dir = ~/src/oecore
 dest_dir = .
 last_revision =
 
+# it's also possible to embed python code in the config values. Similar
+# to bitbake it considers every value starting with @ to be a python script. 
+# So local_repo could be easily configured using an environment variable as:
+#
+# [bitbake]
+# local_repo = @os.getenv("LOCAL_REPO_DIR") + "/bitbake"
+#
+
 # more components ...
 
     """
@@ -91,7 +99,10 @@ last_revision =
         for repo in self.parser.sections():
             self.repos[repo] = {}
             for (name, value) in self.parser.items(repo):
-                self.repos[repo][name] = value
+                if value.startswith("@"):
+                    self.repos[repo][name] = eval(value.strip("@"))
+                else:
+                    self.repos[repo][name] = value
 
     def update(self, repo, option, value):
         self.parser.set(repo, option, value)
-- 
1.7.3.4



