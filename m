Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDC3CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 19:39:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.10585.1697657975071161250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 12:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j3mGvm6K;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2B151C0006;
	Wed, 18 Oct 2023 19:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697657973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VNqSOU3pvvPi6sYu+bHPMHb7WoScFR0bCx07j55cFsY=;
	b=j3mGvm6K+g94A2bu9bGskLP2Dxz49RW2om68peEs23crcDG87oAohM3j/H/+4eNLoPnqUk
	IOLUgPJ9DNyngvZiTT1jcc+iNBC7kOwikRvKq8Qi8RH80XnCEK14MMBN75KKFXfXEfikWT
	fpfT6aEgDSX2xMAe5jFQUVrqQJE1Vpxh6d1DwX93qISgbbQGNhnDGKHpp2j8vrkAPN1ETL
	5iHh5QxwWYIoCX4wgWr1BlDIcuCCt6/Ylys01LDYCvXQEkzZ2Zy6XgIZz9HdGpZcL60GgK
	/JdExj9yDS7vcp45xSLILdo9kIsMumfBtCtMGYEtYcL2pQxa5EjZV5SBWtwLZg==
Date: Wed, 18 Oct 2023 21:39:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH v2] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
Message-ID: <20231018193932e6cb99ef@mail.local>
References: <20231018084652.900785-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231018084652.900785-1-alex@linutronix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 19:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189421

Hello Alex,

I had this failure on the oe-selftest-armhost builder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2290/ste=
ps/14/logs/stdio

Task texinfo-dummy-native:do_configure couldn't be used from the cache beca=
use:
  We need hash 76c87e43650c854836e1c9a95db39c16de49bf0271535a4da3f030056fcc=
3fb2, most recent matching task was 8e7ba727bc84dd547f1a52515f25189fddcbcb0=
1634b52521741e389cae9103e
  Hash for task dependency texinfo-dummy-native:do_patch changed from 19ba8=
d4ae1894b1725dd9b7e90afb71139de2d72c73208c1bea4094fe1ce259d to 11fdb7aa5419=
cb36b11f0fa281f6e6ca5dcbcc2da515c4d1782b7c0b61ccc447
      Hash for task dependency texinfo-dummy-native:do_unpack changed from =
8864a86b4edb8cf635c7b597596fb4bab900afa8648d486f7dfb00c9c8ce03c3 to 8165664=
451ef563a6c2c84a93abfa4cdf4d617ce1afe55a850fb71cf67b81a01
          basehash changed from 935b6ffebc04d72ae1d16476f82aee22c18c7aaeee3=
40f1ab34d571c3e121147 to 1367421b45cdb92b9994acadd6503c4a0874535e1d175e9c39=
001998a1c8b862
          Variable ERROR_QA value changed:
@@ -1,3 +1,2 @@
 dev-so debug-deps dev-deps debug-files arch pkgconfig la             perms=
 dep-cmp pkgvarcheck perm-config perm-line perm-link             split-stri=
p packages-list pkgv-undefined var-undefined             version-going-back=
wards expanded-d invalid-chars             license-checksum dev-elf file-rd=
eps configure-unsafe             configure-gettext perllocalpod shebang-siz=
e             already-stripped installed-vs-shipped ldflags compile-host-pa=
th             install-host-path pn-overrides unknown-configure-option     =
        useless-rpaths rpaths staticdev empty-dirs             patch-fuzz  =
           ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge',=
 '', d)} patch-status
 DISTRO_FEATURES{usrmerge} =3D Unset
-_remove of packages-list
ERROR: Can't find a task we're supposed to have written out? (hash: e79d70b=
9c2cc72030c1ce822525510699a1eeb1ddf5986271d3217422244366a)?


Task gettext-minimal-native:do_configure couldn't be used from the cache be=
cause:
  We need hash ee11593c797a4579bfb48c61940f50ebd2c6da4883ca265d3231352fd5e2=
