Return-Path: <Sen.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4376968B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 02:41:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4L2fCh9012458
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 May 2013 19:41:12 -0700 (PDT)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 20 May 2013 19:41:11 -0700
Message-ID: <519ADF38.5090803@windriver.com>
Date: Tue, 21 May 2013 10:43:04 +0800
From: Jesse Zhang <sen.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: =?UTF-8?B?QmrDtnJuIFN0ZW5iZXJn?= <bjst@enea.com>
References: <cover.1368761545.git.sen.zhang@windriver.com>
	<6f982350937c07b4dd73231e4d99322cb86c6fab.1368761545.git.sen.zhang@windriver.com>
	<20130517093129.GC25918@sestofb10.enea.se>
In-Reply-To: <20130517093129.GC25918@sestofb10.enea.se>
X-Originating-IP: [128.224.162.230]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] perl-tests: convert to ptest
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
X-List-Received-Date: Tue, 21 May 2013 02:41:17 -0000
X-Groupsio-MsgNum: 39498
Content-Type: multipart/mixed; boundary="------------090301090700030401090408"

--------------090301090700030401090408
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On 05/17/2013 05:31 PM, Björn Stenberg wrote:
> Unless there are clear advantages with patching t/TEST that I have overlooked, I suggest using sed in run-ptest instead.

Ok.. Here is the new commit.

Removed the patch and added a call to sed in run-ptest. See attachment
for the test log.

From: Jesse Zhang <sen.zhang@windriver.com>
Date: Tue, 14 May 2013 02:53:30 -0400
Subject: [PATCH 1/1] perl-tests: convert to ptest

Replace PERL_TEST_DIR with PTEST_PATH, and rename "tests" with "ptest"
in various places. Also add a run-ptest script.

[YOCTO #4292]

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 meta/recipes-devtools/perl/perl-5.14.3/run-ptest |  2 +
 meta/recipes-devtools/perl/perl-ptest.inc        | 49 ++++++++++++++++++++++++
 meta/recipes-devtools/perl/perl-tests.inc        | 36 -----------------
 meta/recipes-devtools/perl/perl_5.14.3.bb        |  2 +-
 4 files changed, 52 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/run-ptest
 create mode 100644 meta/recipes-devtools/perl/perl-ptest.inc
 delete mode 100644 meta/recipes-devtools/perl/perl-tests.inc

diff --git a/meta/recipes-devtools/perl/perl-5.14.3/run-ptest b/meta/recipes-devtools/perl/perl-5.14.3/run-ptest
new file mode 100644
index 0000000..ed59b4b
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.14.3/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+cd t && ./TEST | sed -u -e 's/^\([^. \t]*\)\.\.\.\+ok/PASS: \1/' -e 's/^\([^. \t]*\)\.\.\.\+skipped/SKIP: \1/' -e 's/^\([^. \t]*\)\.\.\.\+\(.*\)/FAIL: \1\n\2/'
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
new file mode 100644
index 0000000..caa2b61
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -0,0 +1,49 @@
+inherit ptest
+
+SRC_URI += "file://run-ptest \
+           "
+
+do_install_ptest () {
+	mkdir -p ${D}${PTEST_PATH}
+	cp -pv TestInit.pm MANIFEST config.sh ${D}${PTEST_PATH}/
+
+	tar -cf - t/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/
+	ln -sf ${libdir}/perl/${PV} ${D}${PTEST_PATH}/lib
+
+	for dir in `find ext/ dist/ cpan/ -maxdepth 2 -type d -name t ` ; do
+	    tar -cf - $dir | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	done
+	for file in `find ext dist cpan -name \*.t -o -name \test.pl`;  do
+	    tar -cf - $file | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	done
+
+	# Tweaks to make tests pass
+	cp -pv lib/unicore/TestProp.pl ${D}${libdir}/perl/${PV}/unicore/
+	# Put all *.t files from the lib dir in the ptest package
+	pushd lib
+	for file in `find -name \*.t`; do
+	    tar -cf - $file | ( cd ${D}${libdir}/perl/${PV} && tar -xf - )
+	done
+	popd
+
+	mkdir -p ${D}${libdir}/perl/${PV}/XS
+	cp -pv lib/XS/APItest.pm ${D}${libdir}/perl/${PV}/XS/
+	cp -pv lib/XS/Typemap.pm ${D}${libdir}/perl/${PV}/XS/
+	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/APItest
+	cp -pv lib/auto/XS/APItest/APItest.so ${D}${libdir}/perl/${PV}/auto/XS/APItest/
+	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/Typemap
+	cp -pv lib/auto/XS/Typemap/Typemap.so ${D}${libdir}/perl/${PV}/auto/XS/Typemap/
+	cp -pv cpan/Digest-MD5/README ${D}${PTEST_PATH}/cpan/Digest-MD5/
+	cp -pv cpan/Digest-MD5/MD5.xs ${D}${PTEST_PATH}/cpan/Digest-MD5/
+}
+
+python populate_packages_prepend() {
+    # Put all *.t files from the lib dir in the ptest package
+    # do_split_packages requires a pair of () in the regex, but we have nothing
+    # to match, so use an empty pair.
+    do_split_packages(d, d.expand('${libdir}/perl/${PV}'), '.*\.t()',
+        '${PN}-ptest%s', '%s', recursive=True, match_path=True)
+}
+
+RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc"
diff --git a/meta/recipes-devtools/perl/perl-tests.inc b/meta/recipes-devtools/perl/perl-tests.inc
deleted file mode 100644
index b97b467..0000000
--- a/meta/recipes-devtools/perl/perl-tests.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-PACKAGES += "perl-tests"
-PERL_TEST_DIR = "/opt/perl-tests"
-
-do_install_append () {
-	mkdir -p ${D}${PERL_TEST_DIR}
-	cp -pv TestInit.pm MANIFEST config.sh ${D}${PERL_TEST_DIR}/
-
-	tar -cf - t/ | ( cd ${D}${PERL_TEST_DIR} && tar -xf - )
-	ln -sf ${bindir}/perl ${D}${PERL_TEST_DIR}/t/
-	ln -sf ${libdir}/perl/${PV} ${D}${PERL_TEST_DIR}/lib
-
-	for dir in `find ext/ dist/ cpan/ -maxdepth 2 -type d -name t ` ; do
-	    tar -cf - $dir | ( cd ${D}${PERL_TEST_DIR} && tar -xf - )
-	done
-	for file in `find ext dist cpan -name \*.t -o -name \test.pl`;  do
-	    tar -cf - $file | ( cd ${D}${PERL_TEST_DIR} && tar -xf - )
-	done
-
-	# Tweaks to make tests pass
-	cp -pv lib/unicore/TestProp.pl ${D}${libdir}/perl/${PV}/unicore/
-	cp -pv lib/AnyDBM_File.t ${D}${libdir}/perl/${PV}/
-
-	mkdir -p ${D}${libdir}/perl/${PV}/XS
-	cp -pv lib/XS/APItest.pm ${D}${libdir}/perl/${PV}/XS/
-	cp -pv lib/XS/Typemap.pm ${D}${libdir}/perl/${PV}/XS/
-	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/APItest
-	cp -pv lib/auto/XS/APItest/APItest.so ${D}${libdir}/perl/${PV}/auto/XS/APItest/
-	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/Typemap
-	cp -pv lib/auto/XS/Typemap/Typemap.so ${D}${libdir}/perl/${PV}/auto/XS/Typemap/
-	cp -pv cpan/Digest-MD5/README ${D}${PERL_TEST_DIR}/cpan/Digest-MD5/
-	cp -pv cpan/Digest-MD5/MD5.xs ${D}${PERL_TEST_DIR}/cpan/Digest-MD5/
-}
-
-FILES_${PN}-tests = "${PERL_TEST_DIR} \
-                     ${libdir}/perl/${PV}/AnyDBM_File.t"
-RDEPENDS_${PN}-tests = "${PN}-modules ${PN}-doc ${PN}-misc"
diff --git a/meta/recipes-devtools/perl/perl_5.14.3.bb b/meta/recipes-devtools/perl/perl_5.14.3.bb
index 72efc63..9915042 100644
--- a/meta/recipes-devtools/perl/perl_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.3.bb
@@ -324,7 +324,7 @@ RPROVIDES_perl-lib = "perl-lib"
 require perl-rdepends_${PV}.inc
 require perl-rprovides.inc
 require perl-rprovides_${PV}.inc
-include perl-tests.inc
+require perl-ptest.inc
 
 SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"
 
-- 
1.7.11.7


--------------090301090700030401090408
Content-Type: application/x-troff-man; name="test-log.2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="test-log.2"

PASS: t/base/cond
PASS: t/base/if
PASS: t/base/lex
PASS: t/base/num
PASS: t/base/pat
PASS: t/base/rs
PASS: t/base/term
PASS: t/base/while
PASS: t/comp/bproto
PASS: t/comp/cmdopt
PASS: t/comp/colon
PASS: t/comp/decl
PASS: t/comp/final_line_num
PASS: t/comp/fold
PASS: t/comp/form_scope
PASS: t/comp/hints
PASS: t/comp/line_debug
PASS: t/comp/multiline
PASS: t/comp/opsubs
PASS: t/comp/our
PASS: t/comp/package
PASS: t/comp/package_block
PASS: t/comp/parser
PASS: t/comp/proto
PASS: t/comp/redef
PASS: t/comp/require
PASS: t/comp/retainedlines
PASS: t/comp/term
PASS: t/comp/uproto
PASS: t/comp/use
PASS: t/comp/utf
PASS: t/run/cloexec
PASS: t/run/exit
PASS: t/run/fresh_perl
SKIP: t/run/locale
PASS: t/run/noswitch
PASS: t/run/runenv
PASS: t/run/script
PASS: t/run/switch0
PASS: t/run/switchC
PASS: t/run/switchF
PASS: t/run/switchF1
PASS: t/run/switchI
PASS: t/run/switcha
PASS: t/run/switchd-78586
PASS: t/run/switchd
# Failed at run/switches.t line 272
#      got '
# This is perl 5, version 14, subversion 3 (v5.14.3) built for i586-linux
#=20
# Copyright 1987-2012, Larry Wall
#=20
# Perl may be copied only under the terms of either the Artistic License or=
 the
# GNU General Public License, which may be found in the Perl 5 source kit.
#=20
# Complete documentation for Perl, including FAQ lists, should be found on
# this system using "man perl" or "perldoc perl".  If you have access to th=
e
# Internet, point your browser at http://www.perl.org/, the Perl Home Page.
#=20
# '
# expected /(?^s:This is perl 5, version 14, subversion 2 \(v5\.14\.3(?:[-*=
\w]+| \([^)]+\))?\) built for i586\-linux.+Copyright.+Larry Wall.+Artistic =
License.+GNU General Public License)/
FAIL: t/run/switches
FAILED at test 29
PASS: t/run/switchn
PASS: t/run/switchp
PASS: t/run/switcht
PASS: t/run/switchx
PASS: t/cmd/elsif
PASS: t/cmd/for
PASS: t/cmd/mod
PASS: t/cmd/subval
PASS: t/cmd/switch
PASS: t/cmd/while
PASS: t/io/argv
PASS: t/io/binmode
PASS: t/io/bom
PASS: t/io/crlf
PASS: t/io/crlf_through
PASS: t/io/data
PASS: t/io/defout
PASS: t/io/dup
SKIP: t/io/eintr
PASS: t/io/errno
PASS: t/io/errnosig
PASS: t/io/fflush
PASS: t/io/fs
PASS: t/io/inplace
PASS: t/io/iofile
PASS: t/io/iprefix
PASS: t/io/layers
PASS: t/io/nargv
PASS: t/io/open
PASS: t/io/openpid
PASS: t/io/perlio
PASS: t/io/perlio_fail
PASS: t/io/perlio_leaks
PASS: t/io/perlio_open
PASS: t/io/pipe
PASS: t/io/print
PASS: t/io/pvbm
PASS: t/io/read
PASS: t/io/say
PASS: t/io/tell
PASS: t/io/through
PASS: t/io/utf8
PASS: t/re/charset
PASS: t/re/fold_grind
PASS: t/re/no_utf8_pm
PASS: t/re/overload
PASS: t/re/pat
PASS: t/re/pat_advanced
PASS: t/re/pat_advanced_thr
PASS: t/re/pat_psycho
PASS: t/re/pat_psycho_thr
PASS: t/re/pat_re_eval
PASS: t/re/pat_re_eval_thr
PASS: t/re/pat_rt_report
PASS: t/re/pat_rt_report_thr
PASS: t/re/pat_special_cc
PASS: t/re/pat_special_cc_thr
PASS: t/re/pat_thr
PASS: t/re/qr-72922
PASS: t/re/qr
PASS: t/re/qr_gc
PASS: t/re/qrstack
PASS: t/re/reg_60508
PASS: t/re/reg_email
PASS: t/re/reg_email_thr
PASS: t/re/reg_eval
PASS: t/re/reg_eval_scope
PASS: t/re/reg_fold
PASS: t/re/reg_mesg
PASS: t/re/reg_namedcapture
PASS: t/re/reg_nc_tie
PASS: t/re/reg_pmod
SKIP: t/re/reg_posixcc
PASS: t/re/regexp
PASS: t/re/regexp_noamp
PASS: t/re/regexp_notrie
PASS: t/re/regexp_qr
PASS: t/re/regexp_qr_embed
PASS: t/re/regexp_qr_embed_thr
PASS: t/re/regexp_trielist
PASS: t/re/regexp_unicode_prop
PASS: t/re/regexp_unicode_prop_thr
PASS: t/re/rxcode
PASS: t/re/subst
PASS: t/re/substT
PASS: t/re/subst_amp
PASS: t/re/subst_wamp
PASS: t/re/substr
PASS: t/re/substr_thr
PASS: t/re/uniprops
SKIP: t/op/64bitint
PASS: t/op/alarm
PASS: t/op/anonsub
PASS: t/op/append
PASS: t/op/args
PASS: t/op/arith
PASS: t/op/array
PASS: t/op/array_base
PASS: t/op/assignwarn
PASS: t/op/attrhand
PASS: t/op/attrs
PASS: t/op/auto
PASS: t/op/avhv
PASS: t/op/bless
PASS: t/op/blocks
PASS: t/op/bop
PASS: t/op/caller
PASS: t/op/chars
PASS: t/op/chdir
PASS: t/op/chop
PASS: t/op/chr
PASS: t/op/closure
PASS: t/op/cmp
PASS: t/op/concat
PASS: t/op/concat2
PASS: t/op/cond
PASS: t/op/context
PASS: t/op/cproto
PASS: t/op/crypt
PASS: t/op/dbm
PASS: t/op/defins
PASS: t/op/delete
PASS: t/op/die
PASS: t/op/die_except
PASS: t/op/die_exit
PASS: t/op/die_keeperr
PASS: t/op/die_unwind
PASS: t/op/do
PASS: t/op/dor
PASS: t/op/each
PASS: t/op/each_array
PASS: t/op/eval
PASS: t/op/exec
PASS: t/op/exists_sub
PASS: t/op/exp
PASS: t/op/fh
PASS: t/op/filehandle
PASS: t/op/filetest
PASS: t/op/filetest_stack_ok
PASS: t/op/filetest_t
PASS: t/op/flip
PASS: t/op/fork
PASS: t/op/getpid
PASS: t/op/getppid
PASS: t/op/glob
PASS: t/op/gmagic
PASS: t/op/goto
PASS: t/op/goto_xs
PASS: t/op/grent
PASS: t/op/grep
PASS: t/op/groups
PASS: t/op/gv
PASS: t/op/hash
PASS: t/op/hashassign
PASS: t/op/hashwarn
PASS: t/op/inc
PASS: t/op/inccode-tie
PASS: t/op/inccode
PASS: t/op/incfilter
PASS: t/op/index
PASS: t/op/index_thr
PASS: t/op/int
PASS: t/op/join
PASS: t/op/kill0
PASS: t/op/lc
PASS: t/op/lc_user
PASS: t/op/leaky-magic
PASS: t/op/length
PASS: t/op/lex
PASS: t/op/lex_assign
SKIP: t/op/lfs
PASS: t/op/list
PASS: t/op/local
PASS: t/op/localref
PASS: t/op/loopctl
PASS: t/op/lop
PASS: t/op/magic-27839
PASS: t/op/magic
PASS: t/op/magic_phase
PASS: t/op/method
PASS: t/op/mkdir
PASS: t/op/my
PASS: t/op/my_stash
PASS: t/op/mydef
PASS: t/op/negate
PASS: t/op/not
PASS: t/op/numconvert
PASS: t/op/oct
PASS: t/op/or
PASS: t/op/ord
PASS: t/op/overload_integer
PASS: t/op/override
# Failed at op/pack.t line 441
#      got "0"
# expected "12"
# Failed at op/pack.t line 442
#      got "0"
# expected "34"
# Failed at op/pack.t line 441
#      got "0"
# expected "12"
# Failed at op/pack.t line 442
#      got "0"
# expected "34"
FAIL: t/op/pack
FAILED at test 402
PASS: t/op/packagev
PASS: t/op/pos
PASS: t/op/pow
PASS: t/op/print
PASS: t/op/protowarn
PASS: t/op/push
PASS: t/op/pwent
PASS: t/op/qq
PASS: t/op/qr
PASS: t/op/quotemeta
PASS: t/op/rand
PASS: t/op/range
PASS: t/op/read
PASS: t/op/readdir
PASS: t/op/readline
PASS: t/op/recurse
PASS: t/op/ref
PASS: t/op/repeat
PASS: t/op/require_errors
PASS: t/op/reset
PASS: t/op/reverse
PASS: t/op/runlevel
PASS: t/op/setpgrpstack
PASS: t/op/sigdispatch
PASS: t/op/sleep
PASS: t/op/smartkve
PASS: t/op/smartmatch
PASS: t/op/sort
PASS: t/op/splice
PASS: t/op/split
PASS: t/op/split_unicode
PASS: t/op/sprintf
PASS: t/op/sprintf2
PASS: t/op/srand
PASS: t/op/sselect
PASS: t/op/stash
PASS: t/op/stat
PASS: t/op/state
PASS: t/op/study
PASS: t/op/studytied
PASS: t/op/sub
PASS: t/op/sub_lval
PASS: t/op/svleak
PASS: t/op/switch
PASS: t/op/symbolcache
PASS: t/op/sysio
PASS: t/op/taint
PASS: t/op/threads-dirh
# Failed at ./test.pl line 828
#      got undef
# expected "ok"
# PROG:=20
# use threads;
# sub foo { return (sub { }); }
# my $bar =3D threads->create(\&foo)->join();
# threads->create(sub { })->join();
# print "ok";
# STATUS: -1
FAIL: t/op/threads
FAILED at test 15
PASS: t/op/tie
PASS: t/op/tie_fetch_count
PASS: t/op/tiearray
PASS: t/op/tiehandle
PASS: t/op/time
PASS: t/op/time_loop
PASS: t/op/tr
PASS: t/op/turkish
PASS: t/op/undef
PASS: t/op/universal
PASS: t/op/unshift
PASS: t/op/upgrade
PASS: t/op/utf8cache
PASS: t/op/utf8decode
PASS: t/op/utf8magic
PASS: t/op/utfhash
PASS: t/op/utftaint
PASS: t/op/vec
PASS: t/op/ver
PASS: t/op/wantarray
PASS: t/op/warn
PASS: t/op/while_readdir
PASS: t/op/write
PASS: t/op/yadayada
PASS: t/uni/cache
PASS: t/uni/chomp
PASS: t/uni/chr
PASS: t/uni/class
PASS: t/uni/fold
PASS: t/uni/greek
PASS: t/uni/latin2
PASS: t/uni/lex_utf8
PASS: t/uni/lower
PASS: t/uni/overload
PASS: t/uni/sprintf
PASS: t/uni/tie
PASS: t/uni/title
PASS: t/uni/tr_7jis
PASS: t/uni/tr_eucjp
PASS: t/uni/tr_sjis
PASS: t/uni/tr_utf8
PASS: t/uni/upper
PASS: t/uni/write
PASS: t/mro/basic
PASS: t/mro/basic_01_c3
PASS: t/mro/basic_01_dfs
PASS: t/mro/basic_02_c3
PASS: t/mro/basic_02_dfs
PASS: t/mro/basic_03_c3
PASS: t/mro/basic_03_dfs
PASS: t/mro/basic_04_c3
PASS: t/mro/basic_04_dfs
PASS: t/mro/basic_05_c3
PASS: t/mro/basic_05_dfs
PASS: t/mro/c3_with_overload
PASS: t/mro/complex_c3
PASS: t/mro/complex_dfs
PASS: t/mro/dbic_c3
PASS: t/mro/dbic_dfs
PASS: t/mro/inconsistent_c3
PASS: t/mro/isa_aliases
PASS: t/mro/isa_c3
PASS: t/mro/isa_dfs
PASS: t/mro/isarev
PASS: t/mro/method_caching
PASS: t/mro/next_NEXT
PASS: t/mro/next_edgecases
PASS: t/mro/next_goto
PASS: t/mro/next_inanon
PASS: t/mro/next_ineval
PASS: t/mro/next_method
PASS: t/mro/next_skip
PASS: t/mro/overload_c3
PASS: t/mro/overload_dfs
PASS: t/mro/package_aliases
PASS: t/mro/pkg_gen
PASS: t/mro/recursion_c3
PASS: t/mro/recursion_dfs
PASS: t/mro/vulcan_c3
PASS: t/mro/vulcan_dfs
PASS: t/lib/1_compile
PASS: t/lib/commonsense
PASS: t/lib/croak
SKIP: t/lib/cygwin
PASS: t/lib/deprecate
PASS: t/lib/mypragma
PASS: t/lib/no_load
PASS: t/lib/overload_fallback
PASS: t/lib/proxy_constant_subs
PASS: t/lib/universal
#   Failed test 'extract() for 'double_dir.zip' reports success (PP: 0 Bin:=
 1)'
