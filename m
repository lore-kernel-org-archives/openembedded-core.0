Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 28C2978277
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 04:55:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 17 Sep 2017 21:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,411,1500966000"; d="scan'208";a="312778409"
Received: from ogmeshki-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.137.189])
	by fmsmga004.fm.intel.com with ESMTP; 17 Sep 2017 21:55:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Sep 2017 16:54:42 +1200
Message-Id: <15886a7f2dfdc6d98f502528101db60eb9a4d9a6.1505710457.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1505710457.git.paul.eggleton@linux.intel.com>
References: <cover.1505710457.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/externalsrc: delete symlinks at start of do_buildclean
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
X-List-Received-Date: Mon, 18 Sep 2017 04:55:16 -0000

To help users find the work and log directories (especially within the
eSDK) we create symlinks to these from the source tree. However during
do_buildclean we call "make clean", and some project Makefiles which
delete something like "*/*/lib" which will match files underneath the
oe-workdir symlink and fail. do_buildclean is called from do_clean which
is in turn called by devtool reset by default, and thus devtool reset is
blocked. An example of a recipe where this is visible is the openssl-qat
recipe in meta-intel.

In order to fix this, delete the symlinks at the start of do_buildclean
since we shouldn't need them at that point anyway, and thus make clean
won't be able to trip over them.

Fixes [YOCTO #11036].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 8141f25..08e6e47 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -172,6 +172,7 @@ do_buildclean[nostamp] = "1"
 do_buildclean[doc] = "Call 'make clean' or equivalent in ${B}"
 externalsrc_do_buildclean() {
 	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
+		rm -f ${@' '.join([x.split(':')[0] for x in (d.getVar('EXTERNALSRC_SYMLINKS') or '').split()])}
 		oe_runmake clean || die "make failed"
 	else
 		bbnote "nothing to do - no makefile found"
-- 
2.9.5