48c6, most recent matching task was 140c1b528103db5f34ecd8db962b1ccc715a9da=
95573b9cb9d0441d7c604317c
  basehash changed from ade121cb5b2caa1f610daf254c4d19d28959630e468700c6a5d=
ee6fc44ee8869 to 5190156579dda094eafc1f1df780def5d749972885a93ed7d952833d28=
6f8177
  Variable base_do_configure value changed:
@@ -13,3 +13,4 @@
 		mkdir -p `dirname ${CONFIGURESTAMPFILE}`
 		echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
 	fi
+	echo "this changes base_do_configure() definiton"
Task perlcross-native:do_configure couldn't be used from the cache because:
  We need hash f557deda75fdaf738574f41d517b54338c609677a9a0dbb1774d811714f3=
b7e1, most recent matching task was 7838e1dc635c14048dee89663af3378861d33e7=
79edb609e7a4c5f00fc5af70c
  Task dependencies changed from:
['AR', 'AS', 'B', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUI=
LD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', '=
BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUI=
LD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_PREFIX', 'BUILD_RANLI=
B', 'BUILD_STRIP', 'CC', 'CCLD', 'CFLAGS', 'CONFIG_SITE', 'CPP', 'CPPFLAGS'=
, 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEPENDS', 'ERROR_QA', 'EXTRA_NATIVE_PK=
GCONFIG_PATH', 'EXTRA_OECONF', 'FC', 'HOST_PREFIX', 'INSANE_SKIP', 'LC_ALL'=
, 'LD', 'LDFLAGS', 'MAKE', 'MLPREFIX', 'NATIVE_PACKAGE_PATH_SUFFIX', 'NM', =
'OBJCOPY', 'OBJDUMP', 'P', 'PACKAGECONFIG', 'PERL_HASH_SEED', 'PKG_CONFIG_D=
IR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PAT=
H', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PSEUDO_DISABLED', 'PV', 'PYTHONHASHSEE=
D', 'QA_ERRORS_FOUND', 'QA_LOGFILE', 'RANLIB', 'READELF', 'RECIPE_SYSROOT_N=
ATIVE', 'S', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_BINDIR_NATIVE', 'STAGIN=
G_DATADIR', 'STAGING_DATADIR_NATIVE', 'STAGING_DIR_NATIVE', 'STAGING_ETCDIR=
_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR_NATIVE', 'STAGING_SBINDI=
R_NATIVE', 'STRINGS', 'STRIP', 'TZ', 'UNKNOWN_CONFIGURE_OPT_IGNORE', 'base_=
bindir', 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_sbindir'=
, 'bindir', 'bindir_native', 'datadir', 'datadir_native', 'do_qa_configure'=
, 'docdir', 'exec_prefix', 'includedir', 'includedir_native', 'infodir', 'l=
ibdir', 'libdir_native', 'libexecdir', 'localstatedir', 'lt_cv_sys_lib_dlse=
arch_path_spec', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oe.qa.=
exit_if_errors', 'oe.qa.exit_with_message_if_errors', 'oe.qa.handle_error',=
 'oe.qa.write_error', 'oe.types.boolean', 'oe.utils.vartrue', 'oldincludedi=
r', 'prefix', 'prefix_native', 'root_prefix', 'sbindir', 'sbindir_native', =
'servicedir', 'sharedstatedir', 'sysconfdir', 'sysconfdir_native', 'systemd=
_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir']
to:
['AR', 'AS', 'B', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUI=
LD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', '=
BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUI=
LD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_PREFIX', 'BUILD_RANLI=
B', 'BUILD_STRIP', 'CC', 'CCLD', 'CFLAGS', 'CONFIG_SITE', 'CPP', 'CPPFLAGS'=
, 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEPENDS', 'DISABLE_STATIC', 'ERROR_QA'=
, 'EXTRA_NATIVE_PKGCONFIG_PATH', 'EXTRA_OECONF', 'FC', 'HOST_PREFIX', 'INSA=
NE_SKIP', 'LC_ALL', 'LD', 'LDFLAGS', 'MAKE', 'MLPREFIX', 'NATIVE_PACKAGE_PA=
TH_SUFFIX', 'NM', 'OBJCOPY', 'OBJDUMP', 'P', 'PACKAGECONFIG', 'PERL_HASH_SE=
ED', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR=
', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PSEUDO_DISABLED', 'P=
V', 'PYTHONHASHSEED', 'QA_ERRORS_FOUND', 'QA_LOGFILE', 'RANLIB', 'READELF',=
 'RECIPE_SYSROOT_NATIVE', 'S', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_BINDI=
R_NATIVE', 'STAGING_DATADIR', 'STAGING_DATADIR_NATIVE', 'STAGING_DIR_NATIVE=
', 'STAGING_ETCDIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR_NATIVE=
', 'STAGING_SBINDIR_NATIVE', 'STRINGS', 'STRIP', 'TZ', 'UNKNOWN_CONFIGURE_O=
PT_IGNORE', 'base_bindir', 'base_libdir', 'base_libdir_native', 'base_prefi=
x', 'base_sbindir', 'bindir', 'bindir_native', 'datadir', 'datadir_native',=
 'do_qa_configure', 'docdir', 'exec_prefix', 'includedir', 'includedir_nati=
ve', 'infodir', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir', '=
lt_cv_sys_lib_dlsearch_path_spec', 'mandir', 'nonarch_base_libdir', 'nonarc=
h_libdir', 'oe.qa.exit_if_errors', 'oe.qa.exit_with_message_if_errors', 'oe=
=2Eqa.handle_error', 'oe.qa.write_error', 'oe.types.boolean', 'oe.utils.var=
true', 'oldincludedir', 'prefix', 'prefix_native', 'root_prefix', 'sbindir'=
, 'sbindir_native', 'servicedir', 'sharedstatedir', 'sysconfdir', 'sysconfd=
ir_native', 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unit=
dir']
  basehash changed from 4866ba7810881112d6ce0cb85301756c02eb4b282604bae6951=
6ec23d7b20acf to 297e5c7592ebd6378c8fc49fe98ffd9e675a04324346c5b50811c6a5ee=
bbe78e
  List of dependencies for variable EXTRA_OECONF changed from 'frozenset()'=
 to 'frozenset({'DISABLE_STATIC'})'
  Dependency on variable DISABLE_STATIC was added
  Variable EXTRA_OECONF value changed from '' to '${DISABLE_STATIC}'
ERROR: Can't find a task we're supposed to have written out? (hash: 9992504=
61834bf74545962a8577bc26854a3d08bb2a96140d5efe314e0ef2d63)?


ERROR: Can't find a task we're supposed to have written out? (hash: e79d70b=
9c2cc72030c1ce822525510699a1eeb1ddf5986271d3217422244366a)?

On 18/10/2023 10:46:52+0200, Alexander Kanavin wrote:
> 'bitbake -S printdiff' is a useful diagnostic facility for finding out
> why sstate is not being reused, but until now it had no tests that would
> ensure it works. This commit adds three basic scenarios:
>=20
> 1. make a change in a really basic, common recipe that is at the very root
> of dependency trees (quilt-native), and ensure that change is correctly d=
iscovered when
> building an image.
>=20
> 2. make a change in gcc-source recipe, which is somewhat special
> (operates in work-shared), and ensure that gcc-runtime builds track
> that down as well.
>=20
> 3. make a change in base_do_configure() definition from base.bbclass,
> which is not recipe-specific, but affects many basic recipes, and ensure =
that
> is correctly reported as well.
>=20
> The test itself actually runs twice:
> - first against a fully populated build directory, where
> the printdiff code is guaranteed to find the correct previous
> stamp that can be compared with in a predictable manner.
>=20
> - then in an empty build directory where the printdiff code
> goes to look in the sstate cache, and so the existence of the
> previous signature can be tested, but not the difference with it
> (what the exact difference would be is unpredictable as the
> sstate cache is indeed shared between many builds).
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../base-do-configure-modified.bbclass        |   3 +
>  .../gcc-source/gcc-source_%.bbappend          |   2 +
>  .../quilt-native/quilt-native_%.bbappend      |   2 +
>  meta/lib/oeqa/selftest/cases/sstatetests.py   | 106 ++++++++++++++++++
>  4 files changed, 113 insertions(+)
>  create mode 100644 meta-selftest/classes/base-do-configure-modified.bbcl=
ass
>  create mode 100644 meta-selftest/recipes-test/gcc-source/gcc-source_%.bb=
append
>  create mode 100644 meta-selftest/recipes-test/quilt-native/quilt-native_=
%.bbappend
>=20
> diff --git a/meta-selftest/classes/base-do-configure-modified.bbclass b/m=
eta-selftest/classes/base-do-configure-modified.bbclass
> new file mode 100644
> index 00000000000..3f96827a428
> --- /dev/null
> +++ b/meta-selftest/classes/base-do-configure-modified.bbclass
> @@ -0,0 +1,3 @@
> +base_do_configure:append () {
> +	echo "this changes base_do_configure() definiton"
> +}
> diff --git a/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend =
b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
> new file mode 100644
> index 00000000000..205720982cb
> --- /dev/null
> +++ b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
> @@ -0,0 +1,2 @@
> +# This bbappend is used to alter the recipe using the test_recipe.inc fi=
le created by tests.
> +include test_recipe.inc
> diff --git a/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbapp=
end b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
> new file mode 100644
> index 00000000000..205720982cb
> --- /dev/null
> +++ b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
> @@ -0,0 +1,2 @@
> +# This bbappend is used to alter the recipe using the test_recipe.inc fi=
le created by tests.
> +include test_recipe.inc
> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/=
selftest/cases/sstatetests.py
> index bdad9088d37..6ef339897bf 100644
> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> @@ -773,3 +773,109 @@ addtask tmptask2 before do_tmptask1
>                  latestfiles =3D sorted(filedates.keys(), key=3Dlambda f:=
 filedates[f])[-2:]
>                  bb.siggen.compare_sigfiles(latestfiles[-2], latestfiles[=
-1], recursecb)
>                  self.assertEqual(recursecb_count,1)
> +
> +class SStatePrintdiff(SStateBase):
> +    def run_test_printdiff_changerecipe(self, target, change_recipe, cha=
nge_bbtask, change_content, expected_sametmp_output, expected_difftmp_outpu=
t):
> +        self.write_config("""
> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff"
> +""")
> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
> +        bitbake(target)
> +        bitbake("-S none {}".format(target))
> +        bitbake(change_bbtask)
> +        self.write_recipeinc(change_recipe, change_content)
> +        result_sametmp =3D bitbake("-S printdiff {}".format(target))
> +
> +        self.write_config("""
> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff-2"
> +""")
> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
> +        result_difftmp =3D bitbake("-S printdiff {}".format(target))
> +
> +        self.delete_recipeinc(change_recipe)
> +        for item in expected_sametmp_output:
> +            self.assertIn(item, result_sametmp.output)
> +        for item in expected_difftmp_output:
> +            self.assertIn(item, result_difftmp.output)
> +
> +    def run_test_printdiff_changeconfig(self, target, change_content, ex=
pected_sametmp_output, expected_difftmp_output):
> +        self.write_config("""
> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff"
> +""")
> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
> +        bitbake(target)
> +        bitbake("-S none {}".format(target))
> +        self.append_config(change_content)
> +        result_sametmp =3D bitbake("-S printdiff {}".format(target))
> +
> +        self.write_config("""
> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff-2"
> +""")
> +        self.append_config(change_content)
> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
> +        result_difftmp =3D bitbake("-S printdiff {}".format(target))
> +
> +        for item in expected_sametmp_output:
> +            self.assertIn(item, result_sametmp.output)
> +        for item in expected_difftmp_output:
> +            self.assertIn(item, result_difftmp.output)
> +
> +
> +    # Check if printdiff walks the full dependency chain from the image =
target to where the change is in a specific recipe
> +    def test_image_minimal_vs_quilt(self):
> +        expected_output =3D ("Task quilt-native:do_install couldn't be u=
sed from the cache because:",
> +"We need hash",
> +"most recent matching task was")
> +        expected_sametmp_output =3D expected_output + ("Variable do_inst=
all value changed",'+    echo "this changes the task signature"')
> +        expected_difftmp_output =3D expected_output
> +
> +        self.run_test_printdiff_changerecipe("core-image-minimal", "quil=
t-native", "-c do_install quilt-native",
> +"""
> +do_install:append() {
> +    echo "this changes the task signature"
> +}
> +""",
> +expected_sametmp_output, expected_difftmp_output)
> +
> +    # Check if changes to gcc-source (which uses tmp/work-shared) are co=
rrectly discovered
> +    def test_gcc_runtime_vs_gcc_source(self):
> +        gcc_source_pn =3D 'gcc-source-%s' % get_bb_vars(['PV'], 'gcc')['=
PV']
> +
> +        expected_output =3D ("Task {}:do_preconfigure couldn't be used f=
rom the cache because:".format(gcc_source_pn),
> +"We need hash",
> +"most recent matching task was")
> +        expected_sametmp_output =3D expected_output + ("Variable do_prec=
onfigure value changed",'+    print("this changes the task signature")')
> +        #FIXME: printdiff is supposed to find at least one preconfigure =
task signature in the sstate cache, but isn't able to
> +        #expected_difftmp_output =3D expected_output
> +        expected_difftmp_output =3D ()
> +
> +        self.run_test_printdiff_changerecipe("gcc-runtime", "gcc-source"=
, "-c do_preconfigure {}".format(gcc_source_pn),
> +"""
> +python do_preconfigure:append() {
> +    print("this changes the task signature")
> +}
> +""",
> +expected_sametmp_output, expected_difftmp_output)
> +
> +    # Check if changing a really base task definiton is reported against=
 multiple core recipes using it
> +    def test_image_minimal_vs_base_do_configure(self):
> +        expected_output =3D ("Task zstd-native:do_configure couldn't be =
used from the cache because:",
> +"Task texinfo-dummy-native:do_configure couldn't be used from the cache =
because:",
> +"Task ldconfig-native:do_configure couldn't be used from the cache becau=
se:",
> +"Task gettext-minimal-native:do_configure couldn't be used from the cach=
e because:",
> +"Task tzcode-native:do_configure couldn't be used from the cache because=
:",
> +"Task makedevs-native:do_configure couldn't be used from the cache becau=
se:",
> +"Task pigz-native:do_configure couldn't be used from the cache because:",
> +"Task update-rc.d-native:do_configure couldn't be used from the cache be=
cause:",
> +"Task unzip-native:do_configure couldn't be used from the cache because:=
",
> +"Task gnu-config-native:do_configure couldn't be used from the cache bec=
ause:",
> +"We need hash",
> +"most recent matching task was")
> +        expected_sametmp_output =3D expected_output + ("Variable base_do=
_configure value changed",'+	echo "this changes base_do_configure() definit=
on"')
> +        expected_difftmp_output =3D expected_output
> +
> +        self.run_test_printdiff_changeconfig("core-image-minimal",
> +"""
> +INHERIT +=3D "base-do-configure-modified"
> +""",
> +expected_sametmp_output, expected_difftmp_output)
> --=20
> 2.39.2
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189370): https://lists.openembedded.org/g/openembedde=
d-core/message/189370
> Mute This Topic: https://lists.openembedded.org/mt/102035446/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

