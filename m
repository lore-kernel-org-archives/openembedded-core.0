Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8C59B71B50
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 01:01:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Mar 2018 17:01:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,414,1515484800"; d="scan'208";a="21683376"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga007.jf.intel.com with ESMTP; 02 Mar 2018 17:01:58 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 17:02:00 -0800
Message-Id: <1520038920-86212-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] e2fsprogs_1.43.8.bb: improve reproducibility
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
X-List-Received-Date: Sat, 03 Mar 2018 01:01:58 -0000

Various builds of e2fsprogs 1.43.7 package locales which may or may
not have POT-Creation-Date removed. There is no obvious pattern, it
affects different locales each time, the build being non-deterministic.

The root cause was tracked to non-deterministic time stamps (as GIT does
not preserve file mktime), so some "make" rules sometimes fired, sometimes
did not.

The remedy is to explicitly "touch" files that cause non-deterministic build.

[YOCTO #12516]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
index ceaf171..4fa976d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
@@ -25,6 +25,9 @@ EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enabl
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[fuse] = '--enable-fuse2fs,--disable-fuse2fs,fuse'
 
+do_compile_prepend (){
+	find ${S}/po -type f -name "*.po" -exec touch {} +
+}
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
-- 
2.7.4


