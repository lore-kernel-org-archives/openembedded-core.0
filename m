Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AE58D61963
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:24:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 07:24:18 -0800
X-IronPort-AV: E=Sophos;i="5.70,496,1574150400"; d="scan'208";a="232272097"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	28 Feb 2020 07:24:16 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 23:23:35 +0800
Message-Id: <4ee9c60797e95674ae138245b3a4de063b2e95db.1582902875.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
Subject: [zeus][PATCH 11/22] perl: improve reproducibility
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
X-List-Received-Date: Fri, 28 Feb 2020 15:24:17 -0000

From: Ross Burton <ross.burton@intel.com>

Occasionally the reproducibility selftest fails because perl-pod differs,
specifically that the perltoc.pod file was sometimes missing modules.

Debugging revealed that there are missing dependencies so there is a build race:
building perltoc.pod from an clean build tree results in no modules being listed
at all.

A bug has been filed at https://github.com/arsv/perl-cross/issues/86 to solve
this properly, but for now we can just delete perltoc.pod after make has
finished and re-generate it.

[ YOCTO #13726 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e0f6c9ea4f824f29dc30c6631fd8039ebe83a0b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index c68ffb1..15bc5a4 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -112,6 +112,14 @@ print(datetime.fromtimestamp($SOURCE_DATE_EPOCH, timezone.utc).strftime('%a %b %
 
 do_compile() {
     oe_runmake
+    # This isn't generated reliably so delete and re-generate.
+    # https://github.com/arsv/perl-cross/issues/86
+
+    if [ -e pod/perltoc.pod ]; then
+        bbnote Rebuilding perltoc.pod
+        rm -f pod/perltoc.pod
+        oe_runmake pod/perltoc.pod
+    fi
 }
 
 do_install() {
-- 
2.7.4


