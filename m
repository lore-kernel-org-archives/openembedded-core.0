Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3CFC17F420
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 10:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 066CC18326
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:38 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 4bfmEgqIS74O
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9CEB518346
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89BC41E081
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E3EC1E07F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by seth.se.axis.com (Postfix) with ESMTP id 729B4E2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 6D58F40AAF; Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2019 12:30:30 +0200
Message-Id: <20191021103034.12200-5-olani@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191021103034.12200-1-olani@axis.com>
References: <20191021103034.12200-1-olani@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 5/9] tinderbox.bbclass: Use with to control file handle lifetime
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
X-List-Received-Date: Mon, 21 Oct 2019 10:30:37 -0000

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes/tinderclient.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/tinderclient.bbclass b/meta/classes/tinderclient.bbclass
index 00f453cec1..f7e41f2959 100644
--- a/meta/classes/tinderclient.bbclass
+++ b/meta/classes/tinderclient.bbclass
@@ -82,8 +82,8 @@ def tinder_format_http_post(d,status,log):
     # we only need on build_status.pl but sending it
     # always does not hurt
     try:
-        f = open(d.getVar('TMPDIR')+'/tinder-machine.id', 'r')
-        id = f.read()
+        with open(d.getVar('TMPDIR') + '/tinder-machine.id') as f:
+            id = f.read()
         variables['machine_id'] = id
     except:
         pass
@@ -231,7 +231,7 @@ def tinder_tinder_start(d, event):
     config = tinder_print_info(d)
     #env    = tinder_print_env()
     time_end   = tinder_time_string()
-    packages = " ".join( event.getPkgs() ) 
+    packages = " ".join( event.getPkgs() )
 
     output = []
     output.append( "---> TINDERBOX PRINTING CONFIGURATION %(time_start)s" )
-- 
2.11.0


