Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 039D7610F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 07:52:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s617q7XF001124
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Jul 2014 00:52:07 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 1 Jul 2014 00:52:07 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Jul 2014 15:51:53 +0800
Message-ID: <8b4373634d5955b5f07b237449d24eb6db1e0c5c.1404200247.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1404200247.git.hongxu.jia@windriver.com>
References: <cover.1404200247.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/2] perl, perl-native, perl-ptest: upgrade from 5.14.3 to 5.20.0
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
X-List-Received-Date: Tue, 01 Jul 2014 07:52:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Changed:

- The Copying has no change, except the company address.

- pick patches from debian
  http://ftp.de.debian.org/debian/pool/main/p/perl/perl_5.20.0-1.debian.tar=
.xz
  - Not used by oe:
    deprecate-with-apt.diff
    patchlevel.diff
    fakeroot.diff

- Create/Update perl-rdepends_${PV}.inc by the hardcode script;

- Update config.sh by:
  1) Copy the Perl 5.20.0 source code onto your TARGET machine
    linux qemuarm 3.14.5-yocto-standard from OE-Core rev:
    f506d0660c9949485268a92724ac770b5457b0ca
  2) Execute sh Configure as normal and configure as required,
     do not "make";
  3) Compare with the old config.sh files, and update;

- perl-ptest.inc
  1) Copy the souce code to ptest since almost 112 test cases
     failed with the reason that no souce code found;
  2) Add two patches to fix test case issue;

- perl-native
  Reference perl (5.20.0-1) in debian to update perl shared library headers
  https://packages.debian.org/experimental/i386/perl/filelist

Obsolete:

- 09_fix_installperl.patch
  The dead code was removed from installperl
  http://perl5.git.perl.org/perl.git/commit/236818e0b9d9fe874831086b4d0b94d=
c6f245dfd

- perl-build-in-t-dir.patch
  The upstream has fix it. The issue description:
  Perl cannot cross build in a path containing a directory that has the
  name of "t".  As an example, you can make the perl build fail with
  "mkdir -p /tmp/build/t", go to the directory, unpack the sources,
  configure and cross build.

- 0001-Fix-misparsing-of-maketext-strings.patch
  as they are part of the upstream code now:
  http://perl5.git.perl.org/perl.git/commit/1735f6f53ca19f99c6e9e39496c486a=
f323ba6a8

- 0001-Prevent-premature-hsplit-calls-and-only-trigger-REHA.patch
  the hash function changed:
  http://perl5.git.perl.org/perl.git/commit/7dc8663964c66a698d31bbdc8e8abed=
69bddeec3

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Fix-misparsing-of-maketext-strings.patch  |   86 --
 ...mature-hsplit-calls-and-only-trigger-REHA.patch |  178 ---
 .../perl/perl-5.14.3/09_fix_installperl.patch      |   21 -
 .../debian/arm_thread_stress_timeout.diff          |   27 -
 .../perl-5.14.3/debian/cpanplus_config_path.diff   |   45 -
 .../debian/cpanplus_definstalldirs.diff            |   56 -
 .../perl-5.14.3/debian/deprecate-with-apt.diff     |  407 ------
 .../perl-5.14.3/debian/disable-zlib-bundling.diff  |   31 -
 .../perl/perl-5.14.3/debian/fakeroot.diff          |   45 -
 .../debian/fixes/extutils-cbuilder-cflags.diff     |   87 --
 .../perl-5.14.3/debian/fixes/h2ph-multiarch.diff   |   70 -
 .../perl-5.14.3/debian/fixes/index-tainting.diff   |   74 --
 .../debian/fixes/module-build-home-directory.diff  |   38 -
 .../perl/perl-5.14.3/debian/fixes/pod_fixes.diff   |  146 ---
 .../fixes/sys-syslog-socket-timeout-kfreebsd.patch |   37 -
 .../perl-5.14.3/debian/m68k_thread_stress.diff     |   47 -
 .../perl/perl-5.14.3/debian/patchlevel.diff        |   31 -
 .../perl/perl-5.14.3/debian/series                 |   40 -
 .../debian/skip-upstream-git-tests.diff            |   60 -
 .../perl/perl-5.14.3/perl-build-in-t-dir.patch     |   42 -
 .../0001-Makefile.SH-fix-do_install-failed.patch   |   47 +
 .../Configure-multilib.patch                       |    0
 .../{perl-5.14.3 =3D> perl-5.20.0}/MM_Unix.pm.patch  |    0
 .../{perl-5.14.3 =3D> perl-5.20.0}/Makefile.SH.patch |  282 ++--
 .../{perl-5.14.3 =3D> perl-5.20.0}/Makefile.patch    |    0
 .../perl/{perl-5.14.3 =3D> perl-5.20.0}/config.sh    |  106 +-
 .../perl/{perl-5.14.3 =3D> perl-5.20.0}/config.sh-32 |    0
 .../{perl-5.14.3 =3D> perl-5.20.0}/config.sh-32-be   |    0
 .../{perl-5.14.3 =3D> perl-5.20.0}/config.sh-32-le   |    0
 .../perl/{perl-5.14.3 =3D> perl-5.20.0}/config.sh-64 |    0
 .../{perl-5.14.3 =3D> perl-5.20.0}/config.sh-64-be   |    0
 .../{perl-5.14.3 =3D> perl-5.20.0}/config.sh-64-le   |    0
 .../cross-generate_uudmap.patch                    |    0
 .../perl-5.20.0/debian/cpan-missing-site-dirs.diff |   62 +
 .../debian/cpan_definstalldirs.diff                |   15 +-
 .../debian/db_file_ver.diff                        |    7 +-
 .../debian/doc_info.diff                           |   20 +-
 .../debian/enc2xs_inc.diff                         |   32 +-
 .../debian/errno_ver.diff                          |   15 +-
 .../debian/extutils_set_libperl_path.diff          |   33 +-
 .../debian/find_html2text.diff                     |   11 +-
 .../debian/fixes/document_makemaker_ccflags.diff   |   11 +-
 .../debian/fixes/memoize_storable_nstore.diff      |  110 ++
 .../debian/fixes/net_smtp_docs.diff                |   11 +-
 .../debian/fixes/respect_umask.diff                |   57 +-
 .../perl-5.20.0/debian/hurd_test_skip_stack.diff   |   32 +
 .../debian/instmodsh_doc.diff                      |    9 +-
 .../debian/ld_run_path.diff                        |   19 +-
 .../debian/libnet_config_path.diff                 |    9 +-
 .../debian/libperl_embed_doc.diff                  |   15 +-
 .../debian/mod_paths.diff                          |   13 +-
 .../debian/module_build_man_extensions.diff        |   25 +-
 .../debian/no_packlist_perllocal.diff              |   44 +-
 .../debian/perl5db-x-terminal-emulator.patch       |   29 +
 .../debian/perlivp.diff                            |   13 +-
 .../debian/prefix_changes.diff                     |   43 +-
 .../debian/prune_libs.diff                         |   19 +-
 .../perl/perl-5.20.0/debian/regen-skip.diff        |   27 +
 .../debian/skip-kfreebsd-crash.diff                |   20 +-
 .../debian/skip-upstream-git-tests.diff            |   28 +
 .../debian/squelch-locale-warnings.diff            |   33 +-
 .../debian/writable_site_dirs.diff                 |   19 +-
 .../dynaloaderhack.patch                           |    0
 .../fix_bad_rpath.patch                            |    0
 .../{perl-5.14.3 =3D> perl-5.20.0}/generate-sh.patch |    0
 .../{perl-5.14.3 =3D> perl-5.20.0}/installperl.patch |    0
 .../letgcc-find-errno.patch                        |    0
 .../native-nopacklist.patch                        |   50 +-
 .../native-perlinc.patch                           |    0
 .../perl-5.14.3-fix-CVE-2010-4777.patch            |    0
 .../perl-archlib-exp.patch                         |    0
 .../perl-configpm-switch.patch                     |    0
 .../{perl-5.14.3 =3D> perl-5.20.0}/perl-configure.sh |    0
 .../perl-dynloader.patch                           |    0
 .../perl-enable-gdbm.patch                         |    0
 .../perl-moreconfig.patch                          |    0
 .../perl/{perl-5.14.3 =3D> perl-5.20.0}/run-ptest    |    0
 .../dist-threads-t-join.t-adjust-ps-option.patch   |   38 +
 ...der-t-DynaLoader.t-fix-calling-dl_findfil.patch |   26 +
 ...perl-native_5.14.3.bb =3D> perl-native_5.20.0.bb} |   32 +-
 meta/recipes-devtools/perl/perl-ptest.inc          |   47 +-
 ...depends_5.14.3.inc =3D> perl-rdepends_5.20.0.inc} | 1354 +++++++++++---=
------
 ...ovides_5.14.3.inc =3D> perl-rprovides_5.20.0.inc} |    0
 .../perl/{perl_5.14.3.bb =3D> perl_5.20.0.bb}        |   50 +-
 84 files changed, 1689 insertions(+), 2692 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/0001-Fix-mispars=
ing-of-maketext-strings.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/0001-Prevent-pre=
mature-hsplit-calls-and-only-trigger-REHA.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/09_fix_installpe=
rl.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/arm_threa=
d_stress_timeout.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/cpanplus_=
config_path.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/cpanplus_=
definstalldirs.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/deprecate=
-with-apt.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/disable-z=
lib-bundling.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/fakeroot.=
diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/ext=
utils-cbuilder-cflags.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/h2p=
h-multiarch.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/ind=
ex-tainting.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/mod=
ule-build-home-directory.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/pod=
_fixes.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/sys=
-syslog-socket-timeout-kfreebsd.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/m68k_thre=
ad_stress.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/patchleve=
l.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/series
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/skip-upst=
ream-git-tests.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/perl-build-in-t-=
dir.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/0001-Makefile.SH=
-fix-do_install-failed.patch
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/Configure=
-multilib.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/MM_Unix.p=
m.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/Makefile.=
SH.patch (43%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/Makefile.=
patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/config.sh=
 (77%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/config.sh=
-32 (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/config.sh=
-32-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/config.sh=
-32-le (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/config.sh=
-64 (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/config.sh=
-64-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/config.sh=
-64-le (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/cross-gen=
erate_uudmap.patch (100%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/cpan-miss=
ing-site-dirs.diff
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/cp=
an_definstalldirs.diff (78%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/db=
_file_ver.diff (85%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/do=
c_info.diff (62%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/en=
c2xs_inc.diff (64%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/er=
rno_ver.diff (62%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/ex=
tutils_set_libperl_path.diff (40%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/fi=
nd_html2text.diff (80%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/fi=
xes/document_makemaker_ccflags.diff (75%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/mem=
oize_storable_nstore.diff
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/fi=
xes/net_smtp_docs.diff (65%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/fi=
xes/respect_umask.diff (75%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/hurd_test=
_skip_stack.diff
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/in=
stmodsh_doc.diff (77%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/ld=
_run_path.diff (54%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/li=
bnet_config_path.diff (84%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/li=
bperl_embed_doc.diff (57%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/mo=
d_paths.diff (87%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/mo=
dule_build_man_extensions.diff (59%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/no=
_packlist_perllocal.diff (74%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/perl5db-x=
-terminal-emulator.patch
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/pe=
rlivp.diff (78%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/pr=
efix_changes.diff (75%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/pr=
une_libs.diff (74%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/regen-ski=
p.diff
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/sk=
ip-kfreebsd-crash.diff (71%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/skip-upst=
ream-git-tests.diff
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/sq=
uelch-locale-warnings.diff (63%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/debian/wr=
itable_site_dirs.diff (63%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/dynaloade=
rhack.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/fix_bad_r=
path.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/generate-=
sh.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/installpe=
rl.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/letgcc-fi=
nd-errno.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/native-no=
packlist.patch (68%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/native-pe=
rlinc.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/perl-5.14=
.3-fix-CVE-2010-4777.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/perl-arch=
lib-exp.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/perl-conf=
igpm-switch.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/perl-conf=
igure.sh (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/perl-dynl=
oader.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/perl-enab=
le-gdbm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/perl-more=
config.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 =3D> perl-5.20.0}/run-ptest=
 (100%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/test/dist-thread=
s-t-join.t-adjust-ps-option.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/test/ext-DynaLoa=
der-t-DynaLoader.t-fix-calling-dl_findfil.patch
 rename meta/recipes-devtools/perl/{perl-native_5.14.3.bb =3D> perl-native_=
5.20.0.bb} (71%)
 rename meta/recipes-devtools/perl/{perl-rdepends_5.14.3.inc =3D> perl-rdep=
ends_5.20.0.inc} (84%)
 rename meta/recipes-devtools/perl/{perl-rprovides_5.14.3.inc =3D> perl-rpr=
ovides_5.20.0.inc} (100%)
 rename meta/recipes-devtools/perl/{perl_5.14.3.bb =3D> perl_5.20.0.bb} (92=
%)

diff --git a/meta/recipes-devtools/perl/perl-5.14.3/0001-Fix-misparsing-of-=
maketext-strings.patch b/meta/recipes-devtools/perl/perl-5.14.3/0001-Fix-mi=
sparsing-of-maketext-strings.patch
deleted file mode 100644
index 89ec6ef..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/0001-Fix-misparsing-of-maketex=
t-strings.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 1735f6f53ca19f99c6e9e39496c486af323ba6a8 Mon Sep 17 00:00:00 2001
-From: Brian Carlson <brian.carlson@cpanel.net>
-Date: Wed, 28 Nov 2012 08:54:33 -0500
-Subject: [PATCH] Fix misparsing of maketext strings.
-
-Case 61251: This commit fixes a misparse of maketext strings that could
-lead to arbitrary code execution.  Basically, maketext was compiling
-bracket notation into functions, but neglected to escape backslashes
-inside the content or die on fully-qualified method names when
-generating the code.  This change escapes all such backslashes and dies
-when a method name with a colon or apostrophe is specified.
----
- AUTHORS                                     |  1 +
- dist/Locale-Maketext/lib/Locale/Maketext.pm | 24 ++++++++----------------
- 2 files changed, 9 insertions(+), 16 deletions(-)
-
-Upstream-Status: Backport
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-
-diff --git a/AUTHORS b/AUTHORS
-index 70734b0..009dea0 100644
---- a/AUTHORS
-+++ b/AUTHORS
-@@ -154,6 +154,7 @@ Breno G. de Oliveira		<garu@cpan.org>
- Brent Dax			<brentdax@cpan.org>
- Brooks D Boyd
- Brian Callaghan			<callagh@itginc.com>
-+Brian Carlson			<brian.carlson@cpanel.net>
- Brian Clarke			<clarke@appliedmeta.com>
- brian d foy			<brian.d.foy@gmail.com>
- Brian Fraser			<fraserbn@gmail.com>
-diff --git a/dist/Locale-Maketext/lib/Locale/Maketext.pm b/dist/Locale-Mak=
etext/lib/Locale/Maketext.pm
-index 4822027..63e5fba 100644
---- a/dist/Locale-Maketext/lib/Locale/Maketext.pm
-+++ b/dist/Locale-Maketext/lib/Locale/Maketext.pm
-@@ -625,21 +625,9 @@ sub _compile {
-                         # 0-length method name means to just interpolate:
-                         push @code, ' (';
-                     }
--                    elsif($m =3D~ /^\w+(?:\:\:\w+)*$/s
--                            and $m !~ m/(?:^|\:)\d/s
--                        # exclude starting a (sub)package or symbol with =
a digit
-+                    elsif($m =3D~ /^\w+$/s
-+                        # exclude anything fancy, especially fully-qualif=
ied module names
-                     ) {
--                        # Yes, it even supports the demented (and undocum=
ented?)
--                        #  $obj->Foo::bar(...) syntax.
--                        $target->_die_pointing(
--                            $string_to_compile, q{Can't use "SUPER::" in =
a bracket-group method},
--                            2 + length($c[-1])
--                        )
--                        if $m =3D~ m/^SUPER::/s;
--                        # Because for SUPER:: to work, we'd have to compi=
le this into
--                        #  the right package, and that seems just not wor=
th the bother,
--                        #  unless someone convinces me otherwise.
--
-                         push @code, ' $_[0]->' . $m . '(';
-                     }
-                     else {
-@@ -693,7 +681,9 @@ sub _compile {
-             elsif(substr($1,0,1) ne '~') {
-                 # it's stuff not containing "~" or "[" or "]"
-                 # i.e., a literal blob
--                $c[-1] .=3D $1;
-+                my $text =3D $1;
-+                $text =3D~ s/\\/\\\\/g;
-+                $c[-1] .=3D $text;
-=20
-             }
-             elsif($1 eq '~~') { # "~~"
-@@ -731,7 +721,9 @@ sub _compile {
-             else {
-                 # It's a "~X" where X is not a special character.
-                 # Consider it a literal ~ and X.
--                $c[-1] .=3D $1;
-+                my $text =3D $1;
-+                $text =3D~ s/\\/\\\\/g;
-+                $c[-1] .=3D $text;
-             }
-         }
-     }
---=20
-1.8.3.1
-
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/0001-Prevent-premature-=
hsplit-calls-and-only-trigger-REHA.patch b/meta/recipes-devtools/perl/perl-=
5.14.3/0001-Prevent-premature-hsplit-calls-and-only-trigger-REHA.patch
deleted file mode 100644
index 4357c2e..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/0001-Prevent-premature-hsplit-=
calls-and-only-trigger-REHA.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-From d59e31fc729d8a39a774f03bc6bc457029a7aef2 Mon Sep 17 00:00:00 2001
-From: Yves Orton <demerphq@gmail.com>
-Date: Tue, 12 Feb 2013 10:53:05 +0100
-Subject: [PATCH] Prevent premature hsplit() calls, and only trigger REHASH
- after hsplit()
-
-Triggering a hsplit due to long chain length allows an attacker
-to create a carefully chosen set of keys which can cause the hash
-to use 2 * (2**32) * sizeof(void *) bytes ram. AKA a DOS via memory
-exhaustion. Doing so also takes non trivial time.
-
-Eliminating this check, and only inspecting chain length after a
-normal hsplit() (triggered when keys>buckets) prevents the attack
-entirely, and makes such attacks relatively benign.
-
-(cherry picked from commit f1220d61455253b170e81427c9d0357831ca0fac)
-
-Upstream-Status: Backport
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-
----
- ext/Hash-Util-FieldHash/t/10_hash.t | 18 ++++++++++++++++--
- hv.c                                | 35 ++++++++------------------------=
---
- t/op/hash.t                         | 20 +++++++++++++++++---
- 3 files changed, 41 insertions(+), 32 deletions(-)
-
-diff --git a/ext/Hash-Util-FieldHash/t/10_hash.t b/ext/Hash-Util-FieldHash=
/t/10_hash.t
-index 2cfb4e8..d58f053 100644
---- a/ext/Hash-Util-FieldHash/t/10_hash.t
-+++ b/ext/Hash-Util-FieldHash/t/10_hash.t
-@@ -38,15 +38,29 @@ use constant START     =3D> "a";
-=20
- # some initial hash data
- fieldhash my %h2;
--%h2 =3D map {$_ =3D> 1} 'a'..'cc';
-+my $counter=3D "a";
-+$h2{$counter++}++ while $counter ne 'cd';
-=20
- ok (!Internals::HvREHASH(%h2),=20
-     "starting with pre-populated non-pathological hash (rehash flag if of=
f)");
-=20
- my @keys =3D get_keys(\%h2);
-+my $buckets=3D buckets(\%h2);
- $h2{$_}++ for @keys;
-+$h2{$counter++}++ while buckets(\%h2) =3D=3D $buckets; # force a split
- ok (Internals::HvREHASH(%h2),=20
--    scalar(@keys) . " colliding into the same bucket keys are triggering =
rehash");
-+    scalar(@keys) . " colliding into the same bucket keys are triggering =
rehash after split");
-+
-+# returns the number of buckets in a hash
-+sub buckets {
-+    my $hr =3D shift;
-+    my $keys_buckets=3D scalar(%$hr);
-+    if ($keys_buckets=3D~m!/([0-9]+)\z!) {
-+        return 0+$1;
-+    } else {
-+        return 8;
-+    }
-+}
-=20
- sub get_keys {
-     my $hr =3D shift;
-diff --git a/hv.c b/hv.c
-index 2be1feb..abb9d76 100644
---- a/hv.c
-+++ b/hv.c
-@@ -35,7 +35,8 @@ holds the key and hash value.
- #define PERL_HASH_INTERNAL_ACCESS
- #include "perl.h"
-=20
--#define HV_MAX_LENGTH_BEFORE_SPLIT 14
-+#define HV_MAX_LENGTH_BEFORE_REHASH 14
-+#define SHOULD_DO_HSPLIT(xhv) ((xhv)->xhv_keys > (xhv)->xhv_max) /* HvTOT=
ALKEYS(hv) > HvMAX(hv) */
-=20
- static const char S_strtab_error[]
-     =3D "Cannot modify shared string table in hv_%s";
-@@ -794,29 +795,9 @@ Perl_hv_common(pTHX_ HV *hv, SV *keysv, const char *k=
ey, STRLEN klen,
-     if (masked_flags & HVhek_ENABLEHVKFLAGS)
- 	HvHASKFLAGS_on(hv);
-=20
--    {
--	const HE *counter =3D HeNEXT(entry);
--
--	xhv->xhv_keys++; /* HvTOTALKEYS(hv)++ */
--	if (!counter) {				/* initial entry? */
--	} else if (xhv->xhv_keys > xhv->xhv_max) {
--		/* Use only the old HvKEYS(hv) > HvMAX(hv) condition to limit
--		   bucket splits on a rehashed hash, as we're not going to
--		   split it again, and if someone is lucky (evil) enough to
--		   get all the keys in one list they could exhaust our memory
--		   as we repeatedly double the number of buckets on every
--		   entry. Linear search feels a less worse thing to do.  */
--	    hsplit(hv);
--	} else if(!HvREHASH(hv)) {
--	    U32 n_links =3D 1;
--
--	    while ((counter =3D HeNEXT(counter)))
--		n_links++;
--
--	    if (n_links > HV_MAX_LENGTH_BEFORE_SPLIT) {
--		hsplit(hv);
--	    }
--	}
-+    xhv->xhv_keys++; /* HvTOTALKEYS(hv)++ */
-+    if ( SHOULD_DO_HSPLIT(xhv) ) {
-+        hsplit(hv);
-     }
-=20
-     if (return_svp) {
-@@ -1192,7 +1173,7 @@ S_hsplit(pTHX_ HV *hv)
-=20
-=20
-     /* Pick your policy for "hashing isn't working" here:  */
--    if (longest_chain <=3D HV_MAX_LENGTH_BEFORE_SPLIT /* split worked?  *=
/
-+    if (longest_chain <=3D HV_MAX_LENGTH_BEFORE_REHASH /* split worked?  =
*/
- 	|| HvREHASH(hv)) {
- 	return;
-     }
-@@ -2831,8 +2812,8 @@ S_share_hek_flags(pTHX_ const char *str, I32 len, re=
gister U32 hash, int flags)
-=20
- 	xhv->xhv_keys++; /* HvTOTALKEYS(hv)++ */
- 	if (!next) {			/* initial entry? */
--	} else if (xhv->xhv_keys > xhv->xhv_max /* HvKEYS(hv) > HvMAX(hv) */) {
--		hsplit(PL_strtab);
-+	} else if ( SHOULD_DO_HSPLIT(xhv) ) {
-+            hsplit(PL_strtab);
- 	}
-     }
-=20
-diff --git a/t/op/hash.t b/t/op/hash.t
-index 278bea7..201260a 100644
---- a/t/op/hash.t
-+++ b/t/op/hash.t
-@@ -39,22 +39,36 @@ use constant THRESHOLD =3D> 14;
- use constant START     =3D> "a";
-=20
- # some initial hash data
--my %h2 =3D map {$_ =3D> 1} 'a'..'cc';
-+my %h2;
-+my $counter=3D "a";
-+$h2{$counter++}++ while $counter ne 'cd';
-=20
- ok (!Internals::HvREHASH(%h2),=20
-     "starting with pre-populated non-pathological hash (rehash flag if of=
f)");
-=20
- my @keys =3D get_keys(\%h2);
-+my $buckets=3D buckets(\%h2);
- $h2{$_}++ for @keys;
-+$h2{$counter++}++ while buckets(\%h2) =3D=3D $buckets; # force a split
- ok (Internals::HvREHASH(%h2),=20
--    scalar(@keys) . " colliding into the same bucket keys are triggering =
rehash");
-+    scalar(@keys) . " colliding into the same bucket keys are triggering =
rehash after split");
-+
-+# returns the number of buckets in a hash
-+sub buckets {
-+    my $hr =3D shift;
-+    my $keys_buckets=3D scalar(%$hr);
-+    if ($keys_buckets=3D~m!/([0-9]+)\z!) {
-+        return 0+$1;
-+    } else {
-+        return 8;
-+    }
-+}
-=20
- sub get_keys {
-     my $hr =3D shift;
-=20
-     # the minimum of bits required to mount the attack on a hash
-     my $min_bits =3D log(THRESHOLD)/log(2);
--
-     # if the hash has already been populated with a significant amount
-     # of entries the number of mask bits can be higher
-     my $keys =3D scalar keys %$hr;
---=20
-1.8.3.1
-
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/09_fix_installperl.patc=
h b/meta/recipes-devtools/perl/perl-5.14.3/09_fix_installperl.patch
deleted file mode 100644
index a80d17c..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/09_fix_installperl.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status:Inappropriate [embedded specific]
-
-Correctly identify arch-specific modules in ext/ where the .pm files
-are under lib.
-
-Ensure that POSIX/SigAction is kept with the rest of the POSIX module
-under archlib.
-
-Index: perl-5.12.3/installperl
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- perl-5.12.3.orig/installperl
-+++ perl-5.12.3/installperl
-@@ -750,7 +750,7 @@ sub installlib {
-     }
-=20
-     if (-f $_) {
--	if (/\.(?:al|ix)$/ && !($dir =3D~ m[^auto/(.*)$])) {
-+	if (/\.(?:al|ix)$/ && !($dir =3D~ m[^auto/(.*)$] && $archpms{$1})) {
- 	    $installlib =3D $installprivlib;
- 	    #We're installing *.al and *.ix files into $installprivlib,
- 	    #but we have to delete old *.al and *.ix files from the 5.000
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/arm_thread_stres=
s_timeout.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/arm_thread_s=
tress_timeout.diff
deleted file mode 100644
index 6e70c66..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/arm_thread_stress_timeo=
ut.diff
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From f624a9f1206cdd44fde99c40d82e2f326db485dd Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Sat, 1 Nov 2008 15:10:16 +0200
-Subject: Raise the timeout of ext/threads/shared/t/stress.t to accommodate
- slower build hosts
-
-Bug-Debian: http://bugs.debian.org/501970
-
-Patch-Name: debian/arm_thread_stress_timeout.diff
----
- dist/threads-shared/t/stress.t |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/dist/threads-shared/t/stress.t b/dist/threads-shared/t/stress=
.t
-index adfd1ed..652a3e6 100644
---- a/dist/threads-shared/t/stress.t
-+++ b/dist/threads-shared/t/stress.t
-@@ -34,7 +34,7 @@ use threads::shared;
- {
-     my $cnt =3D 50;
-=20
--    my $TIMEOUT =3D 60;
-+    my $TIMEOUT =3D 150;
-=20
-     my $mutex =3D 1;
-     share($mutex);
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/cpanplus_config_=
path.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/cpanplus_config_p=
ath.diff
deleted file mode 100644
index f33221c..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/cpanplus_config_path.di=
ff
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From 9825086b15f34f365a272cc8d6caf4e2044bede6 Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Mon, 6 Jul 2009 22:17:53 +0300
-Subject: Save local versions of CPANPLUS::Config::System into /etc/perl.
-
-This is a configuration file and needs to go in /etc by policy.
-Besides, /usr may not even be writable.
-
-This mirrors the Debian setup of CPAN.pm in debian/cpan_config_path.
-
-See #533707.
-
-Patch-Name: debian/cpanplus_config_path.diff
----
- cpan/CPANPLUS/lib/CPANPLUS/Configure.pm           |    1 +
- cpan/CPANPLUS/lib/CPANPLUS/Internals/Constants.pm |    3 +++
- 2 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/cpan/CPANPLUS/lib/CPANPLUS/Configure.pm b/cpan/CPANPLUS/lib/C=
PANPLUS/Configure.pm
-index ba1ca07..25cbe5f 100644
---- a/cpan/CPANPLUS/lib/CPANPLUS/Configure.pm
-+++ b/cpan/CPANPLUS/lib/CPANPLUS/Configure.pm
-@@ -280,6 +280,7 @@ Saves the configuration to the package name you provid=
ed.
- If this package is not C<CPANPLUS::Config::System>, it will
- be saved in your C<.cpanplus> directory, otherwise it will
- be attempted to be saved in the system wide directory.
-+(On Debian systems, this system wide directory is /etc/perl.)
-=20
- If no argument is provided, it will default to your personal
- config.
-diff --git a/cpan/CPANPLUS/lib/CPANPLUS/Internals/Constants.pm b/cpan/CPAN=
PLUS/lib/CPANPLUS/Internals/Constants.pm
-index 443d5a4..f7085a8 100644
---- a/cpan/CPANPLUS/lib/CPANPLUS/Internals/Constants.pm
-+++ b/cpan/CPANPLUS/lib/CPANPLUS/Internals/Constants.pm
-@@ -209,6 +209,9 @@ use constant CONFIG_USER_FILE    =3D> sub {
-                                     ) . '.pm';
-                                 };
- use constant CONFIG_SYSTEM_FILE  =3D> sub {
-+                                    # Debian-specific shortcut
-+                                    return '/etc/perl/CPANPLUS/Config/Sys=
tem.pm';
-+                                   =20
-                                     require CPANPLUS::Internals;
-                                     require File::Basename;
-                                     my $dir =3D File::Basename::dirname(
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/cpanplus_definst=
alldirs.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/cpanplus_defin=
stalldirs.diff
deleted file mode 100644
index 7df2860..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/cpanplus_definstalldirs=
.diff
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From 66517b14790aa6410fd37e411dd62521e1e02b7f Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Mon, 6 Jul 2009 21:58:41 +0300
-Subject: Configure CPANPLUS to use the site directories by default.
-
-Bug-Debian: http://bugs.debian.org/533707
-
-The core modules usually default to INSTALLDIRS=3Dperl (ExtUtils::MakeMake=
r)
-or installdirs=3Dcore (Module::Build), so we need to explicitly ask for
-the site destination to get upgraded versions into /usr/local.
-
-See also the sister patch, debian/cpan_definstalldirs .
-
-Patch-Name: debian/cpanplus_definstalldirs.diff
----
- cpan/CPANPLUS/lib/CPANPLUS/Config/System.pm |   30 ++++++++++++++++++++++=
+++++
- 1 files changed, 30 insertions(+), 0 deletions(-)
- create mode 100644 cpan/CPANPLUS/lib/CPANPLUS/Config/System.pm
-
-diff --git a/cpan/CPANPLUS/lib/CPANPLUS/Config/System.pm b/cpan/CPANPLUS/l=
ib/CPANPLUS/Config/System.pm
-new file mode 100644
-index 0000000..5e6e11e
---- /dev/null
-+++ b/cpan/CPANPLUS/lib/CPANPLUS/Config/System.pm
-@@ -0,0 +1,30 @@
-+### minimal pod, so you can find it with perldoc -l, etc
-+=3Dpod
-+
-+=3Dhead1 NAME
-+
-+CPANPLUS::Config::System
-+
-+=3Dhead1 DESCRIPTION
-+
-+This is a CPANPLUS configuration file that sets appropriate default
-+settings on Debian systems.
-+
-+The only preconfigured settings are C<makemakerflags> (set to
-+C<INSTALLDIRS=3Dsite>) and C<buildflags> (set to C<--installdirs site>).
-+
-+These settings will not have any effect if
-+C</etc/perl/CPANPLUS/Config/System.pm> is present.
-+
-+=3Dcut
-+
-+
-+package CPANPLUS::Config::System;
-+
-+sub setup {
-+    my $conf =3D shift;
-+    $conf->set_conf( makemakerflags =3D> 'INSTALLDIRS=3Dsite' );   =20
-+    $conf->set_conf( buildflags =3D> '--installdirs site' );   =20
-+}
-+
-+1;
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/deprecate-with-a=
pt.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/deprecate-with-apt.=
diff
deleted file mode 100644
index 3a145a1..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/deprecate-with-apt.diff
+++ /dev/null
@@ -1,407 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From c2bd2059cfbba573643c748ace4ff4db4cbf015d Mon Sep 17 00:00:00 2001
-From: Dominic Hargreaves <dom@earth.li>
-Date: Mon, 17 May 2010 13:23:07 +0300
-Subject: Point users to Debian packages of deprecated core modules
-
-Bug-Debian: http://bugs.debian.org/580034
-
-Class::ISA, Switch, Pod::Plainer, and (partially) Shell were
-deprecated from the Perl core in 5.12.0.
-
-Class::ISA, Switch, Pod::Plainer were removed from the Perl core in
-5.14.0.
-
-Shell and Devel::DProf, and Perl 4 libraries, were deprecated from the
-Perl core in 5.14.0.
-
-To get a clean transition, perl/perl-modules is going to recommend the
-separate Debian packages of these for one release cycle so that they will =
be
-pulled in by default on upgrades.
-
-However, on systems configured to ignore recommendations the deprecation
-warnings will still be useful, so modify them slightly to point to the
-separate packages instead.
-
-Patch-Name: debian/deprecate-with-apt.diff
----
- lib/abbrev.pl     |    2 +-
- lib/assert.pl     |    2 +-
- lib/bigfloat.pl   |    2 +-
- lib/bigint.pl     |    2 +-
- lib/bigrat.pl     |    2 +-
- lib/cacheout.pl   |    2 +-
- lib/complete.pl   |    2 +-
- lib/ctime.pl      |    2 +-
- lib/deprecate.pm  |   16 +++++++++++++++-
- lib/dotsh.pl      |    2 +-
- lib/exceptions.pl |    2 +-
- lib/fastcwd.pl    |    2 +-
- lib/find.pl       |    2 +-
- lib/finddepth.pl  |    2 +-
- lib/flush.pl      |    2 +-
- lib/getcwd.pl     |    2 +-
- lib/getopt.pl     |    2 +-
- lib/getopts.pl    |    2 +-
- lib/hostname.pl   |    2 +-
- lib/importenv.pl  |    2 +-
- lib/look.pl       |    2 +-
- lib/newgetopt.pl  |    2 +-
- lib/open2.pl      |    2 +-
- lib/open3.pl      |    2 +-
- lib/pwd.pl        |    2 +-
- lib/shellwords.pl |    2 +-
- lib/stat.pl       |    2 +-
- lib/syslog.pl     |    2 +-
- lib/tainted.pl    |    2 +-
- lib/termcap.pl    |    2 +-
- lib/timelocal.pl  |    2 +-
- lib/validate.pl   |    2 +-
- 32 files changed, 46 insertions(+), 32 deletions(-)
-
-diff --git a/lib/abbrev.pl b/lib/abbrev.pl
-index d46321f..0168631 100644
---- a/lib/abbrev.pl
-+++ b/lib/abbrev.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- ;# Usage:
- ;#	%foo =3D ();
-diff --git a/lib/assert.pl b/lib/assert.pl
-index d47e006..80593c5 100644
---- a/lib/assert.pl
-+++ b/lib/assert.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- #
- # This library is no longer being maintained, and is included for backwar=
d
-diff --git a/lib/bigfloat.pl b/lib/bigfloat.pl
-index 82d0f5c..c21bac6 100644
---- a/lib/bigfloat.pl
-+++ b/lib/bigfloat.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- package bigfloat;
- require "bigint.pl";
-diff --git a/lib/bigint.pl b/lib/bigint.pl
-index 6de1c53..031e8ad 100644
---- a/lib/bigint.pl
-+++ b/lib/bigint.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- package bigint;
- #
-diff --git a/lib/bigrat.pl b/lib/bigrat.pl
-index aaf1713..146a8f4 100644
---- a/lib/bigrat.pl
-+++ b/lib/bigrat.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- package bigrat;
- require "bigint.pl";
-diff --git a/lib/cacheout.pl b/lib/cacheout.pl
-index a5da453..937405d 100644
---- a/lib/cacheout.pl
-+++ b/lib/cacheout.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- #
- # This library is no longer being maintained, and is included for backwar=
d
-diff --git a/lib/complete.pl b/lib/complete.pl
-index 9ed041c..2ab0c6a 100644
---- a/lib/complete.pl
-+++ b/lib/complete.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- ;#
- #
-diff --git a/lib/ctime.pl b/lib/ctime.pl
-index aa00d00..ac24e71 100644
---- a/lib/ctime.pl
-+++ b/lib/ctime.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- ;# ctime.pl is a simple Perl emulation for the well known ctime(3C) funct=
ion.
- #
-diff --git a/lib/deprecate.pm b/lib/deprecate.pm
-index 7562c69..fc548b0 100644
---- a/lib/deprecate.pm
-+++ b/lib/deprecate.pm
-@@ -7,6 +7,14 @@ our $VERSION =3D 0.02;
- our %Config;
- unless (%Config) { require Config; *Config =3D \%Config::Config; }
-=20
-+# Debian-specific change: recommend the separate Debian packages of
-+# deprecated modules where available
-+
-+my %DEBIAN_PACKAGES =3D (
-+    "Shell"		=3D> "libshell-perl",
-+    "Devel::DProf"	=3D> "libdevel-dprof-perl"
-+);
-+
- # This isn't a public API. It's internal to code maintained by the perl-p=
orters
- # If you would like it to be a public API, please send a patch with
- # documentation and tests. Until then, it may change without warning.
-@@ -58,9 +66,15 @@ EOM
- 	if (defined $callers_bitmask
- 	    && (vec($callers_bitmask, $warnings::Offsets{deprecated}, 1)
- 		|| vec($callers_bitmask, $warnings::Offsets{all}, 1))) {
--	    warn <<"EOM";
-+		if (my $deb =3D $DEBIAN_PACKAGES{$package}) {
-+		    warn <<"EOM";
-+$package will be removed from the Perl core distribution in the next majo=
r release. Please install the separate $deb package. It is being used at $c=
all_file, line $call_line.
-+EOM
-+		} else {
-+		    warn <<"EOM";
- $package will be removed from the Perl core distribution in the next majo=
r release. Please install it from CPAN. It is being used at $call_file, lin=
e $call_line.
- EOM
-+		}
- 	}
-     }
- }
-diff --git a/lib/dotsh.pl b/lib/dotsh.pl
-index 92f1f4c..4085122 100644
---- a/lib/dotsh.pl
-+++ b/lib/dotsh.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- #
- #   @(#)dotsh.pl                                               03/19/94
-diff --git a/lib/exceptions.pl b/lib/exceptions.pl
-index 8af64c8..b5b1427 100644
---- a/lib/exceptions.pl
-+++ b/lib/exceptions.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- # exceptions.pl
- # tchrist@convex.com
-diff --git a/lib/fastcwd.pl b/lib/fastcwd.pl
-index 70007a1..2c7c42e 100644
---- a/lib/fastcwd.pl
-+++ b/lib/fastcwd.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- # By John Bazik
- #
-diff --git a/lib/find.pl b/lib/find.pl
-index 8e1b42c..7fb2fbf 100644
---- a/lib/find.pl
-+++ b/lib/find.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- # This library is deprecated and unmaintained. It is included for
- # compatibility with Perl 4 scripts which may use it, but it will be
-diff --git a/lib/finddepth.pl b/lib/finddepth.pl
-index 479905f..c07cea5 100644
---- a/lib/finddepth.pl
-+++ b/lib/finddepth.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- # This library is deprecated and unmaintained. It is included for
- # compatibility with Perl 4 scripts which may use it, but it will be
-diff --git a/lib/flush.pl b/lib/flush.pl
-index c427976..e5ed0ae 100644
---- a/lib/flush.pl
-+++ b/lib/flush.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- #
- # This library is no longer being maintained, and is included for backwar=
d
-diff --git a/lib/getcwd.pl b/lib/getcwd.pl
-index 77b2442..3810a99 100644
---- a/lib/getcwd.pl
-+++ b/lib/getcwd.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- # By Brandon S. Allbery
- #
-diff --git a/lib/getopt.pl b/lib/getopt.pl
-index 1d4008a..019a165 100644
---- a/lib/getopt.pl
-+++ b/lib/getopt.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- ;# $RCSfile: getopt.pl,v $$Revision: 4.1 $$Date: 92/08/07 18:23:58 $
- #
-diff --git a/lib/getopts.pl b/lib/getopts.pl
-index 37ecb4a..3d27418 100644
---- a/lib/getopts.pl
-+++ b/lib/getopts.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- ;# getopts.pl - a better getopt.pl
- #
-diff --git a/lib/hostname.pl b/lib/hostname.pl
-index f57375e..b055d30 100644
---- a/lib/hostname.pl
-+++ b/lib/hostname.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- # From: asherman@fmrco.com (Aaron Sherman)
- #
-diff --git a/lib/importenv.pl b/lib/importenv.pl
-index 625edf6..52ee722 100644
---- a/lib/importenv.pl
-+++ b/lib/importenv.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- # This library is no longer being maintained, and is included for backwar=
d
- # compatibility with Perl 4 programs which may require it.
-diff --git a/lib/look.pl b/lib/look.pl
-index 7be55b2..12dcace 100644
---- a/lib/look.pl
-+++ b/lib/look.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- ;# Usage: &look(*FILEHANDLE,$key,$dict,$fold)
- #
-diff --git a/lib/newgetopt.pl b/lib/newgetopt.pl
-index 4ac9470..08df6cb 100644
---- a/lib/newgetopt.pl
-+++ b/lib/newgetopt.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- # This library is no longer being maintained, and is included for backwar=
d
- # compatibility with Perl 4 programs which may require it.
-diff --git a/lib/open2.pl b/lib/open2.pl
-index ceb5653..a05f2ab 100644
---- a/lib/open2.pl
-+++ b/lib/open2.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- # This legacy library is deprecated and will be removed in a future
- # release of perl.
-diff --git a/lib/open3.pl b/lib/open3.pl
-index 9f4d5a4..27f7ab4 100644
---- a/lib/open3.pl
-+++ b/lib/open3.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- # This legacy library is deprecated and will be removed in a future
- # release of perl.
-diff --git a/lib/pwd.pl b/lib/pwd.pl
-index bd8123b..bdace6e 100644
---- a/lib/pwd.pl
-+++ b/lib/pwd.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- ;# pwd.pl - keeps track of current working directory in PWD environment v=
ar
- ;#
-diff --git a/lib/shellwords.pl b/lib/shellwords.pl
-index b562f5f..7f16375 100644
---- a/lib/shellwords.pl
-+++ b/lib/shellwords.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- ;# This legacy library is deprecated and will be removed in a future
- ;# release of perl.
-diff --git a/lib/stat.pl b/lib/stat.pl
-index feda273..910ce1c 100644
---- a/lib/stat.pl
-+++ b/lib/stat.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- ;# This legacy library is deprecated and will be removed in a future
- ;# release of perl.
-diff --git a/lib/syslog.pl b/lib/syslog.pl
-index 7504a5d..4c2b95f 100644
---- a/lib/syslog.pl
-+++ b/lib/syslog.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- #
- # syslog.pl
-diff --git a/lib/tainted.pl b/lib/tainted.pl
-index e88bca1..d58c765 100644
---- a/lib/tainted.pl
-+++ b/lib/tainted.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- # This legacy library is deprecated and will be removed in a future
- # release of perl.
-diff --git a/lib/termcap.pl b/lib/termcap.pl
-index a84cba3..e641f4d 100644
---- a/lib/termcap.pl
-+++ b/lib/termcap.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- ;# $RCSfile: termcap.pl,v $$Revision: 4.1 $$Date: 92/08/07 18:24:16 $
- #
-diff --git a/lib/timelocal.pl b/lib/timelocal.pl
-index fefb9da..2297888 100644
---- a/lib/timelocal.pl
-+++ b/lib/timelocal.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- ;# timelocal.pl
- ;#
-diff --git a/lib/validate.pl b/lib/validate.pl
-index fc2d16a..1a8aef4 100644
---- a/lib/validate.pl
-+++ b/lib/validate.pl
-@@ -1,4 +1,4 @@
--warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install it from the CPAN =
distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{=
[(caller)[2]]}.\n";
-+warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl co=
re distribution in the next major release. Please install the separate libp=
erl4-corelibs-perl package. It is being used at @{[(caller)[1]]}, line @{[(=
caller)[2]]}.\n";
-=20
- ;# The validate routine takes a single multiline string consisting of
- ;# lines containing a filename plus a file test to try on it.  (The
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/disable-zlib-bun=
dling.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/disable-zlib-bun=
dling.diff
deleted file mode 100644
index 03ef76f..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/disable-zlib-bundling.d=
iff
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From 90c7967530102c66bbff25d89273d3f0bf189a83 Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Fri, 10 Apr 2009 01:17:43 +0300
-Subject: Disable zlib bundling in Compress::Raw::Zlib
-
-Compress::Raw::Zlib statically links its bundled version of zlib
-by default, but we use the system library instead.
-
-Patch-Name: debian/disable-zlib-bundling.diff
----
- cpan/Compress-Raw-Zlib/config.in |    6 +++---
- 1 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/cpan/Compress-Raw-Zlib/config.in b/cpan/Compress-Raw-Zlib/con=
fig.in
-index c56cc03..2c6659b 100644
---- a/cpan/Compress-Raw-Zlib/config.in
-+++ b/cpan/Compress-Raw-Zlib/config.in
-@@ -16,9 +16,9 @@
- #    Setting the Gzip OS Code
- #
-=20
--BUILD_ZLIB      =3D True
--INCLUDE         =3D ./zlib-src
--LIB             =3D ./zlib-src
-+BUILD_ZLIB      =3D False
-+INCLUDE         =3D /usr/include
-+LIB             =3D /usr/lib
-=20
- OLD_ZLIB        =3D False
- GZIP_OS_CODE    =3D AUTO_DETECT
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/fakeroot.diff b/=
meta/recipes-devtools/perl/perl-5.14.3/debian/fakeroot.diff
deleted file mode 100644
index 79e7fcf..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/fakeroot.diff
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From a46a7107fb045ffa6047488b8002fec97b621a11 Mon Sep 17 00:00:00 2001
-From: Brendan O'Dea <bod@debian.org>
-Date: Fri, 18 Mar 2005 22:22:25 +1100
-Subject: Postpone LD_LIBRARY_PATH evaluation to the binary targets.
-
-Modify the setting of LD_LIBRARY_PATH to append pre-existing values at the
-time the rule is evaluated rather than when the Makefile is created.
-
-This is required when building packages with dpkg-buildpackage and fakeroo=
t,
-since fakeroot (which now sets LD_LIBRARY_PATH) is not used for the "build=
"
-rule where the Makefile is created, but is for the clean/binary* targets.
-
-Patch-Name: debian/fakeroot.diff
----
- Makefile.SH |    9 ++-------
- 1 files changed, 2 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile.SH b/Makefile.SH
-index eb6326a..1dac585 100755
---- a/Makefile.SH
-+++ b/Makefile.SH
-@@ -36,12 +36,7 @@ case "$useshrplib" in
- true)
- 	# Prefix all runs of 'miniperl' and 'perl' with
- 	# $ldlibpth so that ./perl finds *this* shared libperl.
--	case "$LD_LIBRARY_PATH" in
--	'')
--		ldlibpth=3D"LD_LIBRARY_PATH=3D`pwd`";;
--	*)
--		ldlibpth=3D"LD_LIBRARY_PATH=3D`pwd`:${LD_LIBRARY_PATH}";;
--	esac
-+	ldlibpth=3DLD_LIBRARY_PATH=3D`pwd`'$${LD_LIBRARY_PATH:+:}$$LD_LIBRARY_PA=
TH'
-=20
- 	pldlflags=3D"$cccdlflags"
- 	static_ldflags=3D''
-@@ -112,7 +107,7 @@ true)
- 	    ;;
- 	esac
- 	case "$ldlibpthname" in
--	'') ;;
-+	''|LD_LIBRARY_PATH) ;;
- 	*)
- 	    case "$osname" in
- 	    os2)
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/extutils-c=
builder-cflags.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/e=
xtutils-cbuilder-cflags.diff
deleted file mode 100644
index f9a3c6b..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/extutils-cbuilder=
-cflags.diff
+++ /dev/null
@@ -1,87 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From 0c91624f1f9ec46a6f13cad3031b706213233479 Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Thu, 28 Apr 2011 09:18:54 +0300
-Subject: Append CFLAGS and LDFLAGS to their Config.pm counterparts in
- EU::CBuilder
-
-Bug: http://rt.perl.org/rt3//Public/Bug/Display.html?id=3D89478
-Bug-Debian: http://bugs.debian.org/624460
-Origin: upstream, http://perl5.git.perl.org/perl.git/commitdiff/011e8fb476=
b5fb27c9aa613360d918aa0b798b3d
-
-Since ExtUtils::CBuilder 0.27_04 (bleadperl commit 06e8058f27e4),
-CFLAGS and LDFLAGS from the environment have overridden the Config.pm
-ccflags and ldflags settings. This can cause binary incompatibilities
-between the core Perl and extensions built with EU::CBuilder.
-
-Append to the Config.pm values rather than overriding them.
-
-Patch-Name: fixes/extutils-cbuilder-cflags.diff
----
- .../lib/ExtUtils/CBuilder/Base.pm                  |    6 +++-
- dist/ExtUtils-CBuilder/t/04-base.t                 |   25 +++++++++++++++=
++++-
- 2 files changed, 28 insertions(+), 3 deletions(-)
-
-diff --git a/dist/ExtUtils-CBuilder/lib/ExtUtils/CBuilder/Base.pm b/dist/E=
xtUtils-CBuilder/lib/ExtUtils/CBuilder/Base.pm
-index b572312..2255c51 100644
---- a/dist/ExtUtils-CBuilder/lib/ExtUtils/CBuilder/Base.pm
-+++ b/dist/ExtUtils-CBuilder/lib/ExtUtils/CBuilder/Base.pm
-@@ -40,11 +40,13 @@ sub new {
-     $self->{config}{$k} =3D $v unless exists $self->{config}{$k};
-   }
-   $self->{config}{cc} =3D $ENV{CC} if defined $ENV{CC};
--  $self->{config}{ccflags} =3D $ENV{CFLAGS} if defined $ENV{CFLAGS};
-+  $self->{config}{ccflags} =3D join(" ", $self->{config}{ccflags}, $ENV{C=
FLAGS})
-+     if defined $ENV{CFLAGS};
-   $self->{config}{cxx} =3D $ENV{CXX} if defined $ENV{CXX};
-   $self->{config}{cxxflags} =3D $ENV{CXXFLAGS} if defined $ENV{CXXFLAGS};
-   $self->{config}{ld} =3D $ENV{LD} if defined $ENV{LD};
--  $self->{config}{ldflags} =3D $ENV{LDFLAGS} if defined $ENV{LDFLAGS};
-+  $self->{config}{ldflags} =3D join(" ", $self->{config}{ldflags}, $ENV{L=
DFLAGS})
-+     if defined $ENV{LDFLAGS};
-=20
-   unless ( exists $self->{config}{cxx} ) {
-     my ($ccpath, $ccbase, $ccsfx ) =3D fileparse($self->{config}{cc}, qr/=
\.[^.]*/);
-diff --git a/dist/ExtUtils-CBuilder/t/04-base.t b/dist/ExtUtils-CBuilder/t=
/04-base.t
-index db0ef98..49819a1 100644
---- a/dist/ExtUtils-CBuilder/t/04-base.t
-+++ b/dist/ExtUtils-CBuilder/t/04-base.t
-@@ -1,7 +1,7 @@
- #! perl -w
-=20
- use strict;
--use Test::More tests =3D> 50;
-+use Test::More tests =3D> 64;
- use Config;
- use Cwd;
- use File::Path qw( mkpath );
-@@ -328,6 +328,29 @@ is_deeply( $mksymlists_args,
-     "_prepare_mksymlists_args(): got expected arguments for Mksymlists",
- );
-=20
-+my %testvars =3D (
-+    CFLAGS  =3D> 'ccflags',
-+    LDFLAGS =3D> 'ldflags',
-+);
-+
-+while (my ($VAR, $var) =3D each %testvars) {
-+    local $ENV{$VAR};
-+    $base =3D ExtUtils::CBuilder::Base->new( quiet =3D> 1 );
-+    ok( $base, "ExtUtils::CBuilder::Base->new() returned true value" );
-+    isa_ok( $base, 'ExtUtils::CBuilder::Base' );
-+    like($base->{config}{$var}, qr/\Q$Config{$var}/,
-+        "honours $var from Config.pm");
-+
-+    $ENV{$VAR} =3D "-foo -bar";
-+    $base =3D ExtUtils::CBuilder::Base->new( quiet =3D> 1 );
-+    ok( $base, "ExtUtils::CBuilder::Base->new() returned true value" );
-+    isa_ok( $base, 'ExtUtils::CBuilder::Base' );
-+    like($base->{config}{$var}, qr/\Q$ENV{$VAR}/,
-+        "honours $VAR from the environment");
-+    like($base->{config}{$var}, qr/\Q$Config{$var}/,
-+        "doesn't override $var from Config.pm with $VAR from the environm=
ent");
-+}
-+
- #####
-=20
- for ($source_file, $object_file, $lib_file) {
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/h2ph-multi=
arch.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/h2ph-multia=
rch.diff
deleted file mode 100644
index 3b6b4a0..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/h2ph-multiarch.di=
ff
+++ /dev/null
@@ -1,70 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From 37969e249dfc593ebabfcb682893b6c69dc6b313 Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Wed, 18 May 2011 21:44:06 -0700
-Subject: Make h2ph correctly search gcc include directories
-
-Bug: http://rt.perl.org/rt3/Public/Bug/Display.html?id=3D90122
-Bug-Debian: http://bugs.debian.org/625808
-Origin: upstream, http://perl5.git.perl.org/perl.git/commit/e7ec705d9b91d3=
5fa99dc50d0a232b6372160a77
-
-System header conversion with "h2ph -a" is currently broken on Ubuntu
-Natty and Oneiric (unless the gcc-multilib package is installed for
-backward compatibility), resulting in things like
-
- # perl -e 'require "syscall.ph"'
- Can't locate asm/unistd.ph in @INC [...]
-
-This happens because Ubuntu has switched to a 'multiarch' setup, see
-<https://wiki.ubuntu.com/MultiarchSpec> for details.
-
-The asm subdirectory isn't in $Config{usrinc} anymore: /usr/include/asm
-is now /usr/include/x86_64-linux-gnu/asm. (The third component of the
-new path varies with the actual architecture.)
-
-gcc --print-search-dirs doesn't really tell anything about where gcc
-looks for the include directories, it was just used to find the gcc
-internal directory prefix.
-
-Parse the output of "gcc -v -E" instead, and append $Config{usrinc}
-for safety. Duplicates shouldn't matter.
-
-The h2ph "-a" switch isn't currently tested automatically, and that
-seems nontrivial to do portably. Manual testing was done with
-
- # mkdir ttt
- # ./perl -Ilib ./utils/h2ph -a -d $(pwd)/ttt syscall.h
-
-The gcc invocation has been tested to work with gcc 4.6, 4.1, and 3.3.
-
-http://bugs.debian.org/625808
-https://bugs.launchpad.net/bugs/777903
-
-Patch-Name: fixes/h2ph-multiarch.diff
----
- utils/h2ph.PL |   12 ++----------
- 1 files changed, 2 insertions(+), 10 deletions(-)
-
-diff --git a/utils/h2ph.PL b/utils/h2ph.PL
-index 87f3c7d..4545d6d 100644
---- a/utils/h2ph.PL
-+++ b/utils/h2ph.PL
-@@ -761,16 +761,8 @@ sub queue_includes_from
- # non-GCC?) C compilers, but gcc uses additional include directories.
- sub inc_dirs
- {
--    my $from_gcc    =3D `LC_ALL=3DC $Config{cc} -v 2>&1`;
--    if( !( $from_gcc =3D~ s:^Reading specs from (.*?)/specs\b.*:$1/includ=
e:s ) )
--    { # gcc-4+ :
--       $from_gcc   =3D `LC_ALL=3DC $Config{cc} -print-search-dirs 2>&1`;
--       if ( !($from_gcc =3D~ s/^install:\s*([^\s]+[^\s\/])([\s\/]*).*$/$1=
\/include/s) )
--       {
--           $from_gcc =3D '';
--       };
--    };
--    length($from_gcc) ? ($from_gcc, $from_gcc . "-fixed", $Config{usrinc}=
) : ($Config{usrinc});
-+    my $from_gcc   =3D `LC_ALL=3DC $Config{cc} -v -E - < /dev/null 2>&1 |=
 awk '/^#include/, /^End of search list/' | grep '^ '`;
-+    length($from_gcc) ? (split(' ', $from_gcc), $Config{usrinc}) : ($Conf=
ig{usrinc});
- }
-=20
-=20
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/index-tain=
ting.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/index-taint=
ing.diff
deleted file mode 100644
index ee00ca3..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/index-tainting.di=
ff
+++ /dev/null
@@ -1,74 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From e25298a339dd6679f1b080f0125ac1b237b87950 Mon Sep 17 00:00:00 2001
-From: David Mitchell <davem@iabyn.com>
-Date: Tue, 28 Jun 2011 17:04:40 +0100
-Subject: RT 64804: tainting with index() of a constant
-
-Bug: http://rt.perl.org/rt3/Public/Bug/Display.html?id=3D64804
-Bug-Debian: http://bugs.debian.org/291450
-Origin: upstream, http://perl5.git.perl.org/perl.git/commit/3b36395d31cf0a=
2f3a017505cd0ea857a7acb5d1
-
-At compile time, ck_index with a tainted constant set PL_tainted,
-which remained on during the rest of compilation, tainting all other
-constants.
-
-Fix this by saving and restoring PL_tainted across the call to
-fbm_compile, which is what sets PL_tainted.
-
-Patch-Name: fixes/index-tainting.diff
----
- op.c         |    5 ++++-
- t/op/taint.t |   16 +++++++++++++++-
- 2 files changed, 19 insertions(+), 2 deletions(-)
-
-diff --git a/op.c b/op.c
-index e21b9a4..973df13 100644
---- a/op.c
-+++ b/op.c
-@@ -7780,8 +7780,11 @@ Perl_ck_index(pTHX_ OP *o)
- 	OP *kid =3D cLISTOPo->op_first->op_sibling;	/* get past pushmark */
- 	if (kid)
- 	    kid =3D kid->op_sibling;			/* get past "big" */
--	if (kid && kid->op_type =3D=3D OP_CONST)
-+	if (kid && kid->op_type =3D=3D OP_CONST) {
-+	    const bool save_taint =3D PL_tainted;
- 	    fbm_compile(((SVOP*)kid)->op_sv, 0);
-+	    PL_tainted =3D save_taint;
-+	}
-     }
-     return ck_fun(o);
- }
-diff --git a/t/op/taint.t b/t/op/taint.t
-index 9df6fee..a300b9b 100644
---- a/t/op/taint.t
-+++ b/t/op/taint.t
-@@ -17,7 +17,7 @@ BEGIN {
- use strict;
- use Config;
-=20
--plan tests =3D> 774;
-+plan tests =3D> 778;
-=20
- $| =3D 1;
-=20
-@@ -2144,6 +2144,20 @@ end
-     is_tainted $dest, "ucfirst(tainted) taints its return value";
- }
-=20
-+
-+# tainted constants and index()
-+#  RT 64804; http://bugs.debian.org/291450
-+{
-+    ok(tainted $old_env_path, "initial taintedness");
-+    BEGIN { no strict 'refs'; my $v =3D $old_env_path; *{"::C"} =3D sub (=
) { $v }; }
-+    ok(tainted C, "constant is tainted properly");
-+    ok(!tainted "", "tainting not broken yet");
-+    index(undef, C);
-+    ok(!tainted "", "tainting still works after index() of the constant")=
;
-+}
-+
-+
-+
- # This may bomb out with the alarm signal so keep it last
- SKIP: {
-     skip "No alarm()"  unless $Config{d_alarm};
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/module-bui=
ld-home-directory.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/fixe=
s/module-build-home-directory.diff
deleted file mode 100644
index 998a6a3..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/module-build-home=
-directory.diff
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From 9266292f705f2a3b6e5b97fa50e5f2be31371d5c Mon Sep 17 00:00:00 2001
-From: Dominic Hargreaves <dom@earth.li>
-Date: Mon, 2 May 2011 10:35:04 +0100
-Subject: Fix failing tilde test when run under a UID without a passwd entr=
y
-
-Bug: https://rt.cpan.org/Public/Bug/Display.html?id=3D67893
-Bug-Debian: http://bugs.debian.org/624850
-
-Patch-Name: fixes/module-build-home-directory.diff
----
- cpan/Module-Build/t/tilde.t |    6 ++++--
- 1 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/cpan/Module-Build/t/tilde.t b/cpan/Module-Build/t/tilde.t
-index fac821b..04f0210 100644
---- a/cpan/Module-Build/t/tilde.t
-+++ b/cpan/Module-Build/t/tilde.t
-@@ -46,7 +46,8 @@ SKIP: {
-=20
-     unless (defined $home) {
-       my @info =3D eval { getpwuid $> };
--      skip "No home directory for tilde-expansion tests", 15 if $@;
-+      skip "No home directory for tilde-expansion tests", 15 if $@
-+        or !defined $info[7];
-       $home =3D $info[7];
-     }
-=20
-@@ -95,7 +96,8 @@ SKIP: {
- # Again, with named users
- SKIP: {
-     my @info =3D eval { getpwuid $> };
--    skip "No home directory for tilde-expansion tests", 1 if $@;
-+    skip "No home directory for tilde-expansion tests", 1 if $@
-+        or !defined $info[7] or !defined $info[0];
-     my ($me, $home) =3D @info[0,7];
-=20
-     my $expected =3D "$home/fooxzy";
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/pod_fixes.=
diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/pod_fixes.diff
deleted file mode 100644
index 58e770b..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/pod_fixes.diff
+++ /dev/null
@@ -1,146 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From c6b1fdd18dab0236458502564e54c180bb0ce341 Mon Sep 17 00:00:00 2001
-From: Keith Thompson <kst@mib.org>
-Date: Fri, 29 Jul 2011 17:17:00 -0700
-Subject: Fix typos in several pod/perl*.pod files
-
-Bug-Debian: http://bugs.debian.org/637816
-Origin: http://perl5.git.perl.org/perl.git/commit/7698aede74509727f7bca31c=
58fc7a53b182315d
-Patch-Name: fixes/pod_fixes.diff
----
- pod/perlfunc.pod     |    8 ++++----
- pod/perlglossary.pod |   10 +++++-----
- pod/perlmod.pod      |    4 ++--
- pod/perlretut.pod    |    6 +++---
- 4 files changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/pod/perlfunc.pod b/pod/perlfunc.pod
-index 2ee3637..719a740 100644
---- a/pod/perlfunc.pod
-+++ b/pod/perlfunc.pod
-@@ -3918,7 +3918,7 @@ count.  A numeric repeat count may optionally be enc=
losed in brackets, as
- in C<pack("C[80]", @arr)>.  The repeat count gobbles that many values fro=
m
- the LIST when used with all format types other than C<a>, C<A>, C<Z>, C<b=
>,
- C<B>, C<h>, C<H>, C<@>, C<.>, C<x>, C<X>, and C<P>, where it means
--something else, dscribed below.  Supplying a C<*> for the repeat count
-+something else, described below.  Supplying a C<*> for the repeat count
- instead of a number means to use however many items are left, except for:
-=20
- =3Dover=20
-@@ -5870,7 +5870,7 @@ sometimes saying the opposite, for example) the resu=
lts are not
- well-defined.
-=20
- Because C<< <=3D> >> returns C<undef> when either operand is C<NaN>
--(not-a-number), and laso because C<sort> raises an exception unless the
-+(not-a-number), and also because C<sort> raises an exception unless the
- result of a comparison is defined, be careful when sorting with a
- comparison function like C<< $a <=3D> $b >> any lists that might contain =
a
- C<NaN>.  The following example takes advantage that C<NaN !=3D NaN> to
-@@ -5958,7 +5958,7 @@ specified.
-=20
- A pattern matching the empty string (not to be confused with
- an empty pattern C<//>, which is just one member of the set of patterns
--matching the epmty string), splits EXPR into individual
-+matching the empty string), splits EXPR into individual
- characters.  For example:
-=20
-     print join(':', split(/ */, 'hi there')), "\n";
-@@ -6222,7 +6222,7 @@ For example:
-   printf '<%.1e>', 10; # prints "<1.0e+01>"
-=20
- For "g" and "G", this specifies the maximum number of digits to show,
--including thoe prior to the decimal point and those after it; for=20
-+including those prior to the decimal point and those after it; for=20
- example:
-=20
-   # These examples are subject to system-specific variation.
-diff --git a/pod/perlglossary.pod b/pod/perlglossary.pod
-index 639ce33..191371c 100644
---- a/pod/perlglossary.pod
-+++ b/pod/perlglossary.pod
-@@ -507,7 +507,7 @@ the class (its L<objects|/object>).  See also L</inher=
itance>.
-=20
- =3Ditem class method
-=20
--A L</method> whose L</invocand> is a L</package> name, not an
-+A L</method> whose L</invocant> is a L</package> name, not an
- L</object> reference.  A method associated with the class as a whole.
-=20
- =3Ditem client
-@@ -1470,7 +1470,7 @@ Perl, C<print STDOUT "$foo\n";> can be understood as=
 "verb
- indirect-object object" where L</STDOUT> is the recipient of the
- L<print|perlfunc/print> action, and C<"$foo"> is the object being
- printed.  Similarly, when invoking a L</method>, you might place the
--invocand between the method and its arguments:
-+invocant between the method and its arguments:
-=20
-   $gollum =3D new Pathetic::Creature "Smeagol";
-   give $gollum "Fisssssh!";
-@@ -1548,11 +1548,11 @@ of compiler that takes a program and turns it into=
 a more executable
- form (L<syntax trees|/syntax tree>) within the I<perl> process itself,
- which the Perl L</run time> system then interprets.
-=20
--=3Ditem invocand
-+=3Ditem invocant
-=20
- The agent on whose behalf a L</method> is invoked.  In a L</class>
--method, the invocand is a package name.  In an L</instance> method,
--the invocand is an object reference.
-+method, the invocant is a package name.  In an L</instance> method,
-+the invocant is an object reference.
-=20
- =3Ditem invocation
-=20
-diff --git a/pod/perlmod.pod b/pod/perlmod.pod
-index 5266f19..17de73e 100644
---- a/pod/perlmod.pod
-+++ b/pod/perlmod.pod
-@@ -571,7 +571,7 @@ like for example handle the cloning of non-Perl data, =
if necessary.
- C<CLONE> will be called once as a class method for every package that has=
 it
- defined (or inherits it).  It will be called in the context of the new th=
read,
- so all modifications are made in the new area.  Currently CLONE is called=
 with
--no parameters other than the invocand package name, but code should not a=
ssume
-+no parameters other than the invocant package name, but code should not a=
ssume
- that this will remain unchanged, as it is likely that in future extra par=
ameters
- will be passed in to give more information about the state of cloning.
-=20
-@@ -593,7 +593,7 @@ to make use of the objects, then a more sophisticated =
approach is
- needed.
-=20
- Like C<CLONE>, C<CLONE_SKIP> is currently called with no parameters other
--than the invocand package name, although that may change. Similarly, to
-+than the invocant package name, although that may change. Similarly, to
- allow for future expansion, the return value should be a single C<0> or
- C<1> value.
-=20
-diff --git a/pod/perlretut.pod b/pod/perlretut.pod
-index ea80594..1c65f5b 100644
---- a/pod/perlretut.pod
-+++ b/pod/perlretut.pod
-@@ -781,7 +781,7 @@ so may lead to surprising and unsatisfactory results.
- =3Dhead2 Relative backreferences
-=20
- Counting the opening parentheses to get the correct number for a
--backreference is errorprone as soon as there is more than one
-+backreference is error-prone as soon as there is more than one
- capturing group.  A more convenient technique became available
- with Perl 5.10: relative backreferences. To refer to the immediately
- preceding capture group one now may write C<\g{-1}>, the next but
-@@ -1537,7 +1537,7 @@ the regexp in the I<last successful match> is used i=
nstead.  So we have
-=20
- =3Dhead3 Global matching
-=20
--The final two modifiers we will disccuss here,
-+The final two modifiers we will discuss here,
- C<//g> and C<//c>, concern multiple matches.
- The modifier C<//g> stands for global matching and allows the
- matching operator to match within a string as many times as possible.
-@@ -1870,7 +1870,7 @@ substituted.
-=20
- C<\Q>, C<\L>, C<\l>, C<\U>, C<\u> and C<\E> are actually part of
- double-quotish syntax, and not part of regexp syntax proper.  They will
--work if they appear in a regular expression embeddded directly in a
-+work if they appear in a regular expression embedded directly in a
- program, but not when contained in a string that is interpolated in a
- pattern.
-=20
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/sys-syslog=
-socket-timeout-kfreebsd.patch b/meta/recipes-devtools/perl/perl-5.14.3/deb=
ian/fixes/sys-syslog-socket-timeout-kfreebsd.patch
deleted file mode 100644
index 632d426..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/sys-syslog-socket=
-timeout-kfreebsd.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From 9ba88d73444c22788b7c2a212e15dbfe3da2a1af Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Wed, 3 Aug 2011 22:36:24 +0300
-Subject: Use a socket timeout on GNU/kFreeBSD to catch ICMP port unreachab=
le
- messages
-
-Bug: http://rt.cpan.org/Ticket/Display.html?id=3D69997
-Bug-Debian: http://bugs.debian.org/627821
-
-Without this, openlog() on a UDP socket may succeed on the FreeBSD kernel
-even when there's no listener, causing test failures.
-
-It seems probable that all FreeBSD-based systems suffer from the
-same issue, but that's for upstream to decide.
-
-Patch-Name: fixes/sys-syslog-socket-timeout-kfreebsd.patch
----
- cpan/Sys-Syslog/Syslog.pm |    5 ++++-
- 1 files changed, 4 insertions(+), 1 deletions(-)
-
-diff --git a/cpan/Sys-Syslog/Syslog.pm b/cpan/Sys-Syslog/Syslog.pm
-index 002e6e4..b445c66 100644
---- a/cpan/Sys-Syslog/Syslog.pm
-+++ b/cpan/Sys-Syslog/Syslog.pm
-@@ -138,7 +138,10 @@ my @fallbackMethods =3D ();
- # happy, the timeout is now zero by default on all systems=20
- # except on OSX where it is set to 250 msec, and can be set=20
- # with the infamous setlogsock() function.
--$sock_timeout =3D 0.25 if $^O =3D~ /darwin/;
-+#
-+# Debian change: include Debian GNU/kFreeBSD, lower to 1ms
-+# see [rt.cpan.org #69997]
-+$sock_timeout =3D 0.001 if $^O =3D~ /darwin|gnukfreebsd/;
-=20
- # coderef for a nicer handling of errors
- my $err_sub =3D $options{nofatal} ? \&warnings::warnif : \&croak;
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/m68k_thread_stre=
ss.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/m68k_thread_stress.=
diff
deleted file mode 100644
index 1c3b6b5..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/m68k_thread_stress.diff
+++ /dev/null
@@ -1,47 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From 55a718425dc4612ac01850ef786f75f072b20b9e Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Mon, 8 Sep 2008 20:48:14 +0300
-Subject: Disable some threads tests on m68k for now due to missing TLS.
-
-Bug-Debian: http://bugs.debian.org/495826
-Bug-Debian: http://bugs.debian.org/517938
-
-Patch-Name: debian/m68k_thread_stress.diff
----
- dist/threads-shared/t/stress.t    |    4 ++++
- dist/threads-shared/t/waithires.t |    6 ++++++
- 2 files changed, 10 insertions(+), 0 deletions(-)
-
-diff --git a/dist/threads-shared/t/stress.t b/dist/threads-shared/t/stress=
.t
-index 652a3e6..2f1b576 100644
---- a/dist/threads-shared/t/stress.t
-+++ b/dist/threads-shared/t/stress.t
-@@ -11,6 +11,10 @@ BEGIN {
-         print("1..0 # SKIP Broken under HP-UX 10.20\n");
-         exit(0);
-     }
-+    if ($^O eq 'linux' && $Config{archname} =3D~ /^m68k/) {
-+        print("1..0 # Skip: no TLS on m68k yet <http://bugs.debian.org/49=
5826>\n");
-+        exit(0);
-+    }
- }
-=20
- use ExtUtils::testlib;
-diff --git a/dist/threads-shared/t/waithires.t b/dist/threads-shared/t/wai=
thires.t
-index 3c3e852..349c5b4 100644
---- a/dist/threads-shared/t/waithires.t
-+++ b/dist/threads-shared/t/waithires.t
-@@ -16,6 +16,12 @@ BEGIN {
-     if (! eval 'use Time::HiRes "time"; 1') {
-         Test::skip_all('Time::HiRes not available');
-     }
-+
-+    if ($^O eq 'linux' && $Config{archname} =3D~ /^m68k/) {
-+        print("1..0 # Skip: no TLS on m68k yet <http://bugs.debian.org/49=
5826>\n");
-+        exit(0);
-+    }
-+
- }
-=20
- use ExtUtils::testlib;
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/patchlevel.diff =
b/meta/recipes-devtools/perl/perl-5.14.3/debian/patchlevel.diff
deleted file mode 100644
index 9c25eb7..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/patchlevel.diff
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From cf928101697efa4a46ada500c2f449caeb854fd4 Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Sun, 15 May 2011 19:35:58 +0300
-Subject: List packaged patches in patchlevel.h
-
-Origin: vendor
-Bug-Debian: http://bugs.debian.org/567489
-
-The list of packaged patches is in patchlevel-debian.h, which is generated
-from the debian/patches/ directory when building the package.
-
-Patch-Name: debian/patchlevel.diff
----
- patchlevel.h |    3 +++
- 1 files changed, 3 insertions(+), 0 deletions(-)
-
-diff --git a/patchlevel.h b/patchlevel.h
-index 5dc2a53..1356595 100644
---- a/patchlevel.h
-+++ b/patchlevel.h
-@@ -137,6 +137,9 @@ static const char * const local_patches[] =3D {
- 	,"uncommitted-changes"
- #endif
- 	PERL_GIT_UNPUSHED_COMMITS    	/* do not remove this line */
-+#ifdef DEBIAN
-+#include "patchlevel-debian.h"
-+#endif
- 	,NULL
- };
-=20
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/series b/meta/re=
cipes-devtools/perl/perl-5.14.3/debian/series
deleted file mode 100644
index 08adca5..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/series
+++ /dev/null
@@ -1,40 +0,0 @@
-debian/arm_thread_stress_timeout.diff
-debian/cpan_definstalldirs.diff
-debian/db_file_ver.diff
-debian/doc_info.diff
-debian/enc2xs_inc.diff
-debian/errno_ver.diff
-debian/libperl_embed_doc.diff
-fixes/respect_umask.diff
-debian/writable_site_dirs.diff
-debian/extutils_set_libperl_path.diff
-debian/no_packlist_perllocal.diff
-debian/prefix_changes.diff
-debian/fakeroot.diff
-debian/instmodsh_doc.diff
-debian/ld_run_path.diff
-debian/libnet_config_path.diff
-debian/m68k_thread_stress.diff
-debian/mod_paths.diff
-debian/module_build_man_extensions.diff
-debian/prune_libs.diff
-fixes/net_smtp_docs.diff
-debian/perlivp.diff
-debian/disable-zlib-bundling.diff
-debian/cpanplus_definstalldirs.diff
-debian/cpanplus_config_path.diff
-debian/deprecate-with-apt.diff
-fixes/hurd-ccflags.diff
-debian/squelch-locale-warnings.diff
-debian/skip-upstream-git-tests.diff
-fixes/extutils-cbuilder-cflags.diff
-fixes/module-build-home-directory.diff
-debian/patchlevel.diff
-fixes/h2ph-multiarch.diff
-fixes/index-tainting.diff
-debian/skip-kfreebsd-crash.diff
-fixes/document_makemaker_ccflags.diff
-fixes/sys-syslog-socket-timeout-kfreebsd.patch
-fixes/hurd-hints.diff
-fixes/pod_fixes.diff
-debian/find_html2text.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/skip-upstream-gi=
t-tests.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/skip-upstream-=
git-tests.diff
deleted file mode 100644
index 2c30536..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/skip-upstream-git-tests=
.diff
+++ /dev/null
@@ -1,60 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From 2be2eed9148c38d3e982d3371f379ce77021aeb5 Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Fri, 22 Apr 2011 11:15:32 +0300
-Subject: Skip tests specific to the upstream Git repository
-
-These tests fail if run from a different git repository than
-upstream. This complicates things needlessly for downstream packagers.
-
-Skip the tests altogether even if the .git directory exists.
-
-Patch-Name: debian/skip-upstream-git-tests.diff
----
- t/porting/authors.t     |    3 ++-
- t/porting/cmp_version.t |    3 ++-
- t/porting/manifest.t    |    3 ++-
- 3 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/t/porting/authors.t b/t/porting/authors.t
-index 28ca1ca..3c7f069 100644
---- a/t/porting/authors.t
-+++ b/t/porting/authors.t
-@@ -9,7 +9,8 @@ BEGIN {
- use strict;
- use warnings;
-=20
--if (! -d '.git' ) {
-+# Debian change: skip as we're probably in a different git repository
-+if (1 || ! -d '.git' ) {
-     print "1..0 # SKIP: not being run from a git checkout\n";
-     exit 0;
- }
-diff --git a/t/porting/cmp_version.t b/t/porting/cmp_version.t
-index b3c677c..f89f2a7 100644
---- a/t/porting/cmp_version.t
-+++ b/t/porting/cmp_version.t
-@@ -25,7 +25,8 @@ use File::Spec::Functions qw(rel2abs abs2rel catfile cat=
dir curdir);
- use Getopt::Std;
- use Maintainers;
-=20
--if (! -d '.git' ) {
-+# Debian change: skip as we're probably in a different git repository
-+if (1 || ! -d '.git' ) {
-     print "1..0 # SKIP: not being run from a git checkout\n";
-     exit 0;
- }
-diff --git a/t/porting/manifest.t b/t/porting/manifest.t
-index 48dd3ac..b08126b 100644
---- a/t/porting/manifest.t
-+++ b/t/porting/manifest.t
-@@ -59,7 +59,8 @@ SKIP: {
-=20
- SKIP: {
-     chdir "..";
--    skip("not under git control", 3) unless -d '.git';
-+    # Debian change: skip as we're probably in a different git repository
-+    skip("not under git control", 3) unless 0 && -d '.git';
-     chomp(my @repo=3D grep { !/\.gitignore$/ } `git ls-files`);
-     skip("git ls-files didnt work",3)
-         if !@repo;
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/perl-build-in-t-dir.pat=
ch b/meta/recipes-devtools/perl/perl-5.14.3/perl-build-in-t-dir.patch
deleted file mode 100644
index 16064ed..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.3/perl-build-in-t-dir.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status:Pending
-
-Perl cannot cross build in a path containing a directory that has the
-name of "t".  As an example, you can make the perl build fail with
-"mkdir -p /tmp/build/t", go to the directory, unpack the sources,
-configure and cross build.
-
-You get an error like the following:
-    pod/buildtoc: no pods at pod/buildtoc line 305.
-    make[1]: *** [pod/perltoc.pod] Error 255
-
-The fix is to strip off the top directory that you are building in and
-then execute all the same logic as before against the path relative to
-the build directory.
-
-Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
----
- pod/buildtoc |    4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
---- a/pod/buildtoc
-+++ b/pod/buildtoc
-@@ -274,8 +274,10 @@ if ($Build{toc}) {
-   find \&getpods =3D> abs_from_top('lib/');
-=20
-   sub getpods {
-+    my $Top =3D $FindBin::Bin;
-     if (/\.p(od|m)$/) {
-       my $file =3D $File::Find::name;
-+      $file =3D~ s!^$Top!!;
-       return if $file =3D~ qr!/lib/Pod/Functions.pm\z!; # Used only by po=
d itself
-       return if $file =3D~ m!(?:^|/)t/!;
-       return if $file =3D~ m!lib/Attribute/Handlers/demo/!;
-@@ -283,7 +285,7 @@ if ($Build{toc}) {
-       return if $file =3D~ m!lib/Math/BigInt/t/!;
-       return if $file =3D~ m!/Devel/PPPort/[Hh]arness|lib/Devel/Harness!i=
;
-       return if $file =3D~ m!XS/(?:APItest|Typemap)!;
--      my $pod =3D $file;
-+      my $pod =3D $file =3D $File::Find::name;
-       return if $pod =3D~ s/pm$/pod/ && -e $pod;
-       unless (open my $f, '<', $_) {
- 	warn "$0: bogus <$file>: $!";
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/0001-Makefile.SH-fix-do=
_install-failed.patch b/meta/recipes-devtools/perl/perl-5.20.0/0001-Makefil=
e.SH-fix-do_install-failed.patch
new file mode 100644
index 0000000..b1787ce
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.20.0/0001-Makefile.SH-fix-do_instal=
l-failed.patch
@@ -0,0 +1,47 @@
+From 2ed4b0c66fe7c7282922798eb3271b8f101359d1 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 19 Jun 2014 19:34:56 +0800
+Subject: [PATCH] Makefile.SH: fix do_install failed
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.SH | 16 +---------------
+ 1 file changed, 1 insertion(+), 15 deletions(-)
+
+diff --git a/Makefile.SH b/Makefile.SH
+index f5d2d0f..e468c1b 100755
+--- a/Makefile.SH
++++ b/Makefile.SH
+@@ -1074,8 +1074,7 @@ EOT
+         $spitshell >>$Makefile <<EOT
+=20
+ install_$name install-$name: \$(INSTALL_DEPENDENCE) installperl all insta=
llman
+-	\$(RUN_PERL) installperl --destdir=3D\$(DESTDIR) $flags \$(INSTALLFLAGS)=
 \$(STRIPFLAGS)
+-	\$(RUN_PERL) installman --destdir=3D\$(DESTDIR) $flags
++	./hostperl -Ifake_config_library -Ilib -MConfig installperl --destdir=3D=
\$(DESTDIR) $flags  \$(INSTALLFLAGS) \$(STRIPFLAGS)
+ EOT
+     fi
+=20
+@@ -1104,19 +1103,6 @@ else
+ 	$spitshell >>$Makefile <<'!NO!SUBS!'
+ install.perl:	$(INSTALL_DEPENDENCE) installperl
+ 	./hostperl -Ifake_config_library -Ilib -MConfig installperl --destdir=3D=
$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
+-
+-# XXX Experimental. Hardwired values, but useful for testing.
+-# Eventually Configure could ask for some of these values.
+-install.html: all installhtml
+-	-@test -f README.vms && cd vms && $(LNS) ../README.vms README_vms.pod &&=
 cd ..
+-	$(RUN_PERL) installhtml   \
+-      --podroot=3D. --podpath=3D. --recurse  \
+-      --htmldir=3D$(privlib)/html   \
+-      --htmlroot=3D$(privlib)/html  \
+-      --splithead=3Dpod/perlipc     \
+-      --splititem=3Dpod/perlfunc    \
+-      --ignore=3DPorting/Maintainers.pm,Porting/pumpkin.pod,Porting/repos=
itory.pod \
+-      --verbose
+ !NO!SUBS!
+ fi
+=20
+--=20
+1.8.1.2
+
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/Configure-multilib.patc=
h b/meta/recipes-devtools/perl/perl-5.20.0/Configure-multilib.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/Configure-multilib.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/Configure-multilib.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/MM_Unix.pm.patch b/meta=
/recipes-devtools/perl/perl-5.20.0/MM_Unix.pm.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/MM_Unix.pm.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/MM_Unix.pm.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/Makefile.SH.patch b/met=
a/recipes-devtools/perl/perl-5.20.0/Makefile.SH.patch
similarity index 43%
rename from meta/recipes-devtools/perl/perl-5.14.3/Makefile.SH.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/Makefile.SH.patch
index 41f2b53..689d394 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/Makefile.SH.patch
+++ b/meta/recipes-devtools/perl/perl-5.20.0/Makefile.SH.patch
@@ -1,29 +1,45 @@
 Upstream-Status:Inappropriate [embedded specific]
=20
-Index: perl-5.14.2/Makefile.SH
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- perl-5.14.2.orig/Makefile.SH
-+++ perl-5.14.2/Makefile.SH
-@@ -36,7 +36,7 @@ case "$useshrplib" in
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.SH | 130 ++++++++++++++++++++++++++++++-------------------------=
-----
+ 1 file changed, 66 insertions(+), 64 deletions(-)
+
+diff --git a/Makefile.SH b/Makefile.SH
+--- a/Makefile.SH
++++ b/Makefile.SH
+@@ -39,10 +39,10 @@ case "$useshrplib" in
  true)
  	# Prefix all runs of 'miniperl' and 'perl' with
  	# $ldlibpth so that ./perl finds *this* shared libperl.
--	ldlibpth=3DLD_LIBRARY_PATH=3D`pwd`'$${LD_LIBRARY_PATH:+:}$$LD_LIBRARY_PA=
TH'
-+	#ldlibpth=3DLD_LIBRARY_PATH=3D`pwd`'$${LD_LIBRARY_PATH:+:}$$LD_LIBRARY_P=
ATH'
+-	case "$LD_LIBRARY_PATH" in
+-	'')  ldlibpth=3D"LD_LIBRARY_PATH=3D` quote "$pwd" `" ;;
+-	*)   ldlibpth=3D"LD_LIBRARY_PATH=3D` quote "$pwd" `:` quote "$LD_LIBRARY=
_PATH" `" ;;
+-	esac
++	#case "$LD_LIBRARY_PATH" in
++	#'')  ldlibpth=3D"LD_LIBRARY_PATH=3D` quote "$pwd" `" ;;
++	#*)   ldlibpth=3D"LD_LIBRARY_PATH=3D` quote "$pwd" `:` quote "$LD_LIBRAR=
Y_PATH" `" ;;
++	#esac
 =20
  	pldlflags=3D"$cccdlflags"
  	static_ldflags=3D''
-@@ -114,7 +114,8 @@ true)
- 	        ldlibpth=3D''
- 	        ;;
+@@ -122,10 +122,11 @@ true)
  	    *)
--		eval "ldlibpth=3D\"$ldlibpthname=3D`pwd`:\$$ldlibpthname\""
+ 		eval "ldlibpthval=3D\"\$$ldlibpthname\""
+=20
+-		case "$ldlibpthval" in
+-		'')  ldlibpth=3D"$ldlibpthname=3D` quote "$pwd" `" ;;
+-		*)   ldlibpth=3D"$ldlibpthname=3D` quote "$pwd" `:` quote "$ldlibpthval=
" `" ;;
+-		esac
 +# We compile in the library path in OE from cross-compile, so lets not do=
 this
-+#		eval "ldlibpth=3D\"$ldlibpthname=3D`pwd`:\$$ldlibpthname\""
++#		case "$ldlibpthval" in
++#		'')  ldlibpth=3D"$ldlibpthname=3D` quote "$pwd" `" ;;
++#		*)   ldlibpth=3D"$ldlibpthname=3D` quote "$pwd" `:` quote "$ldlibpthva=
l" `" ;;
++#		esac
+=20
  		;;
  	    esac
- 	    # Strip off any trailing :'s
-@@ -135,18 +136,7 @@ true)
+@@ -141,18 +142,7 @@ true)
  	    # INSTALL file, under "Building a shared perl library".
  	    # If there is no pre-existing $libperl, we don't need
  	    # to do anything further.
@@ -43,9 +59,9 @@ Index: perl-5.14.2/Makefile.SH
  	    ;;
  	os390)	test -f /bin/env && ldlibpth=3D"/bin/env $ldlibpth"
  		;;
-@@ -529,9 +519,19 @@ splintfiles =3D $(c1)
- .c.s:
- 	$(CCCMDSRC) -S $*.c
+@@ -565,9 +555,19 @@ splintfiles =3D $(c1)
+ 	@echo `$(CCCMDSRC)` -S $*.c
+ 	@`$(CCCMDSRC)` -S $*.c
 =20
 -all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unid=
atafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make
 -	@echo " ";
@@ -66,7 +82,7 @@ Index: perl-5.14.2/Makefile.SH
 =20
  .PHONY: all translators utilities
 =20
-@@ -539,7 +539,7 @@ all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(
+@@ -575,7 +575,7 @@ all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods=
) $(private) $(unidatafile
  # by make_patchnum.pl.
  git_version.h: lib/Config_git.pl
 =20
@@ -75,45 +91,54 @@ Index: perl-5.14.2/Makefile.SH
  	$(MINIPERL) make_patchnum.pl
 =20
  # make sure that we recompile perl.c if the git version changes
-@@ -552,8 +552,8 @@ perl$(OBJ_EXT): git_version.h
+@@ -588,8 +588,8 @@ perl$(OBJ_EXT): git_version.h
  # loading, we need to build perl first.
- case "$usedl" in
- define)
+ case "$usedl$static_cwd" in
+ defineundef)
 -    util_deps=3D'$(MINIPERL_EXE) $(CONFIGPM) lib/auto/Cwd/Cwd$(DLSUFFIX) =
FORCE'
--     x2p_deps=3D'$(MINIPERL_EXE) $(CONFIGPM) $(dynamic_ext) FORCE'
+-     x2p_deps=3D"\$(MINIPERL_EXE) \$(CONFIGPM) \$(dynamic_ext) x2p/$first=
makefile FORCE"
 +    util_deps=3D'$(CONFIGPM) lib/auto/Cwd/Cwd$(DLSUFFIX) FORCE'
-+     x2p_deps=3D'$(CONFIGPM) $(dynamic_ext) FORCE'
++     x2p_deps=3D"\$(CONFIGPM) \$(dynamic_ext) x2p/$firstmakefile FORCE"
      ;;
- *)  util_deps=3D'$(PERL_EXE) $(CONFIGPM) FORCE'
-      x2p_deps=3D'$(PERL_EXE) $(CONFIGPM) FORCE'
-@@ -627,7 +627,7 @@ generate_uudmap$(HOST_EXE_EXT): generate
- miniperlmain$(OBJ_EXT): miniperlmain.c patchlevel.h
- 	$(CCCMD) $(PLDLFLAGS) $*.c
-=20
--perlmain.c: $(MINIPERL_EXE) lib/ExtUtils/Miniperl.pm
-+perlmain.c: lib/ExtUtils/Miniperl.pm
- 	$(MINIPERL) -Ilib -MExtUtils::Miniperl -e 'writemain(@ARGV)' DynaLoader =
$(static_ext) > perlmain.c
-=20
- perlmain$(OBJ_EXT): perlmain.c
-@@ -691,7 +691,7 @@ PERLEXPORT		=3D perl.exp
+ definedefine)
+     util_deps=3D'$(PERL_EXE) $(CONFIGPM) FORCE'
+@@ -613,7 +613,7 @@ x2p/s2p: $x2p_deps
+ x2p/find2perl: $x2p_deps
+ 	cd x2p; \$(LDLIBPTH) \$(MAKE) find2perl
+=20
+-utils/Makefile: \$(MINIPERL_EXE) \$(CONFIGPM) utils/Makefile.PL
++utils/Makefile: \$(CONFIGPM) utils/Makefile.PL
+ 	\$(MINIPERL) -Ilib utils/Makefile.PL
+=20
+ utilities:	utils/Makefile $util_deps
+@@ -708,7 +708,7 @@ esac
+=20
+=20
+ $spitshell >>$Makefile <<'!NO!SUBS!'
+-perlmain.c: $(MINIPERL_EXE) ext/ExtUtils-Miniperl/pm_to_blib
++perlmain.c: ext/ExtUtils-Miniperl/lib/ExtUtils/Miniperl.pm
+ 	$(MINIPERL) -Ilib -MExtUtils::Miniperl -e 'writemain(\"perlmain.c", @ARG=
V)' DynaLoader $(static_ext)
+=20
+ # The file ext.libs is a list of libraries that must be linked in
+@@ -769,7 +769,7 @@ PERLEXPORT		=3D perl.exp
  	;;
  	esac
  	$spitshell >>$Makefile <<'!NO!SUBS!'
--perl.exp: $(MINIPERLEXP) makedef.pl config.sh $(SYM) $(SYMH)
-+perl.exp: makedef.pl config.sh $(SYM) $(SYMH)
- 	./$(MINIPERLEXP) makedef.pl PLATFORM=3Daix CC_FLAGS=3D"$(OPTIMIZE)" | so=
rt -u | sort -f > perl.exp
+-perl.exp: $(MINIPERLEXP) makedef.pl $(CONFIGPM) $(SYM) $(SYMH)
++perl.exp: makedef.pl $(CONFIGPM) $(SYM) $(SYMH)
+ 	./$(MINIPERLEXP) makedef.pl --sort-fold PLATFORM=3Daix CC_FLAGS=3D"$(OPT=
IMIZE)" > perl.exp
 =20
  !NO!SUBS!
-@@ -700,7 +700,7 @@ os2)
+@@ -778,7 +778,7 @@ os2)
  	$spitshell >>$Makefile <<'!NO!SUBS!'
  MINIPERLEXP		=3D miniperl
 =20
--perl5.def: $(MINIPERLEXP) makedef.pl config.sh $(SYM) $(SYMH) miniperl.ma=
p
-+perl5.def:  makedef.pl config.sh $(SYM) $(SYMH) miniperl.map
+-perl5.def: $(MINIPERLEXP) makedef.pl $(CONFIGPM) $(SYM) $(SYMH) miniperl.=
map
++perl5.def: makedef.pl $(CONFIGPM) $(SYM) $(SYMH) miniperl.map
  	./$(MINIPERLEXP) makedef.pl PLATFORM=3Dos2 -DPERL_DLL=3D$(PERL_DLL) CC_F=
LAGS=3D"$(OPTIMIZE)" > perl5.def
 =20
  !NO!SUBS!
-@@ -757,7 +757,7 @@ $(LIBPERL): $& $(obj) $(DYNALOADER) $(LI
+@@ -838,7 +838,7 @@ $(LIBPERL): $& $(obj) $(DYNALOADER) $(LIBPERLEXPORT)
  	true)
  		$spitshell >>$Makefile <<'!NO!SUBS!'
  	rm -f $@
@@ -122,52 +147,62 @@ Index: perl-5.14.2/Makefile.SH
  !NO!SUBS!
  		case "$osname" in
  		aix)
-@@ -798,7 +798,9 @@ $(MINIPERL_EXE): $& miniperlmain$(OBJ_EX
- 	$(CC) -o $(MINIPERL_EXE) $(CLDFLAGS) \
- 	    $(mini_obj) \
- 	    miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) perlmini$(OBJ_EXT) $(libs)
--	$(LDLIBPTH) $(RUN) ./miniperl$(HOST_EXE_EXT) -w -Ilib -MExporter -e '<?>=
' || $(MAKE) minitest
+@@ -886,7 +886,9 @@ $(MINIPERL_EXE): lib/buildcustomize.pl
+ 		$spitshell >>$Makefile <<'!NO!SUBS!'
+ lib/buildcustomize.pl: $& $(mini_obj)
+ 	$(CC) -o $(MINIPERL_EXE) $(CLDFLAGS) $(mini_obj) $(libs)
+-	$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MExp=
orter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run mak=
e minitest; exit 1'
 +	mv -f miniperl miniperl-target
 +	ln -s hostperl miniperl
-+#	$(LDLIBPTH) $(RUN) ./miniperl$(HOST_EXE_EXT) -w -Ilib -MExporter -e '<?=
>' || $(MAKE) minitest
++	#$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MEx=
porter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run ma=
ke minitest; exit 1'
+ 	$(MINIPERL) -f write_buildcustomize.pl
  !NO!SUBS!
  		;;
- 	next4*)
-@@ -806,7 +808,9 @@ $(MINIPERL_EXE): $& miniperlmain$(OBJ_EX
- $(MINIPERL_EXE): $& miniperlmain$(OBJ_EXT) $(mini_obj) perlmini$(OBJ_EXT)=
 opmini$(OBJ_EXT)
- 	$(CC) -o $(MINIPERL_EXE) $(mini_obj) \
- 	    miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) perlmini$(OBJ_EXT) $(libs)
--	$(LDLIBPTH) $(RUN) ./miniperl$(HOST_EXE_EXT) -w -Ilib -MExporter -e '<?>=
' || $(MAKE) minitest
+@@ -894,7 +896,9 @@ lib/buildcustomize.pl: $& $(mini_obj)
+ 		$spitshell >>$Makefile <<'!NO!SUBS!'
+ lib/buildcustomize.pl: $& $(mini_obj) write    ldcustomize.pl
+ 	$(CC) -o $(MINIPERL_EXE) $(mini_obj    libs)
+-	$(LDLIBPTH) ./miniperl$(HOST    _EXT) -w -Ilib -Idist/Exporter/lib -MExp=
orter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run mak=
e minitest; exit 1'
 +	mv -f miniperl miniperl-target
 +	ln -s hostperl miniperl
-+#	$(LDLIBPTH) $(RUN) ./miniperl$(HOST_EXE_EXT) -w -Ilib -MExporter -e '<?=
>' || $(MAKE) minitest
++	#$(LDLIBPTH) ./miniperl$(HOST    _EXT) -w -Ilib -Idist/Exporter/lib -MEx=
porter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run ma=
ke minitest; exit 1'
+ 	$(MINIPERL) -f write_buildcustomize.pl   =20
  !NO!SUBS!
  		;;
- 	darwin*)
-@@ -828,7 +832,9 @@ $(MINIPERL_EXE): $& miniperlmain$(OBJ_EX
+@@ -916,7 +920,9 @@ lib/buildcustomize.pl: $& $(mini_obj) write_buildcusto=
mize.pl
+ 	-@rm -f miniperl.xok
  	$(CC) $(CLDFLAGS) $(NAMESPACEFLAGS) -o $(MINIPERL_EXE) \
- 	    $(mini_obj) \
- 	    miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) perlmini$(OBJ_EXT) $(libs)
--	$(LDLIBPTH) $(RUN) ./miniperl$(HOST_EXE_EXT) -w -Ilib -MExporter -e '<?>=
' || $(MAKE) minitest
+ 	    $(mini_obj) $(libs)
+-	$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MExp=
orter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run mak=
e minitest; exit 1'
 +	mv -f miniperl miniperl-target
 +	ln -s hostperl miniperl
-+#	$(LDLIBPTH) $(RUN) ./miniperl$(HOST_EXE_EXT) -w -Ilib -MExporter -e '<?=
>' || $(MAKE) minitest
++	#$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MEx=
porter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run ma=
ke minitest; exit 1'
+ 	$(MINIPERL) -f write_buildcustomize.pl
  !NO!SUBS!
  		;;
- 	*)
-@@ -838,7 +844,10 @@ $(MINIPERL_EXE): $& miniperlmain$(OBJ_EX
- 	$(LDLIBPTH) $(CC) $(CLDFLAGS) -o $(MINIPERL_EXE) \
- 	    $(mini_obj) \
- 	    miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) perlmini$(OBJ_EXT) $(libs)
--	$(LDLIBPTH) $(RUN) ./miniperl$(HOST_EXE_EXT) -w -Ilib -MExporter -e '<?>=
' || $(MAKE) minitest
-+
+@@ -927,7 +933,9 @@ lib/buildcustomize.pl: \$& \$(mini_obj) write_buildcus=
tomize.pl
+ 	-@rm -f miniperl.xok
+ 	-@rm \$(MINIPERL_EXE)
+ 	\$(LNS) \$(HOST_PERL) \$(MINIPERL_EXE)
+-	\$(LDLIBPTH) ./miniperl\$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -ME=
xporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run m=
ake minitest; exit 1'
++	mv -f miniperl miniperl-target
++	ln -s hostperl miniperl
++	#\$(LDLIBPTH) ./miniperl\$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -M=
Exporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run =
make minitest; exit 1'
+ 	\$(MINIPERL) -f write_buildcustomize.pl 'osname' "$osname"
+ !GROK!THIS!
+ 		else
+@@ -936,7 +944,9 @@ lib/buildcustomize.pl: $& $(mini_obj) write_buildcusto=
mize.pl
+ 	-@rm -f miniperl.xok
+ 	$(CC) $(CLDFLAGS) -o $(MINIPERL_EXE) \
+ 	    $(mini_obj) $(libs)
+-	$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MExp=
orter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run mak=
e minitest; exit 1'
 +	mv -f miniperl miniperl-target
 +	ln -s hostperl miniperl
-+#	$(LDLIBPTH) $(RUN) ./miniperl$(HOST_EXE_EXT) -w -Ilib -MExporter -e '<?=
>' || $(MAKE) minitest
++	#$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MEx=
porter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run ma=
ke minitest; exit 1'
+ 	$(MINIPERL) -f write_buildcustomize.pl
  !NO!SUBS!
- 		;;
- 	esac
-@@ -960,7 +969,7 @@ case "${osname}" in
+ 		fi
+@@ -967,7 +977,7 @@ case "${osname}" in
  catamount)
  $spitshell >>$Makefile <<!GROK!THIS!
  .PHONY: makeppport
@@ -176,16 +211,16 @@ Index: perl-5.14.2/Makefile.SH
  	-@for f in Makefile.PL PPPort_pm.PL PPPort_xs.PL ppport_h.PL; do \
  	(cd ext/Devel-PPPort && `pwd`/run.sh ../../$(MINIPERL_EXE) -I../../lib \=
$\$f); \
  	done
-@@ -970,7 +979,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM
+@@ -977,7 +987,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM)
  *)
  $spitshell >>$Makefile <<'!NO!SUBS!'
  .PHONY: makeppport
 -makeppport: $(MINIPERL_EXE) $(CONFIGPM) $(nonxs_ext)
 +makeppport: $(CONFIGPM) $(nonxs_ext)
- 	$(MINIPERL) $(Icwd) mkppport
+ 	$(MINIPERL) mkppport
 =20
  !NO!SUBS!
-@@ -980,22 +989,22 @@ esac
+@@ -987,16 +997,16 @@ esac
  $spitshell >>$Makefile <<'!NO!SUBS!'
 =20
  .PHONY: preplibrary
@@ -198,29 +233,21 @@ Index: perl-5.14.2/Makefile.SH
 +$(CONFIGPOD): config.sh configpm Porting/Glossary lib/Config_git.pl
  	$(MINIPERL) configpm
 =20
--lib/ExtUtils/Miniperl.pm: miniperlmain.c $(MINIPERL_EXE) minimod.pl $(CON=
FIGPM)
-+lib/ExtUtils/Miniperl.pm: miniperlmain.c minimod.pl $(CONFIGPM)
- 	$(MINIPERL) minimod.pl > lib/ExtUtils/Miniperl.pm
-=20
--lib/buildcustomize.pl: $(MINIPERL_EXE) write_buildcustomize.pl
-+lib/buildcustomize.pl: write_buildcustomize.pl
- 	$(MINIPERL) write_buildcustomize.pl >lib/buildcustomize.pl
-=20
  unidatafiles $(unidatafiles) pod/perluniprops.pod: uni.data
 =20
 -uni.data: $(MINIPERL_EXE) $(CONFIGPM) lib/unicore/mktables $(nonxs_ext)
 +uni.data: $(CONFIGPM) lib/unicore/mktables $(nonxs_ext)
- 	$(MINIPERL) $(Icwd) lib/unicore/mktables -C lib/unicore -P pod -maketest=
 -makelist -p
+ 	$(MINIPERL) lib/unicore/mktables -C lib/unicore -P pod -maketest -makeli=
st -p
  #	Commented out so always runs, mktables looks at far more files than we
  #	can in this makefile to decide if needs to run or not
-@@ -1004,21 +1013,21 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) li
- # $(PERL_EXE) and ext because buildtoc uses Text::Wrap uses re
+@@ -1005,22 +1015,22 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) lib/unicore/=
mktables $(nonxs_ext)
+ # $(PERL_EXE) and ext because pod_lib.pl needs Digest::MD5
  # But also this ensures that all extensions are built before we try to sc=
an
  # them, which picks up Devel::PPPort's documentation.
 -pod/perltoc.pod: $(perltoc_pod_prereqs)  $(PERL_EXE) $(ext) pod/buildtoc
--	$(RUN_PERL) -f -Ilib pod/buildtoc --build-toc -q
-+pod/perltoc.pod: $(perltoc_pod_prereqs)  $(ext) pod/buildtoc
-+	$(MINIPERL) -f -Ilib pod/buildtoc --build-toc -q
+-	$(RUN_PERL) -f pod/buildtoc -q
++pod/perltoc.pod: $(perltoc_pod_prereqs) $(ext) pod/buildtoc
++	$(MINIPERL) -f pod/buildtoc -q
 =20
  pod/perlapi.pod: pod/perlintern.pod
 =20
@@ -230,22 +257,36 @@ Index: perl-5.14.2/Makefile.SH
 =20
 -pod/perlmodlib.pod: $(MINIPERL_EXE) pod/perlmodlib.PL MANIFEST
 +pod/perlmodlib.pod: pod/perlmodlib.PL MANIFEST
- 	$(MINIPERL) $(Icwd) pod/perlmodlib.PL -q
+ 	$(MINIPERL) pod/perlmodlib.PL -q
 =20
- pod/perl5143delta.pod: pod/perldelta.pod
- 	$(LNS) perldelta.pod pod/perl5143delta.pod
+ pod/perl5200delta.pod: pod/perldelta.pod
+ 	$(RMS) pod/perl5200delta.pod
+ 	$(LNS) perldelta.pod pod/perl5200delta.pod
 =20
 -extra.pods: $(MINIPERL_EXE)
-+extra.pods:=20
++extra.pods:
  	-@test ! -f extra.pods || rm -f `cat extra.pods`
  	-@rm -f extra.pods
  	-@for x in `grep -l '^=3D[a-z]' README.* | grep -v README.vms` ; do \
-@@ -1058,11 +1067,7 @@ no-install:
- INSTALL_DEPENDENCE =3D all
+@@ -1075,11 +1085,7 @@ done
+ if test "X$hostperl" !=3D X; then
+ 	$spitshell >>$Makefile <<'!NO!SUBS!'
+ install.perl:	$(INSTALL_DEPENDENCE) installperl
+-	$(HOST_PERL) installperl --destdir=3D$(DESTDIR) $(INSTALLFLAGS) $(STRIPF=
LAGS)
+-	-@test ! -s extras.lst || $(MAKE) extras.install
+-
+-install.man:	all installman
+-	$(HOST_PERL) installman --destdir=3D$(DESTDIR) $(INSTALLFLAGS)
++	./hostperl -Ifake_config_library -Ilib -MConfig installperl --destdir=3D=
$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
 =20
+ # XXX Experimental. Hardwired values, but useful for testing.
+ # Eventually Configure could ask for some of these values.
+@@ -1097,11 +1103,7 @@ install.html: all installhtml
+ else
+ 	$spitshell >>$Makefile <<'!NO!SUBS!'
  install.perl:	$(INSTALL_DEPENDENCE) installperl
 -	$(RUN_PERL) installperl --destdir=3D$(DESTDIR) $(INSTALLFLAGS) $(STRIPFL=
AGS)
--	-@test ! -s extras.lst || $(MAKE) extras.install
+-	-@test ! -s extras.lst || PATH=3D"`pwd`:\${PATH}" PERL5LIB=3D"`pwd`/lib"=
 \$(RUN_PERL) -Ilib -MCPAN -e '@ARGV&&install(@ARGV)' `cat extras.lst`
 -
 -install.man:	all installman
 -	$(RUN_PERL) installman --destdir=3D$(DESTDIR) $(INSTALLFLAGS)
@@ -253,16 +294,16 @@ Index: perl-5.14.2/Makefile.SH
 =20
  # XXX Experimental. Hardwired values, but useful for testing.
  # Eventually Configure could ask for some of these values.
-@@ -1161,16 +1166,16 @@ manicheck:	FORCE
+@@ -1206,16 +1208,16 @@ manicheck:	FORCE
  #
  # DynaLoader may be needed for extensions that use Makefile.PL.
 =20
 -$(DYNALOADER):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary FORCE $(=
nonxs_ext)
-+$(DYNALOADER):	lib/buildcustomize.pl preplibrary FORCE $(nonxs_ext)
++$(DYNALOADER): lib/buildcustomize.pl preplibrary FORCE $(nonxs_ext)
  	$(MINIPERL) make_ext.pl $@ MAKE=3D$(MAKE) LIBPERL_A=3D$(LIBPERL) LINKTYP=
E=3Dstatic $(STATIC_LDFLAGS)
 =20
--d_dummy $(dynamic_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary=
 makeppport $(DYNALOADER) FORCE $(PERLEXPORT)
-+d_dummy $(dynamic_ext):	lib/buildcustomize.pl preplibrary makeppport $(DY=
NALOADER) FORCE $(PERLEXPORT)
+-d_dummy $(dynamic_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary=
 makeppport $(DYNALOADER) FORCE $(PERLEXPORT) $(LIBPERL)
++d_dummy $(dynamic_ext):	lib/buildcustomize.pl preplibrary makeppport $(DY=
NALOADER) FORCE $(PERLEXPORT) $(LIBPERL)
  	$(MINIPERL) make_ext.pl $@ MAKE=3D$(MAKE) LIBPERL_A=3D$(LIBPERL) LINKTYP=
E=3Ddynamic
 =20
 -s_dummy $(static_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary =
makeppport $(DYNALOADER) FORCE
@@ -274,25 +315,42 @@ Index: perl-5.14.2/Makefile.SH
  	$(MINIPERL) make_ext.pl $@ MAKE=3D$(MAKE) LIBPERL_A=3D$(LIBPERL)
  !NO!SUBS!
 =20
-@@ -1365,10 +1370,10 @@ _test:
-=20
- test_prep_pre: preplibrary utilities $(nonxs_ext)
+@@ -1409,7 +1411,7 @@ test_prep_pre: preplibrary utilities $(nonxs_ext)
 =20
--test_prep: test_prep_pre $(MINIPERL_EXE) $(unidatafiles) $(PERL_EXE) $(dy=
namic_ext) $(TEST_PERL_DLL) runtests x2p/s2p $(generated_pods)
-+test_prep: test_prep_pre $(unidatafiles) $(PERL_EXE) $(dynamic_ext) $(TES=
T_PERL_DLL) runtests x2p/s2p $(generated_pods)
+ case "$targethost" in
+ '') $spitshell >>$Makefile <<'!NO!SUBS!'
+-test_prep test-prep: test_prep_pre $(MINIPERL_EXE) $(unidatafiles) $(PERL=
_EXE) \
++test_prep test-prep: test_prep_pre $(unidatafiles) $(PERL_EXE) \
+ 	$(dynamic_ext) $(TEST_PERL_DLL) runtests x2p/s2p x2p/find2perl \
+ 	$(generated_pods)
  	cd t && (rm -f $(PERL_EXE); $(LNS) ../$(PERL_EXE) $(PERL_EXE))
+@@ -1417,7 +1419,7 @@ test_prep test-prep: test_prep_pre $(MINIPERL_EXE) $=
(unidatafiles) $(PERL_EXE) \
+ !NO!SUBS!
+ ;;
+ *) $spitshell >>$Makefile <<!GROK!THIS!
+-test_prep test-prep: test_prep_pre \$(MINIPERL_EXE) \$(unidatafiles) \$(P=
ERL_EXE) \
++test_prep test-prep: test_prep_pre \$(unidatafiles) \$(PERL_EXE) \
+ 	\$(dynamic_ext) \$(TEST_PERL_DLL) runtests x2p/s2p x2p/find2perl \
+ 	\$(generated_pods)
+ 	$to libperl.*
+@@ -1469,7 +1471,7 @@ test_prep test-prep: test_prep_pre \$(MINIPERL_EXE) =
\$(unidatafiles) \$(PERL_EXE
+ esac
 =20
+ $spitshell >>$Makefile <<'!NO!SUBS!'
 -test_prep_reonly: $(MINIPERL_EXE) $(PERL_EXE) $(dynamic_ext_re) $(TEST_PE=
RL_DLL)
 +test_prep_reonly: $(PERL_EXE) $(dynamic_ext_re) $(TEST_PERL_DLL)
  	$(MINIPERL) make_ext.pl $(dynamic_ext_re) MAKE=3D$(MAKE) LIBPERL_A=3D$(L=
IBPERL) LINKTYPE=3Ddynamic
  	cd t && (rm -f $(PERL_EXE); $(LNS) ../$(PERL_EXE) $(PERL_EXE))
-=20
-@@ -1459,7 +1464,7 @@ minitest.prep:
+ !NO!SUBS!
+@@ -1520,7 +1522,7 @@ $spitshell >>$Makefile <<'!NO!SUBS!'
 =20
  # Can't depend on lib/Config.pm because that might be where miniperl
  # is crashing.
--minitest: $(MINIPERL_EXE) minitest.prep
-+minitest: minitest.prep
- 	- cd t && (rm -f $(PERL_EXE); $(LNS) ../$(MINIPERL_EXE) $(PERL_EXE)) \
- 		&& $(RUN_PERL) TEST base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t op/=
*.t uni/*.t </dev/tty
-=20
+-minitest: $(MINIPERL_EXE)
++minitest:
+ 	-@test -f lib/Config.pm || $(MAKE) lib/Config.pm $(unidatafiles)
+ 	@echo " "
+ 	@echo "You may see some irrelevant test failures if you have been unable=
"
+--=20
+1.8.1.2
+
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/Makefile.patch b/meta/r=
ecipes-devtools/perl/perl-5.20.0/Makefile.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/Makefile.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/Makefile.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/config.sh b/meta/recipe=
s-devtools/perl/perl-5.20.0/config.sh
similarity index 77%
rename from meta/recipes-devtools/perl/perl-5.14.3/config.sh
rename to meta/recipes-devtools/perl/perl-5.20.0/config.sh
index 68dcfa9..2532c8d 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/config.sh
+++ b/meta/recipes-devtools/perl/perl-5.20.0/config.sh
@@ -8,13 +8,13 @@
=20
 # Package name      : perl5
 # Source directory  : .
-# Configuration time: Thu Dec 23 03:57:51 UTC 2010
+# Configuration time: Tue Jun 24 03:00:02 UTC 2014
 # Configured by     : Open Embedded
-# Target system     : linux qemux86 2.6.37-rc5-yocto-standard+ #1 preempt =
mon dec 20 14:21:27 pst 2010 i686 gnulinux=20
+# Target system     : linux qemuarm 3.14.5-yocto-standard #1 preempt mon j=
un 23 19:42:18 cst 2014 armv5tejl gnulinux=20
=20
 : Configure command line arguments.
 config_arg0=3D'Configure'
-config_args=3D'-des -Doptimize=3D-O2 -Dmyhostname=3Dlocalhost -Dperladmin=
=3Droot@localhost -Dcc=3Dgcc -Dcf_by=3DOpen Embedded -Dinstallprefix=3D@EXE=
CPREFIX@ -Dprefix=3D@EXECPREFIX@ -Dvendorprefix=3D@EXECPREFIX@ -Dsiteprefix=
=3D@EXECPREFIX@ -Dotherlibdirs=3D@LIBDIR@/perl/5.14.3 -Duseshrplib -Dusethr=
eads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_n=
dbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3D3pm -Duseperlio -Dinstallusr=
binperl -Ubincompat5005 -Uversiononly -Dpager=3D/usr/bin/less -isr'
+config_args=3D'-des -Doptimize=3D-O2 -Dmyhostname=3Dlocalhost -Dperladmin=
=3Droot@localhost -Dcc=3Dgcc -Dcf_by=3DOpen Embedded -Dinstallprefix=3D@EXE=
CPREFIX@ -Dprefix=3D@EXECPREFIX@ -Dvendorprefix=3D@EXECPREFIX@ -Dsiteprefix=
=3D@EXECPREFIX@ -Dotherlibdirs=3D@LIBDIR@/perl/5.20.0 -Duseshrplib -Dusethr=
eads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_n=
dbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3D3pm -Duseperlio -Dinstallusr=
binperl -Ubincompat5005 -Uversiononly -Dpager=3D/usr/bin/less -isr'
 config_argc=3D28
 config_arg1=3D'-des'
 config_arg2=3D'-Doptimize=3D-O2'
@@ -26,7 +26,7 @@ config_arg7=3D'-Dinstallprefix=3D@EXECPREFIX@'
 config_arg8=3D'-Dprefix=3D@EXECPREFIX@'
 config_arg9=3D'-Dvendorprefix=3D@EXECPREFIX@'
 config_arg10=3D'-Dsiteprefix=3D@EXECPREFIX@'
-config_arg11=3D'-Dotherlibdirs=3D@LIBDIR@/perl/5.14.3'
+config_arg11=3D'-Dotherlibdirs=3D@LIBDIR@/perl/5.20.0'
 config_arg12=3D'-Duseshrplib'
 config_arg13=3D'-Dusethreads'
 config_arg14=3D'-Duseithreads'
@@ -67,9 +67,9 @@ api_subversion=3D'0'
 api_version=3D'14'
 api_versionstring=3D'5.14.0'
 ar=3D'ar'
-archlib=3D'@LIBDIR@/perl/5.14.3/@ARCH@-thread-multi'
-archlibexp=3D'@STAGINGDIR@@LIBDIR@/perl/5.14.3/@ARCH@-thread-multi'
-archlib_exp=3D'@LIBDIR@/perl/5.14.3/@ARCH@-thread-multi'
+archlib=3D'@LIBDIR@/perl/5.20.0/@ARCH@-thread-multi'
+archlibexp=3D'@STAGINGDIR@@LIBDIR@/perl/5.20.0/@ARCH@-thread-multi'
+archlib_exp=3D'@LIBDIR@/perl/5.20.0/@ARCH@-thread-multi'
 archname64=3D''
 archname=3D'@ARCH@-thread-multi'
 archobjs=3D''
@@ -87,7 +87,7 @@ castflags=3D'0'
 cat=3D'cat'
 cc=3D'gcc'
 cccdlflags=3D'-fPIC'
-ccdlflags=3D'-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.14.3/@ARCH@-thread-multi/CO=
RE'
+ccdlflags=3D'-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.20.0/@ARCH@-thread-multi/CO=
RE'
 ccflags=3D'-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-p=
rotector -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64'
 ccflags_uselargefiles=3D'-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64'
 ccname=3D'gcc'
@@ -576,7 +576,7 @@ doublesize=3D'8'
 drand01=3D'drand48()'
 drand48_r_proto=3D'REENTRANT_PROTO_I_ST'
 dtrace=3D''
-dynamic_ext=3D'B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper Deve=
l/DProf Devel/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl File/Glo=
b Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/SysV =
List/Util MIME/Base64 Math/BigInt/FastCalc Opcode POSIX PerlIO/encoding Per=
lIO/scalar PerlIO/via GDBM_File SDBM_File Socket Storable Sys/Hostname Sys/=
Syslog Text/Soundex Time/HiRes Time/Piece Unicode/Normalize XS/APItest XS/A=
PItest/KeywordRPN XS/Typemap attributes mro re threads threads/shared'
+dynamic_ext=3D'B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper Deve=
l/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl File/DosGlob File/Gl=
ob Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/SysV=
 List/Util MIME/Base64 Math/BigInt/FastCalc Opcode POSIX PerlIO/encoding Pe=
rlIO/mmap PerlIO/scalar PerlIO/via SDBM_File Socket Storable Sys/Hostname S=
ys/Syslog Tie/Hash/NamedCapture Time/HiRes Time/Piece Unicode/Collate Unico=
de/Normalize XS/APItest XS/Typemap arybase attributes mro re threads thread=
s/shared'
 eagain=3D'EAGAIN'
 ebcdic=3D'undef'
 echo=3D'echo'
@@ -591,7 +591,7 @@ endservent_r_proto=3D'0'
 eunicefix=3D':'
 exe_ext=3D''
 expr=3D'expr'
-extensions=3D'B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper Devel=
/DProf Devel/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl File/Glob=
 Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/SysV L=
ist/Util MIME/Base64 Math/BigInt/FastCalc Opcode POSIX PerlIO/encoding Perl=
IO/scalar PerlIO/via GDBM_File SDBM_File Socket Storable Sys/Hostname Sys/S=
yslog Text/Soundex Time/HiRes Time/Piece Unicode/Normalize XS/APItest XS/AP=
Itest/KeywordRPN XS/Typemap attributes mro re threads threads/shared Archiv=
e/Extract Archive/Tar Attribute/Handlers AutoLoader B/Debug B/Deparse B/Lin=
t CGI CPAN CPANPLUS CPANPLUS/Dist/Build Class/ISA Devel/SelfStubber Digest =
Errno ExtUtils/CBuilder ExtUtils/Command ExtUtils/Constant ExtUtils/Install=
 ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/ParseXS File/Fetch File/Path=
 File/Temp FileCache Filter/Simple Getopt/Long I18N/LangTags IO/Compress IO=
/Zlib IPC/Cmd IPC/Open2 IPC/Open3 Locale/Codes Locale/Maketext Locale/Maket=
ext/Simple Log/Message Log/Message/Simple Math/BigInt Math/BigRat Math/Comp=
lex Memoize Module/Build Module/CoreList Module/Load Module/Load/Conditiona=
l Module/Loaded Module/Pluggable NEXT Net/Ping Object/Accessor Package/Cons=
tants Params/Check Parse/CPAN/Meta PerlIO/via/QuotedPrint Pod/Escapes Pod/L=
aTeX Pod/Parser Pod/Perldoc Pod/Plainer Pod/Simple Safe SelfLoader Shell Sw=
itch Term/ANSIColor Term/Cap Term/UI Test Test/Harness Test/Simple Text/Bal=
anced Text/ParseWords Text/Tabs Thread/Queue Thread/Semaphore Tie/File Tie/=
Memoize Tie/RefHash Time/Local Unicode/Collate XSLoader autodie autouse bas=
e bignum constant encoding/warnings if lib libnet parent podlators'
+extensions=3D'B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper Devel=
/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl File/DosGlob File/Glo=
b Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/SysV =
List/Util MIME/Base64 Math/BigInt/FastCalc Opcode POSIX PerlIO/encoding Per=
lIO/mmap PerlIO/scalar PerlIO/via SDBM_File Socket Storable Sys/Hostname Sy=
s/Syslog Tie/Hash/NamedCapture Time/HiRes Time/Piece Unicode/Collate Unicod=
e/Normalize XS/APItest XS/Typemap arybase attributes mro re threads threads=
/shared Archive/Tar Attribute/Handlers AutoLoader B/Debug CGI CPAN CPAN/Met=
a CPAN/Meta/Requirements CPAN/Meta/YAML Carp Config/Perl/V Devel/SelfStubbe=
r Digest Dumpvalue Env Errno Exporter ExtUtils/CBuilder ExtUtils/Command Ex=
tUtils/Constant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUt=
ils/Miniperl ExtUtils/ParseXS File/Fetch File/Find File/Path File/Temp File=
Cache Filter/Simple Getopt/Long HTTP/Tiny I18N/Collate I18N/LangTags IO/Com=
press IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 JSON/PP Locale/Codes Locale/Ma=
ketext Locale/Maketext/Simple Math/BigInt Math/BigRat Math/Complex Memoize =
Module/Build Module/CoreList Module/Load Module/Load/Conditional Module/Loa=
ded Module/Metadata NEXT Net/Ping Package/Constants Params/Check Parse/CPAN=
/Meta Perl/OSType PerlIO/via/QuotedPrint Pod/Checker Pod/Escapes Pod/Functi=
ons Pod/Html Pod/Parser Pod/Perldoc Pod/Simple Pod/Usage Safe Search/Dict S=
elfLoader Term/ANSIColor Term/Cap Term/Complete Term/ReadLine Test Test/Har=
ness Test/Simple Text/Abbrev Text/Balanced Text/ParseWords Text/Tabs Thread=
/Queue Thread/Semaphore Tie/File Tie/Memoize Tie/RefHash Time/Local XSLoade=
r autodie autouse base bignum constant encoding/warnings experimental if li=
b libnet parent perlfaq podlators version'
 extern_C=3D'extern'
 extras=3D''
 fflushNULL=3D'define'
@@ -608,7 +608,7 @@ full_csh=3D'csh'
 full_sed=3D'sed'
 gccansipedantic=3D''
 gccosandvers=3D''
-gccversion=3D'4.5.1'
+gccversion=3D'4.9.0'
 getgrent_r_proto=3D'REENTRANT_PROTO_I_SBWR'
 getgrgid_r_proto=3D'REENTRANT_PROTO_I_TSBWR'
 getgrnam_r_proto=3D'REENTRANT_PROTO_I_CSBWR'
@@ -635,7 +635,7 @@ gidtype=3D'gid_t'
 glibpth=3D'@EXECPREFIX@/shlib @BASELIBDIR@ @LIBDIR@ @LIBDIR@/386 @BASELIBD=
IR@/386 @EXECPREFIX@/ccs/lib @EXECPREFIX@/ucblib @EXECPREFIX@/local/lib '
 gmake=3D'gmake'
 gmtime_r_proto=3D'REENTRANT_PROTO_S_TS'
-gnulibc_version=3D'2.12.1'
+gnulibc_version=3D'2.19'
 grep=3D'grep'
 groupcat=3D'cat /etc/group'
 groupstype=3D'gid_t'
@@ -747,7 +747,7 @@ inc_version_list_init=3D'0'
 incpath=3D''
 inews=3D''
 initialinstalllocation=3D'@USRBIN@'
-installarchlib=3D'@LIBDIR@/perl/5.14.3/@ARCH@-thread-multi'
+installarchlib=3D'@LIBDIR@/perl/5.20.0/@ARCH@-thread-multi'
 installbin=3D'@USRBIN@'
 installhtml1dir=3D''
 installhtml3dir=3D''
@@ -755,23 +755,23 @@ installman1dir=3D''
 installman3dir=3D''
 installprefix=3D'@EXECPREFIX@'
 installprefixexp=3D'@EXECPREFIX@'
-installprivlib=3D'@LIBDIR@/perl/5.14.3'
+installprivlib=3D'@LIBDIR@/perl/5.20.0'
 installscript=3D'@USRBIN@'
-installsitearch=3D'@LIBDIR@/perl/site_perl/5.14.3/@ARCH@-thread-multi'
+installsitearch=3D'@LIBDIR@/perl/site_perl/5.20.0/@ARCH@-thread-multi'
 installsitebin=3D'@USRBIN@'
 installsitehtml1dir=3D''
 installsitehtml3dir=3D''
-installsitelib=3D'@LIBDIR@/perl/site_perl/5.14.3'
+installsitelib=3D'@LIBDIR@/perl/site_perl/5.20.0'
 installsiteman1dir=3D''
 installsiteman3dir=3D''
 installsitescript=3D'@USRBIN@'
 installstyle=3D'lib/perl'
 installusrbinperl=3D'define'
-installvendorarch=3D'@LIBDIR@/perl/vendor_perl/5.14.3/@ARCH@-thread-multi'
+installvendorarch=3D'@LIBDIR@/perl/vendor_perl/5.20.0/@ARCH@-thread-multi'
 installvendorbin=3D'@USRBIN@'
 installvendorhtml1dir=3D''
 installvendorhtml3dir=3D''
-installvendorlib=3D'@LIBDIR@/perl/vendor_perl/5.14.3'
+installvendorlib=3D'@LIBDIR@/perl/vendor_perl/5.20.0'
 installvendorman1dir=3D''
 installvendorman3dir=3D''
 installvendorscript=3D'@USRBIN@'
@@ -779,7 +779,7 @@ intsize=3D'4'
 issymlink=3D'test -h'
 ivdformat=3D'"ld"'
 ivtype=3D'long'
-known_extensions=3D'B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd DB_File Dat=
a/Dumper Devel/DProf Devel/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode F=
cntl File/Glob Filter/Util/Call GDBM_File Hash/Util Hash/Util/FieldHash I18=
N/Langinfo IO IPC/SysV List/Util MIME/Base64 Math/BigInt/FastCalc NDBM_File=
 ODBM_File Opcode POSIX PerlIO/encoding PerlIO/scalar PerlIO/via SDBM_File =
Socket Storable Sys/Hostname Sys/Syslog Text/Soundex Time/HiRes Time/Piece =
Unicode/Normalize VMS/DCLsym VMS/Stdio Win32 Win32API/File Win32CORE XS/API=
test XS/APItest/KeywordRPN XS/Typemap attributes mro re threads threads/sha=
red '
+known_extensions=3D'Archive/Tar Attribute/Handlers AutoLoader B B/Debug CG=
I CPAN CPAN/Meta CPAN/Meta/Requirements CPAN/Meta/YAML Carp Compress/Raw/Bz=
ip2 Compress/Raw/Zlib Config/Perl/V Cwd DB_File Data/Dumper Devel/PPPort De=
vel/Peek Devel/SelfStubber Digest Digest/MD5 Digest/SHA Dumpvalue Encode En=
v Errno Exporter ExtUtils/CBuilder ExtUtils/Command ExtUtils/Constant ExtUt=
ils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/Miniperl ExtUtils=
/ParseXS Fcntl File/DosGlob File/Fetch File/Find File/Glob File/Path File/T=
emp FileCache Filter/Simple Filter/Util/Call GDBM_File Getopt/Long HTTP/Tin=
y Hash/Util Hash/Util/FieldHash I18N/Collate I18N/LangTags I18N/Langinfo IO=
 IO/Compress IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 IPC/SysV JSON/PP List/U=
til Locale/Codes Locale/Maketext Locale/Maketext/Simple MIME/Base64 Math/Bi=
gInt Math/BigInt/FastCalc Math/BigRat Math/Complex Memoize Module/Build Mod=
ule/CoreList Module/Load Module/Load/Conditional Module/Loaded Module/Metad=
ata NDBM_File NEXT Net/Ping ODBM_File Opcode POSIX Package/Constants Params=
/Check Parse/CPAN/Meta Perl/OSType PerlIO/encoding PerlIO/mmap PerlIO/scala=
r PerlIO/via PerlIO/via/QuotedPrint Pod/Checker Pod/Escapes Pod/Functions P=
od/Html Pod/Parser Pod/Perldoc Pod/Simple Pod/Usage SDBM_File Safe Search/D=
ict SelfLoader Socket Storable Sys/Hostname Sys/Syslog Term/ANSIColor Term/=
Cap Term/Complete Term/ReadLine Test Test/Harness Test/Simple Text/Abbrev T=
ext/Balanced Text/ParseWords Text/Tabs Thread/Queue Thread/Semaphore Tie/Fi=
le Tie/Hash/NamedCapture Tie/Memoize Tie/RefHash Time/HiRes Time/Local Time=
/Piece Unicode/Collate Unicode/Normalize VMS/DCLsym VMS/Filespec VMS/Stdio =
Win32 Win32API/File Win32CORE XS/APItest XS/Typemap XSLoader arybase attrib=
utes autodie autouse base bignum constant encoding/warnings experimental if=
 lib libnet mro parent perlfaq podlators re threads threads/shared version =
'
 ksh=3D''
 ld=3D'gcc'
 lddlflags=3D'-shared -O2 -fstack-protector'
@@ -788,7 +788,7 @@ ldflags_uselargefiles=3D''
 ldlibpthname=3D'LD_LIBRARY_PATH'
 less=3D'less'
 lib_ext=3D'.a'
-libc=3D'@BASELIBDIR@/libc-2.12.1.so'
+libc=3D'@BASELIBDIR@/libc-2.19.so'
 libperl=3D'libperl.so'
 libpth=3D'@BASELIBDIR@ @LIBDIR@'
 libs=3D'-lnsl -lgdbm -ldb -ldl -lm -lcrypt -lutil -lpthread -lc'
@@ -847,23 +847,7 @@ netdb_net_type=3D'in_addr_t'
 nm=3D'nm'
 nm_opt=3D''
 nm_so_opt=3D'--dynamic'
-nonxs_ext=3D'Archive/Extract Archive/Tar Attribute/Handlers AutoLoader B/D=
ebug \
-B/Deparse B/Lint CGI CPAN CPAN/Meta CPAN/Meta/YAML CPANPLUS CPANPLUS/Dist/=
Build \
-Class/ISA Devel/SelfStubber Digest Dumpvalue Env Errno ExtUtils/CBuilder \
-ExtUtils/Command ExtUtils/Constant ExtUtils/Install ExtUtils/MakeMaker \
-ExtUtils/Manifest ExtUtils/ParseXS File/CheckTree File/Fetch File/Path Fil=
e/Temp \
-FileCache Filter/Simple Getopt/Long HTTP/Tiny I18N/Collate I18N/LangTags \
-IO/Compress IO/Zlib IPC/Cmd IPC/Open2 IPC/Open3 JSON/PP Locale/Codes \
-Locale/Maketext Locale/Maketext/Simple Log/Message Log/Message/Simple \
-Math/BigInt Math/BigRat Math/Complex Memoize Module/Build Module/CoreList =
\
-Module/Load Module/Load/Conditional Module/Loaded Module/Metadata Module/P=
luggable NEXT Net/Ping \
-Object/Accessor Package/Constants Params/Check Parse/CPAN/Meta Perl/OSType=
 \
-PerlIO/via/QuotedPrint Pod/Escapes Pod/Html Pod/LaTeX Pod/Parser Pod/Perld=
oc \
-Pod/Plainer Pod/Simple Safe SelfLoader Shell Switch Term/ANSIColor Term/Ca=
p \
-Term/UI Test Test/Harness Test/Simple Text/Balanced Text/ParseWords Text/T=
abs \
-Thread/Queue Thread/Semaphore Tie/File Tie/Hash/NamedCapture Tie/Memoize \
-Tie/RefHash Time/Local Unicode/Collate Version/Requirements XSLoader autod=
ie \
-autouse base bignum constant encoding/warnings if lib libnet parent podlat=
ors'
+nonxs_ext=3D'Archive/Tar Attribute/Handlers AutoLoader B/Debug CGI CPAN CP=
AN/Meta CPAN/Meta/Requirements CPAN/Meta/YAML Carp Config/Perl/V Devel/Self=
Stubber Digest Dumpvalue Env Errno Exporter ExtUtils/CBuilder ExtUtils/Comm=
and ExtUtils/Constant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest=
 ExtUtils/Miniperl ExtUtils/ParseXS File/Fetch File/Find File/Path File/Tem=
p FileCache Filter/Simple Getopt/Long HTTP/Tiny I18N/Collate I18N/LangTags =
IO/Compress IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 JSON/PP Locale/Codes Loc=
ale/Maketext Locale/Maketext/Simple Math/BigInt Math/BigRat Math/Complex Me=
moize Module/Build Module/CoreList Module/Load Module/Load/Conditional Modu=
le/Loaded Module/Metadata NEXT Net/Ping Package/Constants Params/Check Pars=
e/CPAN/Meta Perl/OSType PerlIO/via/QuotedPrint Pod/Checker Pod/Escapes Pod/=
Functions Pod/Html Pod/Parser Pod/Perldoc Pod/Simple Pod/Usage Safe Search/=
Dict SelfLoader Term/ANSIColor Term/Cap Term/Complete Term/ReadLine Test Te=
st/Harness Test/Simple Text/Abbrev Text/Balanced Text/ParseWords Text/Tabs =
Thread/Queue Thread/Semaphore Tie/File Tie/Memoize Tie/RefHash Time/Local X=
SLoader autodie autouse base bignum constant encoding/warnings experimental=
 if lib libnet parent perlfaq podlators version'
 nroff=3D'nroff'
 nvEUformat=3D'"E"'
 nvFUformat=3D'"F"'
@@ -880,12 +864,12 @@ old_pthread_create_joinable=3D''
 optimize=3D'-O2'
 orderlib=3D'false'
 osname=3D'linux'
-osvers=3D'2.6.37-rc5-yocto-standard+'
-otherlibdirs=3D'@LIBDIR@/perl/5.14.3'
+osvers=3D'3.14.5-yocto-standard'
+otherlibdirs=3D'@LIBDIR@/perl/5.20.0'
 package=3D'perl5'
 pager=3D'/usr/bin/less -isr'
 passcat=3D'cat /etc/passwd'
-patchlevel=3D'14'
+patchlevel=3D'20'
 path_sep=3D':'
 perl5=3D'@USRBIN@/perl'
 perl=3D''
@@ -901,8 +885,8 @@ pmake=3D''
 pr=3D''
 prefix=3D'@EXECPREFIX@'
 prefixexp=3D'@EXECPREFIX@'
-privlib=3D'@LIBDIR@/perl/5.14.3'
-privlibexp=3D'@LIBDIR@/perl/5.14.3'
+privlib=3D'@LIBDIR@/perl/5.20.0'
+privlibexp=3D'@LIBDIR@/perl/5.20.0'
 procselfexe=3D'"/proc/self/exe"'
 prototype=3D'define'
 randbits=3D'48'
@@ -954,17 +938,17 @@ sig_num=3D'0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 1=
7 18 19 20 21 22 23 24 25 26
 sig_num_init=3D'0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, =
17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35,=
 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54=
, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 6, 17, 29, 31, 0'
 sig_size=3D'69'
 signal_t=3D'void'
-sitearch=3D'@LIBDIR@/perl/site_perl/5.14.3/@ARCH@-thread-multi'
-sitearchexp=3D'@LIBDIR@/perl/site_perl/5.14.3/@ARCH@-thread-multi'
+sitearch=3D'@LIBDIR@/perl/site_perl/5.20.0/@ARCH@-thread-multi'
+sitearchexp=3D'@LIBDIR@/perl/site_perl/5.20.0/@ARCH@-thread-multi'
 sitebin=3D'@USRBIN@'
 sitebinexp=3D'@USRBIN@'
 sitehtml1dir=3D''
 sitehtml1direxp=3D''
 sitehtml3dir=3D''
 sitehtml3direxp=3D''
-sitelib=3D'@LIBDIR@/perl/site_perl/5.14.3'
+sitelib=3D'@LIBDIR@/perl/site_perl/5.20.0'
 sitelib_stem=3D'@LIBDIR@/perl/site_perl'
-sitelibexp=3D'@LIBDIR@/perl/site_perl/5.14.3'
+sitelibexp=3D'@LIBDIR@/perl/site_perl/5.20.0'
 siteman1dir=3D''
 siteman1direxp=3D''
 siteman3dir=3D''
@@ -1029,7 +1013,7 @@ uidtype=3D'uid_t'
 uname=3D'uname'
 uniq=3D'uniq'
 use5005threads=3D'undef'
-usecrosscompile=3D'undef'
+usecrosscompile=3D'define'
 usedevel=3D'undef'
 usedl=3D'define'
 usedtrace=3D'undef'
@@ -1062,17 +1046,17 @@ uvtype=3D'unsigned long'
 uvuformat=3D'"lu"'
 uvxformat=3D'"lx"'
 vaproto=3D'define'
-vendorarch=3D'@LIBDIR@/perl/vendor_perl/5.14.3/@ARCH@-thread-multi'
-vendorarchexp=3D'@LIBDIR@/perl/vendor_perl/5.14.3/@ARCH@-thread-multi'
+vendorarch=3D'@LIBDIR@/perl/vendor_perl/5.20.0/@ARCH@-thread-multi'
+vendorarchexp=3D'@LIBDIR@/perl/vendor_perl/5.20.0/@ARCH@-thread-multi'
 vendorbin=3D'@USRBIN@'
 vendorbinexp=3D'@USRBIN@'
 vendorhtml1dir=3D' '
 vendorhtml1direxp=3D''
 vendorhtml3dir=3D' '
 vendorhtml3direxp=3D''
-vendorlib=3D'@LIBDIR@/perl/vendor_perl/5.14.3'
+vendorlib=3D'@LIBDIR@/perl/vendor_perl/5.20.0'
 vendorlib_stem=3D'@LIBDIR@/perl/vendor_perl'
-vendorlibexp=3D'@LIBDIR@/perl/vendor_perl/5.14.3'
+vendorlibexp=3D'@LIBDIR@/perl/vendor_perl/5.20.0'
 vendorman1dir=3D' '
 vendorman1direxp=3D''
 vendorman3dir=3D' '
@@ -1081,7 +1065,7 @@ vendorprefix=3D'/usr'
 vendorprefixexp=3D'/usr'
 vendorscript=3D'@USRBIN@'
 vendorscriptexp=3D'@USRBIN@'
-version=3D'5.14.3'
+version=3D'5.20.0'
 version_patchlevel_string=3D'version 14 subversion 2'
 versiononly=3D'undef'
 vi=3D''
@@ -1092,10 +1076,10 @@ yaccflags=3D''
 zcat=3D''
 zip=3D'zip'
 PERL_REVISION=3D5
-PERL_VERSION=3D14
-PERL_SUBVERSION=3D2
+PERL_VERSION=3D20
+PERL_SUBVERSION=3D0
 PERL_API_REVISION=3D5
-PERL_API_VERSION=3D14
+PERL_API_VERSION=3D20
 PERL_API_SUBVERSION=3D0
 PERL_PATCHLEVEL=3D''
 PERL_CONFIG_SH=3Dtrue
@@ -1108,3 +1092,15 @@ d_sin6_scope_id=3D'define'
 d_prctl=3D'define'
 d_prctl_set_name=3D'define'
 perl_static_inline=3D'static __inline__'
+d_sockaddr_in6=3D'undef'
+d_ip_mreq=3D'undef'
+d_ip_mreq_source=3D'undef'
+d_ipv6_mreq=3D'undef'
+d_ipv6_mreq_source=3D'undef'
+bootstrap_charset=3D'undef'
+d_isblank=3D'define'
+i_stdbool=3D'undef'
+usekernprocpathname=3D'undef'
+usensgetexecutablepath=3D'undef'
+st_ino_sign=3D'1'
+st_ino_size=3D'4'
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/config.sh-32 b/meta/rec=
ipes-devtools/perl/perl-5.20.0/config.sh-32
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/config.sh-32
rename to meta/recipes-devtools/perl/perl-5.20.0/config.sh-32
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/config.sh-32-be b/meta/=
recipes-devtools/perl/perl-5.20.0/config.sh-32-be
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/config.sh-32-be
rename to meta/recipes-devtools/perl/perl-5.20.0/config.sh-32-be
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/config.sh-32-le b/meta/=
recipes-devtools/perl/perl-5.20.0/config.sh-32-le
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/config.sh-32-le
rename to meta/recipes-devtools/perl/perl-5.20.0/config.sh-32-le
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/config.sh-64 b/meta/rec=
ipes-devtools/perl/perl-5.20.0/config.sh-64
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/config.sh-64
rename to meta/recipes-devtools/perl/perl-5.20.0/config.sh-64
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/config.sh-64-be b/meta/=
recipes-devtools/perl/perl-5.20.0/config.sh-64-be
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/config.sh-64-be
rename to meta/recipes-devtools/perl/perl-5.20.0/config.sh-64-be
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/config.sh-64-le b/meta/=
recipes-devtools/perl/perl-5.20.0/config.sh-64-le
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/config.sh-64-le
rename to meta/recipes-devtools/perl/perl-5.20.0/config.sh-64-le
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/cross-generate_uudmap.p=
atch b/meta/recipes-devtools/perl/perl-5.20.0/cross-generate_uudmap.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/cross-generate_uudmap.pa=
tch
rename to meta/recipes-devtools/perl/perl-5.20.0/cross-generate_uudmap.patc=
h
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/cpan-missing-sit=
e-dirs.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/cpan-missing-si=
te-dirs.diff
new file mode 100644
index 0000000..a5eb71e
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/cpan-missing-site-dirs.=
diff
@@ -0,0 +1,62 @@
+From 25994ac1124566398adee13806ef9a73d2cae150 Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Tue, 16 Oct 2012 23:07:56 +0300
+Subject: Fix CPAN::FirstTime defaults with nonexisting site dirs if a pare=
nt
+ is writable
+
+The site directories do not exist on a typical Debian system.  The build
+systems will create them when necessary, so there's no need for a prompt
+suggesting local::lib if the first existing parent directory is writable.
+
+Also, writability of the core directories is not interesting as we
+explicitly tell CPAN not to touch those with INSTALLDIRS=3Dsite.
+
+Bug-Debian: http://bugs.debian.org/688842
+Patch-Name: debian/cpan-missing-site-dirs.diff
+---
+ cpan/CPAN/lib/CPAN/FirstTime.pm | 31 +++++++++++++++++++++++++++----
+ 1 file changed, 27 insertions(+), 4 deletions(-)
+
+diff --git a/cpan/CPAN/lib/CPAN/FirstTime.pm b/cpan/CPAN/lib/CPAN/FirstTim=
e.pm
+index 4416072..187f5c4 100644
+--- a/cpan/CPAN/lib/CPAN/FirstTime.pm
++++ b/cpan/CPAN/lib/CPAN/FirstTime.pm
+@@ -2045,11 +2045,34 @@ sub _print_urllist {
+     };
+ }
+=20
++# Debian modification: return true if this directory
++# or the first existing one upwards is writable
++sub _can_write_to_this_or_parent {
++    my ($dir) =3D @_;
++    my @parts =3D File::Spec->splitdir($dir);
++    while (@parts) {
++        my $cur =3D File::Spec->catdir(@parts);
++        return 1 if -w $cur;
++        return 0 if -e _;
++        pop @parts;
++    }
++    return 0;
++}
++
++# Debian specific modification: the site directories don't necessarily
++# exist on the system, but the build systems create them when necessary,
++# so return true if the first existing directory upwards is writable
++#
++# Furthermore, on Debian, only test the site directories
++# (installsite*, expanded to /usr/local/{share,lib}/perl),
++# not the core ones=20
++# (install*lib, expanded to /usr/{share,lib}/perl).
++# We pass INSTALLDIRS=3Dsite by default to keep CPAN from touching
++# the core directories.
++
+ sub _can_write_to_libdirs {
+-    return -w $Config{installprivlib}
+-        && -w $Config{installarchlib}
+-        && -w $Config{installsitelib}
+-        && -w $Config{installsitearch}
++    return _can_write_to_this_or_parent($Config{installsitelib})
++        && _can_write_to_this_or_parent($Config{installsitearch})
+ }
+=20
+ sub _using_installbase {
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/cpan_definstalld=
irs.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/cpan_definstalldir=
s.diff
similarity index 78%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/cpan_definstalldi=
rs.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/cpan_definstalldirs=
.diff
index 57e7636..77a2ee9 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/cpan_definstalldirs.dif=
f
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/cpan_definstalldirs.dif=
f
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From 4b63b9a433661cd13cfb1448dbfb90c5f53a53be Mon Sep 17 00:00:00 2001
+From 64c9ad40c26f051a275a8b963cc849ca0ddd3cbb Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Provide a sensible INSTALLDIRS default for modules installed from
@@ -11,14 +10,14 @@ ordering, but not ours.
=20
 Patch-Name: debian/cpan_definstalldirs.diff
 ---
- cpan/CPAN/lib/CPAN/FirstTime.pm |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ cpan/CPAN/lib/CPAN/FirstTime.pm | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/cpan/CPAN/lib/CPAN/FirstTime.pm b/cpan/CPAN/lib/CPAN/FirstTim=
e.pm
-index 667bdca..c38c890 100644
+index d1a8eef..4416072 100644
 --- a/cpan/CPAN/lib/CPAN/FirstTime.pm
 +++ b/cpan/CPAN/lib/CPAN/FirstTime.pm
-@@ -990,7 +990,7 @@ sub init {
+@@ -1023,7 +1023,7 @@ sub init {
      my_prompt_loop(prefer_installer =3D> 'MB', $matcher, 'MB|EUMM|RAND');
 =20
      if (!$matcher or 'makepl_arg make_arg' =3D~ /$matcher/) {
@@ -26,8 +25,8 @@ index 667bdca..c38c890 100644
 +        my_dflt_prompt(makepl_arg =3D> "INSTALLDIRS=3Dsite", $matcher);
          my_dflt_prompt(make_arg =3D> "", $matcher);
          if ( $CPAN::Config->{makepl_arg} =3D~ /LIBS=3D|INC=3D/ ) {
-             $CPAN::Frontend->mywarn(=20
-@@ -1022,7 +1022,7 @@ sub init {
+             $CPAN::Frontend->mywarn(
+@@ -1055,7 +1055,7 @@ sub init {
      my_dflt_prompt(make_install_arg =3D> $CPAN::Config->{make_arg} || "",
                     $matcher);
 =20
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/db_file_ver.diff=
 b/meta/recipes-devtools/perl/perl-5.20.0/debian/db_file_ver.diff
similarity index 85%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/db_file_ver.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/db_file_ver.diff
index 8726056..9557560 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/db_file_ver.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/db_file_ver.diff
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From 0d1acf7af6da3a3f933faba8459ad9ff03fe3e5b Mon Sep 17 00:00:00 2001
+From 4da39e2ce6c5a510409c2da1c7b24e0e7ff87f31 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: Remove overly restrictive DB_File version check.
@@ -10,8 +9,8 @@ Package dependencies ensure the correct library is linked =
at run-time.
=20
 Patch-Name: debian/db_file_ver.diff
 ---
- cpan/DB_File/version.c |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
+ cpan/DB_File/version.c | 2 ++
+ 1 file changed, 2 insertions(+)
=20
 diff --git a/cpan/DB_File/version.c b/cpan/DB_File/version.c
 index e01f6f6..544e6ee 100644
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/doc_info.diff b/=
meta/recipes-devtools/perl/perl-5.20.0/debian/doc_info.diff
similarity index 62%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/doc_info.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/doc_info.diff
index 889024a..7643759 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/doc_info.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/doc_info.diff
@@ -1,24 +1,22 @@
-Upstream-Status:Inappropriate [debian patches]
-From 16ebe1f5232621d8894aa6c6210fdf2fc9b54a84 Mon Sep 17 00:00:00 2001
+From 2f3e4b35da039600de403083b5a0c7391751d02e Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
-Subject: Replace generic man(1) instructions with Debian-specific
- information.
+Subject: Replace generic man(1) instructions with Debian-specific informat=
ion.
=20
 Indicate that the user needs to install the perl-doc package.
=20
 Patch-Name: debian/doc_info.diff
 ---
- pod/perl.pod |   12 ++++++++++--
- 1 files changed, 10 insertions(+), 2 deletions(-)
+ pod/perl.pod | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
=20
 diff --git a/pod/perl.pod b/pod/perl.pod
-index 29cabf1..529ad6f 100644
+index 2e8d0d8..8810769 100644
 --- a/pod/perl.pod
 +++ b/pod/perl.pod
-@@ -261,8 +261,16 @@ For ease of access, the Perl manual has been split up=
 into several sections.
-     perlwin32		Perl notes for Windows
+@@ -274,8 +274,16 @@ aux a2p c2ph h2ph h2xs perlbug pl2pm pod2html pod2man=
 s2p splain xsubpp
 =20
+ =3Dfor buildtoc __END__
 =20
 -On a Unix-like system, these documentation files will usually also be
 -available as manpages for use with the F<man> program.
@@ -33,5 +31,5 @@ index 29cabf1..529ad6f 100644
 +You should be able to view Perl's documentation with your man(1)
 +program or perldoc(1).
 =20
- In general, if something strange has gone wrong with your program and you=
're
- not sure where you should look for help, try the B<-w> switch first.  It =
will
+ Some documentation is not available as man pages, so if a
+ cross-reference is not found by man, try it with L<perldoc>.  Perldoc can
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/enc2xs_inc.diff =
b/meta/recipes-devtools/perl/perl-5.20.0/debian/enc2xs_inc.diff
similarity index 64%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/enc2xs_inc.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/enc2xs_inc.diff
index 9440348..4650b0b 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/enc2xs_inc.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/enc2xs_inc.diff
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From e9fd6e7729b9ebd9bc74b8cf295cd3a7f5aa5472 Mon Sep 17 00:00:00 2001
+From 98e7248580af353d781b24715b42af5b6a4caf35 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Tweak enc2xs to follow symlinks and ignore missing @INC directori=
es.
@@ -13,14 +12,15 @@ Bug-Debian: http://bugs.debian.org/290336
=20
 Patch-Name: debian/enc2xs_inc.diff
 ---
- cpan/Encode/bin/enc2xs |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
+ cpan/Encode/bin/enc2xs | 8 ++++----
+ t/porting/customized.t | 3 +++
+ 2 files changed, 7 insertions(+), 4 deletions(-)
=20
 diff --git a/cpan/Encode/bin/enc2xs b/cpan/Encode/bin/enc2xs
-index 773c0a0..bc1ae1b 100644
+index c44487d..a9af54f 100644
 --- a/cpan/Encode/bin/enc2xs
 +++ b/cpan/Encode/bin/enc2xs
-@@ -924,11 +924,11 @@ use vars qw(
+@@ -929,11 +929,11 @@ use vars qw(
  sub find_e2x{
      eval { require File::Find; };
      my (@inc, %e2x_dir);
@@ -34,7 +34,7 @@ index 773c0a0..bc1ae1b 100644
           my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
               $atime,$mtime,$ctime,$blksize,$blocks)
               =3D lstat($_) or return;
-@@ -938,7 +938,7 @@ sub find_e2x{
+@@ -943,7 +943,7 @@ sub find_e2x{
               $e2x_dir{$File::Find::dir} ||=3D $mtime;
           }
           return;
@@ -43,7 +43,7 @@ index 773c0a0..bc1ae1b 100644
      warn join("\n", keys %e2x_dir), "\n";
      for my $d (sort {$e2x_dir{$a} <=3D> $e2x_dir{$b}} keys %e2x_dir){
      $_E2X =3D $d;
-@@ -1005,7 +1005,7 @@ sub make_configlocal_pm {
+@@ -1010,7 +1010,7 @@ sub make_configlocal_pm {
  	    $LocalMod{$enc} ||=3D $mod;
  	}
      };
@@ -52,3 +52,19 @@ index 773c0a0..bc1ae1b 100644
      $_ModLines =3D "";
      for my $enc ( sort keys %LocalMod ) {
          $_ModLines .=3D
+diff --git a/t/porting/customized.t b/t/porting/customized.t
+index a769c58..6b9977f 100644
+--- a/t/porting/customized.t
++++ b/t/porting/customized.t
+@@ -99,8 +99,11 @@ foreach my $module ( sort keys %Modules ) {
+       print $data_fh join(' ', $module, $file, $id), "\n";
+       next;
+     }
++SKIP: {
++    skip("$file modified for Debian", 1) if $file eq 'cpan/Encode/bin/enc=
2xs';
+     my $should_be =3D $customised{ $module }->{ $file };
+     is( $id, $should_be, "SHA for $file matches stashed SHA" );
++}
+   }
+ }
+=20
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/errno_ver.diff b=
/meta/recipes-devtools/perl/perl-5.20.0/debian/errno_ver.diff
similarity index 62%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/errno_ver.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/errno_ver.diff
index c7b0531..d8885a7 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/errno_ver.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/errno_ver.diff
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From 973bed42db538804179f39d66dab37c82c6ade24 Mon Sep 17 00:00:00 2001
+From 81255b67014bda2ec127e0856436acfa554a068c Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: Remove Errno version check due to upgrade problems with long-runn=
ing
@@ -13,14 +12,14 @@ compatible, but built on a different machine.
=20
 Patch-Name: debian/errno_ver.diff
 ---
- ext/Errno/Errno_pm.PL |    5 -----
- 1 files changed, 0 insertions(+), 5 deletions(-)
+ ext/Errno/Errno_pm.PL | 5 -----
+ 1 file changed, 5 deletions(-)
=20
 diff --git a/ext/Errno/Errno_pm.PL b/ext/Errno/Errno_pm.PL
-index 56bc815..01f510a 100644
+index 55ad01a..e4a31ef 100644
 --- a/ext/Errno/Errno_pm.PL
 +++ b/ext/Errno/Errno_pm.PL
-@@ -332,13 +332,8 @@ EOF
+@@ -277,13 +277,8 @@ sub write_errno_pm {
 =20
  package Errno;
  require Exporter;
@@ -28,8 +27,8 @@ index 56bc815..01f510a 100644
  use strict;
 =20
 -"\$Config{'archname'}-\$Config{'osvers'}" eq
--"$Config{'archname'}-$Config{'osvers'}" or
--	die "Errno architecture ($Config{'archname'}-$Config{'osvers'}) does not=
 match executable architecture (\$Config{'archname'}-\$Config{'osvers'})";
+-"$archname-$Config{'osvers'}" or
+-	die "Errno architecture ($archname-$Config{'osvers'}) does not match exe=
cutable architecture (\$Config{'archname'}-\$Config{'osvers'})";
 -
  our \$VERSION =3D "$VERSION";
  \$VERSION =3D eval \$VERSION;
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/extutils_set_lib=
perl_path.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/extutils_set=
_libperl_path.diff
similarity index 40%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/extutils_set_libp=
erl_path.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/extutils_set_libper=
l_path.diff
index d704c00..53fd1f6 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/extutils_set_libperl_pa=
th.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/extutils_set_libperl_pa=
th.diff
@@ -1,24 +1,37 @@
-Upstream-Status:Inappropriate [debian patches]
-From 334ac01a8306485ed901f4fb45d79f39a944fe77 Mon Sep 17 00:00:00 2001
-From: Brendan O'Dea <bod@debian.org>
-Date: Tue, 8 Mar 2005 19:30:38 +1100
-Subject: EU:MM: Set location of libperl.a to /usr/lib
+From 2870b992e4b5e8bb0b9c44c9aff81adaaf9de439 Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Sat, 10 May 2014 23:34:14 +0300
+Subject: EU:MM: set location of libperl.a under /usr/lib
+
+The Debian packaging moves libperl.a a couple of levels up from the
+CORE directory to match other static libraries.
=20
 Patch-Name: debian/extutils_set_libperl_path.diff
 ---
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 2 +-
+ pp.c                                            | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 4ee6b3f..42bbb83 100644
+index 8b86a24..f977476 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2409,7 +2409,7 @@ MAP_PRELIBS   =3D $Config{perllibs} $Config{cryptlib=
}
+@@ -2462,7 +2462,7 @@ MAP_PRELIBS   =3D $Config{perllibs} $Config{cryptlib=
}
  	($lperl =3D $libperl) =3D~ s/\$\(A\)/$self->{LIB_EXT}/;
      }
      unless ($libperl && -f $lperl) { # Ilya's code...
 -	my $dir =3D $self->{PERL_SRC} || "$self->{PERL_ARCHLIB}/CORE";
-+	my $dir =3D $self->{PERL_SRC} || "/usr/lib";
++	my $dir =3D $self->{PERL_SRC} || "$self->{PERL_ARCHLIB}/../..";
  	$dir =3D "$self->{PERL_ARCHLIB}/.." if $self->{UNINSTALLED_PERL};
  	$libperl ||=3D "libperl$self->{LIB_EXT}";
  	$libperl   =3D "$dir/$libperl";
+diff --git a/pp.c b/pp.c
+index 4ec6887..a44c137 100644
+--- a/pp.c
++++ b/pp.c
+@@ -1,4 +1,4 @@
+-/*    pp.c
++ /*    pp.c
+  *
+  *    Copyright (C) 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,=
 2000,
+  *    2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008 by Larry Wall and ot=
hers
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/find_html2text.d=
iff b/meta/recipes-devtools/perl/perl-5.20.0/debian/find_html2text.diff
similarity index 80%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/find_html2text.di=
ff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/find_html2text.diff
index 29dc576..c0e1949 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/find_html2text.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/find_html2text.diff
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From ca66b95be369b47a6d372c3653be57cd737f7f21 Mon Sep 17 00:00:00 2001
+From 8deb14b24ee17694a2f23a78e8782b24c116daae Mon Sep 17 00:00:00 2001
 From: Andreas Marschke <andreas.marschke@googlemail.com>
 Date: Sat, 17 Sep 2011 11:38:42 +0100
 Subject: Configure CPAN::Distribution with correct name of html2text
@@ -18,14 +17,14 @@ Please see the attached patch for a quick fix of this i=
ssue.
 as the html2text.pl which is expected, but should provide similar
 functionality].
 ---
- cpan/CPAN/lib/CPAN/Distribution.pm |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ cpan/CPAN/lib/CPAN/Distribution.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/cpan/CPAN/lib/CPAN/Distribution.pm b/cpan/CPAN/lib/CPAN/Distr=
ibution.pm
-index 637ab27..a8193d9 100644
+index 9a08707..332a627 100644
 --- a/cpan/CPAN/lib/CPAN/Distribution.pm
 +++ b/cpan/CPAN/lib/CPAN/Distribution.pm
-@@ -3715,7 +3715,7 @@ sub _display_url {
+@@ -4031,7 +4031,7 @@ sub _display_url {
        if $CPAN::DEBUG;
 =20
      # should we define it in the config instead?
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/document_m=
akemaker_ccflags.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes=
/document_makemaker_ccflags.diff
similarity index 75%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/document_ma=
kemaker_ccflags.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/document_make=
maker_ccflags.diff
index 3f2c3dc..f4050c0 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/document_makemake=
r_ccflags.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/document_makemake=
r_ccflags.diff
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From f0e3a51bd7286788e410510af86a6c07edac4445 Mon Sep 17 00:00:00 2001
+From c7ffe0cc3105cb627fbbb7d0c7dbb53f1f236a17 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Mon, 30 May 2011 22:54:24 +0300
 Subject: Document that CCFLAGS should include $Config{ccflags}
@@ -12,14 +11,14 @@ binary interface on some platforms.
=20
 Patch-Name: fixes/document_makemaker_ccflags.diff
 ---
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm | 4 ++++
+ 1 file changed, 4 insertions(+)
=20
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm b/cpan/ExtU=
tils-MakeMaker/lib/ExtUtils/MakeMaker.pm
-index be9624e..c56ca8f 100644
+index d2fabf6..fabb021 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
-@@ -1524,6 +1524,10 @@ currently used by MakeMaker but may be handy in Mak=
efile.PLs.
+@@ -1716,6 +1716,10 @@ currently used by MakeMaker but may be handy in Mak=
efile.PLs.
  String that will be included in the compiler call command line between
  the arguments INC and OPTIMIZE.
 =20
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/memoize_st=
orable_nstore.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/me=
moize_storable_nstore.diff
new file mode 100644
index 0000000..b9d61c7
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/memoize_storable_=
nstore.diff
@@ -0,0 +1,110 @@
+From 8b7b31d6b2368717514a05dc0e968c1357511733 Mon Sep 17 00:00:00 2001
+From: Jonathan Nieder <jrnieder@gmail.com>
+Date: Fri, 27 Jul 2012 10:35:07 -0500
+Subject: Memoize::Storable: respect 'nstore' option not respected
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Memoize(3perl) says:
+
+                tie my %cache =3D> 'Memoize::Storable', $filename, 'nstore=
';
+                memoize 'function', SCALAR_CACHE =3D> [HASH =3D> \%cache];
+
+        Include the =E2=80=98nstore=E2=80=99 option to have the "Storable"=
 database
+        written in =E2=80=98network order=E2=80=99.  (See Storable for mor=
e details
+        about this.)
+
+In fact the "nstore" option does no such thing.  Option parsing looks
+like this:
+
+        @options{@_} =3D ();
+
+$self->{OPTIONS}{'nstore'} is accordingly set to undef.  Later
+Memoize::Storable checks if the option is true, and since undef is
+not true, the "else" branch is always taken.
+
+        if ($self->{OPTIONS}{'nstore'}) {
+                Storable::nstore($self->{H}, $self->{FILENAME});
+        } else {
+                Storable::store($self->{H}, $self->{FILENAME});
+        }
+
+Correcting the condition to (exists $self->{OPTIONS}{'nstore'}) fixes
+it.
+
+Noticed because git-svn, which uses the 'nstore' option for its
+on-disk caches, was producing
+
+        Byte order is not compatible at ../../lib/Storable.pm
+
+when run using a perl with a different integer size (and hence
+byteorder).
+
+Reported by Tim Retout (RT#77790)
+
+Bug-Debian: http://bugs.debian.org/587650
+Bug: https://rt.cpan.org/Public/Bug/Display.html?id=3D77790
+Forwarded: https://rt.cpan.org/Public/Bug/Display.html?id=3D77790
+Patch-Name: fixes/memoize_storable_nstore.diff
+---
+ cpan/Memoize/Memoize/Storable.pm |  2 +-
+ cpan/Memoize/t/tie_storable.t    | 24 ++++++++++++++++++++----
+ 2 files changed, 21 insertions(+), 5 deletions(-)
+
+diff --git a/cpan/Memoize/Memoize/Storable.pm b/cpan/Memoize/Memoize/Stora=
ble.pm
+index 1314797..87876f2 100644
+--- a/cpan/Memoize/Memoize/Storable.pm
++++ b/cpan/Memoize/Memoize/Storable.pm
+@@ -55,7 +55,7 @@ sub DESTROY {
+   require Carp if $Verbose;
+   my $self=3D shift;
+   print STDERR "Memoize::Storable::DESTROY(@_)\n" if $Verbose;
+-  if ($self->{OPTIONS}{'nstore'}) {
++  if (exists $self->{OPTIONS}{'nstore'}) {
+     Storable::nstore($self->{H}, $self->{FILENAME});
+   } else {
+     Storable::store($self->{H}, $self->{FILENAME});
+diff --git a/cpan/Memoize/t/tie_storable.t b/cpan/Memoize/t/tie_storable.t
+index de3b8dc..a624238 100644
+--- a/cpan/Memoize/t/tie_storable.t
++++ b/cpan/Memoize/t/tie_storable.t
+@@ -31,18 +31,34 @@ if ($@) {
+   exit 0;
+ }
+=20
+-print "1..4\n";
++print "1..9\n";
+=20
+ $file =3D "storable$$";
+ 1 while unlink $file;
+ tryout('Memoize::Storable', $file, 1);  # Test 1..4
+ 1 while unlink $file;
++tryout('Memoize::Storable', $file, 5, 'nstore');  # Test 5..8
++assert_netorder($file, 9);  # Test 9
++1 while unlink $file;
++
++
++sub assert_netorder {
++  my ($file, $testno) =3D @_;
++
++  my $netorder =3D Storable::file_magic($file)->{'netorder'};
++  print ($netorder ? "ok $testno\n" : "not ok $testno\n");
++}
+=20
+ sub tryout {
+-  my ($tiepack, $file, $testno) =3D @_;
++  my ($tiepack, $file, $testno, $option) =3D @_;
+=20
+-  tie my %cache =3D> $tiepack, $file
+-    or die $!;
++  if (defined $option) {
++    tie my %cache =3D> $tiepack, $file, $option
++      or die $!;
++  } else {
++    tie my %cache =3D> $tiepack, $file
++      or die $!;
++  }
+=20
+   memoize 'c5',=20
+   SCALAR_CACHE =3D> [HASH =3D> \%cache],
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/net_smtp_d=
ocs.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/net_smtp_doc=
s.diff
similarity index 65%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/net_smtp_do=
cs.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/net_smtp_docs=
.diff
index f68c352..b7ccc57 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/net_smtp_docs.dif=
f
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/net_smtp_docs.dif=
f
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From ab32eba7fcc45d864c22e8f4ee02e0a6712070e0 Mon Sep 17 00:00:00 2001
+From e2e1127a521d942bd9aea4c1290cdf46c15c35fd Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Thu, 20 Sep 2007 19:47:14 +1000
 Subject: Document the Net::SMTP 'Port' option
@@ -9,14 +8,14 @@ Bug: http://rt.cpan.org/Public/Bug/Display.html?id=3D3603=
8
=20
 Patch-Name: fixes/net_smtp_docs.diff
 ---
- cpan/libnet/Net/SMTP.pm |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
+ cpan/libnet/Net/SMTP.pm | 1 +
+ 1 file changed, 1 insertion(+)
=20
 diff --git a/cpan/libnet/Net/SMTP.pm b/cpan/libnet/Net/SMTP.pm
-index a28496d..07b2498 100644
+index 705b5c5..17c1d21 100644
 --- a/cpan/libnet/Net/SMTP.pm
 +++ b/cpan/libnet/Net/SMTP.pm
-@@ -625,6 +625,7 @@ Net::SMTP will attempt to extract the address from the=
 value passed.
+@@ -637,6 +637,7 @@ Net::SMTP will attempt to extract the address from the=
 value passed.
 =20
  B<Debug> - Enable debugging information
 =20
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/respect_um=
ask.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/respect_umas=
k.diff
similarity index 75%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/respect_uma=
sk.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/respect_umask=
.diff
index aa9307f..e5f116a 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/respect_umask.dif=
f
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/respect_umask.dif=
f
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From 0d1ab4f799eb14d5488fcc959f4a6bdec548b370 Mon Sep 17 00:00:00 2001
+From f290a5ebd91e89d63b2a1958420f53e22d20c4ee Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Respect umask during installation
@@ -9,43 +8,43 @@ site directories.
=20
 Patch-Name: fixes/respect_umask.diff
 ---
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm |   18 +++++++++---------
- dist/ExtUtils-Install/lib/ExtUtils/Install.pm   |   18 +++++++++---------
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 18 +++++++++---------
+ dist/ExtUtils-Install/lib/ExtUtils/Install.pm   | 18 +++++++++---------
  2 files changed, 18 insertions(+), 18 deletions(-)
=20
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 6964eea..865d36d 100644
+index 4140432..8fdb67c 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2053,7 +2053,7 @@ doc__install : doc_site_install
+@@ -2075,7 +2075,7 @@ doc__install : doc_site_install
  	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=3Ds=
ite
 =20
  pure_perl_install :: all
 -	$(NOECHO) $(MOD_INSTALL) \
 +	$(NOECHO) umask 022; $(MOD_INSTALL) \
- 		read }.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist'=
).q{ \
- 		write }.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$(FULLEXT)','.pa=
cklist').q{ \
- 		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
-@@ -2067,7 +2067,7 @@ pure_perl_install :: all
+ };
+=20
+     push @m,
+@@ -2095,7 +2095,7 @@ q{		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
 =20
 =20
  pure_site_install :: all
 -	$(NOECHO) $(MOD_INSTALL) \
 +	$(NOECHO) umask 022; $(MOD_INSTALL) \
- 		read }.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist')=
.q{ \
- 		write }.$self->catfile('$(DESTINSTALLSITEARCH)','auto','$(FULLEXT)','.p=
acklist').q{ \
- 		$(INST_LIB) $(DESTINSTALLSITELIB) \
-@@ -2080,7 +2080,7 @@ pure_site_install :: all
+ };
+     push @m,
+ q{		read }.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist=
').q{ \
+@@ -2113,7 +2113,7 @@ q{		$(INST_LIB) $(DESTINSTALLSITELIB) \
  		}.$self->catdir('$(PERL_ARCHLIB)','auto','$(FULLEXT)').q{
 =20
  pure_vendor_install :: all
 -	$(NOECHO) $(MOD_INSTALL) \
 +	$(NOECHO) umask 022; $(MOD_INSTALL) \
- 		read }.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist=
').q{ \
- 		write }.$self->catfile('$(DESTINSTALLVENDORARCH)','auto','$(FULLEXT)','=
.packlist').q{ \
- 		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
-@@ -2092,8 +2092,8 @@ pure_vendor_install :: all
-=20
+ };
+     push @m,
+ q{		read }.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packli=
st').q{ \
+@@ -2145,8 +2145,8 @@ doc_vendor_install :: all
+     push @m, q{
  doc_perl_install :: all
  	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
 -	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
@@ -55,7 +54,7 @@ index 6964eea..865d36d 100644
  		"Module" "$(NAME)" \
  		"installed into" "$(INSTALLPRIVLIB)" \
  		LINKTYPE "$(LINKTYPE)" \
-@@ -2103,8 +2103,8 @@ doc_perl_install :: all
+@@ -2156,8 +2156,8 @@ doc_perl_install :: all
 =20
  doc_site_install :: all
  	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
@@ -66,7 +65,7 @@ index 6964eea..865d36d 100644
  		"Module" "$(NAME)" \
  		"installed into" "$(INSTALLSITELIB)" \
  		LINKTYPE "$(LINKTYPE)" \
-@@ -2114,8 +2114,8 @@ doc_site_install :: all
+@@ -2167,8 +2167,8 @@ doc_site_install :: all
 =20
  doc_vendor_install :: all
  	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
@@ -78,10 +77,10 @@ index 6964eea..865d36d 100644
  		"installed into" "$(INSTALLVENDORLIB)" \
  		LINKTYPE "$(LINKTYPE)" \
 diff --git a/dist/ExtUtils-Install/lib/ExtUtils/Install.pm b/dist/ExtUtils=
-Install/lib/ExtUtils/Install.pm
-index 3b030a5..cb0e9e0 100644
+index eec57aa..06cc530 100644
 --- a/dist/ExtUtils-Install/lib/ExtUtils/Install.pm
 +++ b/dist/ExtUtils-Install/lib/ExtUtils/Install.pm
-@@ -468,7 +468,7 @@ sub _can_write_dir {
+@@ -450,7 +450,7 @@ sub _can_write_dir {
 =20
  =3Dpod
 =20
@@ -90,7 +89,7 @@ index 3b030a5..cb0e9e0 100644
 =20
  Wrapper around File::Path::mkpath() to handle errors.
 =20
-@@ -485,13 +485,13 @@ writable.
+@@ -467,13 +467,13 @@ writable.
  =3Dcut
 =20
  sub _mkpath {
@@ -107,7 +106,7 @@ index 3b030a5..cb0e9e0 100644
              _choke("Can't create '$dir'","$@");
          }
 =20
-@@ -796,7 +796,7 @@ sub install { #XXX OS-SPECIFIC
+@@ -782,7 +782,7 @@ sub install { #XXX OS-SPECIFIC
          _chdir($cwd);
      }
      foreach my $targetdir (sort keys %check_dirs) {
@@ -116,7 +115,7 @@ index 3b030a5..cb0e9e0 100644
      }
      foreach my $found (@found_files) {
          my ($diff, $ffd, $origfile, $mode, $size, $atime, $mtime,
-@@ -810,7 +810,7 @@ sub install { #XXX OS-SPECIFIC
+@@ -796,7 +796,7 @@ sub install { #XXX OS-SPECIFIC
                      $targetfile=3D _unlink_or_rename( $targetfile, 'tryha=
rd', 'install' )
                          unless $dry_run;
                  } elsif ( ! -d $targetdir ) {
@@ -125,7 +124,7 @@ index 3b030a5..cb0e9e0 100644
                  }
                  print "Installing $targetfile\n";
 =20
-@@ -850,7 +850,7 @@ sub install { #XXX OS-SPECIFIC
+@@ -836,7 +836,7 @@ sub install { #XXX OS-SPECIFIC
 =20
      if ($pack{'write'}) {
          $dir =3D install_rooted_dir(dirname($pack{'write'}));
@@ -134,7 +133,7 @@ index 3b030a5..cb0e9e0 100644
          print "Writing $pack{'write'}\n" if $verbose;
          $packlist->write(install_rooted_file($pack{'write'})) unless $dry=
_run;
      }
-@@ -1190,7 +1190,7 @@ be prepended as a directory to each installed file (=
and directory).
+@@ -1176,7 +1176,7 @@ be prepended as a directory to each installed file (=
and directory).
  sub pm_to_blib {
      my($fromto,$autodir,$pm_filter) =3D @_;
 =20
@@ -143,7 +142,7 @@ index 3b030a5..cb0e9e0 100644
      while(my($from, $to) =3D each %$fromto) {
          if( -f $to && -s $from =3D=3D -s $to && -M $to < -M $from ) {
              print "Skip $to (unchanged)\n";
-@@ -1213,7 +1213,7 @@ sub pm_to_blib {
+@@ -1199,7 +1199,7 @@ sub pm_to_blib {
              # we wont try hard here. its too likely to mess things up.
              forceunlink($to);
          } else {
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/hurd_test_skip_s=
tack.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/hurd_test_skip_st=
ack.diff
new file mode 100644
index 0000000..66208a2
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/hurd_test_skip_stack.di=
ff
@@ -0,0 +1,32 @@
+From 651aaac47361c03d15681b6cfdba0056a348fbb7 Mon Sep 17 00:00:00 2001
+From: Dominic Hargreaves <dom@earth.li>
+Date: Sun, 27 Nov 2011 16:27:07 +0000
+Subject: Disable failing GNU/Hurd tests dist/threads/t/stack.t
+
+These tests fail on GNU/Hurd owing to libpthread using fixed-size stacks.
+This is a known limitation that should get fixed in the future.
+
+For now, disable the tests.
+
+Bug-Debian: http://bugs.debian.org/650175
+
+Patch-Name: debian/hurd_test_skip_stack.diff
+---
+ dist/threads/t/stack.t | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/dist/threads/t/stack.t b/dist/threads/t/stack.t
+index cfd6cf7..84cc527 100644
+--- a/dist/threads/t/stack.t
++++ b/dist/threads/t/stack.t
+@@ -7,6 +7,10 @@ BEGIN {
+         print("1..0 # SKIP Perl not compiled with 'useithreads'\n");
+         exit(0);
+     }
++    if ($^O eq 'gnu') {
++        print("1..0 # SKIP fails on GNU/Hurd (Debian #650175)\n");
++        exit(0);
++    }
+ }
+=20
+ use ExtUtils::testlib;
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/instmodsh_doc.di=
ff b/meta/recipes-devtools/perl/perl-5.20.0/debian/instmodsh_doc.diff
similarity index 77%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/instmodsh_doc.dif=
f
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/instmodsh_doc.diff
index ae13178..569acb8 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/instmodsh_doc.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/instmodsh_doc.diff
@@ -1,16 +1,15 @@
-Upstream-Status:Inappropriate [debian patches]
-From ab89a31d1f46388a61953349c3546e4082cd38de Mon Sep 17 00:00:00 2001
+From 035ae97a9c2bf8ed73031e8879a0f860797544c1 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Debian policy doesn't install .packlist files for core or vendor.
=20
 Patch-Name: debian/instmodsh_doc.diff
 ---
- cpan/ExtUtils-MakeMaker/bin/instmodsh |    4 +++-
- 1 files changed, 3 insertions(+), 1 deletions(-)
+ cpan/ExtUtils-MakeMaker/bin/instmodsh | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/cpan/ExtUtils-MakeMaker/bin/instmodsh b/cpan/ExtUtils-MakeMak=
er/bin/instmodsh
-index 5874aa6..6a2f03e 100644
+index 8b9aa95..e551434 100644
 --- a/cpan/ExtUtils-MakeMaker/bin/instmodsh
 +++ b/cpan/ExtUtils-MakeMaker/bin/instmodsh
 @@ -18,9 +18,11 @@ instmodsh - A shell to examine installed modules
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/ld_run_path.diff=
 b/meta/recipes-devtools/perl/perl-5.20.0/debian/ld_run_path.diff
similarity index 54%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/ld_run_path.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/ld_run_path.diff
index 929328b..fa0039f 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/ld_run_path.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/ld_run_path.diff
@@ -1,25 +1,24 @@
-Upstream-Status:Inappropriate [debian patches]
-From 704f6017119ce0301a9105944512120a38a43a02 Mon Sep 17 00:00:00 2001
+From c089c8eb475a2018e8028e23b07defb5789a5633 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
 Subject: Remove standard libs from LD_RUN_PATH as per Debian policy.
=20
 Patch-Name: debian/ld_run_path.diff
 ---
- .../ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm |    3 +++
- 1 files changed, 3 insertions(+), 0 deletions(-)
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm | 3 +++
+ 1 file changed, 3 insertions(+)
=20
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm b/cpan/Ex=
tUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
-index cf4826f..eb212b5 100644
+index e39c8b2..0b933ce 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
-@@ -54,6 +54,9 @@ sub _unix_os2_ext {
-     my($pwd) =3D cwd(); # from Cwd.pm
-     my($found) =3D 0;
+@@ -56,6 +56,9 @@ sub _unix_os2_ext {
+     my ( $pwd )   =3D cwd();    # from Cwd.pm
+     my ( $found ) =3D 0;
 =20
 +    # Debian-specific: don't use LD_RUN_PATH for standard dirs
 +    $ld_run_path_seen{$_}++ for @libpath;
 +
-     foreach my $thislib (split ' ', $potential_libs) {
+     foreach my $thislib ( split ' ', $potential_libs ) {
 =20
- 	# Handle possible linker path arguments.
+         # Handle possible linker path arguments.
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/libnet_config_pa=
th.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/libnet_config_path.=
diff
similarity index 84%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/libnet_config_pat=
h.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/libnet_config_path.=
diff
index 454cb9e..0a11cd7 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/libnet_config_path.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/libnet_config_path.diff
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From 7465b6d008187580eabe655b9c8e75351d3d24b4 Mon Sep 17 00:00:00 2001
+From 54e202518f081aa42d5ff733d56c4d42395bcba4 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Set location of libnet.cfg to /etc/perl/Net as /usr may not be
@@ -7,11 +6,11 @@ Subject: Set location of libnet.cfg to /etc/perl/Net as /=
usr may not be
=20
 Patch-Name: debian/libnet_config_path.diff
 ---
- cpan/libnet/Net/Config.pm |    7 +++----
- 1 files changed, 3 insertions(+), 4 deletions(-)
+ cpan/libnet/Net/Config.pm | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
=20
 diff --git a/cpan/libnet/Net/Config.pm b/cpan/libnet/Net/Config.pm
-index db51c1f..8404593 100644
+index ba16332..4b1ea19 100644
 --- a/cpan/libnet/Net/Config.pm
 +++ b/cpan/libnet/Net/Config.pm
 @@ -57,9 +57,8 @@ my %nc =3D (
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/libperl_embed_do=
c.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/libperl_embed_doc.di=
ff
similarity index 57%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/libperl_embed_doc=
.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/libperl_embed_doc.d=
iff
index d1bf8bd..7b9bd75 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/libperl_embed_doc.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/libperl_embed_doc.diff
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From d70e88badfcc6edd05e884597f19fbbdcf2cf6a7 Mon Sep 17 00:00:00 2001
+From 967a87e268bd348423f72dec993eda444ce9f53d Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Note that libperl-dev package is required for embedded linking
@@ -8,15 +7,15 @@ Bug-Debian: http://bugs.debian.org/186778
=20
 Patch-Name: debian/libperl_embed_doc.diff
 ---
- lib/ExtUtils/Embed.pm |    3 +++
- 1 files changed, 3 insertions(+), 0 deletions(-)
+ lib/ExtUtils/Embed.pm | 3 +++
+ 1 file changed, 3 insertions(+)
=20
 diff --git a/lib/ExtUtils/Embed.pm b/lib/ExtUtils/Embed.pm
-index 9710630..86f13b5 100644
+index 3f983c1..0ec8a67 100644
 --- a/lib/ExtUtils/Embed.pm
 +++ b/lib/ExtUtils/Embed.pm
-@@ -305,6 +305,9 @@ and extensions in your C/C++ applications.
- Typically, an application B<Makefile> will invoke ExtUtils::Embed
+@@ -296,6 +296,9 @@ and extensions in your C/C++ applications.
+ Typically, an application F<Makefile> will invoke C<ExtUtils::Embed>
  functions while building your application. =20
 =20
 +Note that on Debian systems the B<libperl-dev> package is required for
@@ -24,4 +23,4 @@ index 9710630..86f13b5 100644
 +
  =3Dhead1 @EXPORT
 =20
- ExtUtils::Embed exports the following functions:
+ C<ExtUtils::Embed> exports the following functions:
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/mod_paths.diff b=
/meta/recipes-devtools/perl/perl-5.20.0/debian/mod_paths.diff
similarity index 87%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/mod_paths.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/mod_paths.diff
index ceac541..49805a0 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/mod_paths.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/mod_paths.diff
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From 11633e598640b02e19329f323623af254fbac451 Mon Sep 17 00:00:00 2001
+From f994a741e51287494ed62b10738be6856aadce71 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
 Subject: Tweak @INC ordering for Debian
@@ -19,14 +18,14 @@ version than is included in core.
=20
 Patch-Name: debian/mod_paths.diff
 ---
- perl.c |   58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 files changed, 58 insertions(+), 0 deletions(-)
+ perl.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 58 insertions(+)
=20
 diff --git a/perl.c b/perl.c
-index f756e02..d26dcb0 100644
+index 27d0d9e..1fe2f1c 100644
 --- a/perl.c
 +++ b/perl.c
-@@ -4219,6 +4219,11 @@ S_init_perllib(pTHX)
+@@ -4367,6 +4367,11 @@ S_init_perllib(pTHX)
  		      INCPUSH_ADD_SUB_DIRS|INCPUSH_CAN_RELOCATE);
  #endif
 =20
@@ -38,7 +37,7 @@ index f756e02..d26dcb0 100644
  #ifdef SITEARCH_EXP
      /* sitearch is always relative to sitelib on Windows for
       * DLL-based path intuition to work correctly */
-@@ -4336,6 +4341,59 @@ S_init_perllib(pTHX)
+@@ -4484,6 +4489,59 @@ S_init_perllib(pTHX)
  		      INCPUSH_ADD_OLD_VERS|INCPUSH_CAN_RELOCATE);
  #endif
 =20
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/module_build_man=
_extensions.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/module_bui=
ld_man_extensions.diff
similarity index 59%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/module_build_man_=
extensions.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/module_build_man_ex=
tensions.diff
index 64401d9..894e953 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/module_build_man_extens=
ions.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/module_build_man_extens=
ions.diff
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From fbb5f07872d45bac76b5c3c83b50a19aa5da10b0 Mon Sep 17 00:00:00 2001
+From 333efa7c9da43d94272a872a59a6cd28da8ca245 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Thu, 8 May 2008 14:32:33 +0300
 Subject: Adjust Module::Build manual page extensions for the Debian Perl
@@ -9,28 +8,28 @@ Bug-Debian: http://bugs.debian.org/479460
=20
 Patch-Name: debian/module_build_man_extensions.diff
 ---
- cpan/Module-Build/lib/Module/Build/Base.pm |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ cpan/Module-Build/lib/Module/Build/Base.pm | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/cpan/Module-Build/lib/Module/Build/Base.pm b/cpan/Module-Buil=
d/lib/Module/Build/Base.pm
-index fba916a..82df4cc 100644
+index 84e137f..4422cd4 100644
 --- a/cpan/Module-Build/lib/Module/Build/Base.pm
 +++ b/cpan/Module-Build/lib/Module/Build/Base.pm
-@@ -3246,7 +3246,7 @@ sub manify_bin_pods {
+@@ -3226,7 +3226,7 @@ sub manify_bin_pods {
    foreach my $file (keys %$files) {
      # Pod::Simple based parsers only support one document per instance.
      # This is expected to change in a future version (Pod::Simple > 3.03)=
.
--    my $parser  =3D Pod::Man->new( section =3D> 1 ); # binaries go in sec=
tion 1
-+    my $parser  =3D Pod::Man->new( section =3D> '1p' ); # binaries go in =
section 1p
+-    my $parser  =3D Pod::Man->new( %podman_args );
++    my $parser  =3D Pod::Man->new( %podman_args, section =3D> '1p' ); # b=
inaries go in section 1p
      my $manpage =3D $self->man1page_name( $file ) . '.' .
- 	          $self->config( 'man1ext' );
+                   $self->config( 'man1ext' );
      my $outfile =3D File::Spec->catfile($mandir, $manpage);
-@@ -3271,7 +3271,7 @@ sub manify_lib_pods {
+@@ -3252,7 +3252,7 @@ sub manify_lib_pods {
    while (my ($file, $relfile) =3D each %$files) {
      # Pod::Simple based parsers only support one document per instance.
      # This is expected to change in a future version (Pod::Simple > 3.03)=
.
--    my $parser  =3D Pod::Man->new( section =3D> 3 ); # libraries go in se=
ction 3
-+    my $parser  =3D Pod::Man->new( section =3D> '3pm' ); # libraries go i=
n section 3pm
+-    my $parser  =3D Pod::Man->new( %podman_args );
++    my $parser  =3D Pod::Man->new( %podman_args, section =3D> '3pm' ); # =
libraries go in section 3pm
      my $manpage =3D $self->man3page_name( $relfile ) . '.' .
- 	          $self->config( 'man3ext' );
+                   $self->config( 'man3ext' );
      my $outfile =3D File::Spec->catfile( $mandir, $manpage);
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/no_packlist_perl=
local.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/no_packlist_perl=
local.diff
similarity index 74%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/no_packlist_perll=
ocal.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/no_packlist_perlloc=
al.diff
index 00633e3..09fe1a9 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/no_packlist_perllocal.d=
iff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/no_packlist_perllocal.d=
iff
@@ -1,39 +1,43 @@
-Upstream-Status:Inappropriate [debian patches]
-From 44c7521619dd0e637920393184affcb26a27d5b7 Mon Sep 17 00:00:00 2001
+From 127c026bbb63907b196febf3558842d8f01e52ef Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Don't install .packlist or perllocal.pod for perl or vendor
=20
 Patch-Name: debian/no_packlist_perllocal.diff
 ---
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm |   31 +++---------------=
-----
- 1 files changed, 4 insertions(+), 27 deletions(-)
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 36 +++-----------------=
-----
+ 1 file changed, 4 insertions(+), 32 deletions(-)
=20
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 42bbb83..a16e2d0 100644
+index f977476..0a6797f 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2054,8 +2054,6 @@ doc__install : doc_site_install
+@@ -2079,11 +2079,6 @@ pure_perl_install :: all
+ };
 =20
- pure_perl_install :: all
- 	$(NOECHO) umask 022; $(MOD_INSTALL) \
--		read }.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist'=
).q{ \
+     push @m,
+-q{		read }.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlis=
t').q{ \
 -		write }.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$(FULLEXT)','.pa=
cklist').q{ \
- 		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
+-} unless $self->{NO_PACKLIST};
+-
+-    push @m,
+ q{		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
  		$(INST_ARCHLIB) $(DESTINSTALLARCHLIB) \
  		$(INST_BIN) $(DESTINSTALLBIN) \
-@@ -2081,8 +2079,6 @@ pure_site_install :: all
-=20
+@@ -2115,10 +2110,6 @@ q{		$(INST_LIB) $(DESTINSTALLSITELIB) \
  pure_vendor_install :: all
  	$(NOECHO) umask 022; $(MOD_INSTALL) \
--		read }.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist=
').q{ \
+ };
+-    push @m,
+-q{		read }.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packli=
st').q{ \
 -		write }.$self->catfile('$(DESTINSTALLVENDORARCH)','auto','$(FULLEXT)','=
.packlist').q{ \
- 		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
- 		$(INST_ARCHLIB) $(DESTINSTALLVENDORARCH) \
- 		$(INST_BIN) $(DESTINSTALLVENDORBIN) \
-@@ -2091,37 +2087,19 @@ pure_vendor_install :: all
- 		$(INST_MAN3DIR) $(DESTINSTALLVENDORMAN3DIR)
+-} unless $self->{NO_PACKLIST};
+=20
+     push @m,
+ q{		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
+@@ -2144,37 +2135,19 @@ doc_vendor_install :: all
 =20
+     push @m, q{
  doc_perl_install :: all
 -	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
 -	-$(NOECHO) umask 022; $(MKPATH) $(DESTINSTALLARCHLIB)
@@ -70,9 +74,9 @@ index 42bbb83..a16e2d0 100644
 -		EXE_FILES "$(EXE_FILES)" \
 -		>> }.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{
 =20
- };
+ } unless $self->{NO_PERLLOCAL};
 =20
-@@ -2130,13 +2108,12 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
+@@ -2183,13 +2156,12 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
  	$(NOECHO) $(NOOP)
 =20
  uninstall_from_perldirs ::
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/perl5db-x-termin=
al-emulator.patch b/meta/recipes-devtools/perl/perl-5.20.0/debian/perl5db-x=
-terminal-emulator.patch
new file mode 100644
index 0000000..82a9f1a
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/perl5db-x-terminal-emul=
ator.patch
@@ -0,0 +1,29 @@
+From dc495a233b95d7e3e6900845847035da8f01aa59 Mon Sep 17 00:00:00 2001
+From: Dominic Hargreaves <dom@earth.li>
+Date: Sat, 14 Apr 2012 11:34:05 +0100
+Subject: Invoke x-terminal-emulator rather than xterm in perl5db.pl
+
+In Debian systems, xterm might not exist or might not be the preferred
+terminal emulator. Use x-terminal-emulator instead
+
+Bug-Debian: http://bugs.debian.org/668490
+Forwarded: not-needed
+
+Patch-Name: debian/perl5db-x-terminal-emulator.patch
+---
+ lib/perl5db.pl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/perl5db.pl b/lib/perl5db.pl
+index 707d04d..6ac4d36 100644
+--- a/lib/perl5db.pl
++++ b/lib/perl5db.pl
+@@ -6945,7 +6945,7 @@ properly set up.
+ sub xterm_get_fork_TTY {
+     ( my $name =3D $0 ) =3D~ s,^.*[/\\],,s;
+     open XT,
+-qq[3>&1 xterm -title "Daughter Perl debugger $pids $name" -e sh -c 'tty 1=
>&3;\
++qq[3>&1 x-terminal-emulator -T "Daughter Perl debugger $pids $name" -e sh=
 -c 'tty 1>&3;\
+  sleep 10000000' |];
+=20
+     # Get the output from 'tty' and clean it up a little.
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/perlivp.diff b/m=
eta/recipes-devtools/perl/perl-5.20.0/debian/perlivp.diff
similarity index 78%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/perlivp.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/perlivp.diff
index 21711e8..60a714f 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/perlivp.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/perlivp.diff
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From 4c7e04f75c9513451d1622e5a6dd58c2c8377d81 Mon Sep 17 00:00:00 2001
+From 70eb3e56e884e62bcf837c1f8cd32e35e5552889 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Fri, 9 Jan 2009 18:54:47 +0200
 Subject: Make perlivp skip include directories in /usr/local
@@ -23,18 +22,18 @@ Signed-off-by: Niko Tyni <ntyni@debian.org>
=20
 Patch-Name: debian/perlivp.diff
 ---
- utils/perlivp.PL |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
+ utils/perlivp.PL | 1 +
+ 1 file changed, 1 insertion(+)
=20
 diff --git a/utils/perlivp.PL b/utils/perlivp.PL
-index 6fcb670..1401cac 100644
+index c2f0a11..cc49f96 100644
 --- a/utils/perlivp.PL
 +++ b/utils/perlivp.PL
-@@ -142,6 +142,7 @@ my $INC_total =3D 0;
+@@ -153,6 +153,7 @@ my $INC_total =3D 0;
  my $INC_there =3D 0;
  foreach (@INC) {
      next if $_ eq '.'; # skip -d test here
 +    next if m|/usr/local|; # not shipped on Debian
      if (-d $_) {
-         print "## Perl \@INC directory `$_' exists.\n" if $opt{'v'};
+         print "## Perl \@INC directory '$_' exists.\n" if $opt{'v'};
          $INC_there++;
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/prefix_changes.d=
iff b/meta/recipes-devtools/perl/perl-5.20.0/debian/prefix_changes.diff
similarity index 75%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/prefix_changes.di=
ff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/prefix_changes.diff
index 5a1ad99..535a90d 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/prefix_changes.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/prefix_changes.diff
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From 148e2717682ce8c65475ffdeea84b3cdd1ab1649 Mon Sep 17 00:00:00 2001
+From 9ff12f918da84dc355b75fbaa5374a8e276f76d7 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Fiddle with *PREFIX and variables written to the makefile
@@ -11,17 +10,17 @@ modules).
=20
 Patch-Name: debian/prefix_changes.diff
 ---
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm  |   12 ++++++------
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm |    3 +--
- cpan/ExtUtils-MakeMaker/t/INST.t                |    4 +---
- cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t         |   10 +++++-----
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm  | 12 ++++++------
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm |  3 +--
+ cpan/ExtUtils-MakeMaker/t/INST.t                |  4 +---
+ cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t         | 10 +++++-----
  4 files changed, 13 insertions(+), 16 deletions(-)
=20
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm b/cpan/ExtUtil=
s-MakeMaker/lib/ExtUtils/MM_Any.pm
-index a38f274..93d3fe9 100644
+index 2066311..0a1fb49 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm
-@@ -701,8 +701,6 @@ all POD files in MAN1PODS and MAN3PODS.
+@@ -765,8 +765,6 @@ all POD files in MAN1PODS and MAN3PODS.
  sub manifypods_target {
      my($self) =3D shift;
 =20
@@ -30,16 +29,16 @@ index a38f274..93d3fe9 100644
      my $dependencies  =3D '';
 =20
      # populate manXpods & dependencies:
-@@ -718,7 +716,7 @@ END
+@@ -782,7 +780,7 @@ END
      foreach my $section (qw(1 3)) {
          my $pods =3D $self->{"MAN${section}PODS"};
-         push @man_cmds, $self->split_command(<<CMD, %$pods);
+         push @man_cmds, $self->split_command(<<CMD, map {($_,$pods->{$_})=
} sort keys %$pods);
 -	\$(NOECHO) \$(POD2MAN) --section=3D$section --perm_rw=3D\$(PERM_RW)
 +	\$(NOECHO) \$(POD2MAN) --section=3D\$(MAN${section}EXT) --perm_rw=3D\$(P=
ERM_RW)
  CMD
      }
 =20
-@@ -1521,9 +1519,11 @@ sub init_INSTALL_from_PREFIX {
+@@ -1748,9 +1746,11 @@ sub init_INSTALL_from_PREFIX {
          $self->{SITEPREFIX}   ||=3D $sprefix;
          $self->{VENDORPREFIX} ||=3D $vprefix;
 =20
@@ -55,24 +54,24 @@ index a38f274..93d3fe9 100644
 =20
      my $arch    =3D $Config{archname};
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index a16e2d0..c308c49 100644
+index 0a6797f..c19a5f9 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2981,8 +2981,7 @@ sub prefixify {
-     print STDERR "  prefixify $var =3D> $path\n" if $Verbose >=3D 2;
-     print STDERR "    from $sprefix to $rprefix\n" if $Verbose >=3D 2;
+@@ -3029,8 +3029,7 @@ sub prefixify {
+     warn "  prefixify $var =3D> $path\n" if $Verbose >=3D 2;
+     warn "    from $sprefix to $rprefix\n" if $Verbose >=3D 2;
 =20
 -    if( $self->{ARGS}{PREFIX} &&
--        $path !~ s{^\Q$sprefix\E\b}{$rprefix}s )=20
+-        $path !~ s{^\Q$sprefix\E\b}{$rprefix}s )
 +    if( $path !~ s{^\Q$sprefix\E\b}{$rprefix}s && $self->{ARGS}{PREFIX} )
      {
 =20
-         print STDERR "    cannot prefix, using default.\n" if $Verbose >=
=3D 2;
+         warn "    cannot prefix, using default.\n" if $Verbose >=3D 2;
 diff --git a/cpan/ExtUtils-MakeMaker/t/INST.t b/cpan/ExtUtils-MakeMaker/t/=
INST.t
-index 6aac294..28294f2 100644
+index 91058bb..e399ced 100644
 --- a/cpan/ExtUtils-MakeMaker/t/INST.t
 +++ b/cpan/ExtUtils-MakeMaker/t/INST.t
-@@ -61,9 +61,7 @@ isa_ok( $mm, 'ExtUtils::MakeMaker' );
+@@ -65,9 +65,7 @@ isa_ok( $mm, 'ExtUtils::MakeMaker' );
  is( $mm->{NAME}, 'Big::Dummy',  'NAME' );
  is( $mm->{VERSION}, 0.01,            'VERSION' );
 =20
@@ -84,7 +83,7 @@ index 6aac294..28294f2 100644
  is( !!$mm->{PERL_CORE}, !!$ENV{PERL_CORE}, 'PERL_CORE' );
 =20
 diff --git a/cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t b/cpan/ExtUtils-MakeM=
aker/t/INST_PREFIX.t
-index fbb18a3..8987569 100644
+index e8de7c6..3fb3f12 100644
 --- a/cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t
 +++ b/cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t
 @@ -10,7 +10,7 @@ BEGIN {
@@ -96,8 +95,8 @@ index fbb18a3..8987569 100644
  use MakeMaker::Test::Utils;
  use MakeMaker::Test::Setup::BFD;
  use ExtUtils::MakeMaker;
-@@ -58,16 +58,16 @@ like( $stdout->read, qr{
- 			Writing\ MYMETA.yml\n
+@@ -62,16 +62,16 @@ like( $stdout->read, qr{
+                         (?:Writing\ MYMETA.yml\ and\ MYMETA.json\n)?
  }x );
 =20
 -is( $mm->{PREFIX}, '$(SITEPREFIX)', 'PREFIX set based on INSTALLDIRS' );
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/prune_libs.diff =
b/meta/recipes-devtools/perl/perl-5.20.0/debian/prune_libs.diff
similarity index 74%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/prune_libs.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/prune_libs.diff
index e3c320e..50bcc47 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/prune_libs.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/prune_libs.diff
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From 063566907896ff32bea27897fa73cebbbd7bacce Mon Sep 17 00:00:00 2001
+From f2d2ddd656999f51148c66a3efce76bda8d2f9ca Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
 Subject: Prune the list of libraries wanted to what we actually need.
@@ -11,29 +10,29 @@ and some of the original list may be present on buildds=
 (see Bug#128355).
=20
 Patch-Name: debian/prune_libs.diff
 ---
- Configure |    5 ++---
- 1 files changed, 2 insertions(+), 3 deletions(-)
+ Configure | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
=20
 diff --git a/Configure b/Configure
-index d9911f9..f59f75c 100755
+index 293ef61..3f80a76 100755
 --- a/Configure
 +++ b/Configure
-@@ -1367,8 +1367,7 @@ libswanted_uselargefiles=3D''
+@@ -1387,8 +1387,7 @@ libswanted_uselargefiles=3D''
  : set usesocks on the Configure command line to enable socks.
  : List of libraries we want.
  : If anyone needs extra -lxxx, put those in a hint file.
--libswanted=3D"sfio socket bind inet nsl nm ndbm gdbm dbm db malloc dl dld=
 ld sun"
+-libswanted=3D"socket bind inet nsl nm ndbm gdbm dbm db malloc dl ld sun"
 -libswanted=3D"$libswanted m crypt sec util c cposix posix ucb bsd BSD"
 +libswanted=3D'gdbm gdbm_compat db dl m c crypt'
  : We probably want to search /usr/shlib before most other libraries.
  : This is only used by the lib/ExtUtils/MakeMaker.pm routine extliblist.
  glibpth=3D`echo " $glibpth " | sed -e 's! /usr/shlib ! !'`
-@@ -22308,7 +22307,7 @@ sunos*X4*)
+@@ -22796,7 +22795,7 @@ sunos*X4*)
      ;;
  *) case "$usedl" in
      $define|true|[yY]*)
--	    set X `echo " $libs " | sed -e 's@ -lndbm @ @' -e 's@ -lgdbm @ @' -e=
 's@ -lgdbm_compat @ @' -e 's@ -ldbm @ @' -e 's@ -ldb @ @'`=20
-+	    set X `echo " $libs " | sed -e 's@ -lgdbm @ @' -e 's@ -lgdbm_compat =
@ @' -e 's@ -ldb @ @'`=20
+-	    set X `echo " $libs " | sed -e 's@ -lndbm @ @' -e 's@ -lgdbm @ @' -e=
 's@ -lgdbm_compat @ @' -e 's@ -ldbm @ @' -e 's@ -ldb @ @'`
++	    set X `echo " $libs " | sed -e 's@ -lgdbm @ @' -e 's@ -lgdbm_compat =
@ @' -e 's@ -ldb @ @'`
  	    shift
  	    perllibs=3D"$*"
  	    ;;
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/regen-skip.diff =
b/meta/recipes-devtools/perl/perl-5.20.0/debian/regen-skip.diff
new file mode 100644
index 0000000..50bc97c
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/regen-skip.diff
@@ -0,0 +1,27 @@
+From 55a3d4b004595a9f171d79329c9d218f0b850bd8 Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Sat, 17 May 2014 14:57:01 +0300
+Subject: Skip a regeneration check in unrelated git repositories
+
+If the test is run in a git repository without lib/.gitignore,
+for instance because the repository only imported the Perl tarball,
+the regeneration check is broken because lib/.gitignore is missing.
+
+Patch-Name: debian/regen-skip.diff
+---
+ regen/lib_cleanup.pl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/regen/lib_cleanup.pl b/regen/lib_cleanup.pl
+index c9d6e43..fece1ed 100644
+--- a/regen/lib_cleanup.pl
++++ b/regen/lib_cleanup.pl
+@@ -159,7 +159,7 @@ foreach ('win32/Makefile', 'win32/makefile.mk') {
+ }
+=20
+ # This must come last as it can exit early:
+-if ($TAP && !-d '.git' && !-f 'lib/.gitignore') {
++if ($TAP && !-d '.git' || !-f 'lib/.gitignore') {
+     print "ok # skip not being run from a git checkout, hence no lib/.git=
ignore\n";
+     exit 0;
+ }
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/skip-kfreebsd-cr=
ash.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/skip-kfreebsd-cras=
h.diff
similarity index 71%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/skip-kfreebsd-cra=
sh.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/skip-kfreebsd-crash=
.diff
index cdade88..f7cc555 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/skip-kfreebsd-crash.dif=
f
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/skip-kfreebsd-crash.dif=
f
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From ff2815399ad94915da2e63cb3c4bbd2d02dac4b2 Mon Sep 17 00:00:00 2001
+From 21747cdd5381a9466fc75ead783980ced8b184a3 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Fri, 5 Aug 2011 10:50:18 +0300
 Subject: Skip a crashing test case in t/op/threads.t on GNU/kFreeBSD
@@ -14,27 +13,28 @@ Skip the test until the culprit is found.
=20
 Patch-Name: debian/skip-kfreebsd-crash.diff
 ---
- t/op/threads.t |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
+ t/op/threads.t | 4 ++++
+ 1 file changed, 4 insertions(+)
=20
 diff --git a/t/op/threads.t b/t/op/threads.t
-index 24e84e4..6a91366 100644
+index 6fb2410..67b5f4a 100644
 --- a/t/op/threads.t
 +++ b/t/op/threads.t
-@@ -342,6 +342,9 @@ threads->create(
+@@ -376,6 +376,9 @@ EOF
+ }
 =20
- EOI
 =20
 +SKIP: {
 +    skip "[perl #96272] avoid crash on GNU/kFreeBSD", 1
 +        if $^O eq 'gnukfreebsd';
  # [perl #78494] Pipes shared between threads block when closed
- watchdog 10;
  {
-@@ -351,5 +354,6 @@ watchdog 10;
+   my $perl =3D which_perl;
+@@ -384,6 +387,7 @@ EOF
    threads->create(sub { })->join;
    ok(1, "Pipes shared between threads do not block when closed");
  }
 +}
 =20
- # EOF
+ # [perl #105208] Typeglob clones should not be cloned again during a join
+ {
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/skip-upstream-gi=
t-tests.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/skip-upstream-=
git-tests.diff
new file mode 100644
index 0000000..7110298
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/skip-upstream-git-tests=
.diff
@@ -0,0 +1,28 @@
+From 4d1b20bcec1610d22b718ffae154427a7a218632 Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Fri, 22 Apr 2011 11:15:32 +0300
+Subject: Skip tests specific to the upstream Git repository
+
+These tests fail if run from a different git repository than
+upstream. This complicates things needlessly for downstream packagers.
+
+Skip the tests altogether even if the .git directory exists.
+
+Patch-Name: debian/skip-upstream-git-tests.diff
+---
+ t/test.pl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/t/test.pl b/t/test.pl
+index 30db88c..0fdc4f4 100644
+--- a/t/test.pl
++++ b/t/test.pl
+@@ -159,7 +159,7 @@ sub skip_all_without_config {
+=20
+ sub find_git_or_skip {
+     my ($source_dir, $reason);
+-    if (-d '.git') {
++    if (-d '.git' && ! -d 'debian') {
+ 	$source_dir =3D '.';
+     } elsif (-l 'MANIFEST' && -l 'AUTHORS') {
+ 	my $where =3D readlink 'MANIFEST';
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/squelch-locale-w=
arnings.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/squelch-locale=
-warnings.diff
similarity index 63%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/squelch-locale-wa=
rnings.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/squelch-locale-warn=
ings.diff
index f0a6924..5c19004 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/squelch-locale-warnings=
.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/squelch-locale-warnings=
.diff
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From 718e9cbd59f0739fc9104af111e42fff66f927a7 Mon Sep 17 00:00:00 2001
+From 2f332eeedbf63f72f6b1b157a912282a31a25d3b Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Sun, 3 Oct 2010 21:36:17 +0300
 Subject: Squelch locale warnings in Debian package maintainer scripts
@@ -16,30 +15,30 @@ the warning will be triggered normally again at that po=
int.
=20
 Patch-Name: debian/squelch-locale-warnings.diff
 ---
- locale.c           |    4 ++++
- pod/perllocale.pod |    8 ++++++++
- 2 files changed, 12 insertions(+), 0 deletions(-)
+ locale.c           | 4 ++++
+ pod/perllocale.pod | 8 ++++++++
+ 2 files changed, 12 insertions(+)
=20
 diff --git a/locale.c b/locale.c
-index 4631b86..94a0962 100644
+index 6e8728c..f55c4b2 100644
 --- a/locale.c
 +++ b/locale.c
-@@ -359,6 +359,10 @@ Perl_init_i18nl10n(pTHX_ int printwarn)
- 	char *p;
- 	const bool locwarn =3D (printwarn > 1 ||
- 			(printwarn &&
+@@ -512,6 +512,10 @@ Perl_init_i18nl10n(pTHX_ int printwarn)
+     char *p;
+     const bool locwarn =3D (printwarn > 1 ||
+                     (printwarn &&
 +
-+			 /* Debian specific change - see http://bugs.debian.org/508764 */
-+			 (!PerlEnv_getenv("DPKG_RUNNING_VERSION")) &&
++                     /* Debian specific change - see http://bugs.debian.o=
rg/508764 */
++                     (!PerlEnv_getenv("DPKG_RUNNING_VERSION")) &&
 +
- 			 (!(p =3D PerlEnv_getenv("PERL_BADLANG")) || atoi(p))));
-=20
- 	if (locwarn) {
+                      (!(p =3D PerlEnv_getenv("PERL_BADLANG")) || atoi(p))=
));
+     bool done =3D FALSE;
+     const char *system_default_locale =3D NULL;
 diff --git a/pod/perllocale.pod b/pod/perllocale.pod
-index 8926d8b..6c55889 100644
+index 914281f..15de0d4 100644
 --- a/pod/perllocale.pod
 +++ b/pod/perllocale.pod
-@@ -861,6 +861,14 @@ B<NOTE>: PERL_BADLANG only gives you a way to hide th=
e warning message.
+@@ -1151,6 +1151,14 @@ B<NOTE>: PERL_BADLANG only gives you a way to hide =
the warning message.
  The message tells about some problem in your system's locale support,
  and you should investigate what the problem is.
 =20
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/debian/writable_site_di=
rs.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/writable_site_dirs.=
diff
similarity index 63%
rename from meta/recipes-devtools/perl/perl-5.14.3/debian/writable_site_dir=
s.diff
rename to meta/recipes-devtools/perl/perl-5.20.0/debian/writable_site_dirs.=
diff
index a4a9adf..f73f8bb 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/debian/writable_site_dirs.diff
+++ b/meta/recipes-devtools/perl/perl-5.20.0/debian/writable_site_dirs.diff
@@ -1,5 +1,4 @@
-Upstream-Status:Inappropriate [debian patches]
-From 492e0d6b4e3e0d786fb88b9058d581f6466c4a3e Mon Sep 17 00:00:00 2001
+From f33f120f0fdf7cd100066390fe0bc426d45b1929 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Set umask approproately for site install directories
@@ -8,23 +7,23 @@ Policy requires group writable site directories
=20
 Patch-Name: debian/writable_site_dirs.diff
 ---
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm |    6 +++---
- 1 files changed, 3 insertions(+), 3 deletions(-)
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 865d36d..4ee6b3f 100644
+index 8fdb67c..8b86a24 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2067,7 +2067,7 @@ pure_perl_install :: all
+@@ -2095,7 +2095,7 @@ q{		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
 =20
 =20
  pure_site_install :: all
 -	$(NOECHO) umask 022; $(MOD_INSTALL) \
 +	$(NOECHO) umask 02; $(MOD_INSTALL) \
- 		read }.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist')=
.q{ \
- 		write }.$self->catfile('$(DESTINSTALLSITEARCH)','auto','$(FULLEXT)','.p=
acklist').q{ \
- 		$(INST_LIB) $(DESTINSTALLSITELIB) \
-@@ -2103,8 +2103,8 @@ doc_perl_install :: all
+ };
+     push @m,
+ q{		read }.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist=
').q{ \
+@@ -2156,8 +2156,8 @@ doc_perl_install :: all
 =20
  doc_site_install :: all
  	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/dynaloaderhack.patch b/=
meta/recipes-devtools/perl/perl-5.20.0/dynaloaderhack.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/dynaloaderhack.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/dynaloaderhack.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/fix_bad_rpath.patch b/m=
eta/recipes-devtools/perl/perl-5.20.0/fix_bad_rpath.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/fix_bad_rpath.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/fix_bad_rpath.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/generate-sh.patch b/met=
a/recipes-devtools/perl/perl-5.20.0/generate-sh.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/generate-sh.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/generate-sh.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/installperl.patch b/met=
a/recipes-devtools/perl/perl-5.20.0/installperl.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/installperl.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/installperl.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/letgcc-find-errno.patch=
 b/meta/recipes-devtools/perl/perl-5.20.0/letgcc-find-errno.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/letgcc-find-errno.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/letgcc-find-errno.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/native-nopacklist.patch=
 b/meta/recipes-devtools/perl/perl-5.20.0/native-nopacklist.patch
similarity index 68%
rename from meta/recipes-devtools/perl/perl-5.14.3/native-nopacklist.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/native-nopacklist.patch
index 389c334..aafe0e2 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/native-nopacklist.patch
+++ b/meta/recipes-devtools/perl/perl-5.20.0/native-nopacklist.patch
@@ -2,31 +2,40 @@ Upstream-Status:Inappropriate [debian patch]
=20
 Part of 52_debian_extutils_hacks.patch just to exclude the installation of=
 .packlist files
=20
-Index: perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- perl-5.12.3.orig/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-+++ perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2047,8 +2047,6 @@ doc__install : doc_site_install
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 36 +++-----------------=
-----
+ 1 file changed, 4 insertions(+), 32 deletions(-)
+
+diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+@@ -2079,11 +2079,6 @@ pure_perl_install :: all
+ };
 =20
- pure_perl_install :: all
- 	$(NOECHO) $(MOD_INSTALL) \
--		read }.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist'=
).q{ \
+     push @m,
+-q{		read }.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlis=
t').q{ \
 -		write }.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$(FULLEXT)','.pa=
cklist').q{ \
- 		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
+-} unless $self->{NO_PACKLIST};
+-
+-    push @m,
+ q{		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
  		$(INST_ARCHLIB) $(DESTINSTALLARCHLIB) \
  		$(INST_BIN) $(DESTINSTALLBIN) \
-@@ -2074,8 +2072,6 @@ pure_site_install :: all
-=20
+@@ -2115,10 +2110,6 @@ q{		$(INST_LIB) $(DESTINSTALLSITELIB) \
  pure_vendor_install :: all
  	$(NOECHO) $(MOD_INSTALL) \
--		read }.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist=
').q{ \
+ };
+-    push @m,
+-q{		read }.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packli=
st').q{ \
 -		write }.$self->catfile('$(DESTINSTALLVENDORARCH)','auto','$(FULLEXT)','=
.packlist').q{ \
- 		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
- 		$(INST_ARCHLIB) $(DESTINSTALLVENDORARCH) \
- 		$(INST_BIN) $(DESTINSTALLVENDORBIN) \
-@@ -2084,37 +2080,19 @@ pure_vendor_install :: all
- 		$(INST_MAN3DIR) $(DESTINSTALLVENDORMAN3DIR)
+-} unless $self->{NO_PACKLIST};
+=20
+     push @m,
+ q{		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
+@@ -2144,37 +2135,19 @@ doc_vendor_install :: all
 =20
+     push @m, q{
  doc_perl_install :: all
 -	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
 -	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
@@ -63,9 +72,9 @@ Index: perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/M=
M_Unix.pm
 -		EXE_FILES "$(EXE_FILES)" \
 -		>> }.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{
 =20
- };
+ } unless $self->{NO_PERLLOCAL};
 =20
-@@ -2123,13 +2101,12 @@ uninstall :: uninstall_from_$(INSTALLDIR
+@@ -2183,13 +2156,12 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
  	$(NOECHO) $(NOOP)
 =20
  uninstall_from_perldirs ::
@@ -80,3 +89,6 @@ Index: perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/M=
M_Unix.pm
  };
 =20
      join("",@m);
+--=20
+1.8.1.2
+
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/native-perlinc.patch b/=
meta/recipes-devtools/perl/perl-5.20.0/native-perlinc.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/native-perlinc.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/native-perlinc.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/perl-5.14.3-fix-CVE-201=
0-4777.patch b/meta/recipes-devtools/perl/perl-5.20.0/perl-5.14.3-fix-CVE-2=
010-4777.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/perl-5.14.3-fix-CVE-2010=
-4777.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/perl-5.14.3-fix-CVE-2010-4=
777.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/perl-archlib-exp.patch =
b/meta/recipes-devtools/perl/perl-5.20.0/perl-archlib-exp.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/perl-archlib-exp.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/perl-archlib-exp.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/perl-configpm-switch.pa=
tch b/meta/recipes-devtools/perl/perl-5.20.0/perl-configpm-switch.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/perl-configpm-switch.pat=
ch
rename to meta/recipes-devtools/perl/perl-5.20.0/perl-configpm-switch.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/perl-configure.sh b/met=
a/recipes-devtools/perl/perl-5.20.0/perl-configure.sh
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/perl-configure.sh
rename to meta/recipes-devtools/perl/perl-5.20.0/perl-configure.sh
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/perl-dynloader.patch b/=
meta/recipes-devtools/perl/perl-5.20.0/perl-dynloader.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/perl-dynloader.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/perl-dynloader.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/perl-enable-gdbm.patch =
b/meta/recipes-devtools/perl/perl-5.20.0/perl-enable-gdbm.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/perl-enable-gdbm.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/perl-enable-gdbm.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/perl-moreconfig.patch b=
/meta/recipes-devtools/perl/perl-5.20.0/perl-moreconfig.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/perl-moreconfig.patch
rename to meta/recipes-devtools/perl/perl-5.20.0/perl-moreconfig.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.3/run-ptest b/meta/recipe=
s-devtools/perl/perl-5.20.0/run-ptest
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.3/run-ptest
rename to meta/recipes-devtools/perl/perl-5.20.0/run-ptest
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/test/dist-threads-t-joi=
n.t-adjust-ps-option.patch b/meta/recipes-devtools/perl/perl-5.20.0/test/di=
st-threads-t-join.t-adjust-ps-option.patch
new file mode 100644
index 0000000..08a6b0a
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.20.0/test/dist-threads-t-join.t-adj=
ust-ps-option.patch
@@ -0,0 +1,38 @@
+dist/threads/t/join.t: adjust ps option
+
+The ps's option '-f' is not supported by busybox in oe.
+
+Upstream-Status: [oe specific]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ dist/threads/t/join.t | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/dist/threads/t/join.t b/dist/threads/t/join.t
+--- a/dist/threads/t/join.t
++++ b/dist/threads/t/join.t
+@@ -118,7 +118,7 @@ if ($^O eq 'linux') {
+                  })->join;
+     #print "# mainthread: \$0 =3D $0\n";
+     #print "# pid =3D $$\n";
+-    if (open PS, "ps -f |") { # Note: must work in (all) systems.
++    if (open PS, "ps |") { # Note: must work in (all) systems.
+         my ($sawpid, $sawexe);
+         while (<PS>) {
+             chomp;
+@@ -135,10 +135,10 @@ if ($^O eq 'linux') {
+         if ($sawpid) {
+             ok($sawpid && $sawexe, 'altering $0 is effective');
+         } else {
+-            skip("\$0 check: did not see pid $$ in 'ps -f |'");
++            skip("\$0 check: did not see pid $$ in 'ps |'");
+         }
+     } else {
+-        skip("\$0 check: opening 'ps -f |' failed: $!");
++        skip("\$0 check: opening 'ps |' failed: $!");
+     }
+ } else {
+     skip("\$0 check: only on Linux");
+--=20
+1.8.1.2
+
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/test/ext-DynaLoader-t-D=
ynaLoader.t-fix-calling-dl_findfil.patch b/meta/recipes-devtools/perl/perl-=
5.20.0/test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch
new file mode 100644
index 0000000..1ee818c
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.20.0/test/ext-DynaLoader-t-DynaLoad=
er.t-fix-calling-dl_findfil.patch
@@ -0,0 +1,26 @@
+ext/DynaLoader/t/DynaLoader.t: fix calling dl_findfile() failed
+
+Use '$Config{libc}' as the libc file name
+
+Upstream-Status: oe specific
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ ext/DynaLoader/t/DynaLoader.t | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/DynaLoader/t/DynaLoader.t b/ext/DynaLoader/t/DynaLoader.t
+index ade1f8e..3567afe 100644
+--- a/ext/DynaLoader/t/DynaLoader.t
++++ b/ext/DynaLoader/t/DynaLoader.t
+@@ -106,7 +106,7 @@ ok( defined $dlerr, "dl_error() returning an error mes=
sage: '$dlerr'" );
+ # ... dl_findfile()
+ SKIP: {
+     my @files =3D ();
+-    eval { @files =3D DynaLoader::dl_findfile("c") };
++    eval { @files =3D DynaLoader::dl_findfile($Config{libc}) };
+     is( $@, '', "calling dl_findfile()" );
+     # Some platforms are known to not have a "libc"
+     # (not at least by that name) that the dl_findfile()
+--=20
+1.8.1.2
+
diff --git a/meta/recipes-devtools/perl/perl-native_5.14.3.bb b/meta/recipe=
s-devtools/perl/perl-native_5.20.0.bb
similarity index 71%
rename from meta/recipes-devtools/perl/perl-native_5.14.3.bb
rename to meta/recipes-devtools/perl/perl-native_5.20.0.bb
index c38be41..4364d41 100644
--- a/meta/recipes-devtools/perl/perl-native_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.20.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE =3D "http://www.perl.org/"
 SECTION =3D "libs"
 LICENSE =3D "Artistic-1.0 | GPL-1.0"
=20
-LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcfcbdee469f02565f253d81=
a \
-                    file://Artistic;md5=3Df921793d03cc6d63ec4b15e9be8fd3f8=
"
+LIC_FILES_CHKSUM =3D "file://Copying;md5=3D5b122a36d0f6dc55279a0ebc69f3c60=
b \
+                    file://Artistic;md5=3D2e6fd2475335af892494fe1f7327baf3=
"
=20
 # 5.10.1 has Module::Build built-in
 PROVIDES +=3D "libmodule-build-perl-native"
@@ -17,11 +17,10 @@ SRC_URI =3D "http://www.cpan.org/src/5.0/perl-${PV}.tar=
.gz \
            file://MM_Unix.pm.patch \
            file://debian/errno_ver.diff \
            file://dynaloaderhack.patch \
-           file://perl-build-in-t-dir.patch \
            file://perl-5.14.3-fix-CVE-2010-4777.patch "
=20
-SRC_URI[md5sum] =3D "f6a3d878c688d111b495c87db56c5be5"
-SRC_URI[sha256sum] =3D "03638a4f01bc26b81231233671524b4163849a3a9ea5cc2397=
293080c4ea339f"
+SRC_URI[md5sum] =3D "406ec049ebe3afcc80d9c76ec78ca4f8"
+SRC_URI[sha256sum] =3D "4e8c28ad6ecc89902f9cb2e76f2815bb1a8287ded278e15f7a=
36ca45f8bbcd02"
=20
 S =3D "${WORKDIR}/perl-${PV}"
=20
@@ -87,16 +86,19 @@ do_install () {
 	install lib/ExtUtils/typemap ${D}${libdir}/perl/${PV}/ExtUtils/
=20
 	# perl shared library headers
-	for i in av.h bitcount.h config.h cop.h cv.h dosish.h embed.h embedvar.h =
\
-		EXTERN.h fakesdio.h fakethr.h form.h gv.h handy.h hv.h INTERN.h \
-		intrpvar.h iperlsys.h keywords.h l1_char_class_tab.h malloc_ctl.h \
-		metaconfig.h mg.h mydtrace.h nostdio.h opcode.h op.h opnames.h \
-		op_reg_common.h overload.h pad.h parser.h patchlevel.h perlapi.h \
-		perl.h perlio.h perliol.h perlsdio.h perlsfio.h perlvars.h \
-		perly.h pp.h pp_proto.h proto.h reentr.h regcharclass.h regcomp.h \
-		regexp.h regnodes.h scope.h sv.h thread.h time64_config.h \
-		time64.h uconfig.h unixish.h utf8.h utfebcdic.h util.h \
-		uudmap.h warnings.h XSUB.h=20
+	# reference perl 5.20.0-1 in debian:
+	# https://packages.debian.org/experimental/i386/perl/filelist
+	for i in av.h bitcount.h charclass_invlists.h config.h cop.h cv.h dosish.=
h \
+		embed.h embedvar.h EXTERN.h fakesdio.h feature.h form.h git_version.h \
+		gv.h handy.h hv_func.h hv.h inline.h INTERN.h intrpvar.h iperlsys.h \
+		keywords.h l1_char_class_tab.h malloc_ctl.h metaconfig.h mg_data.h \
+		mg.h mg_raw.h mg_vtable.h mydtrace.h nostdio.h opcode.h op.h \
+		opnames.h op_reg_common.h overload.h pad.h parser.h patchlevel.h \
+		perlapi.h perl.h perlio.h perliol.h perlsdio.h perlvars.h perly.h \
+		pp.h pp_proto.h proto.h reentr.h regcharclass.h regcomp.h regexp.h \
+		regnodes.h scope.h sv.h thread.h time64_config.h time64.h uconfig.h \
+		unicode_constants.h unixish.h utf8.h utfebcdic.h util.h uudmap.h \
+		vutil.h warnings.h XSUB.h
 	do
 		install $i ${D}${libdir}/perl/${PV}/CORE
 	done
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devto=
ols/perl/perl-ptest.inc
index b1f1cb9..6a9df4a 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -5,37 +5,24 @@ SRC_URI +=3D "file://run-ptest \
=20
 do_install_ptest () {
 	mkdir -p ${D}${PTEST_PATH}
-	cp -pv TestInit.pm MANIFEST config.sh ${D}${PTEST_PATH}/
+	sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
+	sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
+	tar -cf - * --exclude \*.o --exclude libperl.so --exclude Makefile --excl=
ude makefile --exclude hostperl \
+		--exclude miniperl --exclude generate_uudmap | ( cd ${D}${PTEST_PATH} &&=
 tar -xf - )
+
+	sed -i -e "s,${D},,g" \
+	       -e "s,--sysroot=3D${STAGING_DIR_HOST},,g" \
+	       -e "s,-isystem${STAGING_INCDIR} ,,g" \
+	       -e "s,${STAGING_LIBDIR},${libdir},g" \
+	       -e "s,${STAGING_BINDIR},${bindir},g" \
+	       -e "s,${STAGING_INCDIR},${includedir},g" \
+	       -e "s,${STAGING_BINDIR_NATIVE}/perl-native/,${bindir}/,g" \
+	       -e "s,${STAGING_BINDIR_NATIVE}/,,g" \
+	       -e "s,${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX},${bindir},g" \
+	    ${D}${PTEST_PATH}/lib/Config.pm
+
+	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
=20
-	tar -cf - t/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/
-	ln -sf ${libdir}/perl/${PV} ${D}${PTEST_PATH}/lib
-
-	for dir in `find ext/ dist/ cpan/ -maxdepth 2 -type d -name t ` ; do
-	    tar -cf - $dir | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	done
-	for file in `find ext dist cpan -name \*.t -o -name \test.pl`;  do
-	    tar -cf - $file | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	done
-
-	# Tweaks to make tests pass
-	cp -pv lib/unicore/TestProp.pl ${D}${libdir}/perl/${PV}/unicore/
-	# Put all *.t files from the lib dir in the ptest package
-	cd lib
-	for file in `find -name \*.t`; do
-	    tar -cf - $file | ( cd ${D}${libdir}/perl/${PV} && tar -xf - )
-	done
-	cd ..
-
-	mkdir -p ${D}${libdir}/perl/${PV}/XS
-	cp -pv lib/XS/APItest.pm ${D}${libdir}/perl/${PV}/XS/
-	cp -pv lib/XS/Typemap.pm ${D}${libdir}/perl/${PV}/XS/
-	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/APItest
-	cp -pv lib/auto/XS/APItest/APItest.so ${D}${libdir}/perl/${PV}/auto/XS/AP=
Itest/
-	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/Typemap
-	cp -pv lib/auto/XS/Typemap/Typemap.so ${D}${libdir}/perl/${PV}/auto/XS/Ty=
pemap/
-	cp -pv cpan/Digest-MD5/README ${D}${PTEST_PATH}/cpan/Digest-MD5/
-	cp -pv cpan/Digest-MD5/MD5.xs ${D}${PTEST_PATH}/cpan/Digest-MD5/
 }
=20
 python populate_packages_prepend() {
diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.14.3.inc b/meta/rec=
ipes-devtools/perl/perl-rdepends_5.20.0.inc
similarity index 84%
rename from meta/recipes-devtools/perl/perl-rdepends_5.14.3.inc
rename to meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
index 8b2a040..47a7548 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.14.3.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
@@ -1,8 +1,7 @@
 # To create/update the perl-rdepends_${PV}.inc use this piece of ugly scri=
pt (modified for your arch/paths etc):
=20
-#[nitin@buildbox packages-split]$ pwd
-#/home/nitin/build/build3/tmp/work/i586-poky-linux/perl-5.8.8-r21/packages=
-split
-#/home/nitin/poky.git/build/tmp/work/x86_64-poky-linux/perl-5.12.2-r0/pack=
ages-split
+#jiahongxu:5.20.0-r1$ pwd
+#/home/jiahongxu/yocto/build-20140618-perl/tmp/work/i586-poky-linux/perl/5=
.20.0-r1
=20
 #1 cp -r packages-split packages-split.new && cd packages-split.new
 #2 find . -name \*.pm | xargs sed -i '/^=3Dhead/,/^=3Dcut/d'
@@ -22,7 +21,10 @@ RDEPENDS_${PN}-module-thread-queue +=3D "${PN}-module-at=
tributes"
=20
 # Depends list
 # copy contents of /tmp/1 in this file
+RDEPENDS_${PN}-module-anydbm-file +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-anydbm-file +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-cpan"
 RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-cwd"
@@ -31,66 +33,42 @@ RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-file-=
basename"
 RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-file-find"
 RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-file-spec-functions"
 RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-getopt-std"
+RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-if"
+RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-net-ping"
 RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-user-pwent"
 RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-app-prove-state"
+RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-getopt-long"
 RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-tap-harness"
-RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-tap-object"
-RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-tap-parser-utils"
-RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-text-parsewords"
+RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-app-prove-state-r=
esult"
+RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-file-find"
 RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-tap-base"
 RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-tap-parser-yamlis=
h-reader"
 RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-tap-parser-yamlis=
h-writer"
-RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-app-prove-state-result +=3D "${PN}-module-app-prove-=
state-result-test"
 RDEPENDS_${PN}-module-app-prove-state-result +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-app-prove-state-result +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-app-prove-state-result +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-app-prove-state-result +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-app-prove-state-result +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-app-prove-state-result-test +=3D "${PN}-module-stric=
t"
-RDEPENDS_${PN}-module-app-prove-state-result-test +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-archive-extract +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-archive-extract +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-archive-extract +=3D "${PN}-module-cwd"
-RDEPENDS_${PN}-module-archive-extract +=3D "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-archive-extract +=3D "${PN}-module-file-path"
-RDEPENDS_${PN}-module-archive-extract +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-archive-extract +=3D "${PN}-module-filehandle"
-RDEPENDS_${PN}-module-archive-extract +=3D "${PN}-module-ipc-cmd"
-RDEPENDS_${PN}-module-archive-extract +=3D "${PN}-module-locale-maketext-s=
imple"
-RDEPENDS_${PN}-module-archive-extract +=3D "${PN}-module-load"
-RDEPENDS_${PN}-module-archive-extract +=3D "${PN}-module-params-check"
-RDEPENDS_${PN}-module-archive-extract +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-archive-extract +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-archive-tar-constant"
-RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-archive-tar-file"
-RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-config"
-RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-cwd"
-RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-file-path"
-RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-file-spec-unix"
-RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-io-file"
-RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-io-zlib"
-RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-app-prove-state-result-test +=3D "${PN}-module-warni=
ngs"
 RDEPENDS_${PN}-module-archive-tar-constant +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-archive-tar-constant +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-archive-tar-constant +=3D "${PN}-module-io-compress-=
bzip2"
-RDEPENDS_${PN}-module-archive-tar-constant +=3D "${PN}-module-package-cons=
tants"
 RDEPENDS_${PN}-module-archive-tar-constant +=3D "${PN}-module-time-local"
 RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-module-archive-tar"
 RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-module-archive-tar-cons=
tant"
@@ -101,6 +79,20 @@ RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-modu=
le-file-spec-unix"
 RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-module-io-file"
 RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-archive-tar-constant"
+RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-archive-tar-file"
+RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-config"
+RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-cwd"
+RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-file-path"
+RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-file-spec"
+RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-file-spec-unix"
+RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-io-file"
+RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-io-zlib"
+RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-arybase +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-attribute-handlers +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-attribute-handlers +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-attribute-handlers +=3D "${PN}-module-vars"
@@ -110,12 +102,6 @@ RDEPENDS_${PN}-module-attributes +=3D "${PN}-module-ex=
porter"
 RDEPENDS_${PN}-module-attributes +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-attributes +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-attributes +=3D "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-fatal"
-RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-lib"
-RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-fatal"
@@ -134,6 +120,14 @@ RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module=
-carp"
 RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-constant"
+RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-fatal"
+RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-lib"
+RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-autodie-skip +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-autodie-skip +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-autoloader +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-autoloader +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-autosplit +=3D "${PN}-module-carp"
@@ -144,9 +138,9 @@ RDEPENDS_${PN}-module-autosplit +=3D "${PN}-module-file=
-path"
 RDEPENDS_${PN}-module-autosplit +=3D "${PN}-module-file-spec-functions"
 RDEPENDS_${PN}-module-autosplit +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-autouse +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-b +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-b +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-b +=3D "${PN}-module-xsloader"
+RDEPENDS_${PN}-module-base +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-base +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-base +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-b-concise +=3D "${PN}-module-b"
 RDEPENDS_${PN}-module-b-concise +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-b-concise +=3D "${PN}-module-exporter"
@@ -158,34 +152,17 @@ RDEPENDS_${PN}-module-b-debug +=3D "${PN}-module-stri=
ct"
 RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-b"
 RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-data-dumper"
+RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-feature"
+RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-overloading"
 RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-re"
 RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-b-lint +=3D "${PN}-module-b"
-RDEPENDS_${PN}-module-b-lint +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-b-lint +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-b-lint +=3D "${PN}-module-list-util"
-RDEPENDS_${PN}-module-b-lint +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-b-lint-debug +=3D "${PN}-module-overload"
-RDEPENDS_${PN}-module-b-showlex +=3D "${PN}-module-b"
-RDEPENDS_${PN}-module-b-showlex +=3D "${PN}-module-b-concise"
-RDEPENDS_${PN}-module-b-showlex +=3D "${PN}-module-b-terse"
-RDEPENDS_${PN}-module-b-showlex +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-b"
-RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-b-concise"
-RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-b-xref +=3D "${PN}-module-b"
-RDEPENDS_${PN}-module-b-xref +=3D "${PN}-module-config"
-RDEPENDS_${PN}-module-b-xref +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-base +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-base +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-base +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-benchmark +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-benchmark +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-benchmark +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-bigint +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-bigint +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-bigint +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-bigint +=3D "${PN}-module-math-bigint"
 RDEPENDS_${PN}-module-bigint +=3D "${PN}-module-math-bigint-trace"
@@ -215,12 +192,24 @@ RDEPENDS_${PN}-module-bigrat +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-blib +=3D "${PN}-module-cwd"
 RDEPENDS_${PN}-module-blib +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-blib +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-b +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-b +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-b +=3D "${PN}-module-xsloader"
+RDEPENDS_${PN}-module-b-showlex +=3D "${PN}-module-b"
+RDEPENDS_${PN}-module-b-showlex +=3D "${PN}-module-b-concise"
+RDEPENDS_${PN}-module-b-showlex +=3D "${PN}-module-b-terse"
+RDEPENDS_${PN}-module-b-showlex +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-b"
+RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-b-concise"
+RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-autosplit"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-cpan"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-cwd"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-data-dumper"
+RDEPENDS_${PN}-module-build +=3D "${PN}-module-dynaloader"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-extutils-cbuilder"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-extutils-install"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-extutils-installed"
@@ -234,10 +223,9 @@ RDEPENDS_${PN}-module-build +=3D "${PN}-module-file-fi=
nd"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-file-path"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-getopt-long"
+RDEPENDS_${PN}-module-build +=3D "${PN}-module-if"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-inc-latest"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-io-file"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-build"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-metadata"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-pod-man"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-tap-harness"
@@ -245,52 +233,70 @@ RDEPENDS_${PN}-module-build +=3D "${PN}-module-test-h=
arness"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-text-parsewords"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-build +=3D "${PN}-module-version"
+RDEPENDS_${PN}-module-build +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-b-xref +=3D "${PN}-module-b"
+RDEPENDS_${PN}-module-b-xref +=3D "${PN}-module-config"
+RDEPENDS_${PN}-module-b-xref +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-bytes +=3D "${PN}-module-bytes-heavy"
 RDEPENDS_${PN}-module-bytes +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-carp-heavy +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-carp +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-carp +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-carp +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-carp-heavy +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-cgi-cookie"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-cgi-util"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-config"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-overload "
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-shellwords"
 RDEPENDS_${PN}-module-cgi-apache +=3D "${PN}-module-cgi"
+RDEPENDS_${PN}-module-cgi-apache +=3D "${PN}-module-if"
 RDEPENDS_${PN}-module-cgi-carp +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-cgi-carp +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-cgi-carp +=3D "${PN}-module-file-spec"
+RDEPENDS_${PN}-module-cgi-carp +=3D "${PN}-module-if"
 RDEPENDS_${PN}-module-cgi-cookie +=3D "${PN}-module-cgi"
 RDEPENDS_${PN}-module-cgi-cookie +=3D "${PN}-module-cgi-util"
+RDEPENDS_${PN}-module-cgi-cookie +=3D "${PN}-module-if"
 RDEPENDS_${PN}-module-cgi-cookie +=3D "${PN}-module-overload"
 RDEPENDS_${PN}-module-cgi-cookie +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-cgi-cookie +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-cgi-fast +=3D "${PN}-module-cgi"
+RDEPENDS_${PN}-module-cgi-fast +=3D "${PN}-module-if"
 RDEPENDS_${PN}-module-cgi-fast +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-cgi-fast +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-cgi-cookie"
+RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-cgi-util"
+RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-config"
+RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-constant"
+RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-fcntl"
+RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-if"
+RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-overload "
+RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-text-parsewords"
 RDEPENDS_${PN}-module-cgi-pretty +=3D "${PN}-module-cgi"
+RDEPENDS_${PN}-module-cgi-pretty +=3D "${PN}-module-if"
 RDEPENDS_${PN}-module-cgi-pretty +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-cgi-push +=3D "${PN}-module-cgi"
 RDEPENDS_${PN}-module-cgi-push +=3D "${PN}-module-cgi-util"
+RDEPENDS_${PN}-module-cgi-push +=3D "${PN}-module-if"
 RDEPENDS_${PN}-module-cgi-switch +=3D "${PN}-module-cgi"
+RDEPENDS_${PN}-module-cgi-switch +=3D "${PN}-module-if"
+RDEPENDS_${PN}-module-cgi-util +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-cgi-util +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-cgi-util +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-cgi-util +=3D "${PN}-module-if"
 RDEPENDS_${PN}-module-cgi-util +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-cgi-util +=3D "${PN}-module-utf8"
-RDEPENDS_${PN}-module-cgi-util +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-bytes"
-RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-file-spec"
+RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-charnames +=3D "${PN}-module--charnames"
+RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-file-spec"
+RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-re"
+RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-re"
+RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-unicore"
+RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-unicore"
+RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-class-struct +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-class-struct +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-class-struct +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-class-struct +=3D "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-autoloader"
 RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-bytes "
 RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-carp "
 RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-constant"
@@ -299,7 +305,6 @@ RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-mo=
dule-exporter"
 RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-strict "
 RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-warnings "
 RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-compress-raw-zlib +=3D "${PN}-module-autoloader"
 RDEPENDS_${PN}-module-compress-raw-zlib +=3D "${PN}-module-bytes "
 RDEPENDS_${PN}-module-compress-raw-zlib +=3D "${PN}-module-carp "
 RDEPENDS_${PN}-module-compress-raw-zlib +=3D "${PN}-module-constant"
@@ -325,13 +330,22 @@ RDEPENDS_${PN}-module-config-extensions +=3D "${PN}-m=
odule-config"
 RDEPENDS_${PN}-module-config-extensions +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-config-extensions +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-config-extensions +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-config-perl-v +=3D "${PN}-module-config"
+RDEPENDS_${PN}-module-config-perl-v +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-config-perl-v +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-config-perl-v +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-config-perl-v +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-constant +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-constant +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-constant +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-constant +=3D "${PN}-module-warnings-register"
+RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-list-util"
+RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-corelist"
 RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-version"
+RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-b"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-cpan"
@@ -345,13 +359,16 @@ RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-fcntl"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-copy"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-find"
+RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-filehandle"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-path"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-filehandle"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-lib"
+RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-list-util"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-net-ping"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-overload"
+RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-posix"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-safe"
+RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-scalar-util"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-sys-hostname"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-term-readline"
@@ -359,46 +376,8 @@ RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-text-par=
sewords"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-text-wrap"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-time-local"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-archive-extract"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-base"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-config"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-cpanplus"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-cwd"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-data-dumper"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-file-copy"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-file-fetch"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-file-find"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-file-spec-unix"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-file-stat"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-file-temp"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-filehandle"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-ipc-cmd"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-locale-maketext-simple"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-log-message"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-build"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-corelist"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-load"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-loaded"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-pluggable"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-object-accessor"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-overload"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-package-constants"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-params-check"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-term-readline"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-term-ui"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-test"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-tie-hash"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-time-local"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-version"
-RDEPENDS_${PN}-module-cpanplus +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-version"
+RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-cwd +=3D "${PN}-module-dynaloader"
 RDEPENDS_${PN}-module-cwd +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-cwd +=3D "${PN}-module-file-spec"
@@ -408,14 +387,11 @@ RDEPENDS_${PN}-module-cwd +=3D "${PN}-module-xsloader=
"
 RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-b-deparse"
 RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-config"
+RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-overload"
 RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-scalar-util"
 RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-db +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-dbm-filter +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-dbm-filter +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-dbm-filter +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-dbm-filter-compress +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-dbm-filter-compress +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-dbm-filter-compress +=3D "${PN}-module-warnings"
@@ -426,17 +402,16 @@ RDEPENDS_${PN}-module-dbm-filter-int32 +=3D "${PN}-mo=
dule-strict"
 RDEPENDS_${PN}-module-dbm-filter-int32 +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-dbm-filter-null +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-dbm-filter-null +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-dbm-filter +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-dbm-filter +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-dbm-filter +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-dbm-filter-utf8 +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-dbm-filter-utf8 +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-dbm-filter-utf8 +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-db +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-deprecate +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-deprecate +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-deprecate +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-devel-dprof +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-devel-dprof +=3D "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-devel-innerpackage +=3D "${PN}-module-base"
-RDEPENDS_${PN}-module-devel-innerpackage +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-devel-innerpackage +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-devel-peek +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-devel-peek +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-devel-ppport +=3D "${PN}-module-file-find"
@@ -449,8 +424,7 @@ RDEPENDS_${PN}-module-diagnostics +=3D "${PN}-module-ca=
rp"
 RDEPENDS_${PN}-module-diagnostics +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-diagnostics +=3D "${PN}-module-getopt-std"
 RDEPENDS_${PN}-module-diagnostics +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-digest +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-digest +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-diagnostics +=3D "${PN}-module-text-tabs"
 RDEPENDS_${PN}-module-digest-base +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-digest-base +=3D "${PN}-module-mime-base64"
 RDEPENDS_${PN}-module-digest-base +=3D "${PN}-module-strict"
@@ -465,32 +439,23 @@ RDEPENDS_${PN}-module-digest-md5 +=3D "${PN}-module-e=
xporter"
 RDEPENDS_${PN}-module-digest-md5 +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-digest-md5 +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-digest-md5 +=3D "${PN}-module-xsloader"
+RDEPENDS_${PN}-module-digest +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-digest +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-digest-base"
 RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-dynaloader"
 RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-fcntl"
 RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-integer"
-RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-mime-base64"
 RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-dirhandle +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-dirhandle +=3D "${PN}-module-symbol"
 RDEPENDS_${PN}-module-dynaloader +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-dynaloader +=3D "${PN}-module-config"
-RDEPENDS_${PN}-module-encode +=3D "${PN}-module-base"
-RDEPENDS_${PN}-module-encode +=3D "${PN}-module-bytes"
-RDEPENDS_${PN}-module-encode +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-encode +=3D "${PN}-module-encode-alias"
-RDEPENDS_${PN}-module-encode +=3D "${PN}-module-encode-config"
-RDEPENDS_${PN}-module-encode +=3D "${PN}-module-encode-configlocal-pm"
-RDEPENDS_${PN}-module-encode +=3D "${PN}-module-encode-encoding"
-RDEPENDS_${PN}-module-encode +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-encode +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode +=3D "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-encode-alias +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-encode-alias +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-encode-alias +=3D "${PN}-module-encode"
+RDEPENDS_${PN}-module-encode-alias +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-encode-alias +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-alias +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-encode-byte +=3D "${PN}-module-encode"
@@ -501,17 +466,17 @@ RDEPENDS_${PN}-module-encode-cjkconstants +=3D "${PN}=
-module-carp"
 RDEPENDS_${PN}-module-encode-cjkconstants +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-encode-cjkconstants +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-cjkconstants +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-encode-cn-hz"
-RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-encode-cn-hz +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-encode-cn-hz +=3D "${PN}-module-encode"
+RDEPENDS_${PN}-module-encode-cn-hz +=3D "${PN}-module-parent"
 RDEPENDS_${PN}-module-encode-cn-hz +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-cn-hz +=3D "${PN}-module-utf8"
 RDEPENDS_${PN}-module-encode-cn-hz +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-encode-cn-hz +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-encode"
+RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-encode-cn-hz"
+RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-encode-config +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-config +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-encode-ebcdic +=3D "${PN}-module-encode"
@@ -519,6 +484,7 @@ RDEPENDS_${PN}-module-encode-ebcdic +=3D "${PN}-module-=
strict"
 RDEPENDS_${PN}-module-encode-ebcdic +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-encode-ebcdic +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-encode-encoder +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-encode-encoder +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-encode-encoder +=3D "${PN}-module-encode"
 RDEPENDS_${PN}-module-encode-encoder +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-encode-encoder +=3D "${PN}-module-overload"
@@ -529,62 +495,74 @@ RDEPENDS_${PN}-module-encode-encoding +=3D "${PN}-mod=
ule-encode"
 RDEPENDS_${PN}-module-encode-encoding +=3D "${PN}-module-encode-mime-name"
 RDEPENDS_${PN}-module-encode-encoding +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-encoding +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-encode"
+RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-parent"
 RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-utf8"
 RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-encode"
 RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-encode-unicode"
+RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-parent"
 RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-encode-jp-jis7"
-RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-encode-jp-h2z +=3D "${PN}-module-encode-cjkconstants=
"
 RDEPENDS_${PN}-module-encode-jp-h2z +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-jp-h2z +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-encode-jp-h2z +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-encode"
 RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-encode-cjkconstant=
s"
 RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-encode-jp-h2z"
+RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-parent"
 RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-encode"
+RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-encode-jp-jis7"
+RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-xsloader"
+RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-encode"
+RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-encode-cjkconst=
ants"
+RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-parent"
+RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-encode-kr +=3D "${PN}-module-encode"
 RDEPENDS_${PN}-module-encode-kr +=3D "${PN}-module-encode-kr-2022-kr"
 RDEPENDS_${PN}-module-encode-kr +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-kr +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-encode-kr +=3D "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-base"
-RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-encode-cjkconst=
ants"
-RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-co=
nstant"
+RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-en=
code-cjkconstants"
+RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-pa=
rent"
+RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-st=
rict"
+RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-wa=
rnings"
 RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-encode"
 RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-mime-base64"
+RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-parent"
 RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-utf8"
 RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-ba=
se"
-RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-co=
nstant"
-RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-en=
code-cjkconstants"
-RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-st=
rict"
-RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-wa=
rnings"
 RDEPENDS_${PN}-module-encode-mime-name +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-mime-name +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-encode +=3D "${PN}-module-bytes"
+RDEPENDS_${PN}-module-encode +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-encode +=3D "${PN}-module-constant"
+RDEPENDS_${PN}-module-encode +=3D "${PN}-module-encode-alias"
+RDEPENDS_${PN}-module-encode +=3D "${PN}-module-encode-config"
+RDEPENDS_${PN}-module-encode +=3D "${PN}-module-encode-configlocal-pm"
+RDEPENDS_${PN}-module-encode +=3D "${PN}-module-encode-encoding"
+RDEPENDS_${PN}-module-encode +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-encode +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-encode +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-encode +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-encode-symbol +=3D "${PN}-module-encode"
 RDEPENDS_${PN}-module-encode-symbol +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-symbol +=3D "${PN}-module-warnings"
@@ -593,18 +571,20 @@ RDEPENDS_${PN}-module-encode-tw +=3D "${PN}-module-en=
code"
 RDEPENDS_${PN}-module-encode-tw +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-tw +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-encode-tw +=3D "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-encode-unicode +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-encode-unicode +=3D "${PN}-module-encode"
+RDEPENDS_${PN}-module-encode-unicode +=3D "${PN}-module-parent"
 RDEPENDS_${PN}-module-encode-unicode +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-unicode +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-encode-unicode +=3D "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-encode-unicode-utf7 +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-encode-unicode-utf7 +=3D "${PN}-module-encode"
 RDEPENDS_${PN}-module-encode-unicode-utf7 +=3D "${PN}-module-mime-base64"
+RDEPENDS_${PN}-module-encode-unicode-utf7 +=3D "${PN}-module-parent"
+RDEPENDS_${PN}-module-encode-unicode-utf7 +=3D "${PN}-module-re"
 RDEPENDS_${PN}-module-encode-unicode-utf7 +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-encode-unicode-utf7 +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-config"
+RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-encode"
 RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-filter-util-call"
 RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-i18n-langinfo"
@@ -615,33 +595,42 @@ RDEPENDS_${PN}-module-encoding-warnings +=3D "${PN}-m=
odule-carp"
 RDEPENDS_${PN}-module-encoding-warnings +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-english +=3D "${PN}-module-carp "
 RDEPENDS_${PN}-module-english +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-env +=3D "${PN}-module-config"
+RDEPENDS_${PN}-module-env +=3D "${PN}-module-tie-array"
 RDEPENDS_${PN}-module-errno +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-errno +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-errno +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-exporter +=3D "${PN}-module-exporter-heavy"
+RDEPENDS_${PN}-module-experimental +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-experimental +=3D "${PN}-module-feature"
+RDEPENDS_${PN}-module-experimental +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-experimental +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-exporter-heavy +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-exporter-heavy +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-exporter-heavy +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-file-path"
-RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-exporter +=3D "${PN}-module-exporter-heavy"
 RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-cwd"
-RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-data-dumpe=
r"
+RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-dynaloader=
"
 RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-extutils-m=
ksymlists"
 RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-file-basen=
ame"
 RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-file-temp"
-RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-io-file"
 RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-ipc-cmd"
 RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-text-parse=
words"
 RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-file-basename"
+RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-file-path"
+RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-file-spec"
+RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix +=3D "${PN}-module-ex=
tutils-cbuilder-platform-unix"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix +=3D "${PN}-module-fi=
le-spec"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix +=3D "${PN}-module-st=
rict"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix +=3D "${PN}-module-va=
rs"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-android +=3D "${PN}-modul=
e-extutils-cbuilder-platform-unix"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-android +=3D "${PN}-modul=
e-file-spec"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-android +=3D "${PN}-modul=
e-strict"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-android +=3D "${PN}-modul=
e-vars"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin +=3D "${PN}-module=
-extutils-cbuilder-platform-unix"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin +=3D "${PN}-module=
-file-spec"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin +=3D "${PN}-module=
-strict"
@@ -664,6 +653,9 @@ RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms +=
=3D "${PN}-module-extutils-c
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms +=3D "${PN}-module-fi=
le-spec-functions"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms +=3D "${PN}-module-st=
rict"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms +=3D "${PN}-module-va=
rs"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-bcc +=3D "${PN}-m=
odule-vars"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-gcc +=3D "${PN}-m=
odule-vars"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-msvc +=3D "${PN}-=
module-vars"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-modul=
e-extutils-cbuilder-base"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-modul=
e-file-basename"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-modul=
e-file-spec"
@@ -671,9 +663,14 @@ RDEPENDS_${PN}-module-extutils-cbuilder-platform-windo=
ws +=3D "${PN}-module-io-fil
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-modul=
e-strict"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-modul=
e-vars"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-modul=
e-warnings"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-bcc +=3D "${PN}-m=
odule-vars"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-gcc +=3D "${PN}-m=
odule-vars"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-msvc +=3D "${PN}-=
module-vars"
+RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-extutils-comm=
and"
+RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-extutils-inst=
all"
+RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-file-spec"
+RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-getopt-long"
+RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-test-harness"
+RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-file-basename"
@@ -683,14 +680,12 @@ RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-mo=
dule-file-find"
 RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-file-path"
 RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-extutils-comm=
and"
-RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-extutils-inst=
all"
-RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-getopt-long"
-RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-test-harness"
-RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-constant"
+RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-extutils-c=
onstant-utils"
+RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-text-wrap"
+RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-module-extutils-consta=
nt-proxysubs"
@@ -699,12 +694,6 @@ RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-mo=
dule-extutils-constant-xs"
 RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-module-filehandle"
 RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-extutils-c=
onstant-utils"
-RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-text-wrap"
-RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-extutils-constant-proxysubs +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-extutils-constant-proxysubs +=3D "${PN}-module-extut=
ils-constant-utils"
 RDEPENDS_${PN}-module-extutils-constant-proxysubs +=3D "${PN}-module-extut=
ils-constant-xs"
@@ -727,10 +716,19 @@ RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-modu=
le-exporter"
 RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-extutils-liblist"
 RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-extutils-makemaker=
"
 RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-filehandle"
 RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-getopt-std"
 RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-config"
+RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-data-dumper"
+RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-extutils-makem=
aker"
+RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-extutils-packl=
ist"
+RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-file-basename"
+RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-file-find"
+RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-file-spec"
+RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-autosplit"
 RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-config"
@@ -745,25 +743,18 @@ RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-mo=
dule-file-path"
 RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-data-dumper"
-RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-extutils-makem=
aker"
-RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-extutils-packl=
ist"
-RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-file-find"
-RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-liblist +=3D "${PN}-module-extutils-liblist=
-kid"
-RDEPENDS_${PN}-module-extutils-liblist +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-liblist +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-cwd"
+RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-extutils-mak=
emaker-config"
 RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-file-basenam=
e"
 RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-text-parsewo=
rds"
+RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-extutils-liblist +=3D "${PN}-module-extutils-liblist=
-kid"
+RDEPENDS_${PN}-module-extutils-liblist +=3D "${PN}-module-file-spec"
+RDEPENDS_${PN}-module-extutils-liblist +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-makemaker-config +=3D "${PN}-module-config"
+RDEPENDS_${PN}-module-extutils-makemaker-config +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-cwd"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-exporter"
@@ -774,12 +765,7 @@ RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-m=
odule-extutils-my"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-file-path"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-makemaker-config +=3D "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-makemaker-config +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-makemaker-yaml +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-makemaker-yaml +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-makemaker-yaml +=3D "${PN}-module-scalar-ut=
il"
-RDEPENDS_${PN}-module-extutils-makemaker-yaml +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-version"
 RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-exporter"
@@ -791,6 +777,9 @@ RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-mod=
ule-file-spec"
 RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-extutils-miniperl +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-extutils-miniperl +=3D "${PN}-module-extutils-embed"
+RDEPENDS_${PN}-module-extutils-miniperl +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-miniperl +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-extutils-mkbootstrap +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-extutils-mkbootstrap +=3D "${PN}-module-dynaloader"
 RDEPENDS_${PN}-module-extutils-mkbootstrap +=3D "${PN}-module-exporter"
@@ -799,27 +788,26 @@ RDEPENDS_${PN}-module-extutils-mksymlists +=3D "${PN}=
-module-carp"
 RDEPENDS_${PN}-module-extutils-mksymlists +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-extutils-mksymlists +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-extutils-mksymlists +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm +=3D "${PN}-module-extutils-liblist"
-RDEPENDS_${PN}-module-extutils-mm +=3D "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-extutils-mm +=3D "${PN}-module-extutils-makemaker-co=
nfig"
-RDEPENDS_${PN}-module-extutils-mm +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-mm-aix +=3D "${PN}-module-extutils-makemake=
r"
 RDEPENDS_${PN}-module-extutils-mm-aix +=3D "${PN}-module-extutils-mm-unix"
 RDEPENDS_${PN}-module-extutils-mm-aix +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-autosplit"
 RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-cpan"
 RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-data-dumper"
 RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-extutils-makemake=
r"
 RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-extutils-makemake=
r-config"
-RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-extutils-makemake=
r-yaml"
 RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-file-basename"
+RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-file-find"
 RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-version"
 RDEPENDS_${PN}-module-extutils-mm-beos +=3D "${PN}-module-extutils-makemak=
er-config"
 RDEPENDS_${PN}-module-extutils-mm-beos +=3D "${PN}-module-extutils-mm-any"
 RDEPENDS_${PN}-module-extutils-mm-beos +=3D "${PN}-module-extutils-mm-unix=
"
 RDEPENDS_${PN}-module-extutils-mm-beos +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-mm-beos +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-mm-cygwin +=3D "${PN}-module-extutils-mm-un=
ix"
 RDEPENDS_${PN}-module-extutils-mm-cygwin +=3D "${PN}-module-extutils-makem=
aker-config"
 RDEPENDS_${PN}-module-extutils-mm-cygwin +=3D "${PN}-module-extutils-mm-un=
ix"
 RDEPENDS_${PN}-module-extutils-mm-cygwin +=3D "${PN}-module-extutils-mm-wi=
n32"
@@ -841,6 +829,10 @@ RDEPENDS_${PN}-module-extutils-mm-os2 +=3D "${PN}-modu=
le-extutils-mm-any"
 RDEPENDS_${PN}-module-extutils-mm-os2 +=3D "${PN}-module-extutils-mm-unix"
 RDEPENDS_${PN}-module-extutils-mm-os2 +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-mm-os2 +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-mm +=3D "${PN}-module-extutils-liblist"
+RDEPENDS_${PN}-module-extutils-mm +=3D "${PN}-module-extutils-makemaker"
+RDEPENDS_${PN}-module-extutils-mm +=3D "${PN}-module-extutils-makemaker-co=
nfig"
+RDEPENDS_${PN}-module-extutils-mm +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-mm-qnx +=3D "${PN}-module-extutils-mm-unix"
 RDEPENDS_${PN}-module-extutils-mm-qnx +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-carp"
@@ -886,20 +878,55 @@ RDEPENDS_${PN}-module-extutils-packlist +=3D "${PN}-m=
odule-cwd"
 RDEPENDS_${PN}-module-extutils-packlist +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-packlist +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-packlist +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-parsexs-constants +=3D "${PN}-module-strict=
"
+RDEPENDS_${PN}-module-extutils-parsexs-constants +=3D "${PN}-module-symbol=
"
+RDEPENDS_${PN}-module-extutils-parsexs-constants +=3D "${PN}-module-warnin=
gs"
+RDEPENDS_${PN}-module-extutils-parsexs-countlines +=3D "${PN}-module-stric=
t"
+RDEPENDS_${PN}-module-extutils-parsexs-eval +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-parsexs-eval +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-cwd"
 RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-extutils-parsexs=
-constants"
+RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-extutils-parsexs=
-countlines"
+RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-extutils-parsexs=
-eval"
+RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-extutils-parsexs=
-utilities"
 RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-re"
 RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-symbol"
-RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-export=
er"
+RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-extuti=
ls-parsexs-constants"
+RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-extuti=
ls-typemaps"
+RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-file-s=
pec"
+RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-lib"
+RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-strict=
"
+RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-warnin=
gs"
 RDEPENDS_${PN}-module-extutils-testlib +=3D "${PN}-module-cwd"
 RDEPENDS_${PN}-module-extutils-testlib +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-testlib +=3D "${PN}-module-lib"
 RDEPENDS_${PN}-module-extutils-testlib +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-testlib +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-extutils-typemaps-cmd +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-extutils-typemaps-cmd +=3D "${PN}-module-extutils-ty=
pemaps"
+RDEPENDS_${PN}-module-extutils-typemaps-cmd +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-typemaps-cmd +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-extutils-typemaps-inputmap +=3D "${PN}-module-strict=
"
+RDEPENDS_${PN}-module-extutils-typemaps-inputmap +=3D "${PN}-module-warnin=
gs"
+RDEPENDS_${PN}-module-extutils-typemaps-outputmap +=3D "${PN}-module-re"
+RDEPENDS_${PN}-module-extutils-typemaps-outputmap +=3D "${PN}-module-stric=
t"
+RDEPENDS_${PN}-module-extutils-typemaps-outputmap +=3D "${PN}-module-warni=
ngs"
+RDEPENDS_${PN}-module-extutils-typemaps +=3D "${PN}-module-extutils-parsex=
s"
+RDEPENDS_${PN}-module-extutils-typemaps +=3D "${PN}-module-extutils-parsex=
s-constants"
+RDEPENDS_${PN}-module-extutils-typemaps +=3D "${PN}-module-extutils-typema=
ps-inputmap"
+RDEPENDS_${PN}-module-extutils-typemaps +=3D "${PN}-module-extutils-typema=
ps-outputmap"
+RDEPENDS_${PN}-module-extutils-typemaps +=3D "${PN}-module-extutils-typema=
ps-type"
+RDEPENDS_${PN}-module-extutils-typemaps +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-typemaps +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-extutils-typemaps-type +=3D "${PN}-module-extutils-t=
ypemaps"
+RDEPENDS_${PN}-module-extutils-typemaps-type +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-typemaps-type +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-autodie-exception-system"
 RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-autodie-hints"
 RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-carp"
@@ -908,6 +935,7 @@ RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-constant=
"
 RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-fatal"
 RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-fcntl"
 RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-posix"
+RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-scalar-util"
 RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-tie-refhash"
 RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-warnings"
@@ -925,6 +953,10 @@ RDEPENDS_${PN}-module-file-basename +=3D "${PN}-module=
-exporter"
 RDEPENDS_${PN}-module-file-basename +=3D "${PN}-module-re"
 RDEPENDS_${PN}-module-file-basename +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-file-basename +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-filecache +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-filecache +=3D "${PN}-module-parent"
+RDEPENDS_${PN}-module-filecache +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-filecache +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-file-compare +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-file-compare +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-file-compare +=3D "${PN}-module-strict"
@@ -939,16 +971,17 @@ RDEPENDS_${PN}-module-file-copy +=3D "${PN}-module-wa=
rnings"
 RDEPENDS_${PN}-module-file-dosglob +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-file-dosglob +=3D "${PN}-module-text-parsewords"
 RDEPENDS_${PN}-module-file-dosglob +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-file-dosglob +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-cwd"
 RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-file-copy"
+RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-filehandle"
 RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-file-path"
 RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-file-spec-unix"
 RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-file-temp"
-RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-filehandle"
 RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-ipc-cmd"
 RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-locale-maketext-simple=
"
 RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-load"
@@ -963,15 +996,17 @@ RDEPENDS_${PN}-module-file-find +=3D "${PN}-module-fi=
le-spec"
 RDEPENDS_${PN}-module-file-find +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-file-find +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-file-find +=3D "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-file-glob +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-file-glob +=3D "${PN}-module-feature"
-RDEPENDS_${PN}-module-file-glob +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-glob +=3D "${PN}-module-text-parsewords"
-RDEPENDS_${PN}-module-file-glob +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-file-globmapper +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-file-globmapper +=3D "${PN}-module-file-glob"
 RDEPENDS_${PN}-module-file-globmapper +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-file-globmapper +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-file-glob +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-file-glob +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-file-glob +=3D "${PN}-module-xsloader"
+RDEPENDS_${PN}-module-filehandle +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-filehandle +=3D "${PN}-module-fcntl"
+RDEPENDS_${PN}-module-filehandle +=3D "${PN}-module-io-file"
+RDEPENDS_${PN}-module-filehandle +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-cwd"
 RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-exporter"
@@ -979,8 +1014,6 @@ RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-fil=
e-basename"
 RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-spec +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-spec +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-file-spec-cygwin +=3D "${PN}-module-file-spec-unix"
 RDEPENDS_${PN}-module-file-spec-cygwin +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-file-spec-cygwin +=3D "${PN}-module-vars"
@@ -989,6 +1022,7 @@ RDEPENDS_${PN}-module-file-spec-epoc +=3D "${PN}-modul=
e-strict"
 RDEPENDS_${PN}-module-file-spec-epoc +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-file-spec-functions +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-file-spec-functions +=3D "${PN}-module-file-spec"
+RDEPENDS_${PN}-module-file-spec-functions +=3D "${PN}-module-file-spec-uni=
x"
 RDEPENDS_${PN}-module-file-spec-functions +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-file-spec-functions +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-file-spec-mac +=3D "${PN}-module-file-spec-unix"
@@ -997,10 +1031,14 @@ RDEPENDS_${PN}-module-file-spec-mac +=3D "${PN}-modu=
le-vars"
 RDEPENDS_${PN}-module-file-spec-os2 +=3D "${PN}-module-file-spec-unix"
 RDEPENDS_${PN}-module-file-spec-os2 +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-file-spec-os2 +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-file-spec +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-file-spec +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-file-spec-unix +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-file-spec-unix +=3D "${PN}-module-cwd"
 RDEPENDS_${PN}-module-file-spec-unix +=3D "${PN}-module-scalar-util"
 RDEPENDS_${PN}-module-file-spec-unix +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-file-spec-unix +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-file-spec-unix +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-file-spec-vms +=3D "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-file-spec-vms +=3D "${PN}-module-file-spec-unix"
 RDEPENDS_${PN}-module-file-spec-vms +=3D "${PN}-module-strict"
@@ -1020,27 +1058,22 @@ RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-=
symbol"
 RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-constant"
+RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-cwd"
 RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-errno"
+RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-fcntl"
 RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-file-path"
 RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-io-seekable"
 RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-overload"
+RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-parent"
 RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-posix"
+RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-scalar-util"
 RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-symbol"
 RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-filecache +=3D "${PN}-module-base"
-RDEPENDS_${PN}-module-filecache +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-filecache +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-filecache +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-filehandle +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-filehandle +=3D "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-filehandle +=3D "${PN}-module-io-file"
-RDEPENDS_${PN}-module-filehandle +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-filter-simple +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-filter-simple +=3D "${PN}-module-filter-util-call"
 RDEPENDS_${PN}-module-filter-simple +=3D "${PN}-module-text-balanced"
@@ -1056,12 +1089,6 @@ RDEPENDS_${PN}-module-findbin +=3D "${PN}-module-cwd=
"
 RDEPENDS_${PN}-module-findbin +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-findbin +=3D "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-findbin +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-gdbm-file +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-gdbm-file +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-gdbm-file +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-gdbm-file +=3D "${PN}-module-tie-hash"
-RDEPENDS_${PN}-module-gdbm-file +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-gdbm-file +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-getopt-long +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-getopt-long +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-getopt-long +=3D "${PN}-module-overload"
@@ -1070,6 +1097,11 @@ RDEPENDS_${PN}-module-getopt-long +=3D "${PN}-module=
-strict"
 RDEPENDS_${PN}-module-getopt-long +=3D "${PN}-module-text-parsewords"
 RDEPENDS_${PN}-module-getopt-long +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-getopt-std +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-scalar-util"
+RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-hash-util-fieldhash"
@@ -1078,44 +1110,40 @@ RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-=
strict"
 RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-warnings-register"
 RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-xsloader"
+RDEPENDS_${PN}-module-i18n-collate +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-i18n-collate +=3D "${PN}-module-overload"
+RDEPENDS_${PN}-module-i18n-collate +=3D "${PN}-module-posix"
+RDEPENDS_${PN}-module-i18n-collate +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-i18n-collate +=3D "${PN}-module-warnings-register"
 RDEPENDS_${PN}-module-i18n-langinfo +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-i18n-langinfo +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-i18n-langinfo +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-i18n-langinfo +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-i18n-langinfo +=3D "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-module-i18n-langtags"
-RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-i18n-langtags-detect +=3D "${PN}-module-i18n-langtag=
s"
 RDEPENDS_${PN}-module-i18n-langtags-detect +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-i18n-langtags-detect +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-i18n-langtags-list +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-i18n-langtags-list +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-module-i18n-langtags"
+RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-extutils-installed"
 RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-file-copy"
 RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-file-path"
 RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-file-spec"
+RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-if"
 RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-inc-latest-private"
-RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-io-file"
 RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-inc-latest-private +=3D "${PN}-module-extutils-makem=
aker"
 RDEPENDS_${PN}-module-inc-latest-private +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-inc-latest-private +=3D "${PN}-module-io-file"
+RDEPENDS_${PN}-module-inc-latest-private +=3D "${PN}-module-if"
 RDEPENDS_${PN}-module-inc-latest-private +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-inc-latest-private +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-io +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-io +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-io +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-io-compress-adapter-bzip2 +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-io-compress-adapter-bzip2 +=3D "${PN}-module-compres=
s-raw-bzip2"
 RDEPENDS_${PN}-module-io-compress-adapter-bzip2 +=3D "${PN}-module-io-comp=
ress-base-common"
@@ -1123,6 +1151,7 @@ RDEPENDS_${PN}-module-io-compress-adapter-bzip2 +=3D =
"${PN}-module-strict"
 RDEPENDS_${PN}-module-io-compress-adapter-bzip2 +=3D "${PN}-module-warning=
s"
 RDEPENDS_${PN}-module-io-compress-adapter-deflate +=3D "${PN}-module-bytes=
"
 RDEPENDS_${PN}-module-io-compress-adapter-deflate +=3D "${PN}-module-compr=
ess-raw-zlib"
+RDEPENDS_${PN}-module-io-compress-adapter-deflate +=3D "${PN}-module-expor=
ter"
 RDEPENDS_${PN}-module-io-compress-adapter-deflate +=3D "${PN}-module-io-co=
mpress-base-common"
 RDEPENDS_${PN}-module-io-compress-adapter-deflate +=3D "${PN}-module-stric=
t"
 RDEPENDS_${PN}-module-io-compress-adapter-deflate +=3D "${PN}-module-warni=
ngs"
@@ -1130,15 +1159,6 @@ RDEPENDS_${PN}-module-io-compress-adapter-identity +=
=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-io-compress-adapter-identity +=3D "${PN}-module-io-c=
ompress-base-common"
 RDEPENDS_${PN}-module-io-compress-adapter-identity +=3D "${PN}-module-stri=
ct"
 RDEPENDS_${PN}-module-io-compress-adapter-identity +=3D "${PN}-module-warn=
ings"
-RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-carp "
-RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-io-compress-base=
-common"
-RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-io-file "
-RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-io-handle "
-RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-symbol"
-RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-constant"
@@ -1150,6 +1170,14 @@ RDEPENDS_${PN}-module-io-compress-base-common +=3D "=
${PN}-module-strict "
 RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-utf8"
 RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-io-compress-base=
-common"
+RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-io-file"
+RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-io-handle "
+RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-scalar-util"
+RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-strict "
+RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-symbol"
+RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-io-compress-bzip2 +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-io-compress-bzip2 +=3D "${PN}-module-exporter "
 RDEPENDS_${PN}-module-io-compress-bzip2 +=3D "${PN}-module-io-compress-ada=
pter-bzip2"
@@ -1158,27 +1186,27 @@ RDEPENDS_${PN}-module-io-compress-bzip2 +=3D "${PN}=
-module-io-compress-base-common
 RDEPENDS_${PN}-module-io-compress-bzip2 +=3D "${PN}-module-strict "
 RDEPENDS_${PN}-module-io-compress-bzip2 +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-compress-raw-=
zlib"
 RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-exporter "
+RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-io-compress-a=
dapter-deflate"
 RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-io-compress-b=
ase-common"
 RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-io-compress-r=
awdeflate"
 RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-io-compress-z=
lib-constants"
 RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-strict "
 RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-bytes"
+RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-consta=
nt"
+RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-export=
er"
+RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-strict=
 "
+RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-warnin=
gs"
 RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-compress-raw-zli=
b"
 RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-exporter "
+RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-io-compress-adap=
ter-deflate"
 RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-io-compress-base=
-common"
 RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-io-compress-gzip=
-constants"
 RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-io-compress-rawd=
eflate"
 RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-io-compress-zlib=
-extra"
 RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-strict "
 RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-consta=
nt"
-RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-export=
er"
-RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-strict=
 "
-RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-warnin=
gs"
 RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-compress-r=
aw-zlib"
 RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-exporter "
@@ -1188,9 +1216,16 @@ RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "$=
{PN}-module-io-compress-base-c
 RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-io-seekabl=
e"
 RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-strict "
 RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-io-compress-zip-constants +=3D "${PN}-module-constan=
t"
+RDEPENDS_${PN}-module-io-compress-zip-constants +=3D "${PN}-module-exporte=
r"
+RDEPENDS_${PN}-module-io-compress-zip-constants +=3D "${PN}-module-strict =
"
+RDEPENDS_${PN}-module-io-compress-zip-constants +=3D "${PN}-module-warning=
s"
 RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-compress-raw-zlib=
"
+RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-exporter "
+RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-fcntl"
+RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-io-compress-adapt=
er-deflate"
 RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-io-compress-adapt=
er-identity"
 RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-io-compress-base-=
common"
@@ -1198,12 +1233,8 @@ RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-mo=
dule-io-compress-bzip2 "
 RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-io-compress-rawde=
flate"
 RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-io-compress-zip-c=
onstants"
 RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-io-compress-zlib-=
extra"
-RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-zip-constants +=3D "${PN}-module-constan=
t"
-RDEPENDS_${PN}-module-io-compress-zip-constants +=3D "${PN}-module-exporte=
r"
-RDEPENDS_${PN}-module-io-compress-zip-constants +=3D "${PN}-module-strict =
"
-RDEPENDS_${PN}-module-io-compress-zip-constants +=3D "${PN}-module-warning=
s"
+RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-strict "
+RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-io-compress-zlib-constants +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-io-compress-zlib-constants +=3D "${PN}-module-consta=
nt"
 RDEPENDS_${PN}-module-io-compress-zlib-constants +=3D "${PN}-module-export=
er"
@@ -1224,7 +1255,6 @@ RDEPENDS_${PN}-module-io-dir +=3D "${PN}-module-tie-h=
ash"
 RDEPENDS_${PN}-module-io-file +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-io-file +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-io-file +=3D "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-io-file +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-io-file +=3D "${PN}-module-io-seekable"
 RDEPENDS_${PN}-module-io-file +=3D "${PN}-module-selectsaver"
 RDEPENDS_${PN}-module-io-file +=3D "${PN}-module-strict"
@@ -1236,6 +1266,10 @@ RDEPENDS_${PN}-module-io-handle +=3D "${PN}-module-i=
o-file"
 RDEPENDS_${PN}-module-io-handle +=3D "${PN}-module-selectsaver"
 RDEPENDS_${PN}-module-io-handle +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-io-handle +=3D "${PN}-module-symbol"
+RDEPENDS_${PN}-module-io +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-io +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-io +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-io +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-io-pipe +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-io-pipe +=3D "${PN}-module-fcntl"
 RDEPENDS_${PN}-module-io-pipe +=3D "${PN}-module-io-handle"
@@ -1253,6 +1287,20 @@ RDEPENDS_${PN}-module-io-select +=3D "${PN}-module-e=
xporter"
 RDEPENDS_${PN}-module-io-select +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-io-select +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-io-select +=3D "${PN}-module-warnings-register"
+RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-errno"
+RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-io-socket"
+RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-socket"
+RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-constant"
+RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-errno"
+RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-posix"
+RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-socket"
+RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-errno"
 RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-exporter"
@@ -1262,12 +1310,6 @@ RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-i=
o-socket-inet"
 RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-io-socket-unix"
 RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-socket"
 RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-errno"
-RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-io-socket"
-RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-socket"
-RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-io-socket-unix +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-io-socket-unix +=3D "${PN}-module-io-socket"
 RDEPENDS_${PN}-module-io-socket-unix +=3D "${PN}-module-strict"
@@ -1279,9 +1321,9 @@ RDEPENDS_${PN}-module-io-uncompress-adapter-bunzip2 +=
=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-io-uncompress-adapter-identity +=3D "${PN}-module-by=
tes"
 RDEPENDS_${PN}-module-io-uncompress-adapter-identity +=3D "${PN}-module-co=
mpress-raw-zlib"
 RDEPENDS_${PN}-module-io-uncompress-adapter-identity +=3D "${PN}-module-io=
-compress-base-common"
+RDEPENDS_${PN}-module-io-uncompress-adapter-identity +=3D "${PN}-module-io=
-compress-zip-constants "
 RDEPENDS_${PN}-module-io-uncompress-adapter-identity +=3D "${PN}-module-st=
rict"
 RDEPENDS_${PN}-module-io-uncompress-adapter-identity +=3D "${PN}-module-wa=
rnings"
-RDEPENDS_${PN}-module-io-uncompress-adapter-inflate +=3D "${PN}-module-byt=
es"
 RDEPENDS_${PN}-module-io-uncompress-adapter-inflate +=3D "${PN}-module-com=
press-raw-zlib"
 RDEPENDS_${PN}-module-io-uncompress-adapter-inflate +=3D "${PN}-module-io-=
compress-base-common"
 RDEPENDS_${PN}-module-io-uncompress-adapter-inflate +=3D "${PN}-module-str=
ict"
@@ -1303,7 +1345,6 @@ RDEPENDS_${PN}-module-io-uncompress-anyuncompress +=
=3D "${PN}-module-io-compress-b
 RDEPENDS_${PN}-module-io-uncompress-anyuncompress +=3D "${PN}-module-io-un=
compress-base"
 RDEPENDS_${PN}-module-io-uncompress-anyuncompress +=3D "${PN}-module-stric=
t"
 RDEPENDS_${PN}-module-io-uncompress-anyuncompress +=3D "${PN}-module-warni=
ngs"
-RDEPENDS_${PN}-module-io-uncompress-base +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-io-uncompress-base +=3D "${PN}-module-carp "
 RDEPENDS_${PN}-module-io-uncompress-base +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-io-uncompress-base +=3D "${PN}-module-io-compress-ba=
se-common"
@@ -1336,7 +1377,6 @@ RDEPENDS_${PN}-module-io-uncompress-inflate +=3D "${P=
N}-module-io-compress-zlib-co
 RDEPENDS_${PN}-module-io-uncompress-inflate +=3D "${PN}-module-io-uncompre=
ss-rawinflate"
 RDEPENDS_${PN}-module-io-uncompress-inflate +=3D "${PN}-module-strict "
 RDEPENDS_${PN}-module-io-uncompress-inflate +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D "${PN}-module-compress=
-raw-zlib"
 RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D "${PN}-module-exporter=
 "
 RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D "${PN}-module-io-compr=
ess-base-common"
@@ -1344,12 +1384,14 @@ RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D=
 "${PN}-module-io-uncompress-ad
 RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D "${PN}-module-io-uncom=
press-base"
 RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D "${PN}-module-strict "
 RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D "${PN}-module-warnings=
"
-RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-compress-raw-=
zlib"
+RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-exporter "
+RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-fcntl"
 RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-io-compress-b=
ase-common"
 RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-io-compress-z=
ip-constants"
 RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-io-compress-z=
lib-extra"
+RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-io-file"
 RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-io-uncompress=
-adapter-identity"
 RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-io-uncompress=
-adapter-inflate"
 RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-io-uncompress=
-rawinflate"
@@ -1364,12 +1406,11 @@ RDEPENDS_${PN}-module-io-zlib +=3D "${PN}-module-sy=
mbol"
 RDEPENDS_${PN}-module-io-zlib +=3D "${PN}-module-tie-handle"
 RDEPENDS_${PN}-module-io-zlib +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-filehandle"
+RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-io-handle"
 RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-io-select"
 RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-ipc-open3"
@@ -1396,6 +1437,7 @@ RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-co=
nstant"
 RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-fcntl"
 RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-io-pipe"
+RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-posix"
 RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-symbol"
 RDEPENDS_${PN}-module-ipc-semaphore +=3D "${PN}-module-carp"
@@ -1414,33 +1456,38 @@ RDEPENDS_${PN}-module-ipc-sysv +=3D "${PN}-module-d=
ynaloader"
 RDEPENDS_${PN}-module-ipc-sysv +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-ipc-sysv +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-ipc-sysv +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-json-pp-boolean +=3D "${PN}-module-json-pp"
+RDEPENDS_${PN}-module-json-pp-boolean +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-b"
+RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-bytes"
+RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-constant"
+RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-encode"
+RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-math-bigfloat"
+RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-math-bigint"
+RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-overload"
+RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-subs"
 RDEPENDS_${PN}-module-less +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-less +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-lib +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-lib +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-lib +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-list-util +=3D "${PN}-module-dynaloader"
 RDEPENDS_${PN}-module-list-util +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-list-util +=3D "${PN}-module-list-util-pp"
 RDEPENDS_${PN}-module-list-util +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-list-util +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-list-util +=3D "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-list-util-pp +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-list-util-pp +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-list-util-pp +=3D "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-list-util-pp +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-list-util-pp +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-list-util-pp +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-list-util-xs +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-list-util-xs +=3D "${PN}-module-list-util"
 RDEPENDS_${PN}-module-list-util-xs +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-list-util-xs +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-loaded +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-loaded +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-loaded +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-load +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-load +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-load +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-load +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-load +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-load +=3D "${PN}-module-filehandle"
+RDEPENDS_${PN}-module-load +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-load +=3D "${PN}-module-locale-maketext-simple"
 RDEPENDS_${PN}-module-load +=3D "${PN}-module-corelist"
 RDEPENDS_${PN}-module-load +=3D "${PN}-module-load"
@@ -1448,86 +1495,136 @@ RDEPENDS_${PN}-module-load +=3D "${PN}-module-para=
ms-check"
 RDEPENDS_${PN}-module-load +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-load +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-load +=3D "${PN}-module-version"
-RDEPENDS_${PN}-module-loaded +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-loaded +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-loaded +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-locale-codes +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-locale-codes +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-load +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-locale-codes-constants +=3D "${PN}-module-constant"
+RDEPENDS_${PN}-module-locale-codes-constants +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-locale-codes-constants +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-locale-codes-constants +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-locale-codes-country-codes +=3D "${PN}-module-strict=
"
+RDEPENDS_${PN}-module-locale-codes-country-codes +=3D "${PN}-module-utf8"
+RDEPENDS_${PN}-module-locale-codes-country-codes +=3D "${PN}-module-warnin=
gs"
+RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-locale-codes=
"
+RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-locale-codes=
-constants"
+RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-locale-codes=
-country-codes"
+RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-locale-codes=
-country-retired"
 RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-locale-codes-country-retired +=3D "${PN}-module-stri=
ct"
+RDEPENDS_${PN}-module-locale-codes-country-retired +=3D "${PN}-module-utf8=
"
+RDEPENDS_${PN}-module-locale-codes-country-retired +=3D "${PN}-module-warn=
ings"
+RDEPENDS_${PN}-module-locale-codes-currency-codes +=3D "${PN}-module-stric=
t"
+RDEPENDS_${PN}-module-locale-codes-currency-codes +=3D "${PN}-module-utf8"
+RDEPENDS_${PN}-module-locale-codes-currency-codes +=3D "${PN}-module-warni=
ngs"
+RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-locale-code=
s"
+RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-locale-code=
s-constants"
+RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-locale-code=
s-currency-codes"
+RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-locale-code=
s-currency-retired"
 RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-locale-codes-currency-retired +=3D "${PN}-module-str=
ict"
+RDEPENDS_${PN}-module-locale-codes-currency-retired +=3D "${PN}-module-utf=
8"
+RDEPENDS_${PN}-module-locale-codes-currency-retired +=3D "${PN}-module-war=
nings"
+RDEPENDS_${PN}-module-locale-codes-langext-codes +=3D "${PN}-module-strict=
"
+RDEPENDS_${PN}-module-locale-codes-langext-codes +=3D "${PN}-module-utf8"
+RDEPENDS_${PN}-module-locale-codes-langext-codes +=3D "${PN}-module-warnin=
gs"
+RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-locale-codes=
"
+RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-locale-codes=
-constants"
+RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-locale-codes=
-langext-codes"
+RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-locale-codes=
-langext-retired"
+RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-locale-codes-langext-retired +=3D "${PN}-module-stri=
ct"
+RDEPENDS_${PN}-module-locale-codes-langext-retired +=3D "${PN}-module-utf8=
"
+RDEPENDS_${PN}-module-locale-codes-langext-retired +=3D "${PN}-module-warn=
ings"
+RDEPENDS_${PN}-module-locale-codes-langfam-codes +=3D "${PN}-module-strict=
"
+RDEPENDS_${PN}-module-locale-codes-langfam-codes +=3D "${PN}-module-utf8"
+RDEPENDS_${PN}-module-locale-codes-langfam-codes +=3D "${PN}-module-warnin=
gs"
+RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-locale-codes=
"
+RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-locale-codes=
-constants"
+RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-locale-codes=
-langfam-codes"
+RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-locale-codes=
-langfam-retired"
+RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-locale-codes-langfam-retired +=3D "${PN}-module-stri=
ct"
+RDEPENDS_${PN}-module-locale-codes-langfam-retired +=3D "${PN}-module-warn=
ings"
+RDEPENDS_${PN}-module-locale-codes-language-codes +=3D "${PN}-module-stric=
t"
+RDEPENDS_${PN}-module-locale-codes-language-codes +=3D "${PN}-module-utf8"
+RDEPENDS_${PN}-module-locale-codes-language-codes +=3D "${PN}-module-warni=
ngs"
+RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-locale-code=
s"
+RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-locale-code=
s-constants"
+RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-locale-code=
s-language-codes"
+RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-locale-code=
s-language-retired"
 RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-locale-codes-language-retired +=3D "${PN}-module-str=
ict"
+RDEPENDS_${PN}-module-locale-codes-language-retired +=3D "${PN}-module-utf=
8"
+RDEPENDS_${PN}-module-locale-codes-language-retired +=3D "${PN}-module-war=
nings"
+RDEPENDS_${PN}-module-locale-codes-langvar-codes +=3D "${PN}-module-strict=
"
+RDEPENDS_${PN}-module-locale-codes-langvar-codes +=3D "${PN}-module-utf8"
+RDEPENDS_${PN}-module-locale-codes-langvar-codes +=3D "${PN}-module-warnin=
gs"
+RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-locale-codes=
"
+RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-locale-codes=
-constants"
+RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-locale-codes=
-langvar-codes"
+RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-locale-codes=
-langvar-retired"
+RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-locale-codes-langvar-retired +=3D "${PN}-module-stri=
ct"
+RDEPENDS_${PN}-module-locale-codes-langvar-retired +=3D "${PN}-module-utf8=
"
+RDEPENDS_${PN}-module-locale-codes-langvar-retired +=3D "${PN}-module-warn=
ings"
+RDEPENDS_${PN}-module-locale-codes +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-locale-codes +=3D "${PN}-module-locale-codes-constan=
ts"
+RDEPENDS_${PN}-module-locale-codes +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-locale-codes +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-locale-codes-script-codes +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-locale-codes-script-codes +=3D "${PN}-module-utf8"
+RDEPENDS_${PN}-module-locale-codes-script-codes +=3D "${PN}-module-warning=
s"
+RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-locale-codes"
+RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-locale-codes-=
constants"
+RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-locale-codes-=
script-codes"
+RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-locale-codes-=
script-retired"
 RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-constants +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-locale-constants +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-constants +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-constants +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-country +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-locale-codes-script-retired +=3D "${PN}-module-stric=
t"
+RDEPENDS_${PN}-module-locale-codes-script-retired +=3D "${PN}-module-utf8"
+RDEPENDS_${PN}-module-locale-codes-script-retired +=3D "${PN}-module-warni=
ngs"
 RDEPENDS_${PN}-module-locale-country +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-country +=3D "${PN}-module-locale-codes"
-RDEPENDS_${PN}-module-locale-country +=3D "${PN}-module-locale-codes-count=
ry"
-RDEPENDS_${PN}-module-locale-country +=3D "${PN}-module-locale-constants"
 RDEPENDS_${PN}-module-locale-country +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-locale-country +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-currency +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-locale-currency +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-currency +=3D "${PN}-module-locale-codes"
-RDEPENDS_${PN}-module-locale-currency +=3D "${PN}-module-locale-codes-curr=
ency"
-RDEPENDS_${PN}-module-locale-currency +=3D "${PN}-module-locale-constants"
 RDEPENDS_${PN}-module-locale-currency +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-locale-currency +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-language +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-locale-language +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-language +=3D "${PN}-module-locale-codes"
-RDEPENDS_${PN}-module-locale-language +=3D "${PN}-module-locale-codes-lang=
uage"
-RDEPENDS_${PN}-module-locale-language +=3D "${PN}-module-locale-constants"
 RDEPENDS_${PN}-module-locale-language +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-locale-language +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-locale-maketext-gutsloader +=3D "${PN}-module-locale=
-maketext"
+RDEPENDS_${PN}-module-locale-maketext-guts +=3D "${PN}-module-locale-maket=
ext"
 RDEPENDS_${PN}-module-locale-maketext +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-locale-maketext +=3D "${PN}-module-i18n-langtags"
 RDEPENDS_${PN}-module-locale-maketext +=3D "${PN}-module-i18n-langtags-det=
ect"
 RDEPENDS_${PN}-module-locale-maketext +=3D "${PN}-module-integer"
 RDEPENDS_${PN}-module-locale-maketext +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-locale-maketext +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-locale-maketext-guts +=3D "${PN}-module-locale-maket=
ext"
-RDEPENDS_${PN}-module-locale-maketext-gutsloader +=3D "${PN}-module-locale=
-maketext"
 RDEPENDS_${PN}-module-locale-maketext-simple +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-locale-maketext-simple +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-script +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-locale +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-locale +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-locale-script +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-script +=3D "${PN}-module-locale-codes"
-RDEPENDS_${PN}-module-locale-script +=3D "${PN}-module-locale-codes-script=
"
-RDEPENDS_${PN}-module-locale-script +=3D "${PN}-module-locale-constants"
 RDEPENDS_${PN}-module-locale-script +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-locale-script +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-log-message +=3D "${PN}-module-locale-maketext-simpl=
e"
-RDEPENDS_${PN}-module-log-message +=3D "${PN}-module-log-message-config"
-RDEPENDS_${PN}-module-log-message +=3D "${PN}-module-log-message-item"
-RDEPENDS_${PN}-module-log-message +=3D "${PN}-module-params-check"
-RDEPENDS_${PN}-module-log-message +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-log-message +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-log-message-config +=3D "${PN}-module-filehandle"
-RDEPENDS_${PN}-module-log-message-config +=3D "${PN}-module-locale-maketex=
t-simple"
-RDEPENDS_${PN}-module-log-message-config +=3D "${PN}-module-load"
-RDEPENDS_${PN}-module-log-message-config +=3D "${PN}-module-params-check"
-RDEPENDS_${PN}-module-log-message-config +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-log-message-config +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-log-message-handlers +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-log-message-handlers +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-log-message-item +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-log-message-item +=3D "${PN}-module-log-message-hand=
lers"
-RDEPENDS_${PN}-module-log-message-item +=3D "${PN}-module-params-check"
-RDEPENDS_${PN}-module-log-message-item +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-log-message-item +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-log-message-simple +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-log-message-simple +=3D "${PN}-module-log-message"
-RDEPENDS_${PN}-module-log-message-simple +=3D "${PN}-module-params-check"
-RDEPENDS_${PN}-module-log-message-simple +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-log-message-simple +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-math-bigfloat +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-math-bigfloat +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-math-bigfloat +=3D "${PN}-module-math-bigint"
@@ -1539,24 +1636,24 @@ RDEPENDS_${PN}-module-math-bigfloat-trace +=3D "${P=
N}-module-math-bigfloat"
 RDEPENDS_${PN}-module-math-bigfloat-trace +=3D "${PN}-module-overload"
 RDEPENDS_${PN}-module-math-bigfloat-trace +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-math-bigfloat-trace +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-math-bigfloat"
-RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-overload"
-RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-math-bigint-calcemu +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-math-bigint-calcemu +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-math-bigint-calc +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-math-bigint-calc +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-math-bigint-calc +=3D "${PN}-module-integer"
 RDEPENDS_${PN}-module-math-bigint-calc +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigint-calcemu +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigint-calcemu +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-math-bigint-fastcalc +=3D "${PN}-module-math-bigint-=
calc"
 RDEPENDS_${PN}-module-math-bigint-fastcalc +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-math-bigint-fastcalc +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-math-bigint-fastcalc +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-math-bigint-fastcalc +=3D "${PN}-module-xsloader"
+RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-file-spec"
+RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-math-bigfloat"
+RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-overload"
+RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-math-bigint-trace +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-math-bigint-trace +=3D "${PN}-module-math-bigint"
 RDEPENDS_${PN}-module-math-bigint-trace +=3D "${PN}-module-overload"
@@ -1573,20 +1670,18 @@ RDEPENDS_${PN}-module-math-complex +=3D "${PN}-modu=
le-exporter"
 RDEPENDS_${PN}-module-math-complex +=3D "${PN}-module-overload"
 RDEPENDS_${PN}-module-math-complex +=3D "${PN}-module-scalar-util"
 RDEPENDS_${PN}-module-math-complex +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-complex +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-math-complex +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-math-trig +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-math-trig +=3D "${PN}-module-math-complex"
 RDEPENDS_${PN}-module-math-trig +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-trig +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-memoize-anydbm-file +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-memoize-expirefile +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-memoize-expire +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-memoize +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-memoize +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-memoize +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-memoize +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-memoize +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-memoize-anydbm-file +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-memoize-expire +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-memoize-expirefile +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-memoize-sdbm-file +=3D "${PN}-module-sdbm-file"
 RDEPENDS_${PN}-module-memoize-storable +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-memoize-storable +=3D "${PN}-module-storable"
@@ -1617,18 +1712,6 @@ RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-=
posix"
 RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-socket"
 RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-io-socket"
-RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-cmd"
-RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-config"
-RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-ftp-a"
-RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-netrc"
-RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-socket"
-RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-time-local"
-RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-net-ftp-a +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-net-ftp-a +=3D "${PN}-module-net-ftp-dataconn"
 RDEPENDS_${PN}-module-net-ftp-a +=3D "${PN}-module-strict"
@@ -1642,6 +1725,18 @@ RDEPENDS_${PN}-module-net-ftp-i +=3D "${PN}-module-c=
arp"
 RDEPENDS_${PN}-module-net-ftp-i +=3D "${PN}-module-net-ftp-dataconn"
 RDEPENDS_${PN}-module-net-ftp-i +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-net-ftp-l +=3D "${PN}-module-net-ftp-i"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-fcntl"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-file-basename"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-io-socket"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-cmd"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-config"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-ftp-a"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-netrc"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-socket"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-time-local"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-net-hostent +=3D "${PN}-module-class-struct"
 RDEPENDS_${PN}-module-net-hostent +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-net-hostent +=3D "${PN}-module-socket"
@@ -1707,17 +1802,6 @@ RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-va=
rs"
 RDEPENDS_${PN}-module-next +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-next +=3D "${PN}-module-overload"
 RDEPENDS_${PN}-module-next +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-o +=3D "${PN}-module-b"
-RDEPENDS_${PN}-module-o +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-object-accessor +=3D "${PN}-module-base"
-RDEPENDS_${PN}-module-object-accessor +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-object-accessor +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-object-accessor +=3D "${PN}-module-data-dumper"
-RDEPENDS_${PN}-module-object-accessor +=3D "${PN}-module-overload"
-RDEPENDS_${PN}-module-object-accessor +=3D "${PN}-module-params-check"
-RDEPENDS_${PN}-module-object-accessor +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-object-accessor +=3D "${PN}-module-tie-scalar"
-RDEPENDS_${PN}-module-object-accessor +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-opcode +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-opcode +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-opcode +=3D "${PN}-module-strict"
@@ -1727,17 +1811,18 @@ RDEPENDS_${PN}-module-open +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-open +=3D "${PN}-module-encode"
 RDEPENDS_${PN}-module-open +=3D "${PN}-module-encoding"
 RDEPENDS_${PN}-module-open +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-o +=3D "${PN}-module-b"
+RDEPENDS_${PN}-module-o +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-ops +=3D "${PN}-module-opcode"
+RDEPENDS_${PN}-module-overloading +=3D "${PN}-module-overload-numbers"
+RDEPENDS_${PN}-module-overloading +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-overload +=3D "${PN}-module-mro"
 RDEPENDS_${PN}-module-overload +=3D "${PN}-module-scalar-util"
 RDEPENDS_${PN}-module-overload +=3D "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-overloading +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-overloading +=3D "${PN}-module-overload-numbers"
-RDEPENDS_${PN}-module-overloading +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-package-constants +=3D "${PN}-module-if"
 RDEPENDS_${PN}-module-package-constants +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-package-constants +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-params-check +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-params-check +=3D "${PN}-module-data-dumper"
 RDEPENDS_${PN}-module-params-check +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-params-check +=3D "${PN}-module-locale-maketext-simp=
le"
 RDEPENDS_${PN}-module-params-check +=3D "${PN}-module-strict"
@@ -1746,17 +1831,13 @@ RDEPENDS_${PN}-module-parent +=3D "${PN}-module-str=
ict"
 RDEPENDS_${PN}-module-parent +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-perlio-encoding +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-perlio-encoding +=3D "${PN}-module-xsloader"
+RDEPENDS_${PN}-module-perlio-mmap +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-perlio-mmap +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-perlio-mmap +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-perlio-scalar +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-perlio-via +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-perlio-via-quotedprint +=3D "${PN}-module-mime-quote=
dprint"
 RDEPENDS_${PN}-module-perlio-via-quotedprint +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-pluggable +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-pluggable +=3D "${PN}-module-devel-innerpackage"
-RDEPENDS_${PN}-module-pluggable +=3D "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-pluggable +=3D "${PN}-module-file-find"
-RDEPENDS_${PN}-module-pluggable +=3D "${PN}-module-file-spec-functions"
-RDEPENDS_${PN}-module-pluggable +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-pluggable +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-checker +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-checker +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-pod-checker +=3D "${PN}-module-pod-parser"
@@ -1766,6 +1847,7 @@ RDEPENDS_${PN}-module-pod-checker +=3D "${PN}-module-=
vars"
 RDEPENDS_${PN}-module-pod-escapes +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-pod-escapes +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-escapes +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-escapes +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-pod-find +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-find +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-pod-find +=3D "${PN}-module-cwd"
@@ -1779,11 +1861,6 @@ RDEPENDS_${PN}-module-pod-functions +=3D "${PN}-modu=
le-exporter"
 RDEPENDS_${PN}-module-pod-functions +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-inputobjects +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-inputobjects +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-latex +=3D "${PN}-module-base"
-RDEPENDS_${PN}-module-pod-latex +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-latex +=3D "${PN}-module-pod-parseutils"
-RDEPENDS_${PN}-module-pod-latex +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-latex +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-man +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-man +=3D "${PN}-module-encode"
 RDEPENDS_${PN}-module-pod-man +=3D "${PN}-module-file-basename"
@@ -1804,9 +1881,18 @@ RDEPENDS_${PN}-module-pod-parser +=3D "${PN}-module-=
vars"
 RDEPENDS_${PN}-module-pod-parseutils +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-parseutils +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-parseutils +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-perldoc-baseto +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-pod-perldoc-baseto +=3D "${PN}-module-config"
+RDEPENDS_${PN}-module-pod-perldoc-baseto +=3D "${PN}-module-file-spec-func=
tions"
+RDEPENDS_${PN}-module-pod-perldoc-baseto +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-pod-perldoc-baseto +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-perldoc-baseto +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-pod-perldoc-getoptsoo +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-pod-perldoc-getoptsoo +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-fcntl"
+RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-file-spec-functions"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-file-temp"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-pod-perldoc-getoptsoo=
"
@@ -1814,36 +1900,52 @@ RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-modul=
e-strict"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-symbol"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-text-parsewords"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-vmsish"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-baseto +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-perldoc-baseto +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-getoptsoo +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-pod-perldoc-toansi +=3D "${PN}-module-parent"
+RDEPENDS_${PN}-module-pod-perldoc-toansi +=3D "${PN}-module-pod-text-color=
"
+RDEPENDS_${PN}-module-pod-perldoc-toansi +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-pod-perldoc-toansi +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-perldoc-toansi +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-pod-perldoc-tochecker +=3D "${PN}-module-pod-checker=
"
 RDEPENDS_${PN}-module-pod-perldoc-tochecker +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-perldoc-tochecker +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-perldoc-tochecker +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-encode"
 RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-file-spec-funct=
ions"
+RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-io-handle"
+RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-io-select"
+RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-ipc-open3"
+RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-parent"
+RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-pod-man"
 RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-pod-perldoc-top=
od"
 RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-symbol"
+RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-tonroff +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-pod-perldoc-tonroff +=3D "${PN}-module-parent"
 RDEPENDS_${PN}-module-pod-perldoc-tonroff +=3D "${PN}-module-pod-man"
 RDEPENDS_${PN}-module-pod-perldoc-tonroff +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-pod-perldoc-tonroff +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-perldoc-tonroff +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-topod +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-pod-perldoc-topod +=3D "${PN}-module-parent"
 RDEPENDS_${PN}-module-pod-perldoc-topod +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-pod-perldoc-topod +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-perldoc-topod +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-tortf +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-pod-perldoc-tortf +=3D "${PN}-module-parent"
 RDEPENDS_${PN}-module-pod-perldoc-tortf +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-perldoc-tortf +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-perldoc-tortf +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-totext +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-pod-perldoc-toterm +=3D "${PN}-module-parent"
+RDEPENDS_${PN}-module-pod-perldoc-toterm +=3D "${PN}-module-pod-text-termc=
ap"
+RDEPENDS_${PN}-module-pod-perldoc-toterm +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-pod-perldoc-toterm +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-perldoc-toterm +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-pod-perldoc-totext +=3D "${PN}-module-parent"
 RDEPENDS_${PN}-module-pod-perldoc-totext +=3D "${PN}-module-pod-text"
 RDEPENDS_${PN}-module-pod-perldoc-totext +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-pod-perldoc-totext +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-perldoc-totext +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-toxml +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-pod-perldoc-toxml +=3D "${PN}-module-parent"
 RDEPENDS_${PN}-module-pod-perldoc-toxml +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-perldoc-toxml +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-perldoc-toxml +=3D "${PN}-module-warnings"
@@ -1856,15 +1958,6 @@ RDEPENDS_${PN}-module-pod-select +=3D "${PN}-module-=
carp"
 RDEPENDS_${PN}-module-pod-select +=3D "${PN}-module-pod-parser"
 RDEPENDS_${PN}-module-pod-select +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-select +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-integer"
-RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-pod-escapes"
-RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-pod-simple-blackbox"
-RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-pod-simple-linksection=
"
-RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-pod-simple-tiedoutfh"
-RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-symbol"
-RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-simple-blackbox +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-simple-blackbox +=3D "${PN}-module-integer"
 RDEPENDS_${PN}-module-pod-simple-blackbox +=3D "${PN}-module-pod-simple"
@@ -1887,6 +1980,7 @@ RDEPENDS_${PN}-module-pod-simple-dumpastext +=3D "${P=
N}-module-strict"
 RDEPENDS_${PN}-module-pod-simple-dumpasxml +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-simple-dumpasxml +=3D "${PN}-module-pod-simple"
 RDEPENDS_${PN}-module-pod-simple-dumpasxml +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-pod-simple-dumpasxml +=3D "${PN}-module-text-wrap"
 RDEPENDS_${PN}-module-pod-simple-linksection +=3D "${PN}-module-overload"
 RDEPENDS_${PN}-module-pod-simple-linksection +=3D "${PN}-module-pod-simple=
-blackbox"
 RDEPENDS_${PN}-module-pod-simple-linksection +=3D "${PN}-module-strict"
@@ -1894,16 +1988,25 @@ RDEPENDS_${PN}-module-pod-simple-linksection +=3D "=
${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-simple-methody +=3D "${PN}-module-pod-simple"
 RDEPENDS_${PN}-module-pod-simple-methody +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-simple-methody +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-integer"
+RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-pod-escapes"
+RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-pod-simple-blackbox"
+RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-pod-simple-linksection=
"
+RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-pod-simple-tiedoutfh"
+RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-symbol"
+RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-simple-progress +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-pod-simple-pullparserendtoken +=3D "${PN}-module-pod=
-simple-pullparsertoken"
+RDEPENDS_${PN}-module-pod-simple-pullparserendtoken +=3D "${PN}-module-str=
ict"
+RDEPENDS_${PN}-module-pod-simple-pullparserendtoken +=3D "${PN}-module-var=
s"
 RDEPENDS_${PN}-module-pod-simple-pullparser +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-simple-pullparser +=3D "${PN}-module-pod-simple"
 RDEPENDS_${PN}-module-pod-simple-pullparser +=3D "${PN}-module-pod-simple-=
pullparserendtoken"
 RDEPENDS_${PN}-module-pod-simple-pullparser +=3D "${PN}-module-pod-simple-=
pullparserstarttoken"
 RDEPENDS_${PN}-module-pod-simple-pullparser +=3D "${PN}-module-pod-simple-=
pullparsertexttoken"
 RDEPENDS_${PN}-module-pod-simple-pullparser +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-pullparserendtoken +=3D "${PN}-module-pod=
-simple-pullparsertoken"
-RDEPENDS_${PN}-module-pod-simple-pullparserendtoken +=3D "${PN}-module-str=
ict"
-RDEPENDS_${PN}-module-pod-simple-pullparserendtoken +=3D "${PN}-module-var=
s"
 RDEPENDS_${PN}-module-pod-simple-pullparserstarttoken +=3D "${PN}-module-c=
arp"
 RDEPENDS_${PN}-module-pod-simple-pullparserstarttoken +=3D "${PN}-module-p=
od-simple-pullparsertoken"
 RDEPENDS_${PN}-module-pod-simple-pullparserstarttoken +=3D "${PN}-module-s=
trict"
@@ -1928,23 +2031,23 @@ RDEPENDS_${PN}-module-pod-simple-simpletree +=3D "$=
{PN}-module-carp"
 RDEPENDS_${PN}-module-pod-simple-simpletree +=3D "${PN}-module-pod-simple"
 RDEPENDS_${PN}-module-pod-simple-simpletree +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-simple-simpletree +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-simple-textcontent +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-pod-simple-textcontent +=3D "${PN}-module-pod-simple=
"
+RDEPENDS_${PN}-module-pod-simple-textcontent +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-pod-simple-textcontent +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-simple-text +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-simple-text +=3D "${PN}-module-pod-simple"
 RDEPENDS_${PN}-module-pod-simple-text +=3D "${PN}-module-pod-simple-method=
y"
 RDEPENDS_${PN}-module-pod-simple-text +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-simple-text +=3D "${PN}-module-text-wrap"
 RDEPENDS_${PN}-module-pod-simple-text +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-textcontent +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-textcontent +=3D "${PN}-module-pod-simple=
"
-RDEPENDS_${PN}-module-pod-simple-textcontent +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-textcontent +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-simple-tiedoutfh +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-simple-tiedoutfh +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-simple-tiedoutfh +=3D "${PN}-module-symbol"
 RDEPENDS_${PN}-module-pod-simple-tiedoutfh +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-transcode +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-simple-transcodedumb +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-simple-transcodedumb +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-simple-transcode +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-simple-transcodesmart +=3D "${PN}-module-encode"
 RDEPENDS_${PN}-module-pod-simple-transcodesmart +=3D "${PN}-module-pod-sim=
ple"
 RDEPENDS_${PN}-module-pod-simple-transcodesmart +=3D "${PN}-module-strict"
@@ -1953,12 +2056,6 @@ RDEPENDS_${PN}-module-pod-simple-xmloutstream +=3D "=
${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-simple-xmloutstream +=3D "${PN}-module-pod-simpl=
e"
 RDEPENDS_${PN}-module-pod-simple-xmloutstream +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-simple-xmloutstream +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-encode"
-RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-text-color +=3D "${PN}-module-pod-text"
 RDEPENDS_${PN}-module-pod-text-color +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-text-color +=3D "${PN}-module-term-ansicolor"
@@ -1966,6 +2063,12 @@ RDEPENDS_${PN}-module-pod-text-color +=3D "${PN}-mod=
ule-vars"
 RDEPENDS_${PN}-module-pod-text-overstrike +=3D "${PN}-module-pod-text"
 RDEPENDS_${PN}-module-pod-text-overstrike +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-text-overstrike +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-encode"
+RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-pod-simple"
+RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-text-termcap +=3D "${PN}-module-pod-text"
 RDEPENDS_${PN}-module-pod-text-termcap +=3D "${PN}-module-posix"
 RDEPENDS_${PN}-module-pod-text-termcap +=3D "${PN}-module-strict"
@@ -1975,17 +2078,12 @@ RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-=
carp"
 RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-pod-plaintext"
-RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-pod-select"
-RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-pod-text"
 RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-posix +=3D "${PN}-module-autoloader"
 RDEPENDS_${PN}-module-posix +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-posix +=3D "${PN}-module-fcntl"
 RDEPENDS_${PN}-module-posix +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-posix +=3D "${PN}-module-tie-hash"
-RDEPENDS_${PN}-module-posix +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-posix +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-posix +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-re +=3D "${PN}-module-carp"
@@ -2004,20 +2102,14 @@ RDEPENDS_${PN}-module-safe +=3D "${PN}-module-utf8"
 RDEPENDS_${PN}-module-scalar-util +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-scalar-util +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-scalar-util +=3D "${PN}-module-list-util"
-RDEPENDS_${PN}-module-scalar-util +=3D "${PN}-module-scalar-util-pp"
 RDEPENDS_${PN}-module-scalar-util +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-scalar-util +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-scalar-util-pp +=3D "${PN}-module-b"
-RDEPENDS_${PN}-module-scalar-util-pp +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-scalar-util-pp +=3D "${PN}-module-overload"
-RDEPENDS_${PN}-module-scalar-util-pp +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-scalar-util-pp +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-scalar-util-pp +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-sdbm-file +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-sdbm-file +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-sdbm-file +=3D "${PN}-module-tie-hash"
 RDEPENDS_${PN}-module-sdbm-file +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-sdbm-file +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-search-dict +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-search-dict +=3D "${PN}-module-feature"
 RDEPENDS_${PN}-module-search-dict +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-selectsaver +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-selectsaver +=3D "${PN}-module-symbol"
@@ -2025,11 +2117,6 @@ RDEPENDS_${PN}-module-selfloader +=3D "${PN}-module-=
exporter"
 RDEPENDS_${PN}-module-selfloader +=3D "${PN}-module-io-handle"
 RDEPENDS_${PN}-module-selfloader +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-selfloader +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-shell +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-shell +=3D "${PN}-module-file-spec-functions"
-RDEPENDS_${PN}-module-shell +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-shell +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-shell +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-sigtrap +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-sigtrap +=3D "${PN}-module-symbol"
 RDEPENDS_${PN}-module-socket +=3D "${PN}-module-carp"
@@ -2065,135 +2152,120 @@ RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-modu=
le-vars"
 RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-warnings-register"
 RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-xsloader"
+RDEPENDS_${PN}-module-tap-base +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-base +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-tap-base +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-base +=3D "${PN}-module-tap-object"
-RDEPENDS_${PN}-module-tap-base +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-base +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-formatter-base +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-formatter-base +=3D "${PN}-module-posix"
 RDEPENDS_${PN}-module-tap-formatter-base +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-formatter-base +=3D "${PN}-module-tap-base"
 RDEPENDS_${PN}-module-tap-formatter-base +=3D "${PN}-module-tap-formatter-=
color"
-RDEPENDS_${PN}-module-tap-formatter-base +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-formatter-base +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-formatter-color +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-formatter-color +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-tap-formatter-color +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-formatter-color +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-tap-formatter-console +=3D "${PN}-module-posix"
-RDEPENDS_${PN}-module-tap-formatter-console +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-formatter-console +=3D "${PN}-module-tap-formatt=
er-base"
-RDEPENDS_${PN}-module-tap-formatter-console +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-formatter-color +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-mo=
dule-base"
 RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-mo=
dule-carp"
 RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-mo=
dule-constant"
 RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-mo=
dule-file-path"
 RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-mo=
dule-file-spec"
 RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-mo=
dule-strict"
-RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-mo=
dule-tap-formatter-console-session"
-RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-mo=
dule-vars"
+RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-mo=
dule-warnings"
+RDEPENDS_${PN}-module-tap-formatter-console +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-tap-formatter-console +=3D "${PN}-module-posix"
+RDEPENDS_${PN}-module-tap-formatter-console +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-formatter-console +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-formatter-console-session +=3D "${PN}-module-bas=
e"
 RDEPENDS_${PN}-module-tap-formatter-console-session +=3D "${PN}-module-str=
ict"
-RDEPENDS_${PN}-module-tap-formatter-console-session +=3D "${PN}-module-tap=
-formatter-session"
-RDEPENDS_${PN}-module-tap-formatter-console-session +=3D "${PN}-module-var=
s"
+RDEPENDS_${PN}-module-tap-formatter-console-session +=3D "${PN}-module-war=
nings"
+RDEPENDS_${PN}-module-tap-formatter-file +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-formatter-file +=3D "${PN}-module-posix"
 RDEPENDS_${PN}-module-tap-formatter-file +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-formatter-file +=3D "${PN}-module-tap-formatter-=
base"
 RDEPENDS_${PN}-module-tap-formatter-file +=3D "${PN}-module-tap-formatter-=
file-session"
-RDEPENDS_${PN}-module-tap-formatter-file +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-formatter-file +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-formatter-file-session +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-formatter-file-session +=3D "${PN}-module-strict=
"
-RDEPENDS_${PN}-module-tap-formatter-file-session +=3D "${PN}-module-tap-fo=
rmatter-session"
-RDEPENDS_${PN}-module-tap-formatter-file-session +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-formatter-file-session +=3D "${PN}-module-warnin=
gs"
+RDEPENDS_${PN}-module-tap-formatter-session +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-formatter-session +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-formatter-session +=3D "${PN}-module-tap-base"
-RDEPENDS_${PN}-module-tap-formatter-session +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-formatter-session +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-harness-env +=3D "${PN}-module-constant"
+RDEPENDS_${PN}-module-tap-harness-env +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-harness-env +=3D "${PN}-module-tap-object"
+RDEPENDS_${PN}-module-tap-harness-env +=3D "${PN}-module-text-parsewords"
+RDEPENDS_${PN}-module-tap-harness-env +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-file-path"
 RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-io-handle"
 RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-tap-base"
-RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-tap-object +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-tap-object +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-object +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-base"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-grammar"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-iterator"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-iteratorfac=
tory"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-result"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-resultfacto=
ry"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-source"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehandl=
er-executable"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehandl=
er-file"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehandl=
er-handle"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehandl=
er-perl"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehandl=
er-rawtap"
-RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-object +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-parser-aggregator +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-parser-aggregator +=3D "${PN}-module-benchmark"
 RDEPENDS_${PN}-module-tap-parser-aggregator +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-tap-parser-aggregator +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-aggregator +=3D "${PN}-module-tap-object"
-RDEPENDS_${PN}-module-tap-parser-aggregator +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-parser-aggregator +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-parser-grammar +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-parser-grammar +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-tap-parser-grammar +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-grammar +=3D "${PN}-module-tap-object"
 RDEPENDS_${PN}-module-tap-parser-grammar +=3D "${PN}-module-tap-parser-res=
ultfactory"
 RDEPENDS_${PN}-module-tap-parser-grammar +=3D "${PN}-module-tap-parser-yam=
lish-reader"
-RDEPENDS_${PN}-module-tap-parser-grammar +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-parser-grammar +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-parser-iterator-array +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-tap-parser-iterator-array +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-parser-iterator-array +=3D "${PN}-module-warning=
s"
+RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-consta=
nt"
+RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-file-b=
asename"
+RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-strict=
"
+RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-warnin=
gs"
+RDEPENDS_${PN}-module-tap-parser-iterator +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-parser-iterator +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-tap-parser-iterator +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-iterator +=3D "${PN}-module-tap-object"
-RDEPENDS_${PN}-module-tap-parser-iterator +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-tap-parser-iterator-array +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-iterator-array +=3D "${PN}-module-tap-par=
ser-iterator"
-RDEPENDS_${PN}-module-tap-parser-iterator-array +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-parser-iterator +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-parser-iterator-process +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-parser-iterator-process +=3D "${PN}-module-confi=
g"
 RDEPENDS_${PN}-module-tap-parser-iterator-process +=3D "${PN}-module-io-ha=
ndle"
 RDEPENDS_${PN}-module-tap-parser-iterator-process +=3D "${PN}-module-stric=
t"
-RDEPENDS_${PN}-module-tap-parser-iterator-process +=3D "${PN}-module-tap-p=
arser-iterator"
-RDEPENDS_${PN}-module-tap-parser-iterator-process +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-parser-iterator-process +=3D "${PN}-module-warni=
ngs"
+RDEPENDS_${PN}-module-tap-parser-iterator-stream +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-parser-iterator-stream +=3D "${PN}-module-strict=
"
-RDEPENDS_${PN}-module-tap-parser-iterator-stream +=3D "${PN}-module-tap-pa=
rser-iterator"
-RDEPENDS_${PN}-module-tap-parser-iterator-stream +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-consta=
nt"
-RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-file-b=
asename"
-RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-strict=
"
-RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-tap-ob=
ject"
-RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-parser-iterator-stream +=3D "${PN}-module-warnin=
gs"
+RDEPENDS_${PN}-module-tap-parser-multiplexer +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-parser-multiplexer +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-tap-parser-multiplexer +=3D "${PN}-module-io-select"
 RDEPENDS_${PN}-module-tap-parser-multiplexer +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-multiplexer +=3D "${PN}-module-tap-object=
"
-RDEPENDS_${PN}-module-tap-parser-multiplexer +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-tap-parser-result +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result +=3D "${PN}-module-tap-object"
-RDEPENDS_${PN}-module-tap-parser-result +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-parser-multiplexer +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-grammar"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-iterator"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-iteratorfac=
tory"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-result"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-resultfacto=
ry"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-source"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehandl=
er-executable"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehandl=
er-file"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehandl=
er-handle"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehandl=
er-perl"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehandl=
er-rawtap"
+RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-parser-result-bailout +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-parser-result-bailout +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-bailout +=3D "${PN}-module-tap-par=
ser-result"
-RDEPENDS_${PN}-module-tap-parser-result-bailout +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-parser-result-bailout +=3D "${PN}-module-warning=
s"
+RDEPENDS_${PN}-module-tap-parser-result-comment +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-parser-result-comment +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-comment +=3D "${PN}-module-tap-par=
ser-result"
-RDEPENDS_${PN}-module-tap-parser-result-comment +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-tap-parser-result-plan +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-plan +=3D "${PN}-module-tap-parser=
-result"
-RDEPENDS_${PN}-module-tap-parser-result-plan +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-tap-parser-result-pragma +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-pragma +=3D "${PN}-module-tap-pars=
er-result"
-RDEPENDS_${PN}-module-tap-parser-result-pragma +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-tap-parser-result-test +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-test +=3D "${PN}-module-tap-parser=
-result"
-RDEPENDS_${PN}-module-tap-parser-result-test +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-tap-parser-result-unknown +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-unknown +=3D "${PN}-module-tap-par=
ser-result"
-RDEPENDS_${PN}-module-tap-parser-result-unknown +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-tap-parser-result-version +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-version +=3D "${PN}-module-tap-par=
ser-result"
-RDEPENDS_${PN}-module-tap-parser-result-version +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-tap-parser-result-yaml +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-yaml +=3D "${PN}-module-tap-parser=
-result"
-RDEPENDS_${PN}-module-tap-parser-result-yaml +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-parser-result-comment +=3D "${PN}-module-warning=
s"
+RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-obje=
ct"
 RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-pars=
er-result-bailout"
 RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-pars=
er-result-comment"
 RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-pars=
er-result-plan"
@@ -2202,70 +2274,89 @@ RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D=
 "${PN}-module-tap-parser-resul
 RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-pars=
er-result-unknown"
 RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-pars=
er-result-version"
 RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-pars=
er-result-yaml"
-RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-warnings=
"
+RDEPENDS_${PN}-module-tap-parser-result +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-tap-parser-result +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-parser-result +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-parser-result-plan +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-tap-parser-result-plan +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-parser-result-plan +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-parser-result-pragma +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-tap-parser-result-pragma +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-parser-result-pragma +=3D "${PN}-module-warnings=
"
+RDEPENDS_${PN}-module-tap-parser-result-test +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-tap-parser-result-test +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-parser-result-test +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-parser-result-unknown +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-tap-parser-result-unknown +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-parser-result-unknown +=3D "${PN}-module-warning=
s"
+RDEPENDS_${PN}-module-tap-parser-result-version +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-tap-parser-result-version +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-parser-result-version +=3D "${PN}-module-warning=
s"
+RDEPENDS_${PN}-module-tap-parser-result-yaml +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-tap-parser-result-yaml +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-parser-result-yaml +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-parser-scheduler-job +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-tap-parser-scheduler-job +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-parser-scheduler-job +=3D "${PN}-module-warnings=
"
 RDEPENDS_${PN}-module-tap-parser-scheduler +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-tap-parser-scheduler +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-tap-parser-scheduler +=3D "${PN}-module-tap-parser-s=
cheduler-job"
 RDEPENDS_${PN}-module-tap-parser-scheduler +=3D "${PN}-module-tap-parser-s=
cheduler-spinner"
-RDEPENDS_${PN}-module-tap-parser-scheduler +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-tap-parser-scheduler-job +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-parser-scheduler-job +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-scheduler-job +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-parser-scheduler +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-tap-parser-scheduler-spinner +=3D "${PN}-module-carp=
"
 RDEPENDS_${PN}-module-tap-parser-scheduler-spinner +=3D "${PN}-module-stri=
ct"
-RDEPENDS_${PN}-module-tap-parser-scheduler-spinner +=3D "${PN}-module-vars=
"
-RDEPENDS_${PN}-module-tap-parser-source +=3D "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-tap-parser-source +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-source +=3D "${PN}-module-tap-object"
-RDEPENDS_${PN}-module-tap-parser-source +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler +=3D "${PN}-module-tap-obje=
ct"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler +=3D "${PN}-module-tap-pars=
er-iterator"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-parser-scheduler-spinner +=3D "${PN}-module-warn=
ings"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-modu=
le-base"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-modu=
le-constant"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-modu=
le-strict"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-modu=
le-tap-parser-iterator-process"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-modu=
le-tap-parser-iteratorfactory"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-modu=
le-tap-parser-sourcehandler"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-modu=
le-vars"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-modu=
le-tap-parser-iterator-process"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-modu=
le-warnings"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-bas=
e"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-con=
stant"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-str=
ict"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-tap=
-parser-iterator-stream"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-tap=
-parser-iteratorfactory"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-tap=
-parser-sourcehandler"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-var=
s"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-tap=
-parser-iterator-stream"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-war=
nings"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module-b=
ase"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module-c=
onstant"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module-s=
trict"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module-t=
ap-parser-iterator-stream"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module-t=
ap-parser-iteratorfactory"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module-t=
ap-parser-sourcehandler"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module-v=
ars"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module-t=
ap-parser-iterator-stream"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module-w=
arnings"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler +=3D "${PN}-module-tap-pars=
er-iterator"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler +=3D "${PN}-module-warnings=
"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-bas=
e"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-con=
fig"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-con=
stant"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-str=
ict"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-tap=
-parser-iterator-process"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-tap=
-parser-iteratorfactory"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-tap=
-parser-sourcehandler-executable"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-tap=
-parser-utils"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-var=
s"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-tap=
-parser-iterator-process"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-tex=
t-parsewords"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-war=
nings"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap +=3D "${PN}-module-b=
ase"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap +=3D "${PN}-module-s=
trict"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap +=3D "${PN}-module-t=
ap-parser-iterator-array"
 RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap +=3D "${PN}-module-t=
ap-parser-iteratorfactory"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap +=3D "${PN}-module-t=
ap-parser-sourcehandler"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap +=3D "${PN}-module-v=
ars"
-RDEPENDS_${PN}-module-tap-parser-utils +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-tap-parser-utils +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-utils +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap +=3D "${PN}-module-w=
arnings"
+RDEPENDS_${PN}-module-tap-parser-source +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-tap-parser-source +=3D "${PN}-module-constant"
+RDEPENDS_${PN}-module-tap-parser-source +=3D "${PN}-module-file-basename"
+RDEPENDS_${PN}-module-tap-parser-source +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-parser-source +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-tap-parser-yamlish-reader +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-parser-yamlish-reader +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-yamlish-reader +=3D "${PN}-module-tap-obj=
ect"
-RDEPENDS_${PN}-module-tap-parser-yamlish-reader +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-parser-yamlish-reader +=3D "${PN}-module-warning=
s"
+RDEPENDS_${PN}-module-tap-parser-yamlish-writer +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-parser-yamlish-writer +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-yamlish-writer +=3D "${PN}-module-tap-obj=
ect"
-RDEPENDS_${PN}-module-tap-parser-yamlish-writer +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-tap-parser-yamlish-writer +=3D "${PN}-module-warning=
s"
 RDEPENDS_${PN}-module-term-ansicolor +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-term-ansicolor +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-term-ansicolor +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-term-ansicolor +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-term-ansicolor +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-term-cap +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-term-cap +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-term-cap +=3D "${PN}-module-vars"
@@ -2273,51 +2364,41 @@ RDEPENDS_${PN}-module-term-complete +=3D "${PN}-mod=
ule-exporter"
 RDEPENDS_${PN}-module-term-complete +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-term-readline +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-term-readline +=3D "${PN}-module-term-cap"
-RDEPENDS_${PN}-module-term-ui +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-term-ui +=3D "${PN}-module-locale-maketext-simple"
-RDEPENDS_${PN}-module-term-ui +=3D "${PN}-module-params-check"
-RDEPENDS_${PN}-module-term-ui +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-term-ui +=3D "${PN}-module-term-readline"
-RDEPENDS_${PN}-module-term-ui +=3D "${PN}-module-term-ui-history"
-RDEPENDS_${PN}-module-term-ui +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-term-ui-history +=3D "${PN}-module-base"
-RDEPENDS_${PN}-module-term-ui-history +=3D "${PN}-module-log-message"
-RDEPENDS_${PN}-module-term-ui-history +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-term-ui-history +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-test +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-test +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-test +=3D "${PN}-module-file-temp"
-RDEPENDS_${PN}-module-test +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-test +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-test-builder-module +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-test-builder-module +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-test-builder-module +=3D "${PN}-module-test-builder"
 RDEPENDS_${PN}-module-test-builder +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-test-builder +=3D "${PN}-module-perlio"
 RDEPENDS_${PN}-module-test-builder +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-test-builder +=3D "${PN}-module-threads-shared"
 RDEPENDS_${PN}-module-test-builder +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-test-builder-module +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-test-builder-module +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-test-builder-module +=3D "${PN}-module-test-builder"
+RDEPENDS_${PN}-module-test-builder-tester-color +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-test-builder-tester-color +=3D "${PN}-module-test-bu=
ilder-tester"
 RDEPENDS_${PN}-module-test-builder-tester +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-test-builder-tester +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-test-builder-tester +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-test-builder-tester +=3D "${PN}-module-symbol"
 RDEPENDS_${PN}-module-test-builder-tester +=3D "${PN}-module-test-builder"
-RDEPENDS_${PN}-module-test-builder-tester-color +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-test-builder-tester-color +=3D "${PN}-module-test-bu=
ilder-tester"
+RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-tap-harness"
 RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-tap-parser-aggregato=
r"
 RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-tap-parser-source"
 RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-tap-parser-sourcehan=
dler-perl"
-RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-tap-parser-utils"
-RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-text-parsewords"
+RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-test-more +=3D "${PN}-module-scalar-util"
 RDEPENDS_${PN}-module-test-more +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-test-more +=3D "${PN}-module-test-builder-module"
 RDEPENDS_${PN}-module-test-more +=3D "${PN}-module-test-more"
 RDEPENDS_${PN}-module-test-more +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-test +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-test +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-test +=3D "${PN}-module-file-temp"
+RDEPENDS_${PN}-module-test +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-test +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-test-simple +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-test-simple +=3D "${PN}-module-test-builder-module"
 RDEPENDS_${PN}-module-text-abbrev +=3D "${PN}-module-exporter"
@@ -2330,10 +2411,6 @@ RDEPENDS_${PN}-module-text-balanced +=3D "${PN}-modu=
le-vars"
 RDEPENDS_${PN}-module-text-parsewords +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-text-parsewords +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-text-parsewords +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-text-soundex +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-text-soundex +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-text-soundex +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-text-soundex +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-text-tabs +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-text-tabs +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-text-tabs +=3D "${PN}-module-vars"
@@ -2381,10 +2458,10 @@ RDEPENDS_${PN}-module-tie-file +=3D "${PN}-module-s=
ymbol"
 RDEPENDS_${PN}-module-tie-handle +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-tie-handle +=3D "${PN}-module-tie-stdhandle"
 RDEPENDS_${PN}-module-tie-handle +=3D "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-tie-hash +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-tie-hash +=3D "${PN}-module-warnings-register"
 RDEPENDS_${PN}-module-tie-hash-namedcapture +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-tie-hash-namedcapture +=3D "${PN}-module-xsloader"
+RDEPENDS_${PN}-module-tie-hash +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-tie-hash +=3D "${PN}-module-warnings-register"
 RDEPENDS_${PN}-module-tie-memoize +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-tie-memoize +=3D "${PN}-module-tie-hash"
 RDEPENDS_${PN}-module-tie-refhash +=3D "${PN}-module-carp"
@@ -2408,7 +2485,6 @@ RDEPENDS_${PN}-module-time-hires +=3D "${PN}-module-c=
arp"
 RDEPENDS_${PN}-module-time-hires +=3D "${PN}-module-dynaloader"
 RDEPENDS_${PN}-module-time-hires +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-time-hires +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-time-hires +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-time-local +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-time-local +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-time-local +=3D "${PN}-module-constant"
@@ -2429,17 +2505,12 @@ RDEPENDS_${PN}-module-time-piece +=3D "${PN}-module=
-strict"
 RDEPENDS_${PN}-module-time-piece +=3D "${PN}-module-time-local"
 RDEPENDS_${PN}-module-time-piece +=3D "${PN}-module-time-seconds"
 RDEPENDS_${PN}-module-time-seconds +=3D "${PN}-module-constant"
+RDEPENDS_${PN}-module-time-seconds +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-time-seconds +=3D "${PN}-module-overload "
 RDEPENDS_${PN}-module-time-seconds +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-time-seconds +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-time-tm +=3D "${PN}-module-class-struct"
 RDEPENDS_${PN}-module-time-tm +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-unicode-collate-cjk-big5 +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-unicode-collate-cjk-gb2312 +=3D "${PN}-module-strict=
"
 RDEPENDS_${PN}-module-unicode-collate-cjk-jisx0208 +=3D "${PN}-module-stri=
ct"
@@ -2447,10 +2518,16 @@ RDEPENDS_${PN}-module-unicode-collate-cjk-korean +=
=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-unicode-collate-cjk-korean +=3D "${PN}-module-unicod=
e-collate"
 RDEPENDS_${PN}-module-unicode-collate-cjk-pinyin +=3D "${PN}-module-strict=
"
 RDEPENDS_${PN}-module-unicode-collate-cjk-stroke +=3D "${PN}-module-strict=
"
+RDEPENDS_${PN}-module-unicode-collate-cjk-zhuyin +=3D "${PN}-module-strict=
"
 RDEPENDS_${PN}-module-unicode-collate-locale +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-unicode-collate-locale +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-unicode-collate-locale +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-unicode-collate-locale +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-constant"
+RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-dynaloader"
+RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-file-spec"
+RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-dynaloader"
 RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-exporter"
@@ -2461,10 +2538,13 @@ RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-modul=
e-charnames"
 RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-feature"
 RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-storable"
+RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-if"
+RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-integer"
 RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-unicode-normalize"
+RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-unicore"
+RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-utf8-heavy"
 RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-unicore +=3D "${PN}-module-integer"
 RDEPENDS_${PN}-module-universal +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-universal +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-user-grent +=3D "${PN}-module-class-struct"
@@ -2482,5 +2562,19 @@ RDEPENDS_${PN}-module-utf8 +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-utf8 +=3D "${PN}-module-utf8-heavy"
 RDEPENDS_${PN}-module-version +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-version +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-version +=3D "${PN}-module-version-regex"
+RDEPENDS_${PN}-module-version-regex +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-version-regex +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-version-vpp +=3D "${PN}-module-b"
+RDEPENDS_${PN}-module-version-vpp +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-version-vpp +=3D "${PN}-module-config"
+RDEPENDS_${PN}-module-version-vpp +=3D "${PN}-module-constant"
+RDEPENDS_${PN}-module-version-vpp +=3D "${PN}-module-if"
+RDEPENDS_${PN}-module-version-vpp +=3D "${PN}-module-overload"
+RDEPENDS_${PN}-module-version-vpp +=3D "${PN}-module-posix"
+RDEPENDS_${PN}-module-version-vpp +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-version-vpp +=3D "${PN}-module-universal"
+RDEPENDS_${PN}-module-version-vpp +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-version-vpp +=3D "${PN}-module-version-regex"
 RDEPENDS_${PN}-module-xsloader +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-xsloader +=3D "${PN}-module-dynaloader"
diff --git a/meta/recipes-devtools/perl/perl-rprovides_5.14.3.inc b/meta/re=
cipes-devtools/perl/perl-rprovides_5.20.0.inc
similarity index 100%
rename from meta/recipes-devtools/perl/perl-rprovides_5.14.3.inc
rename to meta/recipes-devtools/perl/perl-rprovides_5.20.0.inc
diff --git a/meta/recipes-devtools/perl/perl_5.14.3.bb b/meta/recipes-devto=
ols/perl/perl_5.20.0.bb
similarity index 92%
rename from meta/recipes-devtools/perl/perl_5.14.3.bb
rename to meta/recipes-devtools/perl/perl_5.20.0.bb
index 6aaaade..4bd4525 100644
--- a/meta/recipes-devtools/perl/perl_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.20.0.bb
@@ -2,8 +2,8 @@ SUMMARY =3D "Perl scripting language"
 HOMEPAGE =3D "http://www.perl.org/"
 SECTION =3D "devel"
 LICENSE =3D "Artistic-1.0 | GPL-1.0"
-LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcfcbdee469f02565f253d81=
a \
-		    file://Artistic;md5=3Df921793d03cc6d63ec4b15e9be8fd3f8"
+LIC_FILES_CHKSUM =3D "file://Copying;md5=3D5b122a36d0f6dc55279a0ebc69f3c60=
b \
+		    file://Artistic;md5=3D2e6fd2475335af892494fe1f7327baf3"
 # We need gnugrep (for -I)
 DEPENDS =3D "virtual/db grep-native"
 DEPENDS +=3D "gdbm zlib"
@@ -13,7 +13,11 @@ PR =3D "r1"
 PROVIDES +=3D "libmodule-build-perl"
=20
 SRC_URI =3D "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
-	file://debian/arm_thread_stress_timeout.diff \
+"
+
+# Pick up patches from debian
+# http://ftp.de.debian.org/debian/pool/main/p/perl/perl_5.20.0-1.debian.ta=
r.xz
+SRC_URI +=3D " \
 	file://debian/cpan_definstalldirs.diff \
 	file://debian/db_file_ver.diff \
 	file://debian/doc_info.diff \
@@ -25,30 +29,27 @@ SRC_URI =3D "http://www.cpan.org/src/5.0/perl-${PV}.tar=
.gz \
 	file://debian/extutils_set_libperl_path.diff \
 	file://debian/no_packlist_perllocal.diff \
 	file://debian/prefix_changes.diff \
-	file://debian/fakeroot.diff \
 	file://debian/instmodsh_doc.diff \
 	file://debian/ld_run_path.diff \
 	file://debian/libnet_config_path.diff \
-	file://debian/m68k_thread_stress.diff \
 	file://debian/mod_paths.diff \
 	file://debian/module_build_man_extensions.diff \
 	file://debian/prune_libs.diff \
 	file://debian/fixes/net_smtp_docs.diff \
 	file://debian/perlivp.diff \
-	file://debian/disable-zlib-bundling.diff \
-	file://debian/cpanplus_definstalldirs.diff \
-	file://debian/cpanplus_config_path.diff \
-	file://debian/deprecate-with-apt.diff \
 	file://debian/squelch-locale-warnings.diff \
 	file://debian/skip-upstream-git-tests.diff \
-	file://debian/fixes/extutils-cbuilder-cflags.diff \
-	file://debian/fixes/module-build-home-directory.diff \
 	file://debian/skip-kfreebsd-crash.diff \
 	file://debian/fixes/document_makemaker_ccflags.diff \
-	file://debian/fixes/sys-syslog-socket-timeout-kfreebsd.patch \
-	file://debian/fixes/pod_fixes.diff \
 	file://debian/find_html2text.diff \
-	\
+	file://debian/hurd_test_skip_stack.diff \
+	file://debian/perl5db-x-terminal-emulator.patch \
+	file://debian/cpan-missing-site-dirs.diff \
+	file://debian/fixes/memoize_storable_nstore.diff \
+	file://debian/regen-skip.diff \
+"
+
+SRC_URI +=3D " \
         file://Makefile.patch \
         file://Makefile.SH.patch \
         file://installperl.patch \
@@ -56,17 +57,13 @@ SRC_URI =3D "http://www.cpan.org/src/5.0/perl-${PV}.tar=
.gz \
         file://perl-moreconfig.patch \
         file://letgcc-find-errno.patch \
         file://generate-sh.patch \
-        file://09_fix_installperl.patch \
         file://native-perlinc.patch \
         file://perl-enable-gdbm.patch \
         file://cross-generate_uudmap.patch \
 	file://fix_bad_rpath.patch \
-	file://perl-build-in-t-dir.patch \
 	file://perl-archlib-exp.patch \
 	file://dynaloaderhack.patch \
 	\
-        file://0001-Fix-misparsing-of-maketext-strings.patch \
-        file://0001-Prevent-premature-hsplit-calls-and-only-trigger-REHA.p=
atch \
         \
         file://config.sh \
         file://config.sh-32 \
@@ -75,11 +72,18 @@ SRC_URI =3D "http://www.cpan.org/src/5.0/perl-${PV}.tar=
.gz \
         file://config.sh-64 \
         file://config.sh-64-le \
         file://config.sh-64-be \
-        file://perl-5.14.3-fix-CVE-2010-4777.patch "
-#	file://debian/fakeroot.diff
+        file://perl-5.14.3-fix-CVE-2010-4777.patch \
+        file://0001-Makefile.SH-fix-do_install-failed.patch \
+"
+
+# Fix test case issues
+SRC_URI_append_class-target =3D " \
+            file://test/dist-threads-t-join.t-adjust-ps-option.patch \
+            file://test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findf=
il.patch \
+           "
=20
-SRC_URI[md5sum] =3D "f6a3d878c688d111b495c87db56c5be5"
-SRC_URI[sha256sum] =3D "03638a4f01bc26b81231233671524b4163849a3a9ea5cc2397=
293080c4ea339f"
+SRC_URI[md5sum] =3D "406ec049ebe3afcc80d9c76ec78ca4f8"
+SRC_URI[sha256sum] =3D "4e8c28ad6ecc89902f9cb2e76f2815bb1a8287ded278e15f7a=
36ca45f8bbcd02"
=20
 inherit perlnative siteinfo
=20
@@ -191,6 +195,7 @@ do_compile() {
 }
=20
 do_install() {
+	#export hostperl=3D"${STAGING_BINDIR_NATIVE}/perl-native/perl${PV}"
 	oe_runmake install DESTDIR=3D${D}
         # Add perl pointing at current version
         ln -sf perl${PV} ${D}${bindir}/perl
@@ -246,7 +251,6 @@ perl_package_preprocess () {
             ${PKGD}${libdir}/perl/${PV}/Config_heavy.pl \
             ${PKGD}${libdir}/perl/${PV}/ExtUtils/Liblist/Kid.pm \
             ${PKGD}${libdir}/perl/${PV}/FileCache.pm \
-            ${PKGD}${libdir}/perl/${PV}/cacheout.pl \
             ${PKGD}${libdir}/perl/${PV}/pod/*.pod \
             ${PKGD}${libdir}/perl/config.sh
 }
--=20
1.8.1.2


