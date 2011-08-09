Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ldorileo@gmail.com>) id 1QqsKf-0001Kt-VE
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 21:51:22 +0200
Received: by qwh5 with SMTP id 5so206862qwh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 12:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=UGGnDU5OGTlyFdL5LCLXfBGQdgSSe9TlrEmaasioVgg=;
	b=Pcdl/MLX/tquzolT1ZtwqoFuY+zN+n8a7qL0WbmbBtVE4eA0GCGhM+aO1MV3dQy6VF
	Q3g2SGiUw2vKIZBkjsGE333Ch7QDwcQ9O8uN4/x57unMz0IG0XGJIYTxx37r8FrhQNUQ
	NVnQgXN+TyRk3PmG/ik1AMmRjVmKKU4pStjuQ=
Received: by 10.224.183.15 with SMTP id ce15mr1297026qab.245.1312919212172;
	Tue, 09 Aug 2011 12:46:52 -0700 (PDT)
Received: from localhost.localdomain (vps.dorilex.net [174.143.253.171])
	by mx.google.com with ESMTPS id b6sm182029qcb.35.2011.08.09.12.46.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Aug 2011 12:46:51 -0700 (PDT)
From: Leandro Dorileo <ldorileo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 19:44:25 +0000
Message-Id: <1312919065-7554-1-git-send-email-ldorileo@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Leandro Dorileo <ldorileo@gmail.com>
Subject: [PATCH] scripts/combo-layer: a simple way to script the como-layer conf
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
X-List-Received-Date: Tue, 09 Aug 2011 19:51:22 -0000

This small patch introduces a a very simple and basic way to script
the combo-layer conf file. With that a combo can be shared with no
need to change its config - associated to the use of environment
variables for example.

*Similar* to bitbake it considers every value starting with @ to be
a python script. So local_repo could be easily configured as:

[bitbake]
local_repo = @os.getenv("LOCAL_REPO_DIR") + "/bitbake"

or any more sophisticated python syntax.

Signed-off-by: Leandro Dorileo <ldorileo@gmail.com>
---
 scripts/combo-layer |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index d129175..3dadf4a 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -91,6 +91,9 @@ last_revision =
         for repo in self.parser.sections():
             self.repos[repo] = {}
             for (name, value) in self.parser.items(repo):
+              if value.startswith("@"):
+                self.repos[repo][name] = eval(value.strip("@"))
+              else:
                 self.repos[repo][name] = value
 
     def update(self, repo, option, value):
-- 
1.7.2.5



