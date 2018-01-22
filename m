Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 22B5278257
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 22:59:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2018 14:59:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,398,1511856000"; d="scan'208";a="12193369"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga008.jf.intel.com with ESMTP; 22 Jan 2018 14:59:47 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2018 14:59:49 -0800
Message-Id: <1516661989-26346-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH v2] libc6: improve reproducibility
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
X-List-Received-Date: Mon, 22 Jan 2018 22:59:47 -0000

Building various libraries (libc6, libc6-pic, libc6-staticdev, libc6-dbg, ...)
can be non-deterministic because they may be built with two different versions
of intl/plural.c. in two otherwise identical builds. We may or may not re-generate
the file plural.c from the file plural.y, based on bison being installed or not
and based on mtimes of those two files, as the Makefile contains:

plural.c: plural.y
	$(BISON) $(BISONFLAGS) $@ $^

If the above rule does not fire, we use a "fallback" plural.c, otherwise
we use plural.c re-generated from plural.y.
The fix is to always require bison to be installed and unconditionally
re-generate plural.c. (This is achieved by touching plural.y).

[YOCTO #12291]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/glibc/glibc_2.26.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 04d9773..0ee5bdb 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS += "gperf-native"
+DEPENDS += "gperf-native bison-native"
 
 SRCREV ?= "77f921dac17c5fa99bd9e926d926c327982895f7"
 
@@ -103,6 +103,10 @@ do_configure () {
 # version check and doesn't really help with anything
         (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
         find ${S} -name "configure" | xargs touch
+        # "plural.c" may or may not get regenerated from "plural.y" so we
+        # touch "plural.y" to make sure it does. (This should not be needed
+        # for glibc version 2.26+)
+        find ${S}/intl -name "plural.y" | xargs touch
         CPPFLAGS="" oe_runconf
 }
 
-- 
2.7.4


