Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B40A0615BE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 08:14:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s078E12H011748
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jan 2014 00:14:01 -0800 (PST)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 7 Jan 2014 00:14:00 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Jan 2014 16:13:53 +0800
Message-ID: <1389082433-19396-2-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1389082433-19396-1-git-send-email-ming.liu@windriver.com>
References: <1389082433-19396-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sstate: remove binutils-crosssdk from safe dependent list
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
X-List-Received-Date: Tue, 07 Jan 2014 08:14:00 -0000
Content-Type: text/plain

binutils-crosssdk is being depended by other packages like
gcc-crosssdk-initial, so it's not safe to be skipped when checking the
setscene dependencies in setscene_depvalid().

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/sstate.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 35c3f85..9d3972f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -679,7 +679,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
     def isNativeCross(x):
         return x.endswith("-native") or x.endswith("-cross") or x.endswith("-cross-initial") or x.endswith("-crosssdk") or x.endswith("-crosssdk-initial")
     def isSafeDep(x):
-        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "binutils-cross", "gcc-cross-initial", "gcc-crosssdk", "binutils-crosssdk", "gcc-crosssdk-initial"]:
+        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "binutils-cross", "gcc-cross-initial", "gcc-crosssdk", "gcc-crosssdk-initial"]:
             return True
         return False
     def isPostInstDep(x):
-- 
1.7.1


