Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF6C72DED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 18:40:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 05 Feb 2015 10:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,525,1418112000"; d="scan'208";a="523192624"
Received: from swold-mobl.jf.intel.com ([10.24.2.202])
	by orsmga003.jf.intel.com with ESMTP; 05 Feb 2015 10:32:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 10:39:42 -0800
Message-Id: <1423161588-6867-5-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423161588-6867-1-git-send-email-sgw@linux.intel.com>
References: <1423161588-6867-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 04/10] openssh: move setting LD to allow for correct override
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
X-List-Received-Date: Thu, 05 Feb 2015 18:40:15 -0000

Using the export LD in the recipe does not allow for secodnary toolchain
overriding LD later, by setting it in the do_configure_append the export
is used by autotools setting LD based on the env, but would allow for
override later.

[YOCTO #6997]

(From OE-Core rev: 9b37e630f5f6e37e928f825c4f67481cf58c98a1)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Conflicts:
	meta/recipes-connectivity/openssh/openssh_6.5p1.bb
---
 meta/recipes-connectivity/openssh/openssh_6.5p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
index cf83fb4..20c0407 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
@@ -54,7 +54,6 @@ inherit autotools-brokensep
 
 # LFS support:
 CFLAGS += "-D__FILE_OFFSET_BITS=64"
-export LD = "${CC}"
 
 # login path is hardcoded in sshd
 EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
@@ -79,6 +78,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PATH_PASSWD_PROG=${bindir}/passwd"
 EXTRA_OECONF_append_libc-uclibc=" --without-pam"
 
 do_configure_prepend () {
+	export LD="${CC}"
 	if [ ! -e acinclude.m4 -a -e aclocal.m4 ]; then
 		cp aclocal.m4 acinclude.m4
 	fi
-- 
2.1.0


