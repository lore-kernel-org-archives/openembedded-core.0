Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F52F72C9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 07:16:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0J7Gith002787
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 23:16:45 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 18 Jan 2015 23:16:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Jan 2015 23:16:40 -0800
Message-ID: <1931e18bdf1c993d3dbc02140714aa47f9907d9c.1421651689.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421651689.git.liezhi.yang@windriver.com>
References: <cover.1421651689.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] gettext: upgrade to 0.19.4
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
X-List-Received-Date: Mon, 19 Jan 2015 07:16:47 -0000
Content-Type: text/plain

* gettext:
  - Update parallel.patch, we only need a part of it.

* gettext-minimal-native:
  - Update related files from gettext-native.
  - Remove Makevars.template, we didn't use it.
  - Remove iconv-m4-remove-the-test-to-convert-euc-jp.patch (can be
    reverse applied).
  - Update the COPYING (1995 - 2014).

* About upgrade gettext-minimal-native (for future's upgrade):
  - Build gettext-native
  - Copy gettext-runtime/po/Makefile.in.in, build-aux/config.rpath and
    gettext-runtime/po/remove-potcdate.sin from gettext-native.
  - Update COPYING when needed (usually update the year), do not copy
    the whole COPYING file from gettext-native.
  - Go to gettext-native's ${S}/gettext-runtime/m4:
    > Remove lt*.m4 and libtool.m4
    > copy lib-ld.m4 lib-link.m4 lib-prefix.m4 from ${S}/gettext-runtime/m4/
    > tar czvf /path/to/aclocal.tgz *.m4

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../parallel.patch                                 |   13 -----
 .../gettext-minimal-0.18.3.2/Makevars.template     |   53 --------------------
 .../gettext/gettext-minimal-0.18.3.2/aclocal.tgz   |  Bin 37591 -> 0 bytes
 ...conv-m4-remove-the-test-to-convert-euc-jp.patch |   43 ----------------
 .../COPYING                                        |    2 +-
 .../Makefile.in.in                                 |   47 ++++++++++++-----
 .../gettext/gettext-minimal-0.19.4/aclocal.tgz     |  Bin 0 -> 39744 bytes
 .../config.rpath                                   |   18 +++----
 .../remove-potcdate.sin                            |    0
 ....18.3.2.bb => gettext-minimal-native_0.19.4.bb} |    3 +-
 .../{gettext_0.18.3.2.bb => gettext_0.19.4.bb}     |    4 +-
 11 files changed, 44 insertions(+), 139 deletions(-)
 rename meta/recipes-core/gettext/{gettext-0.18.3.2 => gettext-0.19.4}/parallel.patch (58%)
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.3.2/Makevars.template
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.3.2/aclocal.tgz
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.3.2/iconv-m4-remove-the-test-to-convert-euc-jp.patch
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.2 => gettext-minimal-0.19.4}/COPYING (76%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.2 => gettext-minimal-0.19.4}/Makefile.in.in (93%)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.19.4/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.2 => gettext-minimal-0.19.4}/config.rpath (98%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.2 => gettext-minimal-0.19.4}/remove-potcdate.sin (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.18.3.2.bb => gettext-minimal-native_0.19.4.bb} (86%)
 rename meta/recipes-core/gettext/{gettext_0.18.3.2.bb => gettext_0.19.4.bb} (97%)

diff --git a/meta/recipes-core/gettext/gettext-0.18.3.2/parallel.patch b/meta/recipes-core/gettext/gettext-0.19.4/parallel.patch
similarity index 58%
rename from meta/recipes-core/gettext/gettext-0.18.3.2/parallel.patch
rename to meta/recipes-core/gettext/gettext-0.19.4/parallel.patch
index f2c567d..c8e2c94 100644
--- a/meta/recipes-core/gettext/gettext-0.18.3.2/parallel.patch
+++ b/meta/recipes-core/gettext/gettext-0.19.4/parallel.patch
@@ -21,16 +21,3 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  # Which classes to export from the shared library.
  MOOPPFLAGS += --dllexport=styled_ostream
  
---- a/gettext-tools/src/Makefile.am
-+++ b/gettext-tools/src/Makefile.am
-@@ -229,8 +229,8 @@ libgettextsrc_la_LDFLAGS += -Wl,--export
- endif
- 
- # No need to install libgettextsrc.a, except on AIX.
--install-exec-local: install-libLTLIBRARIES install-exec-clean
--install-exec-clean:
-+install-exec-local: install-exec-clean
-+install-exec-clean: install-libLTLIBRARIES
- 	case "@host_os@" in \
- 	  aix*) ;; \
- 	  *) $(RM) $(DESTDIR)$(libdir)/libgettextsrc.a ;; \
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/Makevars.template b/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/Makevars.template
deleted file mode 100644
index 4a9ff7d..0000000
--- a/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/Makevars.template
+++ /dev/null
@@ -1,53 +0,0 @@
-# Makefile variables for PO directory in any package using GNU gettext.
-
-# Usually the message domain is the same as the package name.
-DOMAIN = $(PACKAGE)
-
-# These two variables depend on the location of this directory.
-subdir = po
-top_builddir = ..
-
-# These options get passed to xgettext.
-XGETTEXT_OPTIONS = --keyword=_ --keyword=N_
-
-# This is the copyright holder that gets inserted into the header of the
-# $(DOMAIN).pot file.  Set this to the copyright holder of the surrounding
-# package.  (Note that the msgstr strings, extracted from the package's
-# sources, belong to the copyright holder of the package.)  Translators are
-# expected to transfer the copyright for their translations to this person
-# or entity, or to disclaim their copyright.  The empty string stands for
-# the public domain; in this case the translators are expected to disclaim
-# their copyright.
-COPYRIGHT_HOLDER = Free Software Foundation, Inc.
-
-# This is the email address or URL to which the translators shall report
-# bugs in the untranslated strings:
-# - Strings which are not entire sentences, see the maintainer guidelines
-#   in the GNU gettext documentation, section 'Preparing Strings'.
-# - Strings which use unclear terms or require additional context to be
-#   understood.
-# - Strings which make invalid assumptions about notation of date, time or
-#   money.
-# - Pluralisation problems.
-# - Incorrect English spelling.
-# - Incorrect formatting.
-# It can be your email address, or a mailing list address where translators
-# can write to without being subscribed, or the URL of a web page through
-# which the translators can contact you.
-MSGID_BUGS_ADDRESS =
-
-# This is the list of locale categories, beyond LC_MESSAGES, for which the
-# message catalogs shall be used.  It is usually empty.
-EXTRA_LOCALE_CATEGORIES =
-
-# This tells whether the $(DOMAIN).pot file contains messages with an 'msgctxt'
-# context.  Possible values are "yes" and "no".  Set this to yes if the
-# package uses functions taking also a message context, like pgettext(), or
-# if in $(XGETTEXT_OPTIONS) you define keywords with a context argument.
-USE_MSGCTXT = no
-
-# These options get passed to msgmerge.
-# Useful options are in particular:
-#   --previous            to keep previous msgids of translated messages,
-#   --quiet               to reduce the verbosity.
-MSGMERGE_OPTIONS =
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/aclocal.tgz b/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/aclocal.tgz
deleted file mode 100644
index e0335a3d1c601013c28cf0792805dbadc3b32f89..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 37591
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
P)bsxXEKBuT0MG&e6M>S}

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/iconv-m4-remove-the-test-to-convert-euc-jp.patch b/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/iconv-m4-remove-the-test-to-convert-euc-jp.patch
deleted file mode 100644
index d453a74..0000000
--- a/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/iconv-m4-remove-the-test-to-convert-euc-jp.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 0bfade685783ccd193b2e1b94d0e4ef5ce449432 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Wed, 20 Nov 2013 17:52:50 +0800
-Subject: [PATCH] remove the test to convert euc-jp
-
-Remove the test "Test against HP-UX 11.11 bug:
-No converter from EUC-JP to UTF-8 is provided"
-since we don't support HP-UX and it causes
-guile-native compile failure if the euc-jp is not
-installed on the host
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- iconv.m4 | 11 -----------
- 1 file changed, 11 deletions(-)
-
-diff --git a/iconv.m4 b/iconv.m4
-index a503646..dbe7ca1 100644
---- a/iconv.m4
-+++ b/iconv.m4
-@@ -159,17 +159,6 @@ int main ()
-       }
-   }
- #endif
--  /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
--     provided.  */
--  if (/* Try standardized names.  */
--      iconv_open ("UTF-8", "EUC-JP") == (iconv_t)(-1)
--      /* Try IRIX, OSF/1 names.  */
--      && iconv_open ("UTF-8", "eucJP") == (iconv_t)(-1)
--      /* Try AIX names.  */
--      && iconv_open ("UTF-8", "IBM-eucJP") == (iconv_t)(-1)
--      /* Try HP-UX names.  */
--      && iconv_open ("utf8", "eucJP") == (iconv_t)(-1))
--    result |= 16;
-   return result;
- }]])],
-         [am_cv_func_iconv_works=yes],
---
-1.8.3
-
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/COPYING b/meta/recipes-core/gettext/gettext-minimal-0.19.4/COPYING
similarity index 76%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.3.2/COPYING
rename to meta/recipes-core/gettext/gettext-minimal-0.19.4/COPYING
index 3485c5a..8d11d1d 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/COPYING
+++ b/meta/recipes-core/gettext/gettext-minimal-0.19.4/COPYING
@@ -1,4 +1,4 @@
-dnl Copyright (C) 1997-2010 Free Software Foundation, Inc.
+dnl Copyright (C) 1995-2014 Free Software Foundation, Inc.
 dnl This file is free software; the Free Software Foundation
 dnl gives unlimited permission to copy and/or distribute it,
 dnl with or without modifications, as long as this notice is preserved.
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/Makefile.in.in b/meta/recipes-core/gettext/gettext-minimal-0.19.4/Makefile.in.in
similarity index 93%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.3.2/Makefile.in.in
rename to meta/recipes-core/gettext/gettext-minimal-0.19.4/Makefile.in.in
index fabdc76..65184f6 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/Makefile.in.in
+++ b/meta/recipes-core/gettext/gettext-minimal-0.19.4/Makefile.in.in
@@ -8,8 +8,8 @@
 # Please note that the actual code of GNU gettext is covered by the GNU
 # General Public License and is *not* in the public domain.
 #
-# Origin: gettext-0.18.3
-GETTEXT_MACRO_VERSION = 0.18
+# Origin: gettext-0.19
+GETTEXT_MACRO_VERSION = 0.19
 
 PACKAGE = @PACKAGE@
 VERSION = @VERSION@
@@ -77,6 +77,16 @@ POTFILES = \
 
 CATALOGS = @CATALOGS@
 
+POFILESDEPS_ = $(srcdir)/$(DOMAIN).pot
+POFILESDEPS_yes = $(POFILESDEPS_)
+POFILESDEPS_no =
+POFILESDEPS = $(POFILESDEPS_$(PO_DEPENDS_ON_POT))
+
+DISTFILESDEPS_ = update-po
+DISTFILESDEPS_yes = $(DISTFILESDEPS_)
+DISTFILESDEPS_no =
+DISTFILESDEPS = $(DISTFILESDEPS_$(DIST_DEPENDS_ON_UPDATE_PO))
+
 # Makevars gets inserted here. (Don't remove this line!)
 
 .SUFFIXES:
