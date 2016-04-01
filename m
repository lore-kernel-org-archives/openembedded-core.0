Return-Path: <raphael.freudiger@siemens.com>
X-Greylist: delayed 1772 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Apr 2016 13:24:13 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id F226873695
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 13:24:12 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u31CsfJe025723
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Apr 2016 14:54:41 +0200
Received: from bt-builds.hqs.sbt.siemens.com (MD1AT2FC.ww002.siemens.net
	[139.16.79.16])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id u31CsfKQ008741;
	Fri, 1 Apr 2016 14:54:41 +0200
Received: from bt-builds.hqs.sbt.siemens.com (localhost [127.0.0.1])
	by bt-builds.hqs.sbt.siemens.com (Postfix) with ESMTP id 4B6C1200A508; 
	Fri,  1 Apr 2016 14:54:41 +0200 (CEST)
From: Freudiger Raphael <raphael.freudiger@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Apr 2016 14:54:20 +0200
Message-Id: <1459515260-11787-1-git-send-email-raphael.freudiger@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Freudiger Raphael <raphael.freudiger@siemens.com>
Subject: [PATCH] debugfs: Fix recursion loop
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
X-List-Received-Date: Fri, 01 Apr 2016 13:24:14 -0000

The debugfs prefix is striped from t, but not from baset.
Therefore baset never matches t.

Signed-off-by: Freudiger Raphael <raphael.freudiger@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/classes/image.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c61d814..adbbe35 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -320,6 +320,7 @@ python () {
 
     def _add_type(t):
         baset = _image_base_type(t)
+        input_t = t
         if baset not in basetypes:
             basetypes[baset]= []
         if t not in basetypes[baset]:
@@ -340,9 +341,9 @@ python () {
             basedep = _image_base_type(dep)
             typedeps[baset].add(basedep)
 
-        if baset != t:
+        if baset != input_t:
             _add_type(baset)
-        
+
     for t in alltypes[:]:
         _add_type(t)
 
-- 
2.1.4


