Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 61B8A71B9D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 22:40:55 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Aug 2017 15:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,322,1498546800"; d="scan'208";a="115783361"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 04 Aug 2017 15:40:56 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Aug 2017 15:40:54 -0700
Message-Id: <1501886454-36442-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501886454-36442-1-git-send-email-juro.bystricky@intel.com>
References: <1501886454-36442-1-git-send-email-juro.bystricky@intel.com>
Subject: [PATCH 1/1] gcc7: fix potential segmentation fault
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
X-List-Received-Date: Fri, 04 Aug 2017 22:40:55 -0000

Under some rare circumstances we may end up with GCC segmentation fault.
This was observed with versions of sysmacros.h, which contain macros
with embedded warning messages :

When trying to actually display the warning, we may end up with a segmentation
fault instead. The reason is the actual warning message gets parsed (the text is
unquoted) and words in the message such as "not", "and" etc. are interpreted as
operators CPP_NOT, CPP_AND. When the time comes to display the warning, the code
uses wrong structure to access the "name" corresponding to the operators.

[YOCTO #11738]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/gcc/gcc-7.1.inc              |  1 +
 .../fix-segmentation-fault-precompiled-hdr.patch   | 49 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/fix-segmentation-fault-precompiled-hdr.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc b/meta/recipes-devtools/gcc/gcc-7.1.inc
index 3f1c06d..2d9ca82 100644
--- a/meta/recipes-devtools/gcc/gcc-7.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.1.inc
@@ -75,6 +75,7 @@ SRC_URI = "\
            file://0048-gcc-Enable-static-PIE.patch \
            file://0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch \
            file://0050-replace-struct-ucontext-with-ucontext_t.patch \
+           file://fix-segmentation-fault-precompiled-hdr.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/fix-segmentation-fault-precompiled-hdr.patch b/meta/recipes-devtools/gcc/gcc-7.1/fix-segmentation-fault-precompiled-hdr.patch
new file mode 100644
index 0000000..c0adef6
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.1/fix-segmentation-fault-precompiled-hdr.patch
@@ -0,0 +1,49 @@
+
+Prevent a segmentation fault which occurs when using incorrect
+structure trying to access name of some named operators, such as 
+CPP_NOT, CPP_AND etc. "token->val.node.spelling" cannot be used in
+those cases, as is may not be initialized at all.
+
+
+[YOCTO #11738]
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+diff --git a/libcpp/lex.c b/libcpp/lex.c
+--- a/libcpp/lex.c
++++ b/libcpp/lex.c
+@@ -3229,11 +3229,27 @@
+     spell_ident:
+     case SPELL_IDENT:
+       if (forstring)
+-	{
+-	  memcpy (buffer, NODE_NAME (token->val.node.spelling),
+-		  NODE_LEN (token->val.node.spelling));
+-	  buffer += NODE_LEN (token->val.node.spelling);
+-	}
++        {
++          if (token->type == CPP_NAME)
++            {
++              memcpy (buffer, NODE_NAME (token->val.node.spelling),
++                    NODE_LEN (token->val.node.spelling));
++              buffer += NODE_LEN (token->val.node.spelling);
++              break;
++            }
++          /* NAMED_OP, cannot use node.spelling */
++          if (token->flags & NAMED_OP)
++            {
++              const char *str = cpp_named_operator2name (token->type);
++              if (str)
++                {
++                  size_t len = strlen(str);
++                  memcpy(buffer, str, len);
++                  buffer += len;
++                }
++              break;
++            }
++        }
+       else
+ 	buffer = _cpp_spell_ident_ucns (buffer, token->val.node.node);
+       break;
-- 
2.7.4


