Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9FA75A36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 06:26:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O6QYGh022574
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 23:26:34 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 23 Jun 2015 23:26:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2015 23:26:26 -0700
Message-ID: <4b0c575e923a63be3fc3d64f407608da6f4cb2f6.1435126503.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435126503.git.liezhi.yang@windriver.com>
References: <cover.1435126503.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] perl: 5.20.0 -> 5.22.0
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
X-List-Received-Date: Wed, 24 Jun 2015 06:26:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

* Remove:
  - perl-5.14.3-fix-CVE-2010-4777.patch: backport
  - fix-FF_MORE-crash.patch: backport
  - perl-rprovides.inc: it was introduced by 5.8.7, the lines in it are lik=
e:
    RPROVIDES_perl-module-b-asmdata =3D "perl-module-${TARGET_SYS}-b-asmdat=
a"
    If some packages do RPDEND on something like
    perl-module-${TARGET_SYS}-b-asmdatam, we need update the package rather
    than keep use RPROVIDES in perl-rprovides.inc, so remove it.
  - perl-rprovides_5.20.0.inc: it only has one line:
    RPROVIDES_perl-module-module-build, but the perl-module-module-build
    is gone in 5.22.0, so remove it.

* Update:
  - debian patches from http://ftp.de.debian.org/debian/pool/main/p/perl/pe=
rl_5.20.0-1.debian.tar.xz
  - Makefile.SH.patch
  - Merge 0001-Makefile.SH-fix-do_install-failed.patch into Makefile.SH.pat=
ch
  - native-nopacklist.patch
  - config.sh

* The CGI.pm and Module::Build disappear from core, so no
  perl-module-module-build.rpm any more, more info:
  http://perltricks.com/article/165/2015/4/10/A-preview-of-Perl-5-22

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-Makefile.SH-fix-do_install-failed.patch   |   47 ---
 .../perl-5.20.0/debian/hurd_test_skip_stack.diff   |   32 --
 .../debian/module_build_man_extensions.diff        |   35 --
 .../perl-5.20.0/debian/no_packlist_perllocal.diff  |   93 ------
 .../perl/perl-5.20.0/fix-FF_MORE-crash.patch       |   21 --
 .../perl/perl-5.20.0/native-nopacklist.patch       |   94 ------
 .../perl-5.14.3-fix-CVE-2010-4777.patch            |   45 ---
 ...perl-native_5.20.0.bb =3D> perl-native_5.22.0.bb} |   11 +-
 ...depends_5.20.0.inc =3D> perl-rdepends_5.22.0.inc} |  266 +++++++-------=
-
 meta/recipes-devtools/perl/perl-rprovides.inc      |   49 ---
 .../perl/perl-rprovides_5.20.0.inc                 |    1 -
 .../{perl-5.20.0 =3D> perl}/Configure-multilib.patch |    0
 .../perl/{perl-5.20.0 =3D> perl}/MM_Unix.pm.patch    |    0
 .../perl/{perl-5.20.0 =3D> perl}/Makefile.SH.patch   |  142 ++++----
 .../perl/{perl-5.20.0 =3D> perl}/Makefile.patch      |    0
 .../perl/{perl-5.20.0 =3D> perl}/config.sh           |  339 +++++++++++++-=
------
 .../perl/{perl-5.20.0 =3D> perl}/config.sh-32        |    0
 .../perl/{perl-5.20.0 =3D> perl}/config.sh-32-be     |    0
 .../perl/{perl-5.20.0 =3D> perl}/config.sh-32-le     |    0
 .../perl/{perl-5.20.0 =3D> perl}/config.sh-64        |    0
 .../perl/{perl-5.20.0 =3D> perl}/config.sh-64-be     |    0
 .../perl/{perl-5.20.0 =3D> perl}/config.sh-64-le     |    0
 .../cross-generate_uudmap.patch                    |    0
 .../debian/cpan-missing-site-dirs.diff             |    6 +-
 .../debian/cpan_definstalldirs.diff                |    8 +-
 .../{perl-5.20.0 =3D> perl}/debian/db_file_ver.diff  |    2 +-
 .../perl/perl/debian/deprecate-with-apt.diff       |   56 ++++
 .../{perl-5.20.0 =3D> perl}/debian/doc_info.diff     |    6 +-
 .../{perl-5.20.0 =3D> perl}/debian/enc2xs_inc.diff   |   14 +-
 .../{perl-5.20.0 =3D> perl}/debian/errno_ver.diff    |    6 +-
 .../debian/extutils_set_libperl_path.diff          |    8 +-
 .../perl/perl/debian/fakeroot.diff                 |   42 +++
 .../debian/find_html2text.diff                     |    6 +-
 .../debian/fixes/document_makemaker_ccflags.diff   |    6 +-
 .../debian/fixes/memoize_storable_nstore.diff      |    2 +-
 .../debian/fixes/net_smtp_docs.diff                |   14 +-
 .../perl/perl/debian/fixes/perl-Cnn.diff           |   73 +++++
 .../debian/fixes/pod_man_reproducible_date.diff    |  170 ++++++++++
 .../perl/perl/debian/fixes/podman-empty-date.diff  |   51 +++
 .../perl/perl/debian/fixes/podman-pipe.diff        |  109 +++++++
 .../perl/perl/debian/fixes/podman-utc-docs.diff    |   86 +++++
 .../perl/perl/debian/fixes/podman-utc.diff         |   33 ++
 .../debian/fixes/respect_umask.diff                |  156 ++++-----
 .../debian/instmodsh_doc.diff                      |    2 +-
 .../{perl-5.20.0 =3D> perl}/debian/ld_run_path.diff  |    6 +-
 .../debian/libnet_config_path.diff                 |   18 +-
 .../debian/libperl_embed_doc.diff                  |    2 +-
 .../perl/perl/debian/locale-robustness.diff        |   52 +++
 .../perl/perl/debian/makemaker-pasthru.diff        |   30 ++
 .../perl/perl/debian/makemaker_customized.diff     |   42 +++
 .../{perl-5.20.0 =3D> perl}/debian/mod_paths.diff    |    8 +-
 .../perl/perl/debian/no_packlist_perllocal.diff    |   92 ++++++
 .../perl/perl/debian/patchlevel.diff               |   30 ++
 .../debian/perl5db-x-terminal-emulator.patch       |    6 +-
 .../perl/{perl-5.20.0 =3D> perl}/debian/perlivp.diff |    2 +-
 .../perl/perl/debian/pod2man-customized.diff       |   23 ++
 .../debian/prefix_changes.diff                     |   22 +-
 .../{perl-5.20.0 =3D> perl}/debian/prune_libs.diff   |   12 +-
 .../{perl-5.20.0 =3D> perl}/debian/regen-skip.diff   |    2 +-
 .../debian/skip-kfreebsd-crash.diff                |    4 +-
 .../debian/skip-upstream-git-tests.diff            |    6 +-
 .../debian/squelch-locale-warnings.diff            |   35 +-
 .../debian/writable_site_dirs.diff                 |   18 +-
 .../{perl-5.20.0 =3D> perl}/dynaloaderhack.patch     |    0
 .../perl/{perl-5.20.0 =3D> perl}/fix_bad_rpath.patch |    0
 .../perl/{perl-5.20.0 =3D> perl}/generate-sh.patch   |    0
 .../perl/{perl-5.20.0 =3D> perl}/installperl.patch   |    0
 .../{perl-5.20.0 =3D> perl}/letgcc-find-errno.patch  |    0
 ...-fix-regenerate-makefile-failed-while-cc-.patch |    0
 .../perl/perl/native-nopacklist.patch              |   91 ++++++
 .../{perl-5.20.0 =3D> perl}/native-perlinc.patch     |    0
 .../{perl-5.20.0 =3D> perl}/perl-archlib-exp.patch   |    0
 .../perl-configpm-switch.patch                     |    0
 .../perl/{perl-5.20.0 =3D> perl}/perl-configure.sh   |    0
 .../{perl-5.20.0 =3D> perl}/perl-dynloader.patch     |    0
 .../{perl-5.20.0 =3D> perl}/perl-enable-gdbm.patch   |    0
 .../{perl-5.20.0 =3D> perl}/perl-moreconfig.patch    |    0
 .../perl/{perl-5.20.0 =3D> perl}/run-ptest           |    0
 .../dist-threads-t-join.t-adjust-ps-option.patch   |    0
 ...der-t-DynaLoader.t-fix-calling-dl_findfil.patch |    0
 .../perl/{perl_5.20.0.bb =3D> perl_5.22.0.bb}        |   19 +-
 81 files changed, 1596 insertions(+), 955 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/perl-5.20.0/0001-Makefile.SH=
