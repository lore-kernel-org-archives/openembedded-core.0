Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id A0EBD60557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:26:56 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id a2so10951543pfo.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=KbhInj59GMsmCYqrUq1rG4v/Fsk73w3FuMJ+I7eMw4w=;
	b=JrP6abUTZxL/C8s9Vb5etwPa1YzUGNuzYjuyUJ/Sx4UuBXW2g70Y/wFgUZ+yIEP37N
	+/HQSy6+ZUoxLvCawE4sQFIKtkNNo9Y/WWcPpAV2kPYLIrroU0qCXt0UJUaavc+VkU5E
	1jeJNrFLOJ6h0R+oOAebYx3xr/1PB55SvzoAZiVD+5IhxMlnBlSQ3s59VmKr0s4jnuxn
	7WSCtzbUo7FCbrIy8EmrLi72qApto8d/N3i8NjFcj2uKVpq4oaEpO5BTmJG1crCpKzy+
	k0ji6U1z714xk3iEgODU0+JElP2YJ6JCbk180SBcgbN/j/IhTSUv0xo/+j6WvzSFGfQz
	GxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=KbhInj59GMsmCYqrUq1rG4v/Fsk73w3FuMJ+I7eMw4w=;
	b=tKlyYQJScmBaqvJyFpwDdqlYqTU9l8Vmf6+xhsKhPBlEZu7C4suXTKAeAtetLj6+TS
	AMtHQDd8DwLhVFEHrcpWaNAltoFlbYRYuJ3XjYCfNeg8krDJrzObgXricmF3bogI1K0r
	xrapguLVTlxGtD9KFg45FkJMjk2XrhvrWGN/EKlb4xM0Tfz9RnkJV/7Rxxo1X2pJrfNe
	VFLFAQspYd9LQ2aj9/WbZrqhOiMrrud+MEj13nVK6743buxkKQ1ayP7cJmF1BLsN6Z6W
	Tun7wmDckKKOrbiqWqu24rZdOBnnS4EzhvDyNF3xyurkdLlSex8nfphB60fXzhwuFR61
	NJIw==
X-Gm-Message-State: APjAAAWy/2tX8BAeHQuF/kpWaXjh5fIXj0AG+D9VZT6kS7wFW4OZg16G
	p+vcAw4NRul6qReNLUexyK/xclXUdXQ=
X-Google-Smtp-Source: APXvYqx6/h+nOzyrxoMA36/B6EAbrGUtNOoL138muyniVvNV9c9nNGbjDRQgqdv4KmsCwUL60DuxAQ==
X-Received: by 2002:a62:1cf:: with SMTP id 198mr40513242pfb.31.1570548416859; 
	Tue, 08 Oct 2019 08:26:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	x18sm18420763pge.76.2019.10.08.08.26.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:26:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:26:38 -0700
Message-Id: <cffd085ef77d055e5e837887b0eaf820aa982f00.1570548180.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1570548180.git.akuster808@gmail.com>
References: <cover.1570548180.git.akuster808@gmail.com>
Subject: [thud 06/12] perl: Fix CVE-2018-18311 to 18314
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
X-List-Received-Date: Tue, 08 Oct 2019 15:26:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dan Tran <dantran@microsoft.com>

Signed-off-by: Dan Tran <dantran@microsoft.com>
[Perl before 5.26.3 and 5.28.x before 5.28.1]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../perl/perl/CVE-2018-18311.patch                 | 183 ++++++++++++++
 .../perl/perl/CVE-2018-18312.patch                 | Bin 0 -> 2125 bytes
 .../perl/perl/CVE-2018-18313.patch                 |  60 +++++
 .../perl/perl/CVE-2018-18314.patch                 | 271 +++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.4.bb          |   4 +
 5 files changed, 518 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-18311.patch
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-18312.patch
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-18313.patch
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-18314.patch

diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-18311.patch b/meta/recipes-devtools/perl/perl/CVE-2018-18311.patch
new file mode 100644
index 0000000..ba8cf15
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/CVE-2018-18311.patch
@@ -0,0 +1,183 @@
+From 4706b65d7c835c0bb219db160fbcdbcd98efab2d Mon Sep 17 00:00:00 2001
+From: David Mitchell <davem@iabyn.com>
+Date: Fri, 29 Jun 2018 13:37:03 +0100
+Subject: [PATCH] Perl_my_setenv(); handle integer wrap
+
+RT #133204
+
+Wean this function off int/I32 and onto UV/Size_t.
+Also, replace all malloc-ish calls with a wrapper that does
+overflow checks,
+
+In particular, it was doing (nlen + vlen + 2) which could wrap when
+the combined length of the environment variable name and value
+exceeded around 0x7fffffff.
+
+The wrapper check function is probably overkill, but belt and braces...
+
+NB this function has several variant parts, #ifdef'ed by platform
+type; I have blindly changed the parts that aren't compiled under linux.
+
+(cherry picked from commit 34716e2a6ee2af96078d62b065b7785c001194be)
+
+CVE: CVE-2018-18311
+Upstream-Status: Backport
+[https://perl5.git.perl.org/perl.git/commit/5737d31aac51360cc1eb412ef059e36147c9d6d6]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ util.c | 76 ++++++++++++++++++++++++++++++++++++++++------------------
+ 1 file changed, 53 insertions(+), 23 deletions(-)
+
+diff --git a/util.c b/util.c
+index 7c3d271f51..27f4eddf3b 100644
+--- a/util.c
++++ b/util.c
+@@ -2160,8 +2160,40 @@ Perl_new_warnings_bitfield(pTHX_ STRLEN *buffer, const char *const bits,
+    *(s+(nlen+1+vlen)) = '\0'
+ 
+ #ifdef USE_ENVIRON_ARRAY
+-       /* VMS' my_setenv() is in vms.c */
++
++/* small wrapper for use by Perl_my_setenv that mallocs, or reallocs if
++ * 'current' is non-null, with up to three sizes that are added together.
++ * It handles integer overflow.
++ */
++static char *
++S_env_alloc(void *current, Size_t l1, Size_t l2, Size_t l3, Size_t size)
++{
++    void *p;
++    Size_t sl, l = l1 + l2;
++
++    if (l < l2)
++        goto panic;
++    l += l3;
++    if (l < l3)
++        goto panic;
++    sl = l * size;
++    if (sl < l)
++        goto panic;
++
++    p = current
++            ? safesysrealloc(current, sl)
++            : safesysmalloc(sl);
++    if (p)
++        return (char*)p;
++
++  panic:
++    croak_memory_wrap();
++}
++
++
++/* VMS' my_setenv() is in vms.c */
+ #if !defined(WIN32) && !defined(NETWARE)
++
+ void
+ Perl_my_setenv(pTHX_ const char *nam, const char *val)
+ {
+@@ -2177,28 +2209,27 @@ Perl_my_setenv(pTHX_ const char *nam, const char *val)
+ #ifndef PERL_USE_SAFE_PUTENV
+     if (!PL_use_safe_putenv) {
+         /* most putenv()s leak, so we manipulate environ directly */
+-        I32 i;
+-        const I32 len = strlen(nam);
+-        int nlen, vlen;
++        UV i;
++        Size_t vlen, nlen = strlen(nam);
+ 
+         /* where does it go? */
+         for (i = 0; environ[i]; i++) {
+-            if (strnEQ(environ[i],nam,len) && environ[i][len] == '=')
++            if (strnEQ(environ[i], nam, nlen) && environ[i][nlen] == '=')
+                 break;
+         }
+ 
+         if (environ == PL_origenviron) {   /* need we copy environment? */
+-            I32 j;
+-            I32 max;
++            UV j, max;
+             char **tmpenv;
+ 
+             max = i;
+             while (environ[max])
+                 max++;
+-            tmpenv = (char**)safesysmalloc((max+2) * sizeof(char*));
++            /* XXX shouldn't that be max+1 rather than max+2 ??? - DAPM */
++            tmpenv = (char**)S_env_alloc(NULL, max, 2, 0, sizeof(char*));
+             for (j=0; j<max; j++) {         /* copy environment */
+-                const int len = strlen(environ[j]);
+-                tmpenv[j] = (char*)safesysmalloc((len+1)*sizeof(char));
++                const Size_t len = strlen(environ[j]);
++                tmpenv[j] = S_env_alloc(NULL, len, 1, 0, 1);
+                 Copy(environ[j], tmpenv[j], len+1, char);
+             }
+             tmpenv[max] = NULL;
+@@ -2217,15 +2248,15 @@ Perl_my_setenv(pTHX_ const char *nam, const char *val)
+ #endif
+         }
+         if (!environ[i]) {                 /* does not exist yet */
+-            environ = (char**)safesysrealloc(environ, (i+2) * sizeof(char*));
++            environ = (char**)S_env_alloc(environ, i, 2, 0, sizeof(char*));
+             environ[i+1] = NULL;    /* make sure it's null terminated */
+         }
+         else
+             safesysfree(environ[i]);
+-        nlen = strlen(nam);
++
+         vlen = strlen(val);
+ 
+-        environ[i] = (char*)safesysmalloc((nlen+vlen+2) * sizeof(char));
++        environ[i] = S_env_alloc(NULL, nlen, vlen, 2, 1);
+         /* all that work just for this */
+         my_setenv_format(environ[i], nam, nlen, val, vlen);
+     } else {
+@@ -2250,22 +2281,21 @@ Perl_my_setenv(pTHX_ const char *nam, const char *val)
+             if (environ) /* old glibc can crash with null environ */
+                 (void)unsetenv(nam);
+         } else {
+-	    const int nlen = strlen(nam);
+-	    const int vlen = strlen(val);
+-	    char * const new_env =
+-                (char*)safesysmalloc((nlen + vlen + 2) * sizeof(char));
++	    const Size_t nlen = strlen(nam);
++	    const Size_t vlen = strlen(val);
++	    char * const new_env = S_env_alloc(NULL, nlen, vlen, 2, 1);
+             my_setenv_format(new_env, nam, nlen, val, vlen);
+             (void)putenv(new_env);
+         }
+ #       else /* ! HAS_UNSETENV */
+         char *new_env;
+-	const int nlen = strlen(nam);
+-	int vlen;
++	const Size_t nlen = strlen(nam);
++	Size_t vlen;
+         if (!val) {
+ 	   val = "";
+         }
+         vlen = strlen(val);
+-        new_env = (char*)safesysmalloc((nlen + vlen + 2) * sizeof(char));
++        new_env = S_env_alloc(NULL, nlen, vlen, 2, 1);
+         /* all that work just for this */
+         my_setenv_format(new_env, nam, nlen, val, vlen);
+         (void)putenv(new_env);
+@@ -2288,14 +2318,14 @@ Perl_my_setenv(pTHX_ const char *nam, const char *val)
+ {
+     dVAR;
+     char *envstr;
+-    const int nlen = strlen(nam);
+-    int vlen;
++    const Size_t nlen = strlen(nam);
++    Size_t vlen;
+ 
+     if (!val) {
+        val = "";
+     }
+     vlen = strlen(val);
+-    Newx(envstr, nlen+vlen+2, char);
++    envstr = S_env_alloc(NULL, nlen, vlen, 2, 1);
+     my_setenv_format(envstr, nam, nlen, val, vlen);
+     (void)PerlEnv_putenv(envstr);
+     Safefree(envstr);
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-18312.patch b/meta/recipes-devtools/perl/perl/CVE-2018-18312.patch
new file mode 100644
index 0000000000000000000000000000000000000000..1c3426542d7907ed0e5ab34621589bc3bbc5612d
GIT binary patch
literal 2125
zcmd5-S##Sq5Y97y#YS$2;z%Sxh~i}{w(BI5PNvh2?X;b-WDP`sN5Vq|As<uczjr|?
zzMAx*PoYR)vD*C>djW4{TZ12mg8G4o<CuHC$k>WUl%#&RBHo1i0SWmko%lZd(l&4=
z*5HLeNYcMR3Gs}#2$R5jCM)=(tg4dL9f}@&Dz1;xHEWz!=C6#`Oo>EejDh++4kca$
zo|jDh#P`4^0U^fOX7y2|DuIjNj?Yitf#*&Z(38ko3$(E3O(s4?Zq`beIy8Wqm5nlt
zli%MYfP<}ZZ7-U5)cCOOloYJC&lFReE`gs|`f1%tWn2_Wt-Hi^HR#mIOXX-v@3m)X
zj+?f1jnkB8JdS*t(TLzX35cI&Q!gZ5z<o}pUPLKwK3EvWS(!J2+ijNFtJ?%#vj)y3
z4hNhy3W=k-Ol8}(nQ{>Pm0{bq0aE0+SUV|fpF6;C7@%A!@XeRC=yFHF9ZX@Q9|I_4
zWhFXD3)bX<kMW<f>4a2e+jPT`HAVz3Dxudy+cFGZW*OKvIt5H)?(D4|XrpYnxB<a4
zCgL>9xZ@DQX~1I|6Y$VI-`CrHtZ(3E;4#M05!jv|g>)RkXiEfuOeuJ~Og9quD-&bq
z=F{o)&CSVj&15G=qy4Xouui);{BZK_`1JUE_@H6IYzC%fTBvB)PjR=a2ib3;_aa%v
z@(yOuu`99c7vI=R-l`Tb`n(d$7Aps-uSkA=8u;fKUAfOVyCjf^$0VJmK5?928cpJm
zr8In+gy)*uR6OVEgv66^03#eDor?MvekjVkSk~o@;7eZWnwY`RJT{?HU=q`ULp?zP
z$U~>JM%q?wvn;ScFg9z64VS^-M?(J`jG>i$I7kLM_*zu4)qe@jRWE6bwCrk=Z`&DR
z2gAdQ;o)V1(|kU^A!K1$^Z7zkcl6@&5~+xM58uK%b>{ORB!hhedvR}1fAC)1+E=XF
z2w1aHcF<;!wp_SEN<64`D^LYf&=u{b;#fUb0y3sp1-($`^k6z=G>CQ1Xy}dOUDA%Y
zV5)!_wub5IP+9iNh2@$sdj;mtjc#b{cLCyNEk)O1<HL2Sin4*ZiQ=%Z<|h2T_ZjM~
zHj-O_vF?z)`_q*Ml=zD;R$dOR|8E49(TdjZZ9KK&KUg`K?c6vMe{DpQ3K$+bjss1r
zKnYow4c;C6e)9)2M7_uSceg+CCBj2`VT@qlK9rg}&><WAx^3D%NN5Q#YN_C5lSALm
z3X}E_tuJNyqOVEq)Qj)5Cf&gpixSJSKMOIh=Y{A5Few19k&fkfYxG5^IoC`!=y3<v
yg=qS4<8@i4Y9B8TU2Ge?5+s-#1dsv`e=w*+sY9HrtaCj4O+zPNvCIq7$oL1o#ZxZ;

