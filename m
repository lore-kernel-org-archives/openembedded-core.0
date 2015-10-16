Return-Path: <kad@kad.name>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0B477168
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 16:18:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2015 08:50:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,689,1437462000"; d="scan'208";a="812689337"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2015 08:49:57 -0700
Received: from akanevsk-mac01.fi.intel.com (akanevsk-mac01.fi.intel.com
	[10.237.66.155])
	by linux.intel.com (Postfix) with ESMTP id B9AD06A4005;
	Fri, 16 Oct 2015 08:48:57 -0700 (PDT)
From: "Alexander D. Kanevskiy" <kad@kad.name>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 18:49:21 +0300
Message-Id: <1445010561-3705-1-git-send-email-kad@kad.name>
X-Mailer: git-send-email 2.6.1
Subject: [PATCH] combo-layer: introduce ability to exclude component from mass update
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
X-List-Received-Date: Fri, 16 Oct 2015 16:18:27 -0000

There is no ability at the moment for situations where users would like
to keep section in combo-layer.conf but don't update it, unless explicitly
specified.

Now, by adding "update = no" to desired section would exclude
that repository from "combo-layer update" command.

It is still possible to explicitly update it by "combo-layer update $section".

By default, all repositories are assumed as "update = yes"

Signed-off-by: Alexander D. Kanevskiy <kad@kad.name>
---
 scripts/combo-layer | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 7435a17..92c5cbb 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -73,7 +73,7 @@ class Configuration(object):
                 else:
                     # Apply special type transformations for some properties.
                     # Type matches the RawConfigParser.get*() methods.
-                    types = {'signoff': 'boolean'}
+                    types = {'signoff': 'boolean', 'update': 'boolean'}
                     if name in types:
                         value = getattr(parser, 'get' + types[name])(section, name)
                     self.repos[repo][name] = value
@@ -567,7 +567,7 @@ def get_repos(conf, repo_names):
             sys.exit(1)
 
     if not repos:
-        repos = conf.repos
+        repos = [ repo for repo in conf.repos if conf.repos[repo].get("update", True) ]
 
     return repos
 
-- 
2.6.1