#   at t/01_Archive-Extract.t line 456.
FAIL: cpan/Archive-Extract/t/01_Archive-Extract
FAILED at test 87
PASS: cpan/Archive-Tar/t/01_use
PASS: cpan/Archive-Tar/t/02_methods
PASS: cpan/Archive-Tar/t/03_file
PASS: cpan/Archive-Tar/t/04_resolved_issues
PASS: cpan/Archive-Tar/t/05_iter
PASS: cpan/Archive-Tar/t/06_error
SKIP: cpan/Archive-Tar/t/90_symlink
SKIP: cpan/Archive-Tar/t/99_pod
PASS: cpan/autodie/t/00-load
PASS: cpan/autodie/t/autodie
PASS: cpan/autodie/t/backcompat
PASS: cpan/autodie/t/basic_exceptions
PASS: cpan/autodie/t/binmode
PASS: cpan/autodie/t/blog_hints
PASS: cpan/autodie/t/caller
PASS: cpan/autodie/t/context_lexical
PASS: cpan/autodie/t/context
PASS: cpan/autodie/t/crickey
PASS: cpan/autodie/t/dbmopen
PASS: cpan/autodie/t/eval_error
PASS: cpan/autodie/t/exception_class
PASS: cpan/autodie/t/exceptions
PASS: cpan/autodie/t/exec
PASS: cpan/autodie/t/Fatal
PASS: cpan/autodie/t/filehandles
PASS: cpan/autodie/t/fileno
PASS: cpan/autodie/t/flock
PASS: cpan/autodie/t/format-clobber
PASS: cpan/autodie/t/hints_insist
PASS: cpan/autodie/t/hints_pod_examples
PASS: cpan/autodie/t/hints_provider_does
PASS: cpan/autodie/t/hints_provider_easy_does_it
PASS: cpan/autodie/t/hints_provider_isa
PASS: cpan/autodie/t/hints
PASS: cpan/autodie/t/internal-backcompat
PASS: cpan/autodie/t/internal
PASS: cpan/autodie/t/lethal
PASS: cpan/autodie/t/mkdir
PASS: cpan/autodie/t/open
PASS: cpan/autodie/t/recv
PASS: cpan/autodie/t/repeat
PASS: cpan/autodie/t/scope_leak
PASS: cpan/autodie/t/string-eval-basic
PASS: cpan/autodie/t/string-eval-leak
PASS: cpan/autodie/t/sysopen
PASS: cpan/autodie/t/truncate
PASS: cpan/autodie/t/unlink
PASS: cpan/autodie/t/user-context
PASS: cpan/autodie/t/usersub
PASS: cpan/autodie/t/version
PASS: cpan/autodie/t/version_tag
PASS: cpan/AutoLoader/t/01AutoLoader
PASS: cpan/AutoLoader/t/02AutoSplit
PASS: cpan/B-Debug/t/debug
PASS: cpan/CGI/t/apache
PASS: cpan/CGI/t/autoescape
PASS: cpan/CGI/t/can
PASS: cpan/CGI/t/carp
PASS: cpan/CGI/t/charset
PASS: cpan/CGI/t/checkbox_group
PASS: cpan/CGI/t/cookie
PASS: cpan/CGI/t/Dump
PASS: cpan/CGI/t/end_form
PASS: cpan/CGI/t/form
PASS: cpan/CGI/t/function
PASS: cpan/CGI/t/headers
PASS: cpan/CGI/t/hidden
PASS: cpan/CGI/t/html
PASS: cpan/CGI/t/http
PASS: cpan/CGI/t/init
PASS: cpan/CGI/t/no_tabindex
PASS: cpan/CGI/t/param_fetch
PASS: cpan/CGI/t/popup_menu
PASS: cpan/CGI/t/pretty
PASS: cpan/CGI/t/push
PASS: cpan/CGI/t/query_string
PASS: cpan/CGI/t/request
PASS: cpan/CGI/t/save_read_roundtrip
PASS: cpan/CGI/t/start_end_asterisk
PASS: cpan/CGI/t/start_end_end
PASS: cpan/CGI/t/start_end_start
PASS: cpan/CGI/t/switch
PASS: cpan/CGI/t/unescapeHTML
PASS: cpan/CGI/t/uploadInfo
PASS: cpan/CGI/t/upload
PASS: cpan/CGI/t/url
PASS: cpan/CGI/t/user_agent
PASS: cpan/CGI/t/utf8
PASS: cpan/CGI/t/util-58
PASS: cpan/CGI/t/util
PASS: cpan/Compress-Raw-Bzip2/t/000prereq
PASS: cpan/Compress-Raw-Bzip2/t/01bzip2
PASS: cpan/Compress-Raw-Bzip2/t/09limitoutput
SKIP: cpan/Compress-Raw-Bzip2/t/99pod
PASS: cpan/Compress-Raw-Zlib/t/01version
PASS: cpan/Compress-Raw-Zlib/t/02zlib
PASS: cpan/Compress-Raw-Zlib/t/07bufsize
PASS: cpan/Compress-Raw-Zlib/t/09limitoutput
PASS: cpan/Compress-Raw-Zlib/t/18lvalue
PASS: cpan/CPAN-Meta/t/converter-bad
PASS: cpan/CPAN-Meta/t/converter-fail
PASS: cpan/CPAN-Meta/t/converter
PASS: cpan/CPAN-Meta/t/load-bad
PASS: cpan/CPAN-Meta/t/meta-obj
PASS: cpan/CPAN-Meta/t/no-index
PASS: cpan/CPAN-Meta/t/prereqs-finalize
PASS: cpan/CPAN-Meta/t/prereqs-merge
PASS: cpan/CPAN-Meta/t/prereqs
PASS: cpan/CPAN-Meta/t/repository
PASS: cpan/CPAN-Meta/t/save-load
PASS: cpan/CPAN-Meta/t/validator
PASS: cpan/CPAN-Meta-YAML/t/01_compile
PASS: cpan/CPAN-Meta-YAML/t/02_basic
PASS: cpan/CPAN-Meta-YAML/t/03_regression
PASS: cpan/CPAN-Meta-YAML/t/05_export
PASS: cpan/CPAN-Meta-YAML/t/11_meta_yml
PASS: cpan/CPAN-Meta-YAML/t/12_plagger
PASS: cpan/CPAN-Meta-YAML/t/13_perl_smith
PASS: cpan/CPAN-Meta-YAML/t/14_yaml_org
PASS: cpan/CPAN-Meta-YAML/t/15_multibyte
PASS: cpan/CPAN-Meta-YAML/t/16_nullrefs
PASS: cpan/CPAN-Meta-YAML/t/17_toolbar
PASS: cpan/CPAN-Meta-YAML/t/18_tap
PASS: cpan/CPAN-Meta-YAML/t/19_errors
PASS: cpan/CPAN-Meta-YAML/t/20_subclass
PASS: cpan/CPAN-Meta-YAML/t/21_bom
PASS: cpan/CPAN-Meta-YAML/t/22_comments
PASS: cpan/CPANPLUS-Dist-Build/t/01_CPANPLUS-Dist-Build-Constants
[ERROR] You do not have 'Module::Build' -- 'CPANPLUS::Dist::Build' not avai=
lable

#   Failed test 'Format is available'
#   at t/02_CPANPLUS-Dist-Build.t line 94.
FAIL: cpan/CPANPLUS-Dist-Build/t/02_CPANPLUS-Dist-Build
FAILED at test 2
PASS: cpan/CPANPLUS/t/00_CPANPLUS-Internals-Utils
PASS: cpan/CPANPLUS/t/01_CPANPLUS-Configure
PASS: cpan/CPANPLUS/t/02_CPANPLUS-Internals
PASS: cpan/CPANPLUS/t/03_CPANPLUS-Internals-Source
#   Failed test '   Tested prereqs'
#   at t/04_CPANPLUS-Module.t line 309.
FAIL: cpan/CPANPLUS/t/04_CPANPLUS-Module
FAILED at test 109
PASS: cpan/CPANPLUS/t/05_CPANPLUS-Internals-Fetch
PASS: cpan/CPANPLUS/t/06_CPANPLUS-Internals-Constants
PASS: cpan/CPANPLUS/t/07_CPANPLUS-Internals-Extract
PASS: cpan/CPANPLUS/t/08_CPANPLUS-Backend
PASS: cpan/CPANPLUS/t/09_CPANPLUS-Internals-Search
PASS: cpan/CPANPLUS/t/10_CPANPLUS-Error
PASS: cpan/CPANPLUS/t/15_CPANPLUS-Shell
PASS: cpan/CPANPLUS/t/19_CPANPLUS-Dist
make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', need=
ed by `Makefile'.  Stop.
#   Failed test 'Testing module'
#   at t/20_CPANPLUS-Dist-MM.t line 108.
FAIL: cpan/CPANPLUS/t/20_CPANPLUS-Dist-MM
FAILED at test 11
PASS: cpan/CPANPLUS/t/21_CPANPLUS-Dist-No-Build
PASS: cpan/CPANPLUS/t/25_CPANPLUS
PASS: cpan/CPANPLUS/t/30_CPANPLUS-Internals-Selfupdate
PASS: cpan/CPANPLUS/t/40_CPANPLUS-Internals-Report
PASS: cpan/CPAN/t/01loadme
PASS: cpan/CPAN/t/02nox
PASS: cpan/CPAN/t/03pkgs
PASS: cpan/CPAN/t/10version
PASS: cpan/CPAN/t/11mirroredby
FAIL: cpan/Devel-DProf/t/DProf
FAILED--expected 20 tests, saw 0
PASS: cpan/Devel-PPPort/t/call
PASS: cpan/Devel-PPPort/t/cop
PASS: cpan/Devel-PPPort/t/exception
PASS: cpan/Devel-PPPort/t/format
PASS: cpan/Devel-PPPort/t/grok
PASS: cpan/Devel-PPPort/t/gv
PASS: cpan/Devel-PPPort/t/HvNAME
PASS: cpan/Devel-PPPort/t/limits
PASS: cpan/Devel-PPPort/t/magic
PASS: cpan/Devel-PPPort/t/memory
PASS: cpan/Devel-PPPort/t/misc
PASS: cpan/Devel-PPPort/t/mPUSH
PASS: cpan/Devel-PPPort/t/MY_CXT
PASS: cpan/Devel-PPPort/t/newCONSTSUB
PASS: cpan/Devel-PPPort/t/newRV
PASS: cpan/Devel-PPPort/t/newSVpv
PASS: cpan/Devel-PPPort/t/newSV_type
PASS: cpan/Devel-PPPort/t/podtest
PASS: cpan/Devel-PPPort/t/ppphtest
PASS: cpan/Devel-PPPort/t/pvs
PASS: cpan/Devel-PPPort/t/pv_tools
PASS: cpan/Devel-PPPort/t/shared_pv
PASS: cpan/Devel-PPPort/t/snprintf
PASS: cpan/Devel-PPPort/t/sprintf
PASS: cpan/Devel-PPPort/t/strlfuncs
PASS: cpan/Devel-PPPort/t/SvPV
PASS: cpan/Devel-PPPort/t/SvREFCNT
PASS: cpan/Devel-PPPort/t/Sv_set
PASS: cpan/Devel-PPPort/t/sv_xpvf
PASS: cpan/Devel-PPPort/t/threads
PASS: cpan/Devel-PPPort/t/uv
PASS: cpan/Devel-PPPort/t/variables
PASS: cpan/Devel-PPPort/t/warn
PASS: cpan/Digest-MD5/t/align
PASS: cpan/Digest-MD5/t/badfile
PASS: cpan/Digest-MD5/t/bits
PASS: cpan/Digest-MD5/t/clone
PASS: cpan/Digest-MD5/t/files
PASS: cpan/Digest-MD5/t/md5-aaa
PASS: cpan/Digest-MD5/t/threads
PASS: cpan/Digest-MD5/t/utf8
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/allfcns.t line 19.
FAIL: cpan/Digest-SHA/t/allfcns
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/base64.t line 10.
FAIL: cpan/Digest-SHA/t/base64
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/bitbuf.t line 9.
FAIL: cpan/Digest-SHA/t/bitbuf
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 5) line 2.
BEGIN failed--compilation aborted at t/dumpload.t line 10.
FAIL: cpan/Digest-SHA/t/dumpload
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/fips180-4.t line 9.
FAIL: cpan/Digest-SHA/t/fips180-4
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/fips198.t line 9.
FAIL: cpan/Digest-SHA/t/fips198
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 5) line 2.
BEGIN failed--compilation aborted at t/gglong.t line 14.
FAIL: cpan/Digest-SHA/t/gglong
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/gg.t line 13.
FAIL: cpan/Digest-SHA/t/gg
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/hmacsha.t line 11.
FAIL: cpan/Digest-SHA/t/hmacsha
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 5) line 2.
BEGIN failed--compilation aborted at t/ireland.t line 10.
FAIL: cpan/Digest-SHA/t/ireland
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 5) line 2.
BEGIN failed--compilation aborted at t/methods.t line 10.
FAIL: cpan/Digest-SHA/t/methods
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/nistbit.t line 13.
FAIL: cpan/Digest-SHA/t/nistbit
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/nistbyte.t line 13.
FAIL: cpan/Digest-SHA/t/nistbyte
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/rfc2202.t line 9.
FAIL: cpan/Digest-SHA/t/rfc2202
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/sha1.t line 9.
FAIL: cpan/Digest-SHA/t/sha1
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/sha224.t line 9.
FAIL: cpan/Digest-SHA/t/sha224
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/sha256.t line 9.
FAIL: cpan/Digest-SHA/t/sha256
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/sha384.t line 9.
FAIL: cpan/Digest-SHA/t/sha384
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/sha512.t line 9.
FAIL: cpan/Digest-SHA/t/sha512
FAILED--no leader found
Can't locate Digest/SHA/PurePerl.pm in @INC (@INC contains: ../../lib ../..=
/t .) at (eval 1) line 2.
BEGIN failed--compilation aborted at t/woodbury.t line 13.
FAIL: cpan/Digest-SHA/t/woodbury
FAILED--no leader found
PASS: cpan/Digest/t/base
PASS: cpan/Digest/t/digest
PASS: cpan/Digest/t/file
PASS: cpan/Digest/t/security
PASS: cpan/Encode/t/Aliases
PASS: cpan/Encode/t/at-cn
PASS: cpan/Encode/t/at-tw
PASS: cpan/Encode/t/CJKT
PASS: cpan/Encode/t/enc_data
PASS: cpan/Encode/t/enc_eucjp
PASS: cpan/Encode/t/enc_module
PASS: cpan/Encode/t/Encoder
PASS: cpan/Encode/t/Encode
PASS: cpan/Encode/t/encoding
PASS: cpan/Encode/t/enc_utf8
PASS: cpan/Encode/t/fallback
PASS: cpan/Encode/t/from_to
PASS: cpan/Encode/t/grow
PASS: cpan/Encode/t/gsm0338
PASS: cpan/Encode/t/guess
PASS: cpan/Encode/t/jis7-fallback
PASS: cpan/Encode/t/jperl
PASS: cpan/Encode/t/mime_header_iso2022jp
PASS: cpan/Encode/t/mime-header
PASS: cpan/Encode/t/mime-name
PASS: cpan/Encode/t/perlio
SKIP: cpan/Encode/t/piconv
PASS: cpan/Encode/t/Unicode
PASS: cpan/Encode/t/utf8ref
PASS: cpan/Encode/t/utf8strict
PASS: cpan/encoding-warnings/t/1-warning
PASS: cpan/encoding-warnings/t/2-fatal
PASS: cpan/encoding-warnings/t/3-normal
PASS: cpan/encoding-warnings/t/4-lexical
PERL_CORE is set but I can't find your PERL_SRC!
make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', need=
ed by `Makefile'.  Stop.
FAIL: cpan/ExtUtils-Constant/t/Constant
FAILED at test 3
Can't open MANIFEST: No such file or directory at t/00compile.t line 17.
FAIL: cpan/ExtUtils-MakeMaker/t/00compile
FAILED--no leader found
PASS: cpan/ExtUtils-MakeMaker/t/arch_check
PASS: cpan/ExtUtils-MakeMaker/t/backwards
#   Failed test 'make manifest created a MANIFEST'
#   at t/basic.t line 70.
FAIL: cpan/ExtUtils-MakeMaker/t/basic
FAILED at test 8
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PASS: cpan/ExtUtils-MakeMaker/t/build_man
PASS: cpan/ExtUtils-MakeMaker/t/cd
PASS: cpan/ExtUtils-MakeMaker/t/config
PASS: cpan/ExtUtils-MakeMaker/t/dir_target
PASS: cpan/ExtUtils-MakeMaker/t/FIRST_MAKEFILE
PASS: cpan/ExtUtils-MakeMaker/t/fixin
PASS: cpan/ExtUtils-MakeMaker/t/fix_libs
PASS: cpan/ExtUtils-MakeMaker/t/hints
#   Failed test '  make install exited normally'
#   at t/INSTALL_BASE.t line 46.
#          got: '512'
#     expected: '0'
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
FAIL: cpan/ExtUtils-MakeMaker/t/INSTALL_BASE
FAILED at test 5
PASS: cpan/ExtUtils-MakeMaker/t/installed_file
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
#   Failed test 'PERL_SRC'
#   at t/INST_PREFIX.t line 111.
#          got: undef
#     expected: '../../../..'
FAIL: cpan/ExtUtils-MakeMaker/t/INST_PREFIX
FAILED at test 13
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
#   Failed test 'PERL_SRC'
#   at t/INST.t line 78.
#          got: undef
#     expected: '../../../..'
FAIL: cpan/ExtUtils-MakeMaker/t/INST
FAILED at test 9
PASS: cpan/ExtUtils-MakeMaker/t/is_of_type
PASS: cpan/ExtUtils-MakeMaker/t/Liblist
PASS: cpan/ExtUtils-MakeMaker/t/MakeMaker_Parameters
PASS: cpan/ExtUtils-MakeMaker/t/make
PASS: cpan/ExtUtils-MakeMaker/t/maketext_filter
PASS: cpan/ExtUtils-MakeMaker/t/metafile_data
PASS: cpan/ExtUtils-MakeMaker/t/metafile_file
#   Failed test 'run(make)'
#   at t/miniperl.t line 49.
#          got: 512
#     expected: 0
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
FAIL: cpan/ExtUtils-MakeMaker/t/miniperl
FAILED at test 5
#   Failed test 'Make ppd exiting normally'
#   at t/min_perl_version.t line 168.
#          got: 512
#     expected: 0
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
Can't open Min-PerlVers.ppd for reading: No such file or directory at t/lib=
/MakeMaker/Test/Utils.pm line 397.
No root path(s) specified
 at t/min_perl_version.t line 193
