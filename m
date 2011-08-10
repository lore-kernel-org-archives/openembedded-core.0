Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ldorileo@gmail.com>) id 1Qr1Eh-0003BX-G2
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 07:21:47 +0200
Received: by gwb11 with SMTP id 11so476275gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 22:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=9TQaFd4rX8mxW9GkVnOb5KR6QECT14+iApgF+k77pkI=;
	b=s8cLy9Y3MxFx8Pyy9RLETOiROR9VVYyr1rn4U6SHJaSOAeUXGQHXh9quirW58lXmxg
	okXkQ7PQXa08DkWF0oFrRhb0Tx/w9v5WdQbuo7ojDtms+IQotbinK1hz9TcdTXnpQddv
	7sK7i4NA9T91PSN8ljiidOsTVE6jnJGisMC00=
Received: by 10.236.73.168 with SMTP id v28mr5685832yhd.14.1312953437080;
	Tue, 09 Aug 2011 22:17:17 -0700 (PDT)
Received: from localhost.localdomain ([186.213.225.124])
	by mx.google.com with ESMTPS id q25sm738704yhm.76.2011.08.09.22.17.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Aug 2011 22:17:16 -0700 (PDT)
From: Leandro Dorileo <ldorileo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2011 01:09:05 -0400
Message-Id: <1312952945-3415-1-git-send-email-ldorileo@gmail.com>
X-Mailer: git-send-email 1.7.4.4
Cc: Leandro Dorileo <ldorileo@gmail.com>
Subject: [PATCH v2] scripts/combo-layer: a simple way to script the combo-layer conf
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
X-List-Received-Date: Wed, 10 Aug 2011 05:21:47 -0000

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
1.7.4.4



