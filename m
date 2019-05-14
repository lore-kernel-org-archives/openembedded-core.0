Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D379B7DED3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 03:57:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4E3viGQ018225
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 20:57:44 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 13 May 2019 20:57:43 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 May 2019 23:57:15 -0400
Message-ID: <20190514035716.27376-4-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
References: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] valgrind: adjust test filters and expected output
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
X-List-Received-Date: Tue, 14 May 2019 03:57:43 -0000
Content-Type: text/plain

Skip two filters in filter_xml_frames since they
are intended to filter filesystem paths under '/usr' that
vary from platform to platform. In the ptest case
for Yocto's valgrind, the ptest executables are placed under:
   /usr/lib/valgrind/ptest
and if these frames are filtered out, then several 'drd' tests fail
the comparision between expected and actual output.

Also adjust the std_list expected output to agree with that
produced when the --yocto-ptest option to vg_regtest is used.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...-filter_xml_frames-do-not-filter-usr.patch | 39 +++++++++++++++++++
 ...rind-adjust-std_list-expected-output.patch | 32 +++++++++++++++
 .../valgrind/valgrind_3.15.0.bb               |  2 +
 3 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
new file mode 100644
index 0000000000..bf0f0ded21
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
@@ -0,0 +1,39 @@
+From d1dea3c2bcf1e22baab39e2c0b8ca59db8a5bc37 Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Mon, 13 May 2019 17:12:21 -0400
+Subject: [PATCH 1/2] valgrind: filter_xml_frames: do not filter /usr
+
+filter_xml_frames is intended to filter system paths under
+'/usr' that vary from platform to platform. In the ptest case
+for Yocto's valgrind, the ptest executables are placed under:
+   /usr/lib/valgrind/ptest
+and if these frames are filtered out, then the 'drd' tests fail
+the comparision between exepected and actual output.
+
+Changing this filter allows the comparison to succeed without
+any negative impact.
+
+Upstream-Status: Inappropriate [Yocto specific]
+
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+---
+ tests/filter_xml_frames | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tests/filter_xml_frames b/tests/filter_xml_frames
+index f1fa3f070..04fbc82de 100755
+--- a/tests/filter_xml_frames
++++ b/tests/filter_xml_frames
+@@ -47,7 +47,8 @@ while (my $line = <>)
+         $has_function_name = 1 if ($line =~ /<fn>/);
+ # This may require tweaking; currently  /lib and /usr/lib are matched
+         $has_system_obj = 1 if ($line =~ /<obj>\/lib/);
+-        $has_system_obj = 1 if ($line =~ /<obj>\/usr\/lib/);
++# for Yocto, skip /usr since tests are under /usr/lib/...
++#        $has_system_obj = 1 if ($line =~ /<obj>\/usr\/lib/);
+     }
+ }
+ 
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch b/meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch
new file mode 100644
index 0000000000..a82972ec1b
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch
@@ -0,0 +1,32 @@
+From 6e1e9265b03cf51d09c028d657fe826d7156a783 Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Mon, 13 May 2019 17:26:26 -0400
+Subject: [PATCH 2/2] valgrind: adjust std_list expected output
+
+The run-ptest script uses a custom --yocto-ptest option
+to change the summary statistics that valgrind issues
+to a format that matches what ptest-runner expects.
+
+Only this std_list test which checks that strcpy() works
+properly on Ubuntu-12.04 and later is affected by this change.
+It's normal output when called with --yocto-ptest is a blank
+line so adjust the expected output.
+
+Upstream-Status: Inappropriate [Yocto specific]
+
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+---
+ drd/tests/std_list.stderr.exp | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/drd/tests/std_list.stderr.exp b/drd/tests/std_list.stderr.exp
+index d18786f80..8b1378917 100644
+--- a/drd/tests/std_list.stderr.exp
++++ b/drd/tests/std_list.stderr.exp
+@@ -1,3 +1 @@
+ 
+-
+-ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 4c5a4b3c70..8fecdefb91 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -37,6 +37,8 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch \
            file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
            file://0001-Return-a-valid-exit_code-from-vg_regtest.patch \
+           file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
+           file://0002-valgrind-adjust-std_list-expected-output.patch \
            "
 SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
 SRC_URI[sha256sum] = "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
-- 
2.17.0


