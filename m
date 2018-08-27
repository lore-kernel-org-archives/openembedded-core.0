Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E71371974
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 08:43:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7R8i0qn028774
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 01:44:00 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 27 Aug 2018 01:43:59 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Aug 2018 16:48:38 +0800
Message-ID: <e0a5d2d3028d4a397a99882c0ca0777fb5d921a6.1535359701.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1535359701.git.Qi.Chen@windriver.com>
References: <cover.1535359701.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] nativesdk.bbclass: set consistent staging dirs regardless of multilib
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
X-List-Received-Date: Mon, 27 Aug 2018 08:43:59 -0000
Content-Type: text/plain

For now, the RECIPE_SYSROOT of nativesdk recipes is ${WORKDIR}/recipe-sysroot
if multilib is disabled and ${WORKDIR}/nativesdk-recipe-sysroot if multilib
is enabled. And it's causing chaos. Problems I've met include:
1) 'File Exists' error when doing extend_recipe_sysroot
2) Rebuilding failure about cmake based nativesdk recipes if toggling multilib

In nativesdk.bbclass, We've set MULTILIBS to be "", and we've changed MLPREFIX
to be 'nativesdk-', I think we should also set consistent RECIPE_SYSROOT to be
${WORKDIR}/nativesdk-recipe-sysroot.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/nativesdk.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index ab566e9..f3336e5 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -12,6 +12,11 @@ MACHINEOVERRIDES = ""
 
 MULTILIBS = ""
 
+# we need consistent staging dir whether or not multilib is enabled
+STAGING_DIR_HOST = "${WORKDIR}/nativesdk-recipe-sysroot"
+STAGING_DIR_TARGET = "${WORKDIR}/nativesdk-recipe-sysroot"
+RECIPE_SYSROOT = "${WORKDIR}/nativesdk-recipe-sysroot"
+
 #
 # Update PACKAGE_ARCH and PACKAGE_ARCHS
 #
-- 
1.9.1


