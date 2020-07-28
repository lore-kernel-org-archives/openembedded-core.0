Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 0HUG8DHp+oto0ZO9OyP9UIEb0hRTNy0JA0iiUoKG9ktyYRU74sxhlbps631HeIJ7sVbl6fGZn+
 Ymzw1TF1KLXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699733"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699733"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:08 -0700
IronPort-SDR: 9iJ8oSu0aHzuV5ZYMmuM+RrlT+6OjFcIPqXhhhNcKVPNb1wM3zSDe+J9XVuf5GlnqL3JJeK9Pv
 i9n6IeOuXiUQ==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245860"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:06 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 17/32] perl: fix CVE-2020-10543 & CVE-2020-10878
Date: Tue, 28 Jul 2020 16:51:18 +0800
Message-Id: <de3fe84fcfe3f1c3c2ad963b1fe459ccca9472a0.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

(From OE-Core rev: d9c5d9c52eb1f03ff9c907a76dda31042fb26edb)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../perl/files/CVE-2020-10543.patch           |  36 +++++
 .../perl/files/CVE-2020-10878_1.patch         | 152 ++++++++++++++++++
 .../perl/files/CVE-2020-10878_2.patch         |  36 +++++
 meta/recipes-devtools/perl/perl_5.30.1.bb     |   3 +
 4 files changed, 227 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10543.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10878_1.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10878_2.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2020-10543.patch b/meta/recipes-devtools/perl/files/CVE-2020-10543.patch