FAIL: cpan/ExtUtils-MakeMaker/t/min_perl_version
FAILED at test 26
PASS: cpan/ExtUtils-MakeMaker/t/Mkbootstrap
PASS: cpan/ExtUtils-MakeMaker/t/MM_Any
SKIP: cpan/ExtUtils-MakeMaker/t/MM_BeOS
SKIP: cpan/ExtUtils-MakeMaker/t/MM_Cygwin
SKIP: cpan/ExtUtils-MakeMaker/t/MM_NW5
SKIP: cpan/ExtUtils-MakeMaker/t/MM_OS2
PASS: cpan/ExtUtils-MakeMaker/t/MM_Unix
SKIP: cpan/ExtUtils-MakeMaker/t/MM_VMS
SKIP: cpan/ExtUtils-MakeMaker/t/MM_Win32
PASS: cpan/ExtUtils-MakeMaker/t/oneliner
PASS: cpan/ExtUtils-MakeMaker/t/parse_abstract
PASS: cpan/ExtUtils-MakeMaker/t/parse_version
#   Failed test at t/PL_FILES.t line 32.
#          got: '512'
#     expected: '0'
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
FAIL: cpan/ExtUtils-MakeMaker/t/PL_FILES
FAILED at test 3
PERL_CORE is set but I can't find your PERL_SRC!
PASS: cpan/ExtUtils-MakeMaker/t/pm
#   Failed test 'run(make)'
#   at t/pm_to_blib.t line 41.
#          got: 512
#     expected: 0
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
FAIL: cpan/ExtUtils-MakeMaker/t/pm_to_blib
FAILED at test 4
PASS: cpan/ExtUtils-MakeMaker/t/pod2man
#   Failed test 'postamble argument not warned about'
#   at t/postamble.t line 46.
#          got: 'PERL_CORE is set but I can't find your PERL_SRC!
# '
#     expected: ''
FAIL: cpan/ExtUtils-MakeMaker/t/postamble
FAILED at test 4
PASS: cpan/ExtUtils-MakeMaker/t/prefixify
PASS: cpan/ExtUtils-MakeMaker/t/prereq_print
PASS: cpan/ExtUtils-MakeMaker/t/prereq
PASS: cpan/ExtUtils-MakeMaker/t/problems
PASS: cpan/ExtUtils-MakeMaker/t/prompt
#   Failed test 'recursive make exited normally'
#   at t/recurs.t line 55.
#          got: '512'
#     expected: '0'
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
FAIL: cpan/ExtUtils-MakeMaker/t/recurs
FAILED at test 6
PASS: cpan/ExtUtils-MakeMaker/t/revision
#   Failed test 'Make ppd exiting normally'
#   at t/several_authors.t line 103.
#          got: 512
#     expected: 0
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
Can't open Multiple-Authors.ppd for reading: No such file or directory at t=
/lib/MakeMaker/Test/Utils.pm line 397.
No root path(s) specified
 at t/several_authors.t line 120
FAIL: cpan/ExtUtils-MakeMaker/t/several_authors
FAILED at test 11
PASS: cpan/ExtUtils-MakeMaker/t/split_command
PASS: cpan/ExtUtils-MakeMaker/t/test_boilerplate
PASS: cpan/ExtUtils-MakeMaker/t/testlib
PASS: cpan/ExtUtils-MakeMaker/t/VERSION_FROM
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PERL_CORE is set but I can't find your PERL_SRC!
PASS: cpan/ExtUtils-MakeMaker/t/WriteEmptyMakefile
#   Failed test at t/writemakefile_args.t line 49.
#          got: 'WARNING: MAN3PODS takes a HASH reference not a string/numb=
er.
#          Please inform the author.
# PERL_CORE is set but I can't find your PERL_SRC!
# '
#     expected: 'WARNING: MAN3PODS takes a HASH reference not a string/numb=
er.
#          Please inform the author.
# '
FAIL: cpan/ExtUtils-MakeMaker/t/writemakefile_args
FAILED at test 4
SKIP: cpan/ExtUtils-MakeMaker/t/xs
PASS: cpan/File-Fetch/t/01_File-Fetch
PASS: cpan/File-Fetch/t/null_subclass
PASS: cpan/File-Path/t/Path
PASS: cpan/File-Path/t/taint
PASS: cpan/File-Temp/t/cmp
PASS: cpan/File-Temp/t/fork
SKIP: cpan/File-Temp/t/lock
PASS: cpan/File-Temp/t/mktemp
PASS: cpan/File-Temp/t/object
PASS: cpan/File-Temp/t/posix
PASS: cpan/File-Temp/t/security
PASS: cpan/File-Temp/t/seekable
PASS: cpan/File-Temp/t/tempfile
Can't locate filter-util.pl in @INC (@INC contains: ../../lib ../../t .) at=
 t/call.t line 10.
BEGIN failed--compilation aborted at t/call.t line 11.
FAIL: cpan/Filter-Util-Call/t/call
FAILED--no leader found
PASS: cpan/Getopt-Long/t/gol-basic
PASS: cpan/Getopt-Long/t/gol-compat
PASS: cpan/Getopt-Long/t/gol-linkage
PASS: cpan/Getopt-Long/t/gol-oo
PASS: cpan/Getopt-Long/t/gol-xargv
PASS: cpan/Getopt-Long/t/gol-xstring
PASS: cpan/HTTP-Tiny/t/000_load
PASS: cpan/HTTP-Tiny/t/001_api
PASS: cpan/HTTP-Tiny/t/002_croakage
Can't stat lib: No such file or directory
 at t/00-compile.t line 32
SKIP: cpan/HTTP-Tiny/t/00-compile
PASS: cpan/HTTP-Tiny/t/010_url
PASS: cpan/HTTP-Tiny/t/020_headers
PASS: cpan/HTTP-Tiny/t/030_response
PASS: cpan/HTTP-Tiny/t/040_content
PASS: cpan/HTTP-Tiny/t/050_chunked_body
PASS: cpan/HTTP-Tiny/t/060_http_date
PASS: cpan/HTTP-Tiny/t/100_get
PASS: cpan/HTTP-Tiny/t/110_mirror
PASS: cpan/HTTP-Tiny/t/120_put
PASS: cpan/HTTP-Tiny/t/130_redirect
PASS: cpan/IO-Compress/t/000prereq
PASS: cpan/IO-Compress/t/001bzip2
PASS: cpan/IO-Compress/t/001zlib-generic-deflate
PASS: cpan/IO-Compress/t/001zlib-generic-gzip
PASS: cpan/IO-Compress/t/001zlib-generic-rawdeflate
PASS: cpan/IO-Compress/t/001zlib-generic-zip
PASS: cpan/IO-Compress/t/002any-deflate
PASS: cpan/IO-Compress/t/002any-gzip
PASS: cpan/IO-Compress/t/002any-rawdeflate
PASS: cpan/IO-Compress/t/002any-transparent
PASS: cpan/IO-Compress/t/002any-zip
PASS: cpan/IO-Compress/t/004gziphdr
PASS: cpan/IO-Compress/t/005defhdr
PASS: cpan/IO-Compress/t/006zip
#   Failed test '  exit status is 0'
#   at t/010examples-bzip2.t line 92.
#          got: '512'
#     expected: '0'
FAIL: cpan/IO-Compress/t/010examples-bzip2
FAILED at test 2
#   Failed test '  exit status is 0'
#   at t/010examples-zlib.t line 92.
#          got: '512'
#     expected: '0'
FAIL: cpan/IO-Compress/t/010examples-zlib
FAILED at test 2
PASS: cpan/IO-Compress/t/01misc
SKIP: cpan/IO-Compress/t/020isize
PASS: cpan/IO-Compress/t/050interop-gzip
PASS: cpan/IO-Compress/t/100generic-bzip2
PASS: cpan/IO-Compress/t/100generic-deflate
PASS: cpan/IO-Compress/t/100generic-gzip
PASS: cpan/IO-Compress/t/100generic-rawdeflate
PASS: cpan/IO-Compress/t/100generic-zip
PASS: cpan/IO-Compress/t/101truncate-bzip2
PASS: cpan/IO-Compress/t/101truncate-deflate
PASS: cpan/IO-Compress/t/101truncate-gzip
PASS: cpan/IO-Compress/t/101truncate-rawdeflate
PASS: cpan/IO-Compress/t/101truncate-zip
PASS: cpan/IO-Compress/t/102tied-bzip2
PASS: cpan/IO-Compress/t/102tied-deflate
PASS: cpan/IO-Compress/t/102tied-gzip
PASS: cpan/IO-Compress/t/102tied-rawdeflate
PASS: cpan/IO-Compress/t/102tied-zip
PASS: cpan/IO-Compress/t/103newtied-bzip2
PASS: cpan/IO-Compress/t/103newtied-deflate
PASS: cpan/IO-Compress/t/103newtied-gzip
PASS: cpan/IO-Compress/t/103newtied-rawdeflate
PASS: cpan/IO-Compress/t/103newtied-zip
PASS: cpan/IO-Compress/t/104destroy-bzip2
PASS: cpan/IO-Compress/t/104destroy-deflate
PASS: cpan/IO-Compress/t/104destroy-gzip
PASS: cpan/IO-Compress/t/104destroy-rawdeflate
PASS: cpan/IO-Compress/t/104destroy-zip
PASS: cpan/IO-Compress/t/105oneshot-bzip2
PASS: cpan/IO-Compress/t/105oneshot-deflate
PASS: cpan/IO-Compress/t/105oneshot-gzip-only
PASS: cpan/IO-Compress/t/105oneshot-gzip
PASS: cpan/IO-Compress/t/105oneshot-rawdeflate
PASS: cpan/IO-Compress/t/105oneshot-zip-bzip2-only
PASS: cpan/IO-Compress/t/105oneshot-zip-only
PASS: cpan/IO-Compress/t/105oneshot-zip
PASS: cpan/IO-Compress/t/106prime-bzip2
PASS: cpan/IO-Compress/t/106prime-deflate
PASS: cpan/IO-Compress/t/106prime-gzip
PASS: cpan/IO-Compress/t/106prime-rawdeflate
PASS: cpan/IO-Compress/t/106prime-zip
PASS: cpan/IO-Compress/t/107multi-bzip2
PASS: cpan/IO-Compress/t/107multi-deflate
PASS: cpan/IO-Compress/t/107multi-gzip
PASS: cpan/IO-Compress/t/107multi-rawdeflate
PASS: cpan/IO-Compress/t/107multi-zip
PASS: cpan/IO-Compress/t/108anyunc-bzip2
PASS: cpan/IO-Compress/t/108anyunc-deflate
PASS: cpan/IO-Compress/t/108anyunc-gzip
PASS: cpan/IO-Compress/t/108anyunc-rawdeflate
PASS: cpan/IO-Compress/t/108anyunc-transparent
PASS: cpan/IO-Compress/t/108anyunc-zip
PASS: cpan/IO-Compress/t/109merge-deflate
PASS: cpan/IO-Compress/t/109merge-gzip
PASS: cpan/IO-Compress/t/109merge-rawdeflate
SKIP: cpan/IO-Compress/t/109merge-zip
PASS: cpan/IO-Compress/t/110encode-bzip2
PASS: cpan/IO-Compress/t/110encode-deflate
PASS: cpan/IO-Compress/t/110encode-gzip
PASS: cpan/IO-Compress/t/110encode-rawdeflate
PASS: cpan/IO-Compress/t/110encode-zip
SKIP: cpan/IO-Compress/t/999pod
PASS: cpan/IO-Compress/t/cz-01version
PASS: cpan/IO-Compress/t/cz-03zlib-v1
#   Failed test '  exit status is 0'
#   at t/cz-05examples.t line 96.
#          got: '512'
#     expected: '0'
FAIL: cpan/IO-Compress/t/cz-05examples
FAILED at test 2
PASS: cpan/IO-Compress/t/cz-06gzsetp
PASS: cpan/IO-Compress/t/cz-08encoding
PASS: cpan/IO-Compress/t/cz-14gzopen
PASS: cpan/IO-Compress/t/globmapper
PASS: cpan/IO-Zlib/t/basic
SKIP: cpan/IO-Zlib/t/external
PASS: cpan/IO-Zlib/t/getc
PASS: cpan/IO-Zlib/t/getline
PASS: cpan/IO-Zlib/t/import
PASS: cpan/IO-Zlib/t/large
PASS: cpan/IO-Zlib/t/tied
PASS: cpan/IO-Zlib/t/uncomp1
PASS: cpan/IO-Zlib/t/uncomp2
PASS: cpan/IPC-Cmd/t/01_IPC-Cmd
SKIP: cpan/IPC-Cmd/t/02_Interactive
PASS: cpan/IPC-SysV/t/ipcsysv
PASS: cpan/IPC-SysV/t/msg
SKIP: cpan/IPC-SysV/t/podcov
SKIP: cpan/IPC-SysV/t/pod
PASS: cpan/IPC-SysV/t/sem
PASS: cpan/IPC-SysV/t/shm
PASS: cpan/JSON-PP/t/000_load
PASS: cpan/JSON-PP/t/001_utf8
PASS: cpan/JSON-PP/t/002_error
PASS: cpan/JSON-PP/t/003_types
PASS: cpan/JSON-PP/t/006_pc_pretty
PASS: cpan/JSON-PP/t/007_pc_esc
PASS: cpan/JSON-PP/t/008_pc_base
PASS: cpan/JSON-PP/t/009_pc_extra_number
PASS: cpan/JSON-PP/t/010_pc_keysort
PASS: cpan/JSON-PP/t/011_pc_expo
PASS: cpan/JSON-PP/t/012_blessed
PASS: cpan/JSON-PP/t/013_limit
PASS: cpan/JSON-PP/t/014_latin1
PASS: cpan/JSON-PP/t/015_prefix
PASS: cpan/JSON-PP/t/016_tied
PASS: cpan/JSON-PP/t/017_relaxed
PASS: cpan/JSON-PP/t/018_json_checker
PASS: cpan/JSON-PP/t/019_incr
PASS: cpan/JSON-PP/t/020_unknown
PASS: cpan/JSON-PP/t/021_evans_bugrep
PASS: cpan/JSON-PP/t/022_comment_at_eof
PASS: cpan/JSON-PP/t/099_binary
PASS: cpan/JSON-PP/t/104_sortby
PASS: cpan/JSON-PP/t/105_esc_slash
PASS: cpan/JSON-PP/t/106_allow_barekey
PASS: cpan/JSON-PP/t/107_allow_singlequote
PASS: cpan/JSON-PP/t/108_decode
PASS: cpan/JSON-PP/t/109_encode
PASS: cpan/JSON-PP/t/110_bignum
PASS: cpan/JSON-PP/t/112_upgrade
PASS: cpan/JSON-PP/t/113_overloaded_eq
PASS: cpan/JSON-PP/t/114_decode_prefix
PASS: cpan/JSON-PP/t/115_tie_ixhash
SKIP: cpan/libnet/t/config
SKIP: cpan/libnet/t/datasend
SKIP: cpan/libnet/t/ftp
SKIP: cpan/libnet/t/hostname
SKIP: cpan/libnet/t/netrc
SKIP: cpan/libnet/t/nntp
SKIP: cpan/libnet/t/require
SKIP: cpan/libnet/t/smtp
SKIP: cpan/libnet/t/time
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/00version.t lin=
e 7.
BEGIN failed--compilation aborted at t/00version.t line 14.
FAIL: cpan/List-Util/t/00version
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/blessed.t line =
7.
BEGIN failed--compilation aborted at t/blessed.t line 14.
FAIL: cpan/List-Util/t/blessed
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/dualvar.t line =
7.
BEGIN failed--compilation aborted at t/dualvar.t line 14.
FAIL: cpan/List-Util/t/dualvar
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/expfail.t line =
7.
BEGIN failed--compilation aborted at t/expfail.t line 14.
FAIL: cpan/List-Util/t/expfail
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/first.t line 7.
BEGIN failed--compilation aborted at t/first.t line 14.
FAIL: cpan/List-Util/t/first
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/isvstring.t lin=
e 7.
BEGIN failed--compilation aborted at t/isvstring.t line 14.
FAIL: cpan/List-Util/t/isvstring
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/lln.t line 7.
BEGIN failed--compilation aborted at t/lln.t line 14.
FAIL: cpan/List-Util/t/lln
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/maxstr.t line 7=
.
BEGIN failed--compilation aborted at t/maxstr.t line 14.
FAIL: cpan/List-Util/t/maxstr
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/max.t line 7.
BEGIN failed--compilation aborted at t/max.t line 14.
FAIL: cpan/List-Util/t/max
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/minstr.t line 7=
.
BEGIN failed--compilation aborted at t/minstr.t line 14.
FAIL: cpan/List-Util/t/minstr
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/min.t line 7.
BEGIN failed--compilation aborted at t/min.t line 14.
FAIL: cpan/List-Util/t/min
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/openhan.t line =
7.
BEGIN failed--compilation aborted at t/openhan.t line 14.
FAIL: cpan/List-Util/t/openhan
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/p_00version.t l=
ine 7.
BEGIN failed--compilation aborted at t/p_00version.t line 14.
FAIL: cpan/List-Util/t/p_00version
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/blessed.t line =
7.
BEGIN failed--compilation aborted at t/blessed.t line 14.
FAIL: cpan/List-Util/t/p_blessed
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/first.t line 7.
BEGIN failed--compilation aborted at t/first.t line 14.
FAIL: cpan/List-Util/t/p_first
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/lln.t line 7.
BEGIN failed--compilation aborted at t/lln.t line 14.
FAIL: cpan/List-Util/t/p_lln
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/maxstr.t line 7=
.
BEGIN failed--compilation aborted at t/maxstr.t line 14.
FAIL: cpan/List-Util/t/p_maxstr
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/max.t line 7.
BEGIN failed--compilation aborted at t/max.t line 14.
FAIL: cpan/List-Util/t/p_max
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/minstr.t line 7=
.
BEGIN failed--compilation aborted at t/minstr.t line 14.
FAIL: cpan/List-Util/t/p_minstr
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/min.t line 7.
BEGIN failed--compilation aborted at t/min.t line 14.
FAIL: cpan/List-Util/t/p_min
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/openhan.t line =
7.
BEGIN failed--compilation aborted at t/openhan.t line 14.
FAIL: cpan/List-Util/t/p_openhan
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/readonly.t line=
 7.
