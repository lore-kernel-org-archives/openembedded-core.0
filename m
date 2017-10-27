Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4D862719B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 14:49:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 27 Oct 2017 07:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; 
   d="scan'208";a="1444912"
Received: from jlock-mobl3.ger.corp.intel.com ([10.252.30.218])
	by orsmga001.jf.intel.com with ESMTP; 27 Oct 2017 07:49:47 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Oct 2017 15:49:41 +0100
Message-Id: <20171027144941.4334-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH][morty] ruby: fix build of ruby-native with gcc7
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
X-List-Received-Date: Fri, 27 Oct 2017 14:49:47 -0000

Marsalling is broken when ruby-2.2.x is built with gcc7, backport the change
fix  in Ruby SVN r57410 to apply to ruby 2.2.5:

https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=revision&revision=57410

Fixes [YOCTO #12271]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-devtools/ruby/ruby/prevent-gc.patch | 32 ++++++++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.2.5.bb         |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/prevent-gc.patch

diff --git a/meta/recipes-devtools/ruby/ruby/prevent-gc.patch b/meta/recipes-devtools/ruby/ruby/prevent-gc.patch
new file mode 100644
index 00000000000..2eaa955fba2
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/prevent-gc.patch
@@ -0,0 +1,32 @@
+Fix marshaling with gcc7. Based on upstream revision 57410:
+https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=revision&revision=57410
+https://github.com/ruby/ruby/commit/7c1b30a602ab109d8d5388d7dfb3c5b180ba24e1
+https://bugs.ruby-lang.org/issues/13150
+
+with the upstream patches intent ported to Ruby 2.2.5
+
+Upstream-Status: Backport
+
+Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
+
+Index: ruby-2.2.5/marshal.c
+===================================================================
+--- ruby-2.2.5.orig/marshal.c
++++ ruby-2.2.5/marshal.c
+@@ -17,7 +17,6 @@
+ #include "ruby/io.h"
+ #include "ruby/st.h"
+ #include "ruby/util.h"
+-
+ #include <math.h>
+ #ifdef HAVE_FLOAT_H
+ #include <float.h>
+@@ -985,7 +984,7 @@ marshal_dump(int argc, VALUE *argv)
+     VALUE obj, port, a1, a2;
+     int limit = -1;
+     struct dump_arg *arg;
+-    VALUE wrapper; /* used to avoid memory leak in case of exception */
++    volatile VALUE wrapper; /* used to avoid memory leak in case of exception */
+ 
+     port = Qnil;
+     rb_scan_args(argc, argv, "12", &obj, &a1, &a2);
diff --git a/meta/recipes-devtools/ruby/ruby_2.2.5.bb b/meta/recipes-devtools/ruby/ruby_2.2.5.bb
index 5a645821ba0..66ba1d4b844 100644
--- a/meta/recipes-devtools/ruby/ruby_2.2.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.2.5.bb
@@ -3,6 +3,8 @@ require ruby.inc
 SRC_URI[md5sum] = "bd8e349d4fb2c75d90817649674f94be"
 SRC_URI[sha256sum] = "30c4b31697a4ca4ea0c8db8ad30cf45e6690a0f09687e5d483c933c03ca335e3"
 
+SRC_URI += "file://prevent-gc.patch"
+
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
 # 0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
-- 
2.13.6