-fix-do_install-failed.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/hurd_test=
_skip_stack.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/module_bu=
ild_man_extensions.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/no_packli=
st_perllocal.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.20.0/fix-FF_MORE-cras=
h.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.20.0/native-nopacklis=
t.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.20.0/perl-5.14.3-fix-=
CVE-2010-4777.patch
 rename meta/recipes-devtools/perl/{perl-native_5.20.0.bb =3D> perl-native_=
5.22.0.bb} (92%)
 rename meta/recipes-devtools/perl/{perl-rdepends_5.20.0.inc =3D> perl-rdep=
ends_5.22.0.inc} (94%)
 delete mode 100644 meta/recipes-devtools/perl/perl-rprovides.inc
 delete mode 100644 meta/recipes-devtools/perl/perl-rprovides_5.20.0.inc
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/Configure-multil=
ib.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/MM_Unix.pm.patch=
 (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/Makefile.SH.patc=
h (77%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/Makefile.patch (=
100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/config.sh (68%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/config.sh-32 (10=
0%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/config.sh-32-be =
(100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/config.sh-32-le =
(100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/config.sh-64 (10=
0%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/config.sh-64-be =
(100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/config.sh-64-le =
(100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/cross-generate_u=
udmap.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/cpan-miss=
ing-site-dirs.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/cpan_defi=
nstalldirs.diff (89%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/db_file_v=
er.diff (94%)
 create mode 100644 meta/recipes-devtools/perl/perl/debian/deprecate-with-a=
pt.diff
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/doc_info.=
diff (85%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/enc2xs_in=
c.diff (87%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/errno_ver=
.diff (87%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/extutils_=
set_libperl_path.diff (87%)
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fakeroot.diff
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/find_html=
2text.diff (89%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/fixes/doc=
ument_makemaker_ccflags.diff (87%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/fixes/mem=
oize_storable_nstore.diff (98%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/fixes/net=
_smtp_docs.diff (58%)
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.d=
iff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/pod_man_re=
producible_date.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-emp=
ty-date.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-pip=
e.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-utc=
-docs.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-utc=
.diff
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/fixes/res=
pect_umask.diff (64%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/instmodsh=
_doc.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/ld_run_pa=
th.diff (84%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/libnet_co=
nfig_path.diff (74%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/libperl_e=
mbed_doc.diff (92%)
 create mode 100644 meta/recipes-devtools/perl/perl/debian/locale-robustnes=
s.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/makemaker-pasthr=
u.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/makemaker_custom=
ized.diff
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/mod_paths=
.diff (93%)
 create mode 100644 meta/recipes-devtools/perl/perl/debian/no_packlist_perl=
local.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/patchlevel.diff
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/perl5db-x=
-terminal-emulator.patch (87%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/perlivp.d=
iff (95%)
 create mode 100644 meta/recipes-devtools/perl/perl/debian/pod2man-customiz=
ed.diff
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/prefix_ch=
anges.diff (89%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/prune_lib=
s.diff (78%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/regen-ski=
p.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/skip-kfre=
ebsd-crash.diff (91%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/skip-upst=
ream-git-tests.diff (80%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/squelch-l=
ocale-warnings.diff (59%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/debian/writable_=
site_dirs.diff (61%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/dynaloaderhack.p=
atch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/fix_bad_rpath.pa=
tch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/generate-sh.patc=
h (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/installperl.patc=
h (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/letgcc-find-errn=
o.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/make_ext.pl-fix-=
regenerate-makefile-failed-while-cc-.patch (100%)
 create mode 100644 meta/recipes-devtools/perl/perl/native-nopacklist.patch
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/native-perlinc.p=
atch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/perl-archlib-exp=
.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/perl-configpm-sw=
itch.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/perl-configure.s=
h (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/perl-dynloader.p=
atch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/perl-enable-gdbm=
.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/perl-moreconfig.=
patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/run-ptest (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/test/dist-thread=
s-t-join.t-adjust-ps-option.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 =3D> perl}/test/ext-DynaLoa=
der-t-DynaLoader.t-fix-calling-dl_findfil.patch (100%)
 rename meta/recipes-devtools/perl/{perl_5.20.0.bb =3D> perl_5.22.0.bb} (96=
%)

diff --git a/meta/recipes-devtools/perl/perl-5.20.0/0001-Makefile.SH-fix-do=
_install-failed.patch b/meta/recipes-devtools/perl/perl-5.20.0/0001-Makefil=
e.SH-fix-do_install-failed.patch
deleted file mode 100644
index b1787ce..0000000
--- a/meta/recipes-devtools/perl/perl-5.20.0/0001-Makefile.SH-fix-do_instal=
l-failed.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 2ed4b0c66fe7c7282922798eb3271b8f101359d1 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 19 Jun 2014 19:34:56 +0800
-Subject: [PATCH] Makefile.SH: fix do_install failed
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Makefile.SH | 16 +---------------
- 1 file changed, 1 insertion(+), 15 deletions(-)
-
-diff --git a/Makefile.SH b/Makefile.SH
-index f5d2d0f..e468c1b 100755
---- a/Makefile.SH
-+++ b/Makefile.SH
-@@ -1074,8 +1074,7 @@ EOT
-         $spitshell >>$Makefile <<EOT
-=20
- install_$name install-$name: \$(INSTALL_DEPENDENCE) installperl all insta=
llman
--	\$(RUN_PERL) installperl --destdir=3D\$(DESTDIR) $flags \$(INSTALLFLAGS)=
 \$(STRIPFLAGS)
--	\$(RUN_PERL) installman --destdir=3D\$(DESTDIR) $flags
-+	./hostperl -Ifake_config_library -Ilib -MConfig installperl --destdir=3D=
\$(DESTDIR) $flags  \$(INSTALLFLAGS) \$(STRIPFLAGS)
- EOT
-     fi
-=20
-@@ -1104,19 +1103,6 @@ else
- 	$spitshell >>$Makefile <<'!NO!SUBS!'
- install.perl:	$(INSTALL_DEPENDENCE) installperl
- 	./hostperl -Ifake_config_library -Ilib -MConfig installperl --destdir=3D=
$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
--
--# XXX Experimental. Hardwired values, but useful for testing.
--# Eventually Configure could ask for some of these values.
--install.html: all installhtml
--	-@test -f README.vms && cd vms && $(LNS) ../README.vms README_vms.pod &&=
 cd ..
--	$(RUN_PERL) installhtml   \
--      --podroot=3D. --podpath=3D. --recurse  \
--      --htmldir=3D$(privlib)/html   \
--      --htmlroot=3D$(privlib)/html  \
--      --splithead=3Dpod/perlipc     \
--      --splititem=3Dpod/perlfunc    \
--      --ignore=3DPorting/Maintainers.pm,Porting/pumpkin.pod,Porting/repos=
itory.pod \
--      --verbose
- !NO!SUBS!
- fi
-=20
---=20
-1.8.1.2
-
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/hurd_test_skip_s=
tack.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/hurd_test_skip_st=
ack.diff
deleted file mode 100644
index 66208a2..0000000
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/hurd_test_skip_stack.di=
ff
+++ /dev/null
@@ -1,32 +0,0 @@
-From 651aaac47361c03d15681b6cfdba0056a348fbb7 Mon Sep 17 00:00:00 2001
-From: Dominic Hargreaves <dom@earth.li>
-Date: Sun, 27 Nov 2011 16:27:07 +0000
-Subject: Disable failing GNU/Hurd tests dist/threads/t/stack.t
-
-These tests fail on GNU/Hurd owing to libpthread using fixed-size stacks.
-This is a known limitation that should get fixed in the future.
-
-For now, disable the tests.
-
-Bug-Debian: http://bugs.debian.org/650175
-
-Patch-Name: debian/hurd_test_skip_stack.diff
----
- dist/threads/t/stack.t | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/dist/threads/t/stack.t b/dist/threads/t/stack.t
-index cfd6cf7..84cc527 100644
---- a/dist/threads/t/stack.t
-+++ b/dist/threads/t/stack.t
-@@ -7,6 +7,10 @@ BEGIN {
-         print("1..0 # SKIP Perl not compiled with 'useithreads'\n");
-         exit(0);
-     }
-+    if ($^O eq 'gnu') {
-+        print("1..0 # SKIP fails on GNU/Hurd (Debian #650175)\n");
-+        exit(0);
-+    }
- }
-=20
- use ExtUtils::testlib;
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/module_build_man=
_extensions.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/module_bui=
ld_man_extensions.diff
deleted file mode 100644
index 894e953..0000000
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/module_build_man_extens=
ions.diff
+++ /dev/null
@@ -1,35 +0,0 @@
-From 333efa7c9da43d94272a872a59a6cd28da8ca245 Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Thu, 8 May 2008 14:32:33 +0300
-Subject: Adjust Module::Build manual page extensions for the Debian Perl
- policy
-
-Bug-Debian: http://bugs.debian.org/479460
-
-Patch-Name: debian/module_build_man_extensions.diff
----
- cpan/Module-Build/lib/Module/Build/Base.pm | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cpan/Module-Build/lib/Module/Build/Base.pm b/cpan/Module-Buil=
d/lib/Module/Build/Base.pm
-index 84e137f..4422cd4 100644
---- a/cpan/Module-Build/lib/Module/Build/Base.pm
-+++ b/cpan/Module-Build/lib/Module/Build/Base.pm
-@@ -3226,7 +3226,7 @@ sub manify_bin_pods {
-   foreach my $file (keys %$files) {
-     # Pod::Simple based parsers only support one document per instance.
-     # This is expected to change in a future version (Pod::Simple > 3.03)=
.
--    my $parser  =3D Pod::Man->new( %podman_args );
-+    my $parser  =3D Pod::Man->new( %podman_args, section =3D> '1p' ); # b=
inaries go in section 1p
-     my $manpage =3D $self->man1page_name( $file ) . '.' .
-                   $self->config( 'man1ext' );
-     my $outfile =3D File::Spec->catfile($mandir, $manpage);
-@@ -3252,7 +3252,7 @@ sub manify_lib_pods {
-   while (my ($file, $relfile) =3D each %$files) {
-     # Pod::Simple based parsers only support one document per instance.
-     # This is expected to change in a future version (Pod::Simple > 3.03)=
.
--    my $parser  =3D Pod::Man->new( %podman_args );
-+    my $parser  =3D Pod::Man->new( %podman_args, section =3D> '3pm' ); # =
libraries go in section 3pm
-     my $manpage =3D $self->man3page_name( $relfile ) . '.' .
-                   $self->config( 'man3ext' );
-     my $outfile =3D File::Spec->catfile( $mandir, $manpage);
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/no_packlist_perl=
local.diff b/meta/recipes-devtools/perl/perl-5.20.0/debian/no_packlist_perl=
local.diff
deleted file mode 100644
index 09fe1a9..0000000
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/no_packlist_perllocal.d=
iff
+++ /dev/null
@@ -1,93 +0,0 @@
-From 127c026bbb63907b196febf3558842d8f01e52ef Mon Sep 17 00:00:00 2001
-From: Brendan O'Dea <bod@debian.org>
-Date: Tue, 8 Mar 2005 19:30:38 +1100
-Subject: Don't install .packlist or perllocal.pod for perl or vendor
-
-Patch-Name: debian/no_packlist_perllocal.diff
----
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 36 +++-----------------=
-----
- 1 file changed, 4 insertions(+), 32 deletions(-)
-
-diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index f977476..0a6797f 100644
---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2079,11 +2079,6 @@ pure_perl_install :: all
- };
-=20
-     push @m,
--q{		read }.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlis=
t').q{ \
--		write }.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$(FULLEXT)','.pa=
cklist').q{ \
--} unless $self->{NO_PACKLIST};
--
--    push @m,
- q{		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
- 		$(INST_ARCHLIB) $(DESTINSTALLARCHLIB) \
- 		$(INST_BIN) $(DESTINSTALLBIN) \
-@@ -2115,10 +2110,6 @@ q{		$(INST_LIB) $(DESTINSTALLSITELIB) \
- pure_vendor_install :: all
- 	$(NOECHO) umask 022; $(MOD_INSTALL) \
- };
--    push @m,
--q{		read }.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packli=
st').q{ \
--		write }.$self->catfile('$(DESTINSTALLVENDORARCH)','auto','$(FULLEXT)','=
.packlist').q{ \
--} unless $self->{NO_PACKLIST};
-=20
-     push @m,
- q{		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
-@@ -2144,37 +2135,19 @@ doc_vendor_install :: all
-=20
-     push @m, q{
- doc_perl_install :: all
--	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
--	-$(NOECHO) umask 022; $(MKPATH) $(DESTINSTALLARCHLIB)
--	-$(NOECHO) umask 022; $(DOC_INSTALL) \
--		"Module" "$(NAME)" \
--		"installed into" "$(INSTALLPRIVLIB)" \
--		LINKTYPE "$(LINKTYPE)" \
--		VERSION "$(VERSION)" \
--		EXE_FILES "$(EXE_FILES)" \
--		>> }.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{
-=20
- doc_site_install :: all
--	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
--	-$(NOECHO) umask 02; $(MKPATH) $(DESTINSTALLARCHLIB)
-+	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLSITEARCH)/=
perllocal.pod
-+	-$(NOECHO) umask 02; $(MKPATH) $(DESTINSTALLSITEARCH)
- 	-$(NOECHO) umask 02; $(DOC_INSTALL) \
- 		"Module" "$(NAME)" \
- 		"installed into" "$(INSTALLSITELIB)" \
- 		LINKTYPE "$(LINKTYPE)" \
- 		VERSION "$(VERSION)" \
- 		EXE_FILES "$(EXE_FILES)" \
--		>> }.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{
-+		>> }.$self->catfile('$(DESTINSTALLSITEARCH)','perllocal.pod').q{
-=20
- doc_vendor_install :: all
--	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
--	-$(NOECHO) umask 022; $(MKPATH) $(DESTINSTALLARCHLIB)
--	-$(NOECHO) umask 022; $(DOC_INSTALL) \
--		"Module" "$(NAME)" \
--		"installed into" "$(INSTALLVENDORLIB)" \
--		LINKTYPE "$(LINKTYPE)" \
--		VERSION "$(VERSION)" \
--		EXE_FILES "$(EXE_FILES)" \
--		>> }.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{
-=20
- } unless $self->{NO_PERLLOCAL};
-=20
-@@ -2183,13 +2156,12 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
- 	$(NOECHO) $(NOOP)
-=20
- uninstall_from_perldirs ::
--	$(NOECHO) $(UNINSTALL) }.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULL=
EXT)','.packlist').q{
-=20
- uninstall_from_sitedirs ::
- 	$(NOECHO) $(UNINSTALL) }.$self->catfile('$(SITEARCHEXP)','auto','$(FULLE=
XT)','.packlist').q{
-=20
- uninstall_from_vendordirs ::
--	$(NOECHO) $(UNINSTALL) }.$self->catfile('$(VENDORARCHEXP)','auto','$(FUL=
LEXT)','.packlist').q{
-+
- };
-=20
-     join("",@m);
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/fix-FF_MORE-crash.patch=
 b/meta/recipes-devtools/perl/perl-5.20.0/fix-FF_MORE-crash.patch
deleted file mode 100644
index 9ec041c..0000000
--- a/meta/recipes-devtools/perl/perl-5.20.0/fix-FF_MORE-crash.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Backport
-Reference: https://rt.perl.org/Public/Bug/Display.html?id=3D123591
-  From 62db6ea5fed19611596cbc5fc0b8a4df2c604e58 Mon Sep 17 00:00:00 2001
-  From: Tony Cook <tony@develop-help.com>
-  Date: Mon, 19 Jan 2015 16:03:18 +1100
-  Subject: [PATCH 1/1] [perl #123538] always set chophere and itembytes at=
 the same time
-
-  Previously this would crash in FF_MORE because chophere was still NULL.
-
-Signed-off-by: Gary Thomas <gary@mlbassoc.com>
-Index: perl-5.20.0/pp_ctl.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- perl-5.20.0.orig/pp_ctl.c
-+++ perl-5.20.0/pp_ctl.c
-@@ -590,6 +590,7 @@ PP(pp_formline)
-                         break;
-                 }
-                 itembytes =3D s - item;
-+                chophere =3D s;
- 		break;
- 	    }
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/native-nopacklist.patch=
 b/meta/recipes-devtools/perl/perl-5.20.0/native-nopacklist.patch
deleted file mode 100644
index aafe0e2..0000000
--- a/meta/recipes-devtools/perl/perl-5.20.0/native-nopacklist.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-Upstream-Status:Inappropriate [debian patch]
-
-Part of 52_debian_extutils_hacks.patch just to exclude the installation of=
 .packlist files
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 36 +++-----------------=
-----
- 1 file changed, 4 insertions(+), 32 deletions(-)
-
-diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2079,11 +2079,6 @@ pure_perl_install :: all
- };
-=20
-     push @m,
--q{		read }.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlis=
t').q{ \
--		write }.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$(FULLEXT)','.pa=
cklist').q{ \
--} unless $self->{NO_PACKLIST};
--
--    push @m,
- q{		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
- 		$(INST_ARCHLIB) $(DESTINSTALLARCHLIB) \
- 		$(INST_BIN) $(DESTINSTALLBIN) \
-@@ -2115,10 +2110,6 @@ q{		$(INST_LIB) $(DESTINSTALLSITELIB) \
- pure_vendor_install :: all
- 	$(NOECHO) $(MOD_INSTALL) \
- };
--    push @m,
--q{		read }.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packli=
st').q{ \
--		write }.$self->catfile('$(DESTINSTALLVENDORARCH)','auto','$(FULLEXT)','=
.packlist').q{ \
--} unless $self->{NO_PACKLIST};
-=20
-     push @m,
- q{		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
-@@ -2144,37 +2135,19 @@ doc_vendor_install :: all
-=20
-     push @m, q{
- doc_perl_install :: all
--	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
--	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
--	-$(NOECHO) $(DOC_INSTALL) \
--		"Module" "$(NAME)" \
--		"installed into" "$(INSTALLPRIVLIB)" \
--		LINKTYPE "$(LINKTYPE)" \
--		VERSION "$(VERSION)" \
--		EXE_FILES "$(EXE_FILES)" \
--		>> }.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{
-=20
- doc_site_install :: all
--	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
--	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
-+	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLSITEARCH)/=
perllocal.pod
-+	-$(NOECHO) $(MKPATH) $(DESTINSTALLSITEARCH)
- 	-$(NOECHO) $(DOC_INSTALL) \
- 		"Module" "$(NAME)" \
- 		"installed into" "$(INSTALLSITELIB)" \
- 		LINKTYPE "$(LINKTYPE)" \
- 		VERSION "$(VERSION)" \
- 		EXE_FILES "$(EXE_FILES)" \
--		>> }.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{
-+		>> }.$self->catfile('$(DESTINSTALLSITEARCH)','perllocal.pod').q{
-=20
- doc_vendor_install :: all
--	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
--	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
--	-$(NOECHO) $(DOC_INSTALL) \
--		"Module" "$(NAME)" \
--		"installed into" "$(INSTALLVENDORLIB)" \
--		LINKTYPE "$(LINKTYPE)" \
--		VERSION "$(VERSION)" \
--		EXE_FILES "$(EXE_FILES)" \
--		>> }.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{
-=20
- } unless $self->{NO_PERLLOCAL};
-=20
-@@ -2183,13 +2156,12 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
- 	$(NOECHO) $(NOOP)
-=20
- uninstall_from_perldirs ::
--	$(NOECHO) $(UNINSTALL) }.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULL=
EXT)','.packlist').q{
-=20
- uninstall_from_sitedirs ::
- 	$(NOECHO) $(UNINSTALL) }.$self->catfile('$(SITEARCHEXP)','auto','$(FULLE=
XT)','.packlist').q{
-=20
- uninstall_from_vendordirs ::
--	$(NOECHO) $(UNINSTALL) }.$self->catfile('$(VENDORARCHEXP)','auto','$(FUL=
LEXT)','.packlist').q{
-+
- };
-=20
-     join("",@m);
---=20
-1.8.1.2
-
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/perl-5.14.3-fix-CVE-201=
0-4777.patch b/meta/recipes-devtools/perl/perl-5.20.0/perl-5.14.3-fix-CVE-2=
010-4777.patch
deleted file mode 100644
index e0dcf41..0000000
--- a/meta/recipes-devtools/perl/perl-5.20.0/perl-5.14.3-fix-CVE-2010-4777.=
patch
+++ /dev/null
@@ -1,45 +0,0 @@
-perl:fix for CVE-2010-4777
-
-Upstream-Status: Backport
-   =20
-The Perl_reg_numbered_buff_fetch function in Perl 5.10.0, 5.12.0,
-5.14.0, and other versions, when running with debugging enabled,
-allows context-dependent attackers to cause a denial of service
-(assertion failure and application exit) via crafted input that
-is not properly handled when using certain regular expressions,
-as demonstrated by causing SpamAssassin and OCSInventory to
-crash.
-
-http://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2010-4777
-
-Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
---- a/regcomp.c
-+++ b/regcomp.c
-@@ -11868,8 +11868,25 @@ Perl_save_re_context(pTHX)
-=20
- 		if (gvp) {
- 		    GV * const gv =3D *gvp;
--		    if (SvTYPE(gv) =3D=3D SVt_PVGV && GvSV(gv))
--			save_scalar(gv);
-+		    if (SvTYPE(gv) =3D=3D SVt_PVGV && GvSV(gv)) {
-+			/* this is a copy of save_scalar() without the GETMAGIC call, RT#76538=
 */
-+			SV ** const sptr =3D &GvSVn(gv);
-+			SV * osv =3D *sptr;
-+			SV * nsv =3D newSV(0);
-+			save_pushptrptr(SvREFCNT_inc_simple(gv),
-+			SvREFCNT_inc(osv), SAVEt_SV);
-+			if (SvTYPE(osv) >=3D SVt_PVMG && SvMAGIC(osv) &&
-+			    SvTYPE(osv) !=3D SVt_PVGV) {
-+			    if (SvGMAGICAL(osv)) {
-+				const bool oldtainted =3D PL_tainted;
-+				SvFLAGS(osv) |=3D (SvFLAGS(osv) &
-+				    (SVp_IOK|SVp_NOK|SVp_POK)) >> PRIVSHIFT;
-+				PL_tainted =3D oldtainted;
-+			    }
-+			    mg_localize(osv, nsv, 1);
-+			}
-+			*sptr =3D nsv;
-+		    }
- 		}
- 	    }
- 	}
diff --git a/meta/recipes-devtools/perl/perl-native_5.20.0.bb b/meta/recipe=
s-devtools/perl/perl-native_5.22.0.bb
similarity index 92%
rename from meta/recipes-devtools/perl/perl-native_5.20.0.bb
rename to meta/recipes-devtools/perl/perl-native_5.22.0.bb
index 586a347..dbfd82d 100644
--- a/meta/recipes-devtools/perl/perl-native_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
@@ -6,10 +6,7 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM =3D "file://Copying;md5=3D5b122a36d0f6dc55279a0ebc69f3c60=
b \
                     file://Artistic;md5=3D2e6fd2475335af892494fe1f7327baf3=
"
=20
-# 5.10.1 has Module::Build built-in
-PROVIDES +=3D "libmodule-build-perl-native"
-
-SRC_URI =3D "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
+SRC_URI =3D "http://www.cpan.org/src/5.0/${BP}.tar.xz \
            file://Configure-multilib.patch \
            file://perl-configpm-switch.patch \
            file://native-nopacklist.patch \
@@ -17,10 +14,10 @@ SRC_URI =3D "http://www.cpan.org/src/5.0/perl-${PV}.tar=
.gz \
            file://MM_Unix.pm.patch \
            file://debian/errno_ver.diff \
            file://dynaloaderhack.patch \
-           file://perl-5.14.3-fix-CVE-2010-4777.patch "
+          "
=20
-SRC_URI[md5sum] =3D "406ec049ebe3afcc80d9c76ec78ca4f8"
-SRC_URI[sha256sum] =3D "4e8c28ad6ecc89902f9cb2e76f2815bb1a8287ded278e15f7a=
36ca45f8bbcd02"
+SRC_URI[md5sum] =3D "ff0f09b17de426eff323426cb140ee79"
+SRC_URI[sha256sum] =3D "be83ead0c5c26cbbe626fa4bac1a4beabe23a9eebc15d35ba4=
9ccde11878e196"
=20
 S =3D "${WORKDIR}/perl-${PV}"
=20
diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc b/meta/rec=
ipes-devtools/perl/perl-rdepends_5.22.0.inc
similarity index 94%
rename from meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
rename to meta/recipes-devtools/perl/perl-rdepends_5.22.0.inc
index e39663c..7f886f3 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.22.0.inc
@@ -10,7 +10,7 @@
 #| grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e auto=
perl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-ma=
c -e fcgi -e lwp -e dbd -e dbix=20
 #| sort -u=20
 #| sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)=
/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;'=20
-#| egrep -wv '=3D>|module-a|module-apache.?|module-apr|module-authen-sasl|=
module-b-asmdata|module-build-.*|module-convert-ebcdic|module-devel-size|mo=
dule-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash=
|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-i=
o-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|=
module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|m=
odule-text-unidecode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s=
' > /tmp/
+#| egrep -wv '=3D>|module-a|module-apache.?|module-apr|module-authen-sasl|=
module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-perl=
-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils=
-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|module-=
ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-u=
til|module-pluggable-object|module-test-builder-io-scalar|module-text-unide=
code|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > /tmp/perl-rd=
epends
=20
 RDEPENDS_perl-misc +=3D "perl"
 RDEPENDS_${PN}-pod +=3D "perl"
@@ -22,7 +22,7 @@ RDEPENDS_${PN}-module-thread-queue +=3D "${PN}-module-att=
ributes"
=20
=20
 # Depends list
-# copy contents of /tmp/1 in this file
+# copy contents of /tmp/perl-rdepends in this file
 RDEPENDS_${PN}-module-anydbm-file +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-anydbm-file +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-carp"
@@ -49,6 +49,7 @@ RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-file-s=
pec"
 RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-getopt-long"
 RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-tap-harness"
+RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-tap-harness-env"
 RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-text-parsewords"
 RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-app-prove-state-r=
esult"
@@ -108,26 +109,33 @@ RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-m=
odule-carp"
 RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-fatal"
 RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-if"
 RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-overload"
 RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-autodie-exception-system +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-autodie-exception-system +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-autodie-exception-system +=3D "${PN}-module-parent"
 RDEPENDS_${PN}-module-autodie-exception-system +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-autodie-exception-system +=3D "${PN}-module-warnings=
"
 RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module-b"
-RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-fatal"
 RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-lib"
+RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-parent"
 RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-autodie-scope-guard +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-autodie-scope-guard +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-autodie-scope-guardstack +=3D "${PN}-module-autodie-=
scope-guard"
+RDEPENDS_${PN}-module-autodie-scope-guardstack +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-autodie-scope-guardstack +=3D "${PN}-module-warnings=
"
+RDEPENDS_${PN}-module-autodie-scopeutil +=3D "${PN}-module-autodie-scope-g=
uardstack"
+RDEPENDS_${PN}-module-autodie-scopeutil +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-autodie-scopeutil +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-autodie-scopeutil +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-autodie-skip +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-autodie-skip +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-autoloader +=3D "${PN}-module-carp"
@@ -144,6 +152,7 @@ RDEPENDS_${PN}-module-base +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-base +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-base +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-b-concise +=3D "${PN}-module-b"
+RDEPENDS_${PN}-module-b-concise +=3D "${PN}-module-b-op-private"
 RDEPENDS_${PN}-module-b-concise +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-b-concise +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-b-concise +=3D "${PN}-module-strict"
@@ -205,37 +214,6 @@ RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-b"
 RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-b-concise"
 RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-autosplit"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-config"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-cpan"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-cwd"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-data-dumper"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-extutils-cbuilder"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-extutils-install"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-extutils-installed"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-extutils-manifest"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-extutils-mkbootstrap"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-file-compare"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-file-copy"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-file-find"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-file-path"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-getopt-long"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-inc-latest"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-build"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-pod-man"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-tap-harness"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-test-harness"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-text-parsewords"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-version"
-RDEPENDS_${PN}-module-build +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-b-xref +=3D "${PN}-module-b"
 RDEPENDS_${PN}-module-b-xref +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-b-xref +=3D "${PN}-module-strict"
@@ -245,55 +223,11 @@ RDEPENDS_${PN}-module-carp-heavy +=3D "${PN}-module-c=
arp"
 RDEPENDS_${PN}-module-carp +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-carp +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-carp +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-cgi-apache +=3D "${PN}-module-cgi"
-RDEPENDS_${PN}-module-cgi-apache +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-cgi-carp +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-cgi-carp +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-cgi-carp +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-cgi-carp +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-cgi-cookie +=3D "${PN}-module-cgi"
-RDEPENDS_${PN}-module-cgi-cookie +=3D "${PN}-module-cgi-util"
-RDEPENDS_${PN}-module-cgi-cookie +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-cgi-cookie +=3D "${PN}-module-overload"
-RDEPENDS_${PN}-module-cgi-cookie +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-cgi-cookie +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-cgi-fast +=3D "${PN}-module-cgi"
-RDEPENDS_${PN}-module-cgi-fast +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-cgi-fast +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-cgi-fast +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-cgi-cookie"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-cgi-util"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-config"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-overload "
-RDEPENDS_${PN}-module-cgi +=3D "${PN}-module-text-parsewords"
-RDEPENDS_${PN}-module-cgi-pretty +=3D "${PN}-module-cgi"
-RDEPENDS_${PN}-module-cgi-pretty +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-cgi-pretty +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-cgi-push +=3D "${PN}-module-cgi"
-RDEPENDS_${PN}-module-cgi-push +=3D "${PN}-module-cgi-util"
-RDEPENDS_${PN}-module-cgi-push +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-cgi-switch +=3D "${PN}-module-cgi"
-RDEPENDS_${PN}-module-cgi-switch +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-cgi-util +=3D "${PN}-module-base"
-RDEPENDS_${PN}-module-cgi-util +=3D "${PN}-module-constant"
-RDEPENDS_${PN}-module-cgi-util +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-cgi-util +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-bytes"
-RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-charnames +=3D "${PN}-module--charnames"
-RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-re"
+RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-re"
-RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-unicore"
-RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-unicore"
-RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-class-struct +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-class-struct +=3D "${PN}-module-exporter"
@@ -339,7 +273,6 @@ RDEPENDS_${PN}-module-config-perl-v +=3D "${PN}-module-=
vars"
 RDEPENDS_${PN}-module-config-perl-v +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-constant +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-constant +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-constant +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-constant +=3D "${PN}-module-warnings-register"
 RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-list-util"
 RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-corelist"
@@ -347,58 +280,36 @@ RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-str=
ict"
 RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-version"
 RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-warnings"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-archive-tar"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-b"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-build"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-config"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-config-git"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-compress-zlib"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-cpan"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-cwd"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-data-dumper"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-digest-md5"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-digest-sha"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-dirhandle"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-extutils-cbuilder"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-extutils-makemaker"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-extutils-manifest"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-extutils-mm"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-extutils-mm-unix"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-fcntl"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-copy"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-find"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-glob"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-filehandle"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-path"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-temp"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-http-tiny"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-io-compress-base"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-json-pp"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-lib"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-list-util"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-mime-base64"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-net-ftp"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-net-ping"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-overload"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-parse-cpan-meta"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-posix"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-safe"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-scalar-util"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-sys-hostname"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-term-readline"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-test-harness"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-test-more"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-text-parsewords"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-text-wrap"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-time-local"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-unicore"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-version"
 RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-cwd +=3D "${PN}-module-dynaloader"
 RDEPENDS_${PN}-module-cwd +=3D "${PN}-module-exporter"
@@ -471,6 +382,7 @@ RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-fcn=
tl"
 RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-integer"
 RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-dirhandle +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-dirhandle +=3D "${PN}-module-symbol"
 RDEPENDS_${PN}-module-dynaloader +=3D "${PN}-module-carp"
@@ -625,6 +537,7 @@ RDEPENDS_${PN}-module-errno +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-experimental +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-experimental +=3D "${PN}-module-feature"
 RDEPENDS_${PN}-module-experimental +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-experimental +=3D "${PN}-module-version"
 RDEPENDS_${PN}-module-experimental +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-exporter-heavy +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-exporter-heavy +=3D "${PN}-module-exporter"
@@ -640,7 +553,6 @@ RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN=
}-module-file-temp"
 RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-ipc-cmd"
 RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-text-parse=
words"
-RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-file-path"
 RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-file-spec"
@@ -649,6 +561,7 @@ RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix +=
=3D "${PN}-module-extutils-c
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix +=3D "${PN}-module-fi=
le-spec"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix +=3D "${PN}-module-st=
rict"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix +=3D "${PN}-module-va=
rs"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-android +=3D "${PN}-modul=
e-config"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-android +=3D "${PN}-modul=
e-extutils-cbuilder-platform-unix"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-android +=3D "${PN}-modul=
e-file-spec"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-android +=3D "${PN}-modul=
e-strict"
@@ -675,9 +588,6 @@ RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms +=
=3D "${PN}-module-extutils-c
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms +=3D "${PN}-module-fi=
le-spec-functions"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms +=3D "${PN}-module-st=
rict"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms +=3D "${PN}-module-va=
rs"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-bcc +=3D "${PN}-m=
odule-vars"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-gcc +=3D "${PN}-m=
odule-vars"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-msvc +=3D "${PN}-=
module-vars"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-modul=
e-extutils-cbuilder-base"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-modul=
e-file-basename"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-modul=
e-file-spec"
@@ -695,11 +605,10 @@ RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}=
-module-test-harness"
 RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-file-compare"
 RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-file-copy"
 RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-file-find"
 RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-file-path"
+RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-carp"
@@ -777,10 +686,17 @@ RDEPENDS_${PN}-module-extutils-liblist +=3D "${PN}-mo=
dule-file-spec"
 RDEPENDS_${PN}-module-extutils-liblist +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-makemaker-config +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-extutils-makemaker-config +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-makemaker-locale +=3D "${PN}-module-base"
+RDEPENDS_${PN}-module-extutils-makemaker-locale +=3D "${PN}-module-encode"
+RDEPENDS_${PN}-module-extutils-makemaker-locale +=3D "${PN}-module-encode-=
alias"
+RDEPENDS_${PN}-module-extutils-makemaker-locale +=3D "${PN}-module-i18n-la=
nginfo"
+RDEPENDS_${PN}-module-extutils-makemaker-locale +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-b"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-cwd"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-extutils-makem=
aker-config"
+RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-extutils-makem=
aker-version"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-extutils-manif=
est"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-extutils-mm"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-extutils-my"
@@ -788,6 +704,21 @@ RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-m=
odule-file-path"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-version"
+RDEPENDS_${PN}-module-extutils-makemaker-version +=3D "${PN}-module-extuti=
ls-makemaker-version-regex"
+RDEPENDS_${PN}-module-extutils-makemaker-version +=3D "${PN}-module-strict=
"
+RDEPENDS_${PN}-module-extutils-makemaker-version +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-makemaker-version-regex +=3D "${PN}-module-=
strict"
+RDEPENDS_${PN}-module-extutils-makemaker-version-regex +=3D "${PN}-module-=
vars"
+RDEPENDS_${PN}-module-extutils-makemaker-version-vpp +=3D "${PN}-module-b"
+RDEPENDS_${PN}-module-extutils-makemaker-version-vpp +=3D "${PN}-module-ca=
rp"
+RDEPENDS_${PN}-module-extutils-makemaker-version-vpp +=3D "${PN}-module-co=
nfig"
+RDEPENDS_${PN}-module-extutils-makemaker-version-vpp +=3D "${PN}-module-co=
nstant"
+RDEPENDS_${PN}-module-extutils-makemaker-version-vpp +=3D "${PN}-module-ex=
tutils-makemaker-version-regex"
+RDEPENDS_${PN}-module-extutils-makemaker-version-vpp +=3D "${PN}-module-lo=
cale"
+RDEPENDS_${PN}-module-extutils-makemaker-version-vpp +=3D "${PN}-module-ov=
erload"
+RDEPENDS_${PN}-module-extutils-makemaker-version-vpp +=3D "${PN}-module-st=
rict"
+RDEPENDS_${PN}-module-extutils-makemaker-version-vpp +=3D "${PN}-module-un=
iversal"
+RDEPENDS_${PN}-module-extutils-makemaker-version-vpp +=3D "${PN}-module-va=
rs"
 RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-exporter"
@@ -797,7 +728,7 @@ RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-mod=
ule-file-find"
 RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-file-path"
 RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-miniperl +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-extutils-miniperl +=3D "${PN}-module-extutils-embed"
 RDEPENDS_${PN}-module-extutils-miniperl +=3D "${PN}-module-strict"
@@ -829,7 +760,6 @@ RDEPENDS_${PN}-module-extutils-mm-beos +=3D "${PN}-modu=
le-extutils-mm-any"
 RDEPENDS_${PN}-module-extutils-mm-beos +=3D "${PN}-module-extutils-mm-unix=
"
 RDEPENDS_${PN}-module-extutils-mm-beos +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-mm-beos +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-cygwin +=3D "${PN}-module-extutils-mm-un=
ix"
 RDEPENDS_${PN}-module-extutils-mm-cygwin +=3D "${PN}-module-extutils-makem=
aker-config"
 RDEPENDS_${PN}-module-extutils-mm-cygwin +=3D "${PN}-module-extutils-mm-un=
ix"
 RDEPENDS_${PN}-module-extutils-mm-cygwin +=3D "${PN}-module-extutils-mm-wi=
n32"
@@ -860,6 +790,7 @@ RDEPENDS_${PN}-module-extutils-mm-qnx +=3D "${PN}-modul=
e-strict"
 RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-cwd"
 RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-dirhandle"
+RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-encode"
 RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-extutils-liblist=
"
 RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-extutils-makemak=
er"
 RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-extutils-makemak=
er-config"
@@ -922,7 +853,6 @@ RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "=
${PN}-module-exporter"
 RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-extuti=
ls-parsexs-constants"
 RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-extuti=
ls-typemaps"
 RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-file-s=
pec"
-RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-lib"
 RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-strict=
"
 RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-warnin=
gs"
 RDEPENDS_${PN}-module-extutils-testlib +=3D "${PN}-module-cwd"
@@ -951,6 +881,7 @@ RDEPENDS_${PN}-module-extutils-typemaps-type +=3D "${PN=
}-module-strict"
 RDEPENDS_${PN}-module-extutils-typemaps-type +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-autodie-exception-system"
 RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-autodie-hints"
+RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-autodie-scopeutil"
 RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-config"
 RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-constant"
@@ -1151,21 +1082,6 @@ RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-modu=
le-exporter"
 RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-module-i18n-langtags"
 RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-extutils-installed"
-RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-file-copy"
-RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-file-path"
-RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-inc-latest-private"
-RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-inc-latest +=3D "${PN}-module-vars"
-RDEPENDS_${PN}-module-inc-latest-private +=3D "${PN}-module-extutils-makem=
aker"
-RDEPENDS_${PN}-module-inc-latest-private +=3D "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-inc-latest-private +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-inc-latest-private +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-inc-latest-private +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-io-compress-adapter-bzip2 +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-io-compress-adapter-bzip2 +=3D "${PN}-module-compres=
s-raw-bzip2"
 RDEPENDS_${PN}-module-io-compress-adapter-bzip2 +=3D "${PN}-module-io-comp=
ress-base-common"
@@ -1232,10 +1148,10 @@ RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-=
module-warnings"
 RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-bytes"
 RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-compress-r=
aw-zlib"
 RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-exporter "
+RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-fcntl"
 RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-io-compres=
s-adapter-deflate"
 RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-io-compres=
s-base"
 RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-io-compres=
s-base-common"
-RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-io-seekabl=
e"
 RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-strict "
 RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-io-compress-zip-constants +=3D "${PN}-module-constan=
t"
@@ -1707,6 +1623,8 @@ RDEPENDS_${PN}-module-memoize +=3D "${PN}-module-vars=
"
 RDEPENDS_${PN}-module-memoize-sdbm-file +=3D "${PN}-module-sdbm-file"
 RDEPENDS_${PN}-module-memoize-storable +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-memoize-storable +=3D "${PN}-module-storable"
+RDEPENDS_${PN}-module-meta-notation +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-meta-notation +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-mime-base64 +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-mime-base64 +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-mime-base64 +=3D "${PN}-module-vars"
@@ -1719,38 +1637,47 @@ RDEPENDS_${PN}-module-mro +=3D "${PN}-module-strict=
"
 RDEPENDS_${PN}-module-mro +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-mro +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-net-cmd +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-net-cmd +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-net-cmd +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-net-cmd +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-net-cmd +=3D "${PN}-module-symbol"
-RDEPENDS_${PN}-module-net-cmd +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-net-cmd +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-net-config +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-net-config +=3D "${PN}-module-socket"
 RDEPENDS_${PN}-module-net-config +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-config +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-net-config +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-net-config"
 RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-posix"
 RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-socket"
 RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-net-ftp-a +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-net-ftp-a +=3D "${PN}-module-net-ftp-dataconn"
 RDEPENDS_${PN}-module-net-ftp-a +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-ftp-a +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-net-ftp-a +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-net-ftp-dataconn +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-net-ftp-dataconn +=3D "${PN}-module-errno"
 RDEPENDS_${PN}-module-net-ftp-dataconn +=3D "${PN}-module-net-cmd"
-RDEPENDS_${PN}-module-net-ftp-dataconn +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-net-ftp-dataconn +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-net-ftp-dataconn +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-net-ftp-e +=3D "${PN}-module-net-ftp-i"
+RDEPENDS_${PN}-module-net-ftp-e +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-net-ftp-e +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-net-ftp-i +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-net-ftp-i +=3D "${PN}-module-net-ftp-dataconn"
-RDEPENDS_${PN}-module-net-ftp-i +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-net-ftp-i +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-net-ftp-i +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-net-ftp-l +=3D "${PN}-module-net-ftp-i"
+RDEPENDS_${PN}-module-net-ftp-l +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-net-ftp-l +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-carp"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-fcntl"
 RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-io-socket"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-io-socket-ip"
 RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-cmd"
 RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-config"
 RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-ftp-a"
@@ -1758,7 +1685,7 @@ RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-=
netrc"
 RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-socket"
 RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-time-local"
-RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-net-hostent +=3D "${PN}-module-class-struct"
 RDEPENDS_${PN}-module-net-hostent +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-net-hostent +=3D "${PN}-module-socket"
@@ -1772,14 +1699,15 @@ RDEPENDS_${PN}-module-net-netent +=3D "${PN}-module=
-vars"
 RDEPENDS_${PN}-module-net-netrc +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-net-netrc +=3D "${PN}-module-filehandle"
 RDEPENDS_${PN}-module-net-netrc +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-netrc +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-net-netrc +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-io-socket"
+RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-io-socket-ip"
 RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-net-cmd"
 RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-net-config"
 RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-time-local"
-RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-exporter"
@@ -1792,12 +1720,13 @@ RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-t=
ime-hires"
 RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-io-socket"
+RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-io-socket-ip"
 RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-mime-base64"
 RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-net-cmd"
 RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-net-config"
 RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-net-netrc"
 RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-net-protoent +=3D "${PN}-module-class-struct"
 RDEPENDS_${PN}-module-net-protoent +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-net-protoent +=3D "${PN}-module-strict"
@@ -1808,22 +1737,29 @@ RDEPENDS_${PN}-module-net-servent +=3D "${PN}-modul=
e-strict"
 RDEPENDS_${PN}-module-net-servent +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-io-socket"
+RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-io-socket-ip"
 RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-mime-base64"
 RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-net-cmd"
 RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-net-config"
 RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-socket"
 RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-io-select"
 RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-io-socket"
 RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-net-config"
 RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-next +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-next +=3D "${PN}-module-overload"
 RDEPENDS_${PN}-module-next +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-odbm-file +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-odbm-file +=3D "${PN}-module-tie-hash"
+RDEPENDS_${PN}-module-odbm-file +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-odbm-file +=3D "${PN}-module-xsloader"
+RDEPENDS_${PN}-module-ok +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-ok +=3D "${PN}-module-test-more"
 RDEPENDS_${PN}-module-opcode +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-opcode +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-opcode +=3D "${PN}-module-strict"
@@ -1841,10 +1777,6 @@ RDEPENDS_${PN}-module-overloading +=3D "${PN}-module=
-warnings"
 RDEPENDS_${PN}-module-overload +=3D "${PN}-module-mro"
 RDEPENDS_${PN}-module-overload +=3D "${PN}-module-scalar-util"
 RDEPENDS_${PN}-module-overload +=3D "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-overload +=3D "${PN}-module-overloading"
-RDEPENDS_${PN}-module-package-constants +=3D "${PN}-module-if"
-RDEPENDS_${PN}-module-package-constants +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-package-constants +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-params-check +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-params-check +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-params-check +=3D "${PN}-module-locale-maketext-simp=
le"
@@ -1852,6 +1784,8 @@ RDEPENDS_${PN}-module-params-check +=3D "${PN}-module=
-strict"
 RDEPENDS_${PN}-module-params-check +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-parent +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-parent +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-perlfaq +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-perlfaq +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-perlio-encoding +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-perlio-encoding +=3D "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-perlio-mmap +=3D "${PN}-module-strict"
@@ -1914,13 +1848,13 @@ RDEPENDS_${PN}-module-pod-perldoc-getoptsoo +=3D "$=
{PN}-module-strict"
 RDEPENDS_${PN}-module-pod-perldoc-getoptsoo +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-config"
+RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-encode"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-fcntl"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-file-spec-functions"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-file-temp"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-pod-perldoc-getoptsoo=
"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-symbol"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-text-parsewords"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-warnings"
@@ -2156,6 +2090,10 @@ RDEPENDS_${PN}-module-storable +=3D "${PN}-module-ex=
porter"
 RDEPENDS_${PN}-module-storable +=3D "${PN}-module-io-file"
 RDEPENDS_${PN}-module-storable +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-storable +=3D "${PN}-module-xsloader"
+RDEPENDS_${PN}-module-sub-util +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-sub-util +=3D "${PN}-module-list-util"
+RDEPENDS_${PN}-module-sub-util +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-sub-util +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-symbol +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-sys-hostname +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-sys-hostname +=3D "${PN}-module-exporter"
@@ -2424,6 +2362,23 @@ RDEPENDS_${PN}-module-test +=3D "${PN}-module-strict=
"
 RDEPENDS_${PN}-module-test +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-test-simple +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-test-simple +=3D "${PN}-module-test-builder-module"
+RDEPENDS_${PN}-module-test-tester-capture +=3D "${PN}-module-config"
+RDEPENDS_${PN}-module-test-tester-capture +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-test-tester-capture +=3D "${PN}-module-test-builder"
+RDEPENDS_${PN}-module-test-tester-capture +=3D "${PN}-module-threads-share=
d"
+RDEPENDS_${PN}-module-test-tester-capture +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-test-tester-capturerunner +=3D "${PN}-module-exporte=
r"
+RDEPENDS_${PN}-module-test-tester-capturerunner +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-test-tester-capturerunner +=3D "${PN}-module-test-te=
ster-capture"
+RDEPENDS_${PN}-module-test-tester-delegate +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-test-tester-delegate +=3D "${PN}-module-vars"
+RDEPENDS_${PN}-module-test-tester-delegate +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-test-tester +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-test-tester +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-test-tester +=3D "${PN}-module-test-builder"
+RDEPENDS_${PN}-module-test-tester +=3D "${PN}-module-test-tester-captureru=
nner"
+RDEPENDS_${PN}-module-test-tester +=3D "${PN}-module-test-tester-delegate"
+RDEPENDS_${PN}-module-test-tester +=3D "${PN}-module-vars"
 RDEPENDS_${PN}-module-text-abbrev +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-text-balanced +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-text-balanced +=3D "${PN}-module-exporter"
@@ -2535,16 +2490,24 @@ RDEPENDS_${PN}-module-time-seconds +=3D "${PN}-modu=
le-vars"
 RDEPENDS_${PN}-module-time-tm +=3D "${PN}-module-class-struct"
 RDEPENDS_${PN}-module-time-tm +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-unicode-collate-cjk-big5 +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-unicode-collate-cjk-big5 +=3D "${PN}-module-warnings=
"
 RDEPENDS_${PN}-module-unicode-collate-cjk-gb2312 +=3D "${PN}-module-strict=
"
+RDEPENDS_${PN}-module-unicode-collate-cjk-gb2312 +=3D "${PN}-module-warnin=
gs"
 RDEPENDS_${PN}-module-unicode-collate-cjk-jisx0208 +=3D "${PN}-module-stri=
ct"
+RDEPENDS_${PN}-module-unicode-collate-cjk-jisx0208 +=3D "${PN}-module-warn=
ings"
 RDEPENDS_${PN}-module-unicode-collate-cjk-korean +=3D "${PN}-module-strict=
"
 RDEPENDS_${PN}-module-unicode-collate-cjk-korean +=3D "${PN}-module-unicod=
e-collate"
+RDEPENDS_${PN}-module-unicode-collate-cjk-korean +=3D "${PN}-module-warnin=
gs"
 RDEPENDS_${PN}-module-unicode-collate-cjk-pinyin +=3D "${PN}-module-strict=
"
+RDEPENDS_${PN}-module-unicode-collate-cjk-pinyin +=3D "${PN}-module-warnin=
gs"
 RDEPENDS_${PN}-module-unicode-collate-cjk-stroke +=3D "${PN}-module-strict=
"
+RDEPENDS_${PN}-module-unicode-collate-cjk-stroke +=3D "${PN}-module-warnin=
gs"
 RDEPENDS_${PN}-module-unicode-collate-cjk-zhuyin +=3D "${PN}-module-strict=
"
+RDEPENDS_${PN}-module-unicode-collate-cjk-zhuyin +=3D "${PN}-module-warnin=
gs"
 RDEPENDS_${PN}-module-unicode-collate-locale +=3D "${PN}-module-base"
 RDEPENDS_${PN}-module-unicode-collate-locale +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-unicode-collate-locale +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-unicode-collate-locale +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-dynaloader"
@@ -2552,8 +2515,9 @@ RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-mod=
ule-file-spec"
 RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-carp"
-RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-dynaloader"
+RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-constant"
 RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-exporter"
+RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-strict"
 RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-carp"
@@ -2564,12 +2528,12 @@ RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-modul=
e-file-spec"
 RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-if"
 RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-integer"
 RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-strict"
+RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-unicode-normalize"
 RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-unicore"
 RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-utf8-heavy"
 RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-warnings"
 RDEPENDS_${PN}-module-unicore +=3D "${PN}-module-integer"
-RDEPENDS_${PN}-module-universal +=3D "${PN}-module-exporter"
-RDEPENDS_${PN}-module-universal +=3D "${PN}-module-warnings"
+RDEPENDS_${PN}-module-universal +=3D "${PN}-module-carp"
 RDEPENDS_${PN}-module-user-grent +=3D "${PN}-module-class-struct"
 RDEPENDS_${PN}-module-user-grent +=3D "${PN}-module-exporter"
 RDEPENDS_${PN}-module-user-grent +=3D "${PN}-module-strict"
diff --git a/meta/recipes-devtools/perl/perl-rprovides.inc b/meta/recipes-d=
evtools/perl/perl-rprovides.inc
deleted file mode 100644
index 3cfcb7d..0000000
--- a/meta/recipes-devtools/perl/perl-rprovides.inc
+++ /dev/null
@@ -1,49 +0,0 @@
-#
-# Some packages changed names in 5.8.7-r14, RPROVIDE them for things that
-# depend on the old name
-#
-RPROVIDES_perl-module-b-asmdata =3D "perl-module-${TARGET_SYS}-b-asmdata"
-RPROVIDES_perl-module-b-assembler =3D "perl-module-${TARGET_SYS}-b-assembl=
er"
-RPROVIDES_perl-module-b-bblock =3D "perl-module-${TARGET_SYS}-b-bblock"
-RPROVIDES_perl-module-build +=3D "perl-module-module-build"
-RPROVIDES_perl-module-b-bytecode =3D "perl-module-${TARGET_SYS}-b-bytecode=
"
-RPROVIDES_perl-module-b-cc =3D "perl-module-${TARGET_SYS}-b-cc"
-RPROVIDES_perl-module-b-concise =3D "perl-module-${TARGET_SYS}-b-concise"
-RPROVIDES_perl-module-b-debug =3D "perl-module-${TARGET_SYS}-b-debug"
-RPROVIDES_perl-module-b-deparse =3D "perl-module-${TARGET_SYS}-b-deparse"
-RPROVIDES_perl-module-b-disassembler =3D "perl-module-${TARGET_SYS}-b-disa=
ssembler"
-RPROVIDES_perl-module-b-lint =3D "perl-module-${TARGET_SYS}-b-lint"
-RPROVIDES_perl-module-b-showlex =3D "perl-module-${TARGET_SYS}-b-showlex"
-RPROVIDES_perl-module-b-stackobj =3D "perl-module-${TARGET_SYS}-b-stackobj=
"
-RPROVIDES_perl-module-b-stash =3D "perl-module-${TARGET_SYS}-b-stash"
-RPROVIDES_perl-module-b-terse =3D "perl-module-${TARGET_SYS}-b-terse"
-RPROVIDES_perl-module-b-xref =3D "perl-module-${TARGET_SYS}-b-xref"
-RPROVIDES_perl-lib +=3D " \
-    perl-module-config \
-    perl-module-config-heavy \
-    perl-module-${TARGET_SYS}-config \
-    perl-module-${TARGET_SYS}-config-heavy"
-RPROVIDES_perl-module-encode-alias =3D "perl-module-${TARGET_SYS}-encode-a=
lias"
-RPROVIDES_perl-module-encode-cjkconstants =3D "perl-module-${TARGET_SYS}-e=
ncode-cjkconstants"
-RPROVIDES_perl-module-encode-config =3D "perl-module-${TARGET_SYS}-encode-=
config"
-RPROVIDES_perl-module-encode-encoder =3D "perl-module-${TARGET_SYS}-encode=
-encoder"
-RPROVIDES_perl-module-encode-encoding =3D "perl-module-${TARGET_SYS}-encod=
e-encoding"
-RPROVIDES_perl-module-encode-guess =3D "perl-module-${TARGET_SYS}-encode-g=
uess"
-RPROVIDES_perl-module-encoding =3D "perl-module-${TARGET_SYS}-encoding"
-RPROVIDES_perl-module-errno =3D "perl-module-${TARGET_SYS}-errno"
-RPROVIDES_perl-module-io-dir =3D "perl-module-${TARGET_SYS}-io-dir"
-RPROVIDES_perl-module-io-file =3D "perl-module-${TARGET_SYS}-io-file"
-RPROVIDES_perl-module-io-handle =3D "perl-module-${TARGET_SYS}-io-handle"
-RPROVIDES_perl-module-io-pipe =3D "perl-module-${TARGET_SYS}-io-pipe"
-RPROVIDES_perl-module-io-poll =3D "perl-module-${TARGET_SYS}-io-poll"
-RPROVIDES_perl-module-io-seekable =3D "perl-module-${TARGET_SYS}-io-seekab=
le"
-RPROVIDES_perl-module-io-select =3D "perl-module-${TARGET_SYS}-io-select"
-RPROVIDES_perl-module-io-socket =3D "perl-module-${TARGET_SYS}-io-socket"
-RPROVIDES_perl-module-ipc-msg =3D "perl-module-${TARGET_SYS}-ipc-msg"
-RPROVIDES_perl-module-ipc-semaphore =3D "perl-module-${TARGET_SYS}-ipc-sem=
aphore"
-RPROVIDES_perl-module-lib =3D "perl-module-${TARGET_SYS}-lib"
-RPROVIDES_perl-module-mime-quotedprint =3D "perl-module-${TARGET_SYS}-mime=
-quotedprint"
-RPROVIDES_perl-module-o =3D "perl-module-${TARGET_SYS}-o"
-RPROVIDES_perl-module-ops =3D "perl-module-${TARGET_SYS}-ops"
-RPROVIDES_perl-module-safe =3D "perl-module-${TARGET_SYS}-safe"
-RPROVIDES_perl-module-xsloader =3D "perl-module-${TARGET_SYS}-xsloader"
diff --git a/meta/recipes-devtools/perl/perl-rprovides_5.20.0.inc b/meta/re=
cipes-devtools/perl/perl-rprovides_5.20.0.inc
deleted file mode 100644
index 9a648db..0000000
--- a/meta/recipes-devtools/perl/perl-rprovides_5.20.0.inc
+++ /dev/null
@@ -1 +0,0 @@
-RPROVIDES_perl-module-module-build +=3D "libmodule-build-perl"
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/Configure-multilib.patc=
h b/meta/recipes-devtools/perl/perl/Configure-multilib.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/Configure-multilib.patch
rename to meta/recipes-devtools/perl/perl/Configure-multilib.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/MM_Unix.pm.patch b/meta=
/recipes-devtools/perl/perl/MM_Unix.pm.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/MM_Unix.pm.patch
rename to meta/recipes-devtools/perl/perl/MM_Unix.pm.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/Makefile.SH.patch b/met=
a/recipes-devtools/perl/perl/Makefile.SH.patch
similarity index 77%
rename from meta/recipes-devtools/perl/perl-5.20.0/Makefile.SH.patch
rename to meta/recipes-devtools/perl/perl/Makefile.SH.patch
index 689d394..3de2331 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/Makefile.SH.patch
+++ b/meta/recipes-devtools/perl/perl/Makefile.SH.patch
@@ -2,10 +2,11 @@ Upstream-Status:Inappropriate [embedded specific]
=20
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- Makefile.SH | 130 ++++++++++++++++++++++++++++++-------------------------=
-----
- 1 file changed, 66 insertions(+), 64 deletions(-)
+ Makefile.SH |  145 +++++++++++++++++++++++++++---------------------------=
-----
+ 1 file changed, 67 insertions(+), 78 deletions(-)
=20
 diff --git a/Makefile.SH b/Makefile.SH
+index 034d812..67e08fd 100755
 --- a/Makefile.SH
 +++ b/Makefile.SH
 @@ -39,10 +39,10 @@ case "$useshrplib" in
@@ -59,14 +60,14 @@ diff --git a/Makefile.SH b/Makefile.SH
  	    ;;
  	os390)	test -f /bin/env && ldlibpth=3D"/bin/env $ldlibpth"
  		;;
-@@ -565,9 +555,19 @@ splintfiles =3D $(c1)
+@@ -566,13 +556,23 @@ splintfiles =3D $(c1)
  	@echo `$(CCCMDSRC)` -S $*.c
  	@`$(CCCMDSRC)` -S $*.c
 =20
--all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unid=
atafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make
+-all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unid=
atafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make $(MANIFEST_SRT)
 -	@echo " ";
 -	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite.=
"
-+#all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(uni=
datafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make
++#all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(uni=
datafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make $(MANIFEST_SRT=
)
 +#	@echo " ";
 +#	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite=
."
 +
@@ -75,14 +76,21 @@ diff --git a/Makefile.SH b/Makefile.SH
 +more: $(generated_pods) $(private) $(public)
 +
 +more2: $(dynamic_ext)
-+
+=20
+-$(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
+-	@$(RUN_PERL) Porting/manisort -q || (echo "WARNING: re-sorting MANIFEST"=
; \
+-	    $(RUN_PERL) Porting/manisort -q -o MANIFEST; sh -c true)
 +more3: $(nonxs_ext)
 +
-+more4: extras.make
-=20
- .PHONY: all translators utilities
++more4: extras.make $(MANIFEST_SRT)
++
++$(MANIFEST_SRT):	MANIFEST
++	@$(MINIPERL) Porting/manisort -q || (echo "WARNING: re-sorting MANIFEST"=
; \
++	    $(MINIPERL) Porting/manisort -q -o MANIFEST; sh -c true)
+ 	@touch $(MANIFEST_SRT)
 =20
-@@ -575,7 +575,7 @@ all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods=
) $(private) $(unidatafile
+ .PHONY: all utilities
+@@ -581,7 +581,7 @@ $(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
  # by make_patchnum.pl.
  git_version.h: lib/Config_git.pl
 =20
@@ -91,27 +99,25 @@ diff --git a/Makefile.SH b/Makefile.SH
  	$(MINIPERL) make_patchnum.pl
 =20
  # make sure that we recompile perl.c if the git version changes
-@@ -588,8 +588,8 @@ perl$(OBJ_EXT): git_version.h
+@@ -594,7 +594,7 @@ perl$(OBJ_EXT): git_version.h
  # loading, we need to build perl first.
  case "$usedl$static_cwd" in
  defineundef)
 -    util_deps=3D'$(MINIPERL_EXE) $(CONFIGPM) lib/auto/Cwd/Cwd$(DLSUFFIX) =
FORCE'
--     x2p_deps=3D"\$(MINIPERL_EXE) \$(CONFIGPM) \$(dynamic_ext) x2p/$first=
makefile FORCE"
 +    util_deps=3D'$(CONFIGPM) lib/auto/Cwd/Cwd$(DLSUFFIX) FORCE'
-+     x2p_deps=3D"\$(CONFIGPM) \$(dynamic_ext) x2p/$firstmakefile FORCE"
      ;;
  definedefine)
      util_deps=3D'$(PERL_EXE) $(CONFIGPM) FORCE'
-@@ -613,7 +613,7 @@ x2p/s2p: $x2p_deps
- x2p/find2perl: $x2p_deps
- 	cd x2p; \$(LDLIBPTH) \$(MAKE) find2perl
+@@ -604,7 +604,7 @@ definedefine)
+ esac
 =20
+ $spitshell >>$Makefile <<!GROK!THIS!
 -utils/Makefile: \$(MINIPERL_EXE) \$(CONFIGPM) utils/Makefile.PL
 +utils/Makefile: \$(CONFIGPM) utils/Makefile.PL
  	\$(MINIPERL) -Ilib utils/Makefile.PL
 =20
  utilities:	utils/Makefile $util_deps
-@@ -708,7 +708,7 @@ esac
+@@ -699,7 +699,7 @@ esac
 =20
 =20
  $spitshell >>$Makefile <<'!NO!SUBS!'
@@ -120,7 +126,7 @@ diff --git a/Makefile.SH b/Makefile.SH
  	$(MINIPERL) -Ilib -MExtUtils::Miniperl -e 'writemain(\"perlmain.c", @ARG=
V)' DynaLoader $(static_ext)
 =20
  # The file ext.libs is a list of libraries that must be linked in
-@@ -769,7 +769,7 @@ PERLEXPORT		=3D perl.exp
+@@ -760,7 +760,7 @@ PERLEXPORT		=3D perl.exp
  	;;
  	esac
  	$spitshell >>$Makefile <<'!NO!SUBS!'
@@ -129,7 +135,7 @@ diff --git a/Makefile.SH b/Makefile.SH
  	./$(MINIPERLEXP) makedef.pl --sort-fold PLATFORM=3Daix CC_FLAGS=3D"$(OPT=
IMIZE)" > perl.exp
 =20
  !NO!SUBS!
-@@ -778,7 +778,7 @@ os2)
+@@ -769,7 +769,7 @@ os2)
  	$spitshell >>$Makefile <<'!NO!SUBS!'
  MINIPERLEXP		=3D miniperl
 =20
@@ -138,7 +144,7 @@ diff --git a/Makefile.SH b/Makefile.SH
  	./$(MINIPERLEXP) makedef.pl PLATFORM=3Dos2 -DPERL_DLL=3D$(PERL_DLL) CC_F=
LAGS=3D"$(OPTIMIZE)" > perl5.def
 =20
  !NO!SUBS!
-@@ -838,7 +838,7 @@ $(LIBPERL): $& $(obj) $(DYNALOADER) $(LIBPERLEXPORT)
+@@ -829,7 +829,7 @@ $(LIBPERL): $& $(obj) $(DYNALOADER) $(LIBPERLEXPORT)
  	true)
  		$spitshell >>$Makefile <<'!NO!SUBS!'
  	rm -f $@
@@ -147,7 +153,7 @@ diff --git a/Makefile.SH b/Makefile.SH
  !NO!SUBS!
  		case "$osname" in
  		aix)
-@@ -886,7 +886,9 @@ $(MINIPERL_EXE): lib/buildcustomize.pl
+@@ -877,7 +877,9 @@ $(MINIPERL_EXE): lib/buildcustomize.pl
  		$spitshell >>$Makefile <<'!NO!SUBS!'
  lib/buildcustomize.pl: $& $(mini_obj)
  	$(CC) -o $(MINIPERL_EXE) $(CLDFLAGS) $(mini_obj) $(libs)
@@ -158,7 +164,7 @@ diff --git a/Makefile.SH b/Makefile.SH
  	$(MINIPERL) -f write_buildcustomize.pl
  !NO!SUBS!
  		;;
-@@ -894,7 +896,9 @@ lib/buildcustomize.pl: $& $(mini_obj)
+@@ -885,7 +887,9 @@ lib/buildcustomize.pl: $& $(mini_obj)
  		$spitshell >>$Makefile <<'!NO!SUBS!'
  lib/buildcustomize.pl: $& $(mini_obj) write    ldcustomize.pl
  	$(CC) -o $(MINIPERL_EXE) $(mini_obj    libs)
@@ -169,7 +175,7 @@ diff --git a/Makefile.SH b/Makefile.SH
  	$(MINIPERL) -f write_buildcustomize.pl   =20
  !NO!SUBS!
  		;;
-@@ -916,7 +920,9 @@ lib/buildcustomize.pl: $& $(mini_obj) write_buildcusto=
mize.pl
+@@ -907,7 +911,9 @@ lib/buildcustomize.pl: $& $(mini_obj) write_buildcusto=
mize.pl
  	-@rm -f miniperl.xok
  	$(CC) $(CLDFLAGS) $(NAMESPACEFLAGS) -o $(MINIPERL_EXE) \
  	    $(mini_obj) $(libs)
@@ -180,7 +186,7 @@ diff --git a/Makefile.SH b/Makefile.SH
  	$(MINIPERL) -f write_buildcustomize.pl
  !NO!SUBS!
  		;;
-@@ -927,7 +933,9 @@ lib/buildcustomize.pl: \$& \$(mini_obj) write_buildcus=
tomize.pl
+@@ -918,7 +924,9 @@ lib/buildcustomize.pl: \$& \$(mini_obj) write_buildcus=
tomize.pl
  	-@rm -f miniperl.xok
  	-@rm \$(MINIPERL_EXE)
  	\$(LNS) \$(HOST_PERL) \$(MINIPERL_EXE)
@@ -191,7 +197,7 @@ diff --git a/Makefile.SH b/Makefile.SH
  	\$(MINIPERL) -f write_buildcustomize.pl 'osname' "$osname"
  !GROK!THIS!
  		else
-@@ -936,7 +944,9 @@ lib/buildcustomize.pl: $& $(mini_obj) write_buildcusto=
mize.pl
+@@ -927,7 +935,9 @@ lib/buildcustomize.pl: $& $(mini_obj) write_buildcusto=
mize.pl
  	-@rm -f miniperl.xok
  	$(CC) $(CLDFLAGS) -o $(MINIPERL_EXE) \
  	    $(mini_obj) $(libs)
@@ -202,7 +208,7 @@ diff --git a/Makefile.SH b/Makefile.SH
  	$(MINIPERL) -f write_buildcustomize.pl
  !NO!SUBS!
  		fi
-@@ -967,7 +977,7 @@ case "${osname}" in
+@@ -971,7 +981,7 @@ case "${osname}" in
  catamount)
  $spitshell >>$Makefile <<!GROK!THIS!
  .PHONY: makeppport
@@ -211,7 +217,7 @@ diff --git a/Makefile.SH b/Makefile.SH
  	-@for f in Makefile.PL PPPort_pm.PL PPPort_xs.PL ppport_h.PL; do \
  	(cd ext/Devel-PPPort && `pwd`/run.sh ../../$(MINIPERL_EXE) -I../../lib \=
$\$f); \
  	done
-@@ -977,7 +987,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM)
+@@ -981,7 +991,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM)
  *)
  $spitshell >>$Makefile <<'!NO!SUBS!'
  .PHONY: makeppport
@@ -220,7 +226,7 @@ diff --git a/Makefile.SH b/Makefile.SH
  	$(MINIPERL) mkppport
 =20
  !NO!SUBS!
-@@ -987,16 +997,16 @@ esac
+@@ -991,16 +1001,16 @@ esac
  $spitshell >>$Makefile <<'!NO!SUBS!'
 =20
  .PHONY: preplibrary
@@ -240,7 +246,7 @@ diff --git a/Makefile.SH b/Makefile.SH
  	$(MINIPERL) lib/unicore/mktables -C lib/unicore -P pod -maketest -makeli=
st -p
  #	Commented out so always runs, mktables looks at far more files than we
  #	can in this makefile to decide if needs to run or not
-@@ -1005,22 +1015,22 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) lib/unicore/=
mktables $(nonxs_ext)
+@@ -1009,12 +1019,12 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) lib/unicore/=
mktables $(nonxs_ext)
  # $(PERL_EXE) and ext because pod_lib.pl needs Digest::MD5
  # But also this ensures that all extensions are built before we try to sc=
an
  # them, which picks up Devel::PPPort's documentation.
@@ -255,20 +261,27 @@ diff --git a/Makefile.SH b/Makefile.SH
 +pod/perlintern.pod: autodoc.pl embed.fnc
  	$(MINIPERL) autodoc.pl
 =20
--pod/perlmodlib.pod: $(MINIPERL_EXE) pod/perlmodlib.PL MANIFEST
-+pod/perlmodlib.pod: pod/perlmodlib.PL MANIFEST
- 	$(MINIPERL) pod/perlmodlib.PL -q
-=20
- pod/perl5200delta.pod: pod/perldelta.pod
- 	$(RMS) pod/perl5200delta.pod
- 	$(LNS) perldelta.pod pod/perl5200delta.pod
+ pod/perlmodlib.pod: $(MINIPERL_EXE) pod/perlmodlib.PL MANIFEST
+@@ -1024,7 +1034,7 @@ pod/perl5220delta.pod: pod/perldelta.pod
+ 	$(RMS) pod/perl5220delta.pod
+ 	$(LNS) perldelta.pod pod/perl5220delta.pod
 =20
 -extra.pods: $(MINIPERL_EXE)
 +extra.pods:
  	-@test ! -f extra.pods || rm -f `cat extra.pods`
  	-@rm -f extra.pods
  	-@for x in `grep -l '^=3D[a-z]' README.* | grep -v README.vms` ; do \
-@@ -1075,11 +1085,7 @@ done
+@@ -1068,8 +1078,7 @@ EOT
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
+@@ -1079,11 +1088,7 @@ done
  if test "X$hostperl" !=3D X; then
  	$spitshell >>$Makefile <<'!NO!SUBS!'
  install.perl:	$(INSTALL_DEPENDENCE) installperl
@@ -281,68 +294,76 @@ diff --git a/Makefile.SH b/Makefile.SH
 =20
  # XXX Experimental. Hardwired values, but useful for testing.
  # Eventually Configure could ask for some of these values.
-@@ -1097,11 +1103,7 @@ install.html: all installhtml
+@@ -1101,24 +1106,8 @@ install.html: all installhtml
  else
  	$spitshell >>$Makefile <<'!NO!SUBS!'
  install.perl:	$(INSTALL_DEPENDENCE) installperl
 -	$(RUN_PERL) installperl --destdir=3D$(DESTDIR) $(INSTALLFLAGS) $(STRIPFL=
AGS)
 -	-@test ! -s extras.lst || PATH=3D"`pwd`:\${PATH}" PERL5LIB=3D"`pwd`/lib"=
 \$(RUN_PERL) -Ilib -MCPAN -e '@ARGV&&install(@ARGV)' `cat extras.lst`
--
++	./hostperl -Ifake_config_library -Ilib -MConfig installperl --destdir=3D=
$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
+=20
 -install.man:	all installman
 -	$(RUN_PERL) installman --destdir=3D$(DESTDIR) $(INSTALLFLAGS)
-+	./hostperl -Ifake_config_library -Ilib -MConfig installperl --destdir=3D=
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
 =20
- # XXX Experimental. Hardwired values, but useful for testing.
- # Eventually Configure could ask for some of these values.
-@@ -1206,16 +1208,16 @@ manicheck:	FORCE
+@@ -1210,13 +1199,13 @@ manicheck:	FORCE
  #
  # DynaLoader may be needed for extensions that use Makefile.PL.
 =20
 -$(DYNALOADER):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary FORCE $(=
nonxs_ext)
 +$(DYNALOADER): lib/buildcustomize.pl preplibrary FORCE $(nonxs_ext)
- 	$(MINIPERL) make_ext.pl $@ MAKE=3D$(MAKE) LIBPERL_A=3D$(LIBPERL) LINKTYP=
E=3Dstatic $(STATIC_LDFLAGS)
+ 	$(MINIPERL) make_ext.pl $@ $(MAKE_EXT_ARGS) MAKE=3D"$(MAKE)" LIBPERL_A=
=3D$(LIBPERL) LINKTYPE=3Dstatic $(STATIC_LDFLAGS)
 =20
 -d_dummy $(dynamic_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary=
 makeppport $(DYNALOADER) FORCE $(PERLEXPORT) $(LIBPERL)
 +d_dummy $(dynamic_ext):	lib/buildcustomize.pl preplibrary makeppport $(DY=
NALOADER) FORCE $(PERLEXPORT) $(LIBPERL)
- 	$(MINIPERL) make_ext.pl $@ MAKE=3D$(MAKE) LIBPERL_A=3D$(LIBPERL) LINKTYP=
E=3Ddynamic
+ 	$(MINIPERL) make_ext.pl $@ $(MAKE_EXT_ARGS) MAKE=3D"$(MAKE)" LIBPERL_A=
=3D$(LIBPERL) LINKTYPE=3Ddynamic
 =20
 -s_dummy $(static_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary =
makeppport $(DYNALOADER) FORCE
 +s_dummy $(static_ext):	lib/buildcustomize.pl preplibrary makeppport $(DYN=
ALOADER) FORCE
- 	$(MINIPERL) make_ext.pl $@ MAKE=3D$(MAKE) LIBPERL_A=3D$(LIBPERL) LINKTYP=
E=3Dstatic $(STATIC_LDFLAGS)
-=20
--n_dummy $(nonxs_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary F=
ORCE
-+n_dummy $(nonxs_ext):	lib/buildcustomize.pl preplibrary FORCE
- 	$(MINIPERL) make_ext.pl $@ MAKE=3D$(MAKE) LIBPERL_A=3D$(LIBPERL)
- !NO!SUBS!
+ 	$(MINIPERL) make_ext.pl $@ $(MAKE_EXT_ARGS) MAKE=3D"$(MAKE)" LIBPERL_A=
=3D$(LIBPERL) LINKTYPE=3Dstatic $(STATIC_LDFLAGS)
 =20
-@@ -1409,7 +1411,7 @@ test_prep_pre: preplibrary utilities $(nonxs_ext)
+ n_dummy $(nonxs_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary F=
ORCE
+@@ -1405,14 +1394,14 @@ test_prep_pre: preplibrary utilities $(nonxs_ext)
 =20
  case "$targethost" in
  '') $spitshell >>$Makefile <<'!NO!SUBS!'
 -test_prep test-prep: test_prep_pre $(MINIPERL_EXE) $(unidatafiles) $(PERL=
_EXE) \
 +test_prep test-prep: test_prep_pre $(unidatafiles) $(PERL_EXE) \
- 	$(dynamic_ext) $(TEST_PERL_DLL) runtests x2p/s2p x2p/find2perl \
- 	$(generated_pods)
+ 	$(dynamic_ext) $(TEST_PERL_DLL) runtests $(generated_pods)
  	cd t && (rm -f $(PERL_EXE); $(LNS) ../$(PERL_EXE) $(PERL_EXE))
-@@ -1417,7 +1419,7 @@ test_prep test-prep: test_prep_pre $(MINIPERL_EXE) $=
(unidatafiles) $(PERL_EXE) \
+=20
  !NO!SUBS!
  ;;
  *) $spitshell >>$Makefile <<!GROK!THIS!
 -test_prep test-prep: test_prep_pre \$(MINIPERL_EXE) \$(unidatafiles) \$(P=
ERL_EXE) \
 +test_prep test-prep: test_prep_pre \$(unidatafiles) \$(PERL_EXE) \
- 	\$(dynamic_ext) \$(TEST_PERL_DLL) runtests x2p/s2p x2p/find2perl \
+ 	\$(dynamic_ext) \$(TEST_PERL_DLL) runtests \
  	\$(generated_pods)
  	$to libperl.*
-@@ -1469,7 +1471,7 @@ test_prep test-prep: test_prep_pre \$(MINIPERL_EXE) =
\$(unidatafiles) \$(PERL_EXE
+@@ -1465,7 +1454,7 @@ test_prep test-prep: test_prep_pre \$(MINIPERL_EXE) =
\$(unidatafiles) \$(PERL_EXE
  esac
 =20
  $spitshell >>$Makefile <<'!NO!SUBS!'
 -test_prep_reonly: $(MINIPERL_EXE) $(PERL_EXE) $(dynamic_ext_re) $(TEST_PE=
RL_DLL)
 +test_prep_reonly: $(PERL_EXE) $(dynamic_ext_re) $(TEST_PERL_DLL)
- 	$(MINIPERL) make_ext.pl $(dynamic_ext_re) MAKE=3D$(MAKE) LIBPERL_A=3D$(L=
IBPERL) LINKTYPE=3Ddynamic
+ 	$(MINIPERL) make_ext.pl $(dynamic_ext_re) MAKE=3D"$(MAKE)" LIBPERL_A=3D$=
(LIBPERL) LINKTYPE=3Ddynamic
  	cd t && (rm -f $(PERL_EXE); $(LNS) ../$(PERL_EXE) $(PERL_EXE))
  !NO!SUBS!
-@@ -1520,7 +1522,7 @@ $spitshell >>$Makefile <<'!NO!SUBS!'
+@@ -1516,7 +1505,7 @@ $spitshell >>$Makefile <<'!NO!SUBS!'
 =20
  # Can't depend on lib/Config.pm because that might be where miniperl
  # is crashing.
@@ -351,6 +372,3 @@ diff --git a/Makefile.SH b/Makefile.SH
  	-@test -f lib/Config.pm || $(MAKE) lib/Config.pm $(unidatafiles)
  	@echo " "
  	@echo "You may see some irrelevant test failures if you have been unable=
"
---=20
-1.8.1.2
-
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/Makefile.patch b/meta/r=
ecipes-devtools/perl/perl/Makefile.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/Makefile.patch
rename to meta/recipes-devtools/perl/perl/Makefile.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/config.sh b/meta/recipe=
s-devtools/perl/perl/config.sh
similarity index 68%
rename from meta/recipes-devtools/perl/perl-5.20.0/config.sh
rename to meta/recipes-devtools/perl/perl/config.sh
index 1ac1355..d80f0c0 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/config.sh
+++ b/meta/recipes-devtools/perl/perl/config.sh
@@ -8,13 +8,13 @@
=20
 # Package name      : perl5
 # Source directory  : .
-# Configuration time: Tue Jun 24 03:00:02 UTC 2014
+# Configuration time: Thu Jun 18 05:37:27 UTC 2015
 # Configured by     : Open Embedded
-# Target system     : linux qemuarm 3.14.5-yocto-standard #1 preempt mon j=
un 23 19:42:18 cst 2014 armv5tejl gnulinux=20
+# Target system     : linux qemux86-64 3.19.5-yocto-standard #1 smp preemp=
t tue jun 16 00:28:17 pdt 2015 x86_64 gnulinux
=20
 : Configure command line arguments.
 config_arg0=3D'Configure'
-config_args=3D'-des -Doptimize=3D-O2 -Dmyhostname=3Dlocalhost -Dperladmin=
=3Droot@localhost -Dcc=3Dgcc -Dcf_by=3DOpen Embedded -Dinstallprefix=3D@EXE=
CPREFIX@ -Dprefix=3D@EXECPREFIX@ -Dvendorprefix=3D@EXECPREFIX@ -Dsiteprefix=
=3D@EXECPREFIX@ -Dotherlibdirs=3D@LIBDIR@/perl/5.20.0 -Duseshrplib -Dusethr=
eads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_n=
dbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3D3pm -Duseperlio -Dinstallusr=
binperl -Ubincompat5005 -Uversiononly -Dpager=3D/usr/bin/less -isr'
+config_args=3D'-des -Doptimize=3D-O2 -Dmyhostname=3Dlocalhost -Dperladmin=
=3Droot@localhost -Dcc=3Dgcc -Dcf_by=3DOpen Embedded -Dinstallprefix=3D@EXE=
CPREFIX@ -Dprefix=3D@EXECPREFIX@ -Dvendorprefix=3D@EXECPREFIX@ -Dsiteprefix=
=3D@EXECPREFIX@ -Dotherlibdirs=3D@LIBDIR@/perl/5.22.0 -Duseshrplib -Dusethr=
eads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_n=
dbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3D3pm -Duseperlio -Dinstallusr=
binperl -Ubincompat5005 -Uversiononly -Dpager=3D@USRBIN@/less -isr'
 config_argc=3D28
 config_arg1=3D'-des'
 config_arg2=3D'-Doptimize=3D-O2'
@@ -26,7 +26,7 @@ config_arg7=3D'-Dinstallprefix=3D@EXECPREFIX@'
 config_arg8=3D'-Dprefix=3D@EXECPREFIX@'
 config_arg9=3D'-Dvendorprefix=3D@EXECPREFIX@'
 config_arg10=3D'-Dsiteprefix=3D@EXECPREFIX@'
-config_arg11=3D'-Dotherlibdirs=3D@LIBDIR@/perl/5.20.0'
+config_arg11=3D'-Dotherlibdirs=3D@LIBDIR@/perl/5.22.0'
 config_arg12=3D'-Duseshrplib'
 config_arg13=3D'-Dusethreads'
 config_arg14=3D'-Duseithreads'
@@ -43,16 +43,16 @@ config_arg24=3D'-Duseperlio'
 config_arg25=3D'-Dinstallusrbinperl'
 config_arg26=3D'-Ubincompat5005'
 config_arg27=3D'-Uversiononly'
-config_arg28=3D'-Dpager=3D/usr/bin/less -isr'
+config_arg28=3D'-Dpager=3D@USRBIN@/less -isr'
=20
 Author=3D''
-Date=3D'$Date'
+Date=3D''
 Header=3D''
-Id=3D'$Id'
+Id=3D''
 Locker=3D''
-Log=3D'$Log'
-RCSfile=3D'$RCSfile'
-Revision=3D'$Revision'
+Log=3D''
+RCSfile=3D''
+Revision=3D''
 Source=3D''
 State=3D''
 _a=3D'.a'
@@ -60,16 +60,17 @@ _exe=3D''
 _o=3D'.o'
 afs=3D'false'
 afsroot=3D'/afs'
+alignbytes=3D'8'
 ansi2knr=3D''
 aphostname=3D''
 api_revision=3D'5'
 api_subversion=3D'0'
-api_version=3D'14'
-api_versionstring=3D'5.14.0'
+api_version=3D'22'
+api_versionstring=3D'5.22.0'
 ar=3D'ar'
-archlib=3D'@LIBDIR@/perl/5.20.0/@ARCH@-thread-multi'
-archlibexp=3D'@STAGINGDIR@@LIBDIR@/perl/5.20.0/@ARCH@-thread-multi'
-archlib_exp=3D'@LIBDIR@/perl/5.20.0/@ARCH@-thread-multi'
+archlib=3D'@LIBDIR@/perl/5.22.0/@ARCH@-thread-multi'
+archlibexp=3D'@STAGINGDIR@@LIBDIR@/perl/5.22.0/@ARCH@-thread-multi'
+archlib_exp=3D'@LIBDIR@/perl/5.22.0/@ARCH@-thread-multi'
 archname64=3D''
 archname=3D'@ARCH@-thread-multi'
 archobjs=3D''
@@ -82,19 +83,21 @@ bin_ELF=3D'define'
 binexp=3D'@USRBIN@'
 bison=3D'bison'
 byacc=3D'byacc'
+byteorder=3D'12345678'
 c=3D''
 castflags=3D'0'
 cat=3D'cat'
 cc=3D'gcc'
 cccdlflags=3D'-fPIC'
-ccdlflags=3D'-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.20.0/@ARCH@-thread-multi/CO=
RE'
-ccflags=3D'-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-p=
rotector -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64'
+ccdlflags=3D'-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.22.0/@ARCH@-thread-multi/CO=
RE'
+ccflags=3D'-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe -=
D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_FORTIFY_SOURCE=3D2'
 ccflags_uselargefiles=3D'-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64'
 ccname=3D'gcc'
 ccsymbols=3D''
 ccversion=3D''
 cf_by=3D'Open Embedded'
 cf_email=3D'Open Embedded@localhost.localdomain'
+cf_time=3D'Thu Jun 18 05:37:27 UTC 2015'
 charbits=3D'8'
 charsize=3D'1'
 chgrp=3D''
@@ -109,11 +112,11 @@ cpio=3D''
 cpp=3D'cpp'
 cpp_stuff=3D'42'
 cppccsymbols=3D''
-cppflags=3D'-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-=
protector'
+cppflags=3D'-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe'
 cpplast=3D'-'
 cppminus=3D'-'
-cpprun=3D'gcc -E'
-cppstdin=3D'gcc -E'
+cpprun=3D'gcc  -E'
+cppstdin=3D'gcc  -E'
 crypt_r_proto=3D'REENTRANT_PROTO_B_CCS'
 cryptlib=3D''
 csh=3D'csh'
@@ -136,11 +139,14 @@ d_SCNfldbl=3D'define'
 d__fwalk=3D'undef'
 d_access=3D'define'
 d_accessx=3D'undef'
+d_acosh=3D'define'
 d_aintl=3D'undef'
 d_alarm=3D'define'
 d_archlib=3D'define'
 d_asctime64=3D'undef'
 d_asctime_r=3D'define'
+d_asinh=3D'define'
+d_atanh=3D'define'
 d_atolf=3D'undef'
 d_atoll=3D'define'
 d_attribute_deprecated=3D'define'
@@ -151,6 +157,7 @@ d_attribute_noreturn=3D'define'
 d_attribute_pure=3D'define'
 d_attribute_unused=3D'define'
 d_attribute_warn_unused_result=3D'define'
+d_backtrace=3D'define'
 d_bcmp=3D'define'
 d_bcopy=3D'define'
 d_bsd=3D'undef'
@@ -160,8 +167,9 @@ d_builtin_choose_expr=3D'define'
 d_builtin_expect=3D'define'
 d_bzero=3D'define'
 d_c99_variadic_macros=3D'define'
-d_casti32=3D'undef'
+d_casti32=3D'define'
 d_castneg=3D'define'
+d_cbrt=3D'define'
 d_charvspr=3D'undef'
 d_chown=3D'define'
 d_chroot=3D'define'
@@ -171,6 +179,7 @@ d_clearenv=3D'define'
 d_closedir=3D'define'
 d_cmsghdr_s=3D'define'
 d_const=3D'define'
+d_copysign=3D'define'
 d_copysignl=3D'define'
 d_cplusplus=3D'undef'
 d_crypt=3D'define'
@@ -182,12 +191,13 @@ d_ctime64=3D'undef'
 d_ctime_r=3D'define'
 d_cuserid=3D'define'
 d_dbl_dig=3D'define'
-d_dbminitproto=3D'undef'
+d_dbminitproto=3D'define'
 d_difftime64=3D'undef'
 d_difftime=3D'define'
 d_dir_dd_fd=3D'undef'
 d_dirfd=3D'define'
 d_dirnamlen=3D'undef'
+d_dladdr=3D'define'
 d_dlerror=3D'define'
 d_dlopen=3D'define'
 d_dlsymun=3D'undef'
@@ -209,8 +219,12 @@ d_endpwent_r=3D'undef'
 d_endsent=3D'define'
 d_endservent_r=3D'undef'
 d_eofnblk=3D'define'
+d_erf=3D'define'
+d_erfc=3D'define'
 d_eunice=3D'undef'
-d_faststdio=3D'define'
+d_exp2=3D'define'
+d_expm1=3D'define'
+d_faststdio=3D'undef'
 d_fchdir=3D'define'
 d_fchmod=3D'define'
 d_fchown=3D'define'
@@ -218,19 +232,27 @@ d_fcntl=3D'define'
 d_fcntl_can_lock=3D'define'
 d_fd_macros=3D'define'
 d_fd_set=3D'define'
+d_fdim=3D'define'
 d_fds_bits=3D'define'
+d_fegetround=3D'define'
 d_fgetpos=3D'define'
 d_finite=3D'define'
 d_finitel=3D'define'
 d_flexfnam=3D'define'
 d_flock=3D'define'
 d_flockproto=3D'define'
+d_fma=3D'define'
+d_fmax=3D'define'
+d_fmin=3D'define'
 d_fork=3D'define'
 d_fp_class=3D'undef'
+d_fp_classify=3D'undef'
+d_fp_classl=3D'undef'
 d_fpathconf=3D'define'
 d_fpclass=3D'undef'
-d_fpclassify=3D'undef'
+d_fpclassify=3D'define'
 d_fpclassl=3D'undef'
+d_fpgetround=3D'undef'
 d_fpos64_t=3D'undef'
 d_frexpl=3D'define'
 d_fs_data_s=3D'undef'
@@ -243,7 +265,7 @@ d_ftello=3D'define'
 d_ftime=3D'undef'
 d_futimes=3D'define'
 d_gdbm_ndbm_h_uses_prototypes=3D'undef'
-d_gdbmndbm_h_uses_prototypes=3D'undef'
+d_gdbmndbm_h_uses_prototypes=3D'define'
 d_getaddrinfo=3D'define'
 d_getcwd=3D'define'
 d_getespwnam=3D'undef'
@@ -308,6 +330,8 @@ d_gnulibc=3D'define'
 d_grpasswd=3D'define'
 d_hasmntopt=3D'define'
 d_htonl=3D'define'
+d_hypot=3D'define'
+d_ilogb=3D'define'
 d_ilogbl=3D'define'
 d_inc_version_list=3D'undef'
 d_index=3D'undef'
@@ -315,23 +339,50 @@ d_inetaton=3D'define'
 d_inetntop=3D'define'
 d_inetpton=3D'define'
 d_int64_t=3D'define'
+d_ip_mreq=3D'define'
+d_ip_mreq_source=3D'define'
+d_ipv6_mreq=3D'define'
+d_ipv6_mreq_source=3D'undef'
 d_isascii=3D'define'
-d_isfinite=3D'undef'
+d_isblank=3D'define'
+d_isfinite=3D'define'
+d_isfinitel=3D'undef'
 d_isinf=3D'define'
+d_isinfl=3D'define'
+d_isless=3D'undef'
 d_isnan=3D'define'
 d_isnanl=3D'define'
+d_isnormal=3D'define'
+d_j0=3D'define'
+d_j0l=3D'define'
 d_killpg=3D'define'
+d_lc_monetary_2008=3D'define'
 d_lchown=3D'define'
 d_ldbl_dig=3D'define'
+d_ldexpl=3D'define'
+d_lgamma=3D'define'
+d_lgamma_r=3D'define'
 d_libm_lib_version=3D'define'
+d_libname_unique=3D'undef'
 d_link=3D'define'
+d_llrint=3D'define'
+d_llrintl=3D'define'
+d_llround=3D'define'
+d_llroundl=3D'define'
 d_localtime64=3D'undef'
 d_localtime_r=3D'define'
 d_localtime_r_needs_tzset=3D'define'
 d_locconv=3D'define'
 d_lockf=3D'define'
+d_log1p=3D'define'
+d_log2=3D'define'
+d_logb=3D'define'
 d_longdbl=3D'define'
 d_longlong=3D'define'
+d_lrint=3D'define'
+d_lrintl=3D'define'
+d_lround=3D'define'
+d_lroundl=3D'define'
 d_lseekproto=3D'define'
 d_lstat=3D'define'
 d_madvise=3D'define'
@@ -371,10 +422,15 @@ d_msgsnd=3D'define'
 d_msync=3D'define'
 d_munmap=3D'define'
 d_mymalloc=3D'undef'
-d_ndbm=3D'undef'
+d_nan=3D'define'
+d_ndbm=3D'define'
 d_ndbm_h_uses_prototypes=3D'undef'
+d_nearbyint=3D'define'
+d_nextafter=3D'define'
+d_nexttoward=3D'define'
 d_nice=3D'define'
 d_nl_langinfo=3D'define'
+d_nv_preserves_uv=3D'undef'
 d_nv_zero_is_allbits_zero=3D'define'
 d_off64_t=3D'define'
 d_old_pthread_create_joinable=3D'undef'
@@ -388,11 +444,15 @@ d_phostname=3D'undef'
 d_pipe=3D'define'
 d_poll=3D'define'
 d_portable=3D'define'
+d_prctl=3D'define'
+d_prctl_set_name=3D'define'
+d_printf_format_null=3D'undef'
 d_procselfexe=3D'define'
 d_pseudofork=3D'undef'
 d_pthread_atfork=3D'define'
 d_pthread_attr_setscope=3D'define'
 d_pthread_yield=3D'define'
+d_ptrdiff_t=3D'define'
 d_pwage=3D'undef'
 d_pwchange=3D'undef'
 d_pwclass=3D'undef'
@@ -404,19 +464,27 @@ d_pwquota=3D'undef'
 d_qgcvt=3D'define'
 d_quad=3D'define'
 d_random_r=3D'define'
+d_re_comp=3D'undef'
 d_readdir64_r=3D'define'
 d_readdir=3D'define'
 d_readdir_r=3D'define'
 d_readlink=3D'define'
 d_readv=3D'define'
 d_recvmsg=3D'define'
+d_regcmp=3D'undef'
+d_regcomp=3D'define'
+d_remainder=3D'define'
+d_remquo=3D'define'
 d_rename=3D'define'
 d_rewinddir=3D'define'
+d_rint=3D'define'
 d_rmdir=3D'define'
+d_round=3D'define'
 d_safebcpy=3D'undef'
 d_safemcpy=3D'undef'
 d_sanemcmp=3D'define'
 d_sbrkproto=3D'define'
+d_scalbn=3D'define'
 d_scalbnl=3D'define'
 d_sched_yield=3D'define'
 d_scm_rights=3D'define'
@@ -461,7 +529,6 @@ d_setsent=3D'define'
 d_setservent_r=3D'undef'
 d_setsid=3D'define'
 d_setvbuf=3D'define'
-d_sfio=3D'undef'
 d_shm=3D'define'
 d_shmat=3D'define'
 d_shmatprototype=3D'define'
@@ -472,8 +539,11 @@ d_sigaction=3D'define'
 d_signbit=3D'define'
 d_sigprocmask=3D'define'
 d_sigsetjmp=3D'define'
+d_sin6_scope_id=3D'define'
 d_sitearch=3D'define'
 d_snprintf=3D'define'
+d_sockaddr_in6=3D'define'
+d_sockaddr_sa_len=3D'undef'
 d_sockatmark=3D'define'
 d_sockatmarkproto=3D'define'
 d_socket=3D'define'
@@ -486,17 +556,19 @@ d_srand48_r=3D'define'
 d_srandom_r=3D'define'
 d_sresgproto=3D'define'
 d_sresuproto=3D'define'
+d_stat=3D'define'
 d_statblks=3D'define'
-d_statfs_f_flags=3D'undef'
+d_statfs_f_flags=3D'define'
 d_statfs_s=3D'define'
+d_static_inline=3D'define'
 d_statvfs=3D'define'
 d_stdio_cnt_lval=3D'undef'
-d_stdio_ptr_lval=3D'define'
+d_stdio_ptr_lval=3D'undef'
 d_stdio_ptr_lval_nochange_cnt=3D'undef'
-d_stdio_ptr_lval_sets_cnt=3D'define'
+d_stdio_ptr_lval_sets_cnt=3D'undef'
 d_stdio_stream_array=3D'undef'
-d_stdiobase=3D'define'
-d_stdstdio=3D'define'
+d_stdiobase=3D'undef'
+d_stdstdio=3D'undef'
 d_strchr=3D'define'
 d_strcoll=3D'define'
 d_strctcpy=3D'define'
@@ -527,15 +599,19 @@ d_tcgetpgrp=3D'define'
 d_tcsetpgrp=3D'define'
 d_telldir=3D'define'
 d_telldirproto=3D'define'
+d_tgamma=3D'define'
 d_time=3D'define'
 d_timegm=3D'define'
 d_times=3D'define'
 d_tm_tm_gmtoff=3D'define'
 d_tm_tm_zone=3D'define'
 d_tmpnam_r=3D'define'
+d_trunc=3D'define'
 d_truncate=3D'define'
+d_truncl=3D'define'
 d_ttyname_r=3D'define'
 d_tzname=3D'define'
+d_u32align=3D'define'
 d_ualarm=3D'define'
 d_umask=3D'define'
 d_uname=3D'define'
@@ -558,7 +634,9 @@ d_vprintf=3D'define'
 d_vsnprintf=3D'define'
 d_wait4=3D'define'
 d_waitpid=3D'define'
+d_wcscmp=3D'define'
 d_wcstombs=3D'define'
+d_wcsxfrm=3D'define'
 d_wctomb=3D'define'
 d_writev=3D'define'
 d_xenix=3D'undef'
@@ -568,15 +646,15 @@ db_prefixtype=3D'size_t'
 db_version_major=3D''
 db_version_minor=3D''
 db_version_patch=3D''
-defvoidused=3D'15'
 direntrytype=3D'struct dirent'
 dlext=3D'so'
 dlsrc=3D'dl_dlopen.xs'
+doublekind=3D'3'
 doublesize=3D'8'
-drand01=3D'drand48()'
+drand01=3D'Perl_drand48()'
 drand48_r_proto=3D'REENTRANT_PROTO_I_ST'
 dtrace=3D''
-dynamic_ext=3D'B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper Deve=
l/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl File/DosGlob File/Gl=
ob Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/SysV=
 List/Util MIME/Base64 Math/BigInt/FastCalc Opcode POSIX PerlIO/encoding Pe=
rlIO/mmap PerlIO/scalar PerlIO/via SDBM_File Socket Storable Sys/Hostname S=
ys/Syslog Tie/Hash/NamedCapture Time/HiRes Time/Piece Unicode/Collate Unico=
de/Normalize XS/APItest XS/Typemap arybase attributes mro re threads thread=
s/shared'
+dynamic_ext=3D'B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper Deve=
l/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl File/DosGlob File/Gl=
ob Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/SysV=
 List/Util MIME/Base64 Math/BigInt/FastCalc NDBM_File ODBM_File Opcode POSI=
X PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via SDBM_File Socket Sto=
rable Sys/Hostname Sys/Syslog Tie/Hash/NamedCapture Time/HiRes Time/Piece U=
nicode/Collate XS/APItest XS/Typemap arybase attributes mro re threads thre=
ads/shared'
 eagain=3D'EAGAIN'
 ebcdic=3D'undef'
 echo=3D'echo'
@@ -591,7 +669,7 @@ endservent_r_proto=3D'0'
 eunicefix=3D':'
 exe_ext=3D''
 expr=3D'expr'
-extensions=3D'B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper Devel=
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
+extensions=3D'B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper Devel=
/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl File/DosGlob File/Glo=
b Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/SysV =
List/Util MIME/Base64 Math/BigInt/FastCalc NDBM_File ODBM_File Opcode POSIX=
 PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via SDBM_File Socket Stor=
able Sys/Hostname Sys/Syslog Tie/Hash/NamedCapture Time/HiRes Time/Piece Un=
icode/Collate XS/APItest XS/Typemap arybase attributes mro re threads threa=
ds/shared Archive/Tar Attribute/Handlers AutoLoader B/Debug CPAN CPAN/Meta =
CPAN/Meta/Requirements CPAN/Meta/YAML Carp Config/Perl/V Devel/SelfStubber =
Digest Dumpvalue Env Errno Exporter ExtUtils/CBuilder ExtUtils/Command ExtU=
tils/Constant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtil=
s/Miniperl ExtUtils/ParseXS File/Fetch File/Find File/Path File/Temp FileCa=
che Filter/Simple Getopt/Long HTTP/Tiny I18N/Collate I18N/LangTags IO/Compr=
ess IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 JSON/PP Locale/Codes Locale/Make=
text Locale/Maketext/Simple Math/BigInt Math/BigRat Math/Complex Memoize Mo=
dule/CoreList Module/Load Module/Load/Conditional Module/Loaded Module/Meta=
data NEXT Net/Ping Params/Check Parse/CPAN/Meta Perl/OSType PerlIO/via/Quot=
edPrint Pod/Checker Pod/Escapes Pod/Functions Pod/Html Pod/Parser Pod/Perld=
oc Pod/Simple Pod/Usage Safe Search/Dict SelfLoader Term/ANSIColor Term/Cap=
 Term/Complete Term/ReadLine Test Test/Harness Test/Simple Text/Abbrev Text=
/Balanced Text/ParseWords Text/Tabs Thread/Queue Thread/Semaphore Tie/File =
Tie/Memoize Tie/RefHash Time/Local Unicode/Normalize XSLoader autodie autou=
se base bignum constant encoding/warnings experimental if lib libnet parent=
 perlfaq podlators version'
 extern_C=3D'extern'
 extras=3D''
 fflushNULL=3D'define'
@@ -608,7 +686,7 @@ full_csh=3D'csh'
 full_sed=3D'sed'
 gccansipedantic=3D''
 gccosandvers=3D''
-gccversion=3D'4.9.0'
+gccversion=3D'4.9.2'
 getgrent_r_proto=3D'REENTRANT_PROTO_I_SBWR'
 getgrgid_r_proto=3D'REENTRANT_PROTO_I_TSBWR'
 getgrnam_r_proto=3D'REENTRANT_PROTO_I_CSBWR'
@@ -629,13 +707,14 @@ getservbyname_r_proto=3D'REENTRANT_PROTO_I_CCSBWR'
 getservbyport_r_proto=3D'REENTRANT_PROTO_I_ICSBWR'
 getservent_r_proto=3D'REENTRANT_PROTO_I_SBWR'
 getspnam_r_proto=3D'REENTRANT_PROTO_I_CSBWR'
+gidformat=3D'"u"'
 gidsign=3D'1'
 gidsize=3D'4'
 gidtype=3D'gid_t'
-glibpth=3D'@EXECPREFIX@/shlib @BASELIBDIR@ @LIBDIR@ @LIBDIR@/386 @BASELIBD=
IR@/386 @EXECPREFIX@/ccs/lib @EXECPREFIX@/ucblib @EXECPREFIX@/local/lib '
+glibpth=3D'@EXECPREFIX@/shlib  @BASELIBDIR@ @LIBDIR@ @LIBDIR@/386 @BASELIB=
DIR@386 @EXECPREFIX@/ccs@BASELIBDIR@ @EXECPREFIX@/ucblib @EXECPREFIX@/local=
@BASELIBDIR@ @BASELIBDIR@ @LIBDIR@ @EXECPREFIX@/local@BASELIBDIR@ '
 gmake=3D'gmake'
 gmtime_r_proto=3D'REENTRANT_PROTO_S_TS'
-gnulibc_version=3D'2.19'
+gnulibc_version=3D'2.21'
 grep=3D'grep'
 groupcat=3D'cat /etc/group'
 groupstype=3D'gid_t'
@@ -644,6 +723,9 @@ h_fcntl=3D'false'
 h_sysfile=3D'true'
 hint=3D'recommended'
 hostcat=3D'cat /etc/hosts'
+hostgenerate=3D''
+hostosname=3D''
+hostperl=3D''
 html1dir=3D' '
 html1direxp=3D''
 html3dir=3D' '
@@ -651,25 +733,29 @@ html3direxp=3D''
 i16size=3D'2'
 i16type=3D'short'
 i32size=3D'4'
+i32type=3D'int'
 i64size=3D'8'
+i64type=3D'long'
 i8size=3D'1'
 i8type=3D'signed char'
 i_arpainet=3D'define'
 i_assert=3D'define'
+i_bfd=3D'define'
 i_bsdioctl=3D''
 i_crypt=3D'define'
 i_db=3D'undef'
-i_dbm=3D'undef'
+i_dbm=3D'define'
 i_dirent=3D'define'
-i_dld=3D'undef'
 i_dlfcn=3D'define'
+i_execinfo=3D'define'
 i_fcntl=3D'undef'
+i_fenv=3D'define'
 i_float=3D'define'
 i_fp=3D'undef'
 i_fp_class=3D'undef'
 i_gdbm=3D'undef'
 i_gdbm_ndbm=3D'undef'
-i_gdbmndbm=3D'undef'
+i_gdbmndbm=3D'define'
 i_grp=3D'define'
 i_ieeefp=3D'undef'
 i_inttypes=3D'define'
@@ -692,13 +778,15 @@ i_poll=3D'define'
 i_prot=3D'undef'
 i_pthread=3D'define'
 i_pwd=3D'define'
+i_quadmath=3D'undef'
 i_rpcsvcdbm=3D'undef'
-i_sfio=3D'undef'
 i_sgtty=3D'undef'
 i_shadow=3D'define'
 i_socks=3D'undef'
 i_stdarg=3D'define'
+i_stdbool=3D'define'
 i_stddef=3D'define'
+i_stdint=3D'define'
 i_stdlib=3D'define'
 i_string=3D'define'
 i_sunmath=3D'undef'
@@ -747,7 +835,7 @@ inc_version_list_init=3D'0'
 incpath=3D''
 inews=3D''
 initialinstalllocation=3D'@USRBIN@'
-installarchlib=3D'@LIBDIR@/perl/5.20.0/@ARCH@-thread-multi'
+installarchlib=3D'@LIBDIR@/perl/5.22.0/@ARCH@-thread-multi'
 installbin=3D'@USRBIN@'
 installhtml1dir=3D''
 installhtml3dir=3D''
@@ -755,48 +843,50 @@ installman1dir=3D''
 installman3dir=3D''
 installprefix=3D'@EXECPREFIX@'
 installprefixexp=3D'@EXECPREFIX@'
-installprivlib=3D'@LIBDIR@/perl/5.20.0'
+installprivlib=3D'@LIBDIR@/perl/5.22.0'
 installscript=3D'@USRBIN@'
-installsitearch=3D'@LIBDIR@/perl/site_perl/5.20.0/@ARCH@-thread-multi'
+installsitearch=3D'@LIBDIR@/perl/site_perl/5.22.0/@ARCH@-thread-multi'
 installsitebin=3D'@USRBIN@'
 installsitehtml1dir=3D''
 installsitehtml3dir=3D''
-installsitelib=3D'@LIBDIR@/perl/site_perl/5.20.0'
+installsitelib=3D'@LIBDIR@/perl/site_perl/5.22.0'
 installsiteman1dir=3D''
 installsiteman3dir=3D''
 installsitescript=3D'@USRBIN@'
 installstyle=3D'lib/perl'
 installusrbinperl=3D'define'
-installvendorarch=3D'@LIBDIR@/perl/vendor_perl/5.20.0/@ARCH@-thread-multi'
+installvendorarch=3D'@LIBDIR@/perl/vendor_perl/5.22.0/@ARCH@-thread-multi'
 installvendorbin=3D'@USRBIN@'
 installvendorhtml1dir=3D''
 installvendorhtml3dir=3D''
-installvendorlib=3D'@LIBDIR@/perl/vendor_perl/5.20.0'
+installvendorlib=3D'@LIBDIR@/perl/vendor_perl/5.22.0'
 installvendorman1dir=3D''
 installvendorman3dir=3D''
 installvendorscript=3D'@USRBIN@'
 intsize=3D'4'
 issymlink=3D'test -h'
 ivdformat=3D'"ld"'
+ivsize=3D'8'
 ivtype=3D'long'
-known_extensions=3D'Archive/Tar Attribute/Handlers AutoLoader B B/Debug CG=
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
+known_extensions=3D'Archive/Tar Attribute/Handlers AutoLoader B B/Debug CP=
AN CPAN/Meta CPAN/Meta/Requirements CPAN/Meta/YAML Carp Compress/Raw/Bzip2 =
Compress/Raw/Zlib Config/Perl/V Cwd DB_File Data/Dumper Devel/PPPort Devel/=
Peek Devel/SelfStubber Digest Digest/MD5 Digest/SHA Dumpvalue Encode Env Er=
rno Exporter ExtUtils/CBuilder ExtUtils/Command ExtUtils/Constant ExtUtils/=
Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/Miniperl ExtUtils/Par=
seXS Fcntl File/DosGlob File/Fetch File/Find File/Glob File/Path File/Temp =
FileCache Filter/Simple Filter/Util/Call GDBM_File Getopt/Long HTTP/Tiny Ha=
sh/Util Hash/Util/FieldHash I18N/Collate I18N/LangTags I18N/Langinfo IO IO/=
Compress IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 IPC/SysV JSON/PP List/Util =
Locale/Codes Locale/Maketext Locale/Maketext/Simple MIME/Base64 Math/BigInt=
 Math/BigInt/FastCalc Math/BigRat Math/Complex Memoize Module/CoreList Modu=
le/Load Module/Load/Conditional Module/Loaded Module/Metadata NDBM_File NEX=
T Net/Ping ODBM_File Opcode POSIX Params/Check Parse/CPAN/Meta Perl/OSType =
PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via PerlIO/via/QuotedPrint=
 Pod/Checker Pod/Escapes Pod/Functions Pod/Html Pod/Parser Pod/Perldoc Pod/=
Simple Pod/Usage SDBM_File Safe Search/Dict SelfLoader Socket Storable Sys/=
Hostname Sys/Syslog Term/ANSIColor Term/Cap Term/Complete Term/ReadLine Tes=
t Test/Harness Test/Simple Text/Abbrev Text/Balanced Text/ParseWords Text/T=
abs Thread/Queue Thread/Semaphore Tie/File Tie/Hash/NamedCapture Tie/Memoiz=
e Tie/RefHash Time/HiRes Time/Local Time/Piece Unicode/Collate Unicode/Norm=
alize VMS/DCLsym VMS/Filespec VMS/Stdio Win32 Win32API/File Win32CORE XS/AP=
Itest XS/Typemap XSLoader arybase attributes autodie autouse base bignum co=
nstant encoding/warnings experimental if lib libnet mro parent perlfaq podl=
ators re threads threads/shared version '
 ksh=3D''
 ld=3D'gcc'
-lddlflags=3D'-shared -O2 -fstack-protector'
-ldflags=3D' -fstack-protector'
+ld_can_script=3D'define'
+lddlflags=3D'-shared -O2'
+ldflags=3D''
 ldflags_uselargefiles=3D''
 ldlibpthname=3D'LD_LIBRARY_PATH'
 less=3D'less'
 lib_ext=3D'.a'
-libc=3D'@BASELIBDIR@/libc-2.19.so'
+libc=3D'libc-2.21.so'
 libperl=3D'libperl.so'
-libpth=3D'@BASELIBDIR@ @LIBDIR@'
-libs=3D'-lnsl -lgdbm -ldb -ldl -lm -lcrypt -lutil -lpthread -lc'
+libpth=3D'@LIBDIR@ @BASELIBDIR@'
+libs=3D'-lpthread -lnsl -lgdbm -ldb -ldl -lm -lcrypt -lutil -lc -lgdbm_com=
pat'
 libsdirs=3D' @LIBDIR@'
-libsfiles=3D' libnsl.so libgdbm.so libdb.so libdl.so libm.so libcrypt.so l=
ibutil.so libpthread.so libc.so'
-libsfound=3D' @LIBDIR@/libnsl.so @LIBDIR@/libgdbm.so @LIBDIR@/libdb.so @LI=
BDIR@/libdl.so @LIBDIR@/libm.so @LIBDIR@/libcrypt.so @LIBDIR@/libutil.so @L=
IBDIR@/libpthread.so @LIBDIR@/libc.so'
-libspath=3D' @BASELIBDIR@ @LIBDIR@'
-libswanted=3D'sfio socket inet nsl nm ndbm gdbm dbm db malloc dl dld ld su=
n m crypt sec util pthread c cposix posix ucb BSD gdbm_compat'
+libsfiles=3D' libpthread.so libnsl.so libgdbm.so libdb.so libdl.so libm.so=
 libcrypt.so libutil.so libc.so libgdbm_compat.so'
+libsfound=3D' @LIBDIR@/libpthread.so @LIBDIR@/libnsl.so @LIBDIR@/libgdbm.s=
o @LIBDIR@/libdb.so @LIBDIR@/libdl.so @LIBDIR@/libm.so @LIBDIR@/libcrypt.so=
 @LIBDIR@/libutil.so @LIBDIR@/libc.so @LIBDIR@/libgdbm_compat.so'
+libspath=3D' @LIBDIR@ @BASELIBDIR@'
+libswanted=3D'cl pthread socket inet nsl nm gdbm dbm db malloc dl ld sun m=
 crypt sec util c cposix posix ucb BSD gdbm_compat'
 libswanted_uselargefiles=3D''
 line=3D''
 lint=3D''
@@ -805,17 +895,16 @@ ln=3D'ln'
 lns=3D'/bin/ln -s'
 localtime_r_proto=3D'REENTRANT_PROTO_S_TS'
 locincpth=3D'@EXECPREFIX@/local/include /opt/local/include @EXECPREFIX@/gn=
u/include /opt/gnu/include @EXECPREFIX@/GNU/include /opt/GNU/include'
-loclibpth=3D'@EXECPREFIX@/local/lib /opt/local/lib @EXECPREFIX@/gnu/lib /o=
pt/gnu/lib @EXECPREFIX@/GNU/lib /opt/GNU/lib'
+loclibpth=3D'@EXECPREFIX@/local@BASELIBDIR@ /opt/local@BASELIBDIR@ @EXECPR=
EFIX@/gnu@BASELIBDIR@ /opt/gnu@BASELIBDIR@ @EXECPREFIX@/GNU@BASELIBDIR@ /op=
t/GNU@BASELIBDIR@'
+longdblkind=3D'3'
+longdblsize=3D'16'
 longlongsize=3D'8'
+longsize=3D'8'
 lp=3D''
 lpr=3D''
 ls=3D'ls'
 lseeksize=3D'8'
 lseektype=3D'off_t'
-mad=3D'undef'
-madlyh=3D''
-madlyobj=3D''
-madlysrc=3D''
 mail=3D''
 mailx=3D''
 make=3D'make'
@@ -840,19 +929,23 @@ mv=3D''
 myarchname=3D'@ARCH@'
 mydomain=3D'.localdomain'
 myhostname=3D'localhost'
+myuname=3D'linux qemux86-64 3.19.5-yocto-standard #1 smp preempt tue jun 1=
6 00:28:17 pdt 2015 x86_64 gnulinux '
 n=3D'-n'
+need_va_copy=3D'define'
 netdb_hlen_type=3D'size_t'
+netdb_host_type=3D'char *'
 netdb_name_type=3D'const char *'
 netdb_net_type=3D'in_addr_t'
 nm=3D'nm'
 nm_opt=3D''
 nm_so_opt=3D'--dynamic'
-nonxs_ext=3D'Archive/Tar Attribute/Handlers AutoLoader B/Debug CGI CPAN CP=
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
+nonxs_ext=3D'Archive/Tar Attribute/Handlers AutoLoader B/Debug CPAN CPAN/M=
eta CPAN/Meta/Requirements CPAN/Meta/YAML Carp Config/Perl/V Devel/SelfStub=
ber Digest Dumpvalue Env Errno Exporter ExtUtils/CBuilder ExtUtils/Command =
ExtUtils/Constant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest Ext=
Utils/Miniperl ExtUtils/ParseXS File/Fetch File/Find File/Path File/Temp Fi=
leCache Filter/Simple Getopt/Long HTTP/Tiny I18N/Collate I18N/LangTags IO/C=
ompress IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 JSON/PP Locale/Codes Locale/=
Maketext Locale/Maketext/Simple Math/BigInt Math/BigRat Math/Complex Memoiz=
e Module/CoreList Module/Load Module/Load/Conditional Module/Loaded Module/=
Metadata NEXT Net/Ping Params/Check Parse/CPAN/Meta Perl/OSType PerlIO/via/=
QuotedPrint Pod/Checker Pod/Escapes Pod/Functions Pod/Html Pod/Parser Pod/P=
erldoc Pod/Simple Pod/Usage Safe Search/Dict SelfLoader Term/ANSIColor Term=
/Cap Term/Complete Term/ReadLine Test Test/Harness Test/Simple Text/Abbrev =
Text/Balanced Text/ParseWords Text/Tabs Thread/Queue Thread/Semaphore Tie/F=
ile Tie/Memoize Tie/RefHash Time/Local Unicode/Normalize XSLoader autodie a=
utouse base bignum constant encoding/warnings experimental if lib libnet pa=
rent perlfaq podlators version'
 nroff=3D'nroff'
 nvEUformat=3D'"E"'
 nvFUformat=3D'"F"'
 nvGUformat=3D'"G"'
 nv_overflows_integers_at=3D'256.0*256.0*256.0*256.0*256.0*256.0*2.0*2.0*2.=
0*2.0*2.0'
+nv_preserves_uv_bits=3D'53'
 nveformat=3D'"e"'
 nvfformat=3D'"f"'
 nvgformat=3D'"g"'
@@ -864,35 +957,39 @@ old_pthread_create_joinable=3D''
 optimize=3D'-O2'
 orderlib=3D'false'
 osname=3D'linux'
-osvers=3D'3.14.5-yocto-standard'
-otherlibdirs=3D'@LIBDIR@/perl/5.20.0'
-package=3D'perl5'
+osvers=3D'3.19.5-yocto-standard'
+otherlibdirs=3D'@LIBDIR@/perl/5.22.0'
+package=3D'perl'
 pager=3D'/usr/bin/less -isr'
 passcat=3D'cat /etc/passwd'
-patchlevel=3D'20'
+patchlevel=3D'22'
 path_sep=3D':'
 perl5=3D'@USRBIN@/perl'
-perl=3D''
+perl=3D'perl'
 perl_patchlevel=3D''
+perl_static_inline=3D'static __inline__'
 perladmin=3D'root@localhost'
-perllibs=3D'-lnsl -ldl -lm -lcrypt -lutil -lpthread -lc'
+perllibs=3D'-lpthread -lnsl -ldl -lm -lcrypt -lutil -lc'
 perlpath=3D'@USRBIN@/perl'
 pg=3D'pg'
 phostname=3D''
 pidtype=3D'pid_t'
-plibpth=3D''
+plibpth=3D'@LIBDIR@ @BASELIBDIR@'
 pmake=3D''
 pr=3D''
 prefix=3D'@EXECPREFIX@'
 prefixexp=3D'@EXECPREFIX@'
-privlib=3D'@LIBDIR@/perl/5.20.0'
-privlibexp=3D'@LIBDIR@/perl/5.20.0'
+privlib=3D'@LIBDIR@/perl/5.22.0'
+privlibexp=3D'@LIBDIR@/perl/5.22.0'
 procselfexe=3D'"/proc/self/exe"'
 prototype=3D'define'
+ptrsize=3D'8'
+quadkind=3D'2'
+quadtype=3D'long'
 randbits=3D'48'
-randfunc=3D'drand48'
+randfunc=3D'Perl_drand48'
 random_r_proto=3D'REENTRANT_PROTO_I_St'
-randseedtype=3D'long'
+randseedtype=3D'U32'
 ranlib=3D':'
 rd_nodata=3D'-1'
 readdir64_r_proto=3D'REENTRANT_PROTO_I_TSR'
@@ -903,18 +1000,29 @@ rm_try=3D'/bin/rm -f try try a.out .out try.[cho] tr=
y..o core core.try* try.core*'
 rmail=3D''
 run=3D''
 runnm=3D'false'
+sGMTIME_max=3D'67768036191676799'
+sGMTIME_min=3D'-62167219200'
+sLOCALTIME_max=3D'67768036191676799'
+sLOCALTIME_min=3D'-62167219200'
 sPRIEUldbl=3D'"LE"'
 sPRIFUldbl=3D'"LF"'
 sPRIGUldbl=3D'"LG"'
+sPRIXU64=3D'"lX"'
+sPRId64=3D'"ld"'
 sPRIeldbl=3D'"Le"'
 sPRIfldbl=3D'"Lf"'
 sPRIgldbl=3D'"Lg"'
+sPRIi64=3D'"li"'
+sPRIo64=3D'"lo"'
+sPRIu64=3D'"lu"'
+sPRIx64=3D'"lx"'
 sSCNfldbl=3D'"Lf"'
 sched_yield=3D'sched_yield()'
 scriptdir=3D'@USRBIN@'
 scriptdirexp=3D'@USRBIN@'
 sed=3D'sed'
-seedfunc=3D'srand48'
+seedfunc=3D'Perl_drand48_init'
+selectminbits=3D'64'
 selecttype=3D'fd_set *'
 sendmail=3D''
 setgrent_r_proto=3D'0'
@@ -938,17 +1046,17 @@ sig_num=3D'0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 =
17 18 19 20 21 22 23 24 25 26
 sig_num_init=3D'0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, =
17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35,=
 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54=
, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 6, 17, 29, 31, 0'
 sig_size=3D'69'
 signal_t=3D'void'
-sitearch=3D'@LIBDIR@/perl/site_perl/5.20.0/@ARCH@-thread-multi'
-sitearchexp=3D'@LIBDIR@/perl/site_perl/5.20.0/@ARCH@-thread-multi'
+sitearch=3D'@LIBDIR@/perl/site_perl/5.22.0/@ARCH@-thread-multi'
+sitearchexp=3D'@LIBDIR@/perl/site_perl/5.22.0/@ARCH@-thread-multi'
 sitebin=3D'@USRBIN@'
 sitebinexp=3D'@USRBIN@'
 sitehtml1dir=3D''
 sitehtml1direxp=3D''
 sitehtml3dir=3D''
 sitehtml3direxp=3D''
-sitelib=3D'@LIBDIR@/perl/site_perl/5.20.0'
+sitelib=3D'@LIBDIR@/perl/site_perl/5.22.0'
 sitelib_stem=3D'@LIBDIR@/perl/site_perl'
-sitelibexp=3D'@LIBDIR@/perl/site_perl/5.20.0'
+sitelibexp=3D'@LIBDIR@/perl/site_perl/5.22.0'
 siteman1dir=3D''
 siteman1direxp=3D''
 siteman3dir=3D''
@@ -957,6 +1065,7 @@ siteprefix=3D'@EXECPREFIX@'
 siteprefixexp=3D'@EXECPREFIX@'
 sitescript=3D'@USRBIN@'
 sitescriptexp=3D'@USRBIN@'
+sizesize=3D'8'
 sizetype=3D'size_t'
 sleep=3D''
 smail=3D''
@@ -971,6 +1080,8 @@ srand48_r_proto=3D'REENTRANT_PROTO_I_LS'
 srandom_r_proto=3D'REENTRANT_PROTO_I_TS'
 src=3D'.'
 ssizetype=3D'ssize_t'
+st_ino_sign=3D'1'
+st_ino_size=3D'8'
 startperl=3D'#!@USRBIN@/perl'
 startsh=3D'#!/bin/sh'
 static_ext=3D' '
@@ -984,11 +1095,18 @@ stdio_stream_array=3D''
 strerror_r_proto=3D'REENTRANT_PROTO_B_IBW'
 strings=3D'@INCLUDEDIR@/string.h'
 submit=3D''
-subversion=3D'2'
+subversion=3D'0'
 sysman=3D'@EXECPREFIX@/share/man/man1'
+sysroot=3D''
 tail=3D''
 tar=3D''
 targetarch=3D''
+targetdir=3D''
+targetenv=3D''
+targethost=3D''
+targetmkdir=3D''
+targetport=3D''
+targetsh=3D'/bin/sh'
 tbl=3D''
 tee=3D''
 test=3D'test'
@@ -1004,21 +1122,29 @@ ttyname_r_proto=3D'REENTRANT_PROTO_I_IBW'
 u16size=3D'2'
 u16type=3D'unsigned short'
 u32size=3D'4'
+u32type=3D'unsigned int'
 u64size=3D'8'
+u64type=3D'unsigned long'
 u8size=3D'1'
 u8type=3D'unsigned char'
+uidformat=3D'"u"'
 uidsign=3D'1'
 uidsize=3D'4'
 uidtype=3D'uid_t'
 uname=3D'uname'
 uniq=3D'uniq'
+uquadtype=3D'unsigned long'
 use5005threads=3D'undef'
+use64bitall=3D'define'
+use64bitint=3D'define'
+usecbacktrace=3D'undef'
 usecrosscompile=3D'define'
 usedevel=3D'undef'
 usedl=3D'define'
 usedtrace=3D'undef'
 usefaststdio=3D'undef'
 useithreads=3D'define'
+usekernprocpathname=3D'undef'
 uselargefiles=3D'define'
 uselongdouble=3D'undef'
 usemallocwrap=3D'define'
@@ -1026,85 +1152,68 @@ usemorebits=3D'undef'
 usemultiplicity=3D'define'
 usemymalloc=3D'n'
 usenm=3D'false'
+usensgetexecutablepath=3D'undef'
 useopcode=3D'true'
 useperlio=3D'define'
 useposix=3D'true'
+usequadmath=3D'undef'
 usereentrant=3D'undef'
 userelocatableinc=3D'undef'
-usesfio=3D'false'
 useshrplib=3D'true'
 usesitecustomize=3D'undef'
 usesocks=3D'undef'
 usethreads=3D'define'
 usevendorprefix=3D'define'
+useversionedarchname=3D'undef'
 usevfork=3D'false'
 usrinc=3D'@INCLUDEDIR@'
 uuname=3D''
 uvXUformat=3D'"lX"'
 uvoformat=3D'"lo"'
+uvsize=3D'8'
 uvtype=3D'unsigned long'
 uvuformat=3D'"lu"'
 uvxformat=3D'"lx"'
 vaproto=3D'define'
-vendorarch=3D'@LIBDIR@/perl/vendor_perl/5.20.0/@ARCH@-thread-multi'
-vendorarchexp=3D'@LIBDIR@/perl/vendor_perl/5.20.0/@ARCH@-thread-multi'
+vendorarch=3D'@LIBDIR@/perl/vendor_perl/5.22.0/@ARCH@-thread-multi'
+vendorarchexp=3D'@LIBDIR@/perl/vendor_perl/5.22.0/@ARCH@-thread-multi'
 vendorbin=3D'@USRBIN@'
 vendorbinexp=3D'@USRBIN@'
 vendorhtml1dir=3D' '
 vendorhtml1direxp=3D''
 vendorhtml3dir=3D' '
 vendorhtml3direxp=3D''
-vendorlib=3D'@LIBDIR@/perl/vendor_perl/5.20.0'
+vendorlib=3D'@LIBDIR@/perl/vendor_perl/5.22.0'
 vendorlib_stem=3D'@LIBDIR@/perl/vendor_perl'
-vendorlibexp=3D'@LIBDIR@/perl/vendor_perl/5.20.0'
+vendorlibexp=3D'@LIBDIR@/perl/vendor_perl/5.22.0'
 vendorman1dir=3D' '
 vendorman1direxp=3D''
 vendorman3dir=3D' '
 vendorman3direxp=3D''
-vendorprefix=3D'/usr'
-vendorprefixexp=3D'/usr'
+vendorprefix=3D'@EXECPREFIX@'
+vendorprefixexp=3D'@EXECPREFIX@'
 vendorscript=3D'@USRBIN@'
 vendorscriptexp=3D'@USRBIN@'
-version=3D'5.20.0'
-version_patchlevel_string=3D'version 14 subversion 2'
+version=3D'5.22.0'
+version_patchlevel_string=3D'version 22 subversion 0'
 versiononly=3D'undef'
 vi=3D''
-voidflags=3D'15'
-xlibpth=3D'@LIBDIR@/386 @BASELIBDIR@/386'
+xlibpth=3D'@LIBDIR@/386 @BASELIBDIR@386'
 yacc=3D'yacc'
 yaccflags=3D''
 zcat=3D''
 zip=3D'zip'
 PERL_REVISION=3D5
-PERL_VERSION=3D20
+PERL_VERSION=3D22
 PERL_SUBVERSION=3D0
 PERL_API_REVISION=3D5
-PERL_API_VERSION=3D20
+PERL_API_VERSION=3D22
 PERL_API_SUBVERSION=3D0
 PERL_PATCHLEVEL=3D''
 PERL_CONFIG_SH=3Dtrue
 : Variables propagated from previous config.sh file.
 libdb_needs_pthread=3D'N'
=20
-d_static_inline=3D'define'
-d_sockaddr_sa_len=3D'undef'
-d_sin6_scope_id=3D'define'
-d_prctl=3D'define'
-d_prctl_set_name=3D'define'
-perl_static_inline=3D'static __inline__'
-d_sockaddr_in6=3D'undef'
-d_ip_mreq=3D'undef'
-d_ip_mreq_source=3D'undef'
-d_ipv6_mreq=3D'undef'
-d_ipv6_mreq_source=3D'undef'
-bootstrap_charset=3D'undef'
-d_isblank=3D'define'
-i_stdbool=3D'undef'
-usekernprocpathname=3D'undef'
-usensgetexecutablepath=3D'undef'
-st_ino_sign=3D'1'
-st_ino_size=3D'4'
-
 # for Time-HiRes
 d_clock_nanosleep=3D'define'
 d_clock_gettime=3D'define'
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/config.sh-32 b/meta/rec=
ipes-devtools/perl/perl/config.sh-32
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/config.sh-32
rename to meta/recipes-devtools/perl/perl/config.sh-32
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/config.sh-32-be b/meta/=
recipes-devtools/perl/perl/config.sh-32-be
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/config.sh-32-be
rename to meta/recipes-devtools/perl/perl/config.sh-32-be
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/config.sh-32-le b/meta/=
recipes-devtools/perl/perl/config.sh-32-le
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/config.sh-32-le
rename to meta/recipes-devtools/perl/perl/config.sh-32-le
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/config.sh-64 b/meta/rec=
ipes-devtools/perl/perl/config.sh-64
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/config.sh-64
rename to meta/recipes-devtools/perl/perl/config.sh-64
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/config.sh-64-be b/meta/=
recipes-devtools/perl/perl/config.sh-64-be
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/config.sh-64-be
rename to meta/recipes-devtools/perl/perl/config.sh-64-be
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/config.sh-64-le b/meta/=
recipes-devtools/perl/perl/config.sh-64-le
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/config.sh-64-le
rename to meta/recipes-devtools/perl/perl/config.sh-64-le
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/cross-generate_uudmap.p=
atch b/meta/recipes-devtools/perl/perl/cross-generate_uudmap.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/cross-generate_uudmap.pa=
tch
rename to meta/recipes-devtools/perl/perl/cross-generate_uudmap.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/cpan-missing-sit=
e-dirs.diff b/meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs=
.diff
similarity index 93%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/cpan-missing-site=
-dirs.diff
rename to meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.dif=
f
index a5eb71e..a63b968 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/cpan-missing-site-dirs.=
diff
+++ b/meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff
@@ -1,4 +1,4 @@
-From 25994ac1124566398adee13806ef9a73d2cae150 Mon Sep 17 00:00:00 2001
+From d33d46963035ef726144dc66be2ae9c00aec0333 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Tue, 16 Oct 2012 23:07:56 +0300
 Subject: Fix CPAN::FirstTime defaults with nonexisting site dirs if a pare=
nt
@@ -18,10 +18,10 @@ Patch-Name: debian/cpan-missing-site-dirs.diff
  1 file changed, 27 insertions(+), 4 deletions(-)
=20
 diff --git a/cpan/CPAN/lib/CPAN/FirstTime.pm b/cpan/CPAN/lib/CPAN/FirstTim=
e.pm
-index 4416072..187f5c4 100644
+index 33054cd..7b0becf 100644
 --- a/cpan/CPAN/lib/CPAN/FirstTime.pm
 +++ b/cpan/CPAN/lib/CPAN/FirstTime.pm
-@@ -2045,11 +2045,34 @@ sub _print_urllist {
+@@ -2057,11 +2057,34 @@ sub _print_urllist {
      };
  }
 =20
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/cpan_definstalld=
irs.diff b/meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff
similarity index 89%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/cpan_definstalldi=
rs.diff
rename to meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff
index 77a2ee9..6b52950 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/cpan_definstalldirs.dif=
f
+++ b/meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff
@@ -1,4 +1,4 @@
-From 64c9ad40c26f051a275a8b963cc849ca0ddd3cbb Mon Sep 17 00:00:00 2001
+From 5ff1f21484aab68efe321ff4ba5d35928f72af96 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Provide a sensible INSTALLDIRS default for modules installed from
@@ -14,10 +14,10 @@ Patch-Name: debian/cpan_definstalldirs.diff
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/cpan/CPAN/lib/CPAN/FirstTime.pm b/cpan/CPAN/lib/CPAN/FirstTim=
e.pm
-index d1a8eef..4416072 100644
+index 918e009..33054cd 100644
 --- a/cpan/CPAN/lib/CPAN/FirstTime.pm
 +++ b/cpan/CPAN/lib/CPAN/FirstTime.pm
-@@ -1023,7 +1023,7 @@ sub init {
+@@ -1024,7 +1024,7 @@ sub init {
      my_prompt_loop(prefer_installer =3D> 'MB', $matcher, 'MB|EUMM|RAND');
 =20
      if (!$matcher or 'makepl_arg make_arg' =3D~ /$matcher/) {
@@ -26,7 +26,7 @@ index d1a8eef..4416072 100644
          my_dflt_prompt(make_arg =3D> "", $matcher);
          if ( $CPAN::Config->{makepl_arg} =3D~ /LIBS=3D|INC=3D/ ) {
              $CPAN::Frontend->mywarn(
-@@ -1055,7 +1055,7 @@ sub init {
+@@ -1056,7 +1056,7 @@ sub init {
      my_dflt_prompt(make_install_arg =3D> $CPAN::Config->{make_arg} || "",
                     $matcher);
 =20
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/db_file_ver.diff=
 b/meta/recipes-devtools/perl/perl/debian/db_file_ver.diff
similarity index 94%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/db_file_ver.diff
rename to meta/recipes-devtools/perl/perl/debian/db_file_ver.diff
index 9557560..280bf11 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/db_file_ver.diff
+++ b/meta/recipes-devtools/perl/perl/debian/db_file_ver.diff
@@ -1,4 +1,4 @@
-From 4da39e2ce6c5a510409c2da1c7b24e0e7ff87f31 Mon Sep 17 00:00:00 2001
+From 01421f8a80d5c623959695ba2b8167f30112d333 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: Remove overly restrictive DB_File version check.
diff --git a/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff=
 b/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff
new file mode 100644
index 0000000..601ee4c
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff
@@ -0,0 +1,56 @@
+From def4aa3817f98aae625e601b791ef068276f05d5 Mon Sep 17 00:00:00 2001
+From: Dominic Hargreaves <dom@earth.li>
+Date: Mon, 17 May 2010 13:23:07 +0300
+Subject: Point users to Debian packages of deprecated core modules
+
+Bug-Debian: http://bugs.debian.org/747628
+
+Several modules are being deprecated with perl 5.20.
+To get a clean transition, perl/perl-modules is going to recommend the
+separate Debian packages of these for one release cycle so that they will =
be
+pulled in by default on upgrades. This is taking place for perl 5.20/jessi=
e.
+
+However, on systems configured to ignore recommendations the deprecation
+warnings will still be useful, so modify them slightly to point to the
+separate packages instead.
+
+Patch-Name: debian/deprecate-with-apt.diff
+---
+ lib/deprecate.pm | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/lib/deprecate.pm b/lib/deprecate.pm
+index 47bc112..b0c61df 100644
+--- a/lib/deprecate.pm
++++ b/lib/deprecate.pm
+@@ -7,6 +7,13 @@ our $VERSION =3D 0.03;
+ our %Config;
+ unless (%Config) { require Config; *Config =3D \%Config::Config; }
+=20
++# Debian-specific change: recommend the separate Debian packages of
++# deprecated modules where available
++
++our %DEBIAN_PACKAGES =3D (
++    # None for the perl 5.22 cycle
++);
++
+ # This isn't a public API. It's internal to code maintained by the perl-p=
orters
+ # If you would like it to be a public API, please send a patch with
+ # documentation and tests. Until then, it may change without warning.
+@@ -58,9 +65,15 @@ EOM
+ 	if (defined $callers_bitmask
+ 	    && (vec($callers_bitmask, $warnings::Offsets{deprecated}, 1)
+ 		|| vec($callers_bitmask, $warnings::Offsets{all}, 1))) {
+-	    warn <<"EOM";
++		if (my $deb =3D $DEBIAN_PACKAGES{$package}) {
++		    warn <<"EOM";
++$package will be removed from the Perl core distribution in the next majo=
r release. Please install the separate $deb package. It is being used at $c=
all_file, line $call_line.
++EOM
++		} else {
++		    warn <<"EOM";
+ $package will be removed from the Perl core distribution in the next majo=
r release. Please install it from CPAN. It is being used at $call_file, lin=
e $call_line.
+ EOM
++		}
+ 	}
+     }
+ }
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/doc_info.diff b/=
meta/recipes-devtools/perl/perl/debian/doc_info.diff
similarity index 85%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/doc_info.diff
rename to meta/recipes-devtools/perl/perl/debian/doc_info.diff
index 7643759..fbea2ee 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/doc_info.diff
+++ b/meta/recipes-devtools/perl/perl/debian/doc_info.diff
@@ -1,4 +1,4 @@
-From 2f3e4b35da039600de403083b5a0c7391751d02e Mon Sep 17 00:00:00 2001
+From e18f81e69c55d698abd293e71063d6b6b275cc07 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
 Subject: Replace generic man(1) instructions with Debian-specific informat=
ion.
@@ -11,10 +11,10 @@ Patch-Name: debian/doc_info.diff
  1 file changed, 10 insertions(+), 2 deletions(-)
=20
 diff --git a/pod/perl.pod b/pod/perl.pod
-index 2e8d0d8..8810769 100644
+index 364e957..f97e103 100644
 --- a/pod/perl.pod
 +++ b/pod/perl.pod
-@@ -274,8 +274,16 @@ aux a2p c2ph h2ph h2xs perlbug pl2pm pod2html pod2man=
 s2p splain xsubpp
+@@ -291,8 +291,16 @@ aux c2ph h2ph h2xs perlbug pl2pm pod2html pod2man spl=
ain xsubpp
 =20
  =3Dfor buildtoc __END__
 =20
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/enc2xs_inc.diff =
b/meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff
similarity index 87%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/enc2xs_inc.diff
rename to meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff
index 4650b0b..e074b20 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/enc2xs_inc.diff
+++ b/meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff
@@ -1,4 +1,4 @@
-From 98e7248580af353d781b24715b42af5b6a4caf35 Mon Sep 17 00:00:00 2001
+From 7fe59a3d0601c6d8634eae4f99dae3024cd02a92 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Tweak enc2xs to follow symlinks and ignore missing @INC directori=
es.
@@ -17,10 +17,10 @@ Patch-Name: debian/enc2xs_inc.diff
  2 files changed, 7 insertions(+), 4 deletions(-)
=20
 diff --git a/cpan/Encode/bin/enc2xs b/cpan/Encode/bin/enc2xs
-index c44487d..a9af54f 100644
+index 19f2b2b..4d64e38 100644
 --- a/cpan/Encode/bin/enc2xs
 +++ b/cpan/Encode/bin/enc2xs
-@@ -929,11 +929,11 @@ use vars qw(
+@@ -944,11 +944,11 @@ use vars qw(
  sub find_e2x{
      eval { require File::Find; };
      my (@inc, %e2x_dir);
@@ -34,7 +34,7 @@ index c44487d..a9af54f 100644
           my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
               $atime,$mtime,$ctime,$blksize,$blocks)
               =3D lstat($_) or return;
-@@ -943,7 +943,7 @@ sub find_e2x{
+@@ -958,7 +958,7 @@ sub find_e2x{
               $e2x_dir{$File::Find::dir} ||=3D $mtime;
           }
           return;
@@ -43,7 +43,7 @@ index c44487d..a9af54f 100644
      warn join("\n", keys %e2x_dir), "\n";
      for my $d (sort {$e2x_dir{$a} <=3D> $e2x_dir{$b}} keys %e2x_dir){
      $_E2X =3D $d;
-@@ -1010,7 +1010,7 @@ sub make_configlocal_pm {
+@@ -1025,7 +1025,7 @@ sub make_configlocal_pm {
  	    $LocalMod{$enc} ||=3D $mod;
  	}
      };
@@ -53,10 +53,10 @@ index c44487d..a9af54f 100644
      for my $enc ( sort keys %LocalMod ) {
          $_ModLines .=3D
 diff --git a/t/porting/customized.t b/t/porting/customized.t
-index a769c58..6b9977f 100644
+index 45fcafb..3bd6adb 100644
 --- a/t/porting/customized.t
 +++ b/t/porting/customized.t
-@@ -99,8 +99,11 @@ foreach my $module ( sort keys %Modules ) {
+@@ -101,8 +101,11 @@ foreach my $module ( sort keys %Modules ) {
        print $data_fh join(' ', $module, $file, $id), "\n";
        next;
      }
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/errno_ver.diff b=
/meta/recipes-devtools/perl/perl/debian/errno_ver.diff
similarity index 87%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/errno_ver.diff
rename to meta/recipes-devtools/perl/perl/debian/errno_ver.diff
index d8885a7..bcb59c6 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/errno_ver.diff
+++ b/meta/recipes-devtools/perl/perl/debian/errno_ver.diff
@@ -1,4 +1,4 @@
-From 81255b67014bda2ec127e0856436acfa554a068c Mon Sep 17 00:00:00 2001
+From 827eee225897c35ec97194a5971bf4bfcf250748 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: Remove Errno version check due to upgrade problems with long-runn=
ing
@@ -16,10 +16,10 @@ Patch-Name: debian/errno_ver.diff
  1 file changed, 5 deletions(-)
=20
 diff --git a/ext/Errno/Errno_pm.PL b/ext/Errno/Errno_pm.PL
-index 55ad01a..e4a31ef 100644
+index c6bfa06..519e5c7 100644
 --- a/ext/Errno/Errno_pm.PL
 +++ b/ext/Errno/Errno_pm.PL
-@@ -277,13 +277,8 @@ sub write_errno_pm {
+@@ -278,13 +278,8 @@ sub write_errno_pm {
 =20
  package Errno;
  require Exporter;
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/extutils_set_lib=
perl_path.diff b/meta/recipes-devtools/perl/perl/debian/extutils_set_libper=
l_path.diff
similarity index 87%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/extutils_set_libp=
erl_path.diff
rename to meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_path.=
diff
index 53fd1f6..adb4bd9 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/extutils_set_libperl_pa=
th.diff
+++ b/meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_path.diff
@@ -1,4 +1,4 @@
-From 2870b992e4b5e8bb0b9c44c9aff81adaaf9de439 Mon Sep 17 00:00:00 2001
+From 431275078b0490d2e092442d9582be06bb95b354 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Sat, 10 May 2014 23:34:14 +0300
 Subject: EU:MM: set location of libperl.a under /usr/lib
@@ -13,10 +13,10 @@ Patch-Name: debian/extutils_set_libperl_path.diff
  2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 8b86a24..f977476 100644
+index 5f1b87f..570a631 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2462,7 +2462,7 @@ MAP_PRELIBS   =3D $Config{perllibs} $Config{cryptlib=
}
+@@ -2505,7 +2505,7 @@ MAP_PRELIBS   =3D $Config{perllibs} $Config{cryptlib=
}
  	($lperl =3D $libperl) =3D~ s/\$\(A\)/$self->{LIB_EXT}/;
      }
      unless ($libperl && -f $lperl) { # Ilya's code...
@@ -26,7 +26,7 @@ index 8b86a24..f977476 100644
  	$libperl ||=3D "libperl$self->{LIB_EXT}";
  	$libperl   =3D "$dir/$libperl";
 diff --git a/pp.c b/pp.c
-index 4ec6887..a44c137 100644
+index 42f156a..77c1279 100644
 --- a/pp.c
 +++ b/pp.c
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-devtools/perl/perl/debian/fakeroot.diff b/meta/re=
cipes-devtools/perl/perl/debian/fakeroot.diff
new file mode 100644
index 0000000..ec461cf
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fakeroot.diff
@@ -0,0 +1,42 @@
+From 27ae7b18078d801a2c943aa6de2f7e9808177251 Mon Sep 17 00:00:00 2001
+From: Brendan O'Dea <bod@debian.org>
+Date: Fri, 18 Mar 2005 22:22:25 +1100
+Subject: Postpone LD_LIBRARY_PATH evaluation to the binary targets.
+
+Modify the setting of LD_LIBRARY_PATH to append pre-existing values at the
+time the rule is evaluated rather than when the Makefile is created.
+
+This is required when building packages with dpkg-buildpackage and fakeroo=
t,
+since fakeroot (which now sets LD_LIBRARY_PATH) is not used for the "build=
"
+rule where the Makefile is created, but is for the clean/binary* targets.
+
+Patch-Name: debian/fakeroot.diff
+---
+ Makefile.SH | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.SH b/Makefile.SH
+index 034d812..04dd7d5 100755
+--- a/Makefile.SH
++++ b/Makefile.SH
+@@ -39,10 +39,7 @@ case "$useshrplib" in
+ true)
+ 	# Prefix all runs of 'miniperl' and 'perl' with
+ 	# $ldlibpth so that ./perl finds *this* shared libperl.
+-	case "$LD_LIBRARY_PATH" in
+-	'')  ldlibpth=3D"LD_LIBRARY_PATH=3D` quote "$pwd" `" ;;
+-	*)   ldlibpth=3D"LD_LIBRARY_PATH=3D` quote "$pwd" `:` quote "$LD_LIBRARY=
_PATH" `" ;;
+-	esac
++	ldlibpth=3D"LD_LIBRARY_PATH=3D` quote "$pwd" `"'$${LD_LIBRARY_PATH:+:}$$=
LD_LIBRARY_PATH'
+=20
+ 	pldlflags=3D"$cccdlflags"
+ 	static_ldflags=3D''
+@@ -113,7 +110,7 @@ true)
+ 	    ;;
+ 	esac
+ 	case "$ldlibpthname" in
+-	'') ;;
++	''|LD_LIBRARY_PATH) ;;
+ 	*)
+ 	    case "$osname" in
+ 	    os2)
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/find_html2text.d=
iff b/meta/recipes-devtools/perl/perl/debian/find_html2text.diff
similarity index 89%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/find_html2text.di=
ff
rename to meta/recipes-devtools/perl/perl/debian/find_html2text.diff
index c0e1949..d319e75 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/find_html2text.diff
+++ b/meta/recipes-devtools/perl/perl/debian/find_html2text.diff
@@ -1,4 +1,4 @@
-From 8deb14b24ee17694a2f23a78e8782b24c116daae Mon Sep 17 00:00:00 2001
+From c81dbdedff9e9b4fb75ac028aa718838c0292d2f Mon Sep 17 00:00:00 2001
 From: Andreas Marschke <andreas.marschke@googlemail.com>
 Date: Sat, 17 Sep 2011 11:38:42 +0100
 Subject: Configure CPAN::Distribution with correct name of html2text
@@ -21,10 +21,10 @@ functionality].
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/cpan/CPAN/lib/CPAN/Distribution.pm b/cpan/CPAN/lib/CPAN/Distr=
ibution.pm
-index 9a08707..332a627 100644
+index 092b781..5c2bae1 100644
 --- a/cpan/CPAN/lib/CPAN/Distribution.pm
 +++ b/cpan/CPAN/lib/CPAN/Distribution.pm
-@@ -4031,7 +4031,7 @@ sub _display_url {
+@@ -4099,7 +4099,7 @@ sub _display_url {
        if $CPAN::DEBUG;
 =20
      # should we define it in the config instead?
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/document_m=
akemaker_ccflags.diff b/meta/recipes-devtools/perl/perl/debian/fixes/docume=
nt_makemaker_ccflags.diff
similarity index 87%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/document_ma=
kemaker_ccflags.diff
rename to meta/recipes-devtools/perl/perl/debian/fixes/document_makemaker_c=
cflags.diff
index f4050c0..61a9271 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/document_makemake=
r_ccflags.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/document_makemaker_ccfla=
gs.diff
@@ -1,4 +1,4 @@
-From c7ffe0cc3105cb627fbbb7d0c7dbb53f1f236a17 Mon Sep 17 00:00:00 2001
+From 9faf6dcc3a5c4154484d812eb3cc3dd78b35563b Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Mon, 30 May 2011 22:54:24 +0300
 Subject: Document that CCFLAGS should include $Config{ccflags}
@@ -15,10 +15,10 @@ Patch-Name: fixes/document_makemaker_ccflags.diff
  1 file changed, 4 insertions(+)
=20
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm b/cpan/ExtU=
tils-MakeMaker/lib/ExtUtils/MakeMaker.pm
-index d2fabf6..fabb021 100644
+index fe95b27..90403e8 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
-@@ -1716,6 +1716,10 @@ currently used by MakeMaker but may be handy in Mak=
efile.PLs.
+@@ -1774,6 +1774,10 @@ currently used by MakeMaker but may be handy in Mak=
efile.PLs.
  String that will be included in the compiler call command line between
  the arguments INC and OPTIMIZE.
 =20
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/memoize_st=
orable_nstore.diff b/meta/recipes-devtools/perl/perl/debian/fixes/memoize_s=
torable_nstore.diff
similarity index 98%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/memoize_sto=
rable_nstore.diff
rename to meta/recipes-devtools/perl/perl/debian/fixes/memoize_storable_nst=
ore.diff
index b9d61c7..525f962 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/memoize_storable_=
nstore.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/memoize_storable_nstore.=
diff
@@ -1,4 +1,4 @@
-From 8b7b31d6b2368717514a05dc0e968c1357511733 Mon Sep 17 00:00:00 2001
+From 55d430eb02fc116581847304ca20321687978269 Mon Sep 17 00:00:00 2001
 From: Jonathan Nieder <jrnieder@gmail.com>
 Date: Fri, 27 Jul 2012 10:35:07 -0500
 Subject: Memoize::Storable: respect 'nstore' option not respected
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/net_smtp_d=
ocs.diff b/meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff
similarity index 58%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/net_smtp_do=
cs.diff
rename to meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff
index b7ccc57..3c31972 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/net_smtp_docs.dif=
f
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff
@@ -1,4 +1,4 @@
-From e2e1127a521d942bd9aea4c1290cdf46c15c35fd Mon Sep 17 00:00:00 2001
+From fa085fedd9c406edcd4a1a256c025d5ff7f6c6de Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Thu, 20 Sep 2007 19:47:14 +1000
 Subject: Document the Net::SMTP 'Port' option
@@ -8,14 +8,14 @@ Bug: http://rt.cpan.org/Public/Bug/Display.html?id=3D3603=
8
=20
 Patch-Name: fixes/net_smtp_docs.diff
 ---
- cpan/libnet/Net/SMTP.pm | 1 +
+ cpan/libnet/lib/Net/SMTP.pm | 1 +
  1 file changed, 1 insertion(+)
=20
-diff --git a/cpan/libnet/Net/SMTP.pm b/cpan/libnet/Net/SMTP.pm
-index 705b5c5..17c1d21 100644
---- a/cpan/libnet/Net/SMTP.pm
-+++ b/cpan/libnet/Net/SMTP.pm
-@@ -637,6 +637,7 @@ Net::SMTP will attempt to extract the address from the=
 value passed.
+diff --git a/cpan/libnet/lib/Net/SMTP.pm b/cpan/libnet/lib/Net/SMTP.pm
+index afd017a..6ae7d9e 100644
+--- a/cpan/libnet/lib/Net/SMTP.pm
++++ b/cpan/libnet/lib/Net/SMTP.pm
+@@ -738,6 +738,7 @@ Net::SMTP will attempt to extract the address from the=
 value passed.
 =20
  B<Debug> - Enable debugging information
 =20
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff b/m=
eta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff
new file mode 100644
index 0000000..b5564fd
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff
@@ -0,0 +1,73 @@
+From 0ecf83f259db09cb38cb37c9b22e72be185afa8f Mon Sep 17 00:00:00 2001
+From: Hugo van der Sanden <hv@crypt.org>
+Date: Thu, 11 Jun 2015 12:25:40 +0100
+Subject: fix -Cnn parsing
+
+Commit 22ff313068 for [perl #123814] inadvertently changed the logic when
+parsing a numeric parameter to the -C option, such that the successfully
+parsed number was not saved as the option value if it parsed to the end
+of the argument.
+
+Bug: https://rt.perl.org/Ticket/Display.html?id=3D125381
+Bug-Debian: https://bugs.debian.org/788636
+Origin: upstream, http://perl5.git.perl.org/perl.git/commit/89d84ff965
+Patch-Name: fixes/perl-Cnn.diff
+---
+ t/run/switchC.t |  7 ++++++-
+ util.c          | 17 ++++++++---------
+ 2 files changed, 14 insertions(+), 10 deletions(-)
+
+diff --git a/t/run/switchC.t b/t/run/switchC.t
+index f6aa868..4f63c3b 100644
+--- a/t/run/switchC.t
++++ b/t/run/switchC.t
+@@ -11,7 +11,7 @@ BEGIN {
+     skip_all_if_miniperl('-C and $ENV{PERL_UNICODE} are disabled on minip=
erl');
+ }
+=20
+-plan(tests =3D> 13);
++plan(tests =3D> 14);
+=20
+ my $r;
+=20
+@@ -25,6 +25,11 @@ $r =3D runperl( switches =3D> [ '-CO', '-w' ],
+               stderr   =3D> 1 );
+ like( $r, qr/^$b(?:\r?\n)?$/s, '-CO: no warning on UTF-8 output' );
+=20
++$r =3D runperl( switches =3D> [ '-C2', '-w' ],
++	      prog     =3D> 'print chr(256)',
++              stderr   =3D> 1 );
++like( $r, qr/^$b(?:\r?\n)?$/s, '-C2: no warning on UTF-8 output' );
++
+ SKIP: {
+     if (exists $ENV{PERL_UNICODE} &&
+ 	($ENV{PERL_UNICODE} eq "" || $ENV{PERL_UNICODE} =3D~ /[SO]/)) {
+diff --git a/util.c b/util.c
+index 8cf62f5..ee23314 100644
+--- a/util.c
++++ b/util.c
+@@ -4420,16 +4420,15 @@ Perl_parse_unicode_opts(pTHX_ const char **popt)
+        if (isDIGIT(*p)) {
+             const char* endptr;
+             UV uv;
+-            if (grok_atoUV(p, &uv, &endptr)
+-                && uv <=3D U32_MAX
+-                && (p =3D endptr)
+-                && *p && *p !=3D '\n' && *p !=3D '\r'
+-            ) {
++            if (grok_atoUV(p, &uv, &endptr) && uv <=3D U32_MAX) {
+                 opt =3D (U32)uv;
+-                if (isSPACE(*p))
+-                    goto the_end_of_the_opts_parser;
+-                else
+-                    Perl_croak(aTHX_ "Unknown Unicode option letter '%c'"=
, *p);
++                p =3D endptr;
++                if (p && *p && *p !=3D '\n' && *p !=3D '\r') {
++                    if (isSPACE(*p))
++                        goto the_end_of_the_opts_parser;
++                    else
++                        Perl_croak(aTHX_ "Unknown Unicode option letter '=
%c'", *p);
++                }
+             }
+         }
+         else {
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reproduci=
ble_date.diff b/meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reprod=
ucible_date.diff
new file mode 100644
index 0000000..7c9ca86
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reproducible_dat=
e.diff
@@ -0,0 +1,170 @@
+From 9057adc106d6bbef53c9e706523cd94f1a7a08d4 Mon Sep 17 00:00:00 2001
+From: Russ Allbery <rra@debian.org>
+Date: Sat, 30 Aug 2014 15:10:41 -0700
+Subject: Support POD_MAN_DATE in Pod::Man for the left-hand footer
+
+Honor the environment variable POD_MAN_DATE and use its contents, if
+set, as the value of the left-hand footer if the date option is not
+set, overriding the timestamp of the input file.  This is primarily
+useful to ensure reproducible builds of the same output file given the
+same souce and Pod::Man version, even when file timestamps may not be
+consistent.  Thanks, Niko Tyni.
+
+Bug-Debian: http://bugs.debian.org/759405
+Origin: upstream
+Patch-Name: fixes/pod_man_reproducible_date.diff
+---
+ cpan/podlators/lib/Pod/Man.pm  | 69 +++++++++++++++++++++++++++++++------=
-----
+ cpan/podlators/t/devise-date.t | 29 +++++++++++++-----
+ 2 files changed, 72 insertions(+), 26 deletions(-)
+
+diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.pm
+index 72ca9ff..0536662 100644
+--- a/cpan/podlators/lib/Pod/Man.pm
++++ b/cpan/podlators/lib/Pod/Man.pm
+@@ -876,25 +876,42 @@ sub devise_title {
+ }
+=20
+ # Determine the modification date and return that, properly formatted in =
ISO
+-# format.  If we can't get the modification date of the input, instead us=
e the
+-# current time.  Pod::Simple returns a completely unuseful stringified fi=
le
+-# handle as the source_filename for input from a file handle, so we have =
to
+-# deal with that as well.
++# format.
++#
++# If POD_MAN_DATE is set, that overrides anything else.  This can be used=
 for
++# reproducible generation of the same file even if the input file timesta=
mps
++# are unpredictable or the POD coms from standard input.
++#
++# Otherwise, use the modification date of the input if we can stat it.  B=
e
++# aware that Pod::Simple returns the stringification of the file handle a=
s
++# source_filename for input from a file handle, so we'll stat some random=
 ref
++# string in that case.  If that fails, instead use the current time.
++#
++# $self - Pod::Man object, used to get the source file
++#
++# Returns: YYYY-MM-DD date suitable for the left-hand footer
+ sub devise_date {
+     my ($self) =3D @_;
++
++    # If POD_MAN_DATE is set, always use it.
++    if ($ENV{POD_MAN_DATE}) {
++        return $ENV{POD_MAN_DATE};
++    }
++
++    # Otherwise, get the input filename and try to stat it.  If that fail=
s,
++    # use the current time.
+     my $input =3D $self->source_filename;
+     my $time;
+     if ($input) {
+-        $time =3D (stat $input)[9] || time;
++        $time =3D (stat($input))[9] || time();
+     } else {
+-        $time =3D time;
++        $time =3D time();
+     }
+=20
+-    # Can't use POSIX::strftime(), which uses Fcntl, because MakeMaker
+-    # uses this and it has to work in the core which can't load dynamic
+-    # libraries.
+-    my ($year, $month, $day) =3D (localtime $time)[5,4,3];
+-    return sprintf ("%04d-%02d-%02d", $year + 1900, $month + 1, $day);
++    # Can't use POSIX::strftime(), which uses Fcntl, because MakeMaker us=
es
++    # this and it has to work in the core which can't load dynamic librar=
ies.
++    my ($year, $month, $day) =3D (localtime($time))[5,4,3];
++    return sprintf("%04d-%02d-%02d", $year + 1900, $month + 1, $day);
+ }
+=20
+ # Print out the preamble and the title.  The meaning of the arguments to =
.TH
+@@ -1632,6 +1649,15 @@ argument.
+ Sets the centered page header to use instead of "User Contributed Perl
+ Documentation".
+=20
++=3Ditem date
++
++Sets the left-hand footer.  If this option is not set, the contents of th=
e
++environment variable POD_MAN_DATE, if set, will be used.  Failing that,
++the modification date of the input file will be used, or the current time
++if stat() can't find that file (which will be the case if the input is
++from C<STDIN>).  If obtained from the file modification date or the
++current time, he date will be formatted as C<YYYY-MM-DD>.
++
+ =3Ditem errors
+=20
+ How to report errors.  C<die> says to throw an exception on any POD
+@@ -1642,13 +1668,6 @@ POD errors entirely, as much as possible.
+=20
+ The default is C<pod>.
+=20
+-=3Ditem date
+-
+-Sets the left-hand footer.  By default, the modification date of the inpu=
t
+-file will be used, or the current date if stat() can't find that file (th=
e
+-case if the input is from C<STDIN>), and the date will be formatted as
+-C<YYYY-MM-DD>.
+-
+ =3Ditem fixed
+=20
+ The fixed-width font to use for verbatim text and code.  Defaults to
+@@ -1810,6 +1829,20 @@ option was set to C<die>.
+=20
+ =3Dback
+=20
++=3Dhead1 ENVIRONMENT
++
++=3Dover 4
++
++=3Ditem POD_MAN_DATE
++
++If set, this will be used as the value of the left-hand footer unless the
++C<date> option is explicitly set, overriding the timestamp of the input
++file or the current time.  This is primarily useful to ensure reproducibl=
e
++builds of the same output file given the same souce and Pod::Man version,
++even when file timestamps may not be consistent.
++
++=3Dback
++
+ =3Dhead1 BUGS
+=20
+ Encoding handling assumes that PerlIO is available and does not work
+diff --git a/cpan/podlators/t/devise-date.t b/cpan/podlators/t/devise-date=
.t
+index 3cce9f5..c610dd9 100644
+--- a/cpan/podlators/t/devise-date.t
++++ b/cpan/podlators/t/devise-date.t
+@@ -1,15 +1,28 @@
+-#!/usr/bin/perl -w
+-
+-# In order for MakeMaker to build in the core, nothing can use
+-# Fcntl which includes POSIX.  devise_date()'s use of strftime()
+-# was replaced.  This tests that it's identical.
++#!/usr/bin/perl
++#
++# In order for MakeMaker to build in the core, nothing can use Fcntl whic=
h
++# includes POSIX.  devise_date()'s use of strftime() was replaced.  This =
tests
++# that it's identical.  It also tests special handling of the POD_MAN_DAT=
E
++# environment variable.
+=20
++use 5.006;
+ use strict;
+-
+-use Test::More tests =3D> 1;
++use warnings;
+=20
+ use Pod::Man;
+ use POSIX qw(strftime);
+=20
++use Test::More tests =3D> 2;
++
++# Check that the results of device_date matches strftime.  There is no in=
put
++# file name, so this will use the current time.
+ my $parser =3D Pod::Man->new;
+-is $parser->devise_date, strftime("%Y-%m-%d", localtime);
++is(
++    $parser->devise_date,
++    strftime('%Y-%m-%d', localtime()),
++    'devise_date matches strftime'
++);
++
++# Set the override environment variable and ensure that it's honored.
++local $ENV{POD_MAN_DATE} =3D '2014-01-01';
++is($parser->devise_date, '2014-01-01', 'devise_date honors POD_MAN_DATE')=
;
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date=
.diff b/meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.diff
new file mode 100644
index 0000000..7ebbf9c
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.diff
@@ -0,0 +1,51 @@
+From 183bb4af7ad862a2cf31d0dcb3dd45c100f76776 Mon Sep 17 00:00:00 2001
+From: Russ Allbery <rra@cpan.org>
+Date: Wed, 15 Apr 2015 22:21:25 -0700
+Subject: Support an empty POD_MAN_DATE environment variable
+
+One may want to set this to an empty string.  Handle that correctly.
+
+(backported to Perl 5.20.2 by Niko Tyni <ntyni@debian.org>)
+
+Origin: upstream, http://git.eyrie.org/?p=3Dperl/podlators.git;a=3Dcommitd=
iff;h=3De0e9fcb53e8fc954b2b1955385eea18c27f869af
+Bug-Debian: https://bugs.debian.org/780259
+Patch-Name: fixes/podman-empty-date.diff
+---
+ cpan/podlators/lib/Pod/Man.pm  | 2 +-
+ cpan/podlators/t/devise-date.t | 6 +++++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.pm
+index 365892e..8997a15 100644
+--- a/cpan/podlators/lib/Pod/Man.pm
++++ b/cpan/podlators/lib/Pod/Man.pm
+@@ -894,7 +894,7 @@ sub devise_date {
+     my ($self) =3D @_;
+=20
+     # If POD_MAN_DATE is set, always use it.
+-    if ($ENV{POD_MAN_DATE}) {
++    if (defined($ENV{POD_MAN_DATE})) {
+         return $ENV{POD_MAN_DATE};
+     }
+=20
+diff --git a/cpan/podlators/t/devise-date.t b/cpan/podlators/t/devise-date=
.t
+index 9da9d1b..27271d9 100644
+--- a/cpan/podlators/t/devise-date.t
++++ b/cpan/podlators/t/devise-date.t
+@@ -12,7 +12,7 @@ use warnings;
+ use Pod::Man;
+ use POSIX qw(strftime);
+=20
+-use Test::More tests =3D> 2;
++use Test::More tests =3D> 3;
+=20
+ # Check that the results of device_date matches strftime.  There is no in=
put
+ # file name, so this will use the current time.
+@@ -26,3 +26,7 @@ is(
+ # Set the override environment variable and ensure that it's honored.
+ local $ENV{POD_MAN_DATE} =3D '2014-01-01';
+ is($parser->devise_date, '2014-01-01', 'devise_date honors POD_MAN_DATE')=
;
++
++# Check that an empty environment variable is honored.
++local $ENV{POD_MAN_DATE} =3D q{};
++is($parser->devise_date, q{}, 'devise_date honors empty POD_MAN_DATE');
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff =
b/meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff
new file mode 100644
index 0000000..1a60361
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff
@@ -0,0 +1,109 @@
+From 7671d101baa75d7a79bfbd8c75c1595fbb3f53ba Mon Sep 17 00:00:00 2001
+From: Russ Allbery <rra@cpan.org>
+Date: Sat, 7 Feb 2015 19:03:34 -0800
+Subject: Better errors for man pages from standard input
+
+[Pod::Man] Attempt to detect if the input came from a pipe and
+therefore has a completely unhelpful (and nonreproducible) source file
+name, and diagnose this as an error.  Document that the name option
+(--name to pod2man) is required when processing POD source from
+standard input.  (Debian Bug#777405)
+
+(backported to Perl 5.20.2 by Niko Tyni <ntyni@debian.org>)
+
+Origin: upstream, http://git.eyrie.org/?p=3Dperl/podlators.git;a=3Dcommitd=
iff;h=3Dd98872e46c93861b7aba14949e1258712087dc55
+Bug-Debian: https://bugs.debian.org/777405
+Patch-Name: fixes/podman-pipe.diff
+---
+ cpan/podlators/lib/Pod/Man.pm     | 15 +++++++++++++++
+ cpan/podlators/scripts/pod2man.PL |  4 ++++
+ cpan/podlators/t/devise-title.t   | 32 ++++++++++++++++++++++++++++++++
+ 3 files changed, 51 insertions(+)
+ create mode 100755 cpan/podlators/t/devise-title.t
+
+diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.pm
+index 8997a15..969eaff 100644
+--- a/cpan/podlators/lib/Pod/Man.pm
++++ b/cpan/podlators/lib/Pod/Man.pm
+@@ -828,6 +828,17 @@ sub devise_title {
+     $section =3D 3 if (!$$self{section} && $name =3D~ /\.pm\z/i);
+     $name =3D~ s/\.p(od|[lm])\z//i;
+=20
++    # If Pod::Parser gave us an IO::File reference as the source file nam=
e,
++    # convert that to the empty string as well.  Then, if we don't have a
++    # valid name, emit a warning and convert it to STDIN.
++    if ($name =3D~ /^IO::File(?:=3D\w+)\(0x[\da-f]+\)$/i) {
++        $name =3D '';
++    }
++    if ($name eq '') {
++        $self->whine (1, 'No name given for document');
++        $name =3D 'STDIN';
++    }
++
+     # If the section isn't 3, then the name defaults to just the basename=
 of
+     # the file.  Otherwise, assume we're dealing with a module.  We want =
to
+     # figure out the full module name from the path to the file, but we d=
on't
+@@ -1705,6 +1716,10 @@ module path.  If it is, a path like C<.../lib/Pod/M=
an.pm> is converted into
+ a name like C<Pod::Man>.  This option, if given, overrides any automatic
+ determination of the name.
+=20
++If generating a manual page from standard input, this option is required,
++since there's otherwise no way for Pod::Man to know what to use for the
++manual page name.
++
+ =3Ditem nourls
+=20
+ Normally, LZ<><> formatting codes with a URL but anchor text are formatte=
d
+diff --git a/cpan/podlators/scripts/pod2man.PL b/cpan/podlators/scripts/po=
d2man.PL
+index 38695f8..43e35df 100644
+--- a/cpan/podlators/scripts/pod2man.PL
++++ b/cpan/podlators/scripts/pod2man.PL
+@@ -236,6 +236,10 @@ Note that this option is probably not useful when con=
verting multiple POD
+ files at once.  The convention for Unix man pages for commands is for the
+ man page title to be in all-uppercase even if the command isn't.
+=20
++When converting POD source from standard input, this option is required,
++since there's otherwise no way to know what to use as the name of the
++manual page.
++
+ =3Ditem B<--nourls>
+=20
+ Normally, LZ<><> formatting codes with a URL but anchor text are formatte=
d
+diff --git a/cpan/podlators/t/devise-title.t b/cpan/podlators/t/devise-tit=
le.t
+new file mode 100755
+index 0000000..8639441
+--- /dev/null
++++ b/cpan/podlators/t/devise-title.t
+@@ -0,0 +1,32 @@
++#!/usr/bin/perl
++#
++# Tests for the automatic determination of the manual page title if not
++# specified via options to pod2man or the Pod::Man constructor.
++
++use 5.006;
++use strict;
++use warnings;
++
++use File::Spec;
++use IO::File;
++use Test::More tests =3D> 3;
++
++BEGIN {
++    use_ok('Pod::Man');
++}
++
++# Create a parser and set it up with an input source.  There isn't a way =
to do
++# this in Pod::Simple without actually parsing the document, so send the
++# output to a string that we'll ignore.
++my $path =3D File::Spec->catdir('t', 'data', 'basic.pod');
++my $handle =3D IO::File->new($path, 'r');
++my $parser =3D Pod::Man->new(errors =3D> 'pod');
++my $output;
++$parser->output_string(\$output);
++$parser->parse_file($handle);
++
++# Check the results of devise_title for this.  We should get back STDIN, =
and
++# we should have reported an error.
++my ($name, $section) =3D $parser->devise_title;
++is($name, 'STDIN', 'devise_title uses STDIN for file handle input');
++ok($parser->errors_seen, '...and errors were seen');
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.d=
iff b/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff
new file mode 100644
index 0000000..0cdfeff
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff
@@ -0,0 +1,86 @@
+From 6198856b5323d6204094293f01b890472618f182 Mon Sep 17 00:00:00 2001
+From: Russ Allbery <rra@cpan.org>
+Date: Wed, 15 Apr 2015 20:49:07 -0700
+Subject: Documentation and test suite updates for UTC fix
+
+Update the Pod::Man and pod2man documentation and the test suite
+for the new UTC-based default page footer, and add a Changes
+entry.
+
+(backported to Perl 5.20.2 by Niko Tyni <ntyni@debian.org>)
+
+Origin: upstream, http://git.eyrie.org/?p=3Dperl/podlators.git;a=3Dcommitd=
iff;h=3D52db93bf80e4a06f8497e4ebade0506b6ee0e70d
+Bug-Debian: https://bugs.debian.org/780259
+Patch-Name: fixes/podman-utc-docs.diff
+---
+ cpan/podlators/lib/Pod/Man.pm     |  6 +++++-
+ cpan/podlators/scripts/pod2man.PL | 11 ++++++-----
+ cpan/podlators/t/devise-date.t    |  2 +-
+ 3 files changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.pm
+index c3ba201..365892e 100644
+--- a/cpan/podlators/lib/Pod/Man.pm
++++ b/cpan/podlators/lib/Pod/Man.pm
+@@ -910,6 +910,8 @@ sub devise_date {
+=20
+     # Can't use POSIX::strftime(), which uses Fcntl, because MakeMaker us=
es
+     # this and it has to work in the core which can't load dynamic librar=
ies.
++    # Use gmtime instead of localtime so that the generated man page does=
 not
++    # depend on the local time zone setting and is more reproducible
+     my ($year, $month, $day) =3D (gmtime($time))[5,4,3];
+     return sprintf("%04d-%02d-%02d", $year + 1900, $month + 1, $day);
+ }
+@@ -1656,7 +1658,9 @@ environment variable POD_MAN_DATE, if set, will be u=
sed.  Failing that,
+ the modification date of the input file will be used, or the current time
+ if stat() can't find that file (which will be the case if the input is
+ from C<STDIN>).  If obtained from the file modification date or the
+-current time, he date will be formatted as C<YYYY-MM-DD>.
++current time, the date will be formatted as C<YYYY-MM-DD> and will be bas=
ed
++on UTC (so that the output will be reproducible regardless of local time
++zone).
+=20
+ =3Ditem errors
+=20
+diff --git a/cpan/podlators/scripts/pod2man.PL b/cpan/podlators/scripts/po=
d2man.PL
+index 6af3474..38695f8 100644
+--- a/cpan/podlators/scripts/pod2man.PL
++++ b/cpan/podlators/scripts/pod2man.PL
+@@ -174,9 +174,10 @@ Contributed Perl Documentation", but also see B<--off=
icial> below.
+=20
+ =3Ditem B<-d> I<string>, B<--date>=3DI<string>
+=20
+-Set the left-hand footer string to this value.  By default, the modificat=
ion
+-date of the input file will be used, or the current date if input comes f=
rom
+-C<STDIN>.
++Set the left-hand footer string to this value.  By default, the
++modification date of the input file will be used, or the current date if
++input comes from C<STDIN>, and will be based on UTC (so that the output
++will be reproducible regardless of local time zone).
+=20
+ =3Ditem B<-errors>=3DI<style>
+=20
+@@ -383,8 +384,8 @@ B<pod2man> by Larry Wall and Tom Christiansen.
+=20
+ =3Dhead1 COPYRIGHT AND LICENSE
+=20
+-Copyright 1999, 2000, 2001, 2004, 2006, 2008, 2010, 2012, 2013 Russ
+-Allbery <rra@stanford.edu>.
++Copyright 1999, 2000, 2001, 2004, 2006, 2008, 2010, 2012, 2013, 2014,
++2015 Russ Allbery <rra@cpan.org>.
+=20
+ This program is free software; you may redistribute it and/or modify it
+ under the same terms as Perl itself.
+diff --git a/cpan/podlators/t/devise-date.t b/cpan/podlators/t/devise-date=
.t
+index c610dd9..9da9d1b 100644
+--- a/cpan/podlators/t/devise-date.t
++++ b/cpan/podlators/t/devise-date.t
+@@ -19,7 +19,7 @@ use Test::More tests =3D> 2;
+ my $parser =3D Pod::Man->new;
+ is(
+     $parser->devise_date,
+-    strftime('%Y-%m-%d', localtime()),
++    strftime('%Y-%m-%d', gmtime()),
+     'devise_date matches strftime'
+ );
+=20
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff b=
/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff
new file mode 100644
index 0000000..fbd7b9d
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff
@@ -0,0 +1,33 @@
+From c796775cdbd2cce06acbb7ac355187d4063017a2 Mon Sep 17 00:00:00 2001
+From: Chris Lamb <lamby@debian.org>
+Date: Wed, 15 Apr 2015 20:42:53 -0700
+Subject: Make the embedded date from Pod::Man reproducible
+
+While working on the "reproducible builds" effort, we have noticed
+that Pod::Man generates output that varies depending on the current
+timezone.
+
+The attached patch fixes this by using GMT (~UTC) dates instead.
+
+(backported to Perl 5.20.2 by Niko Tyni <ntyni@debian.org>)
+
+Origin: upstream, http://git.eyrie.org/?p=3Dperl/podlators.git;a=3Dcommitd=
iff;h=3D913fbb2bd2ce071e20128629302ae2852554cad4
+Bug-Debian: https://bugs.debian.org/780259
+Patch-Name: fixes/podman-utc.diff
+---
+ cpan/podlators/lib/Pod/Man.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.pm
+index 0536662..c3ba201 100644
+--- a/cpan/podlators/lib/Pod/Man.pm
++++ b/cpan/podlators/lib/Pod/Man.pm
+@@ -910,7 +910,7 @@ sub devise_date {
+=20
+     # Can't use POSIX::strftime(), which uses Fcntl, because MakeMaker us=
es
+     # this and it has to work in the core which can't load dynamic librar=
ies.
+-    my ($year, $month, $day) =3D (localtime($time))[5,4,3];
++    my ($year, $month, $day) =3D (gmtime($time))[5,4,3];
+     return sprintf("%04d-%02d-%02d", $year + 1900, $month + 1, $day);
+ }
+=20
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/respect_um=
ask.diff b/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
similarity index 64%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/respect_uma=
sk.diff
rename to meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
index e5f116a..d1b498b 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/respect_umask.dif=
f
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
@@ -1,4 +1,4 @@
-From f290a5ebd91e89d63b2a1958420f53e22d20c4ee Mon Sep 17 00:00:00 2001
+From d9d535ef97f57af6e9728075944c33f3b0b5372f Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Respect umask during installation
@@ -8,79 +8,15 @@ site directories.
=20
 Patch-Name: fixes/respect_umask.diff
 ---
+ cpan/ExtUtils-Install/lib/ExtUtils/Install.pm   | 18 +++++++++---------
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 18 +++++++++---------
- dist/ExtUtils-Install/lib/ExtUtils/Install.pm   | 18 +++++++++---------
  2 files changed, 18 insertions(+), 18 deletions(-)
=20
-diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 4140432..8fdb67c 100644
---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2075,7 +2075,7 @@ doc__install : doc_site_install
- 	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=3Ds=
ite
-=20
- pure_perl_install :: all
--	$(NOECHO) $(MOD_INSTALL) \
-+	$(NOECHO) umask 022; $(MOD_INSTALL) \
- };
-=20
-     push @m,
-@@ -2095,7 +2095,7 @@ q{		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
-=20
-=20
- pure_site_install :: all
--	$(NOECHO) $(MOD_INSTALL) \
-+	$(NOECHO) umask 022; $(MOD_INSTALL) \
- };
-     push @m,
- q{		read }.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist=
').q{ \
-@@ -2113,7 +2113,7 @@ q{		$(INST_LIB) $(DESTINSTALLSITELIB) \
- 		}.$self->catdir('$(PERL_ARCHLIB)','auto','$(FULLEXT)').q{
-=20
- pure_vendor_install :: all
--	$(NOECHO) $(MOD_INSTALL) \
-+	$(NOECHO) umask 022; $(MOD_INSTALL) \
- };
-     push @m,
- q{		read }.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packli=
st').q{ \
-@@ -2145,8 +2145,8 @@ doc_vendor_install :: all
-     push @m, q{
- doc_perl_install :: all
- 	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
--	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
--	-$(NOECHO) $(DOC_INSTALL) \
-+	-$(NOECHO) umask 022; $(MKPATH) $(DESTINSTALLARCHLIB)
-+	-$(NOECHO) umask 022; $(DOC_INSTALL) \
- 		"Module" "$(NAME)" \
- 		"installed into" "$(INSTALLPRIVLIB)" \
- 		LINKTYPE "$(LINKTYPE)" \
-@@ -2156,8 +2156,8 @@ doc_perl_install :: all
-=20
- doc_site_install :: all
- 	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
--	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
--	-$(NOECHO) $(DOC_INSTALL) \
-+	-$(NOECHO) umask 022; $(MKPATH) $(DESTINSTALLARCHLIB)
-+	-$(NOECHO) umask 022; $(DOC_INSTALL) \
- 		"Module" "$(NAME)" \
- 		"installed into" "$(INSTALLSITELIB)" \
- 		LINKTYPE "$(LINKTYPE)" \
-@@ -2167,8 +2167,8 @@ doc_site_install :: all
-=20
- doc_vendor_install :: all
- 	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
--	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
--	-$(NOECHO) $(DOC_INSTALL) \
-+	-$(NOECHO) umask 022; $(MKPATH) $(DESTINSTALLARCHLIB)
-+	-$(NOECHO) umask 022; $(DOC_INSTALL) \
- 		"Module" "$(NAME)" \
- 		"installed into" "$(INSTALLVENDORLIB)" \
- 		LINKTYPE "$(LINKTYPE)" \
-diff --git a/dist/ExtUtils-Install/lib/ExtUtils/Install.pm b/dist/ExtUtils=
-Install/lib/ExtUtils/Install.pm
-index eec57aa..06cc530 100644
---- a/dist/ExtUtils-Install/lib/ExtUtils/Install.pm
-+++ b/dist/ExtUtils-Install/lib/ExtUtils/Install.pm
-@@ -450,7 +450,7 @@ sub _can_write_dir {
+diff --git a/cpan/ExtUtils-Install/lib/ExtUtils/Install.pm b/cpan/ExtUtils=
-Install/lib/ExtUtils/Install.pm
+index 1e8ac4c..3e79121 100644
+--- a/cpan/ExtUtils-Install/lib/ExtUtils/Install.pm
++++ b/cpan/ExtUtils-Install/lib/ExtUtils/Install.pm
+@@ -451,7 +451,7 @@ sub _can_write_dir {
 =20
  =3Dpod
 =20
@@ -89,7 +25,7 @@ index eec57aa..06cc530 100644
 =20
  Wrapper around File::Path::mkpath() to handle errors.
 =20
-@@ -467,13 +467,13 @@ writable.
+@@ -468,13 +468,13 @@ writable.
  =3Dcut
 =20
  sub _mkpath {
@@ -106,7 +42,7 @@ index eec57aa..06cc530 100644
              _choke("Can't create '$dir'","$@");
          }
 =20
-@@ -782,7 +782,7 @@ sub install { #XXX OS-SPECIFIC
+@@ -783,7 +783,7 @@ sub install { #XXX OS-SPECIFIC
          _chdir($cwd);
      }
      foreach my $targetdir (sort keys %check_dirs) {
@@ -115,7 +51,7 @@ index eec57aa..06cc530 100644
      }
      foreach my $found (@found_files) {
          my ($diff, $ffd, $origfile, $mode, $size, $atime, $mtime,
-@@ -796,7 +796,7 @@ sub install { #XXX OS-SPECIFIC
+@@ -797,7 +797,7 @@ sub install { #XXX OS-SPECIFIC
                      $targetfile=3D _unlink_or_rename( $targetfile, 'tryha=
rd', 'install' )
                          unless $dry_run;
                  } elsif ( ! -d $targetdir ) {
@@ -124,7 +60,7 @@ index eec57aa..06cc530 100644
                  }
                  print "Installing $targetfile\n";
 =20
-@@ -836,7 +836,7 @@ sub install { #XXX OS-SPECIFIC
+@@ -837,7 +837,7 @@ sub install { #XXX OS-SPECIFIC
 =20
      if ($pack{'write'}) {
          $dir =3D install_rooted_dir(dirname($pack{'write'}));
@@ -133,7 +69,7 @@ index eec57aa..06cc530 100644
          print "Writing $pack{'write'}\n" if $verbose;
          $packlist->write(install_rooted_file($pack{'write'})) unless $dry=
_run;
      }
-@@ -1176,7 +1176,7 @@ be prepended as a directory to each installed file (=
and directory).
+@@ -1180,7 +1180,7 @@ environment variable will silence this output.
  sub pm_to_blib {
      my($fromto,$autodir,$pm_filter) =3D @_;
 =20
@@ -141,8 +77,8 @@ index eec57aa..06cc530 100644
 +    _mkpath($autodir,0);
      while(my($from, $to) =3D each %$fromto) {
          if( -f $to && -s $from =3D=3D -s $to && -M $to < -M $from ) {
-             print "Skip $to (unchanged)\n";
-@@ -1199,7 +1199,7 @@ sub pm_to_blib {
+             print "Skip $to (unchanged)\n" unless $INSTALL_QUIET;
+@@ -1203,7 +1203,7 @@ sub pm_to_blib {
              # we wont try hard here. its too likely to mess things up.
              forceunlink($to);
          } else {
@@ -151,3 +87,67 @@ index eec57aa..06cc530 100644
          }
          if ($need_filtering) {
              run_filter($pm_filter, $from, $to);
+diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
+index f63145c..197f102 100644
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+@@ -2118,7 +2118,7 @@ doc__install : doc_site_install
+ 	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=3Ds=
ite
+=20
+ pure_perl_install :: all
+-	$(NOECHO) $(MOD_INSTALL) \
++	$(NOECHO) umask 022; $(MOD_INSTALL) \
+ };
+=20
+     push @m,
+@@ -2138,7 +2138,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
+=20
+=20
+ pure_site_install :: all
+-	$(NOECHO) $(MOD_INSTALL) \
++	$(NOECHO) umask 022; $(MOD_INSTALL) \
+ };
+     push @m,
+ q{		read "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlis=
t').q{" \
+@@ -2156,7 +2156,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
+ 		"}.$self->catdir('$(PERL_ARCHLIB)','auto','$(FULLEXT)').q{"
+=20
+ pure_vendor_install :: all
+-	$(NOECHO) $(MOD_INSTALL) \
++	$(NOECHO) umask 022; $(MOD_INSTALL) \
+ };
+     push @m,
+ q{		read "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packl=
ist').q{" \
+@@ -2188,8 +2188,8 @@ doc_vendor_install :: all
+     push @m, q{
+ doc_perl_install :: all
+ 	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/=
perllocal.pod"
+-	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
+-	-$(NOECHO) $(DOC_INSTALL) \
++	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
++	-$(NOECHO) umask 022; $(DOC_INSTALL) \
+ 		"Module" "$(NAME)" \
+ 		"installed into" $(INSTALLPRIVLIB) \
+ 		LINKTYPE "$(LINKTYPE)" \
+@@ -2199,8 +2199,8 @@ doc_perl_install :: all
+=20
+ doc_site_install :: all
+ 	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/=
perllocal.pod"
+-	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
+-	-$(NOECHO) $(DOC_INSTALL) \
++	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
++	-$(NOECHO) umask 022; $(DOC_INSTALL) \
+ 		"Module" "$(NAME)" \
+ 		"installed into" $(INSTALLSITELIB) \
+ 		LINKTYPE "$(LINKTYPE)" \
+@@ -2210,8 +2210,8 @@ doc_site_install :: all
+=20
+ doc_vendor_install :: all
+ 	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/=
perllocal.pod"
+-	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
+-	-$(NOECHO) $(DOC_INSTALL) \
++	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
++	-$(NOECHO) umask 022; $(DOC_INSTALL) \
+ 		"Module" "$(NAME)" \
+ 		"installed into" $(INSTALLVENDORLIB) \
+ 		LINKTYPE "$(LINKTYPE)" \
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/instmodsh_doc.di=
ff b/meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff
similarity index 93%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/instmodsh_doc.dif=
f
rename to meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff
index 569acb8..a62c746 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/instmodsh_doc.diff
+++ b/meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff
@@ -1,4 +1,4 @@
-From 035ae97a9c2bf8ed73031e8879a0f860797544c1 Mon Sep 17 00:00:00 2001
+From 26209b55201a1b2d25252ac3b425bc49081299de Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Debian policy doesn't install .packlist files for core or vendor.
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/ld_run_path.diff=
 b/meta/recipes-devtools/perl/perl/debian/ld_run_path.diff
similarity index 84%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/ld_run_path.diff
rename to meta/recipes-devtools/perl/perl/debian/ld_run_path.diff
index fa0039f..d80f86c 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/ld_run_path.diff
+++ b/meta/recipes-devtools/perl/perl/debian/ld_run_path.diff
@@ -1,4 +1,4 @@
-From c089c8eb475a2018e8028e23b07defb5789a5633 Mon Sep 17 00:00:00 2001
+From 53ce69085918232a1b7e26e7762c1b2f70b1eb4a Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
 Subject: Remove standard libs from LD_RUN_PATH as per Debian policy.
@@ -9,7 +9,7 @@ Patch-Name: debian/ld_run_path.diff
  1 file changed, 3 insertions(+)
=20
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm b/cpan/Ex=
tUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
-index e39c8b2..0b933ce 100644
+index 37bcfd4..bd66e65 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
 @@ -56,6 +56,9 @@ sub _unix_os2_ext {
@@ -20,5 +20,5 @@ index e39c8b2..0b933ce 100644
 +    $ld_run_path_seen{$_}++ for @libpath;
 +
      foreach my $thislib ( split ' ', $potential_libs ) {
+         my ( $custom_name ) =3D '';
 =20
-         # Handle possible linker path arguments.
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/libnet_config_pa=
th.diff b/meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff
similarity index 74%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/libnet_config_pat=
h.diff
rename to meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff
index 0a11cd7..54ef964 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/libnet_config_path.diff
+++ b/meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff
@@ -1,4 +1,4 @@
-From 54e202518f081aa42d5ff733d56c4d42395bcba4 Mon Sep 17 00:00:00 2001
+From a7f6d453e60256d329469a75b642cca854cebea1 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Set location of libnet.cfg to /etc/perl/Net as /usr may not be
@@ -6,16 +6,16 @@ Subject: Set location of libnet.cfg to /etc/perl/Net as /=
usr may not be
=20
 Patch-Name: debian/libnet_config_path.diff
 ---
- cpan/libnet/Net/Config.pm | 7 +++----
+ cpan/libnet/lib/Net/Config.pm | 7 +++----
  1 file changed, 3 insertions(+), 4 deletions(-)
=20
-diff --git a/cpan/libnet/Net/Config.pm b/cpan/libnet/Net/Config.pm
-index ba16332..4b1ea19 100644
---- a/cpan/libnet/Net/Config.pm
-+++ b/cpan/libnet/Net/Config.pm
-@@ -57,9 +57,8 @@ my %nc =3D (
- }
+diff --git a/cpan/libnet/lib/Net/Config.pm b/cpan/libnet/lib/Net/Config.pm
+index 953a826..61ba12a 100644
+--- a/cpan/libnet/lib/Net/Config.pm
++++ b/cpan/libnet/lib/Net/Config.pm
+@@ -68,9 +68,8 @@ my %nc =3D (
  TRY_INTERNET_CONFIG
+ }
 =20
 -my $file =3D __FILE__;
 +my $file =3D '/etc/perl/Net/libnet.cfg';
@@ -24,7 +24,7 @@ index ba16332..4b1ea19 100644
  if (-f $file) {
    $ref =3D eval { local $SIG{__DIE__}; do $file };
    if (ref($ref) eq 'HASH') {
-@@ -132,8 +131,8 @@ Net::Config - Local configuration data for libnet
+@@ -142,8 +141,8 @@ Net::Config - Local configuration data for libnet
  C<Net::Config> holds configuration data for the modules in the libnet
  distribution. During installation you will be asked for these values.
 =20
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/libperl_embed_do=
c.diff b/meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff
similarity index 92%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/libperl_embed_doc=
.diff
rename to meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff
index 7b9bd75..76b8054 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/libperl_embed_doc.diff
+++ b/meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff
@@ -1,4 +1,4 @@
-From 967a87e268bd348423f72dec993eda444ce9f53d Mon Sep 17 00:00:00 2001
+From fb8bdbb4bf56382de099e62c2564286b9dfda46d Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Note that libperl-dev package is required for embedded linking
diff --git a/meta/recipes-devtools/perl/perl/debian/locale-robustness.diff =
b/meta/recipes-devtools/perl/perl/debian/locale-robustness.diff
new file mode 100644
index 0000000..fd471ed
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/locale-robustness.diff
@@ -0,0 +1,52 @@
+From 289eaf87f8de4d9ebfd661d4e4299c2952435243 Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Fri, 10 Apr 2015 10:19:51 +0300
+Subject: Make t/run/locale.t survive missing locales masked by LC_ALL
+
+If LC_ALL is set to a valid locale but another LC_* setting like LC_CTYPE
+isn't, t/run/locale.t would fail because it explicitly unsets LC_ALL,
+unmasking the problem underneath. All the other tests survive such
+a scenario.
+
+While this is clearly an error in the build environment, it's easy to make
+the test more robust by first clearing all the locale relevant variables.
+
+Bug: https://rt.perl.org/Ticket/Display.html?id=3D124310
+Bug-Debian: https://bugs.debian.org/782068
+Patch-Name: debian/locale-robustness.diff
+---
+ t/run/locale.t | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/t/run/locale.t b/t/run/locale.t
+index bd1a034..2105339 100644
+--- a/t/run/locale.t
++++ b/t/run/locale.t
+@@ -27,6 +27,9 @@ my @locales =3D eval { find_locales( [ &LC_ALL, &LC_CTYP=
E, &LC_NUMERIC ],
+                                  ) };
+ skip_all("no locales available") unless @locales;
+=20
++# reset the locale environment
++local @ENV{'LANG', (grep /^LC_/, keys %ENV)};
++
+ plan tests =3D> &last;
+=20
+ my $non_C_locale;
+@@ -58,9 +61,6 @@ EOF
+ SKIP: {
+     skip("Windows stores locale defaults in the registry", 1 )
+                                                             if $^O eq 'MS=
Win32';
+-    local $ENV{LC_NUMERIC}; # So not taken as a default
+-    local $ENV{LC_ALL}; # so it never overrides LC_NUMERIC
+-    local $ENV{LANG};   # So not taken as a default
+     fresh_perl_is("for (qw(@locales)) {\n" . <<'EOF',
+         use POSIX qw(locale_h);
+         use locale;
+@@ -348,7 +348,6 @@ EOF
+=20
+     {
+ 	local $ENV{LC_NUMERIC} =3D $different;
+-	local $ENV{LC_ALL}; # so it never overrides LC_NUMERIC
+ 	fresh_perl_is(<<"EOF",
+ 	    use POSIX qw(locale_h);
+=20
diff --git a/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff =
b/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff
new file mode 100644
index 0000000..fa0f9da
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff
@@ -0,0 +1,30 @@
+From 593dd52f535b1f439dfd0afe52211ae8960e980a Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Sun, 24 Aug 2014 12:56:11 -0700
+Subject: Pass LD settings through to subdirectories
+
+[rt.cpan.org #28632] fixed most issues with passing LD down to
+subdirectory Makefile.PL files. However, there are some distributions
+(including Wx, Par::Packer, and Verilog-Perl) that explicitly set
+LD. Those still can't be overridden from the command line. Adding LD to
+the PASTHRU list fixes this.
+
+Bug-Debian: https://bugs.debian.org/758471
+Patch-Name: debian/makemaker-pasthru.diff
+---
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
+index 4a8e14c..548d98e 100644
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+@@ -2793,7 +2793,7 @@ sub pasthru {
+     my($sep) =3D $Is{VMS} ? ',' : '';
+     $sep .=3D "\\\n\t";
+=20
+-    foreach my $key (qw(LIB LIBPERL_A LINKTYPE OPTIMIZE
++    foreach my $key (qw(LIB LIBPERL_A LINKTYPE OPTIMIZE LD
+                      PREFIX INSTALL_BASE)
+                  )
+     {
diff --git a/meta/recipes-devtools/perl/perl/debian/makemaker_customized.di=
ff b/meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff
new file mode 100644
index 0000000..b1b4cb9
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff
@@ -0,0 +1,42 @@
+From 634449066a9c810e81506425d2ca925b2fd72ab2 Mon Sep 17 00:00:00 2001
+From: Dominic Hargreaves <dom@earth.li>
+Date: Sat, 23 May 2015 21:15:06 +0200
+Subject: Update t/porting/customized.dat for files patched in Debian
+
+Patch-Name: debian/makemaker_customized.diff
+---
+ t/porting/customized.dat | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/t/porting/customized.dat b/t/porting/customized.dat
+index 7df398d..f857bd2 100644
+--- a/t/porting/customized.dat
++++ b/t/porting/customized.dat
+@@ -1,7 +1,7 @@
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command/MM.pm 7f=
4dfd0fe884bd42412bcf04ca80ef97b39c1d54
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist.pm bef09=
9988b15fb0b2a1f5ac48c01af1f7f36d329
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm 8=
168e18f0e3ce3ece4bb7e7c72d57ec07c67c402
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 711=
5e97a53559cb3ec061dd6f7f344e522724c4a
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm 3=
493ae6f93264e967f58dedaa3dbf3dbcb249853
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 3d7=
abd674b15ed323f743594ef0bd09db76b1aee
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Config=
.pm f8db8d4245bf0684b8210c811f50d7cfb1a27d78
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/FAQ.po=
d 757bffb47857521311f8f3bde43ebe165f8d5191
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Locale=
.pm 82be06851deb84c6419ad003ce9b6d1957f395f3
+@@ -13,7 +13,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils=
/Mkbootstrap.pm 58872d66
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mksymlists.pm ab=
80029ab16d38d4f2e41dc88d2ceb9f3790e477
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM.pm 453e0abbc4=
bb38db4c0820ad5c4846f313b66291
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_AIX.pm c1b1ba=
bda8f43ae7a2caba1cb4f70f92af5a0e34
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 6f90d9=
4ad3e7aa0045a3b1a10a1bb18391f89f57
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 21bde5=
3290bf1a4da4457290b65bd1b0ca6f1d16
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_BeOS.pm cab2b=
3ce08b71a4ce89aa630f236eb08b852439d
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Cygwin.pm 61f=
ced0faf518bf87c265fcb51ed330ba354623f
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Darwin.pm ae0=
ef51a7b6dd0b05aa61c779df7167dda5f5119
+@@ -22,7 +22,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils=
/MM_MacOS.pm 0544301f712
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_NW5.pm 433135=
eecb85b4b1d90d3027432f329436c78447
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_OS2.pm 1fbb56=
05bfb47feee4083feba8aa85e659628f70
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_QNX.pm 5b66d1=
f485a6034d96fc24ba1665b1bad9e447f1
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 8cef9=
9a9bd370ecfd07ddb0efbdcbb4101255e45
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm c455c=
915fb7dc3eeb1200ed1cd19048e6f21e6b1
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_UWIN.pm 93957=
2fde3d59ba77c2e677fe2df2bed4bed5898
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VMS.pm 09c204=
9bfd25b735e2a5bcf56a6cff7b4827f9c8
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VOS.pm d65d63=
f8217a55c36f62e249814988974f593c79
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/mod_paths.diff b=
/meta/recipes-devtools/perl/perl/debian/mod_paths.diff
similarity index 93%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/mod_paths.diff
rename to meta/recipes-devtools/perl/perl/debian/mod_paths.diff
index 49805a0..ae15907 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/mod_paths.diff
+++ b/meta/recipes-devtools/perl/perl/debian/mod_paths.diff
@@ -1,4 +1,4 @@
-From f994a741e51287494ed62b10738be6856aadce71 Mon Sep 17 00:00:00 2001
+From 6c6cf14e204f3c031372bfd9604ad524d5691186 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
 Subject: Tweak @INC ordering for Debian
@@ -22,10 +22,10 @@ Patch-Name: debian/mod_paths.diff
  1 file changed, 58 insertions(+)
=20
 diff --git a/perl.c b/perl.c
-index 27d0d9e..1fe2f1c 100644
+index 086645b..e64f1f4 100644
 --- a/perl.c
 +++ b/perl.c
-@@ -4367,6 +4367,11 @@ S_init_perllib(pTHX)
+@@ -4373,6 +4373,11 @@ S_init_perllib(pTHX)
  		      INCPUSH_ADD_SUB_DIRS|INCPUSH_CAN_RELOCATE);
  #endif
 =20
@@ -37,7 +37,7 @@ index 27d0d9e..1fe2f1c 100644
  #ifdef SITEARCH_EXP
      /* sitearch is always relative to sitelib on Windows for
       * DLL-based path intuition to work correctly */
-@@ -4484,6 +4489,59 @@ S_init_perllib(pTHX)
+@@ -4490,6 +4495,59 @@ S_init_perllib(pTHX)
  		      INCPUSH_ADD_OLD_VERS|INCPUSH_CAN_RELOCATE);
  #endif
 =20
diff --git a/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.d=
iff b/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
new file mode 100644
index 0000000..b911fd2
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
@@ -0,0 +1,92 @@
+From 240f2f4aeb3850bc0c5370b9fbc3909573bed9b3 Mon Sep 17 00:00:00 2001
+From: Brendan O'Dea <bod@debian.org>
+Date: Tue, 8 Mar 2005 19:30:38 +1100
+Subject: Don't install .packlist or perllocal.pod for perl or vendor
+
+Patch-Name: debian/no_packlist_perllocal.diff
+---
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 35 +++-----------------=
-----
+ 1 file changed, 3 insertions(+), 32 deletions(-)
+
+diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
+index 570a631..391dc22 100644
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+@@ -2122,11 +2122,6 @@ pure_perl_install :: all
+ };
+=20
+     push @m,
+-q{		read "}.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packli=
st').q{" \
+-		write "}.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$(FULLEXT)','.p=
acklist').q{" \
+-} unless $self->{NO_PACKLIST};
+-
+-    push @m,
+ q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
+ 		"$(INST_ARCHLIB)" "$(DESTINSTALLARCHLIB)" \
+ 		"$(INST_BIN)" "$(DESTINSTALLBIN)" \
+@@ -2158,10 +2153,6 @@ q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
+ pure_vendor_install :: all
+ 	$(NOECHO) umask 022; $(MOD_INSTALL) \
+ };
+-    push @m,
+-q{		read "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packl=
ist').q{" \
+-		write "}.$self->catfile('$(DESTINSTALLVENDORARCH)','auto','$(FULLEXT)',=
'.packlist').q{" \
+-} unless $self->{NO_PACKLIST};
+=20
+     push @m,
+ q{		"$(INST_LIB)" "$(DESTINSTALLVENDORLIB)" \
+@@ -2187,37 +2178,19 @@ doc_vendor_install :: all
+=20
+     push @m, q{
+ doc_perl_install :: all
+-	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/=
perllocal.pod"
+-	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
+-	-$(NOECHO) umask 022; $(DOC_INSTALL) \
+-		"Module" "$(NAME)" \
+-		"installed into" $(INSTALLPRIVLIB) \
+-		LINKTYPE "$(LINKTYPE)" \
+-		VERSION "$(VERSION)" \
+-		EXE_FILES "$(EXE_FILES)" \
+-		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
+=20
+ doc_site_install :: all
+-	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/=
perllocal.pod"
+-	-$(NOECHO) umask 02; $(MKPATH) "$(DESTINSTALLARCHLIB)"
++	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLSITEARCH)=
/perllocal.pod"
++	-$(NOECHO) umask 02; $(MKPATH) "$(DESTINSTALLSITEARCH)"
+ 	-$(NOECHO) umask 02; $(DOC_INSTALL) \
+ 		"Module" "$(NAME)" \
+ 		"installed into" $(INSTALLSITELIB) \
+ 		LINKTYPE "$(LINKTYPE)" \
+ 		VERSION "$(VERSION)" \
+ 		EXE_FILES "$(EXE_FILES)" \
+-		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
++		>> "}.$self->catfile('$(DESTINSTALLSITEARCH)','perllocal.pod').q{"
+=20
+ doc_vendor_install :: all
+-	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/=
perllocal.pod"
+-	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
+-	-$(NOECHO) umask 022; $(DOC_INSTALL) \
+-		"Module" "$(NAME)" \
+-		"installed into" $(INSTALLVENDORLIB) \
+-		LINKTYPE "$(LINKTYPE)" \
+-		VERSION "$(VERSION)" \
+-		EXE_FILES "$(EXE_FILES)" \
+-		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
+=20
+ } unless $self->{NO_PERLLOCAL};
+=20
+@@ -2226,13 +2199,11 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
+ 	$(NOECHO) $(NOOP)
+=20
+ uninstall_from_perldirs ::
+-	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(PERL_ARCHLIB)','auto','$(FUL=
LEXT)','.packlist').q{"
+=20
+ uninstall_from_sitedirs ::
+ 	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULL=
EXT)','.packlist').q{"
+=20
+ uninstall_from_vendordirs ::
+-	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FU=
LLEXT)','.packlist').q{"
+ };
+=20
+     join("",@m);
diff --git a/meta/recipes-devtools/perl/perl/debian/patchlevel.diff b/meta/=
recipes-devtools/perl/perl/debian/patchlevel.diff
new file mode 100644
index 0000000..8656b02
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/patchlevel.diff
@@ -0,0 +1,30 @@
+From b517c5e15d0871e36d0f1187661fe1dd28ddf820 Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Sun, 15 May 2011 19:35:58 +0300
+Subject: List packaged patches in patchlevel.h
+
+Origin: vendor
+Bug-Debian: http://bugs.debian.org/567489
+
+The list of packaged patches is in patchlevel-debian.h, which is generated
+from the debian/patches/ directory when building the package.
+
+Patch-Name: debian/patchlevel.diff
+---
+ patchlevel.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/patchlevel.h b/patchlevel.h
+index a0ad78b..01367b7 100644
+--- a/patchlevel.h
++++ b/patchlevel.h
+@@ -137,6 +137,9 @@ static const char * const local_patches[] =3D {
+ 	,"uncommitted-changes"
+ #endif
+ 	PERL_GIT_UNPUSHED_COMMITS    	/* do not remove this line */
++#ifdef DEBIAN
++#include "patchlevel-debian.h"
++#endif
+ 	,NULL
+ };
+=20
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/perl5db-x-termin=
al-emulator.patch b/meta/recipes-devtools/perl/perl/debian/perl5db-x-termin=
al-emulator.patch
similarity index 87%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/perl5db-x-termina=
l-emulator.patch
rename to meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-emulato=
r.patch
index 82a9f1a..533952c 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/perl5db-x-terminal-emul=
ator.patch
+++ b/meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-emulator.pa=
tch
@@ -1,4 +1,4 @@
-From dc495a233b95d7e3e6900845847035da8f01aa59 Mon Sep 17 00:00:00 2001
+From c99c61e8f863a508a0793168011c98dc74abbd05 Mon Sep 17 00:00:00 2001
 From: Dominic Hargreaves <dom@earth.li>
 Date: Sat, 14 Apr 2012 11:34:05 +0100
 Subject: Invoke x-terminal-emulator rather than xterm in perl5db.pl
@@ -15,10 +15,10 @@ Patch-Name: debian/perl5db-x-terminal-emulator.patch
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/lib/perl5db.pl b/lib/perl5db.pl
-index 707d04d..6ac4d36 100644
+index 7e7194e..c466bf3 100644
 --- a/lib/perl5db.pl
 +++ b/lib/perl5db.pl
-@@ -6945,7 +6945,7 @@ properly set up.
+@@ -6960,7 +6960,7 @@ properly set up.
  sub xterm_get_fork_TTY {
      ( my $name =3D $0 ) =3D~ s,^.*[/\\],,s;
      open XT,
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/perlivp.diff b/m=
eta/recipes-devtools/perl/perl/debian/perlivp.diff
similarity index 95%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/perlivp.diff
rename to meta/recipes-devtools/perl/perl/debian/perlivp.diff
index 60a714f..2c1eab9 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/perlivp.diff
+++ b/meta/recipes-devtools/perl/perl/debian/perlivp.diff
@@ -1,4 +1,4 @@
-From 70eb3e56e884e62bcf837c1f8cd32e35e5552889 Mon Sep 17 00:00:00 2001
+From fbfbeb7a690d703a3cdc56f923e89eb7b7997d31 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Fri, 9 Jan 2009 18:54:47 +0200
 Subject: Make perlivp skip include directories in /usr/local
diff --git a/meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff=
 b/meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff
new file mode 100644
index 0000000..6270b87
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff
@@ -0,0 +1,23 @@
+From 27a4952c2e531947dc9f2f02e2063d117e2e699a Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Sat, 18 Apr 2015 17:39:32 +0300
+Subject: Update porting/customized.dat for pod2man modifications
+
+Patch-Name: debian/pod2man-customized.diff
+---
+ t/porting/customized.dat | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/t/porting/customized.dat b/t/porting/customized.dat
+index 0eed9f7..7df398d 100644
+--- a/t/porting/customized.dat
++++ b/t/porting/customized.dat
+@@ -42,7 +42,7 @@ Win32API::File cpan/Win32API-File/Makefile.PL 605d0aee31=
aebe84a99408f9ab5f644db5
+ Win32API::File cpan/Win32API-File/t/file.t 124e64aa77e755235eb297644a87fa=
c5388d3d78
+ Win32API::File cpan/Win32API-File/t/tie.t 712ea7edd0cc805ce1c0b8172c01b03=
dd19b583d
+ Win32API::File cpan/Win32API-File/typemap 24bff088babeadac0873e8df390d166=
6d9d9db4a
+-podlators cpan/podlators/scripts/pod2man.PL f81acf53f3ff46cdcc5ebdd661c5d=
13eb35d20d6
++podlators cpan/podlators/scripts/pod2man.PL 761f35d3fcf91c1bc2f9e024a9fa5=
c62fd3fc338
+ podlators cpan/podlators/scripts/pod2text.PL b4693fcfe4a0a1b38a215cfb8985=
a65d5d025d69
+ version cpan/version/lib/version.pm d0923b895d57f1d669ae36fcf85c87b16db34=
1d1
+ version vutil.c 668f17ca43e2527645674d29ba772b86330d5663
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/prefix_changes.d=
iff b/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
similarity index 89%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/prefix_changes.di=
ff
rename to meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
index 535a90d..c41efbe 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/prefix_changes.diff
+++ b/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
@@ -1,4 +1,4 @@
-From 9ff12f918da84dc355b75fbaa5374a8e276f76d7 Mon Sep 17 00:00:00 2001
+From 914948f026efce02cf0abff8b0312aaad96592ed Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Fiddle with *PREFIX and variables written to the makefile
@@ -17,10 +17,10 @@ Patch-Name: debian/prefix_changes.diff
  4 files changed, 13 insertions(+), 16 deletions(-)
=20
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm b/cpan/ExtUtil=
s-MakeMaker/lib/ExtUtils/MM_Any.pm
-index 2066311..0a1fb49 100644
+index 4c00129..1ea2035 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm
-@@ -765,8 +765,6 @@ all POD files in MAN1PODS and MAN3PODS.
+@@ -902,8 +902,6 @@ all POD files in MAN1PODS and MAN3PODS.
  sub manifypods_target {
      my($self) =3D shift;
 =20
@@ -29,16 +29,16 @@ index 2066311..0a1fb49 100644
      my $dependencies  =3D '';
 =20
      # populate manXpods & dependencies:
-@@ -782,7 +780,7 @@ END
+@@ -919,7 +917,7 @@ END
      foreach my $section (qw(1 3)) {
          my $pods =3D $self->{"MAN${section}PODS"};
-         push @man_cmds, $self->split_command(<<CMD, map {($_,$pods->{$_})=
} sort keys %$pods);
--	\$(NOECHO) \$(POD2MAN) --section=3D$section --perm_rw=3D\$(PERM_RW)
-+	\$(NOECHO) \$(POD2MAN) --section=3D\$(MAN${section}EXT) --perm_rw=3D\$(P=
ERM_RW)
+         my $p2m =3D sprintf <<CMD, $] > 5.008 ? " -u" : "";
+-	\$(NOECHO) \$(POD2MAN) --section=3D$section --perm_rw=3D\$(PERM_RW)%s
++	\$(NOECHO) \$(POD2MAN) --section=3D\$(MAN${section}EXT) --perm_rw=3D\$(P=
ERM_RW)%s
  CMD
+         push @man_cmds, $self->split_command($p2m, map {($_,$pods->{$_})}=
 sort keys %$pods);
      }
-=20
-@@ -1748,9 +1746,11 @@ sub init_INSTALL_from_PREFIX {
+@@ -1875,9 +1873,11 @@ sub init_INSTALL_from_PREFIX {
          $self->{SITEPREFIX}   ||=3D $sprefix;
          $self->{VENDORPREFIX} ||=3D $vprefix;
 =20
@@ -54,10 +54,10 @@ index 2066311..0a1fb49 100644
 =20
      my $arch    =3D $Config{archname};
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 0a6797f..c19a5f9 100644
+index 391dc22..4a8e14c 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -3029,8 +3029,7 @@ sub prefixify {
+@@ -3077,8 +3077,7 @@ sub prefixify {
      warn "  prefixify $var =3D> $path\n" if $Verbose >=3D 2;
      warn "    from $sprefix to $rprefix\n" if $Verbose >=3D 2;
 =20
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/prune_libs.diff =
b/meta/recipes-devtools/perl/perl/debian/prune_libs.diff
similarity index 78%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/prune_libs.diff
rename to meta/recipes-devtools/perl/perl/debian/prune_libs.diff
index 50bcc47..b4443f6 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/prune_libs.diff
+++ b/meta/recipes-devtools/perl/perl/debian/prune_libs.diff
@@ -1,4 +1,4 @@
-From f2d2ddd656999f51148c66a3efce76bda8d2f9ca Mon Sep 17 00:00:00 2001
+From 21bc033755f0b609f9bb2aa9e98b10d58424406f Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
 Subject: Prune the list of libraries wanted to what we actually need.
@@ -14,20 +14,20 @@ Patch-Name: debian/prune_libs.diff
  1 file changed, 2 insertions(+), 3 deletions(-)
=20
 diff --git a/Configure b/Configure
-index 293ef61..3f80a76 100755
+index 0a405d3..6fcc3bc 100755
 --- a/Configure
 +++ b/Configure
-@@ -1387,8 +1387,7 @@ libswanted_uselargefiles=3D''
+@@ -1454,8 +1454,7 @@ libswanted_uselargefiles=3D''
  : set usesocks on the Configure command line to enable socks.
  : List of libraries we want.
  : If anyone needs extra -lxxx, put those in a hint file.
--libswanted=3D"socket bind inet nsl nm ndbm gdbm dbm db malloc dl ld sun"
--libswanted=3D"$libswanted m crypt sec util c cposix posix ucb bsd BSD"
+-libswanted=3D"cl pthread socket bind inet nsl nm ndbm gdbm dbm db malloc =
dl ld"
+-libswanted=3D"$libswanted sun m crypt sec util c cposix posix ucb bsd BSD=
"
 +libswanted=3D'gdbm gdbm_compat db dl m c crypt'
  : We probably want to search /usr/shlib before most other libraries.
  : This is only used by the lib/ExtUtils/MakeMaker.pm routine extliblist.
  glibpth=3D`echo " $glibpth " | sed -e 's! /usr/shlib ! !'`
-@@ -22796,7 +22795,7 @@ sunos*X4*)
+@@ -23593,7 +23592,7 @@ sunos*X4*)
      ;;
  *) case "$usedl" in
      $define|true|[yY]*)
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/regen-skip.diff =
b/meta/recipes-devtools/perl/perl/debian/regen-skip.diff
similarity index 93%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/regen-skip.diff
rename to meta/recipes-devtools/perl/perl/debian/regen-skip.diff
index 50bc97c..8a3fc99 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/regen-skip.diff
+++ b/meta/recipes-devtools/perl/perl/debian/regen-skip.diff
@@ -1,4 +1,4 @@
-From 55a3d4b004595a9f171d79329c9d218f0b850bd8 Mon Sep 17 00:00:00 2001
+From cb3e98e17a666896150b109694e9eb9278620845 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Sat, 17 May 2014 14:57:01 +0300
 Subject: Skip a regeneration check in unrelated git repositories
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/skip-kfreebsd-cr=
ash.diff b/meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff
similarity index 91%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/skip-kfreebsd-cra=
sh.diff
rename to meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff
index f7cc555..ecfc0bc 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/skip-kfreebsd-crash.dif=
f
+++ b/meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff
@@ -1,4 +1,4 @@
-From 21747cdd5381a9466fc75ead783980ced8b184a3 Mon Sep 17 00:00:00 2001
+From 42853af65a28066b119d23d96e964e94b55a8541 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Fri, 5 Aug 2011 10:50:18 +0300
 Subject: Skip a crashing test case in t/op/threads.t on GNU/kFreeBSD
@@ -17,7 +17,7 @@ Patch-Name: debian/skip-kfreebsd-crash.diff
  1 file changed, 4 insertions(+)
=20
 diff --git a/t/op/threads.t b/t/op/threads.t
-index 6fb2410..67b5f4a 100644
+index e76c956..bec210b 100644
 --- a/t/op/threads.t
 +++ b/t/op/threads.t
 @@ -376,6 +376,9 @@ EOF
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/skip-upstream-gi=
t-tests.diff b/meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tes=
ts.diff
similarity index 80%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/skip-upstream-git=
-tests.diff
rename to meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tests.di=
ff
index 7110298..4c87104 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/skip-upstream-git-tests=
.diff
+++ b/meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tests.diff
@@ -1,4 +1,4 @@
-From 4d1b20bcec1610d22b718ffae154427a7a218632 Mon Sep 17 00:00:00 2001
+From ae9b645d6da2990fd055368eca2c67c449474e38 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Fri, 22 Apr 2011 11:15:32 +0300
 Subject: Skip tests specific to the upstream Git repository
@@ -14,10 +14,10 @@ Patch-Name: debian/skip-upstream-git-tests.diff
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/t/test.pl b/t/test.pl
-index 30db88c..0fdc4f4 100644
+index cda3840..af579a2 100644
 --- a/t/test.pl
 +++ b/t/test.pl
-@@ -159,7 +159,7 @@ sub skip_all_without_config {
+@@ -174,7 +174,7 @@ sub skip_all_without_unicode_tables { # (but only unde=
r miniperl)
 =20
  sub find_git_or_skip {
      my ($source_dir, $reason);
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/squelch-locale-w=
arnings.diff b/meta/recipes-devtools/perl/perl/debian/squelch-locale-warnin=
gs.diff
similarity index 59%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/squelch-locale-wa=
rnings.diff
rename to meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.di=
ff
index 5c19004..cb31457 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/squelch-locale-warnings=
.diff
+++ b/meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.diff
@@ -1,4 +1,4 @@
-From 2f332eeedbf63f72f6b1b157a912282a31a25d3b Mon Sep 17 00:00:00 2001
+From 487a6d6ada0b08e6a7276520ebc61cd851005e7c Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Sun, 3 Oct 2010 21:36:17 +0300
 Subject: Squelch locale warnings in Debian package maintainer scripts
@@ -15,30 +15,31 @@ the warning will be triggered normally again at that po=
int.
=20
 Patch-Name: debian/squelch-locale-warnings.diff
 ---
- locale.c           | 4 ++++
+ locale.c           | 5 ++++-
  pod/perllocale.pod | 8 ++++++++
- 2 files changed, 12 insertions(+)
+ 2 files changed, 12 insertions(+), 1 deletion(-)
=20
 diff --git a/locale.c b/locale.c
-index 6e8728c..f55c4b2 100644
+index 7a4a418..fdf911d 100644
 --- a/locale.c
 +++ b/locale.c
-@@ -512,6 +512,10 @@ Perl_init_i18nl10n(pTHX_ int printwarn)
-     char *p;
-     const bool locwarn =3D (printwarn > 1 ||
-                     (printwarn &&
-+
-+                     /* Debian specific change - see http://bugs.debian.o=
rg/508764 */
-+                     (!PerlEnv_getenv("DPKG_RUNNING_VERSION")) &&
-+
-                      (!(p =3D PerlEnv_getenv("PERL_BADLANG")) || atoi(p))=
));
-     bool done =3D FALSE;
-     const char *system_default_locale =3D NULL;
+@@ -674,7 +674,10 @@ Perl_init_i18nl10n(pTHX_ int printwarn)
+=20
+     const bool locwarn =3D (printwarn > 1
+                           || (printwarn
+-                              && (! bad_lang_use_once
++                              &&
++                                 /* Debian specific change - see http://b=
ugs.debian.org/508764 */
++                                 (!PerlEnv_getenv("DPKG_RUNNING_VERSION")=
) &&
++                                 (! bad_lang_use_once
+                                   || (
+                                     /* disallow with "" or "0" */
+                                     *bad_lang_use_once
 diff --git a/pod/perllocale.pod b/pod/perllocale.pod
-index 914281f..15de0d4 100644
+index 701b422..58cabaf 100644
 --- a/pod/perllocale.pod
 +++ b/pod/perllocale.pod
-@@ -1151,6 +1151,14 @@ B<NOTE>: PERL_BADLANG only gives you a way to hide =
the warning message.
+@@ -1217,6 +1217,14 @@ B<NOTE>: C<PERL_BADLANG> only gives you a way to hi=
de the warning message.
  The message tells about some problem in your system's locale support,
  and you should investigate what the problem is.
 =20
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/debian/writable_site_di=
rs.diff b/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
similarity index 61%
rename from meta/recipes-devtools/perl/perl-5.20.0/debian/writable_site_dir=
s.diff
rename to meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
index f73f8bb..53adc2f 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/debian/writable_site_dirs.diff
+++ b/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
@@ -1,4 +1,4 @@
-From f33f120f0fdf7cd100066390fe0bc426d45b1929 Mon Sep 17 00:00:00 2001
+From 591c1f9b7d4755bfc59d9665bab1f2ca410de765 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Set umask approproately for site install directories
@@ -11,10 +11,10 @@ Patch-Name: debian/writable_site_dirs.diff
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 8fdb67c..8b86a24 100644
+index 197f102..5f1b87f 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2095,7 +2095,7 @@ q{		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
+@@ -2138,7 +2138,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
 =20
 =20
  pure_site_install :: all
@@ -22,15 +22,15 @@ index 8fdb67c..8b86a24 100644
 +	$(NOECHO) umask 02; $(MOD_INSTALL) \
  };
      push @m,
- q{		read }.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist=
').q{ \
-@@ -2156,8 +2156,8 @@ doc_perl_install :: all
+ q{		read "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlis=
t').q{" \
+@@ -2199,8 +2199,8 @@ doc_perl_install :: all
 =20
  doc_site_install :: all
- 	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/p=
erllocal.pod
--	-$(NOECHO) umask 022; $(MKPATH) $(DESTINSTALLARCHLIB)
+ 	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/=
perllocal.pod"
+-	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
 -	-$(NOECHO) umask 022; $(DOC_INSTALL) \
-+	-$(NOECHO) umask 02; $(MKPATH) $(DESTINSTALLARCHLIB)
++	-$(NOECHO) umask 02; $(MKPATH) "$(DESTINSTALLARCHLIB)"
 +	-$(NOECHO) umask 02; $(DOC_INSTALL) \
  		"Module" "$(NAME)" \
- 		"installed into" "$(INSTALLSITELIB)" \
+ 		"installed into" $(INSTALLSITELIB) \
  		LINKTYPE "$(LINKTYPE)" \
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/dynaloaderhack.patch b/=
meta/recipes-devtools/perl/perl/dynaloaderhack.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/dynaloaderhack.patch
rename to meta/recipes-devtools/perl/perl/dynaloaderhack.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/fix_bad_rpath.patch b/m=
eta/recipes-devtools/perl/perl/fix_bad_rpath.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/fix_bad_rpath.patch
rename to meta/recipes-devtools/perl/perl/fix_bad_rpath.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/generate-sh.patch b/met=
a/recipes-devtools/perl/perl/generate-sh.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/generate-sh.patch
rename to meta/recipes-devtools/perl/perl/generate-sh.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/installperl.patch b/met=
a/recipes-devtools/perl/perl/installperl.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/installperl.patch
rename to meta/recipes-devtools/perl/perl/installperl.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/letgcc-find-errno.patch=
 b/meta/recipes-devtools/perl/perl/letgcc-find-errno.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/letgcc-find-errno.patch
rename to meta/recipes-devtools/perl/perl/letgcc-find-errno.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/make_ext.pl-fix-regener=
ate-makefile-failed-while-cc-.patch b/meta/recipes-devtools/perl/perl/make_=
ext.pl-fix-regenerate-makefile-failed-while-cc-.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/make_ext.pl-fix-regenera=
te-makefile-failed-while-cc-.patch
rename to meta/recipes-devtools/perl/perl/make_ext.pl-fix-regenerate-makefi=
le-failed-while-cc-.patch
diff --git a/meta/recipes-devtools/perl/perl/native-nopacklist.patch b/meta=
/recipes-devtools/perl/perl/native-nopacklist.patch
new file mode 100644
index 0000000..5482dcb
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/native-nopacklist.patch
@@ -0,0 +1,91 @@
+Upstream-Status:Inappropriate [debian patch]
+
+Part of 52_debian_extutils_hacks.patch just to exclude the installation of=
 .packlist files
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm |   35 ++----------------=
-----
+ 1 file changed, 3 insertions(+), 32 deletions(-)
+
+diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUti=
ls-MakeMaker/lib/ExtUtils/MM_Unix.pm
+index f63145c..a589710 100644
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+@@ -2122,11 +2122,6 @@ pure_perl_install :: all
+ };
+=20
+     push @m,
+-q{		read "}.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packli=
st').q{" \
+-		write "}.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$(FULLEXT)','.p=
acklist').q{" \
+-} unless $self->{NO_PACKLIST};
+-
+-    push @m,
+ q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
+ 		"$(INST_ARCHLIB)" "$(DESTINSTALLARCHLIB)" \
+ 		"$(INST_BIN)" "$(DESTINSTALLBIN)" \
+@@ -2158,10 +2153,6 @@ q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
+ pure_vendor_install :: all
+ 	$(NOECHO) $(MOD_INSTALL) \
+ };
+-    push @m,
+-q{		read "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packl=
ist').q{" \
+-		write "}.$self->catfile('$(DESTINSTALLVENDORARCH)','auto','$(FULLEXT)',=
'.packlist').q{" \
+-} unless $self->{NO_PACKLIST};
+=20
+     push @m,
+ q{		"$(INST_LIB)" "$(DESTINSTALLVENDORLIB)" \
+@@ -2187,37 +2178,19 @@ doc_vendor_install :: all
+=20
+     push @m, q{
+ doc_perl_install :: all
+-	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/=
perllocal.pod"
+-	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
+-	-$(NOECHO) $(DOC_INSTALL) \
+-		"Module" "$(NAME)" \
+-		"installed into" $(INSTALLPRIVLIB) \
+-		LINKTYPE "$(LINKTYPE)" \
+-		VERSION "$(VERSION)" \
+-		EXE_FILES "$(EXE_FILES)" \
+-		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
+=20
+ doc_site_install :: all
+-	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/=
perllocal.pod"
+-	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
++	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLSITEARCH)=
/perllocal.pod"
++	-$(NOECHO) $(MKPATH) "$(DESTINSTALLSITEARCH)"
+ 	-$(NOECHO) $(DOC_INSTALL) \
+ 		"Module" "$(NAME)" \
+ 		"installed into" $(INSTALLSITELIB) \
+ 		LINKTYPE "$(LINKTYPE)" \
+ 		VERSION "$(VERSION)" \
+ 		EXE_FILES "$(EXE_FILES)" \
+-		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
++		>> "}.$self->catfile('$(DESTINSTALLSITEARCH)','perllocal.pod').q{"
+=20
+ doc_vendor_install :: all
+-	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/=
perllocal.pod"
+-	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
+-	-$(NOECHO) $(DOC_INSTALL) \
+-		"Module" "$(NAME)" \
+-		"installed into" $(INSTALLVENDORLIB) \
+-		LINKTYPE "$(LINKTYPE)" \
+-		VERSION "$(VERSION)" \
+-		EXE_FILES "$(EXE_FILES)" \
+-		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
+=20
+ } unless $self->{NO_PERLLOCAL};
+=20
+@@ -2226,13 +2199,11 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
+ 	$(NOECHO) $(NOOP)
+=20
+ uninstall_from_perldirs ::
+-	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(PERL_ARCHLIB)','auto','$(FUL=
LEXT)','.packlist').q{"
+=20
+ uninstall_from_sitedirs ::
+ 	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULL=
EXT)','.packlist').q{"
+=20
+ uninstall_from_vendordirs ::
+-	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FU=
LLEXT)','.packlist').q{"
+ };
+=20
+     join("",@m);
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/native-perlinc.patch b/=
meta/recipes-devtools/perl/perl/native-perlinc.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/native-perlinc.patch
rename to meta/recipes-devtools/perl/perl/native-perlinc.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/perl-archlib-exp.patch =
b/meta/recipes-devtools/perl/perl/perl-archlib-exp.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/perl-archlib-exp.patch
rename to meta/recipes-devtools/perl/perl/perl-archlib-exp.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/perl-configpm-switch.pa=
tch b/meta/recipes-devtools/perl/perl/perl-configpm-switch.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/perl-configpm-switch.pat=
ch
rename to meta/recipes-devtools/perl/perl/perl-configpm-switch.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/perl-configure.sh b/met=
a/recipes-devtools/perl/perl/perl-configure.sh
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/perl-configure.sh
rename to meta/recipes-devtools/perl/perl/perl-configure.sh
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/perl-dynloader.patch b/=
meta/recipes-devtools/perl/perl/perl-dynloader.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/perl-dynloader.patch
rename to meta/recipes-devtools/perl/perl/perl-dynloader.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/perl-enable-gdbm.patch =
b/meta/recipes-devtools/perl/perl/perl-enable-gdbm.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/perl-enable-gdbm.patch
rename to meta/recipes-devtools/perl/perl/perl-enable-gdbm.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/perl-moreconfig.patch b=
/meta/recipes-devtools/perl/perl/perl-moreconfig.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/perl-moreconfig.patch
rename to meta/recipes-devtools/perl/perl/perl-moreconfig.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/run-ptest b/meta/recipe=
s-devtools/perl/perl/run-ptest
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/run-ptest
rename to meta/recipes-devtools/perl/perl/run-ptest
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/test/dist-threads-t-joi=
n.t-adjust-ps-option.patch b/meta/recipes-devtools/perl/perl/test/dist-thre=
ads-t-join.t-adjust-ps-option.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/test/dist-threads-t-join=
.t-adjust-ps-option.patch
rename to meta/recipes-devtools/perl/perl/test/dist-threads-t-join.t-adjust=
-ps-option.patch
diff --git a/meta/recipes-devtools/perl/perl-5.20.0/test/ext-DynaLoader-t-D=
ynaLoader.t-fix-calling-dl_findfil.patch b/meta/recipes-devtools/perl/perl/=
test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.20.0/test/ext-DynaLoader-t-Dy=
naLoader.t-fix-calling-dl_findfil.patch
rename to meta/recipes-devtools/perl/perl/test/ext-DynaLoader-t-DynaLoader.=
t-fix-calling-dl_findfil.patch
diff --git a/meta/recipes-devtools/perl/perl_5.20.0.bb b/meta/recipes-devto=
ols/perl/perl_5.22.0.bb
similarity index 96%
rename from meta/recipes-devtools/perl/perl_5.20.0.bb
rename to meta/recipes-devtools/perl/perl_5.22.0.bb
index d100ff9..8022f47 100644
--- a/meta/recipes-devtools/perl/perl_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -7,16 +7,12 @@ LIC_FILES_CHKSUM =3D "file://Copying;md5=3D5b122a36d0f6dc=
55279a0ebc69f3c60b \
 # We need gnugrep (for -I)
 DEPENDS =3D "virtual/db grep-native"
 DEPENDS +=3D "gdbm zlib"
-PR =3D "r1"
=20
-# 5.10.1 has Module::Build built-in
-PROVIDES +=3D "libmodule-build-perl"
-
-SRC_URI =3D "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
+SRC_URI =3D "http://www.cpan.org/src/5.0/${BP}.tar.xz \
 "
=20
 # Pick up patches from debian
-# http://ftp.de.debian.org/debian/pool/main/p/perl/perl_5.20.0-1.debian.ta=
r.xz
+# http://ftp.de.debian.org/debian/pool/main/p/perl/perl_5.22.0-1.debian.ta=
r.xz
 SRC_URI +=3D " \
 	file://debian/cpan_definstalldirs.diff \
 	file://debian/db_file_ver.diff \
@@ -33,7 +29,6 @@ SRC_URI +=3D " \
 	file://debian/ld_run_path.diff \
 	file://debian/libnet_config_path.diff \
 	file://debian/mod_paths.diff \
-	file://debian/module_build_man_extensions.diff \
 	file://debian/prune_libs.diff \
 	file://debian/fixes/net_smtp_docs.diff \
 	file://debian/perlivp.diff \
@@ -42,7 +37,6 @@ SRC_URI +=3D " \
 	file://debian/skip-kfreebsd-crash.diff \
 	file://debian/fixes/document_makemaker_ccflags.diff \
 	file://debian/find_html2text.diff \
-	file://debian/hurd_test_skip_stack.diff \
 	file://debian/perl5db-x-terminal-emulator.patch \
 	file://debian/cpan-missing-site-dirs.diff \
 	file://debian/fixes/memoize_storable_nstore.diff \
@@ -63,7 +57,6 @@ SRC_URI +=3D " \
 	file://fix_bad_rpath.patch \
 	file://perl-archlib-exp.patch \
 	file://dynaloaderhack.patch \
-	file://fix-FF_MORE-crash.patch \
 	\
         \
         file://config.sh \
@@ -73,8 +66,6 @@ SRC_URI +=3D " \
         file://config.sh-64 \
         file://config.sh-64-le \
         file://config.sh-64-be \
-        file://perl-5.14.3-fix-CVE-2010-4777.patch \
-        file://0001-Makefile.SH-fix-do_install-failed.patch \
         file://make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch =
\
 "
=20
@@ -84,8 +75,8 @@ SRC_URI_append_class-target =3D " \
             file://test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findf=
il.patch \
            "
=20
-SRC_URI[md5sum] =3D "406ec049ebe3afcc80d9c76ec78ca4f8"
-SRC_URI[sha256sum] =3D "4e8c28ad6ecc89902f9cb2e76f2815bb1a8287ded278e15f7a=
36ca45f8bbcd02"
+SRC_URI[md5sum] =3D "ff0f09b17de426eff323426cb140ee79"
+SRC_URI[sha256sum] =3D "be83ead0c5c26cbbe626fa4bac1a4beabe23a9eebc15d35ba4=
9ccde11878e196"
=20
 inherit perlnative siteinfo
=20
@@ -379,8 +370,6 @@ PACKAGES_DYNAMIC_class-nativesdk +=3D "^nativesdk-perl-=
module-.*"
 RPROVIDES_perl-lib =3D "perl-lib"
=20
 require perl-rdepends_${PV}.inc
-require perl-rprovides.inc
-require perl-rprovides_${PV}.inc
 require perl-ptest.inc
=20
 SSTATE_SCAN_FILES +=3D "*.pm *.pod *.h *.pl *.sh"
--=20
1.7.9.5


