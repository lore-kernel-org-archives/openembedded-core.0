Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26D4577A63
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 11:37:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8FBbISh029400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 04:37:19 -0700
Received: from otp-opanait-l1.corp.ad.wrs.com (128.224.124.169) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 15 Sep 2017 04:37:18 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Sep 2017 14:36:58 +0300
Message-ID: <20170915113658.26212-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH] ruby: CVE-2017-14064
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
X-List-Received-Date: Fri, 15 Sep 2017 11:37:18 -0000
Content-Type: text/plain

Ruby through 2.2.7, 2.3.x through 2.3.4, and 2.4.x through 2.4.1 can expose 
arbitrary memory during a JSON.generate call. The issues lies in using 
strdup in ext/json/ext/generator/generator.c, which will stop after 
encountering a '\0' byte, returning a pointer to a string of length zero, 
which is not the length stored in space_len.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2017-14064

Upstream patch:
https://github.com/flori/json/commit/8f782fd8e181d9cfe9387ded43a5ca9692266b85

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../ruby/ruby/ruby-CVE-2017-14064.patch            | 87 ++++++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.4.1.bb           |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-14064.patch

diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-14064.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-14064.patch
new file mode 100644
index 0000000..88e693c
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-14064.patch
@@ -0,0 +1,87 @@
+From 8f782fd8e181d9cfe9387ded43a5ca9692266b85 Mon Sep 17 00:00:00 2001
+From: Florian Frank <flori@ping.de>
+Date: Thu, 2 Mar 2017 12:12:33 +0100
+Subject: [PATCH] Fix arbitrary heap exposure problem
+
+Upstream-Status: Backport
+CVE: CVE-2017-14064
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ ext/json/generator/generator.c | 12 ++++++------
+ ext/json/generator/generator.h |  1 -
+ 2 files changed, 6 insertions(+), 7 deletions(-)
+
+diff --git a/ext/json/generator/generator.c b/ext/json/generator/generator.c
+index ef85bb7..c88818c 100644
+--- a/ext/json/generator/generator.c
++++ b/ext/json/generator/generator.c
+@@ -308,7 +308,7 @@ static char *fstrndup(const char *ptr, unsigned long len) {
+   char *result;
+   if (len <= 0) return NULL;
+   result = ALLOC_N(char, len);
+-  memccpy(result, ptr, 0, len);
++  memcpy(result, ptr, len);
+   return result;
+ }
+ 
+@@ -1062,7 +1062,7 @@ static VALUE cState_indent_set(VALUE self, VALUE indent)
+         }
+     } else {
+         if (state->indent) ruby_xfree(state->indent);
+-        state->indent = strdup(RSTRING_PTR(indent));
++        state->indent = fstrndup(RSTRING_PTR(indent), len);
+         state->indent_len = len;
+     }
+     return Qnil;
+@@ -1100,7 +1100,7 @@ static VALUE cState_space_set(VALUE self, VALUE space)
+         }
+     } else {
+         if (state->space) ruby_xfree(state->space);
+-        state->space = strdup(RSTRING_PTR(space));
++        state->space = fstrndup(RSTRING_PTR(space), len);
+         state->space_len = len;
+     }
+     return Qnil;
+@@ -1136,7 +1136,7 @@ static VALUE cState_space_before_set(VALUE self, VALUE space_before)
+         }
+     } else {
+         if (state->space_before) ruby_xfree(state->space_before);
+-        state->space_before = strdup(RSTRING_PTR(space_before));
++        state->space_before = fstrndup(RSTRING_PTR(space_before), len);
+         state->space_before_len = len;
+     }
+     return Qnil;
+@@ -1173,7 +1173,7 @@ static VALUE cState_object_nl_set(VALUE self, VALUE object_nl)
+         }
+     } else {
+         if (state->object_nl) ruby_xfree(state->object_nl);
+-        state->object_nl = strdup(RSTRING_PTR(object_nl));
++        state->object_nl = fstrndup(RSTRING_PTR(object_nl), len);
+         state->object_nl_len = len;
+     }
+     return Qnil;
+@@ -1208,7 +1208,7 @@ static VALUE cState_array_nl_set(VALUE self, VALUE array_nl)
+         }
+     } else {
+         if (state->array_nl) ruby_xfree(state->array_nl);
+-        state->array_nl = strdup(RSTRING_PTR(array_nl));
++        state->array_nl = fstrndup(RSTRING_PTR(array_nl), len);
+         state->array_nl_len = len;
+     }
+     return Qnil;
+diff --git a/ext/json/generator/generator.h b/ext/json/generator/generator.h
+index 900b4d5..c367a62 100644
+--- a/ext/json/generator/generator.h
++++ b/ext/json/generator/generator.h
+@@ -1,7 +1,6 @@
+ #ifndef _GENERATOR_H_
+ #define _GENERATOR_H_
+ 
+-#include <string.h>
+ #include <math.h>
+ #include <ctype.h>
+ 
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/ruby/ruby_2.4.1.bb b/meta/recipes-devtools/ruby/ruby_2.4.1.bb
index 4443146..7d27ac8 100644
--- a/meta/recipes-devtools/ruby/ruby_2.4.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.4.1.bb
@@ -6,6 +6,7 @@ SRC_URI += " \
            file://ruby-CVE-2017-9227.patch \
            file://ruby-CVE-2017-9228.patch \
            file://ruby-CVE-2017-9229.patch \
+           file://ruby-CVE-2017-14064.patch \
            "
 
 SRC_URI[md5sum] = "782bca562e474dd25956dd0017d92677"
-- 
2.10.2


