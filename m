Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 34C9F7F8BC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 06:15:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 22:15:25 -0800
X-IronPort-AV: E=Sophos;i="5.69,312,1571727600"; d="scan'208";a="204540215"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.64.187])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 22:15:24 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Dec 2019 14:14:59 +0800
Message-Id: <fb3baca52fb89465aab0317bf3029c3b0e7f5c6f.1576303901.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576303901.git.anuj.mittal@intel.com>
References: <cover.1576303901.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 05/11] base.bbclass: add dependency on pseudo from do_prepare_recipe_sysroot
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
X-List-Received-Date: Sat, 14 Dec 2019 06:15:24 -0000
Content-Transfer-Encoding: 8bit

From: Mattias Hansson <mattias.hansson@axis.com>

do_prepare_recipe_sysroot may perform groupadd, which requires pseudo.
However, do_prepare_recipe_sysroot does not depend on pseudo explicitly,
which sometimes causes a build error when building a recipe that adds
groups.

This issue only occurs when executing do_prepare_recipe_sysroot for a
recipe that adds groups before finishing a task that depends on pseudo
for a recipe that doesn't add groups.

Signed-off-by: Mattias Hansson <mattihn@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index d3184ecf7b..1cea3a2213 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -482,6 +482,7 @@ python () {
     # If we're building a target package we need to use fakeroot (pseudo)
     # in order to capture permissions, owners, groups and special files
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
+        d.appendVarFlag('do_prepare_recipe_sysroot', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_unpack', 'umask', '022')
         d.setVarFlag('do_configure', 'umask', '022')
         d.setVarFlag('do_compile', 'umask', '022')
-- 
2.21.0