BEGIN failed--compilation aborted at t/readonly.t line 14.
FAIL: cpan/List-Util/t/p_readonly
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/reduce.t line 7=
.
BEGIN failed--compilation aborted at t/reduce.t line 14.
FAIL: cpan/List-Util/t/p_reduce
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/refaddr.t line =
7.
BEGIN failed--compilation aborted at t/refaddr.t line 14.
FAIL: cpan/List-Util/t/p_refaddr
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/reftype.t line =
7.
BEGIN failed--compilation aborted at t/reftype.t line 14.
FAIL: cpan/List-Util/t/p_reftype
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/proto.t line 7.
BEGIN failed--compilation aborted at t/proto.t line 14.
FAIL: cpan/List-Util/t/proto
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/shuffle.t line =
7.
BEGIN failed--compilation aborted at t/shuffle.t line 14.
FAIL: cpan/List-Util/t/p_shuffle
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/sum.t line 7.
BEGIN failed--compilation aborted at t/sum.t line 14.
FAIL: cpan/List-Util/t/p_sum
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at ./t/tainted.t lin=
e 7.
BEGIN failed--compilation aborted at ./t/tainted.t line 17.
FAIL: cpan/List-Util/t/p_tainted
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/readonly.t line=
 7.
BEGIN failed--compilation aborted at t/readonly.t line 14.
FAIL: cpan/List-Util/t/readonly
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/reduce.t line 7=
.
BEGIN failed--compilation aborted at t/reduce.t line 14.
FAIL: cpan/List-Util/t/reduce
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/refaddr.t line =
7.
BEGIN failed--compilation aborted at t/refaddr.t line 14.
FAIL: cpan/List-Util/t/refaddr
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/reftype.t line =
7.
BEGIN failed--compilation aborted at t/reftype.t line 14.
FAIL: cpan/List-Util/t/reftype
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/shuffle.t line =
7.
BEGIN failed--compilation aborted at t/shuffle.t line 14.
FAIL: cpan/List-Util/t/shuffle
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/stack-corruptio=
n.t line 7.
BEGIN failed--compilation aborted at t/stack-corruption.t line 18.
FAIL: cpan/List-Util/t/stack-corruption
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/sum.t line 7.
BEGIN failed--compilation aborted at t/sum.t line 14.
FAIL: cpan/List-Util/t/sum
FAILED--no leader found
Can't locate Config.pm in @INC (@INC contains: ../lib) at t/tainted.t line =
7.
BEGIN failed--compilation aborted at t/tainted.t line 17.
FAIL: cpan/List-Util/t/tainted
FAILED--no leader found
Can't locate Config_heavy.pl in @INC (@INC contains: ../lib) at ../../lib/C=
onfig.pm line 79.
BEGIN failed--compilation aborted at t/weak.t line 15.
FAIL: cpan/List-Util/t/weak
FAILED--no leader found
PASS: cpan/Locale-Codes/t/alias_code
PASS: cpan/Locale-Codes/t/code2country
PASS: cpan/Locale-Codes/t/code2currency
PASS: cpan/Locale-Codes/t/code2language
PASS: cpan/Locale-Codes/t/code2script
PASS: cpan/Locale-Codes/t/country2code
PASS: cpan/Locale-Codes/t/country_code2code
PASS: cpan/Locale-Codes/t/country
PASS: cpan/Locale-Codes/t/currency2code
PASS: cpan/Locale-Codes/t/language2code
PASS: cpan/Locale-Codes/t/language
PASS: cpan/Locale-Codes/t/script2code
PASS: cpan/Locale-Maketext-Simple/t/0-signature
PASS: cpan/Locale-Maketext-Simple/t/1-basic
SKIP: cpan/Locale-Maketext-Simple/t/2-load_po_without_i_default
SKIP: cpan/Locale-Maketext-Simple/t/3-load_po_with_i_default
PASS: cpan/Log-Message-Simple/t/01_use
PASS: cpan/Log-Message-Simple/t/02_imports
PASS: cpan/Log-Message-Simple/t/03_functions
PASS: cpan/Log-Message/t/01_Log-Message-Config
PASS: cpan/Log-Message/t/02_Log-Message
PASS: cpan/Math-Complex/t/Complex
PASS: cpan/Math-Complex/t/Trig
PASS: cpan/Math-Complex/t/underbar
PASS: cpan/Memoize/t/array_confusion
PASS: cpan/Memoize/t/array
PASS: cpan/Memoize/t/correctness
PASS: cpan/Memoize/t/errors
PASS: cpan/Memoize/t/expfile
PASS: cpan/Memoize/t/expire
PASS: cpan/Memoize/t/expmod_n
PASS: cpan/Memoize/t/expmod_t
PASS: cpan/Memoize/t/flush
PASS: cpan/Memoize/t/normalize
PASS: cpan/Memoize/t/prototype
PASS: cpan/Memoize/t/speed
PASS: cpan/Memoize/t/tiefeatures
PASS: cpan/Memoize/t/tie_gdbm
SKIP: cpan/Memoize/t/tie_ndbm
PASS: cpan/Memoize/t/tie_sdbm
PASS: cpan/Memoize/t/tie_storable
PASS: cpan/Memoize/t/tie
PASS: cpan/Memoize/t/unmemoize
PASS: cpan/MIME-Base64/t/base64
PASS: cpan/MIME-Base64/t/length
PASS: cpan/MIME-Base64/t/quoted-print
PASS: cpan/MIME-Base64/t/unicode
Can't stat lib: No such file or directory
 at t/00-compile.t line 8
You said to run 0 tests at t/00-compile.t line 10.
FAIL: cpan/Module-Build/t/00-compile
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/actions/installdeps
FAILED--expected 6 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/actions/manifest_skip
FAILED--expected 7 tests, saw 0
Can't locate Module/Metadata.pm in @INC (@INC contains: /usr/lib/perl/ptest=
/cpan/Module-Build/t/lib /usr/lib/perl/ptest/cpan/Module-Build/../../lib /u=
sr/lib/perl/ptest/cpan/Module-Build/../../t /usr/lib/perl/ptest/cpan/Module=
-Build /usr/lib/perl/ptest/cpan/Module-Build/t/bundled .) at /usr/lib/perl/=
ptest/cpan/Module-Build/../../lib/Module/Build/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 2.
	...propagated at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/base.pm l=
ine 94.
BEGIN failed--compilation aborted at t/add_property.t line 18.
# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/add_property
FAILED--expected 27 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/basic
FAILED--expected 58 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 23) line 1.

FAIL: cpan/Module-Build/t/bundle_inc
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/compat/exit
FAILED--expected 3 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/compat
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/debug
FAILED--expected 1 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/destinations
FAILED--expected 113 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/extend
FAILED--expected 64 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 13) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/ext
FAILED--expected 185 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/files
FAILED--expected 4 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/help
FAILED--expected 23 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/install_extra_target
FAILED--expected 6 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/install
FAILED--expected 34 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

FAIL: cpan/Module-Build/t/manifypods
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/metadata2
FAILED--expected 18 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/metadata
FAILED--expected 52 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 16) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/mymeta
FAILED--expected 39 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/new_from_context
FAILED--expected 2 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/notes
FAILED--expected 11 tests, saw 0
Can't locate Module/Metadata.pm in @INC (@INC contains: /usr/lib/perl/ptest=
/cpan/Module-Build/t/lib /usr/lib/perl/ptest/cpan/Module-Build/../../lib /u=
sr/lib/perl/ptest/cpan/Module-Build/../../t /usr/lib/perl/ptest/cpan/Module=
-Build /usr/lib/perl/ptest/cpan/Module-Build/t/bundled .) at /usr/lib/perl/=
ptest/cpan/Module-Build/../../lib/Module/Build/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 13) line 2.
	...propagated at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/base.pm l=
ine 94.
BEGIN failed--compilation aborted at t/parents.t line 15.
# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/parents
FAILED--expected 26 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/perl_mb_opt
FAILED--expected 8 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/PL_files
FAILED--expected 8 tests, saw 0
PASS: cpan/Module-Build/t/pod_parser
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

FAIL: cpan/Module-Build/t/ppm
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/properties/dist_suffix
FAILED--expected 2 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/properties/license
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/properties/module_name
FAILED--expected 4 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/properties/needs_compiler
FAILED--expected 19 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/properties/release_status
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/properties/requires
FAILED--expected 4 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/properties/share_dir
FAILED--expected 21 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/resume
FAILED--expected 3 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/runthrough
FAILED--expected 29 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/sample
FAILED--expected 2 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 16) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/script_dist
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/test_file_exts
FAILED--expected 3 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/test_types
FAILED--expected 25 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/test_type
FAILED--expected 7 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/tilde
FAILED--expected 16 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 17) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/use_tap_harness
FAILED--expected 9 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/versions
FAILED--expected 2 tests, saw 0
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

# Looks like your test exited with 2 before it could output anything.
FAIL: cpan/Module-Build/t/write_default_maniskip
FAILED--no leader found
Error loading Module::Build: Can't locate Module/Metadata.pm in @INC (@INC =
contains: /usr/lib/perl/ptest/cpan/Module-Build/t/lib /usr/lib/perl/ptest/c=
pan/Module-Build/../../lib /usr/lib/perl/ptest/cpan/Module-Build/../../t /u=
sr/lib/perl/ptest/cpan/Module-Build /usr/lib/perl/ptest/cpan/Module-Build/t=
/bundled .) at /usr/lib/perl/ptest/cpan/Module-Build/../../lib/Module/Build=
/ModuleInfo.pm line 10.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build/Base.pm line 23.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build/Base.pm line 23.
Compilation failed in require at /usr/lib/perl/ptest/cpan/Module-Build/../.=
./lib/Module/Build.pm line 15.
BEGIN failed--compilation aborted at /usr/lib/perl/ptest/cpan/Module-Build/=
../../lib/Module/Build.pm line 15.
Compilation failed in require at (eval 15) line 1.

FAIL: cpan/Module-Build/t/xs
FAILED--no leader found
PASS: cpan/Module-Load-Conditional/t/01_Module_Load_Conditional
PASS: cpan/Module-Load-Conditional/t/02_Parse_Version
PASS: cpan/Module-Loaded/t/01_Module-Loaded
PASS: cpan/Module-Load/t/01_Module-Load
#   Failed test 'require Module::Metadata;'
#   at t/metadata.t line 178.
#     Tried to require 'Module::Metadata'.
#     Error:  Can't locate Module/Metadata.pm in @INC (@INC contains: /usr/=
lib/perl/ptest/cpan/Module-Metadata/t/lib /usr/lib/perl/ptest/cpan/Module-M=
etadata/../../lib /usr/lib/perl/ptest/cpan/Module-Metadata/../../t /usr/lib=
/perl/ptest/cpan/Module-Metadata /usr/lib/perl/ptest/cpan/Module-Metadata/t=
/bundled .) at (eval 14) line 2.
Can't locate object method "find_module_by_name" via package "Module::Metad=
ata" at t/metadata.t line 181.
# Looks like you planned 99 tests but ran 1.
# Looks like you failed 1 test of 1 run.
# Looks like your test exited with 255 just after 1.
FAIL: cpan/Module-Metadata/t/metadata
FAILED at test 1
PASS: cpan/Module-Pluggable/t/01use
PASS: cpan/Module-Pluggable/t/02alsoworks
PASS: cpan/Module-Pluggable/t/02works
PASS: cpan/Module-Pluggable/t/02works_taint
PASS: cpan/Module-Pluggable/t/03diffname
PASS: cpan/Module-Pluggable/t/04acmedir_single
PASS: cpan/Module-Pluggable/t/04acmedir
PASS: cpan/Module-Pluggable/t/04acmepath_single
PASS: cpan/Module-Pluggable/t/04acmepath
PASS: cpan/Module-Pluggable/t/05postpath
PASS: cpan/Module-Pluggable/t/06multipath
PASS: cpan/Module-Pluggable/t/07instantiate
PASS: cpan/Module-Pluggable/t/08nothing
PASS: cpan/Module-Pluggable/t/09require
PASS: cpan/Module-Pluggable/t/10innerpack_inner
PASS: cpan/Module-Pluggable/t/10innerpack_noinner
PASS: cpan/Module-Pluggable/t/10innerpack_onefile
PASS: cpan/Module-Pluggable/t/10innerpack_override
PASS: cpan/Module-Pluggable/t/10innerpack_super
PASS: cpan/Module-Pluggable/t/10innerpack
PASS: cpan/Module-Pluggable/t/11usetwice
PASS: cpan/Module-Pluggable/t/12onlyarray
PASS: cpan/Module-Pluggable/t/12onlyregex
PASS: cpan/Module-Pluggable/t/12onlyrequire
PASS: cpan/Module-Pluggable/t/12only
PASS: cpan/Module-Pluggable/t/13exceptarray
PASS: cpan/Module-Pluggable/t/13exceptregex
PASS: cpan/Module-Pluggable/t/13except
PASS: cpan/Module-Pluggable/t/14package
PASS: cpan/Module-Pluggable/t/15topicsafe
PASS: cpan/Module-Pluggable/t/16different_extension
PASS: cpan/Module-Pluggable/t/17devel_inner_package
PASS: cpan/Module-Pluggable/t/18skipped_package
PASS: cpan/Module-Pluggable/t/19can_ok_clobber
PASS: cpan/Module-Pluggable/t/20dodgy_files
PASS: cpan/Module-Pluggable/t/21editor_junk
PASS: cpan/NEXT/t/actual
PASS: cpan/NEXT/t/actuns
PASS: cpan/NEXT/t/dynamically_scoped_regex_vars
PASS: cpan/NEXT/t/next
PASS: cpan/NEXT/t/stringify
PASS: cpan/NEXT/t/unseen
PASS: cpan/Object-Accessor/t/00_Object-Accessor
PASS: cpan/Object-Accessor/t/01_Object-Accessor-Subclassed
PASS: cpan/Object-Accessor/t/02_Object-Accessor-allow
PASS: cpan/Object-Accessor/t/03_Object-Accessor-local
PASS: cpan/Object-Accessor/t/04_Object-Accessor-lvalue
PASS: cpan/Object-Accessor/t/05_Object-Accessor-callback
PASS: cpan/Object-Accessor/t/06_Object-Accessor-alias
PASS: cpan/Package-Constants/t/01_list
PASS: cpan/Params-Check/t/01_Params-Check
PASS: cpan/parent/t/compile-time-file
PASS: cpan/parent/t/compile-time
PASS: cpan/parent/t/parent-classfromclassfile
PASS: cpan/parent/t/parent-classfromfile
PASS: cpan/parent/t/parent-pmc
PASS: cpan/parent/t/parent-returns-false
PASS: cpan/parent/t/parent
PASS: cpan/Parse-CPAN-Meta/t/01_compile
PASS: cpan/Parse-CPAN-Meta/t/02_api
PASS: cpan/Parse-CPAN-Meta/t/03_functions
PASS: cpan/Parse-CPAN-Meta/t/04_export
PASS: cpan/Parse-CPAN-Meta/t/05_errors
PASS: cpan/PerlIO-via-QuotedPrint/t/QuotedPrint
Can't stat lib: No such file or directory
 at t/00-compile.t line 29