new file mode 100644
index 0000000000..36dff0aac9
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2020-10543.patch
@@ -0,0 +1,36 @@
+From 897d1f7fd515b828e4b198d8b8bef76c6faf03ed Mon Sep 17 00:00:00 2001
+From: John Lightsey <jd@cpanel.net>
+Date: Wed, 20 Nov 2019 20:02:45 -0600
+Subject: [PATCH] regcomp.c: Prevent integer overflow from nested regex
+ quantifiers.
+
+(CVE-2020-10543) On 32bit systems the size calculations for nested regular
+expression quantifiers could overflow causing heap memory corruption.
+
+Fixes: Perl/perl5-security#125
+(cherry picked from commit bfd31397db5dc1a5c5d3e0a1f753a4f89a736e71)
+
+Upstream-Status: Backport [https://github.com/perl/perl5/commit/897d1f7fd515b828e4b198d8b8bef76c6faf03ed] 
+CVE: CVE-2020-10543
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ regcomp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/regcomp.c b/regcomp.c
+index 93c8d98fbb0..5f86be8086d 100644
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -5489,6 +5489,12 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regnode **scanp,
+ 				  RExC_precomp)));
+                 }
+ 
++                if ( ( minnext > 0 && mincount >= SSize_t_MAX / minnext )
++                    || min >= SSize_t_MAX - minnext * mincount )
++                {
++                    FAIL("Regexp out of space");
++                }
++
+ 		min += minnext * mincount;
+ 		is_inf_internal |= deltanext == SSize_t_MAX
+                          || (maxcount == REG_INFTY && minnext + deltanext > 0);
diff --git a/meta/recipes-devtools/perl/files/CVE-2020-10878_1.patch b/meta/recipes-devtools/perl/files/CVE-2020-10878_1.patch
new file mode 100644
index 0000000000..b86085a551
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2020-10878_1.patch
@@ -0,0 +1,152 @@
+From 0a320d753fe7fca03df259a4dfd8e641e51edaa8 Mon Sep 17 00:00:00 2001
+From: Hugo van der Sanden <hv@crypt.org>
+Date: Tue, 18 Feb 2020 13:51:16 +0000
+Subject: [PATCH] study_chunk: extract rck_elide_nothing
+
+(CVE-2020-10878)
+
+(cherry picked from commit 93dee06613d4e1428fb10905ce1c3c96f53113dc)
+
+Upstream-Status: Backport [https://github.com/perl/perl5/commit/0a320d753fe7fca03df259a4dfd8e641e51edaa8] 
+CVE: CVE-2020-10878
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ embed.fnc |  1 +
+ embed.h   |  1 +
+ proto.h   |  3 +++
+ regcomp.c | 70 ++++++++++++++++++++++++++++++++++---------------------
+ 4 files changed, 48 insertions(+), 27 deletions(-)
+
+diff --git a/embed.fnc b/embed.fnc
+index aedb4baef19..d7cd04d3fc3 100644
+--- a/embed.fnc
++++ b/embed.fnc
+@@ -2481,6 +2481,7 @@ Es	|SSize_t|study_chunk	|NN RExC_state_t *pRExC_state \
+                                 |I32 stopparen|U32 recursed_depth \
+ 				|NULLOK regnode_ssc *and_withp \
+ 				|U32 flags|U32 depth
++Es	|void	|rck_elide_nothing|NN regnode *node
+ EsR	|SV *	|get_ANYOFM_contents|NN const regnode * n
+ EsRn	|U32	|add_data	|NN RExC_state_t* const pRExC_state \
+ 				|NN const char* const s|const U32 n
+diff --git a/embed.h b/embed.h
+index 75c91f77f45..356a8b98d96 100644
+--- a/embed.h
++++ b/embed.h
+@@ -1208,6 +1208,7 @@
+ #define parse_lparen_question_flags(a)	S_parse_lparen_question_flags(aTHX_ a)
+ #define parse_uniprop_string(a,b,c,d,e,f,g,h,i)	Perl_parse_uniprop_string(aTHX_ a,b,c,d,e,f,g,h,i)
+ #define populate_ANYOF_from_invlist(a,b)	S_populate_ANYOF_from_invlist(aTHX_ a,b)
++#define rck_elide_nothing(a)	S_rck_elide_nothing(aTHX_ a)
+ #define reg(a,b,c,d)		S_reg(aTHX_ a,b,c,d)
+ #define reg2Lanode(a,b,c,d)	S_reg2Lanode(aTHX_ a,b,c,d)
+ #define reg_node(a,b)		S_reg_node(aTHX_ a,b)
+diff --git a/proto.h b/proto.h
+index 141ddbaee6d..f316fe134e1 100644
+--- a/proto.h
++++ b/proto.h
+@@ -5543,6 +5543,9 @@ PERL_CALLCONV SV *	Perl_parse_uniprop_string(pTHX_ const char * const name, cons
+ STATIC void	S_populate_ANYOF_from_invlist(pTHX_ regnode *node, SV** invlist_ptr);
+ #define PERL_ARGS_ASSERT_POPULATE_ANYOF_FROM_INVLIST	\
+ 	assert(node); assert(invlist_ptr)
++STATIC void	S_rck_elide_nothing(pTHX_ regnode *node);
++#define PERL_ARGS_ASSERT_RCK_ELIDE_NOTHING	\
++	assert(node)
+ PERL_STATIC_NO_RET void	S_re_croak2(pTHX_ bool utf8, const char* pat1, const char* pat2, ...)
+ 			__attribute__noreturn__;
+ #define PERL_ARGS_ASSERT_RE_CROAK2	\
+diff --git a/regcomp.c b/regcomp.c
+index 5f86be8086d..4ba2980db66 100644
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -4450,6 +4450,44 @@ S_unwind_scan_frames(pTHX_ const void *p)
+     } while (f);
+ }
+ 
++/* Follow the next-chain of the current node and optimize away
++   all the NOTHINGs from it.
++ */
++STATIC void
++S_rck_elide_nothing(pTHX_ regnode *node)
++{
++    dVAR;
++
++    PERL_ARGS_ASSERT_RCK_ELIDE_NOTHING;
++
++    if (OP(node) != CURLYX) {
++        const int max = (reg_off_by_arg[OP(node)]
++                        ? I32_MAX
++                          /* I32 may be smaller than U16 on CRAYs! */
++                        : (I32_MAX < U16_MAX ? I32_MAX : U16_MAX));
++        int off = (reg_off_by_arg[OP(node)] ? ARG(node) : NEXT_OFF(node));
++        int noff;
++        regnode *n = node;
++
++        /* Skip NOTHING and LONGJMP. */
++        while (
++            (n = regnext(n))
++            && (
++                (PL_regkind[OP(n)] == NOTHING && (noff = NEXT_OFF(n)))
++                || ((OP(n) == LONGJMP) && (noff = ARG(n)))
++            )
++            && off + noff < max
++        ) {
++            off += noff;
++        }
++        if (reg_off_by_arg[OP(node)])
++            ARG(node) = off;
++        else
++            NEXT_OFF(node) = off;
++    }
++    return;
++}
++
+ /* the return from this sub is the minimum length that could possibly match */
+ STATIC SSize_t
+ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regnode **scanp,
+@@ -4550,28 +4588,10 @@ S_study_chunk(pTHX_ RExC_state_t *pRExC_state, regnode **scanp,
+          */
+         JOIN_EXACT(scan,&min_subtract, &unfolded_multi_char, 0);
+ 
+-	/* Follow the next-chain of the current node and optimize
+-	   away all the NOTHINGs from it.  */
+-	if (OP(scan) != CURLYX) {
+-	    const int max = (reg_off_by_arg[OP(scan)]
+-		       ? I32_MAX
+-		       /* I32 may be smaller than U16 on CRAYs! */
+-		       : (I32_MAX < U16_MAX ? I32_MAX : U16_MAX));
+-	    int off = (reg_off_by_arg[OP(scan)] ? ARG(scan) : NEXT_OFF(scan));
+-	    int noff;
+-	    regnode *n = scan;
+-
+-	    /* Skip NOTHING and LONGJMP. */
+-	    while ((n = regnext(n))
+-		   && ((PL_regkind[OP(n)] == NOTHING && (noff = NEXT_OFF(n)))
+-		       || ((OP(n) == LONGJMP) && (noff = ARG(n))))
+-		   && off + noff < max)
+-		off += noff;
+-	    if (reg_off_by_arg[OP(scan)])
+-		ARG(scan) = off;
+-	    else
+-		NEXT_OFF(scan) = off;
+-	}
++        /* Follow the next-chain of the current node and optimize
++           away all the NOTHINGs from it.
++         */
++        rck_elide_nothing(scan);
+ 
+ 	/* The principal pseudo-switch.  Cannot be a switch, since we
+ 	   look into several different things.  */
+@@ -5745,11 +5765,7 @@ Perl_re_printf( aTHX_  "LHS=%" UVuf " RHS=%" UVuf "\n",
+ 		if (data && (fl & SF_HAS_EVAL))
+ 		    data->flags |= SF_HAS_EVAL;
+ 	      optimize_curly_tail:
+-		if (OP(oscan) != CURLYX) {
+-		    while (PL_regkind[OP(next = regnext(oscan))] == NOTHING
+-			   && NEXT_OFF(next))
+-			NEXT_OFF(oscan) += NEXT_OFF(next);
+-		}
++		rck_elide_nothing(oscan);
+ 		continue;
+ 
+ 	    default:
diff --git a/meta/recipes-devtools/perl/files/CVE-2020-10878_2.patch b/meta/recipes-devtools/perl/files/CVE-2020-10878_2.patch
new file mode 100644
index 0000000000..0bacd6b192
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2020-10878_2.patch
@@ -0,0 +1,36 @@
+From 3295b48defa0f8570114877b063fe546dd348b3c Mon Sep 17 00:00:00 2001
+From: Karl Williamson <khw@cpan.org>
+Date: Thu, 20 Feb 2020 17:49:36 +0000
+Subject: [PATCH] regcomp: use long jumps if there is any possibility of
+ overflow
+
+(CVE-2020-10878) Be conservative for backporting, we'll aim to do
+something more aggressive for bleadperl.
+
+(cherry picked from commit 9d7759db46f3b31b1d3f79c44266b6ba42a47fc6)
+
+Upstream-Status: Backport [https://github.com/perl/perl5/commit/3295b48defa0f8570114877b063fe546dd348b3c] 
+CVE: CVE-2020-10878
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ regcomp.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/regcomp.c b/regcomp.c
+index 4ba2980db66..73c35a67020 100644
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -7762,6 +7762,13 @@ Perl_re_op_compile(pTHX_ SV ** const patternp, int pat_count,
+ 
+         /* We have that number in RExC_npar */
+         RExC_total_parens = RExC_npar;
++
++        /* XXX For backporting, use long jumps if there is any possibility of
++         * overflow */
++        if (RExC_size > U16_MAX && ! RExC_use_BRANCHJ) {
++            RExC_use_BRANCHJ = TRUE;
++            flags |= RESTART_PARSE;
++        }
+     }
+     else if (! MUST_RESTART(flags)) {
+ 	ReREFCNT_dec(Rx);
diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 149885f692..b633acfcea 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -23,6 +23,9 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch \
            file://determinism.patch  \
            file://racefix.patch \
+           file://CVE-2020-10543.patch \
+           file://CVE-2020-10878_1.patch \
+           file://CVE-2020-10878_2.patch \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.25.4

