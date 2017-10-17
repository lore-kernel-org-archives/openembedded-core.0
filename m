Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id F1F7D7833A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 19:11:31 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 17 Oct 2017 12:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,391,1503385200"; d="scan'208";a="161566050"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga005.jf.intel.com with ESMTP; 17 Oct 2017 12:11:32 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Oct 2017 12:11:30 -0700
Message-Id: <20171017191130.41996-5-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20171017191130.41996-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20171017191130.41996-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v3 5/5] ruby: upgrade to 2.4.2
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
X-List-Received-Date: Tue, 17 Oct 2017 19:11:32 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The CVE-2017-14064 patch is already at 2.4.2 as explained on
project's commit, so removing from the recipe & repo.

    commit 83735ba29a0bfdaffa8e9c2a1dc025c3b0b63153
    Author: hsbt <hsbt@b2dd03c8-39d4-4d8f-98ff-823fe69b080e>
    Date:   Wed Apr 12 00:21:18 2017 +0000

        Merge json-2.0.4.

          * https://github.com/flori/json/releases/tag/v2.0.4
          * https://github.com/flori/json/blob/09fabeb03e73ed88dc8ce8f19d76ac59e51dae20/CHANGES.md#2017-03-23-204

        git-svn-id: svn+ssh://ci.ruby-lang.org/ruby/trunk@58323 b2dd03c8-39d4-4d8f-98ff-823fe69b080e

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 .../ruby/ruby/ruby-CVE-2017-14064.patch            | 87 ----------------------
 .../ruby/{ruby_2.4.1.bb => ruby_2.4.2.bb}          |  5 +-
 2 files changed, 2 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-14064.patch
 rename meta/recipes-devtools/ruby/{ruby_2.4.1.bb => ruby_2.4.2.bb} (88%)

diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-14064.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-14064.patch
deleted file mode 100644
index 88e693c94e..0000000000
--- a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-14064.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 8f782fd8e181d9cfe9387ded43a5ca9692266b85 Mon Sep 17 00:00:00 2001
-From: Florian Frank <flori@ping.de>
-Date: Thu, 2 Mar 2017 12:12:33 +0100
-Subject: [PATCH] Fix arbitrary heap exposure problem
-
-Upstream-Status: Backport
-CVE: CVE-2017-14064
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- ext/json/generator/generator.c | 12 ++++++------
- ext/json/generator/generator.h |  1 -
- 2 files changed, 6 insertions(+), 7 deletions(-)
-
-diff --git a/ext/json/generator/generator.c b/ext/json/generator/generator.c
-index ef85bb7..c88818c 100644
---- a/ext/json/generator/generator.c
-+++ b/ext/json/generator/generator.c
-@@ -308,7 +308,7 @@ static char *fstrndup(const char *ptr, unsigned long len) {
-   char *result;
-   if (len <= 0) return NULL;
-   result = ALLOC_N(char, len);
--  memccpy(result, ptr, 0, len);
-+  memcpy(result, ptr, len);
-   return result;
- }
- 
-@@ -1062,7 +1062,7 @@ static VALUE cState_indent_set(VALUE self, VALUE indent)
-         }
-     } else {
-         if (state->indent) ruby_xfree(state->indent);
--        state->indent = strdup(RSTRING_PTR(indent));
-+        state->indent = fstrndup(RSTRING_PTR(indent), len);
-         state->indent_len = len;
-     }
-     return Qnil;
-@@ -1100,7 +1100,7 @@ static VALUE cState_space_set(VALUE self, VALUE space)
-         }
-     } else {
-         if (state->space) ruby_xfree(state->space);
--        state->space = strdup(RSTRING_PTR(space));
-+        state->space = fstrndup(RSTRING_PTR(space), len);
-         state->space_len = len;
-     }
-     return Qnil;
-@@ -1136,7 +1136,7 @@ static VALUE cState_space_before_set(VALUE self, VALUE space_before)
-         }
-     } else {
-         if (state->space_before) ruby_xfree(state->space_before);
--        state->space_before = strdup(RSTRING_PTR(space_before));
-+        state->space_before = fstrndup(RSTRING_PTR(space_before), len);
-         state->space_before_len = len;
-     }
-     return Qnil;
-@@ -1173,7 +1173,7 @@ static VALUE cState_object_nl_set(VALUE self, VALUE object_nl)
-         }
-     } else {
-         if (state->object_nl) ruby_xfree(state->object_nl);
--        state->object_nl = strdup(RSTRING_PTR(object_nl));
-+        state->object_nl = fstrndup(RSTRING_PTR(object_nl), len);
-         state->object_nl_len = len;
-     }
-     return Qnil;
-@@ -1208,7 +1208,7 @@ static VALUE cState_array_nl_set(VALUE self, VALUE array_nl)
-         }
-     } else {
-         if (state->array_nl) ruby_xfree(state->array_nl);
--        state->array_nl = strdup(RSTRING_PTR(array_nl));
-+        state->array_nl = fstrndup(RSTRING_PTR(array_nl), len);
-         state->array_nl_len = len;
-     }
-     return Qnil;
-diff --git a/ext/json/generator/generator.h b/ext/json/generator/generator.h
-index 900b4d5..c367a62 100644
---- a/ext/json/generator/generator.h
-+++ b/ext/json/generator/generator.h
-@@ -1,7 +1,6 @@
- #ifndef _GENERATOR_H_
- #define _GENERATOR_H_
- 
--#include <string.h>
- #include <math.h>
- #include <ctype.h>
- 
--- 
-2.10.2
-
diff --git a/meta/recipes-devtools/ruby/ruby_2.4.1.bb b/meta/recipes-devtools/ruby/ruby_2.4.2.bb
similarity index 88%
rename from meta/recipes-devtools/ruby/ruby_2.4.1.bb
rename to meta/recipes-devtools/ruby/ruby_2.4.2.bb
index 7d27ac84ec..b471154a22 100644
--- a/meta/recipes-devtools/ruby/ruby_2.4.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.4.2.bb
@@ -6,11 +6,10 @@ SRC_URI += " \
            file://ruby-CVE-2017-9227.patch \
            file://ruby-CVE-2017-9228.patch \
            file://ruby-CVE-2017-9229.patch \
-           file://ruby-CVE-2017-14064.patch \
            "
 
-SRC_URI[md5sum] = "782bca562e474dd25956dd0017d92677"
-SRC_URI[sha256sum] = "a330e10d5cb5e53b3a0078326c5731888bb55e32c4abfeb27d9e7f8e5d000250"
+SRC_URI[md5sum] = "fe106eed9738c4e03813ab904f8d891c"
+SRC_URI[sha256sum] = "93b9e75e00b262bc4def6b26b7ae8717efc252c47154abb7392e54357e6c8c9c"
 
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
-- 
2.12.3