literal 0
HcmV?d00001

diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-18313.patch b/meta/recipes-devtools/perl/perl/CVE-2018-18313.patch
new file mode 100644
index 0000000..540aa07
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/CVE-2018-18313.patch
@@ -0,0 +1,60 @@
+From 3458f6115ca8e8d11779948c12b7e1cc5803358c Mon Sep 17 00:00:00 2001
+From: Karl Williamson <khw@cpan.org>
+Date: Sat, 25 Mar 2017 15:00:22 -0600
+Subject: [PATCH 2/3] regcomp.c: Convert some strchr to memchr
+
+This allows things to work properly in the face of embedded NULs.
+See the branch merge message for more information.
+
+(cherry picked from commit 43b2f4ef399e2fd7240b4eeb0658686ad95f8e62)
+
+CVE: CVE-2018-18313
+Upstream-Status: Backport
+[https://perl5.git.perl.org/perl.git/commit/c1c28ce6ba90ee05aa96b11ad551a6063680f3b9]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ regcomp.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/regcomp.c b/regcomp.c
+index 00d26d9290..2688979882 100644
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -11783,8 +11783,9 @@ S_grok_bslash_N(pTHX_ RExC_state_t *pRExC_state,
+ 
+     RExC_parse++;	/* Skip past the '{' */
+ 
+-    if (! (endbrace = strchr(RExC_parse, '}'))  /* no trailing brace */
+-	|| ! (endbrace == RExC_parse		/* nothing between the {} */
++    endbrace = (char *) memchr(RExC_parse, '}', RExC_end - RExC_parse);
++    if ((! endbrace) /* no trailing brace */
++	    || ! (endbrace == RExC_parse		/* nothing between the {} */
+               || (endbrace - RExC_parse >= 2	/* U+ (bad hex is checked... */
+                   && strnEQ(RExC_parse, "U+", 2)))) /* ... below for a better
+                                                        error msg) */
+@@ -12483,9 +12484,11 @@ S_regatom(pTHX_ RExC_state_t *pRExC_state, I32 *flagp, U32 depth)
+             else {
+                 STRLEN length;
+                 char name = *RExC_parse;
+-                char * endbrace;
++                char * endbrace = NULL;
+                 RExC_parse += 2;
+-                endbrace = strchr(RExC_parse, '}');
++                if (RExC_parse < RExC_end) {
++                    endbrace = (char *) memchr(RExC_parse, '}', RExC_end - RExC_parse);
++                }
+ 
+                 if (! endbrace) {
+                     vFAIL2("Missing right brace on \\%c{}", name);
+@@ -15939,7 +15942,7 @@ S_regclass(pTHX_ RExC_state_t *pRExC_state, I32 *flagp, U32 depth,
+ 		    vFAIL2("Empty \\%c", (U8)value);
+ 		if (*RExC_parse == '{') {
+ 		    const U8 c = (U8)value;
+-		    e = strchr(RExC_parse, '}');
++		    e = (char *) memchr(RExC_parse, '}', RExC_end - RExC_parse);
+                     if (!e) {
+                         RExC_parse++;
+                         vFAIL2("Missing right brace on \\%c{}", c);
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-18314.patch b/meta/recipes-devtools/perl/perl/CVE-2018-18314.patch
new file mode 100644
index 0000000..e84e7bc
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/CVE-2018-18314.patch
@@ -0,0 +1,271 @@
+From 6a2d07f43ae7cfcb2eb30cf39751f2f7fed7ecc1 Mon Sep 17 00:00:00 2001
+From: Yves Orton <demerphq@gmail.com>
+Date: Mon, 26 Jun 2017 13:19:55 +0200
+Subject: [PATCH 3/3] fix #131649 - extended charclass can trigger assert
+
+The extended charclass parser makes some assumptions during the
+first pass which are only true on well structured input, and it
+does not properly catch various errors. later on the code assumes
+that things the first pass will let through are valid, when in
+fact they should trigger errors.
+
+(cherry picked from commit 19a498a461d7c81ae3507c450953d1148efecf4f)
+
+CVE: CVE-2018-18314
+Upstream-Status: Backport
+[https://perl5.git.perl.org/perl.git/commit/dabe076af345ab4512ea80245b4e4cd7ec0996cd]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ pod/perldiag.pod        | 27 ++++++++++++++++++++++++++-
+ pod/perlrecharclass.pod |  4 ++--
+ regcomp.c               | 23 +++++++++++++----------
+ t/lib/warnings/regcomp  |  6 +++---
+ t/re/reg_mesg.t         | 29 ++++++++++++++++-------------
+ t/re/regex_sets.t       |  6 +++---
+ 6 files changed, 63 insertions(+), 32 deletions(-)
+
+diff --git a/pod/perldiag.pod b/pod/perldiag.pod
+index 737d3633f6..644b814008 100644
+--- a/pod/perldiag.pod
++++ b/pod/perldiag.pod
+@@ -5777,7 +5777,7 @@ yourself.
+ a perl4 interpreter, especially if the next 2 tokens are "use strict"
+ or "my $var" or "our $var".
+ 
+-=item Syntax error in (?[...]) in regex m/%s/
++=item Syntax error in (?[...]) in regex; marked by <-- HERE in m/%s/
+ 
+ (F) Perl could not figure out what you meant inside this construct; this
+ notifies you that it is giving up trying.
+@@ -6153,6 +6153,31 @@ for example,
+ (F) The unexec() routine failed for some reason.  See your local FSF
+ representative, who probably put it there in the first place.
+ 
++=item Unexpected ']' with no following ')' in (?[... in regex; marked by <-- HERE in m/%s/
++
++(F) While parsing an extended character class a ']' character was encountered
++at a point in the definition where the only legal use of ']' is to close the
++character class definition as part of a '])', you may have forgotten the close
++paren, or otherwise confused the parser.
++
++=item Expecting close paren for nested extended charclass in regex; marked by <-- HERE in m/%s/
++
++(F) While parsing a nested extended character class like:
++
++    (?[ ... (?flags:(?[ ... ])) ... ])
++                             ^
++
++we expected to see a close paren ')' (marked by ^) but did not.
++
++=item Expecting close paren for wrapper for nested extended charclass in regex; marked by <-- HERE in m/%s/
++
++(F) While parsing a nested extended character class like:
++
++    (?[ ... (?flags:(?[ ... ])) ... ])
++                              ^
++
++we expected to see a close paren ')' (marked by ^) but did not.
++
+ =item Unexpected binary operator '%c' with no preceding operand in regex;
+ marked by S<<-- HERE> in m/%s/
+ 
+diff --git a/pod/perlrecharclass.pod b/pod/perlrecharclass.pod
+index 89f4a7ef3f..a557cc0384 100644
+--- a/pod/perlrecharclass.pod
++++ b/pod/perlrecharclass.pod
+@@ -1101,8 +1101,8 @@ hence both of the following work:
+ Any contained POSIX character classes, including things like C<\w> and C<\D>
+ respect the C<E<sol>a> (and C<E<sol>aa>) modifiers.
+ 
+-C<< (?[ ]) >> is a regex-compile-time construct.  Any attempt to use
+-something which isn't knowable at the time the containing regular
++Note that C<< (?[ ]) >> is a regex-compile-time construct.  Any attempt
++to use something which isn't knowable at the time the containing regular
+ expression is compiled is a fatal error.  In practice, this means
+ just three limitations:
+ 
+diff --git a/regcomp.c b/regcomp.c
+index 2688979882..cb8409ed27 100644
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -14609,8 +14609,9 @@ S_handle_regex_sets(pTHX_ RExC_state_t *pRExC_state, SV** return_invlist,
+                                     TRUE /* Force /x */ );
+ 
+             switch (*RExC_parse) {
+-                case '?':
+-                    if (RExC_parse[1] == '[') depth++, RExC_parse++;
++                case '(':
++                    if (RExC_parse[1] == '?' && RExC_parse[2] == '[')
++                        depth++, RExC_parse+=2;
+                     /* FALLTHROUGH */
+                 default:
+                     break;
+@@ -14667,9 +14668,9 @@ S_handle_regex_sets(pTHX_ RExC_state_t *pRExC_state, SV** return_invlist,
+                 }
+ 
+                 case ']':
+-                    if (depth--) break;
+-                    RExC_parse++;
+-                    if (*RExC_parse == ')') {
++                    if (RExC_parse[1] == ')') {
++                        RExC_parse++;
++                        if (depth--) break;
+                         node = reganode(pRExC_state, ANYOF, 0);
+                         RExC_size += ANYOF_SKIP;
+                         nextchar(pRExC_state);
+@@ -14681,20 +14682,20 @@ S_handle_regex_sets(pTHX_ RExC_state_t *pRExC_state, SV** return_invlist,
+ 
+                         return node;
+                     }
+-                    goto no_close;
++                    RExC_parse++;
++                    vFAIL("Unexpected ']' with no following ')' in (?[...");
+             }
+ 
+             RExC_parse += UTF ? UTF8SKIP(RExC_parse) : 1;
+         }
+ 
+-      no_close:
+         /* We output the messages even if warnings are off, because we'll fail
+          * the very next thing, and these give a likely diagnosis for that */
+         if (posix_warnings && av_tindex_nomg(posix_warnings) >= 0) {
+             output_or_return_posix_warnings(pRExC_state, posix_warnings, NULL);
+         }
+ 
+-        FAIL("Syntax error in (?[...])");
++        vFAIL("Syntax error in (?[...])");
+     }
+ 
+     /* Pass 2 only after this. */
+@@ -14868,12 +14869,14 @@ redo_curchar:
+                      * inversion list, and RExC_parse points to the trailing
+                      * ']'; the next character should be the ')' */
+                     RExC_parse++;
+-                    assert(UCHARAT(RExC_parse) == ')');
++                    if (UCHARAT(RExC_parse) != ')')
++                        vFAIL("Expecting close paren for nested extended charclass");
+ 
+                     /* Then the ')' matching the original '(' handled by this
+                      * case: statement */
+                     RExC_parse++;
+-                    assert(UCHARAT(RExC_parse) == ')');
++                    if (UCHARAT(RExC_parse) != ')')
++                        vFAIL("Expecting close paren for wrapper for nested extended charclass");
+ 
+                     RExC_flags = save_flags;
+                     goto handle_operand;
+diff --git a/t/lib/warnings/regcomp b/t/lib/warnings/regcomp
+index 08cb27b00f..367276d0fc 100644
+--- a/t/lib/warnings/regcomp
++++ b/t/lib/warnings/regcomp
+@@ -59,21 +59,21 @@ Unmatched [ in regex; marked by <-- HERE in m/abc[ <-- HERE ﬁ[.00./ at - line
+ qr/(?[[[:word]]])/;
+ EXPECT
+ Assuming NOT a POSIX class since there is no terminating ':' in regex; marked by <-- HERE in m/(?[[[:word <-- HERE ]]])/ at - line 2.
+-syntax error in (?[...]) in regex m/(?[[[:word]]])/ at - line 2.
++Unexpected ']' with no following ')' in (?[... in regex; marked by <-- HERE in m/(?[[[:word]] <-- HERE ])/ at - line 2.
+ ########
+ # NAME qr/(?[ [[:digit: ])/
+ # OPTION fatal
+ qr/(?[[[:digit: ])/;
+ EXPECT
+ Assuming NOT a POSIX class since no blanks are allowed in one in regex; marked by <-- HERE in m/(?[[[:digit: ] <-- HERE )/ at - line 2.
+-syntax error in (?[...]) in regex m/(?[[[:digit: ])/ at - line 2.
++syntax error in (?[...]) in regex; marked by <-- HERE in m/(?[[[:digit: ]) <-- HERE / at - line 2.
+ ########
+ # NAME qr/(?[ [:digit: ])/
+ # OPTION fatal
+ qr/(?[[:digit: ])/
+ EXPECT
+ Assuming NOT a POSIX class since no blanks are allowed in one in regex; marked by <-- HERE in m/(?[[:digit: ] <-- HERE )/ at - line 2.
+-syntax error in (?[...]) in regex m/(?[[:digit: ])/ at - line 2.
++syntax error in (?[...]) in regex; marked by <-- HERE in m/(?[[:digit: ]) <-- HERE / at - line 2.
+ ########
+ # NAME [perl #126141]
+ # OPTION fatal
+diff --git a/t/re/reg_mesg.t b/t/re/reg_mesg.t
+index 658397ac27..08a3688e1d 100644
+--- a/t/re/reg_mesg.t
++++ b/t/re/reg_mesg.t
+@@ -202,8 +202,9 @@ my @death =
+  '/\b{gc}/' => "'gc' is an unknown bound type {#} m/\\b{gc{#}}/",
+  '/\B{gc}/' => "'gc' is an unknown bound type {#} m/\\B{gc{#}}/",
+ 
+- '/(?[[[::]]])/' => "Syntax error in (?[...]) in regex m/(?[[[::]]])/",
+- '/(?[[[:w:]]])/' => "Syntax error in (?[...]) in regex m/(?[[[:w:]]])/",
++
++ '/(?[[[::]]])/' => "Unexpected ']' with no following ')' in (?[... {#} m/(?[[[::]]{#}])/",
++ '/(?[[[:w:]]])/' => "Unexpected ']' with no following ')' in (?[... {#} m/(?[[[:w:]]{#}])/",
+  '/(?[[:w:]])/' => "",
+  '/[][[:alpha:]]' => "",    # [perl #127581]
+  '/([.].*)[.]/'   => "",    # [perl #127582]
+@@ -227,11 +228,12 @@ my @death =
+  '/(?[ \p{foo} ])/' => 'Can\'t find Unicode property definition "foo" {#} m/(?[ \p{foo}{#} ])/',
+  '/(?[ \p{ foo = bar } ])/' => 'Can\'t find Unicode property definition "foo = bar" {#} m/(?[ \p{ foo = bar }{#} ])/',
+  '/(?[ \8 ])/' => 'Unrecognized escape \8 in character class {#} m/(?[ \8{#} ])/',
+- '/(?[ \t ]/' => 'Syntax error in (?[...]) in regex m/(?[ \t ]/',
+- '/(?[ [ \t ]/' => 'Syntax error in (?[...]) in regex m/(?[ [ \t ]/',
+- '/(?[ \t ] ]/' => 'Syntax error in (?[...]) in regex m/(?[ \t ] ]/',
+- '/(?[ [ ] ]/' => 'Syntax error in (?[...]) in regex m/(?[ [ ] ]/',
+- '/(?[ \t + \e # This was supposed to be a comment ])/' => 'Syntax error in (?[...]) in regex m/(?[ \t + \e # This was supposed to be a comment ])/',
++ '/(?[ \t ]/' => "Unexpected ']' with no following ')' in (?[... {#} m/(?[ \\t ]{#}/",
++ '/(?[ [ \t ]/' => "Syntax error in (?[...]) {#} m/(?[ [ \\t ]{#}/",
++ '/(?[ \t ] ]/' => "Unexpected ']' with no following ')' in (?[... {#} m/(?[ \\t ]{#} ]/",
++ '/(?[ [ ] ]/' => "Syntax error in (?[...]) {#} m/(?[ [ ] ]{#}/",
++ '/(?[ \t + \e # This was supposed to be a comment ])/' =>
++    "Syntax error in (?[...]) {#} m/(?[ \\t + \\e # This was supposed to be a comment ]){#}/",
+  '/(?[ ])/' => 'Incomplete expression within \'(?[ ])\' {#} m/(?[ {#}])/',
+  'm/(?[[a-\d]])/' => 'False [] range "a-\d" {#} m/(?[[a-\d{#}]])/',
+  'm/(?[[\w-x]])/' => 'False [] range "\w-" {#} m/(?[[\w-{#}x]])/',
+@@ -410,10 +412,10 @@ my @death_utf8 = mark_as_utf8(
+ 
+  '/ネ\p{}ネ/' => 'Empty \p{} {#} m/ネ\p{{#}}ネ/',
+ 
+- '/ネ(?[[[:ネ]]])ネ/' => "Syntax error in (?[...]) in regex m/ネ(?[[[:ネ]]])ネ/",
+- '/ネ(?[[[:ネ: ])ネ/' => "Syntax error in (?[...]) in regex m/ネ(?[[[:ネ: ])ネ/",
+- '/ネ(?[[[::]]])ネ/' => "Syntax error in (?[...]) in regex m/ネ(?[[[::]]])ネ/",
+- '/ネ(?[[[:ネ:]]])ネ/' => "Syntax error in (?[...]) in regex m/ネ(?[[[:ネ:]]])ネ/",
++ '/ネ(?[[[:ネ]]])ネ/' => "Unexpected ']' with no following ')' in (?[... {#} m/ネ(?[[[:ネ]]{#}])ネ/",
++ '/ネ(?[[[:ネ: ])ネ/' => "Syntax error in (?[...]) {#} m/ネ(?[[[:ネ: ])ネ{#}/",
++ '/ネ(?[[[::]]])ネ/' => "Unexpected ']' with no following ')' in (?[... {#} m/ネ(?[[[::]]{#}])ネ/",
++ '/ネ(?[[[:ネ:]]])ネ/' => "Unexpected ']' with no following ')' in (?[... {#} m/ネ(?[[[:ネ:]]{#}])ネ/",
+  '/ネ(?[[:ネ:]])ネ/' => "",
+  '/ネ(?[ネ])ネ/' =>  'Unexpected character {#} m/ネ(?[ネ{#}])ネ/',
+  '/ネ(?[ + [ネ] ])/' => 'Unexpected binary operator \'+\' with no preceding operand {#} m/ネ(?[ +{#} [ネ] ])/',
+@@ -426,8 +428,9 @@ my @death_utf8 = mark_as_utf8(
+  '/(?[ \x{ネ} ])ネ/' => 'Non-hex character {#} m/(?[ \x{ネ{#}} ])ネ/',
+  '/(?[ \p{ネ} ])/' => 'Can\'t find Unicode property definition "ネ" {#} m/(?[ \p{ネ}{#} ])/',
+  '/(?[ \p{ ネ = bar } ])/' => 'Can\'t find Unicode property definition "ネ = bar" {#} m/(?[ \p{ ネ = bar }{#} ])/',
+- '/ネ(?[ \t ]/' => 'Syntax error in (?[...]) in regex m/ネ(?[ \t ]/',
+- '/(?[ \t + \e # ネ This was supposed to be a comment ])/' => 'Syntax error in (?[...]) in regex m/(?[ \t + \e # ネ This was supposed to be a comment ])/',
++ '/ネ(?[ \t ]/' => "Unexpected ']' with no following ')' in (?[... {#} m/ネ(?[ \\t ]{#}/",
++ '/(?[ \t + \e # ネ This was supposed to be a comment ])/' =>
++    "Syntax error in (?[...]) {#} m/(?[ \\t + \\e # ネ This was supposed to be a comment ]){#}/",
+  'm/(*ネ)ネ/' => q<Unknown verb pattern 'ネ' {#} m/(*ネ){#}ネ/>,
+  '/\cネ/' => "Character following \"\\c\" must be printable ASCII",
+  '/\b{ネ}/' => "'ネ' is an unknown bound type {#} m/\\b{ネ{#}}/",
+diff --git a/t/re/regex_sets.t b/t/re/regex_sets.t
+index 92875677be..60a126ba3c 100644
+--- a/t/re/regex_sets.t
++++ b/t/re/regex_sets.t
+@@ -157,13 +157,13 @@ for my $char ("٠", "٥", "٩") {
+ 	eval { $_ = '/(?[(\c]) /'; qr/$_/ };
+ 	like($@, qr/^Syntax error/, '/(?[(\c]) / should not panic');
+ 	eval { $_ = '(?[\c#]' . "\n])"; qr/$_/ };
+-	like($@, qr/^Syntax error/, '/(?[(\c]) / should not panic');
++	like($@, qr/^Unexpected/, '/(?[(\c]) / should not panic');
+ 	eval { $_ = '(?[(\c])'; qr/$_/ };
+ 	like($@, qr/^Syntax error/, '/(?[(\c])/ should be a syntax error');
+ 	eval { $_ = '(?[(\c]) ]\b'; qr/$_/ };
+-	like($@, qr/^Syntax error/, '/(?[(\c]) ]\b/ should be a syntax error');
++	like($@, qr/^Unexpected/, '/(?[(\c]) ]\b/ should be a syntax error');
+ 	eval { $_ = '(?[\c[]](])'; qr/$_/ };
+-	like($@, qr/^Syntax error/, '/(?[\c[]](])/ should be a syntax error');
++	like($@, qr/^Unexpected/, '/(?[\c[]](])/ should be a syntax error');
+ 	like("\c#", qr/(?[\c#])/, '\c# should match itself');
+ 	like("\c[", qr/(?[\c[])/, '\c[ should match itself');
+ 	like("\c\ ", qr/(?[\c\])/, '\c\ should match itself');
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.4.bb b/meta/recipes-devtools/perl/perl_5.24.4.bb
index a644970..2f27749 100644
--- a/meta/recipes-devtools/perl/perl_5.24.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.4.bb
@@ -65,6 +65,10 @@ SRC_URI += " \
         file://perl-5.26.1-guard_old_libcrypt_fix.patch \
         file://CVE-2018-12015.patch \
         file://0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch \
+	file://CVE-2018-18311.patch \
+	file://CVE-2018-18312.patch \
+	file://CVE-2018-18313.patch \
+	file://CVE-2018-18314.patch \
 "
 
 # Fix test case issues
-- 
2.7.4


