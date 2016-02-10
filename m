Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 73D85731F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:33:14 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 24E8B1A7B99;
	Wed, 10 Feb 2016 13:33:14 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Enrico Jorns <ejo@pengutronix.de>, Roy Li <rongqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Christopher Larson <chris_larson@mentor.com>,
	Ross Burton <ross.burton@intel.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>,
	Randy MacLeod <randy.macleod@windriver.com>, Tanu Kaskinen <tanuk@iki.fi>
Date: Wed, 10 Feb 2016 13:32:52 +0100
Message-Id: <1455107576-8931-4-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455107576-8931-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1455107576-8931-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 3/7] classes/useradd: handle whitespace only USERADD/GROUPADD/GROUPMEMS
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
X-List-Received-Date: Wed, 10 Feb 2016 12:33:14 -0000

Useradd attempts to add users/groups even when
{USERADD,GROUPADD,GROUPMEMS}_PARAM is whitespace only. This scenario is
possible when variables and modified using one of +=, =+ operator, yet
the content being added is conditional (i.e. may depend on PACKAGECONFIG
flags).

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 meta/classes/useradd.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 4577e56f5a17940929c555b3f5d18d75e92f1476..c960656f02b3d11e5bb08dca259df3946f96aeaf 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -50,7 +50,7 @@ fi
 
 # Perform group additions first, since user additions may depend
 # on these groups existing
-if test "x$GROUPADD_PARAM" != "x"; then
+if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`" != "x"; then
 	echo "Running groupadd commands..."
 	# Invoke multiple instances of groupadd for parameter lists
 	# separated by ';'
@@ -66,7 +66,7 @@ if test "x$GROUPADD_PARAM" != "x"; then
 	done
 fi 
 
-if test "x$USERADD_PARAM" != "x"; then
+if test "x`echo $USERADD_PARAM | tr -d '[:space:]'`" != "x"; then
 	echo "Running useradd commands..."
 	# Invoke multiple instances of useradd for parameter lists
 	# separated by ';'
@@ -82,7 +82,7 @@ if test "x$USERADD_PARAM" != "x"; then
 	done
 fi
 
-if test "x$GROUPMEMS_PARAM" != "x"; then
+if test "x`echo $GROUPMEMS_PARAM | tr -d '[:space:]'`" != "x"; then
 	echo "Running groupmems commands..."
 	# Invoke multiple instances of groupmems for parameter lists
 	# separated by ';'
-- 
2.5.0


