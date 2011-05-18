Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMnw5-0001ny-9k
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 23:05:41 +0200
Received: by pwj9 with SMTP id 9so971034pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=I5KfTqyptiPU2idbpu8wgIG4R4+iXXsXvZWr3Qu1Zak=;
	b=b2HWMl0rwx3WVdXbEiSn3xQ8FQZKUeWQ+mYR2Nt8KkaNvh+OQCaANiFYfweypIVp0u
	UcNax3X1yLxcVLGtQbyA74UtFtvnknuLvkxe1dtLkACWoaRKeNOxfNl723uLHkcwyXDg
	uSKlcNKlKWtMNUUyAEwEfBwXYuQNzcxPCbeBY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=uEjCXd9xj1zgXOKj4f2X63xXju2RemE/LWeQq00ESAzbS/1jEt4kKwCYxr7dTui4fT
	HLUvPGjWdS0yqt8aUuM1AqgvKDlVVzcU6rz0guaA6WG2nRluvB4chxjd8CMgzs5i4klo
	XQo0F1xe6cXCjI8hEk4fZsFwFaV56UQd3Ccfs=
Received: by 10.142.11.9 with SMTP id 9mr1296482wfk.243.1305752564736;
	Wed, 18 May 2011 14:02:44 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id k6sm1690201wfa.5.2011.05.18.14.02.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 14:02:44 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 14:02:31 -0700
Message-Id: <674b9a84873e66a42dd7e791b84b2afb1f5b033a.1305752502.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305752502.git.chris_larson@mentor.com>
References: <cover.1305752502.git.chris_larson@mentor.com>
In-Reply-To: <cover.1305752502.git.chris_larson@mentor.com>
References: <cover.1305752502.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 3/5] base.bbclass: switch to current OE's imports handling
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
X-List-Received-Date: Wed, 18 May 2011 21:05:41 -0000

From: Chris Larson <chris_larson@mentor.com>

The current mechanism makes it easier for classes to add new oe modules to be
automatically imported, and thereby made available to python snippets (${@}).

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/base.bbclass |   22 +++++++++-------------
 1 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b552de2..51f5a14 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -10,32 +10,28 @@ inherit metadata_scm
 inherit buildstats
 inherit logging
 
-python sys_path_eh () {
+OE_IMPORTS += "os sys time oe.path oe.utils oe.data"
+
+python oe_import () {
     if isinstance(e, bb.event.ConfigParsed):
-        import sys
-        import os
-        import time
+        import os, sys
 
         bbpath = e.data.getVar("BBPATH", True).split(":")
         sys.path[0:0] = [os.path.join(dir, "lib") for dir in bbpath]
 
         def inject(name, value):
-            """Make a python object accessible from everywhere for the metadata"""
+            """Make a python object accessible from the metadata"""
             if hasattr(bb.utils, "_context"):
                 bb.utils._context[name] = value
             else:
                 __builtins__[name] = value
 
-        import oe.path
-        import oe.utils
-        import oe.data
-        inject("bb", bb)
-        inject("sys", sys)
-        inject("time", time)
-        inject("oe", oe)
+        for toimport in e.data.getVar("OE_IMPORTS", True).split():
+            imported = __import__(toimport)
+            inject(toimport.split(".", 1)[0], imported)
 }
 
-addhandler sys_path_eh
+addhandler oe_import
 
 die() {
 	bbfatal "$*"
-- 
1.7.1



