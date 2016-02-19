Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3371476230
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 08:48:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1J8msfu005211
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 00:48:54 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 19 Feb 2016 00:48:54 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Feb 2016 00:48:35 -0800
Message-ID: <dba8350b7001500fcf24ef47bd3a13ee80338878.1455871674.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1455871674.git.liezhi.yang@windriver.com>
References: <cover.1455871674.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] recipe_sanity.bbclass: skip DataSmart in recipe_sanity_eh()
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
X-List-Received-Date: Fri, 19 Feb 2016 08:48:55 -0000
Content-Type: text/plain

Fixed:
$ bitbake quilt -crecipe_sanity
  File "/path/to/poky/bitbake/lib/bb/siggen.py", line 261, in dump_sigtask
    p = pickle.dump(data, stream, -1)
PicklingError: Can't pickle <COWDict Level: 1 Current Keys: 0>:
attribute lookup bb.COW.C failed

This is because of:
cfgdata[k] = d.getVar(k, 0)

If d.getVar(k, 0) is a DataSmart (for example, BB_ORIGENV), it won't
have the attribute of bb.COW.C, so the error happend.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/recipe_sanity.bbclass |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index ee04e33..295611f 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -143,9 +143,8 @@ python recipe_sanity_eh () {
 
     cfgdata = {}
     for k in d.keys():
-    #for k in ["S", "PR", "PV", "PN", "DESCRIPTION", "LICENSE", "DEPENDS",
-    #          "SECTION"]:
-        cfgdata[k] = d.getVar(k, 0)
+        if not isinstance(d.getVar(k, 0), bb.data_smart.DataSmart):
+            cfgdata[k] = d.getVar(k, 0)
 
     d.setVar("__recipe_sanity_cfgdata", cfgdata)
     #d.setVar("__recipe_sanity_cfgdata", d)
-- 
1.7.9.5


