Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPFgM-000137-AI
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:12:12 +0200
Received: by obhx4 with SMTP id x4so5080249obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 09:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=QiBQorRdN9xxskhwgm/TVYViU9IKIRVJ/3MyAn7wM2U=;
	b=dO6INX80953mwAM6bB0PoY9PP4ll9DPZc6H134C89k01e5I49jPXMcYFKnTYitnsGC
	nwdn0UImXHXxJr8TDJ8qGvtp6aQ3v16DrASngmyjXN9RG7irEZMk4bxLouDlhj9xx0/O
	SE+rtXiTBKHYSaUnUcScvTr0cQ3WHGo/06rqs0vkEnE5nxQ6v1jwfN0NQQL2QqlBJNlc
	RJdQFR4KncNrw1SkKlbEBJdh6dxf+lxwg45oZ9VyviyF5G1rH18S+eS7qG02iskLmWbB
	O1SmQRlY9Cb+9vmYhuOXSg7PasqbjabDsQRcY0m4YTN31wxaYBiiDPrWt334lfcZayIx
	Tiew==
Received: by 10.182.179.73 with SMTP id de9mr4312741obc.44.1335888140210;
	Tue, 01 May 2012 09:02:20 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id h2sm20758865obn.20.2012.05.01.09.02.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 09:02:19 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 11:02:45 -0500
Message-Id: <8409784e486b7f181231fd46bee5fcdc384de7d3.1335888041.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1335888041.git.kergoth@gmail.com>
References: <cover.1335888041.git.kergoth@gmail.com>
In-Reply-To: <cover.1335888041.git.kergoth@gmail.com>
References: <cover.1335888041.git.kergoth@gmail.com>
Subject: [PATCH 6/6] base.bbclass: use isinstance for base_eventhandler
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
X-List-Received-Date: Tue, 01 May 2012 16:12:12 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/base.bbclass |   16 ++++++----------
 1 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 07ef9a2..bb39b7b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -248,12 +248,13 @@ def buildcfg_neededvars(d):
 
 addhandler base_eventhandler
 python base_eventhandler() {
-	from bb.event import getName
-
-	name = getName(e)
-
-	if name.startswith("BuildStarted"):
+        if isinstance(e, bb.event.ConfigParsed):
 		e.data.setVar('BB_VERSION', bb.__version__)
+                generate_git_config(e)
+                pkgarch_mapping(e.data)
+                preferred_ml_updates(e.data)
+
+	if isinstance(e, bb.event.BuildStarted):
 		statuslines = []
 		for func in oe.data.typed_value('BUILDCFG_FUNCS', e.data):
 			g = globals()
@@ -266,11 +267,6 @@ python base_eventhandler() {
 
 		statusheader = e.data.getVar('BUILDCFG_HEADER', True)
 		bb.plain('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
-
-        if name == "ConfigParsed":
-                generate_git_config(e)
-                pkgarch_mapping(e.data)
-                preferred_ml_updates(e.data)
 }
 
 addtask configure after do_patch
-- 
1.7.7



