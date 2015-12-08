Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CF96B6FF78
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 09:56:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB89uphI018887
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Dec 2015 01:56:51 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Dec 2015 01:56:51 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Dec 2015 01:56:36 -0800
Message-ID: <16482cf042e129e8f429bdcea9c0c9addb0e8a0b.1449568553.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1449568553.git.liezhi.yang@windriver.com>
References: <cover.1449568553.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/15] allarch: Force TARGET_*FLAGS variable values
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
X-List-Received-Date: Tue, 08 Dec 2015 09:56:51 -0000
Content-Type: text/plain

From: Mike Crowe <mac@mcrowe.com>

TARGET_CPPFLAGS, TARGET_CFLAGS, TARGET_CPPFLAGS and TARGET_LDFLAGS may
differ between MACHINEs. Since they are exported they affect task hashes
even if unused which leads to multiple variants of allarch packages
existing in sstate and bouncing in the sysroot when switching between
MACHINEs.

allarch packages shouldn't be using these variables anyway, so let's
ensure they have a fixed value in order to avoid this problem.

(Compare with 05a70ac30b37cab0952f1b9df501993a9dec70da and
14f4d016fef9d660da1e7e91aec4a0e807de59ab.)

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/allarch.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 2fea7c0..4af38d7 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -27,6 +27,10 @@ python () {
         d.setVar("PACKAGE_EXTRA_ARCHS", "")
         d.setVar("SDK_ARCH", "none")
         d.setVar("SDK_CC_ARCH", "none")
+        d.setVar("TARGET_CPPFLAGS", "none")
+        d.setVar("TARGET_CFLAGS", "none")
+        d.setVar("TARGET_CXXFLAGS", "none")
+        d.setVar("TARGET_LDFLAGS", "none")
 
         # Avoid this being unnecessarily different due to nuances of
         # the target machine that aren't important for "all" arch
-- 
1.7.9.5


