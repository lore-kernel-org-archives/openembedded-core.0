Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E9DA78985
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:24:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:24:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053676"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:24:54 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:30 +0200
Message-Id: <20180308181804.31261-8-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/42] gnutls: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:24:53 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gnutls/gnutls/0001-configure.ac-fix-sed-command.patch | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch b/meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch
index f0b7ca2ec84..b6e7bc96504 100644
--- a/meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch
@@ -14,19 +14,16 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index 6907b21..7c70d9e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -948,7 +948,7 @@ YEAR=`date +%Y`
+Index: gnutls-3.5.16/configure.ac
+===================================================================
+--- gnutls-3.5.16.orig/configure.ac
++++ gnutls-3.5.16/configure.ac
+@@ -955,7 +955,7 @@ YEAR=`date +%Y`
  AC_SUBST([YEAR], $YEAR)
  
  for i in ${srcdir}/src/*-args.c.bak ${srcdir}/src/*-args.h.bak; do
 -	nam=$(basename $i|sed 's/.bak//g')
 +	nam=$(basename $i|sed 's/\.bak$//')
  	if test "$create_libopts_links" = "yes";then
+ 		rm -f "src/$nam.stamp"
  		rm -f "src/$nam"
- 		AC_CONFIG_LINKS([src/$nam:$i])
--- 
-2.11.0
-
-- 
2.16.1