SKIP: cpan/Perl-OSType/t/00-compile
PASS: cpan/Perl-OSType/t/OSType
PASS: cpan/Pod-Escapes/t/01_about_verbose
PASS: cpan/Pod-Escapes/t/10_main
PASS: cpan/Pod-Escapes/t/15_name2charnum
PASS: cpan/Pod-LaTeX/t/pod2latex
PASS: cpan/Pod-LaTeX/t/user
PASS: cpan/podlators/t/basic
PASS: cpan/podlators/t/color
PASS: cpan/podlators/t/devise-date
PASS: cpan/podlators/t/filehandle
PASS: cpan/podlators/t/man-heading
PASS: cpan/podlators/t/man-options
PASS: cpan/podlators/t/man-perlio
PASS: cpan/podlators/t/man
PASS: cpan/podlators/t/man-utf8
PASS: cpan/podlators/t/overstrike
PASS: cpan/podlators/t/parselink
PASS: cpan/podlators/t/pod-parser
SKIP: cpan/podlators/t/pod-spelling
SKIP: cpan/podlators/t/pod
PASS: cpan/podlators/t/termcap
PASS: cpan/podlators/t/text-encoding
PASS: cpan/podlators/t/text-options
PASS: cpan/podlators/t/text-perlio
PASS: cpan/podlators/t/text
PASS: cpan/podlators/t/text-utf8
PASS: cpan/Pod-Parser/t/pod/contains_pod
PASS: cpan/Pod-Parser/t/pod/emptycmd
#   Failed test at t/pod/find.t line 84.
#          got: ''
#     expected: 'Pod::Checker,Pod::Find,Pod::InputObjects,Pod::ParseUtils,P=
od::Parser,Pod::PlainText,Pod::Select,Pod::Usage'
FAIL: cpan/Pod-Parser/t/pod/find
FAILED at test 2
PASS: cpan/Pod-Parser/t/pod/for
PASS: cpan/Pod-Parser/t/pod/headings
PASS: cpan/Pod-Parser/t/pod/included
PASS: cpan/Pod-Parser/t/pod/include
PASS: cpan/Pod-Parser/t/pod/lref
PASS: cpan/Pod-Parser/t/pod/multiline_items
PASS: cpan/Pod-Parser/t/pod/nested_items
PASS: cpan/Pod-Parser/t/pod/nested_seqs
PASS: cpan/Pod-Parser/t/pod/oneline_cmds
PASS: cpan/Pod-Parser/t/pod/pod2usage2
*** Can't find =3Dinclude file pod2usage.PL in t/pod t /usr/lib/perl/ptest/=
cpan/Pod-Parser/lib/Pod /usr/lib/perl/ptest/cpan/Pod-Parser/scripts /usr/li=
b/perl/ptest/cpan/Pod-Parser/pod /usr/lib/perl/ptest/cpan/Pod-Parser/t/pod =
../../pod
t/pod/pod2usage.OUT is shorter than t/pod/pod2usage.xr
FAIL: cpan/Pod-Parser/t/pod/pod2usage
FAILED at test 1
PASS: cpan/Pod-Parser/t/pod/podchkenc
PASS: cpan/Pod-Parser/t/pod/poderrs
*** Can't find =3Dinclude file podselect.PL in t/pod t /usr/lib/perl/ptest/=
cpan/Pod-Parser/lib/Pod /usr/lib/perl/ptest/cpan/Pod-Parser/scripts /usr/li=
b/perl/ptest/cpan/Pod-Parser/pod /usr/lib/perl/ptest/cpan/Pod-Parser/t/pod =
../../pod
t/pod/podselect.OUT is shorter than t/pod/podselect.xr
FAIL: cpan/Pod-Parser/t/pod/podselect
FAILED at test 1
PASS: cpan/Pod-Parser/t/pod/special_seqs
PASS: cpan/Pod-Parser/t/pod/twice
PASS: cpan/Pod-Simple/t/00about
PASS: cpan/Pod-Simple/t/20_skip
PASS: cpan/Pod-Simple/t/accept01
PASS: cpan/Pod-Simple/t/accept05
PASS: cpan/Pod-Simple/t/ac_d
PASS: cpan/Pod-Simple/t/basic
PASS: cpan/Pod-Simple/t/begin
PASS: cpan/Pod-Simple/t/cbacks
PASS: cpan/Pod-Simple/t/chunking
PASS: cpan/Pod-Simple/t/closeys
PASS: cpan/Pod-Simple/t/corpus
PASS: cpan/Pod-Simple/t/encod01
PASS: cpan/Pod-Simple/t/encod02
PASS: cpan/Pod-Simple/t/encod03
PASS: cpan/Pod-Simple/t/end_over
PASS: cpan/Pod-Simple/t/fcodes_e
PASS: cpan/Pod-Simple/t/fcodes_l
PASS: cpan/Pod-Simple/t/fcodes_s
PASS: cpan/Pod-Simple/t/fcodes
PASS: cpan/Pod-Simple/t/fornot
PASS: cpan/Pod-Simple/t/for
PASS: cpan/Pod-Simple/t/heads
PASS: cpan/Pod-Simple/t/html01
PASS: cpan/Pod-Simple/t/html02
PASS: cpan/Pod-Simple/t/html03
PASS: cpan/Pod-Simple/t/htmlbat
PASS: cpan/Pod-Simple/t/items02
PASS: cpan/Pod-Simple/t/items
PASS: cpan/Pod-Simple/t/itemstar
PASS: cpan/Pod-Simple/t/linkclas
PASS: cpan/Pod-Simple/t/output
PASS: cpan/Pod-Simple/t/puller
PASS: cpan/Pod-Simple/t/pulltitl
PASS: cpan/Pod-Simple/t/reinit
PASS: cpan/Pod-Simple/t/render
PASS: cpan/Pod-Simple/t/search05
PASS: cpan/Pod-Simple/t/search10
PASS: cpan/Pod-Simple/t/search12
PASS: cpan/Pod-Simple/t/search20
PASS: cpan/Pod-Simple/t/search22
PASS: cpan/Pod-Simple/t/search25
PASS: cpan/Pod-Simple/t/search26
PASS: cpan/Pod-Simple/t/search27
PASS: cpan/Pod-Simple/t/search28
PASS: cpan/Pod-Simple/t/search29
PASS: cpan/Pod-Simple/t/search50
PASS: cpan/Pod-Simple/t/stree
PASS: cpan/Pod-Simple/t/strpvbtm
PASS: cpan/Pod-Simple/t/tiedfh
PASS: cpan/Pod-Simple/t/verbatim
PASS: cpan/Pod-Simple/t/verb_fmt
PASS: cpan/Pod-Simple/t/xhtml01
PASS: cpan/Pod-Simple/t/xhtml05
PASS: cpan/Pod-Simple/t/xhtml10
PASS: cpan/Pod-Simple/t/x_nixer
PASS: cpan/Shell/t/Shell
PASS: cpan/Sys-Syslog/t/00-load
SKIP: cpan/Sys-Syslog/t/constants
PASS: cpan/Sys-Syslog/t/syslog
PASS: cpan/Term-ANSIColor/t/basic
SKIP: cpan/Term-Cap/test
PASS: cpan/Term-UI/t/00_load
PASS: cpan/Term-UI/t/01_history
PASS: cpan/Term-UI/t/02_ui
Can't read MANIFEST: No such file or directory at t/000-load.t line 87.
FAIL: cpan/Test-Harness/t/000-load
FAILED--no leader found
PASS: cpan/Test-Harness/t/aggregator
PASS: cpan/Test-Harness/t/bailout
PASS: cpan/Test-Harness/t/base
PASS: cpan/Test-Harness/t/callbacks
PASS: cpan/Test-Harness/t/compat/env
PASS: cpan/Test-Harness/t/compat/failure
PASS: cpan/Test-Harness/t/compat/inc-propagation
PASS: cpan/Test-Harness/t/compat/inc_taint
SKIP: cpan/Test-Harness/t/compat/nonumbers
PASS: cpan/Test-Harness/t/compat/regression
PASS: cpan/Test-Harness/t/compat/subclass
PASS: cpan/Test-Harness/t/compat/switches
PASS: cpan/Test-Harness/t/compat/test-harness-compat
PASS: cpan/Test-Harness/t/compat/version
PASS: cpan/Test-Harness/t/console
PASS: cpan/Test-Harness/t/errors
PASS: cpan/Test-Harness/t/file
PASS: cpan/Test-Harness/t/glob-to-regexp
PASS: cpan/Test-Harness/t/grammar
PASS: cpan/Test-Harness/t/harness-bailout
PASS: cpan/Test-Harness/t/harness-subclass
PASS: cpan/Test-Harness/t/harness
PASS: cpan/Test-Harness/t/iterator_factory
PASS: cpan/Test-Harness/t/iterators
PASS: cpan/Test-Harness/t/multiplexer
PASS: cpan/Test-Harness/t/nested
PASS: cpan/Test-Harness/t/nofork-mux
PASS: cpan/Test-Harness/t/nofork
PASS: cpan/Test-Harness/t/object
PASS: cpan/Test-Harness/t/parser-config
PASS: cpan/Test-Harness/t/parser-subclass
PASS: cpan/Test-Harness/t/parse
PASS: cpan/Test-Harness/t/perl5lib
PASS: cpan/Test-Harness/t/premature-bailout
PASS: cpan/Test-Harness/t/process
PASS: cpan/Test-Harness/t/proveenv
PASS: cpan/Test-Harness/t/proverc
PASS: cpan/Test-Harness/t/proverun
PASS: cpan/Test-Harness/t/prove
PASS: cpan/Test-Harness/t/proveversion
PASS: cpan/Test-Harness/t/regression
PASS: cpan/Test-Harness/t/results
PASS: cpan/Test-Harness/t/scheduler
PASS: cpan/Test-Harness/t/source_handler
PASS: cpan/Test-Harness/t/source
PASS: cpan/Test-Harness/t/source_tests/source
PASS: cpan/Test-Harness/t/spool
PASS: cpan/Test-Harness/t/state_results
PASS: cpan/Test-Harness/t/state
PASS: cpan/Test-Harness/t/streams
PASS: cpan/Test-Harness/t/taint
PASS: cpan/Test-Harness/t/testargs
PASS: cpan/Test-Harness/t/unicode
PASS: cpan/Test-Harness/t/utils
PASS: cpan/Test-Harness/t/yamlish-output
PASS: cpan/Test-Harness/t/yamlish
PASS: cpan/Test-Harness/t/yamlish-writer
PASS: cpan/Test-Simple/examples/subtest
PASS: cpan/Test-Simple/t/00test_harness_check
PASS: cpan/Test-Simple/t/bad_plan
PASS: cpan/Test-Simple/t/bail_out
PASS: cpan/Test-Simple/t/BEGIN_require_ok
PASS: cpan/Test-Simple/t/BEGIN_use_ok
PASS: cpan/Test-Simple/t/buffer
PASS: cpan/Test-Simple/t/Builder/Builder
PASS: cpan/Test-Simple/t/Builder/carp
PASS: cpan/Test-Simple/t/Builder/create
PASS: cpan/Test-Simple/t/Builder/current_test
PASS: cpan/Test-Simple/t/Builder/current_test_without_plan
PASS: cpan/Test-Simple/t/Builder/details
PASS: cpan/Test-Simple/t/Builder/done_testing_double
PASS: cpan/Test-Simple/t/Builder/done_testing_plan_mismatch
PASS: cpan/Test-Simple/t/Builder/done_testing
PASS: cpan/Test-Simple/t/Builder/done_testing_with_no_plan
PASS: cpan/Test-Simple/t/Builder/done_testing_with_number
PASS: cpan/Test-Simple/t/Builder/done_testing_with_plan
PASS: cpan/Test-Simple/t/Builder/fork_with_new_stdout
PASS: cpan/Test-Simple/t/Builder/has_plan2
PASS: cpan/Test-Simple/t/Builder/has_plan
PASS: cpan/Test-Simple/t/Builder/is_fh
PASS: cpan/Test-Simple/t/Builder/is_passing
PASS: cpan/Test-Simple/t/Builder/maybe_regex
PASS: cpan/Test-Simple/t/Builder/no_diag
PASS: cpan/Test-Simple/t/Builder/no_ending
PASS: cpan/Test-Simple/t/Builder/no_header
PASS: cpan/Test-Simple/t/Builder/no_plan_at_all
PASS: cpan/Test-Simple/t/Builder/ok_obj
PASS: cpan/Test-Simple/t/Builder/output
PASS: cpan/Test-Simple/t/Builder/reset
PASS: cpan/Test-Simple/t/Builder/try
PASS: cpan/Test-Simple/t/c_flag
PASS: cpan/Test-Simple/t/circular_data
PASS: cpan/Test-Simple/t/cmp_ok
SKIP: cpan/Test-Simple/t/dependents
PASS: cpan/Test-Simple/t/diag
PASS: cpan/Test-Simple/t/died
PASS: cpan/Test-Simple/t/dont_overwrite_die_handler
PASS: cpan/Test-Simple/t/eq_set
PASS: cpan/Test-Simple/t/exit
PASS: cpan/Test-Simple/t/explain
PASS: cpan/Test-Simple/t/extra_one
PASS: cpan/Test-Simple/t/extra
PASS: cpan/Test-Simple/t/fail-like
PASS: cpan/Test-Simple/t/fail-more
PASS: cpan/Test-Simple/t/fail_one
PASS: cpan/Test-Simple/t/fail
PASS: cpan/Test-Simple/t/filehandles
PASS: cpan/Test-Simple/t/fork
PASS: cpan/Test-Simple/t/harness_active
PASS: cpan/Test-Simple/t/import
PASS: cpan/Test-Simple/t/is_deeply_dne_bug
PASS: cpan/Test-Simple/t/is_deeply_fail
SKIP: cpan/Test-Simple/t/is_deeply_with_threads
PASS: cpan/Test-Simple/t/missing
PASS: cpan/Test-Simple/t/More
PASS: cpan/Test-Simple/t/new_ok
PASS: cpan/Test-Simple/t/no_plan
PASS: cpan/Test-Simple/t/no_tests
PASS: cpan/Test-Simple/t/note
PASS: cpan/Test-Simple/t/overload
PASS: cpan/Test-Simple/t/overload_threads
PASS: cpan/Test-Simple/t/plan_bad
PASS: cpan/Test-Simple/t/plan_is_noplan
PASS: cpan/Test-Simple/t/plan_no_plan
PASS: cpan/Test-Simple/t/plan_shouldnt_import
SKIP: cpan/Test-Simple/t/plan_skip_all
PASS: cpan/Test-Simple/t/plan
PASS: cpan/Test-Simple/t/require_ok
PASS: cpan/Test-Simple/t/Simple/load
PASS: cpan/Test-Simple/t/simple
PASS: cpan/Test-Simple/t/skipall
PASS: cpan/Test-Simple/t/skip
PASS: cpan/Test-Simple/t/subtest/args
PASS: cpan/Test-Simple/t/subtest/basic
PASS: cpan/Test-Simple/t/subtest/die
PASS: cpan/Test-Simple/t/subtest/do
PASS: cpan/Test-Simple/t/subtest/exceptions
PASS: cpan/Test-Simple/t/subtest/fork
PASS: cpan/Test-Simple/t/subtest/implicit_done
PASS: cpan/Test-Simple/t/subtest/line_numbers
PASS: cpan/Test-Simple/t/subtest/plan
PASS: cpan/Test-Simple/t/subtest/predicate
PASS: cpan/Test-Simple/t/subtest/singleton
PASS: cpan/Test-Simple/t/subtest/todo
PASS: cpan/Test-Simple/t/subtest/wstat
PASS: cpan/Test-Simple/t/tbm_doesnt_set_exported_to
PASS: cpan/Test-Simple/t/Tester/tbt_01basic
PASS: cpan/Test-Simple/t/Tester/tbt_02fhrestore
PASS: cpan/Test-Simple/t/Tester/tbt_03die
PASS: cpan/Test-Simple/t/Tester/tbt_04line_num
PASS: cpan/Test-Simple/t/Tester/tbt_05faildiag
PASS: cpan/Test-Simple/t/Tester/tbt_06errormess
PASS: cpan/Test-Simple/t/Tester/tbt_07args
PASS: cpan/Test-Simple/t/threads
PASS: cpan/Test-Simple/t/thread_taint
PASS: cpan/Test-Simple/t/todo
PASS: cpan/Test-Simple/t/undef
PASS: cpan/Test-Simple/t/useing
PASS: cpan/Test-Simple/t/use_ok
PASS: cpan/Test-Simple/t/utf8
PASS: cpan/Test-Simple/t/versions
PASS: cpan/Test/t/05_about_verbose
PASS: cpan/Test/t/fail
PASS: cpan/Test/t/mix
PASS: cpan/Test/t/multiline
PASS: cpan/Test/t/onfail
PASS: cpan/Test/t/qr
PASS: cpan/Test/t/skip
PASS: cpan/Test/t/success
PASS: cpan/Test/t/todo
PASS: cpan/Text-Balanced/t/01_compile
PASS: cpan/Text-Balanced/t/02_extbrk
PASS: cpan/Text-Balanced/t/03_extcbk
PASS: cpan/Text-Balanced/t/04_extdel
PASS: cpan/Text-Balanced/t/05_extmul
PASS: cpan/Text-Balanced/t/06_extqlk
PASS: cpan/Text-Balanced/t/07_exttag
PASS: cpan/Text-Balanced/t/08_extvar
PASS: cpan/Text-Balanced/t/09_gentag
PASS: cpan/Text-ParseWords/t/ParseWords
PASS: cpan/Text-ParseWords/t/taint
PASS: cpan/Text-Soundex/t/Soundex
PASS: cpan/Text-Tabs/t/37000
PASS: cpan/Text-Tabs/t/39548
PASS: cpan/Text-Tabs/t/belg4mit
PASS: cpan/Text-Tabs/t/dandv
PASS: cpan/Text-Tabs/t/fill
PASS: cpan/Text-Tabs/t/Jacobson2
PASS: cpan/Text-Tabs/t/Jacobson
PASS: cpan/Text-Tabs/t/Jochen
PASS: cpan/Text-Tabs/t/sep2
PASS: cpan/Text-Tabs/t/sep
PASS: cpan/Text-Tabs/t/tabs
PASS: cpan/Text-Tabs/t/wrap_separator2
PASS: cpan/Text-Tabs/t/wrap
PASS: cpan/Tie-File/t/00_version
PASS: cpan/Tie-File/t/01_gen
PASS: cpan/Tie-File/t/02_fetchsize
PASS: cpan/Tie-File/t/03_longfetch
PASS: cpan/Tie-File/t/04_splice
PASS: cpan/Tie-File/t/05_size
PASS: cpan/Tie-File/t/06_fixrec
PASS: cpan/Tie-File/t/07_rv_splice
PASS: cpan/Tie-File/t/08_ro
PASS: cpan/Tie-File/t/09_gen_rs
PASS: cpan/Tie-File/t/10_splice_rs
PASS: cpan/Tie-File/t/11_rv_splice_rs
PASS: cpan/Tie-File/t/12_longfetch_rs
PASS: cpan/Tie-File/t/13_size_rs
PASS: cpan/Tie-File/t/14_lock
PASS: cpan/Tie-File/t/15_pushpop
PASS: cpan/Tie-File/t/16_handle
PASS: cpan/Tie-File/t/17_misc_meth
PASS: cpan/Tie-File/t/18_rs_fixrec
PASS: cpan/Tie-File/t/19_cache
PASS: cpan/Tie-File/t/20_cache_full
SKIP: cpan/Tie-File/t/21_win32
PASS: cpan/Tie-File/t/22_autochomp
PASS: cpan/Tie-File/t/23_rv_ac_splice
PASS: cpan/Tie-File/t/24_cache_loop
PASS: cpan/Tie-File/t/25_gen_nocache
PASS: cpan/Tie-File/t/26_twrite
PASS: cpan/Tie-File/t/27_iwrite
PASS: cpan/Tie-File/t/28_mtwrite
PASS: cpan/Tie-File/t/29a_upcopy
PASS: cpan/Tie-File/t/29_downcopy
PASS: cpan/Tie-File/t/30_defer
PASS: cpan/Tie-File/t/31_autodefer
PASS: cpan/Tie-File/t/32_defer_misc
PASS: cpan/Tie-File/t/33_defer_vs
PASS: cpan/Tie-File/t/40_abs_cache
PASS: cpan/Tie-File/t/41_heap
PASS: cpan/Tie-File/t/42_offset
PASS: cpan/Tie-RefHash/t/rebless
PASS: cpan/Tie-RefHash/t/refhash
PASS: cpan/Tie-RefHash/t/storable
PASS: cpan/Tie-RefHash/t/threaded
PASS: cpan/Time-HiRes/t/HiRes
PASS: cpan/Time-Local/t/Local
PASS: cpan/Time-Piece/t/01base
PASS: cpan/Time-Piece/t/02core
PASS: cpan/Time-Piece/t/03compare
PASS: cpan/Time-Piece/t/04mjd
PASS: cpan/Time-Piece/t/05overload
PASS: cpan/Time-Piece/t/06subclass
PASS: cpan/Time-Piece/t/07arith
PASS: cpan/Unicode-Collate/t/altern
PASS: cpan/Unicode-Collate/t/backwds
PASS: cpan/Unicode-Collate/t/cjk_b5
PASS: cpan/Unicode-Collate/t/cjk_gb
PASS: cpan/Unicode-Collate/t/cjk_ja
PASS: cpan/Unicode-Collate/t/cjk_ko
PASS: cpan/Unicode-Collate/t/cjk_py
PASS: cpan/Unicode-Collate/t/cjkrange
PASS: cpan/Unicode-Collate/t/cjk_st
PASS: cpan/Unicode-Collate/t/compatui
PASS: cpan/Unicode-Collate/t/contract
PASS: cpan/Unicode-Collate/t/default
PASS: cpan/Unicode-Collate/t/hangtype
PASS: cpan/Unicode-Collate/t/hangul
PASS: cpan/Unicode-Collate/t/ignor
PASS: cpan/Unicode-Collate/t/illegalp
PASS: cpan/Unicode-Collate/t/illegal
PASS: cpan/Unicode-Collate/t/index
PASS: cpan/Unicode-Collate/t/loc_af
PASS: cpan/Unicode-Collate/t/loc_ar
PASS: cpan/Unicode-Collate/t/loc_az
PASS: cpan/Unicode-Collate/t/loc_be
PASS: cpan/Unicode-Collate/t/loc_bg
PASS: cpan/Unicode-Collate/t/loc_ca
PASS: cpan/Unicode-Collate/t/loc_cs
PASS: cpan/Unicode-Collate/t/loc_cyrl
PASS: cpan/Unicode-Collate/t/loc_cy
PASS: cpan/Unicode-Collate/t/loc_da
PASS: cpan/Unicode-Collate/t/loc_deph
PASS: cpan/Unicode-Collate/t/loc_de
PASS: cpan/Unicode-Collate/t/loc_eo
PASS: cpan/Unicode-Collate/t/loc_es
PASS: cpan/Unicode-Collate/t/loc_estr
PASS: cpan/Unicode-Collate/t/loc_et
PASS: cpan/Unicode-Collate/t/loc_fil
PASS: cpan/Unicode-Collate/t/loc_fi
PASS: cpan/Unicode-Collate/t/loc_fo
PASS: cpan/Unicode-Collate/t/loc_fr
PASS: cpan/Unicode-Collate/t/loc_ha
PASS: cpan/Unicode-Collate/t/loc_haw
PASS: cpan/Unicode-Collate/t/loc_hr
PASS: cpan/Unicode-Collate/t/loc_hu
PASS: cpan/Unicode-Collate/t/loc_hy
PASS: cpan/Unicode-Collate/t/loc_ig
PASS: cpan/Unicode-Collate/t/loc_is
PASS: cpan/Unicode-Collate/t/loc_jait
PASS: cpan/Unicode-Collate/t/loc_japr
PASS: cpan/Unicode-Collate/t/loc_ja
PASS: cpan/Unicode-Collate/t/loc_kk
PASS: cpan/Unicode-Collate/t/loc_kl
PASS: cpan/Unicode-Collate/t/loc_ko
PASS: cpan/Unicode-Collate/t/loc_lt
PASS: cpan/Unicode-Collate/t/loc_lv
PASS: cpan/Unicode-Collate/t/loc_mk
PASS: cpan/Unicode-Collate/t/loc_mt
PASS: cpan/Unicode-Collate/t/loc_nb
PASS: cpan/Unicode-Collate/t/loc_nn
PASS: cpan/Unicode-Collate/t/loc_nso
PASS: cpan/Unicode-Collate/t/loc_om
PASS: cpan/Unicode-Collate/t/loc_pl
PASS: cpan/Unicode-Collate/t/loc_ro
PASS: cpan/Unicode-Collate/t/loc_ru
PASS: cpan/Unicode-Collate/t/loc_se
PASS: cpan/Unicode-Collate/t/loc_sk
PASS: cpan/Unicode-Collate/t/loc_sl
PASS: cpan/Unicode-Collate/t/loc_sq
PASS: cpan/Unicode-Collate/t/loc_sr
PASS: cpan/Unicode-Collate/t/loc_sv
PASS: cpan/Unicode-Collate/t/loc_sw
PASS: cpan/Unicode-Collate/t/loc_test
PASS: cpan/Unicode-Collate/t/loc_tn
PASS: cpan/Unicode-Collate/t/loc_to
PASS: cpan/Unicode-Collate/t/loc_tr
PASS: cpan/Unicode-Collate/t/loc_uk
PASS: cpan/Unicode-Collate/t/loc_vi
PASS: cpan/Unicode-Collate/t/loc_wo
PASS: cpan/Unicode-Collate/t/loc_yo
PASS: cpan/Unicode-Collate/t/loc_zhb5
PASS: cpan/Unicode-Collate/t/loc_zhgb
PASS: cpan/Unicode-Collate/t/loc_zhpy
PASS: cpan/Unicode-Collate/t/loc_zhst
PASS: cpan/Unicode-Collate/t/loc_zh
PASS: cpan/Unicode-Collate/t/nonchar
PASS: cpan/Unicode-Collate/t/normal
PASS: cpan/Unicode-Collate/t/overcjk0
PASS: cpan/Unicode-Collate/t/overcjk1
PASS: cpan/Unicode-Collate/t/override
PASS: cpan/Unicode-Collate/t/rearrang
PASS: cpan/Unicode-Collate/t/test
PASS: cpan/Unicode-Collate/t/trailwt
PASS: cpan/Unicode-Collate/t/variable
PASS: cpan/Unicode-Collate/t/version
PASS: cpan/Unicode-Collate/t/view
PASS: cpan/Unicode-Normalize/t/fcdc
PASS: cpan/Unicode-Normalize/t/form
PASS: cpan/Unicode-Normalize/t/func
PASS: cpan/Unicode-Normalize/t/illegal
PASS: cpan/Unicode-Normalize/t/norm
PASS: cpan/Unicode-Normalize/t/null
PASS: cpan/Unicode-Normalize/t/partial1
PASS: cpan/Unicode-Normalize/t/partial2
PASS: cpan/Unicode-Normalize/t/proto
PASS: cpan/Unicode-Normalize/t/split
PASS: cpan/Unicode-Normalize/t/test
PASS: cpan/Unicode-Normalize/t/tie
PASS: cpan/Version-Requirements/t/accepts
PASS: cpan/Version-Requirements/t/basic
PASS: cpan/Version-Requirements/t/finalize
PASS: cpan/Version-Requirements/t/from-hash
PASS: cpan/Version-Requirements/t/merge
PASS: dist/Attribute-Handlers/t/constants
PASS: dist/Attribute-Handlers/t/data_convert
PASS: dist/Attribute-Handlers/t/linerep
PASS: dist/Attribute-Handlers/t/multi
PASS: dist/autouse/t/autouse
PASS: dist/base/t/base
PASS: dist/base/t/compile-time
SKIP: dist/base/t/fields-5_6_0
SKIP: dist/base/t/fields-5_8_0
PASS: dist/base/t/fields-base
PASS: dist/base/t/fields
PASS: dist/base/t/isa
PASS: dist/base/t/sigdie
PASS: dist/base/t/version
PASS: dist/base/t/warnings
PASS: dist/B-Deparse/t/deparse
PASS: dist/bignum/t/big_e_pi
PASS: dist/bignum/t/bigexp
PASS: dist/bignum/t/bigint
PASS: dist/bignum/t/bignum
PASS: dist/bignum/t/bigrat
PASS: dist/bignum/t/bii_e_pi
PASS: dist/bignum/t/biinfnan
PASS: dist/bignum/t/bir_e_pi
PASS: dist/bignum/t/bninfnan
SKIP: dist/bignum/t/bn_lite
PASS: dist/bignum/t/brinfnan
SKIP: dist/bignum/t/br_lite
PASS: dist/bignum/t/in_effect
PASS: dist/bignum/t/option_a
PASS: dist/bignum/t/option_l
PASS: dist/bignum/t/option_p
PASS: dist/bignum/t/ratopt_a
PASS: dist/bignum/t/scope_f
PASS: dist/bignum/t/scope_i
PASS: dist/bignum/t/scope_r
PASS: dist/B-Lint/t/lint
PASS: dist/constant/t/constant
PASS: dist/constant/t/utf8
PASS: dist/Cwd/t/crossplatform
PASS: dist/Cwd/t/cwd
PASS: dist/Cwd/t/Functions
PASS: dist/Cwd/t/rel2abs2rel
PASS: dist/Cwd/t/Spec
PASS: dist/Cwd/t/taint
PASS: dist/Cwd/t/tmpdir
SKIP: dist/Cwd/t/win32
PASS: dist/Data-Dumper/t/bless
PASS: dist/Data-Dumper/t/bugs
PASS: dist/Data-Dumper/t/dumper
PASS: dist/Data-Dumper/t/freezer
PASS: dist/Data-Dumper/t/overload
PASS: dist/Data-Dumper/t/pair
PASS: dist/Data-Dumper/t/perl-74170
PASS: dist/Data-Dumper/t/terse
PASS: dist/Devel-SelfStubber/t/Devel-SelfStubber
PASS: dist/Dumpvalue/t/Dumpvalue
PASS: dist/Env/t/array
PASS: dist/Env/t/env
PERL_CORE is set but I can't find your perl source!
PERL_CORE is set but I can't find your perl source!
PERL_CORE is set but I can't find your perl source!
PERL_CORE is set but I can't find your perl source!
PASS: dist/ExtUtils-CBuilder/t/00-have-compiler
PERL_CORE is set but I can't find your perl source!
SKIP: dist/ExtUtils-CBuilder/t/01-basic
PERL_CORE is set but I can't find your perl source!
SKIP: dist/ExtUtils-CBuilder/t/02-link
PERL_CORE is set but I can't find your perl source!
SKIP: dist/ExtUtils-CBuilder/t/03-cplusplus
PERL_CORE is set but I can't find your perl source!
#   Failed test 'perl_inc() returned directory'
#   at t/04-base.t line 152.
FAIL: dist/ExtUtils-CBuilder/t/04-base
FAILED at test 24
PASS: dist/ExtUtils-Command/t/cp
PASS: dist/ExtUtils-Command/t/eu_command
PASS: dist/ExtUtils-Install/t/can_write_dir
PASS: dist/ExtUtils-Install/t/Installapi2
PASS: dist/ExtUtils-Install/t/Installed
PASS: dist/ExtUtils-Install/t/Install
#   Failed test 'make ran ok'
#   at t/InstallWithMM.t line 60.
#          got: '512'
#     expected: '0'
# make: *** No rule to make target `/usr/lib/perl/5.14.3/CORE/config.h', ne=
eded by `Makefile'.  Stop.
FAIL: dist/ExtUtils-Install/t/InstallWithMM
FAILED at test 4
PASS: dist/ExtUtils-Install/t/Packlist
PASS: dist/ExtUtils-Manifest/t/Manifest
PERL_CORE is set but I can't find your perl source!
 at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/B=
ase.pm line 366
	ExtUtils::CBuilder::Base::perl_src('ExtUtils::CBuilder=3DHASH(0x819d8b8)')=
 called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBu=
ilder/Base.pm line 374
	ExtUtils::CBuilder::Base::perl_inc('ExtUtils::CBuilder=3DHASH(0x819d8b8)')=
 called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBu=
ilder/Base.pm line 154
	ExtUtils::CBuilder::Base::compile('ExtUtils::CBuilder=3DHASH(0x819d8b8)', =
'C++', undef, 'source', 'compilet-i2Ksy.c') called at /usr/lib/perl/ptest/d=
ist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Base.pm line 209
	eval {...} called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/E=
xtUtils/CBuilder/Base.pm line 206
	ExtUtils::CBuilder::Base::have_compiler('ExtUtils::CBuilder=3DHASH(0x819d8=
b8)') called at t/basic.t line 36
PASS: dist/ExtUtils-ParseXS/t/basic
PERL_CORE is set but I can't find your perl source!
 at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/B=
ase.pm line 366
	ExtUtils::CBuilder::Base::perl_src('ExtUtils::CBuilder=3DHASH(0x847bdc8)')=
 called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBu=
ilder/Base.pm line 374
	ExtUtils::CBuilder::Base::perl_inc('ExtUtils::CBuilder=3DHASH(0x847bdc8)')=
 called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBu=
ilder/Base.pm line 154
	ExtUtils::CBuilder::Base::compile('ExtUtils::CBuilder=3DHASH(0x847bdc8)', =
'C++', undef, 'source', 'compilet-OJc9w.c') called at /usr/lib/perl/ptest/d=
ist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Base.pm line 209
	eval {...} called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/E=
xtUtils/CBuilder/Base.pm line 206
	ExtUtils::CBuilder::Base::have_compiler('ExtUtils::CBuilder=3DHASH(0x847bd=
c8)') called at t/more.t line 36
PASS: dist/ExtUtils-ParseXS/t/more
PERL_CORE is set but I can't find your perl source!
 at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/B=
ase.pm line 366
	ExtUtils::CBuilder::Base::perl_src('ExtUtils::CBuilder=3DHASH(0x8456e60)')=
 called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBu=
ilder/Base.pm line 374
	ExtUtils::CBuilder::Base::perl_inc('ExtUtils::CBuilder=3DHASH(0x8456e60)')=
 called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBu=
ilder/Base.pm line 154
	ExtUtils::CBuilder::Base::compile('ExtUtils::CBuilder=3DHASH(0x8456e60)', =
'C++', undef, 'source', 'compilet-iaDun.c') called at /usr/lib/perl/ptest/d=
ist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Base.pm line 209
	eval {...} called at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/E=
xtUtils/CBuilder/Base.pm line 206
	ExtUtils::CBuilder::Base::have_compiler('ExtUtils::CBuilder=3DHASH(0x8456e=
60)') called at t/usage.t line 39
PASS: dist/ExtUtils-ParseXS/t/usage
# lib is not a directory.
# lib/File/CheckTree.pm is not a plain file.
# /usr/lib/perl/ptest/dist/File-CheckTree/lib/File/CheckTree.pm does not ex=
ist.
#   Failed test at t/CheckTree.t line 42.
#          got: '3'
#     expected: '0'
FAIL: dist/File-CheckTree/t/CheckTree
FAILED at test 2
PASS: dist/Filter-Simple/t/data
PASS: dist/Filter-Simple/t/export
PASS: dist/Filter-Simple/t/filter_only
PASS: dist/Filter-Simple/t/filter
PASS: dist/Filter-Simple/t/import
PASS: dist/I18N-Collate/t/I18N-Collate
PASS: dist/I18N-LangTags/t/01_about_verbose
PASS: dist/I18N-LangTags/t/05_main
PASS: dist/I18N-LangTags/t/07_listy
PASS: dist/I18N-LangTags/t/10_http
PASS: dist/I18N-LangTags/t/20_locales
PASS: dist/I18N-LangTags/t/50_super
PASS: dist/I18N-LangTags/t/55_supers_strict
PASS: dist/I18N-LangTags/t/80_all_env
PASS: dist/if/t/if
PASS: dist/IO/t/io_const
PASS: dist/IO/t/io_dir
PASS: dist/IO/t/io_dup
PASS: dist/IO/t/io_file_export
PASS: dist/IO/t/io_file
PASS: dist/IO/t/io_linenum
PASS: dist/IO/t/io_multihomed
PASS: dist/IO/t/io_pipe
PASS: dist/IO/t/io_poll
PASS: dist/IO/t/io_sel
PASS: dist/IO/t/io_sock
PASS: dist/IO/t/IO
PASS: dist/IO/t/io_taint
Can't open Makefile.PL at t/io_tell.t line 20.
FAIL: dist/IO/t/io_tell
FAILED--expected 13 tests, saw 0
PASS: dist/IO/t/io_udp
PASS: dist/IO/t/io_unix
PASS: dist/IO/t/io_utf8
PASS: dist/IO/t/io_xs
PASS: dist/lib/t/01lib
PASS: dist/Locale-Maketext/t/01_about_verbose
PASS: dist/Locale-Maketext/t/04_use_external_lex_cache
PASS: dist/Locale-Maketext/t/09_compile
PASS: dist/Locale-Maketext/t/10_make
PASS: dist/Locale-Maketext/t/20_get
PASS: dist/Locale-Maketext/t/30_eval_dollar_at
PASS: dist/Locale-Maketext/t/40_super
PASS: dist/Locale-Maketext/t/50_super
PASS: dist/Locale-Maketext/t/60_super
PASS: dist/Locale-Maketext/t/70_fail_auto
PASS: dist/Locale-Maketext/t/90_utf8
PASS: dist/Math-BigInt-FastCalc/t/bigintfc
PASS: dist/Math-BigInt-FastCalc/t/bootstrap
PASS: dist/Math-BigInt-FastCalc/t/leak
PASS: dist/Math-BigInt-FastCalc/t/mbi_rand
PASS: dist/Math-BigInt/t/bare_mbf
PASS: dist/Math-BigInt/t/bare_mbi
PASS: dist/Math-BigInt/t/bare_mif
PASS: dist/Math-BigInt/t/bigfltpm
PASS: dist/Math-BigInt/t/bigintc
PASS: dist/Math-BigInt/t/bigintpm
PASS: dist/Math-BigInt/t/bigints
PASS: dist/Math-BigInt/t/biglog
PASS: dist/Math-BigInt/t/big_pi_e
PASS: dist/Math-BigInt/t/bigroot
PASS: dist/Math-BigInt/t/calling
PASS: dist/Math-BigInt/t/config
PASS: dist/Math-BigInt/t/constant
PASS: dist/Math-BigInt/t/const_mbf
PASS: dist/Math-BigInt/t/downgrade
PASS: dist/Math-BigInt/t/_e_math
PASS: dist/Math-BigInt/t/inf_nan
PASS: dist/Math-BigInt/t/isa
PASS: dist/Math-BigInt/t/lib_load
PASS: dist/Math-BigInt/t/mbf_ali
PASS: dist/Math-BigInt/t/mbi_ali
PASS: dist/Math-BigInt/t/mbimbf
PASS: dist/Math-BigInt/t/mbi_rand
PASS: dist/Math-BigInt/t/nan_cmp
PASS: dist/Math-BigInt/t/new_overloaded
PASS: dist/Math-BigInt/t/req_mbf0
PASS: dist/Math-BigInt/t/req_mbf1
PASS: dist/Math-BigInt/t/req_mbfa
PASS: dist/Math-BigInt/t/req_mbfi
PASS: dist/Math-BigInt/t/req_mbfn
PASS: dist/Math-BigInt/t/req_mbfw
PASS: dist/Math-BigInt/t/require
PASS: dist/Math-BigInt/t/round
PASS: dist/Math-BigInt/t/sub_ali
PASS: dist/Math-BigInt/t/sub_mbf
PASS: dist/Math-BigInt/t/sub_mbi
PASS: dist/Math-BigInt/t/sub_mif
PASS: dist/Math-BigInt/t/trap
PASS: dist/Math-BigInt/t/upgrade2
PASS: dist/Math-BigInt/t/upgradef
PASS: dist/Math-BigInt/t/upgrade
PASS: dist/Math-BigInt/t/use_lib1
PASS: dist/Math-BigInt/t/use_lib2
PASS: dist/Math-BigInt/t/use_lib3
PASS: dist/Math-BigInt/t/use_lib4
PASS: dist/Math-BigInt/t/use_mbfw
PASS: dist/Math-BigInt/t/use
PASS: dist/Math-BigInt/t/with_sub
PASS: dist/Math-BigRat/t/big_ap
PASS: dist/Math-BigRat/t/bigfltrt
PASS: dist/Math-BigRat/t/biglog
PASS: dist/Math-BigRat/t/bigratpm
PASS: dist/Math-BigRat/t/bigrat
PASS: dist/Math-BigRat/t/bigratup
PASS: dist/Math-BigRat/t/bigroot
PASS: dist/Math-BigRat/t/bitwise
PASS: dist/Math-BigRat/t/hang
PASS: dist/Math-BigRat/t/requirer
PASS: dist/Math-BigRat/t/trap
PASS: dist/Module-CoreList/t/corelist
PASS: dist/Module-CoreList/t/deprecated
PASS: dist/Module-CoreList/t/find_modules
SKIP: dist/Module-CoreList/t/pod
PASS: dist/Net-Ping/t/100_load
PASS: dist/Net-Ping/t/110_icmp_inst
PASS: dist/Net-Ping/t/120_udp_inst
PASS: dist/Net-Ping/t/130_tcp_inst
PASS: dist/Net-Ping/t/140_stream_inst
PASS: dist/Net-Ping/t/150_syn_inst
SKIP: dist/Net-Ping/t/190_alarm
SKIP: dist/Net-Ping/t/200_ping_tcp
SKIP: dist/Net-Ping/t/250_ping_hires
SKIP: dist/Net-Ping/t/300_ping_stream
SKIP: dist/Net-Ping/t/400_ping_syn
SKIP: dist/Net-Ping/t/410_syn_host
PASS: dist/Net-Ping/t/450_service
PASS: dist/Net-Ping/t/500_ping_icmp
PASS: dist/Net-Ping/t/510_ping_udp
PASS: dist/Pod-Perldoc/t/01_about_verbose
PASS: dist/Pod-Perldoc/t/checkerbasic
PASS: dist/Pod-Perldoc/t/perldocbasic
PASS: dist/Pod-Perldoc/t/textbasic
PASS: dist/Safe/t/safe1
PASS: dist/Safe/t/safe2
PASS: dist/Safe/t/safe3
PASS: dist/Safe/t/safeload
Can't open opcodes: No such file or directory at t/safeops.t line 31, <DATA=
> line 360.
FAIL: dist/Safe/t/safeops
FAILED--no leader found
PASS: dist/Safe/t/safesort
PASS: dist/Safe/t/safeuniversal
PASS: dist/Safe/t/safeutf8
PASS: dist/Safe/t/safewrap
PASS: dist/SelfLoader/t/01SelfLoader
PASS: dist/SelfLoader/t/02SelfLoader-buggy
PASS: dist/SelfLoader/t/03taint
PASS: dist/Storable/t/attach_errors
PASS: dist/Storable/t/attach_singleton
PASS: dist/Storable/t/blessed
PASS: dist/Storable/t/canonical
PASS: dist/Storable/t/circular_hook
PASS: dist/Storable/t/code
PASS: dist/Storable/t/compat01
PASS: dist/Storable/t/compat06
PASS: dist/Storable/t/croak
PASS: dist/Storable/t/dclone
PASS: dist/Storable/t/downgrade
PASS: dist/Storable/t/file_magic
PASS: dist/Storable/t/forgive
PASS: dist/Storable/t/freeze
PASS: dist/Storable/t/integer
SKIP: dist/Storable/t/interwork56
PASS: dist/Storable/t/just_plain_nasty
PASS: dist/Storable/t/lock
PASS: dist/Storable/t/malice
PASS: dist/Storable/t/overload
PASS: dist/Storable/t/recurse
PASS: dist/Storable/t/restrict
PASS: dist/Storable/t/retrieve
PASS: dist/Storable/t/sig_die
PASS: dist/Storable/t/store
PASS: dist/Storable/t/threads
PASS: dist/Storable/t/tied_hook
PASS: dist/Storable/t/tied_items
PASS: dist/Storable/t/tied
PASS: dist/Storable/t/utf8hash
PASS: dist/Storable/t/utf8
PASS: dist/Storable/t/weak
PASS: dist/Thread-Queue/t/01_basic
PASS: dist/Thread-Queue/t/02_refs
PASS: dist/Thread-Queue/t/03_peek
PASS: dist/Thread-Queue/t/04_errs
PASS: dist/Thread-Queue/t/05_extract
PASS: dist/Thread-Queue/t/06_insert
PASS: dist/Thread-Queue/t/07_lock
PASS: dist/Thread-Queue/t/08_nothreads
PASS: dist/Thread-Semaphore/t/01_basic
PASS: dist/Thread-Semaphore/t/02_errs
PASS: dist/Thread-Semaphore/t/03_nothreads
PASS: dist/Thread-Semaphore/t/04_nonblocking
PASS: dist/Thread-Semaphore/t/05_force
PASS: dist/threads-shared/t/0nothread
PASS: dist/threads-shared/t/av_refs
PASS: dist/threads-shared/t/av_simple
PASS: dist/threads-shared/t/blessed
PASS: dist/threads-shared/t/clone
PASS: dist/threads-shared/t/cond
PASS: dist/threads-shared/t/disabled
PASS: dist/threads-shared/t/hv_refs
PASS: dist/threads-shared/t/hv_simple
PASS: dist/threads-shared/t/no_share
PASS: dist/threads-shared/t/object
PASS: dist/threads-shared/t/shared_attr
PASS: dist/threads-shared/t/stress
PASS: dist/threads-shared/t/sv_refs
PASS: dist/threads-shared/t/sv_simple
PASS: dist/threads-shared/t/utf8
PASS: dist/threads-shared/t/waithires
PASS: dist/threads-shared/t/wait
PASS: dist/threads/t/basic
PASS: dist/threads/t/blocks
PASS: dist/threads/t/context
PASS: dist/threads/t/end
PASS: dist/threads/t/err
PASS: dist/threads/t/exit
PASS: dist/threads/t/free2
PASS: dist/threads/t/free
PASS: dist/threads/t/join
PASS: dist/threads/t/kill2
PASS: dist/threads/t/kill
PASS: dist/threads/t/libc
PASS: dist/threads/t/list
SKIP: dist/threads/t/no_threads
PASS: dist/threads/t/problems
PASS: dist/threads/t/stack_env
PASS: dist/threads/t/stack
PASS: dist/threads/t/state
PASS: dist/threads/t/stress_cv
PASS: dist/threads/t/stress_re
PASS: dist/threads/t/stress_string
PASS: dist/threads/t/thread
PASS: dist/XSLoader/t/XSLoader
PASS: ext/B/t/b
PASS: ext/B/t/concise
PASS: ext/B/t/concise-xs
PASS: ext/B/t/f_map
PASS: ext/B/t/f_sort
PASS: ext/B/t/optree_check
PASS: ext/B/t/optree_concise
PASS: ext/B/t/optree_constants
PASS: ext/B/t/optree_misc
PASS: ext/B/t/optree_samples
PASS: ext/B/t/optree_sort
PASS: ext/B/t/optree_specials
PASS: ext/B/t/optree_varinit
PASS: ext/B/t/o
PASS: ext/B/t/pragma
PASS: ext/B/t/showlex
PASS: ext/B/t/terse
PASS: ext/B/t/walkoptree
PASS: ext/B/t/xref
PASS: ext/Devel-Peek/t/Peek
#   Failed test 'array should contain one result result or more: libc =3D> =
()'
#   at t/DynaLoader.t line 115.
#     '0'
#         >=3D
#     '1'
FAIL: ext/DynaLoader/t/DynaLoader
FAILED at test 20
PASS: ext/Errno/t/Errno
PASS: ext/Fcntl/t/autoload
PASS: ext/Fcntl/t/fcntl
PASS: ext/Fcntl/t/mode
#   Failed test 'can't find perl: expected ../../perl'
#   at t/syslfs.t line 116.
FAIL: ext/Fcntl/t/syslfs
FAILED at test 1
PASS: ext/FileCache/t/01open
PASS: ext/FileCache/t/02maxopen
PASS: ext/FileCache/t/03append
PASS: ext/FileCache/t/04twoarg
PASS: ext/FileCache/t/05override
PASS: ext/FileCache/t/06export
PASS: ext/FileCache/t/07noimport
PASS: ext/File-Glob/t/basic
PASS: ext/File-Glob/t/case
PASS: ext/File-Glob/t/global
PASS: ext/File-Glob/t/taint
PASS: ext/GDBM_File/t/gdbm
PASS: ext/Hash-Util-FieldHash/t/01_load
PASS: ext/Hash-Util-FieldHash/t/02_function
PASS: ext/Hash-Util-FieldHash/t/03_class
PASS: ext/Hash-Util-FieldHash/t/04_thread
PASS: ext/Hash-Util-FieldHash/t/05_perlhook
PASS: ext/Hash-Util-FieldHash/t/10_hash
PASS: ext/Hash-Util-FieldHash/t/11_hashassign
PASS: ext/Hash-Util-FieldHash/t/12_hashwarn
PASS: ext/Hash-Util/t/Util
PASS: ext/I18N-Langinfo/t/Langinfo
PASS: ext/IPC-Open2/t/IPC-Open2
# Failed at t/fd.t line 33
#      got "No such file or directory at -e line 1.\n"
# expected ""
FAIL: ext/IPC-Open3/t/fd
FAILED at test 2
PASS: ext/IPC-Open3/t/IPC-Open3
PASS: ext/Opcode/t/Opcode
PASS: ext/Opcode/t/ops
PASS: ext/PerlIO-encoding/t/encoding
PASS: ext/PerlIO-encoding/t/fallback
PASS: ext/PerlIO-encoding/t/nolooping
PASS: ext/PerlIO-scalar/t/scalar
PASS: ext/PerlIO-scalar/t/scalar_ungetc
PASS: ext/PerlIO-via/t/via
PASS: ext/Pod-Html/t/htmlescp
PASS: ext/Pod-Html/t/htmllink
PASS: ext/Pod-Html/t/htmlview
PASS: ext/POSIX/t/is
PASS: ext/POSIX/t/math
#   Failed test 'O_RDONLY with open'
#   at t/posix.t line 55.
FAIL: ext/POSIX/t/posix
FAILED at test 1
PASS: ext/POSIX/t/sigaction
PASS: ext/POSIX/t/sysconf
Use of uninitialized value $testfd in numeric gt (>) at t/taint.t line 40.
#   Failed test '    read'
#   at t/taint.t line 41.
#          got: undef
#     expected: '#d'
FAIL: ext/POSIX/t/taint
FAILED at test 4
PASS: ext/POSIX/t/termios
PASS: ext/POSIX/t/time
PASS: ext/POSIX/t/waitpid
PASS: ext/re/t/lexical_debug
PASS: ext/re/t/qr
PASS: ext/re/t/reflags
PASS: ext/re/t/re_funcs
PASS: ext/re/t/re_funcs_u
PASS: ext/re/t/regop
PASS: ext/re/t/re
PASS: ext/SDBM_File/t/sdbm
PASS: ext/Socket/t/getaddrinfo
PASS: ext/Socket/t/getnameinfo
PASS: ext/Socket/t/socketpair
PASS: ext/Socket/t/Socket
PASS: ext/Sys-Hostname/t/Hostname
PASS: ext/Tie-Hash-NamedCapture/t/tiehash
#   Failed test at t/Tie-Memoize.t line 35.
Use of uninitialized value in string eq at t/Tie-Memoize.t line 36.
Use of uninitialized value $c in string eq at t/Tie-Memoize.t line 36.
FAIL: ext/Tie-Memoize/t/Tie-Memoize
FAILED at test 11
PASS: ext/XS-APItest/t/arrayexpr
PASS: ext/XS-APItest/t/blockasexpr
PASS: ext/XS-APItest/t/blockhooks-csc
PASS: ext/XS-APItest/t/blockhooks
PASS: ext/XS-APItest/t/call_checker
PASS: ext/XS-APItest/t/caller
PASS: ext/XS-APItest/t/call
PASS: ext/XS-APItest/t/cleanup
PASS: ext/XS-APItest/t/cophh
PASS: ext/XS-APItest/t/copyhints
PASS: ext/XS-APItest/t/customop
PASS: ext/XS-APItest/t/eval-filter
PASS: ext/XS-APItest/t/exception
PASS: ext/XS-APItest/t/grok
PASS: ext/XS-APItest/t/hash
PASS: ext/XS-APItest/t/keyword_multiline
PASS: ext/XS-APItest/t/keyword_plugin
PASS: ext/XS-APItest/t/labelconst
PASS: ext/XS-APItest/t/loopblock
PASS: ext/XS-APItest/t/looprest
PASS: ext/XS-APItest/t/magic_chain
PASS: ext/XS-APItest/t/magic
PASS: ext/XS-APItest/t/multicall
PASS: ext/XS-APItest/t/my_cxt
PASS: ext/XS-APItest/t/my_exit
PASS: ext/XS-APItest/t/op_contextualize
PASS: ext/XS-APItest/t/op_list
PASS: ext/XS-APItest/t/op
PASS: ext/XS-APItest/t/overload
PASS: ext/XS-APItest/t/peep
PASS: ext/XS-APItest/t/pmflag
PASS: ext/XS-APItest/t/postinc
PASS: ext/XS-APItest/t/printf
PASS: ext/XS-APItest/t/ptr_table
PASS: ext/XS-APItest/t/push
PASS: ext/XS-APItest/t/refs
PASS: ext/XS-APItest/t/rmagical
PASS: ext/XS-APItest/t/rv2cv_op_cv
PASS: ext/XS-APItest/t/savehints
PASS: ext/XS-APItest/t/scopelessblock
PASS: ext/XS-APItest/t/stmtasexpr
PASS: ext/XS-APItest/t/stmtsasexpr
PASS: ext/XS-APItest/t/stuff_modify_bug
PASS: ext/XS-APItest/t/stuff_svcur_bug
PASS: ext/XS-APItest/t/svpeek
PASS: ext/XS-APItest/t/svpv_magic
PASS: ext/XS-APItest/t/svsetsv
PASS: ext/XS-APItest/t/swaplabel
PASS: ext/XS-APItest/t/swaptwostmts
PASS: ext/XS-APItest/t/temp_lv_sub
PASS: ext/XS-APItest/t/utf16_to_utf8
PASS: ext/XS-APItest/t/utf8
PASS: ext/XS-APItest/t/xs_special_subs_require
PASS: ext/XS-APItest/t/xs_special_subs
PASS: ext/XS-APItest/t/xsub_h
PASS: ext/XS-Typemap/t/Typemap
PASS: lib/AnyDBM_File
PASS: lib/Benchmark
PASS: lib/bigfloatpl
PASS: lib/bigintpl
PASS: lib/blib
PASS: lib/bytes
PASS: lib/Carp
Can't open ../../lib/unicore/UnicodeData.txt: No such file or directory at =
../lib/charnames.t line 911.
FAIL: lib/charnames
FAILED--non-zero wait status: 512
PASS: lib/Class/Struct
#   Failed test '\ was built'
#   at ../lib/Config/Extensions.t line 26.
#                   'B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper=
 Devel/DProf Devel/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl Fil=
e/Glob Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/=
SysV List/Util MIME/Base64 Math/BigInt/FastCalc Opcode POSIX PerlIO/encodin=
g PerlIO/scalar PerlIO/via GDBM_File SDBM_File Socket Storable Sys/Hostname=
 Sys/Syslog Text/Soundex Time/HiRes Time/Piece Unicode/Normalize XS/APItest=
 XS/APItest/KeywordRPN XS/Typemap attributes mro re threads threads/shared =
Archive/Extract Archive/Tar Attribute/Handlers AutoLoader B/Debug B/Deparse=
 B/Lint CGI CPAN CPANPLUS CPANPLUS/Dist/Build Class/ISA Devel/SelfStubber D=
igest Errno ExtUtils/CBuilder ExtUtils/Command ExtUtils/Constant ExtUtils/I=
nstall ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/ParseXS File/Fetch Fil=
e/Path File/Temp FileCache Filter/Simple Getopt/Long I18N/LangTags IO/Compr=
ess IO/Zlib IPC/Cmd IPC/Open2 IPC/Open3 Locale/Codes Locale/Maketext Locale=
/Maketext/Simple Log/Message Log/Message/Simple Math/BigInt Math/BigRat Mat=
h/Complex Memoize Module/Build Module/CoreList Module/Load Module/Load/Cond=
itional Module/Loaded Module/Pluggable NEXT Net/Ping Object/Accessor Packag=
e/Constants Params/Check Parse/CPAN/Meta PerlIO/via/QuotedPrint Pod/Escapes=
 Pod/LaTeX Pod/Parser Pod/Perldoc Pod/Plainer Pod/Simple Safe SelfLoader Sh=
ell Switch Term/ANSIColor Term/Cap Term/UI Test Test/Harness Test/Simple Te=
xt/Balanced Text/ParseWords Text/Tabs Thread/Queue Thread/Semaphore Tie/Fil=
e Tie/Memoize Tie/RefHash Time/Local Unicode/Collate XSLoader autodie autou=
se base bignum constant encoding/warnings if lib libnet parent podlators'
#     doesn't match '(?^:\b\\\b)'
FAIL: lib/Config/Extensions
FAILED at test 43
PASS: lib/Config
PASS: lib/DBM_Filter/t/01error
PASS: lib/DBM_Filter/t/02core
Can't locate dbm_filter_util.pl in @INC (@INC contains: ../lib .) at ../lib=
/DBM_Filter/t/compress.t line 15.
# Looks like you planned 23 tests but ran 4.
# Looks like your test exited with 2 just after 4.
FAIL: lib/DBM_Filter/t/compress
FAILED--expected 23 tests, saw 4
Can't locate dbm_filter_util.pl in @INC (@INC contains: ../lib .) at ../lib=
/DBM_Filter/t/encode.t line 19.
# Looks like you planned 26 tests but ran 4.
# Looks like your test exited with 2 just after 4.
FAIL: lib/DBM_Filter/t/encode
FAILED--expected 26 tests, saw 4
Can't locate dbm_filter_util.pl in @INC (@INC contains: ../lib .) at ../lib=
/DBM_Filter/t/int32.t line 6.
# Looks like you planned 22 tests but ran 3.
# Looks like your test exited with 2 just after 3.
FAIL: lib/DBM_Filter/t/int32
FAILED--expected 22 tests, saw 3
Can't locate dbm_filter_util.pl in @INC (@INC contains: ../lib .) at ../lib=
/DBM_Filter/t/null.t line 6.
# Looks like you planned 26 tests but ran 3.
# Looks like your test exited with 2 just after 3.
FAIL: lib/DBM_Filter/t/null
FAILED--expected 26 tests, saw 3
Can't locate dbm_filter_util.pl in @INC (@INC contains: ../lib .) at ../lib=
/DBM_Filter/t/utf8.t line 17.
# Looks like you planned 20 tests but ran 4.
# Looks like your test exited with 2 just after 4.
FAIL: lib/DBM_Filter/t/utf8
FAILED--expected 20 tests, saw 4
PASS: lib/DB
Can't locate Test/More.pm in @INC (@INC contains: lib) at ../lib/diagnostic=
s.t line 8.
BEGIN failed--compilation aborted at ../lib/diagnostics.t line 8.
FAIL: lib/diagnostics
FAILED--no leader found
PASS: lib/DirHandle
PASS: lib/dumpvar
PASS: lib/English
PASS: lib/Exporter
FAIL: lib/ExtUtils/t/Embed
FAILED at test 1
PASS: lib/feature
PASS: lib/feature/unicode_strings
PASS: lib/File/Basename
PASS: lib/File/Compare
PASS: lib/File/Copy
PASS: lib/File/DosGlob
PASS: lib/File/Find/t/find
PASS: lib/File/Find/t/taint
PASS: lib/FileHandle
PASS: lib/File/stat
PASS: lib/filetest
FAIL: lib/FindBin
FAILED at test 1
PASS: lib/Getopt/Std
SKIP: lib/h2ph
SKIP: lib/h2xs
PASS: lib/integer
PASS: lib/Internals
PASS: lib/less
PASS: lib/locale
PASS: lib/Net/hostent
SKIP: lib/Net/netent
PASS: lib/Net/protoent
PASS: lib/Net/servent
PASS: lib/open
SKIP: lib/overload64
PASS: lib/overloading
PASS: lib/overload
Can't open perl script "../lib/perl5db/t/eval-line-bug": No such file or di=
rectory
No such file or directory at ../lib/perl5db.t line 71.
# Looks like you planned 9 tests but ran 0.
FAIL: lib/perl5db
FAILED--expected 9 tests, saw 0
PASS: lib/Pod/t/eol
PASS: lib/Pod/t/Functions
PASS: lib/Pod/t/InputObjects
PASS: lib/Pod/t/Select
PASS: lib/Pod/t/Usage
PASS: lib/Pod/t/utils
PASS: lib/Search/Dict
PASS: lib/SelectSaver
PASS: lib/sigtrap
PASS: lib/sort
PASS: lib/strict
PASS: lib/subs
PASS: lib/Symbol
PASS: lib/Term/Complete
PASS: lib/Term/ReadLine
PASS: lib/Text/Abbrev
PASS: lib/Thread
PASS: lib/Tie/Array/push
PASS: lib/Tie/Array/splice
PASS: lib/Tie/Array/stdpush
PASS: lib/Tie/Array/std
PASS: lib/Tie/ExtraHash
PASS: lib/Tie/Handle/stdhandle_from_handle
PASS: lib/Tie/Handle/stdhandle
PASS: lib/Tie/Hash
PASS: lib/Tie/Scalar
PASS: lib/Tie/SubstrHash
PASS: lib/Time/gmtime
PASS: lib/Time/localtime
PASS: lib/Unicode/UCD
PASS: lib/User/grent
PASS: lib/User/pwent
PASS: lib/utf8
PASS: lib/vars_carp
PASS: lib/vars
PASS: lib/version
PASS: lib/vmsish
PASS: lib/warnings
Can't open perl script "./psed": No such file or directory
# Failed at x2p/s2p.t line 852
#      got ""
# expected "1\nline 1\nline 2\nline 3\nline 4\nline 5\nline 6\nline 7\n8\nl=
ine 8\n"
Can't open perl script "../x2p/s2p": No such file or directory
# Failed at x2p/s2p.t line 864
#      got ""
# expected "1\nline 1\nline 2\nline 3\nline 4\nline 5\nline 6\nline 7\n8\nl=
ine 8\n"
FAIL: t/x2p/s2p
FAILED at test 1
Can't locate FindExt.pm in @INC (@INC contains: ../win32 ../lib) at porting=
/FindExt.t line 27.
BEGIN failed--compilation aborted at porting/FindExt.t line 27.
FAIL: t/porting/FindExt
FAILED--no leader found
Can't open ../proto.h: No such file or directory at porting/args_assert.t l=
ine 26.
FAIL: t/porting/args_assert
FAILED--non-zero wait status: 512
SKIP: t/porting/authors
PASS: t/porting/bincompat
Can't open perl script "pod/buildtoc": No such file or directory
FAIL: t/porting/buildtoc
FAILED--no leader found
PASS: t/porting/checkcase
Can't locate Maintainers.pm in @INC (@INC contains: lib Porting ../lib .) a=
t porting/cmp_version.t line 26.
BEGIN failed--compilation aborted at porting/cmp_version.t line 26.
FAIL: t/porting/cmp_version
FAILED--no leader found
Can't open embed.fnc: No such file or directory at porting/diag.t line 24.
FAIL: t/porting/diag
FAILED--non-zero wait status: 512
# Failed at porting/dual-life.t line 58
# Failed at porting/dual-life.t line 58
FAIL: t/porting/dual-life
FAILED at test 1
Can't open ../Porting/exec-bit.txt: No such file or directory at porting/ex=
ec-bit.t line 32.
# Failed at porting/exec-bit.t line 42
# Remove the exec bit or add '../cpan/Test-Harness/t/source_tests/source.sh=
' to Porting/exec-bit.txt
# Failed at porting/exec-bit.t line 42
# Remove the exec bit or add '../cpan/Test-Harness/t/source_tests/source_ar=
gs.sh' to Porting/exec-bit.txt
# Failed at porting/exec-bit.t line 42
# Remove the exec bit or add '../t/TEST' to Porting/exec-bit.txt
FAIL: t/porting/exec-bit
FAILED at test 1
PASS: t/porting/filenames
Can't locate Maintainers.pm in @INC (@INC contains: lib Porting) at porting=
/maintainers.t line 18.
BEGIN failed--compilation aborted at porting/maintainers.t line 18.
FAIL: t/porting/maintainers
FAILED--no leader found
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
# Failed at porting/manifest.t line 33
FAIL: t/porting/manifest
FAILED at test 2
Can't open NetWare/splittree.pl for reading: No such file or directory
 at porting/podcheck.t line 53
# Looks like you planned 631 tests but ran 0.
FAIL: t/porting/podcheck
FAILED--expected 631 tests, saw 0
Can't locate regen/regen_lib.pl in @INC (@INC contains: lib ../lib .) at po=
rting/regen.t line 22.
FAIL: t/porting/regen
FAILED--no leader found
PASS: t/porting/test_bootstrap
Failed 168 tests out of 1929, 91.29% okay.
	../cpan/Archive-Extract/t/01_Archive-Extract.t
	../cpan/CPANPLUS-Dist-Build/t/02_CPANPLUS-Dist-Build.t
	../cpan/CPANPLUS/t/04_CPANPLUS-Module.t
	../cpan/CPANPLUS/t/20_CPANPLUS-Dist-MM.t
	../cpan/Devel-DProf/t/DProf.t
	../cpan/Digest-SHA/t/allfcns.t
	../cpan/Digest-SHA/t/base64.t
	../cpan/Digest-SHA/t/bitbuf.t
	../cpan/Digest-SHA/t/dumpload.t
	../cpan/Digest-SHA/t/fips180-4.t
	../cpan/Digest-SHA/t/fips198.t
	../cpan/Digest-SHA/t/gg.t
	../cpan/Digest-SHA/t/gglong.t
	../cpan/Digest-SHA/t/hmacsha.t
	../cpan/Digest-SHA/t/ireland.t
	../cpan/Digest-SHA/t/methods.t
### Since not all tests were successful, you may want to run some of
### them individually and examine any diagnostic messages they produce.
### See the INSTALL document's section on "make test".
	../cpan/Digest-SHA/t/nistbit.t
	../cpan/Digest-SHA/t/nistbyte.t
	../cpan/Digest-SHA/t/rfc2202.t
	../cpan/Digest-SHA/t/sha1.t
	../cpan/Digest-SHA/t/sha224.t
	../cpan/Digest-SHA/t/sha256.t
### You have a good chance to get more information by running
###   ./perl harness
### in the 't' directory since most (>=3D80%) of the tests succeeded.
	../cpan/Digest-SHA/t/sha384.t
	../cpan/Digest-SHA/t/sha512.t
	../cpan/Digest-SHA/t/woodbury.t
	../cpan/ExtUtils-Constant/t/Constant.t
	../cpan/ExtUtils-MakeMaker/t/00compile.t
	../cpan/ExtUtils-MakeMaker/t/INST.t
	../cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
	../cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t
	../cpan/ExtUtils-MakeMaker/t/PL_FILES.t
	../cpan/ExtUtils-MakeMaker/t/basic.t
	../cpan/ExtUtils-MakeMaker/t/min_perl_version.t
	../cpan/ExtUtils-MakeMaker/t/miniperl.t
	../cpan/ExtUtils-MakeMaker/t/pm_to_blib.t
	../cpan/ExtUtils-MakeMaker/t/postamble.t
	../cpan/ExtUtils-MakeMaker/t/recurs.t
	../cpan/ExtUtils-MakeMaker/t/several_authors.t
	../cpan/ExtUtils-MakeMaker/t/writemakefile_args.t
	../cpan/Filter-Util-Call/t/call.t
	../cpan/IO-Compress/t/010examples-bzip2.t
	../cpan/IO-Compress/t/010examples-zlib.t
	../cpan/IO-Compress/t/cz-05examples.t
	../cpan/List-Util/t/00version.t
	../cpan/List-Util/t/blessed.t
	../cpan/List-Util/t/dualvar.t
	../cpan/List-Util/t/expfail.t
	../cpan/List-Util/t/first.t
	../cpan/List-Util/t/isvstring.t
	../cpan/List-Util/t/lln.t
	../cpan/List-Util/t/max.t
	../cpan/List-Util/t/maxstr.t
	../cpan/List-Util/t/min.t
	../cpan/List-Util/t/minstr.t
	../cpan/List-Util/t/openhan.t
	../cpan/List-Util/t/p_00version.t
	../cpan/List-Util/t/p_blessed.t
	../cpan/List-Util/t/p_first.t
	../cpan/List-Util/t/p_lln.t
	../cpan/List-Util/t/p_max.t
	../cpan/List-Util/t/p_maxstr.t
	../cpan/List-Util/t/p_min.t
	../cpan/List-Util/t/p_minstr.t
	../cpan/List-Util/t/p_openhan.t
	../cpan/List-Util/t/p_readonly.t
	../cpan/List-Util/t/p_reduce.t
	../cpan/List-Util/t/p_refaddr.t
	../cpan/List-Util/t/p_reftype.t
	../cpan/List-Util/t/p_shuffle.t
	../cpan/List-Util/t/p_sum.t
	../cpan/List-Util/t/p_tainted.t
	../cpan/List-Util/t/proto.t
	../cpan/List-Util/t/readonly.t
	../cpan/List-Util/t/reduce.t
	../cpan/List-Util/t/refaddr.t
	../cpan/List-Util/t/reftype.t
	../cpan/List-Util/t/shuffle.t
	../cpan/List-Util/t/stack-corruption.t
	../cpan/List-Util/t/sum.t
	../cpan/List-Util/t/tainted.t
	../cpan/List-Util/t/weak.t
	../cpan/Module-Build/t/00-compile.t
	../cpan/Module-Build/t/PL_files.t
	../cpan/Module-Build/t/actions/installdeps.t
	../cpan/Module-Build/t/actions/manifest_skip.t
	../cpan/Module-Build/t/add_property.t
	../cpan/Module-Build/t/basic.t
	../cpan/Module-Build/t/bundle_inc.t
	../cpan/Module-Build/t/compat.t
	../cpan/Module-Build/t/compat/exit.t
	../cpan/Module-Build/t/debug.t
	../cpan/Module-Build/t/destinations.t
	../cpan/Module-Build/t/ext.t
	../cpan/Module-Build/t/extend.t
	../cpan/Module-Build/t/files.t
	../cpan/Module-Build/t/help.t
	../cpan/Module-Build/t/install.t
	../cpan/Module-Build/t/install_extra_target.t
	../cpan/Module-Build/t/manifypods.t
	../cpan/Module-Build/t/metadata.t
	../cpan/Module-Build/t/metadata2.t
	../cpan/Module-Build/t/mymeta.t
	../cpan/Module-Build/t/new_from_context.t
	../cpan/Module-Build/t/notes.t
	../cpan/Module-Build/t/parents.t
	../cpan/Module-Build/t/perl_mb_opt.t
	../cpan/Module-Build/t/ppm.t
	../cpan/Module-Build/t/properties/dist_suffix.t
	../cpan/Module-Build/t/properties/license.t
	../cpan/Module-Build/t/properties/module_name.t
	../cpan/Module-Build/t/properties/needs_compiler.t
	../cpan/Module-Build/t/properties/release_status.t
	../cpan/Module-Build/t/properties/requires.t
	../cpan/Module-Build/t/properties/share_dir.t
	../cpan/Module-Build/t/resume.t
	../cpan/Module-Build/t/runthrough.t
	../cpan/Module-Build/t/sample.t
	../cpan/Module-Build/t/script_dist.t
	../cpan/Module-Build/t/test_file_exts.t
	../cpan/Module-Build/t/test_type.t
	../cpan/Module-Build/t/test_types.t
	../cpan/Module-Build/t/tilde.t
	../cpan/Module-Build/t/use_tap_harness.t
	../cpan/Module-Build/t/versions.t
	../cpan/Module-Build/t/write_default_maniskip.t
	../cpan/Module-Build/t/xs.t
	../cpan/Module-Metadata/t/metadata.t
	../cpan/Pod-Parser/t/pod/find.t
	../cpan/Pod-Parser/t/pod/pod2usage.t
	../cpan/Pod-Parser/t/pod/podselect.t
	../cpan/Test-Harness/t/000-load.t
	../dist/ExtUtils-CBuilder/t/04-base.t
	../dist/ExtUtils-Install/t/InstallWithMM.t
	../dist/File-CheckTree/t/CheckTree.t
	../dist/IO/t/io_tell.t
	../dist/Safe/t/safeops.t
	../ext/DynaLoader/t/DynaLoader.t
	../ext/Fcntl/t/syslfs.t
	../ext/IPC-Open3/t/fd.t
	../ext/POSIX/t/posix.t
	../ext/POSIX/t/taint.t
	../ext/Tie-Memoize/t/Tie-Memoize.t
	../lib/Config/Extensions.t
	../lib/DBM_Filter/t/compress.t
	../lib/DBM_Filter/t/encode.t
	../lib/DBM_Filter/t/int32.t
	../lib/DBM_Filter/t/null.t
	../lib/DBM_Filter/t/utf8.t
	../lib/ExtUtils/t/Embed.t
	../lib/FindBin.t
	../lib/charnames.t
	../lib/diagnostics.t
	../lib/perl5db.t
	op/pack.t
	op/threads.t
	porting/FindExt.t
	porting/args_assert.t
	porting/buildtoc.t
	porting/cmp_version.t
	porting/diag.t
	porting/dual-life.t
	porting/exec-bit.t
	porting/maintainers.t
	porting/manifest.t
	porting/podcheck.t
	porting/regen.t
	run/switches.t
	x2p/s2p.t
### You may have to set your dynamic library search path,
### LD_LIBRARY_PATH, to point to the build directory:
###   setenv LD_LIBRARY_PATH `pwd`; cd t; ./perl harness
###   LD_LIBRARY_PATH=3D`pwd`; export LD_LIBRARY_PATH; cd t; ./perl harness
###   export LD_LIBRARY_PATH=3D`pwd`; cd t; ./perl harness
### for csh-style shells, like tcsh; or for traditional/modern
### Bourne-style shells, like bash, ksh, and zsh, respectively.
u=3D63.55  s=3D25.17  cu=3D4092.56  cs=3D264.68  scripts=3D1929  tests=3D41=
8447

--------------090301090700030401090408--