@@ -143,15 +153,25 @@ stamp-po: $(srcdir)/$(DOMAIN).pot
 # heuristic whether some file in the top level directory mentions "GNU xyz".
 # If GNU 'find' is available, we avoid grepping through monster files.
 $(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTFILES.in remove-potcdate.sed
-	if { if (LC_ALL=C find --version) 2>/dev/null | grep GNU >/dev/null; then \
-	       LC_ALL=C find -L $(top_srcdir) -maxdepth 1 -type f -size -10000000c -exec grep 'GNU @PACKAGE@' /dev/null '{}' ';' 2>/dev/null; \
-	     else \
-	       LC_ALL=C grep 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null; \
-	     fi; \
-	   } | grep -v 'libtool:' >/dev/null; then \
-	  package_gnu='GNU '; \
+	package_gnu="$(PACKAGE_GNU)"; \
+	test -n "$$package_gnu" || { \
+	  if { if (LC_ALL=C find --version) 2>/dev/null | grep GNU >/dev/null; then \
+		 LC_ALL=C find -L $(top_srcdir) -maxdepth 1 -type f \
+			       -size -10000000c -exec grep 'GNU @PACKAGE@' \
+			       /dev/null '{}' ';' 2>/dev/null; \
+	       else \
+		 LC_ALL=C grep 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null; \
+	       fi; \
+	     } | grep -v 'libtool:' >/dev/null; then \
+	     package_gnu=yes; \
+	   else \
+	     package_gnu=no; \
+	   fi; \
+	}; \
+	if test "$$package_gnu" = "yes"; then \
+	  package_prefix='GNU '; \
 	else \
-	  package_gnu=''; \
+	  package_prefix=''; \
 	fi; \
 	if test -n '$(MSGID_BUGS_ADDRESS)' || test '$(PACKAGE_BUGREPORT)' = '@'PACKAGE_BUGREPORT'@'; then \
 	  msgid_bugs_address='$(MSGID_BUGS_ADDRESS)'; \
@@ -171,7 +191,7 @@ $(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTFILES.in remove-potcdate.sed
 	      --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
 	      --files-from=$(srcdir)/POTFILES.in \
 	      --copyright-holder='$(COPYRIGHT_HOLDER)' \
-	      --package-name="$${package_gnu}@PACKAGE@" \
+	      --package-name="$${package_prefix}@PACKAGE@" \
 	      --package-version='@VERSION@' \
 	      --msgid-bugs-address="$$msgid_bugs_address" \
 	    ;; \
@@ -199,9 +219,10 @@ $(srcdir)/$(DOMAIN).pot:
 
 # This target rebuilds a PO file if $(DOMAIN).pot has changed.
 # Note that a PO file is not touched if it doesn't need to be changed.
-$(POFILES): $(srcdir)/$(DOMAIN).pot
+$(POFILES): $(POFILESDEPS)
 	@lang=`echo $@ | sed -e 's,.*/,,' -e 's/\.po$$//'`; \
 	if test -f "$(srcdir)/$${lang}.po"; then \
+	  test -f $(srcdir)/$(DOMAIN).pot || $(MAKE) $(srcdir)/$(DOMAIN).pot; \
 	  test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
 	  echo "$${cdcmd}$(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} $${lang}.po $(DOMAIN).pot"; \
 	  cd $(srcdir) \
@@ -362,7 +383,7 @@ maintainer-clean: distclean
 
 distdir = $(top_builddir)/$(PACKAGE)-$(VERSION)/$(subdir)
 dist distdir:
-	$(MAKE) update-po
+	test -z "$(DISTFILESDEPS)" || $(MAKE) $(DISTFILESDEPS)
 	@$(MAKE) dist2
 # This is a separate target because 'update-po' must be executed before.
 dist2: stamp-po $(DISTFILES)
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.4/aclocal.tgz b/meta/recipes-core/gettext/gettext-minimal-0.19.4/aclocal.tgz
new file mode 100644
index 0000000000000000000000000000000000000000..b04ba55032e45b1d11545df227a1e9ca26bebf8e
GIT binary patch
literal 39744
zcmV(%K;pk2iwFR<w7FCO1MEEebK*wQ`PqNPgmuN>fOy)w_O3UFLAI%2;CSq#h)X4;
z0dy7;r-vPGcmMaVduH@RU~jInTi+#0j6l=V)7{grnQ5(N>(r&5v}*kDr(G4eP8$ul
z*H2DP8|-(r!SDF>q*D2zTC3Mi8udmU+pD$8%f=6+^5>BhUB2t74k1678`WA=_rX!e
z{T2j$+v^3<LJc6mqM@4Pgya|0^XTthsUlThNwva(ZkeQIuQ!gdSb8MiDv%n?TnRpE
zMf`foK3~CuYJ*%kl#-D>_a0S;k}KP{bk#F#t4KPQCNW&&rQwpfVN!y3gm(q}YvL{G
zP86*3!g!!A@h#I>86MTinmQ}Pb)lJfHt@6F5Y^JlwnKEo^&Dg7doYeyWSt)kZ%LpD
z@3!xem8~0dLu1(8B2isp+SUT^9@1#po}n=+*A9rud7!#<zz|(I_KI9OzGage)tH$S
zo;O=cTfUm~^3&$6(rxyxJH4yE((1S6kvzUD9!w7i0hm^^bt5bA*ZMU-odYqJshFUC
zhBdd5bQ1O;Q+1_i4`Hh!W(#l;xTb)t+v)wPbgty?NY1l|!E+d184UZ^!{%++fNj$k
zhNYRlPRW}9t+af5Cr}1J+ER6niRO}vICXhJS>ZKtsOLKt`B8IU-`y3W-a9D1*iiRr
zAj`fhFc@|-=ES3}M-H>0fiytM6vkqmxcECgIX}H=zLPU%fK00)5z{uE8y3Y;HnvZe
z>O)c@Y$mdJml$z#;{fj8+kXGs3yhpPR>=Tkvgn@_1@`;@YNcL10sr4<R8Q*lYNZPP
zzh0}p{M-M3iwiy35my4jmEee|#8gRV)F-X8GvVwa-wz(X_E&N9kvm_Qiu_?L4|__d
z2M$*beEE&?P99!1$DP~!luJ?JQbd6AF&UUtb%ASO6ZyTieAAebm1_AAXVLR7?MLJW
zv<m^?bERsI?ZV*Tp+^21$#F?yf;ewCgVN*!(KN=3;SqJcrmEv2vKb{a$G)f5YaAF6
zy;*wR`n+5=K~S!=uzbmO7G>4ZmLTKu(p#D3nZGDO$VW$4hUu-BDz);;U4VhsD-uGy
zeVV3`Z;=)}Az)K5laB6|G#d~)z%WP`=70)v5fe=262MHDWPxPvTN;}nkcH|IO*KtI
zRShN*WaCJL$kIY8GPxazE)TY$lR2Wx<JSWDM81%C+ahY1lRU(&FGoe9ot*)YW;+hm
zJaYrev|5|0VY!It$f0xUP^1`y39Nu>5JRVy2O2~jlAGs{$0Yv&=|>WxV0sS{C6B<Z
zJ>v=$m(ht-t>M@HNHOZKPSL8WW&Hniuaxs?wN@0>6RNK$B%fClm|UTPic%=BU<w9<
z(_k!oM~#UW<nO7VCBQ$b-%-G+@B+ZQ0aBqWU>vbTlLO;(Esak#Ftwzr4o;Go#yvz*
z&D*Rggi)BbE9gOgR}mWvz7TN@S2q@*wjie%9pQi=tp`H|Pm~}kq=8{k!B*{sqppxU
z4`$CmgWfeUkxIG2;7keC4H`drw4Hn68f?<RP+JjSFv!xF8D4rWLU}OZU^0lvkp@9?
z2q4820&e$~{m5LHt!cgkvvYpHGm`#@d?3||^onI3V9h3|8?)ha4)8oHUN9$9W{$cV
z7;&x6j984+cGQJ!U74HELxjjzzN>*rN;(6Xo12-dvvFp=d0&P!m+HV{iRuelTH794
zg=&^f6%(}*xaiXQ9%x#YJZ}T5hdSuFWZDZcF8ce+QTxB)sZpxD<UCa?jfkf}c4v^s
zxu6<MLBTw@P6~^Fsnb~ufJwqx785czeg}O+uhK%vv-yM{8YX@K<3XysLg&DqE`I)*
zkstb0&rvlAhFjYXaDddq<lj@T+<?rc{+9WJrtA7E8i}1vun-2=GPpVL*)GI6Q$;s-
zTt0XKHj>Zhb(W&)z({j2=*nQ@KmA0ahqthh05d1QiIn#9=U8Jn8uUsuh=F4r0cmWg
zq|5@`aQza8($=Q$;$M=a>)xcLjK=Mjh?FpR3<DqQ#~3`5a-0Xa&Vlt9OuOG3E0Ynd
zn8qIma)395HpK%YBgJ<}aiNgv3}8{;tNw7@x%#M#`jcTxM!XgBX6tckbWXt5_-SS%
z3cxkL5G_Qx?k3X<6yS~AY|BICa&mp}f`Z=8g-(RH0}6iGFMS|k@2r5Zt7m6tm1>u~
zxd2cG1zF9g)9)oG51EOEx)~^%mTr#Cz-ZEg)u+<p1Td@^kYXwqA=}S?N>Us|xZyoQ
zO#176((d$7y+F(+O1Orz9SHenl7GqN!XDgqdi^14Yf=`Y@vzexE6v`h6BpT6@(6>c
zW)eQKCNlmQ$AUyN8Tg4S@&}5(@VeC^4XFlcvbwNr7u=KZF(gB*$sqSsegQbB>C$JQ
zLP)N~PfghKX3C|RS|MUDKAH3Yw7qY<3}8;<0Z6oCq2P+4D9OxTfV0b4Hm(sK4BN-W
zg6-Lu=kT2Ls^34#vD5_Idje3W;OBVu6$6dUh|5x%$0fB0G+|Uyw^JCyVquH>=VWs4
zLL^#fS{OkgwEYL-iduGIg`vPNNn04d82ZIYqgt)M4dUF_^*yb>dinBg6rdU@OF7N3
zluW&TmWRqzDn*z~tKS=qmBFxiecRlpgjw)`fhq%tkSmqsb7&#aTo41kI6&=hxzc;r
zUo0@S3GLtlvQ5|fEte}~t8{YQOZmFf69euXZ|%FwT;VCGI8|&R3~5-XfG!gBM=-=R
zGlAnNiSOiC?zNxf*IuLab{TO(c25i?EcUMOzpxqi9j>`%d1lG}j^{tsDjxQv&wu{j
z|NA!A3leESaQ@TCKJMXXJZFEE%|Ar+-Z4B_;*!~h3{>AFGQ<MMgT@zRj0Y1CuW@IJ
zu`@T-g-iNMuaDb-GRpz**HypU?Y}3g=J~1#OF!IckN|-=eP9O_@B71FJH2Zq>J3a*
zF>pptupbZ)Y(ZOvZ;3q`F5QPqj2%ZN9__}K*z~+=^~PO5b=7TNkHn@Y3T6Pt;6oNd
z7O*VW$Q!0acxD3FguC7)2}z)Uad1sH`ZyZPw=6O1;gVy-_RI{+b8Ow$VCEs|QGL(G
z9V}9lPAd$ZJ#%f7den`OVN%T3W;nvCp%`<ZBtP9XPV5M6DF1WP8OnQL3p=2rK>?(2
zAddI&U{A!Tk<#zA0M@raO?7F>j*dbY5OXVla5pQ+_U=P~^cf+}7;an$QR7(_Opx{v
zEZ0T5!rGN(oZw0Cj~)=Z8@J5T3z*yZf;S0)dGr>*oU7xc*MY1~xk)sVuzMhvWM|9_
za8(1={@$>3`_bh#eLH&B!sIg>mtm*zL~Sq#XzEsbke9k9rR%&^APV~iD;@ZLOsWu{
z3Q5XX!j~zDzy?xcuwabH7!tb%FSbmj^3-4vI&Mun@d-PB0%5ql>JgUK@=w+B-02;;
zNFe`|+VFs-{ZMX>i||GM(CQZ1sIBq%BYqo$&b9DMb1;A`t+>^<*Y90+`>kIQX7o|O
zwpzFSwv1ng?S8NOk$-zX#QXapK1tyD@;df2eSV#QME=0F`zD?l{}}T4Iw`$CWk(-x
z@lbs)_d;-ZN-iV^_KPwjIrLPx8!Ew*-0M_7++Yxv4ta4|rw?VzH_coT`xnTM7bK~0
z>=LAZz96+UK9)nL;nTzhBADwypS^~FhBQP{C7<Ie^EsN@N+CU7zyqLqn@Q`g@$u43
z8|)hTW};1U+Q<g^vh_6m1gXQk0R<e&6nFR{u}j}e++3{_;{Jaq;ka~@IFgXt?&cY0
zgb8D0N8r#P^lV#EQo7h@OT5gXZizui_RaozfAxpw9dc1$^B7<7QQ0}U3;-x8lAi!<
zmnJ5us-9+{%Oq_Vd3bSQ@6rzu|EfC`2+4OK<q*_sMN(ztSF_1avQXQhbbHv?$4Wp?
zr1pCRxlK)d%f6pY(Nk36mDGjmzOnFPp@FLf(`QhO>T~$PD`wT1Iv2m5<SQbkBDtOd
z7P_KH2hbD#eww5>QKvhnonPBNXMf96J}UW3RH|`uQpIZfQs`94nue7ehri&0<VBP(
zHwt7gjw8z^`I#DD0Tqs3zmB6g{VE*XuccAE`f3!#Jrt4Sr_n)|5T3fK_FSQ2;Q-c!
ztkwpemIv!5F5P`SL%|=1JRF0s2gW{=6w(4Lx0MIgyr=|x9fyyqjBcd(AXYI5>y&>^
z`eV5*N(Z-A<hb5C<S2rrl~{G}SgK2Zj4wVR--a<h*7G=v?;A*eZ@2!hT%yqXJMRD1
zPfl6=XZ_@5{bi$ZQo;S->dD{r|KH?#K_U$Z_J2=LpYsAh_3Z5AFR~X5cv4(ws>S|h
z6l>?$Cgs|(|3x*=C67x(TN3003(M38)iBi=^Z}lz!|<?D(B6bxQ;Rwv@PR)wVHMPc
zku8W8wi7~hjhUl5n-nBN5<p{t5+Bm_u#)Ieg~gGFXV3P7p;LB#Z95)2b`H>r*=2Zw
z(`D5(ybYf%QMC%>Q(iWQ{rCnpdtHRs^E4`A3Q9pjn*Bf>sxwrx%@e!?d=%NfF2Xvv
zvmTAWRX~igR<(O|LBo4AT70DJ5dux58#Xz|z}|6iq`u~mx{ZZiV)MW0gT^@SIr~A#
z#B@-|ZHKNw0m&PkfBA>DSy;X+L5O}^42+^ukwmZf3nJvrlHLEInTETTaJ`G??Qe_W
z%QUgqXexq=TUN*h^Qr2*M$N}#+qmcj;KT)ioRj7)+mybR$7A`!I6v+5#@*4!+sl3z
z<9tt++tDv<Yj=is1x{@Q8tArdvAGrn;;MO6B#`-)V6HveX1_rD!=DlgSMZHHt14#y
zc`Wv1b)IMq?wV>?MXRHd)79GB6tF3dG>}}J92ZR2)RCfy6ebLz2V#2|ByB)S1#STA
zdTnP@3~-@t#RtLR6SQYwV+9y-Y!PMiIB`gS995CMkb+h8{6SzELGQ!7XRno+Z<sou
zE|hVQGQi+nGS#piP=i%Ay1Tp!3wF2*AIG;$ijkbxxXl780q(F=`a~^sHbwA+c>hxR
z#CsQcw=ewkL?}IaIIMWJ=K;3nZK>TEH7~nzX>`*Z%I$)b!EHhX!W!MLVRMU1p@DM}
zX($dA=?l`$#->y+Swi&#S*Lv(Twy7(D0$9<rL(gt5TT%=5C#R5Mu0P42wh@;E1*@>
zPe|lxLW8cHURDC{VQjJ%C0;w7LHZWW%=hZHbrf<HICCVJy`e$Q&d3{JCOD)a@u7k;
z?KJ(NwS(~^@hpUai-Dw{yI`jGd_E28a(<b$hH8gUuwd}PA~PrYD8L(!o;27J5Z*me
zm5v>Rzwwrs4&cg3c;9LvE+_sD0Y7%p0}swfcKumo`;m&V)sqNF!Wo35;e(dysiwUU
zvO8yEl}c{`C#W{yfFTa^kdUazU%C@IBny*~b0V$4P0ztU1wBO?BrR4ptChEX2Mf%B
zJBFo}V2f2Q&nU$TG2aRqb2qL>S4S?)wXm@7PItXPdd$_LCl<NGe?%YEd{j4V>WOSE
zAkZzz%3T<{g>Av4@1ZSh-gZN=sAS{Y159B^jm>YJg)mlOAI5z~6sQ+x%O#M_fucYz
zXo7d}*ts)WE4Kxey*+}t#iL^c72^yON|_T6V=#JMUbx3hKzL%6tU-zh76y|K<v#9K
zi`g!4Q)1a0CHJ`LieVCHb|6h;!4fUfM!_47LrwaCi5+I2mb#+2i)&%1;=Y{W!rTSl
zgMft!x4OjZsIjadc97q67Cw3$z(+OQmB7PuV~%@-`RQR5vjq5q&*ZZ}^jU3DbjWIr
zMM`Yu`wi4_*5I(b{8Sze`@?gP12`9av&V2C8B_xzK_W>`4siR3{}<7{MgG(_^}E9K
zZV#OtMBJmJ^LD3s-RqC!{4}UIK-dY_qa-O|Fo}c{5pG}!D8yTh#kwT9)5BVZnAx*L
zu-gfc5nY}kT9<<R)t@8VgP^W5KV5iA;CL1ExI$FBltb(Y29+2I^vWH}Kb6ts5_3@K
z$F^H>USJ|bPxh>kqCm`=;`;Ns@w)<Ig&XwTr)X35!BGJU7QB^CuQSHIvLs#D#^f8+
zb3_Fnx5}U|2p-)P(8NOC(~>FTyU8#lV<d$n&bPqA2V;vb2bMGc_6---x-L^Qe8>Be
zz30u!aFok_`=gX5jROsa@&M8{ykB)b1hph-sNtYFzKKR0*(-{B`fiXI5k`O`9)OxW
z6d?u(V{|FLox}3wpfxDz>FAV~I8pM*5_a9@t7_4Qd1)SK&}Z>ZLPPkQ-nm1pzv*>H
zIXnRb3FgAryF*w8{fU4-G)WG`j(eZK9Uj6r%-gU)T^I~1iiQX{W)7OelMI3RO9DB9
zL9TNNCJX}vxe1jFTn9YZ_aF|OyH>yVPB4+O7l9_0*g*8w9AoVXaiF#GEeqzSd3Z->
z?k=gxm(~J_x`1{FYrf~=8eX+F<j9!w6&7H{^{e-2!=#u#OBK&WzY^&%QbS5pYD2Jl
z2HvoH%f`wp&ISE_t+FW0Ui4c*>IhZ{gqvaw3feRn_TP2dvM4VK(2Ur7bX(0l!^7A7
zVkKQ~FGx)~;XxaMp1`2nn$O<@ETT5?U~G8OllHdD;xc5xtRuq;Fq^<-H+!e7m}L_d
zE5u@Py#-Q<wyPxWU6_5}He3DChY&mUh*0e<)4j!~oRH@@lgmk`+lDb(-AP++qe0_%
z7naRhaggjb#&7Thzm8)+27T~H7Xh_R9RdS^+=p$lS^jE9S)m})Z52|5@HJ&|z>y<p
zUZ~$L!M9@>DaSdoD?X7No-lcex;7Ls%tf7u6Q!VE5cslyYa#GfQ<cOILUy=?3-lb?
zL%QwoQxe%1?n8Fs!O8g=R0y97qzoDDBTq_U{)uoHHrvj_*K;YP6Z*lkd?O<d5MeA7
zDLiOSL`$F?&rvU?oVTNEUVGT-UFWAknQOS_3Ky&{GYg=O>UV{xdvkcLyzh)}^3$M8
zDNJI*L&GV7#R?ixDGe074xhcj7!ZN3EQZc9T{a7tF*8}<n@R!yhd2&+|7U_*b|EQ?
zp*)&&$B-55>&8tuhCGcnx3_yP%$9=r-U}UzW1$w@MaS}dOAsbaw<+Iy1H~|KXVr>r
zA)?|1t4czyk}8<M#s854z7>$zvv6Zu+(Ml(=HuJ?Sj7pC@LyI*<C^38bf#+e_#;ip
zK?oiG3ouDrBA_Xx9%Gze0E91GA%ue6*gq6=adZ%rO)7~zZ!{SU`ol4}$)WtNgLS?K
zK>_7cfccgBFWV`QeDLK0Ys`LuzjIQm7J}Ev_!{lszU|R`ktKS#O@owR0h8)D>V`~f
z<e2229I#TrNLejFh_2qfPGFuEc@lXP9mgjtJhH_S0?dtPiMy61Zb%XE-MEy%$<M%3
z=)Lo~T#?{krLd30OjL0q!|z$u(Fv90JALe2dx!gv7mM!tN0g$*9fi^yV0!R>?Y;R!
z8%LHnzQ2C?D{6!iBt{3~a$*P1V32J#7+8c8XED=hqz1H>)Ec#9Ac;SJ`}ZAnc2`RR
zAIT*2?l_{m>ecn?)vI?}@sy-^^XlnB(L3u4+9z@>f<Z6nCzk=-34=CpT~F+f%lMVm
z5y5$v1iVSchQ_sdRo%hjI8d&wroa4TLE6DA3u|S{#hj^!HB5I9m(|m)Y_H0xew{L}
zp0^liXH&Ril|fukmLvRp`a6MoKG_w?bafsMR%5%(y;@(+%IQA3tzsvUsg@*7@_H4+
z_R&{h74dfpRM>9EBV61b91FWBfF`=`y@}!(kAi?x8fT_g=TST4Ga*#hAk<_P;BJoP
z3rPR%4(aZt;6(4E0WPwdP&(JJW6=$qYWDO_>t)$3HwPK9q#PPIbMPu#6r~jjoPNR1
z(Gm3pSOE32;K1}05JkB-Zb=0a#)zfyKW+i*gDA?$bW7lT9>mua#zOIS3T0?I6UH3H
zIk1iiIR_s)%NfrhpmUJW&p|}-%;zIt$6Qz_>=g9L%+3yI2}>l6uDYEd>~+ILl<coQ
zJ6I3h{W6r-?IyY)d-|59zO#ra-C;Z=c&>Uxhwp`4gi}dAQr&@|)2+%!(<waQ2Xru}
zZ`FaIeL?iJkRkN=WHt{KO%<As?{i`Ne;m%|VErEk@BNq$-BUu2f}(}_>nd!a2$VlD
zHBP3~nQwPx>ZSIL#fIZ!9SG?|#7pk&W5M2%HsdUX4&gwAJv8CJl_mgVREpc81N$5-
zk%b1SBr6UiJk`5nxaUcUDM@-c?vm0ecLyoG?SMc#VC;*e>6Ph<Ifh9TI2m@rF<&tq
zFlq-0QQEnvNtH0GK}Qp`J7a5(`m69=gi5qpcTh94^l{vyVIJMEK)?M4P(O}{<$<P0
z(X~SHXnW`T?H5fVddhTfG#QZP{$1;##w77E!ZTz{w~<+q)b$P*=$JybYP$hc3XIWc
zi<xEeY&D##eH2(yO8x4@^HOq4**oKWQZHNZGJT|8(Tf>qN;-lJl%vqM^!RSY=UOI0
zv0kK@%OeA`E9Qur?8VTO#n6I`j42~s@{f=$(njyl8jutN%5>zCOzy@}R+gix=7_EB
zj(TO+b^%SBwW@CoE*@u<x5Zy=8<Y=ZgHpk-Wo>eFdX}d;JUt7|nLxizULH5McMYAj
zPKD3V@`=^<iLZ5}@IOcGs~F|%#F`YuZvtn&ig6q30xna?Ue!f?Nxu4*sO#UN2)}>M
z;K0uI$>FpAZoWC$${@uo{FlgKlNO+Lp9Z63G*lbyi6R+HG95=t4l^$Nj}i%}u@K8=
z>0|hObo%hS4I70DXzDTwW$*~H8D<NV&V&rOq^_x!-2sN1$&Aj2wl*`9S3yppA)EJ}
zm;23%6~4Q9fHsJv7jt5EXMIy(_67+XETOVog#_&bcS)w4Qfr0g`%6HKq2T*SV9db@
zd`76Y4x=U+C+ql<Iv1rup*i9i%2ks{3}&TXR)ruTIuXvN>UMk$jaWgVc8CrU){ap~
zh2co$Q0}~n>Amr(_?OfMKz^0X%C-v1UPK-K3LhON!YZ#+au&{7MXiFCji7DETUfAa
zrdLN-S3%zAS*1VpOlQzX#+)W6Zc<_^*;P4RN6(6+9c~GfvT=Nelfxgjk4vZOf<lsa
z$&TqN=HMY-2Y5YXb*?eQE*faU#yszm3j)(cZHtW&ddba#ZScDKAV^31*T!uQ!LXwI
zr!<O|p>OK);ky#mZ2hLw?(WXqEqB@<)wY^K3QZJga}uC=Z46LIHr;XEHdx2ftlA&O
z7CO)7hvij~?sWd!oYL%3kZfS({rsH<2Bnq&{*o35C%DSe5SUDFCf#vl#Ohrs(>1$F
z-&L|#9CO}y3d#G7wI^n<qV_c7bx|N+{yrRaQOB7mC8rMKtV~&Iik`r9w_wxwTaim?
ziust{Od-wkDE?-yJ!IQ3<!&T-LhGQv<KC9%J&=gY@zx#MR`=}Oc6YZ=ws-fA54K-5
zx5!5!HDv4iod!L#;k|>F<{u^dXj(NNKW(Egng_6kTX0QkOU1frlfQlHL7wcxI9gk&
zP2|J2LMD-lRlo4ISVH=Sf0WZFr=Bz}Y!9JHekj@pMma7>Vwg-uBfJx1r<E_)bvL=P
zHa>BwcpExAL}SV4&-dO)v&OBw>y)Qkeh4YkuaBK>Y{&?XmA=L82!1y$YO-Ps-7E^@
zB`pS=O(d+hC;s<D{@G!h9mO2;R}l?hEuzHu`Dr^Y)gPq)-9Z=Qymx;=uZjM8U|HiD
zSkkN<KLe9J8V7XJox)+c4O|3q1q%2Ubuu3in(CS!dtKY4ov!84R?aner?NTS!v>Yz
ztkcDUF=;C{3bXqoV`jrx<iR7YC#LmF){z7L9sGYOe&1^2cg_E{*;q@(|7>hN+I;Z;
z{u0lkFc_fozs*edw$6U4_-|unh7&kD@BBF&!ByN(+n0JrIW||c!R%_Sfh`T9>u5wV
zHYYnc$r!0~de*qhUho2__|7U{BeW^AW2d0R4A*Q2u8yKqZ`iQ9VOlqN&%!n`b|{XK
zLfT+8u+pMId(9U>4^iI)$I7Jr?$(ySSX#@AC>-PAfoe;wdqnaEV>sSE{t2VgQ__Nf
zhZO{9D7PvDe$yKnCR`e~VIBrk_NiDUlV$7y4G#C<f(k2Uk|J=suXniGf~-J=Qz6Lg
zad>CJ4f&H-NN1@7i1gnyyRH_I-^;(?K=Fb@Ug2!vcM7M%yZ^J2|C#iE9f*CJ{;xj7
z|M()0qW>28Uwa_`A4~pMH2I%{=8q-K|9FzWs+*lk?5C1?O=v$I&Bv1{oiW8w>lyTY
zPSQOG;hvXlJ5<|Gw0~EU{Yf7-y!x!<e+K<uU4@US{GW}D&6NlG|0SM9p)f#^|Hij>
zPyhVrFA@l9zQoU7XG1G?{+D;~&Dx`<O~bLv$~K%mT%~b1{;`m?3SY>#vzBJy*nG~k
zSd&5GH4br+usVUeCw(|7tR~<O+9aDwlnz_Z>kXO6h#hY+2rMl#i5Mw?V-G`$pyZJx
zS$N2309w6L_RRIp_QB!7-p=-Z@ba*Aa#p4mC@Y{9kTFU=`wY+F#JXU7Hj4@#?gwp0
zejZ(*?=I{X^u$!G!$sWd#n<>3g?^v}RJOssl++^KqsS!2BF`Bi*@ttmA@tBCRgr{*
z89dp;5B6JC)vB_rwjuyH#wybmA81R6Q98(nLJi8XwB?8{6gKA~?Di_W&K$?US2CHj
z+Y#<tA;SJtL;Sh4nK-c~$wS(8fbm{uY$v^~en%Wd`omUX5LYPdb+=<;uPE0%HD3j*
zF1(Xf2U>CAu|%F?f9zNto1_Tl9UljF76Zrb_muZ{Fcxi$zs-MO6mB&7C7WMi9{O5p
zcPa<3_xDr(cuEEo#u>_&oglrL2_;@HZQYPAWbD5!t%kw^kMG1(!|yzU@2Q5~_n7L8
zk@cOX`z{kceaiKu8-&9-Pk;3;iJnS(vMt3?%I+n*Zs}#4mJB6#(@~J!<jk0NYUYD<
z%^Y9>I&eO@r053Qdv7o)bA^6v)*7|iBm9fAY&ROUMx$Z@YQ?>91h6nl-%QNXPL-)C
z^=RE@prJP8^p92%1x{ZZs&8!B4`W<f5=->Q(i72%b(8)KF|)8ch2I*NZInk7HhiZY
zaQOtIOmZf#oApu@-Cn0Jfxaz5o5arVK>^U~%Y0Q=>nzt7*ZZ+}4u=ORy;P7+WEY{Y
z6U<1Cd;+C&rqd%yE+##0j-442PJgJPznkqDOvV@A1migP=9`Ug8_s4GrNUn85Z_lD
z=o<0*<azZQwRtIieY!T#u95^@E>#<4wY5yhc^P!io;-5i=njUHF(*)XySBdic69~*
zx3OM$f>Y9beS9cddoK>`Bsx^>d~$KxSUEE^A_I6CAdg2lE^NUROuD~B0pi#BEueWX
zy1+GnweR7$sjNkL7!t4p3<_G!0D_MWBzOxvatVr-Gi7lN<wR#E(d(_EpRZ{+75uMm
zZbl96c7=ZEI##DRGeSbn;I?mvmBGO(Y{+l6>l!Eqvj5;gXG4JQfYA)op!H0Q4wH7b
zJ0D7Ku5YFgI#v18VD#$dTH(o`5p&(y`U9fwYCh_^eV>WD_6f__`)qP?0Sqt(+k<O$
zE;<r;YzOyB8XK9W0ww}lRwZ7#2<cY;L=<*q-NHvZn+>AnDi-<`8iyC<l^aZLrG9Vk
z+Ucu44rLo3gQbm`sOikx?}nMUUfe-iE>soDVODXN;;CrhJE8_>R9erpAEDRt5!xAX
z3ZGH7y+SyR%p{;MT;ODEVr0TF04!NHsd&_Fyfcp!PN(;R#b5GPIEs@lnW#(GNsh6K
zWijOrkdu}BZ4Z2hyQ7=LRPM{{jnO4+>wXv5?6+&1n+f#f+1s^8>*sB}!pB#@{B2Jz
zqd`A>ySDboN7y(1;|crkzk6WB<1%*ZX&!C==AK(YG3PU}`ha5Iq0trK12Nal*E`k!
zK0?tC5pJQpIc3!Pj>2*r0D>RgN`c;}gGOiqW1wor#dJJ<7;rNM3ee-Aw5%mT?;Y>G
zsR$M*W*~q4bq?@o(w+l09(VJ@+<W$_Iv-q~<e8Aw#?J%FP}51q+>}WRY1itU>ozOl
zgj15k!xgXMWE{kajt!@uuzQ2aZmx!t8%$;6hg-OuM3k-^c-w-o5)aV>^=yE%K#;4F
z3xo0(nZ1!CnqWvMpup5TaMp~X@STzhV3=b5nJfN~Eyx+kgRUoNc@WctSW*^fH!BD<
zW1)#~YrtUDcNq{*yUNS~dO^w@9C6JIS&icx!7@|FFT!$*xQ!>$h2Toc{cXPp3Zy<Z
z8Hap*vHR=o%^aRDR@fS!+l!R?S`#OIBaF*vr`y3uG(9|`(P~#r5@r0%mI2ohhjC|@
zjiM#>m%(kisNQE;k|m)|3#}QARI_Z_Z4?SyYKB}(Vcq|<sj&Qj5^d~*ToxVTRLA%v
z4GtwKCb`nK6S;G9y<&n^k7I(w(K@fg(E!6k!7RMv_|ygY>anHRcr1QaEiO?6ZVvT;
z`8-%_Ap>(uzmQJBQX`@;Z`4KO0j0B$?j+aYtyl`-5Nl(e2rQ`r>qi|9C|?zOW8-T=
zf+!p<Mn;(2bbDR2rr=Np*Q8aVklPfm1Z9PCPE<(qLzO&Rs5Z61v`8=v`7lfp8T$zJ
zmDERu&MkB3&}_djg#;`K(HRQg*Ws<=E=tJS4|-$8Y|ZVR>`8=tSsx?77Gyl@$-px6
zmYip?QIK%ddb;-CJxRP&2WXo^0ci_^hWRj@(kWt!imQF<^xu-EbKqu-ysTt=rzVd#
zG_|tw;@~x)uH|Eu2g?u6sgYl}jB%nfLo+%!slQA|=DMR$+a*m}g#<X!?uDEa!H^}E
zfd8<)Uy^4pFiOCcxe6vOdHCvRZ@>AubQN=jn!!twwDl<kLF;69CkW`ureD5l?V$0y
z`_cd_FDM?K8EJFPsYr$$nSWrwD~j)4wwY#K2H9e}P>M~aMB`3VC3>3{I%l*pUS)~3
zBtba3Y-|+@^AsXUw+Y#jDW)7`MgEi&{jfjbRH^=DdnW@EoEFbA-!Mu6UeFV<1pjA8
zEGUV3NyQ{c9lB<sv!gQmA(PzDx*T#sL+^}axR5ZBd55LC+uD3c5*1UzZXi@rIb)J~
zx|hV5bR-#f$7pL}-%w?=kITUXHj|Ez(J@<zk9&u}as8KpahXxwwM_wh1vT^P1U~Rj
zLMCj9)oq22>Z4XUDF*Bz@8h59=?=!7?)#PB)Bk6EV`DXC|Gf$&AMF3W#Iq<22I%~c
za~c2|+rK$&!T&;LfSd(jckhQ4#Voq^WypjDJ3A`<#|-N;EVPhs7LJ*iP|^zPNMQp}
z_WVl(*Naiu#gs^`y%*1qn({E=VD(T1-5}3zv0RXJFE56XWVt25&o8&-32e=ErU-lB
zz7r=X>FI=U8yTE#R=+*7{%pXXrz`l*7EvyWLz9XDtu0n9zpDS6pvW;vCjH1{(g<ZP
zCN|S^K<OmPH5qyTnxd%0$}mnQpA0z@NJTWn&L~W-#Bqf7gAS-pm(o;0$2;-0yiX0|
zp_mNq&|LOxw1<<7?5lgaw!X3X=<J(Kn1`EhHiOOebYR0Ni!e=~B}F~z(ckF3FLro}
zcld?lisUq%<{xGokhBh8AH(fz<}Cx@4?>E9xga$RC`wr1W&`MVrw3?`0&QSZFUt$R
zvhcZigHi(A*c3-{1qZ@7U$I_OxFEdm#<Xc<TT*lyA&3&ZL*)n8g`2>Kg#~QuhV^9l
z^Og-v@aHf5pFucy!o@iFCHIP<i<0VwI|Kj?-A1W1-`?TBB|_W6O|LDg|0avff(pD*
z7Ps99FigS(kSE96N8EFAwNP#qaDz%NyY`(5UIFkjd0*&P5<uDQCcg6YQ(lIkyZhb2
z<fh&_+CJXl4kcEP_V)KphwT0g!%-VAe|86gpog&Fwc7;%lHUU;`U_0{ji`%T#Aldy
zyj80|c>z~x(K6!dDci{P8<}2q5W7X4&AKRF;D!|EAzpK2ip`y)*R@<~IUkjPJ6CUb
z6(X(l5DfUy-~8qsUar=@U0F`kk2_G1v{YT(7uX<9!<s>M@Ug=L>A&UFOrb<N)eMZF
z%p$9;hRF=WFIMb)Fy6Z(pVYze_Fk*m3e<54w@3n@WKl+NJ?p?V`vL&fSjhT&b9(*<
z<Gpmcqu<y6e=Y6*zuH(`ec=DU#6$eQ!~n(rue$ty4)@Qws=xh<u>75e6!3qs6!3IO
zYr?Gzl@}YUN=<eW^?IzqNu~ent3>VEp+hDRcLK8IMuJJ@!u(PP1_h}7yzZZ~{68P9
zuCKBG=cDyCI0n%FbN#{p|I0i~|83&`jYIvv^-=%Ex8H6&(ESIx|EHw;q}Q1M#*Ae0
zc_Ci+MmWj4qi6^SD8B3PkAJprF9(yP){gs6D{51$tSH61EgKZyUD1F4+3t0dVGWOn
zT0FXZTG5Ww-=>e8%@uXz?2vyZJN3XS57Yj`oa<nW{*LGRsNpRT-L#`2BS3yMJW;~=
zAI7k+&U?2)mMK?s5WtGc&#oR{6v0YPSk2U#=bUr7l2Hu9xV^uhBOaw9uf7Km!O^rL
zcapEVg-leADe#ZC56~LHSG^Zt;=X5l`+Fxp<-oUQBG@@RZsxRf^3zc>*grgY!T&(5
z9C%dl$DNnk$HDX>03xSE4~-pOHn(@1$Jh`SZv`(iUgioC6nVA%24Q6j938{g=fTlo
z%j2eQ#kul#<4tStf4vg|-=6Q_#2p6goI7Q1ImCGm6yUj<#|KbwfA7HG5@JBGeR6WV
z_w4maQw!nA|IZ?<7^ATtzKfO;QLRQ4^|G44K{3Gaw7tm6kz3@i0e=nXtCnDp0E4<M
zb-HLC@eF3~<R>Y>5CRPX^U7FKj~Qi*AjFQ7nJH~Nol)693tl=Mjz@5YUIb&4VBRwM
zv%j9=*_sW895U~Wc`y~}lD4Pt7tpWq2=f4-i~2R3V=)R^MoC474W&Q<I`x}$Ana<L
zyh1eYG9z-UbZTPOz(Lu8TKt2=&qBE=x^;nE?Lf^i8N%1`g}AtuKL*h?SyAD^F^&fB
zG4`?ik9^Nj@RNb80PqKBcz)eZ<bUYT{`qJeU$^0J_;3H*`0>A%xo-mvL0d#}^6U$W
zgpf#61(c_1^S6OGh{n%ayHG+x>n2+48lpkjHJXxf9wnS`*~Al6hoE1+iC&Lg=!J0f
zj#PLAo|xU{&OS_x?p*~tDkle#0`nI-LjG=CyLy@(-f{q3UED^82{pb%4{)qbYBffc
zS-j+l9^Gd}jvA)o_Rb?jBRxrQ+DoT72?{QC<bO2g>Z7O++=N{Yts5(XV(o_%^_keK
z^X>pXM(Fy{?WtLg?Met1CJ|15_x+}KB7wbW>#3MEfka1&R=R1P_W;iB?u{!8CG%UN
zzLFHHyx2q{vR_w(pEzVnrv10ux-)9CWUbu@$aYJ0WWh3~bw8~vWNcWS0{M+Ae9URQ
zb&%V*{*>3aDv;l}CJH&NA2fg5KLmE8>1p14%WGek$nU`Q)WQFlJN6%E4E;wv@&&SY
zL~Y*Q!Sh34SazGO=E(x-1on4=SIt&y`$e;*w)qYzTcsTpP&?R**Tm-U++JS89%F;5
zWEi#a(y8JrQ>rc?_i~p@SdAL%bgxZHuTW6P@Q!0*-6w_cXoPwO+=0=JRNPAL)tL6m
zgT)HDj3;>nw~1R>%ZkUW0;8<X?gou8RNhhQWzy}#0T&LUc#`yPE2cxtxbse@;nRFv
zAaw}>q+IxSsndhoFZQXd?nxsyjlPZysPx$7(MY$q8N-G$22N)5(3P;4#DTglxnrw2
z2&woRnv*Op=2{03cA$c*O~|o~8RvrQI9gkUvD+>TM7!*7#`_`d-Qbo|=>6kib8U5Z
ze}AiJeRt4al`tpPVHSM}-B1XC%*uOAd*#PuB@pPS7)2^XV0VBP2fRIGh8hQx5CyQg
z=q74UD0Y#}N2X^mfBx*rvtO%ule0#HHgl4l5Qp*<=~ZTV^;MPGVx5YI#0V;2lK7Eq
zCeWat)2tBUCpve6WH#ac2`%p(>>f8M{tjANjAV!rPS3zD3uBZA4NRg@Y5M{E9+~qS
z@=&Pu+69<n<*SJ%`IJ3lL8lL-IQ3{=5|3-N=x8f21R91*g*@n3<qASa1T9q2HHRd%
zVsO<#Tt%S|vm~&>=*2=%$!)75uHtJXHypyKib{XjS+NvmNRWz!<Bhjm>xDd7P!=y7
z3H7Ki@9nhfY2-)<dt=~&FsBI0%y=C#0iIOHaeKqC$b}=({UPxh@L19fgI*6AX2l7*
zg&Zcwe@cWb5O6<AW%1qBcszVuuXo}$aNj8S=+~n`z46Vrn{`<j-jDmer&G{d`i7C$
z%Fb4yAndD-(C=x5{Y(rOF<bgLB8LuQB1vw~yUj47B-x{AUci^h1YFxMgJ*{)Cx@>}
zrwfacz6O*LGQd*7SY#i#X!1924f)DjgTGCw7TC@jscQB&F9`ge*H`@Jt%U#NRl<L~
zm6)~lSK@EpY9pX~Kq}uydDChN%$#6Tb{3R7O}Y&>57b->k=H*T*r|(i7eF%>Z2mb*
zE#hTQ(tz#&lVAyzTq<y0XN#NJz+FgfshaMmoT~JXzpDO}Q&o;wR(7gdpK>a9;6xn7
zx3acV+5VKRJ-RmIatXFQfZS5k0qTj+j}PF~j*U9>pLEw!aD1g^flPPK4{~bfu1E89
z&R1#{$QhlpO65Y5NHe2zzEZP5&gk4!Y?WmcQl@&Bg5)hV6K1M=IWTj&m!)&lw#BT{
z^EEJKo8*+93D>*yxp3z~0Z)~=J3b8|d~`e?YiF09w~1UV&MiF?@+_>Lqx9Tu<Y9S!
z=`84Y(2jEFL4VAthgO!oC_75e#~cWGi=6$qVCOxu6p<9#1}_GDBgxZ3Dh+C<-IaRW
zT3f!tT$j~hZ!$uIZ}skG*o!;Foa=JX{f<=5s#g-!k*;^ykM-}XFuAHKp}zB%s@`j?
z3@&=z#PkKT+YKgU32{|JBW|fTrF)l_<4-Ow%Bn&fcJL0bTg4as<gy)FKuID<vUcm8
z=?0Iz3S)+TT7S6TYqv7xl)f5XGT>Uq+r-r-dX=j?QxslG*NCdOIrM|AlU-CKX0?Ox
z8?`6F_C882b6TPjuU>6?^|zMuOl~iztFMg)G7k#tFprM+azH^JzqcK1GI3sW{iZqW
z<V75_Lqb><zlu<70W(di0bq1tHDMcwQdkj<mGTo6RVBnAER7ZM53wR1i^dc2!SPQw
z*6X%zjl{92VL#bB2%2w>nmc*<Ms;Rn+M*<O8L<TlMbJqy9ju|lyQA#WnzL|p`3qnt
zj1M(-s6Zo29Q-jEzz*u50_`@b55rN|&(WcwhU2<}n>M=a@_#4%U->8g)sOna_V8Bp
zCxd=CR64XVy@TzGl7V)Ah(9|M`p-C?^u##fxZ7}}kjgjgaL|q?upkVBUN8aZUflAZ
z1GFazf(zE!;r;$WKb5DSx`^TnJrxyk0qd2_t*=rM64d09Ii#d(ZIq@Nw`htAWq-e|
zIk7O#y9s8KaYb0FC?bF?qGaf8p|!qlObv?Dq63Umo$6}s5uIvZ$<s0%c56e-n`)QB
z{t^Pn6z%F5#G`2p|3lBD>nk(?owPBLrRrR{CZ0{kEX<<Ckg-x^oRlQO%`>)>OafqS
zN?@Q@`*1Xp<aszz-6#F|1a0dEaxRSsx+V_dYZ*X)7{x=fT^mKvKmvoHURtt$-7*E_
z3B~y+euoZ8C}}Jx86pO42Nr?trqnW0`xtLsLc#_yD=*s1!4!%UHPUb(qR}WGRpees
z#IwED;Q>xX;c>wzwg<5qo|O-I40JZ`bsQ8$irixR1%iYGk(SC4SCcoJE@L~dg>8&e
z(he|~yv+XV1o<IjL^LOaE?sk&d>Xox;%lL`8_7e-_+j^}&e*;$-+fnk`c!+rgs8)f
zFIBvht)ER#0S9zOp{HLrRQ!Yi#!vWHZ5gfIo+13&vUpo!-^sT%{BI3@lxxey`rAf*
zD1$7p<~Y@w(ZDP%l`~x_yswFW)c*00iZ~BDFm37C(mI*d+UX<d&3U>8KWfY6>E1q>
zmeL)oi1=N)#X)Q<f#v`)wb$B1G9B_M1tuGJs%S&ZC_(h<Z9QI4@e-5;E$Q`M><6z8
zUbmXNByo03jDn-r$4x6FP{L7r$q167NMPEDJ}h{DosBsz!d?&a)@u70X^0A&2+d<S
zg3}ACT1#h~vMif8d<+Gm7^p}Tr)N8duU;J<NcLj;B^d^7pX|M&`cNVqOM6@7H0#SM
zeiU`AACBH3jU&wu+sZ=m5Oz?9m6JNihD<!$C);A)_(GZ1)&!f~UPZkjWr=`ua?*};
zB%%t&GQPqVb#&twJ3FHK<79x<tHhL`ib#7VQV?>p1PhBeag@GF=BZj!DG2$Em8}q8
zSjh?>m7%iIvRaE8n0bMMB>=^p34$`#AoAj?h~MnAR|^zj6eY8G4gn|)mcn6$oeuK?
zm+dy}zi&6QLv+z9JyaOioFn~qGd<K4!e)oeUCtYDsyYl5c)#&2_1~R@vvT<l>p1r(
zd645G*ZiB$=LIq={>P(@jQ<}NfAIhK0uTFtXbjLPfaeSWvi{%(^56#Yr*#9d<ekdC
zhpjvkbq9=1c#@hGMKckW0Xjv1^-1fbeY#18W~^tnkM?k5j$&kZ2)UdnDC!oJPK&ei
z{D_Qr@sgI{X5AhRf3RKHEz{9?%I2iBv6IwPf9zGN7szO#i3|O?6OSUZfn}YX6iU;g
z5}sOe1s7)B={$-X+`tT{xq~ZFJ|sa2k(@9Qb4`sKEn>bZChMr2HhW$Ru3^<Y0B6SB
zg__6B=gs5h!A`Tab9nUA_R-M~+xxGZ{y4l!T<8Sj)!3$O&-42uH;}tRLZgHgy7w+P
zzLt;U`y}eaKI}|J&>?a+aHh^v;y(eWx!YcJ&Wxy(%Gfny0;XYZw(z}iHUnx7Y-QVK
zMAV(v$AGmbABm^gKFp7yX|la_zuk#<t9#8(rv1WPxR^5CPD7azfCM&RKm3fmKRz?~
z|JBBNn*VP++IWcn@kJiu{}}`B9R3g8RyQ~m{9oi6kQexm14ATZZHH_*t6fQ#w<VtF
zV7x@$Zxv$OIVwE5S@luf%<<Dv<1Iqqf``4ZO<~K8Y#iROJ*vx3y6%`+)$iP%ozpbD
z*_5YpMCSZ$2j-ntVdg}no_<Wak>bc_?`cl-xC`mWBfA^?xOehWsfOJu&^fANqEvI1
z0zDylb&Ue_X*N7``m|P4Kyl-$4L25+)B*qP#(R95`STvw)@MATeFw2AGCMhg#+P~W
zGo<hr4^=azxUuX>(nsop{O*tas5J|&emD7F<I$t_jQnq-@o@fsiDywb7@&B7#)?1e
z3kCaKubB8>f4!6cD4g^}^YStpjp6m8(tAxiNRXD=)DeSKCgY@nIdG*bd%K6BW~ry&
zp+Su*T9Ikw$w~xfKoMb=0mwPsH6P$Rxn&D<cK7h)xI%-!QDE@lQy$^gkaCXI{PR=~
zT6Ez|E9pPWc)02VwVOUr{ew!Mt2w1S$E&|&{wZq(n4E?jxu>rWV`k%v8d(n7q~rLj
zHmbu>_j8>9v+jRu>l-Qhzt&iNi2wdY9z*{n2B;I@(LA?6bt0_(rB8%x5O^za;2Ii$
z=u_h8cn<|L$A_)p+414`&4ZkcF1Ii15^ye{;xd4d&WbR?K|GLl%^c-6QPvXOMCKjk
zfFKxKdcC%W^3;q9!q~=|lft$Cw9W~K7;@-=xrm`RV!bpLS4O4Kg`0x|?TR^yr1_a4
zi#i4{w*<Hvq>Jb?V@eXFJ0`WaZ+)Eb2zuICTV3F!IYSsPzwjju@@A^f4^5pOSSH$Z
ze#u+u8BJ|^66NLAoRYxLI=wPTdzT~2!DO_BAx$Wvvs`W!yC>6%8?GYz*%PxO+tWXA
z=;c4e(`)ymBndC0&nN<(b^dQ;<3F#jt~{LoU*cI5HU`}F@ZT_p|N8vWV1o50;Q}5E
zL;i|}A@_|BN&*AcfGbYOik*aAHaLOu)t*uar<pga)|6YmQ%W%qz%8b#YqsbkblJT;
z)wR5y+bw$J-l<M`h2QBic@pqcxtU_{)GXym!bjF1d8aF`#scskC-+9H@?Ph6)&D+X
z{qOq5=Gq!1epqQVHX9H2pI_uz6dD7x{?~ujZ{h*J_LoZfu)wii;jT0p(@uw@M@CJ8
z`Lf!vRJDmn>cR5<NpQ4%^0H1;^%)V*I-O!ky*Cc(VY?U9wF?-*X~(@D=aNy0$z?OP
zq(Q!|uGZFTq7{w#s;@$|QOy93oS;W;7PsusHHe)M%%(@d{w`Yk;{lRBJ)}PgCQ3)Q
zw&MOS1`neXw1-}Qr#J#mEqW<iL@<kDZ>b|jA)RdKpl4i|&`ptb-r;Z<qVY@bmVMJ0
zsPwH1+vIp%eP3H33C7RRH2lRLP~X)%(fj&f((C<<u1n|wg-%DyOEhKAp6@PE&Z2DJ
zq;uDkCkuH6C`255N53GT-PTNQ6|=>)SI<1FvcH=@|8nkgBUjIp7ZBcWAHN`(GVlh2
zNtM=u5ARm+vbld0v`&u6HLY63fmNMCRM1MJw_`aCqgN#_k2r<XE}Zm8@oXHFrGNpU
z!m*3ugh7nPPxkzov;5S4jmJ0je^DHb&<8RSxMhM?^Jx2c`{eMr24Bzx1}QJGM!oCs
zHW5UWY70iX@vB?y?@2WNP{1^9@IxQ_i&n5Ww>)u&qg#qO9JB33{k%J<C+PMpLMqK%
z^a5uQBzH`Su2>TNEEPBW4r=w{_+7$L)g*uXoM71TBo_ho(UX(4>oInf0gxvzu<D8>
z$1$QMq}yk5E-T@?ttITj6Z~iC2{*J=#DAX%=t{LM9+$;ay={0Kv19btUyEOD7?1A(
zLq4$Jss1fJSyBZ)EMUMs=~lM|d&jKYi=Cac1WK{TPzYU{suX;oidCx^6$0wZV<7}a
ze|#m4M6;>Xq1;4<Oeo@JT2L;K7+jA19+#`jRgRp<0;ol55$-n(emn{(TO>No!opof
zO4GzQs>v|HolXF#x*Flnr6M|^WjkKRncI*lu{&bv?Mh=~>1U2uC%Z5wjGvt_caCeP
za_L+Y+e}Hr^Ca%!!HCl(<1C(@zI|IiBZtj@JXU`w0pchMFnkB>^riag>A&C;|GQj&
zTYFopt96Bi3J383PE-tT#y2Hsf#T}nG1-yj^pH4Bxawzty;+x%uinD*RsE|=>8L7j
zet~MHibGc~fl9y|-M@l(DqO650=G1cmu|xf5I0*$zA|v2@q%i*6AvQ!)A$bW?-p>k
z?C%;cQ<Wc^)}c^P2((9LTId*>P-I8E`eS(T4(@e4^o&>L&Q8r)ayel(HYj)$brNIg
zzK<kS8TLRCiHq(C`r0E|18ziyY!lnb;N2j;9+)NwccPxzi&p9Mp7d@o$qJMgq=eR6
z2$dANAdmsgX8f?dU(!4Tpp85V9hYsGcHIRmN(RW?iv(6-?|BQp!M{wW4B^4c7X}|~
z<J#hMNIE9*0&5hCHZWdD(<s-Z_2!>jJej&@7rId0LeAgvzv6$Rn<%;&yLnUH(Qjp;
znvKSe=Xgp)mZvWTSJg~eP2}=k6%EP9e$land@Jl)dDf>nF;)H92&2baQRuIwZ6nmH
zo3-YXOh=Sg^_ib56y1Rr^0+&$l*i*)do+c+e<L0Q*6$p9tBYFB<Fl$G-<)4xdycb9
z0}~7%V#$q>S!W#cqS%j^Hz4i?<y0e-$f+ZrF9GU|yXeC9kvQVa0BJy$znwlytAo^r
zNxQYf{z`9E^^J`EVK5njC(AXDj}MQrm_!L;YI_*}f}$e~#9P{A03>_2_>Yl;{8b;i
z{lhKqb4q}w%6}RwE9)8g&uU}+(S!WwOFUBk!x*4*z|HFd(D*9}f@a%#tShmAB!nnX
zrz}M!VvA2P@XZjo!D!I#qRL+KaWW1+ECdz9;Mz(RWTL^h;}P^{7!Nw~ri!uhx@|aw
zQLNPM%RlS}c;-nUL0QJ7nw*bp=wI>IgY8$%5A=~DWUCh@_P^>&IJsou7D)(>j%ZZ6
z+?)-mbYogF!e%TS{h@oICV*EBqk5<Vrub_H$cH+eg;1q~%x~29$XN9B`(xqpQH7ji
zQv&scvcpox@_Z9wI7zN3M9Kkl^sI8)Uk~7(I7oWkF&wfDcvGwYy@~>|03NBIFqL2c
z-b&$l8wy-rb^q^OuRn-~|Arw=-e2F`{=(o~D-!>6y8Ubi#{c5w-hY3;|LWlI=zoq|
zC$E3_@y$>FYxN~9=(~!qaT$;RXu;#@8FmU~e8_9i3moq08U9XWxEPT^^5EIw?oT`*
zaavqG(^py#5caf$S1==mymDhz@?>V&_HcO73oq$zaIiDIEOMpY8@mVak`Vx_P`~x3
zEtO^^JpwFhb<AIGtV-%mdCRHZ7wndGr@U2o5QPQ34BJOX&4b;O!ymSRS5rHbRsz~4
zfMv&21{2qL-k#*Vmv2w)okElj#at-8VpW>zJc_sI79e{kze-FY{rD)7X{ID3P6H-G
zi30hRcU;QoKreKTmEjORB^+r;(>qE<;&wtxeTVVT?7p)70{3uvAw{&^t`g;T>2^is
zY{5G|@XT!r%XUg9(%`Zxttrm<$jqbgccJbC$V=g&1M#KIe1V&n+|FbUnU0fMCUK6H
z@VtvEeVOC|g}u}#q5>`qHNYB)VpC%zcv3D*Mu|&<c!?nO!&@aO#aKmMwjvN$T|7gS
z*aBH9K05X;nAlU2jU;=HsCAWR0A)2%lW1P^Nj3E_n{kj;^einZ<!-8Jazn0(L!9&L
zF4`t|drUCWy~Z09_HN3_iz|=E;UDxwb@#@@u`2r_DOk%$<us|b%pVPDuh=ICmC)yd
z1O+$kc!ac|cUxPS=crZWxYH5l1VnVuI4%>p0Pl?XY>3RD=rHc};%gFfQ?QeCgiR@K
zA}IxWvdYX?oT$heBHA;_G%y%3kus=AQ182;V8s)#-&I|$%10Q6lqAEXL}ecAlEMRy
zJQAg-{=+G#e%|ra%Q240XLK}&qxz7E79nYt;UJ7!h-7M29Vn)P<PT|t%<_b?U^w9r
zR7HbQlMMwDyRr<6Cu5h2>c0NKx}s5}BV=|>4kijWV?#NQ1~AiO7Ti&sRm$dLpkXX*
z)Ri!X@chf%SBB2H;{Y&&u^x#*mobrkjQ1xqg=tXg_@=J&A%;pcz@C^6uvF4CDyD8>
z9K(U*=qPwCyF3NF^$s&h7n6exFUHYG15;z>3`Ew#T3O1L3oxk#Ohjab3b9Mt@hSN+
zB_*0L4hc^XN{{hX#`fy;w77PL*m+u9x2>qs2<(_oWj-!Zq(`708wd*jhnD6DbOV4c
zNxofn-QEJ4J5Hw{)Ub2%52iUXj}4aOFDs%^$@M^nX3l`->D+U&ry0#d?w!UdZ$zW2
zcl6!Ok7#;6h;w#+r`tibPA>|{=pq!-#NEzJ$Zq}^GfD%osC3lD4ZsL!k-IbnEU0yn
zJ>ox4(l4_2hXsFb$LXB@N8AhMWw?z-p5qB~rZvsrqDiL=;Hl$n$s=Nf0&r!0DY=&D
zW?Zq}Bv;vYk{t?=y-mHxr3&z4lKFZSjylK!OV%jBtJ=&$GOBYt@)qL!2;NUHACn~5
z_b^|~E}3XyCuk?2vQJ~A&PJ`VqFDMKa^A3k;9R=sUe;*Bkeo^m9+8d60IiGR&4TUM
zZ-VE0`xGn6^SX3u12i%PuK`P%l_D;bcnQ?WR|M++;otpTLhn3IlI>*5d4TqJ0feQ&
z$%086&3M6}S%9bN;lcC07c_dzs~~e^0|>h+?9*^^gKL_@X{2(5V&HXJj(F6)><%nz
zDxOrueeCQY&$ClNUGbJQmXLErS|lb4LhF=leQ!#s#nu|dU*&jOFPr=ORcYn&fyuZW
zLfu~9f=tGTns$6o#wf`Z0jr5xJ^c<gZ}r0S-X7kT)R+<GT=$Gl>$+E1us5^$!hfr;
zYGa%4>Wx)jZ*vEVeruIXZG5ME>YJ*SOAt)u+#-1}G`+}&p^Ic-Fgfwm<PVwhlE!!{
z$S;M3yab#2GQcc5)0Hc@0g$N-GNrwqys@BBTJvE08Bz_2*@O+J0<Ht{u25wFdPl}|
zkx<>it%8x{_0}O9776BYMaX=!j8~ZTIxWk2eth`qXnW`T?H5fc$dTRwWhuIl{?Wv2
zD(MWSy-W-PiOPq8s>fmw-Xjy4{YGjTdOfzy-~mt!eQ9nd0m}=I<hofGPjzK6*@RmR
z4GQ0r$ATp+LJt$XW*8<{UGlAN>J0H5?Tiux$L;oHr1*S*lD=1>o+Rn^yHJb3k%u0%
zM`H`eUTK!+q_U=6o>zaIySfTR&E_XKgL2LS$$%=+b(V`!W5A(7k5xJQ_3NY5;PB<A
z8Qgt_hvMh%Ko5|6$gP>vKfj>Bp+K3zltSgx3i`R0PvNU%vDM7U2}!@oid<82jo({Y
z=E~SAu7plXYckSBu8-pI3d;lUC8;w~Iu`nVyzYypbhf1K74S8C$j$$;Bx~7S=i;qz
z|K_~MOCTcXA9B+={h^SJ^NuuU=Q^X6E^9HKTX<1et!*}x^B<fN@fhWL@)%M=p_<dH
zU_00e^z@hDUujzw;AI2O(2}MU@I%smOc~MIJ3KfmS5C1>{BO14o$DIB#kr{9pQh8#
zZk2kWLT1&pA*5OZ4g7F37I`0Fe}ORxjJ81v8ziDr$d%`N2XGDGT~uN&8`IEPDvH2B
z-+EiH+Im~?7U#yXDF1q^g(S9FzMQ{PdA8$rBrb@~{j)RmS$#j<g4@QKu+2Qr6k?p>
z9Kh$g((d3K;NQ^xg0KXwS+InUEQ-j5oSIx7)S09omgMJ+ZS!AvGl*T|#?(qk;fa>5
z<O6cS%v?Qw?zo2jO5T;^M+aB11|V`8)XorUfeO9~vN2OQMbS+qTh?ZmSS3@%^xJ}K
znE&<H;&0MGup{ytOU?P6db(=5N<t><2fIN!x)F0s-||t6^v61dX@h54xAM)adv8s=
zCOc|0((J${A`|E;pmm#k0vw@ON=9aM@e6t4GLQC-JWz0dbkKGvmdR~$*#x=)oJWyL
z`h{e2GRB-Xtr(@`6csc^K{?8|$K)R6(O|<Hy4~Pp;~%}T^C#a;!yZn;Z9vzssAE20
zp1WX#+{D&Wu_219XuQwn^~P#6U9_OBrTGi$-X#!EVXL6k8ZSQ@fFn<XYnp~-nd*DG
zud7>iQ^g!xf3ry_qzU)agVw2*lr)+j*WOnnv*i-tn5U<JrCakaO~F4H9;4YwykjEE
z%34;Sq@rW?Yr%AC;i%Vz%XpgUa{$GoTq_K|tMfBKmvwS8QLY-)CzW<A5=*zgO=pRI
zo6hR|rae3)@uj#$Kycp{^<LARc$=kwgsoI3yRrrWxIjh^k<)NqoA{WemN0+&&9Mvm
zRsZq9`u+It;)AR(wc(RHH+|wZe&RHLGNS{|$)zx3+h7pi@#7p!L2A`evY<`|jtm50
z+32V+brb`LXx{&!{Gl_7hg#RBp2yZ-de>!ooO6iaty2>j@4;aUm~CLnenjmoV2+dV
zXwt^rg?NE;S?6`apLU<=f=13EnU}pV`!0#I@0?<U8}bH-3`kmt`L=+i7BTKF`djsG
zAM4U;{GPo)`^A=+X15Knm{%i`rPkb%b`iH>S)rE1)38gH@~^BFvBBjNb9XIsAerSY
zWH9kW3d1-S3E3+!y2OBZ=TR@dew?ZEoV};;dO^NJDS5q%taqB+l-m$__sE4S@(lTF
z*%(IE3ONM;v;1IF<umJJ_f6wlTHFoGv6KQ_#B1N=0xlCvIXxGc9dqmFQoF+=CQp*L
zo?>boBXNPNR7ek@wv0!-@&mjewqy`Z0i_SBLQ?rx3K}{Y)+&|4^y(N3r#co(wIy8N
z>PS@IH7X7GceSz#|E^Wm;NSJiI{dp)*_hdt#=iynYZ|vEPkHxni+H-GqD+m7<<9;b
zxMK?C;Saarsp#xte!RG4XqrJPi?XFK?X9;dg&9Ssg2VTDXHw7G#k5(PbDpv@b&*%l
z<sTgo*;#Y=$|)sNFH(O>k~eUumt#lcr(SUD)}!~|yWR2`T&$^;{CFA`ZcPDwr`hn2
z?r--QUN4+Js$QnoP~#4r^`3_FtqQL44eblb*9hA{-m^XOMJTjKZ*X7Uye()UhkDo+
zs(53WK$)kyznm_Q53aVnKD@!2=JJr#|MjN2U#~CusNkKCVRz!@Jd9J7?sz1t*}oUj
zn0`F-lS4@DK7Z<?nx8uz*lK*A?AYe#BM)y4<dYrYcDLp^$ocsU$2mW9;+-ja=c8R#
z_8nFDOu^1iaM-J!-|fif=gtSeYHaQqy#o`#Pd+Ok!R5_z4qGs_miM)v<+vlez|UQo
z2DjF|SO+<VyU^OZun~8iw>vWyv!)=Qy|9Ng50i1%p*(q#dZ}%YKWex>girITE@IEY
z0p+$x>;k#6SfU^ob?+iAtL~dtMYWfb#d`af#8W4PgRl-TQ<sY5km6><kCB!3%UC>h
z$B73P+i}GhLv^4W32vhHgkmu)C1@vwYJm#+NJmKmP?i$uT9*a|`+d-X)<k`hj8JKq
z-tvamu+6JvXfMxssbZgG$pf`8T|spp5UY7eh{HS3bBS}`RffY^x;CdIS1<QG5*6&g
z>x3+;w84qA_OjP_ckkG&BfC99XT8wQy8|y(rck``I2w$*D3&AV3<Qg2??y%BuZJ=+
zs}P&6p~uFM^l)TkZRDORh8cXyf<rA=*AesaW9}$cLpjH|wYP3~(JdsHLM3I}t`5gM
zc}K8^DteDxN7ut`<@d%`%N6V~3u`R1FZ*VFY#biYddSs4$5_rQsLkZF%i>-a($=84
zQdZLi)~!mb0+N0wvFJ=F+eA;&H3c?t@Hq#d#`0W@{^%W<%c5p(iTTF4np;m5RA#Y6
z1gGHSrzHRiV*ZqUf=N@2<WQ3-v_#cJe4Ry2=Ab3`<k1s+3{9CuQSiAhRk3=JM_KTh
z#^C3$>A8&kohS`HHm#YD(&Tn4_g04sdmI5S0O}TO2C0yb2+vGHQ}z`k_4QI>tJu&<
zl7r%tePl*6=R%Z@;?q=gAAv_kel|sVrk?vs(bSVgNM~06!%=cRGUSYSek9F3&@@^8
z+YGuauMB%{pdT2mRU~M<uY4M=BjC>C35N`wQorE6C?Jx$UuIBS2Br*t?mwF|nwcW7
z!S;WoOcm&?Af1@3d6n0R;C;v%^!?r7`1Jurw4O1disj3U4hYf=0Nrw7$5D_IF$|N0
z&jmlfpx~)6#AH5zUKnCBtho%n^m7O=E-1YQdj3uU_&$OQR1C|^98}Jc_NT-Z@2yrn
z^GXk9DW^Obm$^8HGXx2~oAV3_)tz=rMu3ugk^51tG^JZacN;5&`QY|Cyye5~GLAdU
z-J#Eq7t{rCRp(**-F^E$TR<_7qHx>9_)bNJ!F)7PI66;FuHV4bDI#@5)~!9GD_Tz9
z-!YnJ`dvMHY@P#XN1bFfVyTrX|9VrYEJ@8l25ezzxd@-L0(;A1Q2MPe6&v}A5^q!{
z*~7Umc6r9a5=PcoSUnkmU1si9eG|I+nPznL&o`wR38+Q1ylu=B{iW|xelT=1+B?`u
zTbC&)X?EIEL|`l;#bwKA7nXESww3l&;hL+aCW`_wxsBshz%i>$z-qh;0BxS!_yMlf
zG7P^JyhBHCNip?aQ1CdszMLh0yX&%D*XU4&2UCL6Tq)=DHMXZQ@5su#Y|L&#x8Tfu
zKBw(SGSDA<3d?Jv-3M{v)8O;d!}Y`f%a?-*{^#BDdD2<N3=w7P(vcxT{CIQ+_{_sP
z-0_ZKE^Qi(OaP7CTieIo**rJ4y_}Vtdi9ujcl#8ELwCNj>EfvNzsIOpK=2VHPCa&L
z#9#FvAFSWR0_9EpXXR);T-3f&ox0AWb}?t0Dpg+oX>m-EV}K&odLeOSHL*8#lK*Na
zQ%~(qj~&|`jd=yHIZF3#Inv&eyI@7MCnF32@1v*TB>)>m?<p5i#l-spD7_fK;D3Rv
z^H1Y?XFn9RM*9u<Om$O?Bg~GELM_)R^84Gj%Vkk>3VY}gm#NjKmGaOl-A$|0>AuR_
zz=RSi_ioeEnI67G4x(16qFzcRrvi$4XCc?t%IBt~Sv!I@r}forrbSxQJEB~&toK>R
zyI^N<F{a=QUIx10_qd(L%|NBQaWXc@8T^cr9!_OvY<NO=1(?&ia4*(|A3ygY5!_;K
z=F!jcqje*9gP5zX<!73xcGf6T{L}nHaa7KC20UX#cjMFenUh=N=c9NwesVZBesZmo
zazETzUOa2v?=7as=VL|n_J|yDeHK&Zurr%ObdS&HF&Vqp(&RIT^N)H8dzd{;@>oND
z=9ZDo@DFmIDf2ny(|xdZs&TgcJm9ToAb(7}ozC~D=Z;2bpB;biVnFJVJmOP5&f!I8
za-YY!+-IJ}*?d~P`x!2La?^!bwBc^%3tj_;xlnknZ99F_=Hkzk4SSF6nq$T=&C)lw
zWA`+NGqpdVQ5-+>V#90$Iez~9_%OwY?(R5oCz{sFqiGlhgd#MsI$K(;V4w>@Q7rt6
zp9zPNjhi6~Q)y){msWZQuw3hf_Z<OX{wTf{A?h=w5NgSfDvlxY6PcLOYuXdyMY$c3
z`C@fH7nqE2_!;J~@~=0w<+{{j;h!iy(0{#!G5S?l`7@k9y{|B#Y_IzcjioR^Our8U
z5631%0S8I+Ri9IHjid9|ze`AnTqvFad#;C>z3%KVZ+MAaj*Lwyl`TX4CqibMW(<-j
zsjONhf^}2$3gJ--Qx$+-rY1+}j*b!<haEH*DQ$BsP6;yu$7;h1QyO?s24^?|>>?Rh
zZrc?RtAP3TpeUQo`)GtH((fiZd}ycUqSZ&(a@>j4%mT0$GabcAF1-AYbqs0x?9qqL
zw7E6GY@JhqMXlXYM~4G{%raM6o)95&#8_!n+Xg}~=3KiRmKMXDTCmX82t(3xz~!hH
zaq<_yIdn=?Ay(NIN`#|PIJlIVyvaMtf`p<&JE}XHfuQvi<tOT6JXNU1U=`1pNTH)~
zKY*TeWauWEVf1&?h8_95p{fQ8D}R2_zaIa6`uu*#n%r4inO!Ev(c|fXjX4v1(GIF|
ztwRUttfx65fBjnaSiPr9EjFQi1#_E!n+4^zslLx^3Iu><I6p(T6c^|q7%yRa(w}ht
z<=S0WZpPeLL-JTg-eZPl&(S?*$wC<-3iOXf2`paCLknn6<1S(GJM?B8$35P&$~c}9
z2FIg!9NhIh=A;cWnkz?tV?f63DM7MYJ?4na)#IrPmR&AC+kGc0dYoP|IY~4-I^eC0
zoS6=SOEEs@3znM+MVyMBYv;g$|5e1!;lWAs;G|WSw-;8YXyO-N=n{CUVHE-=eaAey
z4k*ImZGWUC;sh%&rAilHAxemEpg+r2#w}wEiov7feuQTwC&$tWbH>*(>rgNQC@M&B
zfzjGicbIBp@E(fg%lXbcA#bgDknt+9M-mDS10y!;#kTKf<~D{gQ!RYBt3=LoNt5lT
zFF&4ZnSBX!&)zw%Q`m7tS^Vz@{ts<p)x6of1XH2VbDH@$iAV#H;Aw`D!A+QAlh;Uw
zA+PQe{Ws}_7TCY%0y9{1uw|KS-rd1A*Hz)m2uBy!amCnU5upv>@{lAHBhti%lFXUf
z<|>JtV!$|4wl}CWh9jp0Hl@@3-R<37LJ)zuOIkl{@4u#87q45*D!e#3Jlxlr`vCP+
zd6iGb>VVEjVkh9!Fm+x#3oz0130w^l8U49R;h!torAj5MLHbCSE8>$oygdzPX&1+g
zw%Hm}148TR$d3wbGPBJaGP>B<T9{vw_gP)C=5)fcZvnZ^SXuWgC;lcr11r!OA|*6M
zq-50_p^`&xdR^c7)E=b#)umG_Vw=-_uZG;dW?Ho9jw)YE(R&Zo?tEfB=k_>oV#THI
zlB^o#S#=t!?w7eHW`j&!V$o#66-fhtw1}X(?-v5xd&)n0=0C{-+-V(r%OM|{+w{aP
zmwoRYdBL>EsWYyPc2V3Zh2mPlvrz^;o95vKOXdV1x>%##Z#Y6XawFylpT@D{1H=rD
z(qiKS{v&z4)Vw+35KpMe6C+OWbWswY-mP!L-u2FG8vU4?a|ReC44Lcx>{Lx%aqlwi
zAA8Zwpms)PHTyb-Pu_)9F7|ycWiHsfiy1zId-m0f+VqLn=Dw`naSi60BWpOGZ}*;~
zd1uM9M>CU_S^p_QE_1Clx$P*M3H<+m{h1$_T$vr9)?fcjZLGkvxxNnnUEA2$T&KSq
z>-^u9mDQE?)z$xMtgdftuC1*$;P*;nbz^1Yzr@OC>W}jPl?z8g{8#Tb99%Z0m5WBn
zm*~)!eHMj-0l*)@#jhtGi4t6E#&FVCS89!K_(rr74{t}5k+!r`7OSv`RrqJ4f<M23
zpN)0#953;$_+osGq=;hlQ2MEg*c-I@PDCD?Xy%Lu;{}#aWO+K(azRjKbOTLLQqk>q
z(TH-0SH~ogynP!wh<D98k-B6&>Yh)=sAs6i99@)jPv4vRai@EM(fnni-b9dy0VDHc
z9|!Tc+m3V&+R=NwSMjYG^KLzZn`bOuhF!Sl)Lem#O#8vXI^dpn+m9!SjIM1y4k&pe
zDg&ykwZ@vsJuWkFO{pMOYa6SzS`Gg52rfD82%`wegt^jGR9?$Db1)WxS;CYAqp<xh
z8dC~Lll}2!bN?u4ogD8SyueFgR<t7fAhSa1ye6Cs2<0l64{HtoS;w3+86an;v%vrq
z7l<q7k_nW;PA5_N8tn_hPRjfnKd_^*PLj-5b<PtNV{UDfa}CkR9oD6H>n62kkp+tt
z&%>nK=1VnmO<jh{ndW68JhT+RY<Md9noeZRd5!hktH|4?LCvuWUR_P)fHV7sMJ9}#
zN&*3VBQbiJWNwP_MA-$U4OozzGY^q<7*NPa7RW;y5bS+4=u%{v3?|4luUc~Otoi&9
zWdp?(xu{MTrltqYeoANRyo3B<z9jU2f}BG3J}R9W;*Coptc-(hDxt(lO)sT#b0!ip
zz$8!Q<_~h<`O^nIWDgRl0eqS4L8&}E^G4mjqYJB|!Zlsl>+^9}f7Og%$26x>yUN<f
zI=0@~_u`|SNnK;Hth1wYO}o39@W*&EdhN&Vm@3C_|MltoW9RX=nBie@FQ1B(nT+p#
zIj1Gu{k$>f_rY}csCukq^S`R!AI#5r{Vr$StMBGtw)=^QiFO#9i;&1>XVZ~6UCKTY
z4Vmq)H5VO`qx<w^WG>%=FHJ(`bPxM{WaM`x8Tq~rbNV*ydMJg-JO8Wv`9c4h$9rK8
z(OdSqXL0YM4d{Z3Q)62|Nm0Al95bhU$2V`$Qbc`HYHU(alS6fH!uPc6t1j@dMakc)
z8+g&G%on`qW{A7q*nOiJ#n{OOp0r2ZVa}b&zKAe4Oj^nTY|-&#03++&R)pz<u-m_k
z#?s^h$3_0fRwgbQw9_lyquPSALl_)y3%F-BZ4^mQCdpp|c~6q>a6L5(>#1N$rR{^P
z(adVzD!R2){FQ%wSn@Y*7cMxhs7`1hvZt5UNZql}K#9Niw)EDnVSRX;0cy2eNaMGM
z?qZ-TQm~wrEmHygwxXp31jp=z9K1Q_2-&fN@mJ9;BQ%ngg)H*SiPD+gORT>4eCvu+
z*VO&!T?H&wY<SD2;ooV!(ozRSk*G}7HkomcnGEg0@I;icPR=$Ltq36USJ7yJ8HWPA
z<!Ev6V{={qti$ihtR`10%wZ%EG~GcnnqizID5qpJK*m6}lkO{b!bqaRBvnLrBpHUI
z_WN(KXI7u<VZQ@ioI(V()W(p(6EZp?p%!+nA6ik$N6{txN7@Z4nZo9JO;$Y|h)a0U
zRw4aZpDDvzz~Y8&CBr3QV2r*A(kNTzzh+wxgtfL>J(n5cH`nQBS9<HC<d4jOFqP)B
zJ!nN1FtU$JG<)ih8kG(Z#-ciPmOx7A*&23PGDX(pUBcom$*~ZZ5+%Gs>2-u@Kv9N;
z^CS1MRZ=-1u&`!9SwxSoYG{}Q<$Dq8g-MfpL8*APf|slYfpe4tfN>AwF4^M6WEJiB
zg1{k)7G&Xh68BKvj!h7TyHF~`GqdS`sAdqRQ?I2KLtb;R4IGXZ)geGQ`)FfWtKW)y
zFrCRCc>Q6^iW0LKUD}nmeY66=nUuTDE-bed?y4*#+Fa#3pwnC;R(FGMvG^}VQSeG3
z<CI9=SH~(zcm=eF40gIjDjZ&!#){GA>_+b+j3P4<J8`cU@ytHeMdhsOQh>uRCS5@D
zrzDM+@5!9AIe6b4#RL3pwfo)GcszVuuXo~hQcEU-8tjI8I2_Uo{HOj+W3#%^So;QZ
z`BbC9`+xMdqQTeU*86UB{j_F*DjWfF5OIAKzKb|eqI3))V@KKvgIkmF)G{aIOCe$+
ztUavvdEBD_mV<Y-g4G1xYys6tcYq$NK&~$b-Cv}kkwyeT%MSQ@Zgw2`rgSeXmlRSQ
zNz_6`0cyntmlaqZidhOgWIAf#IF8kT2{CqFHUs$I&iAELygACnz~x5K{$(#{zYpYM
z2b=5g?aYKOLDXu#01_YU9325C)4dtrUc{4;fMN+&Usxn<lL+>YHrE&2?+c4SD7qK+
zg(Ig$yinzR8pPIBHDi%m^i=T%!q4so*ueU$y$9OENh)9utr^_@yr5RM?EURr3%kqT
zY>MB+%{Q9??Qc&##sRCAb&=FJD*0J&MJD`6j<<d;?e7HJ`}<ovqPVjos>2bG^C}mp
zVoOefD`hA*u>9wk&O8>C%5cdwq}#I0=$t#WX+M1()!f$JbGlUGf5iXy0gBO!$5v8#
zKt+b5j8_cQl=X^pBi40tZ}D~+U)WMQwCWUGlTX3)%53p#PlV1|jqBBFBI`J~D4wBe
z9R_nbK))fIau840CF|xssUUAj$^^R^&T5KyoB@|@zHBCJ>*uyR8E9KLyzY3c9_N@7
zdt&CE4Z*lNBkHClAaJa97(Z-uDR{A7f^!Y%Y(q(m_><mP=~9J1y}3{3>Ba4LpU?7#
zpXv5LE32EEkN&H%y0*HpzP7%G-y4nf#)JLO7kL(i!~kXa(^zv&e`>2a#y=Z>b&DT!
z#RcAC|8VDfk3R)`IeB^9+}>4o3dTbMKB3Q3*hzwL*hRS*+|s)@)@ijU4qMOb4Y6KZ
zA)fygP|?GdcmphTts#10`yEZ+kii6_Yh21;jM>^FmEK+gN|jj_7n4ETvW`Xu5Lv(A
z<fkL(b{eGS^rThK-T@SPx&1>kIO5?2$3OB6h|`9}7K+nd3S%i*RdICK+Iu7V=wiVw
z$csI3&{wbw_^y6E>Z1ERw4Bt)mPo=fzZR7?_dD6s+SOCZ@-0e%fQp}~I{51KN%IXX
z%+BlM*4__IT=Qr!>9gw^iA%_~#!ScItE0XBCY(6U{Z>;O44^b)```sxu^ex|Dj5#g
z-zl3%CMH+}0pk0!)@~4ptu3*>5RFDCR5^$-+NO{nY0-f%n2gA5s}ERxLqhNIgk`{_
z5kr?rxKb=eJpf$dA$OpK=D`np$A<^6ng=JrE9mlJD|i$9(1ej69t5xU4iti7AG8Ys
za0Yj)`5hqQqm^=M02)j2bM4Vx29ZPyz?F&{*b622QO;SrCkvx!JQ)qd-)^3y?+#}+
z!sH=q3f?TNwbpYMTGhyGO)@92!;g-eFkwU;NT9eVjz$q#<t5!Q^LxnMU-r0#IuYY`
z&800C5bWyXPsyYp{lou#P99+T`QK=)uB@fb|5e}#9?t(S@hl1p12hlt$aCa3zWw%F
zwD)~P_P*c#<xc;jaMBaa%gbmquHi<OG=d1r{vjL*^v~YG36hN^f=vGaAzNbK_8QcZ
zvq5A~oKNtx*fv(Zn+-Aprf?MJk+=xqS~7xa6kFo@Dnw(1RE<@1osK7$SNO*_)HROi
zu*cMkxPf$k$POXV2B4^2Tw5h!4Dc1B%Lss!Li|8p+a`04k}fCZif`nkS;7PL93jZ_
zs0O&eGfY>^+jv658>9Xt(=iOBBVXd*4x0tPkUeqR^gFRqxz`7+y%z^?RJj$TA!SD3
z<@5vzZP-SU5zb$LulXPP#z#eN0n5}u^LsbNU%B{j6ki5y_zBx-5Pv|%?<N!GE*Emq
z`Z5_L-AkBYw@Ai{pqK|NClMrV{czmAG8lRSI2rW;uLiAgJQUwYqe0XYrNdUMEZS{R
zJrwQks2w6<Sg)l(0U82dl_U~(NGKVaR5a8A+cS6jD3A|P)0qG-m3FBc#OE<anzDdJ
z$`2ejt#o_C{d|Fms}dA^q9?lDBgB)}2a2n6Boe2&yq#v?{`uA8e`+p|Xi@@9K~~^F
z<t_#&@Z2Z7d$s+>UrKHg*i8G+r)HxsHTL(#ci)Lp()}d@wxQ&pYgsIdotN9k!Lz*+
zQ5CCYPrNF-Io&H!qL!<oA^uLC$f-zNmd(xTIdS?S27puzj|d3Abv^HK`AS`=wDLqe
z5#7K4-5Y4@SO3JgP503i9H+?F4)p<MtuLNF6<u;j&kdt0xl7+L6c{sqb+HPZZa)_o
z**SS3eaOC)Ew4PW*;sx~(|_lZh(Vk#`q+|;Tjn>eQSjVUBF$B&$g#~!D@Gd5>W1Q`
zrTXnEOmdH>n&P3EWwuXRKTW42SCK>UM>~7-I+lM30~|VrXCK1T&pLo(9m(?@$T_{m
zF45WSe$PFma}Hm9T4#=5f4dTuPG=r_a~Cv+^Zm|dvS&E>K6`|m23ZEBb+C7I)I4!6
zm(CxvyKD4XQ+BMs?#!*5w@CNe!#RkP+RRNdq+>$@u_JKCM`54U^K$1YrzILC>3_N?
zG71L~y3t9!J%EaBK6{DwuBQ`AY*fLb2B~UIDA;9)Kx_!8pMM{Ad!+XDlawXNtW@w~
z@gDCBuq~6Y0+4jDqc|3QR1M3qp;U_#>GIU|`_UM7@_97Ajw0CG+yeGqH3z_8=Aui~
zGQ-p+q7>aA(}B{mrSmxMEtPE%!Bo7H+bzr3oSxQ~DgF;|NEMhLA`&#^WA;>o?xUkz
zJi>sDIN5ml!;d32eOBW%*bEFD8<6l7i!Wg3qxc;R(*~H-ggA;uSK%;GbjV^r&m)<C
zX3Wt<;i9<;74~@k`cX&$f6%U~qmyxB-=mvh)VA`Aps)=sJc0bH$U0*TVTAqakdYIh
zn<Th3)N9GAFfAt$#q{Lj_BWT~=%Me-x2vmbYmZh});7P{Sby|r<C~R7z1|aV`2kg^
zdTQ+Ns~Y}YBqmg~@y+`B=A-rXl}BrjR=(ZXXlyn%UYokA=agmyQ5~ja6w!4VM`4D6
zScS|fLJm($C4ZNIuUSE<;0pZkjxvYo`3De+$D-OOpFQ!kcYa#R8HV_7OO*WMF9W!F
z8zWW|CTnx;iDFm@*J*0x{)T(V_!e<mg^z+$d`yBpqBmFFi?Iw^#fgxn;XpsUnS}=V
zi^`RK6EZQ?C0kf30TKXzySY{tzX|*Ucv<rYFuwXd{7g+3eZbc0(B-oE^DB{ENBB5#
znwmIm$!}fzldrvrYH%W3oTw)8MH!jgzn;SN5B3azzI|r(?@aygT4N)v|6N^w^dSHJ
z63?Pw3{axqjoE=88sC14y5E(xic$lwY|a$}f<xl{Ipo3sCp8LWUTp@pi#$*Kf0US<
z%|9s=K|Hp2Og0%+M!qi&UW*sefWj;uP0rC~a35M8U?_o+F0n7wrEW<AqDte9lABD%
zIywQ&3-sqbno~*^TE|dCuyWN2j#3VXcuMkW9igo-bzesF#CojAV@6C`vs<9FViy^_
z7{gz)bItkfjIpS3RFo1M!}5)-78nI&D>A-<{;z4xZpq(*!bE9iwG6{sRsqR}T(T4Q
z!|p%@_?Q63jFQLF;{A1Rgp<4rtS#EKe%Ik2|7_o04kig2pFXYV?XpsnwQMs2@!b{u
z_n+-vHyPHDajV6n%cr!TR%n;;?V5FfrPI~g#tL4ftPA(6;9%d1<@l=gg0Izk2QNye
zDsMd$!I?qTBg|#g(cutwr8#*Q_2Gz=9W2YBFwQ{pVEfrV+!ujNC}s+S1HiVz!c}-}
z9s2SXfw!Oo3PC0IfvQe$Sz3&962|LR6MMZS<3zp>dlmf-uB>G<l;dXW^*%;plAo3M
zUIuA0Zyz{``#i(=vmgI6&j0m|l{K{gT3>HGT3-V;0MGxGM-TR2U*uU7gaPXKUtM?3
z|8J+9|9=JT@53qoaLWHar~KxM@;}_UirO+RJ_X`T+YiwwV#htC=CTJzhj?1<?j7eu
ze5Qy@ueQH$2Ce4FSs9VuUuN&1b+Wy`Kds2C@1dRGXj+k0bJzQs`55}Lpq$kiA5p}L
zn_iAq;RG4%QKYVJVh6i|HJ@-kj`4zVp>t~y(hcLfa_*_Y>SKU4bVM9r)V6lb;WJ(|
zPfnU|$R_UiP#MIbpd6_rE|m;&5sgR(O+m=wUN62TPoN0(Jj!RsWu8!mevWcrBzA*}
zgku8dOQe;tz7Puvedse$yn>Q%)>Qi~6PF41LqEB^=#LeyV^DA9I*0yL7ijg)B43s-
z141cRELoF$io;Rw)&?h+Be7wzuW1UHvSs9YG@*cv&<jQcaw0xy!t?^8_x#mKMHZB7
zCV8NDDdI%{gY3Y>p)WLyyW38L@l|>H_1ShSc-3sRwqKwO{6+A5_f)Jt{kkE({+gvy
zC7AYk!BIuW73LB)JRld69rK>GDyYL7i^dc3PUk;Xp1{N^?d@a9t?EGoCh=g&jfuyL
zKa29M#w3zfD(;;#C0R@GbV~r@ZPXUpSD3Qq-xHwNrHb5Dq}BUbLWE(e?ZZwxjeon|
zJE#9zseXI5j6OWd<6{XOd{%0w_`&?DEz|D?{IPy!{j4pQ1-BKfG&Z&#8#g5Twd#)X
z*08&NTCqri+;XNe%*vE;zW9;@eUUR#`@Qbb{9}FL4A#GyZxjWC{;VReFo>?B(S0_z
zhU9K<{rb)uT-BVi#otH@TG55`w|NZgUiB)%j9TzlTXCP&tGEZRw%{FXgKnpKKDkV)
zVW)#Sj;&8Z5k9u%PftAf9P9(HBYM%r7<nGxqvL*N?qNIhC?^vfKh+D-#|#>mQBoVm
zGf0XCFb`2t%lKt>n`$ky-JB1mQ}b^)8$j-kgSGBQXodlOYUJ*?{4?!U^Y}%xqQT@N
z{AAd{jDgjETc|V-I>X8FSa*JpBZ|@m$95`IyI32pz&ay?scqRQJQ4==s*ygJP+iji
zWV%$?S@htSz%YCWav##33>}4mFC}+l4n#Z7T$3zjYr*!^)6J8Qp8gBNzrd`7@bd#l
zaEg|kCDbLY^|P)#uq=9!506fOU2~iLRey#59dFArt-mMH_yhIC|9#7kMot;-5IK<?
zJl}hPz9g@<4|ZFn(_vh-Rt67#b}S+8z8&yI83X@u#piqbO*?AWq8?!ZuC!SC^l^7!
z|F>4Fot-HcN$Jul0Xq(z%a51KszsF~Ll^uFmuxBd>TzxPtFK`HYS&H6X>(B=9XhV7
zgb|^z7;0d-@j8Y#ccNG>uU*USq*%7ua-&#W6x*Hu!>j}$T2!!nF&VXGpjLi(Z{?1t
ze)_Na8UAm%h$Bl?3zEqNMuVwa)e$dM?SH+k)ic%NakAx>mtfpRm%pk(<x8vbBAPTf
zA)qBuZgVVRghrQwAU()*&5e~*&2$CZE!Kf4-C~`0TLoF)IANPLaw|I?!nHCq6b}^?
zo|B@SB0U#H7o+g011ee-J?%Kfm)&*>s)?!99CzbIaYD9kRuDdR0kcs07O!f^ACX-i
zNAbhET4+HzIy|8rinvbL%2&}4?|q3A4w^Ox`MnK$=muv2aRNtB1dmSl;v%8|CY16P
z51#J8dP~8a-OMK1_5C8dOm%hOSl!J!#WUAXNSC#PxLH_~1pSD7$ra+`i^m)j32(d^
zFo<VdHouJ3)a5uBhv!>AQ<#DavGjKAB<g|j&pA%Rloaa!TC8^p^5>~2{>qJfI9q;O
zR3DN`ZMi~C6b*{izZP%dso22Y7L)qhQf>KdnZDKEHtGfObo%@q9ios0U+*@LT3ZFX
zpH?v-bNl;fWBB6rcB=xls8B_`KHA+rY3e_BU%z_wlm6?)EB*xsGN$}<zyUiTyG1fX
zHihGI_zfl7Rm{cFz34_A9sP^Nur?e_w9?1mL{3Vbxlm7z#utlWk**iAfE2Ro+<;dc
zx&(O;El%x8l~O97yAyfh@LB6{zj@LOtf}<pN}7$-&;i0%3l#206K1bVap7YOe+08*
zq555GI$cYpWU^ocTR(enI;k(#mg|6pvsdBg)B?Qh%IsElN5cedmMGW`o!)rfkmTt*
z(Wq^>b5GIomaN)KOIt;|$4gG}^hPMUFBCFN&49BgZ>4$2A+CW~(=4Q?y!J&#@54ZQ
z7M$f>6gzQ$h}sLep`CA`RIwIIz$Qi^Tu^Y775LkNUB<t8z037t2}_jW?pOA<;*gSi
zwxwE-mluCSHj(<Mb_Vg#--051pJ>J|`_7cj#rP2G!(WD@$d@wBd|Wb3E=|dyCKMvr
zd9<8Wvp?9gY`<4?W4|L$w~!1Fg}p^HnV=Lr+?{;16!kEQ2m#jKrC4tN3PtB{q3TF{
zajQBbC=~5KWko;$w~8KIp{NhPbPr)QbCb3a5^bMs!+lzvn&fLi$%oZ>sZ>*VMlL0a
zFgY+H6NyX*WVGo6DoxZR+Y8~GS2K<&Tr?T2dakvj6bcj*EA?8tJbd-~pw&G2iX%%G
zr=E~7Z&3nFYDd%7EmI>^HbbU!s@vmDmCvLiq{L+g1Pwk7(lZ0NHm_wAL3{3icMN;+
zB~FC{HSyGk8(vLB|3>vEDONR<3J2)RmOrnlxSRtzne3KJN~_bg+;1`-bp%F;RG*C~
zg)S-=aK|{u03bLyO4OGJ$<<4bN8upph0?g5V=S6!kh4?H#+j0&&?=l0A&O$Ys;(D+
z`Y|qMV`1ZyqI&pbvi7-|D{|ttsmIxFg`)kZa5^>}?ebH{2~9O}ceCAS-gefgY!~*R
zv2LtT)YQsL+@|;W9(Ok-gPC@B(`Brt3~#C~IAW_l@>~fe150ut*fNPM<Yiq|8OiJZ
z_D^{_{PQ<;JpFd5zc~jFlyLsG%Gt*Z6tn-dN~zNYN~oXKSG6ecRsFQSx{NJ#)_#E{
z3+cI}YwOeOdncYcCbUQN$z}En_2Wq|N~+5loN_K~7k-*AH~WQmi!ayWQTGx9+||y*
zclh7`SN6qygRRdObpZ3!H=t~#3^{O+*g<gXOIALKC8hJnDID|RaLg6~DgrW4W_9aw
z*nUN!uUX@cLLag;B3_dqFW&J&UeP<aMgc#s@U|hdSS;q>E%;91y+kaf&d((Y%R9=s
z24=cQpbYi=RsO6>cHslzARAk<!BCuxrCS$y)vBeXWObG-&5D72bV!%{Bx9t~IypK%
z+-bI2Xt1JoiL_W*6hETEj89E8L_%BE$)IBHb~RMyPcQ)Rb!^2(XQ{MI_<?p71Prc?
zkLgEM_@<cS1$$-@ubZjcWJSWstIDy}vn-;n5RMJJ1wOOUBdNCFRl`k}f!|sBeP_A%
zJtf}vk#*le%6)(N_KXYOJ!IN*OSA7N$0piF)AGEFnJC0HI<dxlGNbk5;4;z1j_5v$
z*C0Bqkx>MWFS&9PLi}8!swi7^g1`QZZqG|^;I(x$T#f@Qy|sk@I_Vf}fJ$8ZRq}SQ
zG$&*WwyaLInF^Zg1eOTUWKopLRy+tiV7~jVd3dr=TwcKc@aqq0(7HMUR!K*AM-j`y
zxei!+8QqLAba-kj|FC_$hsN-dY70l5>5*0g)Zivi8-5F2=t%`Hov6{K07C||)oIip
zq7~-NLQ+41|AQan5GwqHdG*F5%;FMapK=ynASGudED{)UeT6}2>Oy+iE@zLd|Lb%K
zXgSKd3rpf`S&hSeyH)>{W}_8Fd@W!Ll3sV9>6jNfjC0-w(1Y?kT==kX-dT8zqkD<I
z#4?kTJVq##J-15JoZIfAGK+vijMHQEV*(Sky9qj6kD_6ZCU?xXz#&g|ZGj}E#k#03
z&}h|qP@5`beQ58R@%h5zbEx+AZLwab7;fmjsp?ept|MRgQAj~<?E1rnahu{#&~QUa
zbl@pR5=|=)hiBM$O<fcu(!w|nJH03zrH~27_b(hD;t)<WHofg>k6ft}W9RE@4$tlG
zV8Y2AF`VQgun#wk6*X}*!E<N;ycVLSBtl4g;xvN88z5R}eI3yut~*JX{<yQS<h9t4
z2szf8HYc5lnkUV4=n-hmir$6l&DPIFNfRj6vAsbp_0CfLUt)Q&-dSR6mbyY{eR-+#
zv1Xu}aM=p1x#xUm9mRYY8fh<=2}tZ6Ci46@VoR)pVoFtzWR~X8K)EFrp>RJAFua@6
zB|%vfsIU4u;1(|w-M$o-+;(6mt2>C~!qY<h!otEGl`wxW)r*t0=&stVkJVy*diBm7
zlq~v~<;`Z#*?jv=mgb=_`m0OC$L%)>rLOEIJk#WCIyI=wo}<ORx2|U{{gzLO^YO}?
ze5K7tDr<6;H1}4{c$G4rKpA6A?D64I^Y~=1*}4ySmu~LDcGx>82YPZwm~v#?W$#1N
z=Fa|h>oYXhh9fxD(*L~r6qEMvz6%vCi$4l1?1^)=)a6<~xpd(lH(Q6VkKx|FyTAVl
z8!}T?8%0Sx83A)x>u{`!*_XDgHg1L%PD+j}C0a(?me#V_+O-s7;wytU_?KK;{HYcM
ze`h97o!e8@JoBsO?xB*qgDUP$D!B9%LFe5!;;p-9-ddZ6JF0gmL$qeNP&9wcghN}8
zL8xUZ6y>i>|NkwsX(Mu;v))6A0cedZqv!hD8u8tHirv<?pY7~6pTBsy_ut>|zdATP
z`k&+0$?G3}eDl-)*2D8QaM_nv-T!;n>%)Bh8?IWD_t!VKztrVPr?I3^R6p&$S>3@c
zIe#C6dKFGn`NzMKQFW(Phksi~b@lR}C{`L2>(%{mJTPzDx1(;a*KNaxo!e2bZo_CD
z6&Z+I=U<aws;~dISf~HUPdvIT-WQ6QcRAy=7StsT7IXSBs@;5*Zd#Q)j|z8w)on^;
zdpA|>Y!$7enw?K2Yhp#-RRw!r)$6<}*N;@Se!PnHlc-i_s#NDvrCK@@Pxj;~D$~2F
zN>ws%ZiN1_RiXdA{lm8X_y3&Of1T{?+kft~UTz;B*>C33pw6Q?ol9ftbhc2m{}eM1
z9%pQDbeyExQD?@NKQ-KWE)=c5g#XO=PdYU+Xag(kybyDr6E+$z7@ak#Y%MtmX>6^(
z9o6n1Ljj%QqOd>i8(UeenIu$K>p!d#k`02-@|X2Z@geY0{j|Pjj&CTIc{jJ>+}@B-
z!v53l?TJ;!{9%=_HUJc{{<3@G;1Kr5c_B-pQ`;hXT?6y*xT1e7Iid!ow<op0xKDht
zPc;C<jvNE4J+b8UamfXi@)(ptn(a<UvNh45-Hj3*Jypi}MHlo5pF^Aom;!SOR?>;l
zL>Z{fVGH=>2^ea0o~EafbUe=&(j@G$zQQc9qT!z`X@Z^44z*=bZHsDk-0opkz_<F^
zhZD~O@!XuAh_@144xEAkRG0<{#gV@%&x*I!RX0tEpJ-Rm4+}WX^fBw8OA1~86EWtG
za-7VIYq>|sya?D%uENo9ejF6lk;R5g!AJvmZlnaz1q=44L{h`Rxx!|fg_}0#O0xV|
zqyWeUsh$4&bY-&vv|-8~DzL&{_ZLojFT!?vLKu#b#uJVj<MR-8Y*JERgS~@26;e6R
zIaIZO99?!Xemn*m5%F*=V-}rb1e-+0DbbGCDi+PuC@!ha_(Hkl^thbg-$K#<K@=N*
z!DN_!!H4;hDy1I$T#?{r#D85|*+}RAT5CMy|NJt~qDWzYiUhYgXBtqB0{d4@3g)H+
z%>>zC0T|A2sjTCzslaRrr^BqjY3&jJ1?Qq|#zoL@Rivx0ofB{z93Af+oIDQ*!j!09
zJ3HQVSE_%yZ!^0jLy|zt?e}Cy6>!~v@J2?qkX%(xjwPL6iSL9Z%7>|vDdBA@##~DF
zD{L9xVeod;p|gES;j7hRM|{;Nb_#5I16)Y22b;JJtWemdLw7ie$7~U$jfj$~sMlK}
z37#w;VJZqjn-Yv7fi*<L(I$tOBBsoN-ziX3n;MYwa(X7VfNfg(YN;ZYR`H)A{?oyK
z1pY%G8t#X;D@)?T69?M)<l?lkvU2u>GGAg4I#DVwpe0r!uZ$%qQjx7z#2W0kjg2x&
z|5Q|Xn3i^bD9aT#HlR$QjKbm-DE7h4By^gyfGAR&r<jvl=v4orHE+H+ZXN|YM@OYo
z*fmrh16)wjQ<IwXAR2S-Q(!yI+h@(gR_fiW)(*y5bIZMg>&B03tLf@HKfU;I?;r@E
zL#pX?Vo-e2d6Du)S-6}?OSC~;xO*j-%Yv10N&Y<3n#*Di2qpVnmJx8}yt*k&aevC)
zpUzuqr7gXME6Oy=<DoYet<jw~s?i5t@Xz^RjvBnR{eJmhS2kDHSJL@k*H#-3{NI;&
z7KMcYiuZdo5AWCb_S;P>4ZvI(0RAit;6q&Chq%CV#|7T>NAO=%(dLHXm_yEmIvW}<
zA4!T>e8qt*Xq(Eu_=C<V!^sMo+q|fr99D_ruRcFKuE=g<x$05#7+$?<?p6;E;N$Cq
zU6mY6oL0mS+xxGZ)xGD{gToX4if^$!OxfeQZDl(_*AYr|KE!FI60PRZ_VM<~;W6i7
zWUC9xx7NE3ZxcaerM94L9*V!Z)nrsQU~1uq7A9h9$T9ByLAn`Q{Lw81-;H610w&eZ
zyMuai#m4<unrE57Xj5GZ_Jk#Cl*o~h{T<Zm#qm2C!dIgIbAqAFL)Z-rzG}COm~4It
z0HvaZov3ykucJuyc?(_AO89PT3A^wF|5<v%4Q&<i-zRX3LAmeavK?fSf=+Vo*ss5a
zONj;J@jYP32N>*B|CXNU045(6P;V+-k&udB#n(>CzUU@uPsT*%*xOI+QrIE1$q2<S
z(I~E--;VhsCeMQ@;-rEJT!L<?SRd}FF&gg3t29v8KGGV>Qca-;)!M7Zx=gW1!i+b#
zVzEZV`Md9e?G{Rq7yqWvV1dJJF31n<D*!G2ej}`E8XK$5>-4N?Yz*6h8Fet+D#*%(
z1!;PdQ{bY2lgR>jyLn2MNPb9`I}QbmjL|rKwLsApO`t_XJ}_*U^m!RwqOS!YVrSCt
z--_bu6CuM+Zk-m-Ru?h}LvZm_WJ=!bEI9z0P?FgykzfTyym_3m1q(nbHl*pw>FL|I
z^|Lb!>iLhy>JPq8IJLJ_twpgPjkP6~K;k`8R@yW{(s>8#u@Z`IB?e{!+b!68P9`kR
zQPqIIi!SbJ<&`x4LhJtvT$a*laRcsA6+sm+5c9@a+0te)T&opjHNk85i*c63y(j%I
zm4%ON5Eng=a{i?ynq3PI;6p@G2-kv2#;3Ir#&}Sx1u9z5vyR-ZFNGwBX%MwqtstI$
zoe3~%!GW%v7T3-^j^e2mo!UL8B4tGutJXWqom>CZ=1lsBXE|h!@j)!s8R79*;b5Je
zWm^=0wuOg~5EvSym2RYm?v_qzq`SMz0i+okq+<Z-mTrcU?(XiAx}JOf!TGd*!d}nX
zd#(2feu3cd)4X&X!*=!O;BBL;&}#4rV3lP&?TIz&yX1{3VneR8dA3v0zv>+>cmTP;
zb?)cx^mKQPl4>-zPoE9T9>X(0XhFq-P!DC*hJj_I^H&?>1cMD9xJ#`{6@Jh0MFzY1
z+I$IU6~vfeZ$*;3zh|KVtnile+HH3wCh~08O5ta*^2SRp1Y3L4)}lE3S0@AabJjSh
z^^I4n_|WGp{_=dnWqm^ZVSzv0@XylIy2XXf^3))f9)6ph!#@i|uSi|P1%04_DckR~
z1$D}?Jlf319={R3cbsv7JB|l=5q-L`tFp@^e=gbV!t1EHiq9*7sj<Ww9GUdZw<sdd
zT3LtB^^+|6D*xiD00`Bvm<t4IE|I?ihO_Ti9W920RCZYYme)nuJLWo%Ax+VPnY)<*
z1&G1~e?}*k-jkn`EHw$r(fTXcbq~W(7j(?8_oDw0NVeLiO)0&u6=i^kHp`;<|GE$@
zDNVx~VIh{0;o@}oJQmQ(2nUujxFlQ}FR8>-ReF?_Tb;{9JjLhP$>Sv2Vk>0*d^kie
zqW2p(TypTyNXk{4J}O%i<~7V7|MUv-#GR6)CI|*^xtn`md8Js@0-s@Hdt8w<U4zCv
zONNNsg=7@hv5a$+{8MZ6La@LQ1%_nLzp+5(-75c_#$bXVcRjjfwZ<Cun9kY8#%hyf
z#v!V~TE&%uRv|Ych;?_t7?JIdzTz@I#nDxc*Nm3}twtpBqj?|9EBF!3den{ErJ2?D
zX)KyHWp5!9Z;f@MA1fi?;x7mB1w)AT8;As1KH0g>_$lgVwt3HH_Rm)0FFyMpd!mYL
z>m0B_MIzF$0ql4071DtIk<^@4YYXko=82BAh1zae)U3yVUP%QtaY;*9qJD8Vs8uq%
z4nk_!pZ2NW3rkaFeC7wpJtTOpBosd$u1=LkGrF(ulE};{p<$NsW6g)V9(GGe)aLG9
z>oo_-n=j8+F}*{c1|zqjDZk_T90S#)C}l0<D^O&Vj1_->63y*xT;=wtr9(b#0nX!V
zRp`tmBPsCGW>D=+r;Vg<9##Jvq08S|4K>LA8<c{{yrH^Q>@TKC0=8)JIBA<%3ptlA
zCrO*|L(V*yZftc5>i?c_da&9~-P&4WZTJGZoO8p1>Fe96jfWr49L!JUwuCV^I|VqP
zrv9`{pSaGg$zf7kiIx8t!(dYGlGDrX!Cq{NC6<oR{yjk}|6k4K<^!IA<nBAE+~t5s
zo4=OJbiP$8j5(#vOk|DUOpJfjN?5t4r}J)EqvQD!6Dl2#Y)vbEV1*kc%5dvy5pY^a
zl46%@|H#w--Xldmck1K7sL(5b<#)R?z9y2^7I{9${D-cS3~s4JI#hLlE!xX%P%~}q
zM$HDLxSaGjPN!uQ;$d%dvyWEyvERFQAbbcFWL2Z3ZK!+p-0Q8kzUuI4{ivV;{Pb^^
zZoFE47F~VoxGndk*z9-AW(^3OJziG@!F8PDjQeWzu`o{UtVHVI-Vq1j?zUIcGwA-I
z+eXAE&sZ)|`7$$d9%M0_knw4K>}Wy>aa{)F0{}qSK9sO!Um&luxj)U_a{4RG5UTj!
zZs}VFi^C^x3FLTZ4e;_a7jP4Ry{}h37&M;WXkco&1%nw5MS`6H-=&w@Uw%FHZKA&*
zxL_>1z;Y31_+Edkxe(FmQlQ1hy{~LZF|SDOk6T>GlZJ#+i`TrXlWg8*g0SDT?&n+r
z(v;rjdFFV{Ue9A18V2MM4&QvX#a{2FeoC2`1`z;w_Ud0>%c<cf@BwP)KHbA3rXPEr
zd?ya1W_{{ao4;(1e$Dlox@;{OHCy0A376z9nxbq^2I>$r#-xW(IjDV2_+|L<>ry~_
zAPy-hPIV%UU;OB!cUZ7@sfFi-p#?--2bi^YcloLu$fO;yrwR~7M2_j@ldaK7MPk2L
zDa`LYqfLnZQ<mm<=!|k>r7XQJ8t$w%d1MGL)2NR35(oCf--hqPOE7z9RD+-ik4u6<
z@5(V@R7*25K*e{?SXcWzuHM3QP5Qn0&Pv{lQWs|Sr%Df2n*xsQ&fe5Kb_#s*swy(V
z;bQzz%<3^raS!ys44k1M1f>@OKbGZV_d;Ay^Ov9K_8f^Uf6bG%NzgQtp1<=g#|9;$
z9R0DSQP(7xdcgR=9lLGVAM8j-=~S!H!c$aL1qi>JB5O3Ft)}oz6G=gzSu_o{$0`If
zRESr3j(jR%=~G@zOOT3(InM2E{*>9ajh4*F;AncOv_tx=JuHc1zWzP)nE(BHP2zoH
zAo)Gkr2}}C=XMyNHK~0Wh15QRo*fCVJmXO!F+lfEdQRLo8PzXv6%ZOm9XU9y*pX+E
zI`(p7S&+Q${S~u)^2VL;PU_7R{d%pc*z-eH*&w4|!Cofrw@jnT#fj5B-SJrzrym~?
z-7A?PF7lryNt{ntKe~P<Rxpv*b7lY?O;=d#PMi?!aK}X~S_iudLY=SDlmSaliHHb^
zht||5#SsIvw!WTDaN2%W!m1WQvTi%$v!0epmE$3(=Kl4hU0<=A)}_c$qrOs0UBMYN
z-mgVq6rxxyf-0TuwDKdOG#X8t^VD6;pswC?egP3l2KosnoTCFu7w{G)$Pb+_z1ioP
zzq{A+l5Kg^O`jh66JqT$uI3jPg+YP~%ZqE6hUAS(^-=U*&KJ5qqga#~f)^44*~V@$
z5*Sv5`aO*fObU$I5BPt<Gbbf;a@Y8Oy?HQocXlH4tW4~soh_$QV5r>XkdG--6fl(Z
zNH`0hFcuIcnxnv6Q4e`_ryXBOy|u>GQD2<C6r*UIYgy|HjE_iDLZuqvx!;QPW2ZWQ
zGL5dwSdb0U6$o{wdyw$^lXfaqkSd%w;uu2x0&_M@4Ul@~_9WvJ1ES5W7_GTydi?R6
z;v{^&4!{lgeFo&ebiWGLV1<mH^NiWpQJiKc@23$k*ud^6-CMsgKs?>iZOs$BsI9m4
zNXxS5Jvkbq1dH!Yl*bAShAx#2<V}*`)Aek-Wt08IZVwZ>(^UK@`XWgpBAZdj{e09W
z9JvJ$pU$gq+txnohE+!Q#Ukr%g-})EeZDt<>dTNo)gIaRLI1#-54;W@TS#6WQVn$X
z0yc?i)l1sVC~74`;yT9ApxdL(bvd_49~6rV>TMp`KYhSuZxQCj;eb8z!|_v^T+(;4
z?aoMk_{BcpmZ@~%dn~rkX6+|m*<!(vwR)itTUJJUJ=Gnp*E1VIa^cGP<rz|9&G{#x
zN9}BVCG8GqFXUH6ML?a_Z{mAj<zJJ1!~HINF*IEr%ib~{=4!KV$2NK=aBGVyVgm>|
z^kp!<m~@CiVI{oz<k64kgR6R=-CAzJ!-Om~bVtTghQmMMb3taw6a-!HXu^LeLH7dK
z)O0&Tu3I2%=Z>T_z2826y~LD%IhIfQ98R)CNwgO{u!iy1T1kS96MMbW5qAi(MzD1q
z^<GLN|23bt45LyJff11N*KD1V>NoUdIDE_c+{5o;GMerFy}dLz^41>=0C+Z-Rm!>9
zvz(%j;z^2{4+)HjU}3%0Nx_^B)0Lc_h-i4X!M<@lE$yM_MSo&bj|GovoIN<Kn-Z{d
z&^0;$#w#o!p_a+KgIkoUzQS*EAUOH){(d{2Syyye5t2z&wCc6o%1m=R%Kd9V;c4gP
z)%5wRxR^B}WxTL+er${32OG&mHPi@JVz=jTp$yGNyi`OC3;IYrzjX2R3$9jF_BD*W
z^spVn>eT#66o=L!N`Dy<Y;f_m%R;*tl@*?Q79H6_DIczx0Zv7j?3L9-mBk)6cMkJS
zChTTCXSM0W%i|e^WY&x`De$)*0?+O&N|=W%fw280@A2Ovw8FJr_3}>pZvU}-sqgCb
zF%?|gV$mu04!gwR_tN|0D(Y8;RV4mRaSd444;fJAt0Ln@iHqnR?f0pZA>K#GO#THt
z1m$MG`bR~LeK7|iY}75`2ow$rZnLw#Gey9Zoq$&Mp+hLwh8KmWz}DVfs*!^f^x4eB
z8T6j*>C*&3yV9~_*3T(h`YevEA@l}{wVyHr@l-4k+PfQtd5P9_NGT>=V?{|BAJfq8
z)FsL>xHd{R^YYVEWg2FqrquOvgVKK7F6m0KmDVM~tWmw^QO)a(Hx(BSbIBrgYC!Q>
zIw*Hp%9vo|iOY9cALM9Nf}#*ajr!+OKwkei5biJcW39)x=Q7<Ia2(}g!rbOfYR>4V
z5fHBX9Ls(VU;q|XG*!~|iAA<s3~uHLo!B9ganqLAZC2X?CyzwQ)YWH{Tx2}FE^imO
zA~YXL6tizAUd7D#C>y|C_NAa+a7Jgn^%t1%mHLH^=SDp>71gdDQKdp?sQvzC%iVwi
z>KRTw7hl}E45Wi)|D^hqoP}v=3W{{lSAK9A#+V*4^Ykbj{~JNum3ERv>q2@o+<U8;
zfs{3j43aoF=V`)f6G<=R*q-t?xsWo}V`svp?77IV%BaMr&OF((XCz+Iz`aF;NQM_K
zD&#=Y)eyXWNiXX09Y2~tPzQiV)V)M{-j1EwfU(6F(@6w_{Z{i(uB8!XnQ;AJrsN*t
zmR58ki`0y25DXAyv$c;jSgl#S`$16Ajuz@D*~(O!&|;hqq@HiZ?me@X*}8o+`}{Lv
zz{lQvHKg~Kl}eu`WoKmmnwJW$*I|9C${NVGH1d}Lkha0g?W>IP>e*9iEbl1)idFdq
zoV2FQt+xBFUPnk}#TC8=0u>ug*YTVd_S@`v4QBOFnZgNSV_|DEM1D~Y@E$Q3DEW2t
zt`sJ;*iXhHH0Cj8XlU>yRAR`rdn})fT<e<1$LDj)jeDn{HdEM&3jb&|F{J`|Jg8X|
z<IP&Jx;It#oKw?&oJ(C~zd+)ENQ$db$A~mIO$e#hhL)G#Afs((sy>9$<LDGTPkT7K
zHx$3_?%SS0Pu6Gp!Wij8cy}6q|Ka#vV}~pXA4cg<^IVqhT(s+*enx^8C^YevP5O>d
zyYkmiX#u(S#=&pAIkoSacpKoRj8j+9$rmgu<PejV3~t_P4AU9?cqJlEG6n2~_{vzd
zJgeNpBvk&YI2u9M6FEiGZ|^^GVT^1=z3$|bkj=7mkm0cSdu#Z=6!&B(DsC70u$cHv
zBm$+5rZ1w8B-}|)!AYeWT7!XhUI*;uWxF?F);j1LHQ%X65)?VfD0cL{u|0h8i|iFb
zWi^Z5w|dW3+R<~TSX1f;%rp?Q?rHZ9D{39>OX~9{dS169sA-+>C}#-ZX<hH$T{`gp
zO>Bn^G=jg$6_(%&%`bCgQ#>ZjjH{6i54}{ttFoPvZrd?WAW>dM;m3t0%bpB;+w2rv
zTJAn5n0y8z@;1CHHhmLnjN@$Z%;cjPkX(jX{xWFBDL$v08||teOH20N>(3?%O3%Re
z+J<fb_2*%29(z6e&O)J9Pi?4nn?M;uR}0zGqUgwQ$G1WrVDbcKT221x%(JcFMreOV
zct{7~<=_nU<7dFH-SmpWGkaM>kOm1>zue6Z>iccBps6k8mCm)kqiGB3hnkibfAX(2
z#oyD6p@eak${OMwxFGG9YTQYG0SQNa@2u-h>iwjo^i{Azqier`$J(I2J&nJzV!Mq}
zfZ}@DMxDt_`UFo~!<e78ul2Y<&iT)7cY!JLUf1Qjy3jk#?-&yoV<n|Lw1zB9W}G_%
zWX+eg^+;CA;wJpuPPt=+sI~PYr#AVJPgkrhBLN=Jj4{6A;6hlomqPKKDQwFYNF2`R
zfG^;IDSvxtHFA^iC67g&VT80dGqhtTKAv=mLxlZOzG*<)!NWOnfm|p`9C4|C!isL%
z_nYet7W21;<dDO>598)!ukXmGtOq2RISMJ=KUt!AcYJ(mY8}%CE&Iau#sv<hN%;Ny
z^lDw|e8Oi`RvVIkPrL{ZO8@jEDZ$h<%}(!sn7QjeaFTJtXj`6pfiMs3Q^U`FSxE(q
zrscBLK9YH=*iw`<d6+QPq>Xu}xjR`!xyMkyO33Olz5dJpq;N#h{Qcoqui6+gyj{sI
z3y`1gb=D52b4_`j=VSdPeq#cwO2sEP>m=!u4ICl<hds|#w22$JRP3#QbYFkz6W1W_
zqHc@pi*vcFowI(VE9$j7Qa$RPwER0rGBL`d&}#u`$U`*`-ItViu@uKoa8BUrDPGUn
z32^4=tjc&I;=T`<ebU$U{AXQ7nB!DD6L{R~TKOF;{L<!(v!!(CogpxRok&B4HR{!q
zZKYDCKk@P{kW}&_Gt8Q-tC%Pt*=$$On`SmRH&JL}p=9DRupyoj=UtUE7oAe4PJKs*
zZpz0k)xV>oRqS@kmRTMgBa+Uw;LuB&d^$+EQejNqHzlLHll8vTdy)eO7kz;h+J}}D
zQM%O~G)1X75jAsO>)-U;f4D#lfDz?_@yed7hwB|RFUxPiFKgFzj0mGZTHbFBjfR$-
zrd}WiJ|Ss>-U;RBoZj<W<_*;=7mlN}BYh*nYJ3n*)M^mg`gBm@wB5{HScx#I^yszv
zS{uLn8l3y<AlY$g?CUnrJy*Wf5z786V2XXUVZ7qCJ418MHYS<qW&2IXcHj{pS<nbY
zV{e_D?=|7-ny}>#$MTeD(KgW|ZR{hN)PZL6Xw8qG=@=RKlWTTB{RAAJR8W}&378s^
z>2Btm;%HRXxkk`xf9^3yDZ|N%%DoFx^5wJLzq=BJES+9KfQsG$I7JGj6?${J+by~&
zy<egBR)7O=a0(Ae!vHA&_#mQzYH7NSD&PXD6SJZ3k-?aek+Q<!8fvlVbpu;;FTI<}
z9SS%Lvs@0<J6#A#!47fDQu@7k2H^Q1DFd8*sc6=i*hbGd68T}AX$K0gu=k=gt(kHz
zBy|qD?Hs5k$a@b<{8%tgmX_GiXw|{Dw7wjCeN)oDC)}#$+;%;TG7G-!4}V|m{~)CG
zohk<uA?tms5@a;<KpIfBrQKV`^!=(QOnI6H7csosM6DRb&X$#BV)9H=Oz%=uJz-ug
z*(R{VDQ&>~`Tpw7@T+|V_td4xADZXxw<k2gA3Xzr)3<hhPWYjM&aC|=lBeFtgLR$l
zh}WwQ+bwNTifNP8T#+-T0L+F2pIA*vaj6gp^qua{Ob|9;N8kb4BjyznlJ)F1qme)t
zg8Ozl*#``E(aFPayD|7A#4deRU|#B=+7>NVaVqFyY6EIqVyF@!?-#Q@?-z6B{V$-(
zxQ!|W^Rr!SPV^~~jRQiK)+^XFFYiQJs(Bw}OebKZ=|k&^W9KeJPpy3n5it2fS**+K
z^veP!o*3vfzv)XcmHfdb5~`R`d;8xhx^VXJU0U65DdQC8CXz~AiOXJ;oF8&!72+%+
zx9t>Vdc6x`1qA~k`~JMDA;S{`fKk|6eaByV|5rx`!M?yp%87iZ&!X%AlIwxMO_1?F
zTJkR2Ahy@HZl^-RD&JV84!ZTbyv$j0HG`D3nzXZ?iorR}rs+r|e#}IrZ7`b~BLY`o
zk=WHNBg)N>kMzkQU0tD_Xy~;ntf|Ac4za{AFmc(C6C?Ym2%W+d9N|>5+v^xS($kKc
zw3&|ZQRDimi)<_kEufeeyNEim1Op&8kwTOHB09iH?+RhEBjBUrv5vM$<^DvcDCfO*
zPT_5i*<)Dd%g<bg?n>1=pVqP0luPPvcygknCy!1ytQkqS%0=VY9gZy{^NHzEHH;n`
zL&FVh=tk7&$naZBY|zSCygq_V!{?pINyFXG)6?_pXGoL>f@?})Z>v)w|L>>~PzGCF
z60A5=hQ;vx^BhcE{_Fc`b=j6Zxz5JM?L6%lcH)?=gmHTbB`P%<hI=6Kr8Iu@OTovl
zN=8Cc;<>v=qMxaE%Snu?A4N*=)u4;!`sx@_Gq_<mN$kFR1STdw1Wp2>EGYFxx#e!P
z_npL%cBodvVQs23Z%4EXCgd%v(ry@)(EQkShjb1r2_%`*be~_kjiZ=X@Z!GASPNSp
zZ7t%@3~5~}N+Nb$>XIf`udqh#3TK_uAL);!_#>*+txQh^m;IAwR1;sNv$Ld3Jxy;A
z#t}GOhs}!ObZVI&wWS0|Cx}%S!uqBb@YS$<{KZuo>7GZzEV^#0g6;{pwllRkfC=XK
znP|LGt7L_%sdxv(2)EHl2L3{ybS>~_22m4ig-%I7X5!q`Y{k;vMg|Ee3r6wZfg}WW
zlZhbC!$>NVPbe5%2X5v<n~1`-fs+kFUpmO3%n{JXY5(`^6uBMti@aLMPi+n+oIF3Z
z4A;$(m&)8ug9P3-W3>%mab*KxjK;#ob1lk$@<|K_o_el5fb&|AKUJX9y=&*}QLuvW
zsE_Xu$JRWi2NaULtHDvqbBxDP8s$gKQEC-^jC{nj)jd0!ZjdJKJO%cqvbFuhLNsNp
z{vF65dQ>jrQ8pG5G5u|i%)JMvfGa-72rBCkli#7Z+fkDAkU>KJr2M9DO7M4r@g;}s
z&DY<R+yBk6qC#ZlAFS^`u*uSqx4&7bZ<<N3k5z=IEA3C^<(<VswB}JBrG|-|V~HB+
zI^K9O`GLwo1Th7JJ^IyIwu@=~8zO476bg_W)N>Y+kC{d6WXQn*4Y|$HaWTiIitng0
zy9-%A)abo_HT3yidqYjODuCaxd}_sS=y_C5r`DuLDI(n@Xn4b%_#j|(amqTEqgCx6
zqnkFN@M?J!xal7C%1dr<C;aFC17<OBp2;tjFH*N%b@U>tz|@Ory!Fhpf&q8NMY;>%
zY^tMh>;c<MYX7iRZOb@rGYQT4z@<u7pYyqaC$k4gkZi!y&yJGd5VXw?#gZYG8S=3?
zD1NDE&=axC%hURmfYdMZr5|2FUb!Cet|55COw@Jy`v#ZDbnQy|XN3X6xXkJ``k=F5
z8O~?+eKNQqfwPBg$aHLGj`xDxOuGBr;=^N!&=EQLglnjGo$&dk$nmq$qW<caoVUz!
zCd~b}|J+e~0RGSWS$6|B$84^Pt{SF}pV_nUch-b^7<y>Ghi(nGm6_X@x+w`TJj0YR
fo<+SVeuDQmy}ii)r;&dA_y)(jNRR?}fCu~^$6j8c

literal 0
HcmV?d00001

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/config.rpath b/meta/recipes-core/gettext/gettext-minimal-0.19.4/config.rpath
similarity index 98%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.3.2/config.rpath
rename to meta/recipes-core/gettext/gettext-minimal-0.19.4/config.rpath
index c38b914..b625621 100755
--- a/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/config.rpath
+++ b/meta/recipes-core/gettext/gettext-minimal-0.19.4/config.rpath
@@ -2,7 +2,7 @@
 # Output a system dependent set of variables, describing how to set the
 # run time search path of shared libraries in an executable.
 #
-#   Copyright 1996-2013 Free Software Foundation, Inc.
+#   Copyright 1996-2014 Free Software Foundation, Inc.
 #   Taken from GNU libtool, 2001
 #   Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
 #
@@ -367,11 +367,7 @@ else
     dgux*)
       hardcode_libdir_flag_spec='-L$libdir'
       ;;
-    freebsd2.2*)
-      hardcode_libdir_flag_spec='-R$libdir'
-      hardcode_direct=yes
-      ;;
-    freebsd2*)
+    freebsd2.[01]*)
       hardcode_direct=yes
       hardcode_minus_L=yes
       ;;
@@ -548,13 +544,11 @@ case "$host_os" in
   dgux*)
     library_names_spec='$libname$shrext'
     ;;
+  freebsd[23].*)
+    library_names_spec='$libname$shrext$versuffix'
+    ;;
   freebsd* | dragonfly*)
-    case "$host_os" in
-      freebsd[123]*)
-        library_names_spec='$libname$shrext$versuffix' ;;
-      *)
-        library_names_spec='$libname$shrext' ;;
-    esac
+    library_names_spec='$libname$shrext'
     ;;
   gnu*)
     library_names_spec='$libname$shrext'
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.18.3.2/remove-potcdate.sin b/meta/recipes-core/gettext/gettext-minimal-0.19.4/remove-potcdate.sin
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.18.3.2/remove-potcdate.sin
rename to meta/recipes-core/gettext/gettext-minimal-0.19.4/remove-potcdate.sin
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.18.3.2.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.19.4.bb
similarity index 86%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.18.3.2.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.19.4.bb
index 2b43b97..ca97315 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.18.3.2.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.19.4.bb
@@ -8,14 +8,13 @@ SRC_URI = "file://aclocal.tgz \
            file://Makefile.in.in \
            file://remove-potcdate.sin \
            file://COPYING \
-           file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
 "
 
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
 LICENSE = "FSF-Unlimited"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0854da868a929923087141d9d7aba7d5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1b20675cd5158442f6007d022f46b35b"
 
 inherit native
 
diff --git a/meta/recipes-core/gettext/gettext_0.18.3.2.bb b/meta/recipes-core/gettext/gettext_0.19.4.bb
similarity index 97%
rename from meta/recipes-core/gettext/gettext_0.18.3.2.bb
rename to meta/recipes-core/gettext/gettext_0.19.4.bb
index 65d4103..cebf6c7 100644
--- a/meta/recipes-core/gettext/gettext_0.18.3.2.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.4.bb
@@ -18,8 +18,8 @@ PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--
 
 LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "
 
-SRC_URI[md5sum] = "241aba309d07aa428252c74b40a818ef"
-SRC_URI[sha256sum] = "d1a4e452d60eb407ab0305976529a45c18124bd518d976971ac6dc7aa8b4c5d7"
+SRC_URI[md5sum] = "d3511af1e604a3478900d2c2b4a4a48e"
+SRC_URI[sha256sum] = "8ac9f1ed1a5f8c4e656a2f37f5ba6b9ee04c4df79a575e876b0b6946aa417f3f"
 
 inherit autotools texinfo
 
-- 
1.7.9.5


