Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1SyvVP-0000Rk-UO
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 03:56:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q781iSVq012573
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 18:44:28 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.163) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 7 Aug 2012 18:44:27 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Aug 2012 09:44:26 +0800
Message-ID: <1344390266-11878-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] bitbake: compile tar-replacement firstly
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
X-List-Received-Date: Wed, 08 Aug 2012 01:56:16 -0000
Content-Type: text/plain

From: Roy.Li <rongqing.li@windriver.com>

Compiling tar-replacement or not is decided by version of host tar,
if the host tar version is lower than 1.23, Compiling tar-replacement
is needed.

When doing popoluate tar-replacement sysroot to write the tar to
sysroot, but writing is not finished. other packages probably
use the being written tar to unzip file, which will lead to failure
and report the below error:
"bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/tar: Text file busy"

Now we compile tar-replacement firstly to ensure that a being written
tar command will not be used.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 scripts/bitbake |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 09f8a86..79a81ea 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -152,7 +152,12 @@ if [ $buildpseudo -gt 0 ]; then
             fi
         done
     done
-    bitbake pseudo-native $TARTARGET $GITTARGET $additionalopts -c populate_sysroot
+
+    if [ $needtar = "1" ]; then
+	bitbake $TARTARGET -c populate_sysroot
+    fi
+
+    bitbake pseudo-native $GITTARGET $additionalopts -c populate_sysroot
     ret=$?
     if [ "$ret" != "0" ]; then
         exit 1
-- 
1.7.4.1



