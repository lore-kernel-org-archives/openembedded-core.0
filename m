Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1Txd9b-0003Gw-Lf for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 13:40:43 +0100
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3Yr7vP2BJCz3hjbl
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 13:18:25 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3Yr7vP1DhRzbbh8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 13:18:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024) with ESMTP id yOLPhnIt1S9K
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 13:17:52 +0100 (CET)
X-Auth-Info: fz4HfO6nU5Szc79/0SvCJMz2/DYK4lEVmoIz4ZFsPKQ=
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 13:18:24 +0100 (CET)
Received: from gemini.denx.de (unknown [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 662CD1A14C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 13:18:24 +0100 (CET)
Received: by gemini.denx.de (Postfix, from userid 500)
	id 59A442454A0; Tue, 22 Jan 2013 13:18:24 +0100 (CET)
From: Wolfgang Denk <wd@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jan 2013 13:18:05 +0100
Message-Id: <1358857085-16549-1-git-send-email-wd@denx.de>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] populate_sdk_base.bbclass: Allow installation of ix86 SDK on x86_64 host
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 12:40:45 -0000

Commit c04f5435 "populate_sdk_base.bbclass: use SDK_ARCH instead
of SDKMACHINE" prevents not only the installation of 64 bit SDK
configurations on 32 bit hosts (which indeed cannot work), but also
the legitimate installation of a 32 bit SDK on a 64 bit host.

Fix this.

While there, also make sure we use the same patterns ("i[3-6]86" resp.
"x86[-_]64" to get unified strings for both INST_ARCH and SDK_ARCH.

Signed-off-by: Wolfgang Denk <wd@denx.de>
---
 meta/classes/populate_sdk_base.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index da846b4..c587af8 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -122,11 +122,14 @@ fakeroot create_shar() {
 #!/bin/bash
 
 INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
-SDK_ARCH=$(echo ${SDK_ARCH} | sed -e "s/i[5-6]86/ix86/")
+SDK_ARCH=$(echo ${SDK_ARCH} | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 
 if [ "$INST_ARCH" != "$SDK_ARCH" ]; then
-	echo "Error: Installation machine not supported!"
-	exit 1
+	# Allow for installation of ix86 SDK on x86_64 host
+	if [ "$INST_ARCH" != x86_64 -o "$SDK_ARCH" != ix86 ]; then
+		echo "Error: Installation machine not supported!"
+		exit 1
+	fi
 fi
 
 DEFAULT_INSTALL_DIR="${SDKPATH}"
-- 
1.7.11.7



