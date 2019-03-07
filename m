Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 637437CEBF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 13:11:14 +0000 (UTC)
Received: from heron.blarg.de
	(p200300DC6F187E00529A4CFFFE3DD983.dip0.t-ipconnect.de
	[IPv6:2003:dc:6f18:7e00:529a:4cff:fe3d:d983])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id CA6A222022D;
	Thu,  7 Mar 2019 14:04:08 +0100 (CET)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2019 14:04:00 +0100
Message-Id: <20190307130401.15700-2-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307130401.15700-1-max+openembedded@blarg.de>
References: <20190307130401.15700-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 2/3] useradd-staticids: print exception after parse_args() error
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
X-List-Received-Date: Thu, 07 Mar 2019 13:11:14 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Without this, the user has no idea what went wrong.

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 meta/classes/useradd-staticids.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 70d59e5573..3a1b5f1320 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -76,8 +76,8 @@ def update_useradd_static_config(d):
         for param in oe.useradd.split_commands(params):
             try:
                 uaargs = parser.parse_args(oe.useradd.split_args(param))
-            except:
-                bb.fatal("%s: Unable to parse arguments for USERADD_PARAM_%s: '%s'" % (d.getVar('PN'), pkg, param))
+            except Exception as e:
+                bb.fatal("%s: Unable to parse arguments for USERADD_PARAM_%s '%s': %s" % (d.getVar('PN'), pkg, param, e))
 
             # Read all passwd files specified in USERADD_UID_TABLES or files/passwd
             # Use the standard passwd layout:
@@ -197,8 +197,8 @@ def update_useradd_static_config(d):
             try:
                 # If we're processing multiple lines, we could have left over values here...
                 gaargs = parser.parse_args(oe.useradd.split_args(param))
-            except:
-                bb.fatal("%s: Unable to parse arguments for GROUPADD_PARAM_%s: '%s'" % (d.getVar('PN'), pkg, param))
+            except Exception as e:
+                bb.fatal("%s: Unable to parse arguments for GROUPADD_PARAM_%s '%s': %s" % (d.getVar('PN'), pkg, param, e))
 
             # Read all group files specified in USERADD_GID_TABLES or files/group
             # Use the standard group layout:
-- 
2.20.1


