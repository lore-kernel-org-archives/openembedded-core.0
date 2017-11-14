Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0642B7017D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 21:53:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAELrSTE003788
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 13:53:29 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 14 Nov 2017 13:53:28 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 13:53:28 -0800
Message-ID: <20171114215328.164610-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] net-tools: correctly set COPTS and LOPTS
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
X-List-Received-Date: Tue, 14 Nov 2017 21:53:28 -0000
Content-Type: text/plain

COPTS will be ignored if it is defined in the environment.
It must be passed directly to make.  To be consistent, we
pass LOPTS that way, too.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index c23d533..69c9af3 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -81,20 +81,12 @@ do_configure() {
 
 do_compile() {
 	# net-tools use COPTS/LOPTS to allow adding custom options
-	export COPTS="$CFLAGS"
-	export LOPTS="$LDFLAGS"
-	unset CFLAGS
-	unset LDFLAGS
-
-	oe_runmake
+	oe_runmake COPTS="$CFLAGS" LOPTS="$LDFLAGS"
 }
 
 do_install() {
-	export COPTS="$CFLAGS"
-	export LOPTS="$LDFLAGS"
-	unset CFLAGS
-	unset LDFLAGS
-	oe_runmake 'BASEDIR=${D}' install
+	# We don't need COPTS or LOPTS, but let's be consistent.
+	oe_runmake COPTS="$CFLAGS" LOPTS="$LDFLAGS" 'BASEDIR=${D}' install
 
 	if [ "${base_bindir}" != "/bin" ]; then
 		mkdir -p ${D}/${base_bindir}
-- 
2.7.4


