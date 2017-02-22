Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8737F601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 01:48:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1M1mEie012189
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Feb 2017 17:48:14 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 21 Feb 2017 17:48:13 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1487659929.git.hongxu.jia@windriver.com>
	<13166601300f7c408f64219dcdde6cfa8253e40b.1487659929.git.hongxu.jia@windriver.com>
	<CAJTo0LY9Mki0m3QyCO8shhgJGEL9m1udkyxkJt0iHcbSzwNwow@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <6fe5567c-a16e-bf4a-991d-6caf77ba372e@windriver.com>
Date: Wed, 22 Feb 2017 09:48:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY9Mki0m3QyCO8shhgJGEL9m1udkyxkJt0iHcbSzwNwow@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] bash: update patches for 4.4
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
X-List-Received-Date: Wed, 22 Feb 2017 01:48:13 -0000
Content-Type: multipart/alternative;
	boundary="------------8E670DCC9D25F97330711567"

--------------8E670DCC9D25F97330711567
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年02月21日 21:45, Burton, Ross wrote:
> Having commits which don't build isn't good for bisecting in the 
> future: can you squash these into a single commit and credit Zheng 
> Ruoqin for the initial work?
>

OK, I will squash them into a single commit.

//Hongxu

> Ross
>
> On 21 February 2017 at 07:36, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     - Update patches from upstream to 4.4
>
>     - Add ${PN}-loadable for loadable builtins which is new features
>     in Bash 4.4
>       --------------
>        a.  `make install' now installs the example loadable builtins
>     and a set of
>            bash headers to use when developing new loadable builtins.
>
>        b.  `enable -f' now attempts to call functions named
>     BUILTIN_builtin_load when
>            loading BUILTIN, and BUILTIN_builtin_unload when deleting
>     it.  This allows
>            loadable builtins to run initialization and cleanup code.
>
>        c.  There is a new BASH_LOADABLES_PATH variable containing a
>     list of directories
>            where the `enable -f' command looks for shared objects
>     containing loadable
>            builtins.
>        --------------
>
>     - The loadable builtins `uname' could not be parsed by rpmdeps
>     correctly:
>        --------------
>        $ recipe-sysroot-native/usr/lib/rpm/bin/rpmdeps-oecore --macros \
>        recipe-sysroot-native/usr/lib/rpm/macros --define
>     '_rpmfc_magic_path \
>        recipe-sysroot-native/usr/share/misc/magic.mgc' --rpmpopt \
>        recipe-sysroot-native/usr/lib/rpm/rpmpopt
>     packages-split/bash/usr/lib64/bash/uname
>
>        |packages-split/bash/usr/lib64/bash/uname Provides: )(64bit
>        |packages-split/bash/usr/lib64/bash/uname Provides:
>     elf(buildid) = 7186059a5a6b11ec38493b53072c3a62edf7e05c
>        --------------
>
>        The incorrected "Provides: )(64bit" could not be parsed by
>     rpmbuild.
>        --------------
>        | DEBUG: Executing shell function BUILDSPEC
>        | error: line 56: Dependency ")(64bit" must begin with
>     alpha-numeric, '_' or '/': Provides: )(64bit
>        | error: Package has no %description: bash-4.4-r0.core2_64
>        --------------
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      ...e-builtins-uname-could-not-be-parsed-by-r.patch | 89
>     ++++++++++++++++++++++
>      meta/recipes-extended/bash/bash_4.4.bb <http://bash_4.4.bb>      
>          | 28 +++++++
>      2 files changed, 117 insertions(+)
>      create mode 100644
>     meta/recipes-extended/bash/bash/0001-The-loadable-builtins-uname-could-not-be-parsed-by-r.patch
>
>     diff --git
>     a/meta/recipes-extended/bash/bash/0001-The-loadable-builtins-uname-could-not-be-parsed-by-r.patch
>     b/meta/recipes-extended/bash/bash/0001-The-loadable-builtins-uname-could-not-be-parsed-by-r.patch
>     new file mode 100644
>     index 0000000..79d9e4e
>     --- /dev/null
>     +++
>     b/meta/recipes-extended/bash/bash/0001-The-loadable-builtins-uname-could-not-be-parsed-by-r.patch
>     @@ -0,0 +1,89 @@
>     +rename uname to workaround name confliction in rpmnsProbe
>     +
>     +The loadable builtins `uname' could not be parsed by
>     +rpmdeps correctly:
>     +--------------
>     +$recipe-sysroot-native/usr/lib/rpm/bin/rpmdeps-oecore --macros \
>     +recipe-sysroot-native/usr/lib/rpm/macros --define
>     '_rpmfc_magic_path \
>     +recipe-sysroot-native/usr/share/misc/magic.mgc' --rpmpopt \
>     +recipe-sysroot-native/usr/lib/rpm/rpmpopt
>     packages-split/bash/usr/lib64/bash/uname
>     +
>     +|packages-split/bash/usr/lib64/bash/uname Provides: )(64bit
>     +|packages-split/bash/usr/lib64/bash/uname Provides: elf(buildid)
>     = 7186059a5a6b11ec38493b53072c3a62edf7e05c
>     +--------------
>     +
>     +The incorrected "Provides: )(64bit" could not be parsed by rpmbuild.
>     +--------------
>     +| DEBUG: Executing shell function BUILDSPEC
>     +| error: line 56: Dependency ")(64bit" must begin with
>     alpha-numeric, '_' or '/': Provides: )(64bit
>     +| error: Package has no %description: bash-4.4-r0.core2_64
>     +--------------
>     +
>     +The root cause is `uname' is incorrectly parsed by rpmnsProbe
>     that string
>     +matches with "uname()(64bit)".
>     +
>     +The nsType of `uname' should be RPMNS_TYPE_NAMESPACE (like other
>     utilities),
>     +rather than RPMNS_TYPE_UNAME which generates "Provides: )(64bit".
>     +
>     +We could not fix rpm-native without side effect. So rename to
>     `uname-oe'
>     +and create a symlink `uname' could workaround the issue.
>     +
>     +Here is to load builtin uname in the target:
>     +----------------
>     +root@qemux86-64:# enable -f /usr/lib64/bash/uname uname
>     +root@qemux86-64:# help uname
>     +uname: uname [-amnrsv]
>     +    Display system information.
>     +
>     +    Display information about the system hardware and OS.
>     +----------------
>     +
>     +Upstream-Status: Inappropriate [oe specific]
>     +
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +---
>     + examples/loadables/Makefile.in | 8 +++++---
>     + 1 file changed, 5 insertions(+), 3 deletions(-)
>     +
>     +diff --git a/examples/loadables/Makefile.in
>     b/examples/loadables/Makefile.in
>     +index ec305cd..c7c96e2 100644
>     +--- a/examples/loadables/Makefile.in
>     ++++ b/examples/loadables/Makefile.in
>     +@@ -102,7 +102,7 @@ INC = -I. -I.. -I$(topdir) -I$(topdir)/lib
>     -I$(topdir)/builtins -I${srcdir} \
>     +
>     + ALLPROG = print truefalse sleep finfo logname basename dirname \
>     +         tty pathchk tee head mkdir rmdir printenv id whoami \
>     +-        uname sync push ln unlink realpath strftime mypid setpgid
>     ++        uname-oe sync push ln unlink realpath strftime mypid setpgid
>     + OTHERPROG = necho hello cat pushd
>     +
>     + all:  $(SHOBJ_STATUS)
>     +@@ -178,7 +178,7 @@ id:        id.o
>     + whoami:       whoami.o
>     +       $(SHOBJ_LD) $(SHOBJ_LDFLAGS) $(SHOBJ_XLDFLAGS) -o $@
>     whoami.o $(SHOBJ_LIBS)
>     +
>     +-uname:        uname.o
>     ++uname-oe:     uname.o
>     +       $(SHOBJ_LD) $(SHOBJ_LDFLAGS) $(SHOBJ_XLDFLAGS) -o $@
>     uname.o $(SHOBJ_LIBS)
>     +
>     + sync: sync.o
>     +@@ -244,13 +244,15 @@ install-supported:       all installdirs
>     install-dev
>     +               echo $$prog ; \
>     +               $(INSTALL_PROGRAM) $(INSTALLMODE) $$prog
>     $(DESTDIR)$(loadablesdir)/$$prog ;\
>     +       done
>     ++      -( cd $(DESTDIR)$(loadablesdir) && ln -snf uname-oe uname)
>     ++
>     +
>     + uninstall-dev:
>     +       -$(RM) $(DESTDIR)$(loadablesdir)/Makefile.inc
>     +       -( cd $(BUILD_DIR) && ${MAKE} ${MFLAGS}
>     DESTDIR="$(DESTDIR)" uninstall-headers)
>     +
>     + uninstall-supported:  uninstall-dev
>     +-      -( cd $(DESTDIR)${loadablesdir} && $(RM) ${ALLPROG} )
>     ++      -( cd $(DESTDIR)${loadablesdir} && $(RM) ${ALLPROG} uname)
>     +
>     + install-unsupported:
>     + uninstall-unsupported:
>     +--
>     +2.8.1
>     +
>     diff --git a/meta/recipes-extended/bash/bash_4.4.bb
>     <http://bash_4.4.bb> b/meta/recipes-extended/bash/bash_4.4.bb
>     <http://bash_4.4.bb>
>     index 16ff114..798bfdb 100644
>     --- a/meta/recipes-extended/bash/bash_4.4.bb <http://bash_4.4.bb>
>     +++ b/meta/recipes-extended/bash/bash_4.4.bb <http://bash_4.4.bb>
>     @@ -10,6 +10,13 @@ SRC_URI =
>     "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
>                
>     ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-003;apply=yes;striplevel=0;name=patch003
>     \
>                
>     ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-004;apply=yes;striplevel=0;name=patch004
>     \
>                
>     ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-005;apply=yes;striplevel=0;name=patch005
>     \
>     +         
>      ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-006;apply=yes;striplevel=0;name=patch006
>     \
>     +         
>      ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-007;apply=yes;striplevel=0;name=patch007
>     \
>     +         
>      ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-008;apply=yes;striplevel=0;name=patch008
>     \
>     +         
>      ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-009;apply=yes;striplevel=0;name=patch009
>     \
>     +         
>      ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-010;apply=yes;striplevel=0;name=patch010
>     \
>     +         
>      ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-011;apply=yes;striplevel=0;name=patch011
>     \
>     +         
>      ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-012;apply=yes;striplevel=0;name=patch012
>     \
>                 file://execute_cmd.patch;striplevel=0 \
>                 file://mkbuiltins_have_stringize.patch \
>                 file://build-tests.patch \
>     @@ -19,6 +26,7 @@ SRC_URI =
>     "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
>                 file://fix-run-builtins.patch \
>                
>     file://0001-help-fix-printf-format-security-warning.patch \
>                 file://0001-patch-to-obtain-pkgconfig-sanity.patch \
>     +         
>      file://0001-The-loadable-builtins-uname-could-not-be-parsed-by-r.patch
>     \
>                 "
>
>      SRC_URI[tarball.md5sum] = "148888a7c95ac23705559b6f477dfe25"
>     @@ -34,5 +42,25 @@ SRC_URI[patch004.md5sum] =
>     "4557d674ab5831a5fa98052ab19edaf4"
>      SRC_URI[patch004.sha256sum] =
>     "ad080a30a4ac6c1273373617f29628cc320a35c8cd06913894794293dc52c8b3"
>      SRC_URI[patch005.md5sum] = "cce96dd77cdd1d293beec10848f6cbb5"
>      SRC_URI[patch005.sha256sum] =
>     "221e4b725b770ad0bb6924df3f8d04f89eeca4558f6e4c777dfa93e967090529"
>     +SRC_URI[patch006.md5sum] = "d3379f8d8abce5c6ee338f931ad008d5"
>     +SRC_URI[patch006.sha256sum] =
>     "6a8e2e2a6180d0f1ce39dcd651622fb6d2fd05db7c459f64ae42d667f1e344b8"
>     +SRC_URI[patch007.md5sum] = "ec38c76ca439ca7f9c178e9baede84fc"
>     +SRC_URI[patch007.sha256sum] =
>     "de1ccc07b7bfc9e25243ad854f3bbb5d3ebf9155b0477df16aaf00a7b0d5edaf"
>     +SRC_URI[patch008.md5sum] = "e0ba18c1e3b94f905da9b5bf9d38b58b"
>     +SRC_URI[patch008.sha256sum] =
>     "86144700465933636d7b945e89b77df95d3620034725be161ca0ca5a42e239ba"
>     +SRC_URI[patch009.md5sum] = "e952d4f44e612048930c559d90eb99bb"
>     +SRC_URI[patch009.sha256sum] =
>     "0b6bdd1a18a0d20e330cc3bc71e048864e4a13652e29dc0ebf3918bea729343c"
>     +SRC_URI[patch010.md5sum] = "57b5b35955d68f9a09dbef6b86d2c782"
>     +SRC_URI[patch010.sha256sum] =
>     "8465c6f2c56afe559402265b39d9e94368954930f9aa7f3dfa6d36dd66868e06"
>     +SRC_URI[patch011.md5sum] = "cc896e1fa696b93ded568e557e2392d5"
>     +SRC_URI[patch011.sha256sum] =
>     "dd56426ef7d7295e1107c0b3d06c192eb9298f4023c202ca2ba6266c613d170d"
>     +SRC_URI[patch012.md5sum] = "fa47fbfa56fb7e9e5367f19a9df5fc9e"
>     +SRC_URI[patch012.sha256sum] =
>     "fac271d2bf6372c9903e3b353cb9eda044d7fe36b5aab52f21f3f21cd6a2063e"
>
>      BBCLASSEXTEND = "nativesdk"
>     +
>     +PACKAGE_BEFORE_PN += "${PN}-loadable"
>     +RDEPENDS_${PN}-loadable += "${PN}"
>     +FILES_${PN}-dev += "${libdir}/bash/Makefile.inc"
>     +FILES_${PN}-loadable += "${libdir}/bash/*"
>     +
>     --
>     2.9.3
>
>


--------------8E670DCC9D25F97330711567
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2017年02月21日 21:45, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LY9Mki0m3QyCO8shhgJGEL9m1udkyxkJt0iHcbSzwNwow@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Having commits which don't build isn't good for
        bisecting in the future: can you squash these into a single
        commit and credit Zheng Ruoqin for the initial work?
        <div><br>
        </div>
      </div>
    </blockquote>
    <br>
    OK, I will squash them into a single commit.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAJTo0LY9Mki0m3QyCO8shhgJGEL9m1udkyxkJt0iHcbSzwNwow@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 21 February 2017 at 07:36, Hongxu
          Jia <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">- Update
            patches from upstream to 4.4<br>
            <br>
            - Add ${PN}-loadable for loadable builtins which is new
            features in Bash 4.4<br>
              --------------<br>
               a.  `make install' now installs the example loadable
            builtins and a set of<br>
                   bash headers to use when developing new loadable
            builtins.<br>
            <br>
               b.  `enable -f' now attempts to call functions named
            BUILTIN_builtin_load when<br>
                   loading BUILTIN, and BUILTIN_builtin_unload when
            deleting it.  This allows<br>
                   loadable builtins to run initialization and cleanup
            code.<br>
            <br>
               c.  There is a new BASH_LOADABLES_PATH variable
            containing a list of directories<br>
                   where the `enable -f' command looks for shared
            objects containing loadable<br>
                   builtins.<br>
               --------------<br>
            <br>
            - The loadable builtins `uname' could not be parsed by
            rpmdeps correctly:<br>
               --------------<br>
               $ recipe-sysroot-native/usr/lib/<wbr>rpm/bin/rpmdeps-oecore
            --macros \<br>
               recipe-sysroot-native/usr/lib/<wbr>rpm/macros --define
            '_rpmfc_magic_path \<br>
               recipe-sysroot-native/usr/<wbr>share/misc/magic.mgc'
            --rpmpopt \<br>
               recipe-sysroot-native/usr/lib/<wbr>rpm/rpmpopt
            packages-split/bash/usr/lib64/<wbr>bash/uname<br>
            <br>
               |packages-split/bash/usr/<wbr>lib64/bash/uname Provides:
            )(64bit<br>
               |packages-split/bash/usr/<wbr>lib64/bash/uname Provides:
            elf(buildid) = 7186059a5a6b11ec38493b53072c3a<wbr>62edf7e05c<br>
               --------------<br>
            <br>
               The incorrected "Provides: )(64bit" could not be parsed
            by rpmbuild.<br>
               --------------<br>
               | DEBUG: Executing shell function BUILDSPEC<br>
               | error: line 56: Dependency ")(64bit" must begin with
            alpha-numeric, '_' or '/': Provides: )(64bit<br>
               | error: Package has no %description:
            bash-4.4-r0.core2_64<br>
               --------------<br>
            <br>
            Signed-off-by: Hongxu Jia &lt;<a moz-do-not-send="true"
              href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;<br>
            ---<br>
             ...e-builtins-uname-could-not-<wbr>be-parsed-by-r.patch |
            89 ++++++++++++++++++++++<br>
             meta/recipes-extended/bash/<a moz-do-not-send="true"
              href="http://bash_4.4.bb" rel="noreferrer" target="_blank">bas<wbr>h_4.4.bb</a> 
                       | 28 +++++++<br>
             2 files changed, 117 insertions(+)<br>
             create mode 100644 meta/recipes-extended/bash/<wbr>bash/0001-The-loadable-<wbr>builtins-uname-could-not-be-<wbr>parsed-by-r.patch<br>
            <br>
            diff --git a/meta/recipes-extended/bash/<wbr>bash/0001-The-loadable-<wbr>builtins-uname-could-not-be-<wbr>parsed-by-r.patch
            b/meta/recipes-extended/bash/<wbr>bash/0001-The-loadable-<wbr>builtins-uname-could-not-be-<wbr>parsed-by-r.patch<br>
            new file mode 100644<br>
            index 0000000..79d9e4e<br>
            --- /dev/null<br>
            +++ b/meta/recipes-extended/bash/<wbr>bash/0001-The-loadable-<wbr>builtins-uname-could-not-be-<wbr>parsed-by-r.patch<br>
            @@ -0,0 +1,89 @@<br>
            +rename uname to workaround name confliction in rpmnsProbe<br>
            +<br>
            +The loadable builtins `uname' could not be parsed by<br>
            +rpmdeps correctly:<br>
            +--------------<br>
            +$recipe-sysroot-native/usr/<wbr>lib/rpm/bin/rpmdeps-oecore
            --macros \<br>
            +recipe-sysroot-native/usr/<wbr>lib/rpm/macros --define
            '_rpmfc_magic_path \<br>
            +recipe-sysroot-native/usr/<wbr>share/misc/magic.mgc'
            --rpmpopt \<br>
            +recipe-sysroot-native/usr/<wbr>lib/rpm/rpmpopt
            packages-split/bash/usr/lib64/<wbr>bash/uname<br>
            +<br>
            +|packages-split/bash/usr/<wbr>lib64/bash/uname Provides:
            )(64bit<br>
            +|packages-split/bash/usr/<wbr>lib64/bash/uname Provides:
            elf(buildid) = 7186059a5a6b11ec38493b53072c3a<wbr>62edf7e05c<br>
            +--------------<br>
            +<br>
            +The incorrected "Provides: )(64bit" could not be parsed by
            rpmbuild.<br>
            +--------------<br>
            +| DEBUG: Executing shell function BUILDSPEC<br>
            +| error: line 56: Dependency ")(64bit" must begin with
            alpha-numeric, '_' or '/': Provides: )(64bit<br>
            +| error: Package has no %description: bash-4.4-r0.core2_64<br>
            +--------------<br>
            +<br>
            +The root cause is `uname' is incorrectly parsed by
            rpmnsProbe that string<br>
            +matches with "uname()(64bit)".<br>
            +<br>
            +The nsType of `uname' should be RPMNS_TYPE_NAMESPACE (like
            other utilities),<br>
            +rather than RPMNS_TYPE_UNAME which generates "Provides:
            )(64bit".<br>
            +<br>
            +We could not fix rpm-native without side effect. So rename
            to `uname-oe'<br>
            +and create a symlink `uname' could workaround the issue.<br>
            +<br>
            +Here is to load builtin uname in the target:<br>
            +----------------<br>
            +root@qemux86-64:# enable -f /usr/lib64/bash/uname uname<br>
            +root@qemux86-64:# help uname<br>
            +uname: uname [-amnrsv]<br>
            +    Display system information.<br>
            +<br>
            +    Display information about the system hardware and OS.<br>
            +----------------<br>
            +<br>
            +Upstream-Status: Inappropriate [oe specific]<br>
            +<br>
            +Signed-off-by: Hongxu Jia &lt;<a moz-do-not-send="true"
              href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;<br>
            +---<br>
            + examples/loadables/Makefile.in | 8 +++++---<br>
            + 1 file changed, 5 insertions(+), 3 deletions(-)<br>
            +<br>
            +diff --git a/examples/loadables/Makefile.<wbr>in
            b/examples/loadables/Makefile.<wbr>in<br>
            +index ec305cd..c7c96e2 100644<br>
            +--- a/examples/loadables/Makefile.<wbr>in<br>
            ++++ b/examples/loadables/Makefile.<wbr>in<br>
            +@@ -102,7 +102,7 @@ INC = -I. -I.. -I$(topdir)
            -I$(topdir)/lib -I$(topdir)/builtins -I${srcdir} \<br>
            +<br>
            + ALLPROG = print truefalse sleep finfo logname basename
            dirname \<br>
            +         tty pathchk tee head mkdir rmdir printenv id
            whoami \<br>
            +-        uname sync push ln unlink realpath strftime mypid
            setpgid<br>
            ++        uname-oe sync push ln unlink realpath strftime
            mypid setpgid<br>
            + OTHERPROG = necho hello cat pushd<br>
            +<br>
            + all:  $(SHOBJ_STATUS)<br>
            +@@ -178,7 +178,7 @@ id:        id.o<br>
            + whoami:       whoami.o<br>
            +       $(SHOBJ_LD) $(SHOBJ_LDFLAGS) $(SHOBJ_XLDFLAGS) -o $@
            whoami.o $(SHOBJ_LIBS)<br>
            +<br>
            +-uname:        uname.o<br>
            ++uname-oe:     uname.o<br>
            +       $(SHOBJ_LD) $(SHOBJ_LDFLAGS) $(SHOBJ_XLDFLAGS) -o $@
            uname.o $(SHOBJ_LIBS)<br>
            +<br>
            + sync: sync.o<br>
            +@@ -244,13 +244,15 @@ install-supported:       all
            installdirs install-dev<br>
            +               echo $$prog ; \<br>
            +               $(INSTALL_PROGRAM) $(INSTALLMODE) $$prog
            $(DESTDIR)$(loadablesdir)/$$<wbr>prog ;\<br>
            +       done<br>
            ++      -( cd $(DESTDIR)$(loadablesdir) &amp;&amp; ln -snf
            uname-oe uname)<br>
            ++<br>
            +<br>
            + uninstall-dev:<br>
            +       -$(RM) $(DESTDIR)$(loadablesdir)/<wbr>Makefile.inc<br>
            +       -( cd $(BUILD_DIR) &amp;&amp; ${MAKE} ${MFLAGS}
            DESTDIR="$(DESTDIR)" uninstall-headers)<br>
            +<br>
            + uninstall-supported:  uninstall-dev<br>
            +-      -( cd $(DESTDIR)${loadablesdir} &amp;&amp; $(RM)
            ${ALLPROG} )<br>
            ++      -( cd $(DESTDIR)${loadablesdir} &amp;&amp; $(RM)
            ${ALLPROG} uname)<br>
            +<br>
            + install-unsupported:<br>
            + uninstall-unsupported:<br>
            +--<br>
            +2.8.1<br>
            +<br>
            diff --git a/meta/recipes-extended/bash/<a
              moz-do-not-send="true" href="http://bash_4.4.bb"
              rel="noreferrer" target="_blank">b<wbr>ash_4.4.bb</a>
            b/meta/recipes-extended/bash/<a moz-do-not-send="true"
              href="http://bash_4.4.bb" rel="noreferrer" target="_blank">b<wbr>ash_4.4.bb</a><br>
            index 16ff114..798bfdb 100644<br>
            --- a/meta/recipes-extended/bash/<a moz-do-not-send="true"
              href="http://bash_4.4.bb" rel="noreferrer" target="_blank">b<wbr>ash_4.4.bb</a><br>
            +++ b/meta/recipes-extended/bash/<a moz-do-not-send="true"
              href="http://bash_4.4.bb" rel="noreferrer" target="_blank">b<wbr>ash_4.4.bb</a><br>
            @@ -10,6 +10,13 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.<wbr>gz;name=tarball
            \<br>
                        ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-003;apply=yes;<wbr>striplevel=0;name=patch003
            \<br>
                        ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-004;apply=yes;<wbr>striplevel=0;name=patch004
            \<br>
                        ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-005;apply=yes;<wbr>striplevel=0;name=patch005
            \<br>
            +           ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-006;apply=yes;<wbr>striplevel=0;name=patch006
            \<br>
            +           ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-007;apply=yes;<wbr>striplevel=0;name=patch007
            \<br>
            +           ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-008;apply=yes;<wbr>striplevel=0;name=patch008
            \<br>
            +           ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-009;apply=yes;<wbr>striplevel=0;name=patch009
            \<br>
            +           ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-010;apply=yes;<wbr>striplevel=0;name=patch010
            \<br>
            +           ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-011;apply=yes;<wbr>striplevel=0;name=patch011
            \<br>
            +           ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-012;apply=yes;<wbr>striplevel=0;name=patch012
            \<br>
                        <a class="moz-txt-link-freetext" href="file://execute_cmd.patch">file://execute_cmd.patch</a>;<wbr>striplevel=0 \<br>
                        <a class="moz-txt-link-freetext" href="file://mkbuiltins_have_">file://mkbuiltins_have_</a><wbr>stringize.patch \<br>
                        <a class="moz-txt-link-freetext" href="file://build-tests.patch">file://build-tests.patch</a> \<br>
            @@ -19,6 +26,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.<wbr>gz;name=tarball
            \<br>
                        <a class="moz-txt-link-freetext" href="file://fix-run-builtins.patch">file://fix-run-builtins.patch</a> \<br>
                        <a class="moz-txt-link-freetext" href="file://0001-help-fix-printf">file://0001-help-fix-printf</a>-<wbr>format-security-warning.patch
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0001-patch-to-obtain">file://0001-patch-to-obtain</a>-<wbr>pkgconfig-sanity.patch
            \<br>
            +           <a class="moz-txt-link-freetext" href="file://0001-The-loadable">file://0001-The-loadable</a>-<wbr>builtins-uname-could-not-be-<wbr>parsed-by-r.patch
            \<br>
                        "<br>
            <br>
             SRC_URI[tarball.md5sum] = "<wbr>148888a7c95ac23705559b6f477dfe<wbr>25"<br>
            @@ -34,5 +42,25 @@ SRC_URI[patch004.md5sum] = "<wbr>4557d674ab5831a5fa98052ab19eda<wbr>f4"<br>
             SRC_URI[patch004.sha256sum] = "<wbr>ad080a30a4ac6c1273373617f29628<wbr>cc320a35c8cd06913894794293dc52<wbr>c8b3"<br>
             SRC_URI[patch005.md5sum] = "<wbr>cce96dd77cdd1d293beec10848f6cb<wbr>b5"<br>
             SRC_URI[patch005.sha256sum] = "<wbr>221e4b725b770ad0bb6924df3f8d04<wbr>f89eeca4558f6e4c777dfa93e96709<wbr>0529"<br>
            +SRC_URI[patch006.md5sum] = "<wbr>d3379f8d8abce5c6ee338f931ad008<wbr>d5"<br>
            +SRC_URI[patch006.sha256sum] = "<wbr>6a8e2e2a6180d0f1ce39dcd651622f<wbr>b6d2fd05db7c459f64ae42d667f1e3<wbr>44b8"<br>
            +SRC_URI[patch007.md5sum] = "<wbr>ec38c76ca439ca7f9c178e9baede84<wbr>fc"<br>
            +SRC_URI[patch007.sha256sum] = "<wbr>de1ccc07b7bfc9e25243ad854f3bbb<wbr>5d3ebf9155b0477df16aaf00a7b0d5<wbr>edaf"<br>
            +SRC_URI[patch008.md5sum] = "<wbr>e0ba18c1e3b94f905da9b5bf9d38b5<wbr>8b"<br>
            +SRC_URI[patch008.sha256sum] = "<wbr>86144700465933636d7b945e89b77d<wbr>f95d3620034725be161ca0ca5a42e2<wbr>39ba"<br>
            +SRC_URI[patch009.md5sum] = "<wbr>e952d4f44e612048930c559d90eb99<wbr>bb"<br>
            +SRC_URI[patch009.sha256sum] = "<wbr>0b6bdd1a18a0d20e330cc3bc71e048<wbr>864e4a13652e29dc0ebf3918bea729<wbr>343c"<br>
            +SRC_URI[patch010.md5sum] = "<wbr>57b5b35955d68f9a09dbef6b86d2c7<wbr>82"<br>
            +SRC_URI[patch010.sha256sum] = "<wbr>8465c6f2c56afe559402265b39d9e9<wbr>4368954930f9aa7f3dfa6d36dd6686<wbr>8e06"<br>
            +SRC_URI[patch011.md5sum] = "<wbr>cc896e1fa696b93ded568e557e2392<wbr>d5"<br>
            +SRC_URI[patch011.sha256sum] = "<wbr>dd56426ef7d7295e1107c0b3d06c19<wbr>2eb9298f4023c202ca2ba6266c613d<wbr>170d"<br>
            +SRC_URI[patch012.md5sum] = "<wbr>fa47fbfa56fb7e9e5367f19a9df5fc<wbr>9e"<br>
            +SRC_URI[patch012.sha256sum] = "<wbr>fac271d2bf6372c9903e3b353cb9ed<wbr>a044d7fe36b5aab52f21f3f21cd6a2<wbr>063e"<br>
            <br>
             BBCLASSEXTEND = "nativesdk"<br>
            +<br>
            +PACKAGE_BEFORE_PN += "${PN}-loadable"<br>
            +RDEPENDS_${PN}-loadable += "${PN}"<br>
            +FILES_${PN}-dev += "${libdir}/bash/Makefile.inc"<br>
            +FILES_${PN}-loadable += "${libdir}/bash/*"<br>
            +<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.9.3<br>
                <br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------8E670DCC9D25F97330711567--
