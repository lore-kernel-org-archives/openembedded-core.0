Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E4FD719F7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 09:05:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2795wrN025853
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Mar 2017 01:05:58 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Mar 2017 01:05:57 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1487729362.git.hongxu.jia@windriver.com>
	<201beeaf42cc3c45681b7f5e92dc20cc3fb5470b.1487729362.git.hongxu.jia@windriver.com>
	<CAJTo0La0fk_cBY6fGJ2fyaOqsH6VgWNfEKVzahr+oBc9YRY4Zg@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <6abb7787-e24d-461d-9214-aaf1ffab9813@windriver.com>
Date: Tue, 7 Mar 2017 17:05:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La0fk_cBY6fGJ2fyaOqsH6VgWNfEKVzahr+oBc9YRY4Zg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bash: 4.3.30 -> 4.4
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
X-List-Received-Date: Tue, 07 Mar 2017 09:05:59 -0000
Content-Type: multipart/alternative;
	boundary="------------D99A35B4240758BC65068A1F"

--------------D99A35B4240758BC65068A1F
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年03月06日 23:32, Burton, Ross wrote:
> The loadable package is empty when I do a build, do these have some 
> floating build dependency?
>

Analysis the examples/loadables/Makefile.in, only if 
SHOBJ_STATUS="unsupported",
the do_install will not install loadable binaries.
------------------
[skip]
241 install-supported:      all installdirs install-dev
242         @echo installing example loadable builtins in 
$(DESTDIR)${loadablesdir}
243         @for prog in ${ALLPROG}; do \
244                 echo $$prog ; \
245                 $(INSTALL_PROGRAM) $(INSTALLMODE) $$prog 
$(DESTDIR)$(loadablesdir)/$$prog ;\
246         done
247         -( cd $(DESTDIR)$(loadablesdir) && ln -snf uname-oe uname)
[snip]
260 install:        install-$(SHOBJ_STATUS)
[skip]
-------------------

I could not reproduce the issue, could you tarball the workdir of bash and
send to me? I also need the local.conf of the build.

Let me see what has happened,

//Hongxu



> Ross
>
> On 22 February 2017 at 02:25, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com
>     <mailto:zhengrq.fnst@cn.fujitsu.com>>
>
>     1) Upgrade bash from 4.3.30 to 4.4
>     2) Delete 1 patche below, since they are integrated upstream.
>        fix-run-intl.patch
>     3) Modify 2 patches below to make it compatible with new version
>        fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
>        test-output.patch
>     4) Add 1 patche below to solve pkgconfig sanity error
>        0001-patch-to-obtain-pkgconfig-sanity.patch
>
>     Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com
>     <mailto:zhengrq.fnst@cn.fujitsu.com>>
>
>     5) Delete CVE-2016-9401.patch which backported from 4.4
>
>     6) Update patches from upstream to 4.4
>
>     7) Add ${PN}-loadable for loadable builtins which is new features
>     in Bash 4.4
>        --------------
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
>     8) Fix loadable builtins `uname' could not be parsed by rpmdeps
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
>      ...e-builtins-uname-could-not-be-parsed-by-r.patch |  89
>     +++++++++++++
>      .../0001-patch-to-obtain-pkgconfig-sanity.patch |  28 +++++
>      .../recipes-extended/bash/bash/CVE-2016-9401.patch |  50 --------
>      ...roc-run-heredoc-run-execscript-run-test-f.patch | 137
>     ++-------------------
>      meta/recipes-extended/bash/bash/fix-run-intl.patch | 110
>     -----------------
>      meta/recipes-extended/bash/bash/test-output.patch |  20 ++-
>      meta/recipes-extended/bash/bash_4.3.30.bb
>     <http://bash_4.3.30.bb>          |  72 -----------
>      meta/recipes-extended/bash/bash_4.4.bb <http://bash_4.4.bb>     
>            |  66 ++++++++++
>      8 files changed, 209 insertions(+), 363 deletions(-)
>      create mode 100644
>     meta/recipes-extended/bash/bash/0001-The-loadable-builtins-uname-could-not-be-parsed-by-r.patch
>      create mode 100644
>     meta/recipes-extended/bash/bash/0001-patch-to-obtain-pkgconfig-sanity.patch
>      delete mode 100644
>     meta/recipes-extended/bash/bash/CVE-2016-9401.patch
>      delete mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch
>      delete mode 100644 meta/recipes-extended/bash/bash_4.3.30.bb
>     <http://bash_4.3.30.bb>
>      create mode 100644 meta/recipes-extended/bash/bash_4.4.bb
>     <http://bash_4.4.bb>
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
>     diff --git
>     a/meta/recipes-extended/bash/bash/0001-patch-to-obtain-pkgconfig-sanity.patch
>     b/meta/recipes-extended/bash/bash/0001-patch-to-obtain-pkgconfig-sanity.patch
>     new file mode 100644
>     index 0000000..9b5e4ec
>     --- /dev/null
>     +++
>     b/meta/recipes-extended/bash/bash/0001-patch-to-obtain-pkgconfig-sanity.patch
>     @@ -0,0 +1,28 @@
>     +Subject: [PATCH] patch to obtain pkgconfig sanity
>     +
>     +Drop the paths from the pkgconfig file bash.pc.in
>     <http://bash.pc.in> which will cause pkgconfig sanity error below:
>     +ERROR: QA Issue: bash.pc failed sanity test (tmpdir) in path
>     /yocto/work001/fnst/zrq/community/poky/build/tmp/work/i586-poky-linux/bash
>       /4.4-r0/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
>     +
>     +Upstream-Status: Pending
>     +
>     +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com
>     <mailto:zhengrq.fnst@cn.fujitsu.com>>
>     +---
>     + support/bash.pc.in <http://bash.pc.in> | 2 --
>     + 1 file changed, 2 deletions(-)
>     +
>     +diff --git a/support/bash.pc.in <http://bash.pc.in>
>     b/support/bash.pc.in <http://bash.pc.in>
>     +index 6009659..871fa9f 100644
>     +--- a/support/bash.pc.in <http://bash.pc.in>
>     ++++ b/support/bash.pc.in <http://bash.pc.in>
>     +@@ -12,8 +12,6 @@ LOCAL_CFLAGS = @LOCAL_CFLAGS@
>     + LOCAL_DEFS = @LOCAL_DEFS@
>     + CCFLAGS = ${LOCAL_DEFS} ${LOCAL_CFLAGS}
>     +
>     +-CC = @CC@
>     +-SHOBJ_CC = @SHOBJ_CC@
>     + SHOBJ_CFLAGS = @SHOBJ_CFLAGS@
>     + SHOBJ_LD = @SHOBJ_LD@
>     + SHOBJ_LDFLAGS = @SHOBJ_LDFLAGS@
>     +--
>     +2.7.4
>     +
>     diff --git a/meta/recipes-extended/bash/bash/CVE-2016-9401.patch
>     b/meta/recipes-extended/bash/bash/CVE-2016-9401.patch
>     deleted file mode 100644
>     index 28c9277..0000000
>     --- a/meta/recipes-extended/bash/bash/CVE-2016-9401.patch
>     +++ /dev/null
>     @@ -1,50 +0,0 @@
>     -From fa741771ed47b30547be63b5b5dbfb51977aca12 Mon Sep 17 00:00:00
>     2001
>     -From: Chet Ramey <chet.ramey@case.edu <mailto:chet.ramey@case.edu>>
>     -Date: Fri, 20 Jan 2017 11:47:31 -0500
>     -Subject: [PATCH] Bash-4.4 patch 6
>     -
>     -Bug-Reference-URL:
>     -https://lists.gnu.org/archive/html/bug-bash/2016-11/msg00116.html
>     <https://lists.gnu.org/archive/html/bug-bash/2016-11/msg00116.html>
>     -
>     -Reference to upstream patch:
>     -https://ftp.gnu.org/pub/gnu/bash/bash-4.4-patches/bash44-006
>     <https://ftp.gnu.org/pub/gnu/bash/bash-4.4-patches/bash44-006>
>     -
>     -Bug-Description:
>     -Out-of-range negative offsets to popd can cause the shell to
>     crash attempting
>     -to free an invalid memory block.
>     -
>     -Upstream-Status: Backport
>     -CVE: CVE-2016-9401
>     -Signed-off-by: Li Zhou <li.zhou@windriver.com
>     <mailto:li.zhou@windriver.com>>
>     ----
>     - builtins/pushd.def | 7 ++++++-
>     - 1 file changed, 6 insertions(+), 1 deletion(-)
>     -
>     -diff --git a/builtins/pushd.def b/builtins/pushd.def
>     -index 9c6548f..8a13bae 100644
>     ---- a/builtins/pushd.def
>     -+++ b/builtins/pushd.def
>     -@@ -359,7 +359,7 @@ popd_builtin (list)
>     -       break;
>     -     }
>     -
>     --  if (which > directory_list_offset || (directory_list_offset ==
>     0 && which == 0))
>     -+  if (which > directory_list_offset || (which <
>     -directory_list_offset) || (directory_list_offset == 0 && which == 0))
>     -     {
>     -       pushd_error (directory_list_offset, which_word ?
>     which_word : "");
>     -       return (EXECUTION_FAILURE);
>     -@@ -381,6 +381,11 @@ popd_builtin (list)
>     -        remove that directory from the list and shift the remainder
>     -        of the list into place. */
>     -       i = (direction == '+') ? directory_list_offset - which :
>     which;
>     -+      if (i < 0 || i > directory_list_offset)
>     -+      {
>     -+        pushd_error (directory_list_offset, which_word ?
>     which_word : "");
>     -+        return (EXECUTION_FAILURE);
>     -+      }
>     -       free (pushd_directory_list[i]);
>     -       directory_list_offset--;
>     -
>     ---
>     -1.9.1
>     -
>     diff --git
>     a/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
>     b/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
>     index 7f099ae..d6beaff 100644
>     ---
>     a/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
>     +++
>     b/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
>     @@ -20,150 +20,35 @@ the test suite should not be run as root
>      Upstream-Status: Pending
>
>      Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com
>     <mailto:zhengrq.fnst@cn.fujitsu.com>>
>      ---
>     - tests/coproc.right   |  5 +----
>     - tests/coproc.tests   | 30 +++++++++++++++++++++++++-----
>     - tests/heredoc.right  |  5 ++---
>     - tests/heredoc3.sub   |  3 ++-
>     - tests/run-execscript |  3 ++-
>     - tests/run-test       |  3 ++-
>     - 6 files changed, 34 insertions(+), 15 deletions(-)
>     + tests/run-execscript | 3 ++-
>     + tests/run-test       | 3 ++-
>     + 2 files changed, 4 insertions(+), 2 deletions(-)
>
>     -diff --git a/tests/coproc.right b/tests/coproc.right
>     -index 6d9deaa..94b001c 100644
>     ---- a/tests/coproc.right
>     -+++ b/tests/coproc.right
>     -@@ -1,11 +1,8 @@
>     --84575
>     - 63 60
>     - a b c
>     --84577
>     - 63 60
>     - flop
>     --./coproc.tests: line 22: 84577 Terminated coproc REFLECT { cat -; }
>     --84579
>     -+coproc.tests: REFLECT: status 143
>     - 63 60
>     - FOO
>     - 63 60
>     -diff --git a/tests/coproc.tests b/tests/coproc.tests
>     -index 8be3563..d347eb7 100644
>     ---- a/tests/coproc.tests
>     -+++ b/tests/coproc.tests
>     -@@ -1,6 +1,13 @@
>     -+: ${TMPDIR:=/tmp}
>     -+TMPOUT=${TMPDIR}/coproc-wait-$BASHPID
>     -+
>     - coproc { echo a b c; sleep 2; }
>     -
>     --echo $COPROC_PID
>     -+case $COPROC_PID in
>     -+[0-9]*)       ;;
>     -+*)    echo COPROC_PID not integer ;;
>     -+esac
>     -+
>     - echo ${COPROC[@]}
>     -
>     - read LINE <&${COPROC[0]}
>     -@@ -10,7 +17,11 @@ wait $COPROC_PID
>     -
>     - coproc REFLECT { cat - ; }
>     -
>     --echo $REFLECT_PID
>     -+case $REFLECT_PID in
>     -+[0-9]*)       ;;
>     -+*)    echo REFLECT_PID not integer ;;
>     -+esac
>     -+
>     - echo ${REFLECT[@]}
>     -
>     - echo flop >&${REFLECT[1]}
>     -@@ -18,12 +29,21 @@ read LINE <&${REFLECT[0]}
>     -
>     - echo $LINE
>     -
>     --kill $REFLECT_PID
>     --wait $REFLECT_PID
>     -+{ sleep 1; kill $REFLECT_PID; } &
>     -+wait $REFLECT_PID >$TMPOUT 2>&1 || echo "coproc.tests: REFLECT:
>     status $?"
>     -+grep 'Terminated.*coproc.*REFLECT' < $TMPOUT >/dev/null 2>&1 || {
>     -+      echo "coproc.tests: wait for REFLECT failed" >&2
>     -+}
>     -+rm -f $TMPOUT
>     -+exec 2>&1
>     -
>     - coproc xcase -n -u
>     -
>     --echo $COPROC_PID
>     -+case $COPROC_PID in
>     -+[0-9]*)       ;;
>     -+*)    echo COPROC_PID not integer ;;
>     -+esac
>     -+
>     - echo ${COPROC[@]}
>     -
>     - echo foo >&${COPROC[1]}
>     -diff --git a/tests/heredoc.right b/tests/heredoc.right
>     -index 6abaa1f..8df91c5 100644
>     ---- a/tests/heredoc.right
>     -+++ b/tests/heredoc.right
>     -@@ -76,15 +76,14 @@ ENDEND
>     - end ENDEND
>     - hello
>     - end hello
>     --x star x
>     - end x*x
>     - helloEND
>     - end helloEND
>     - hello
>     - \END
>     - end hello<NL>\END
>     --./heredoc3.sub: line 74: warning: here-document at line 72
>     delimited by end-of-file (wanted `EOF')
>     --./heredoc3.sub: line 75: syntax error: unexpected end of file
>     -+./heredoc3.sub: line 75: warning: here-document at line 73
>     delimited by end-of-file (wanted `EOF')
>     -+./heredoc3.sub: line 76: syntax error: unexpected end of file
>     - comsub here-string
>     - ./heredoc.tests: line 105: warning: here-document at line 103
>     delimited by end-of-file (wanted `EOF')
>     - hi
>     -diff --git a/tests/heredoc3.sub b/tests/heredoc3.sub
>     -index 73a111e..9d3d846 100644
>     ---- a/tests/heredoc3.sub
>     -+++ b/tests/heredoc3.sub
>     -@@ -49,9 +49,10 @@ hello
>     -     END
>     - echo end hello
>     -
>     --cat <<x*x & touch 'x*x'
>     -+cat <<x*x >/dev/null & touch 'x*x'
>     - x star x
>     - x*x
>     -+wait $!
>     - echo end 'x*x'
>     - rm 'x*x'
>     -
>      diff --git a/tests/run-execscript b/tests/run-execscript
>     -index f97ab21..0d00a1b 100644
>     +index de78644..f7b075f 100644
>      --- a/tests/run-execscript
>      +++ b/tests/run-execscript
>      @@ -5,5 +5,6 @@ echo "warning: \`/tmp/bash-notthere' not being
>     found or \`/' being a directory"
>       echo "warning: produce diff output, please do not consider this
>     a test failure" >&2
>       echo "warning: if diff output differing only in the location of
>     the bash" >&2
>       echo "warning: binary appears, please do not consider this a
>     test failure" >&2
>     --${THIS_SH} ./execscript > /tmp/xx 2>&1
>     +-${THIS_SH} ./execscript > ${BASH_TSTOUT} 2>&1
>      +rm -f /tmp/xx
>      +su -c "${THIS_SH} ./execscript > /tmp/xx 2>&1" test
>     - diff /tmp/xx exec.right && rm -f /tmp/xx
>     + diff ${BASH_TSTOUT} exec.right && rm -f ${BASH_TSTOUT}
>      diff --git a/tests/run-test b/tests/run-test
>     -index b2482c3..2e8f049 100644
>     +index d68791c..699855f 100644
>      --- a/tests/run-test
>      +++ b/tests/run-test
>      @@ -1,4 +1,5 @@
>       unset GROUPS UID 2>/dev/null
>
>     --${THIS_SH} ./test.tests >/tmp/xx 2>&1
>     +-${THIS_SH} ./test.tests >${BASH_TSTOUT} 2>&1
>      +rm -f /tmp/xx
>      +su -c "${THIS_SH} ./test.tests >/tmp/xx 2>&1" test
>     - diff /tmp/xx test.right && rm -f /tmp/xx
>     + diff ${BASH_TSTOUT} test.right && rm -f ${BASH_TSTOUT}
>      --
>     -1.9.1
>     +2.7.4
>
>     diff --git a/meta/recipes-extended/bash/bash/fix-run-intl.patch
>     b/meta/recipes-extended/bash/bash/fix-run-intl.patch
>     deleted file mode 100644
>     index d4a3409..0000000
>     --- a/meta/recipes-extended/bash/bash/fix-run-intl.patch
>     +++ /dev/null
>     @@ -1,110 +0,0 @@
>     -From a00d3161fd7b6a698bdd2ed5f0ac5faac580ee2a Mon Sep 17 00:00:00
>     2001
>     -From: Dengke Du <dengke.du@windriver.com
>     <mailto:dengke.du@windriver.com>>
>     -Date: Wed, 3 Aug 2016 23:13:00 -0400
>     -Subject: [PATCH] fix run-intl failed
>     -
>     -1. Filter extra white space of intl.right
>     -
>     -   Due to the extra white space of intl.right, when the result of
>     -   sub-test unicode2.sub of intl.tests compared to it, the test
>     -   failed.
>     -
>     -   So we need to filter the extra white space of intl.right.
>     -
>     -   Import this patch for intl.right from bash devel branch:
>     -
>     - http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel
>     <http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel>
>     -
>     -   commit is:
>     -
>     -       85ec0778f9d778e1820fb8c0e3e996f2d1103b45
>     -
>     -2. Change intl.right correspond to the unicode3.sub's output
>     -
>     -   In sub-test unicode3.sub of intl.tests, the payload value is:
>     -
>     -     
>      payload=$'\065\247\100\063\231\053\306\123\070\237\242\352\263'
>     -
>     -   It used quoted string expansion(escaped octal) to assign ASCII
>     -   characters to variables. So when the test run the following:
>     -
>     -       printf %q "$payload"
>     -
>     -   It produced:
>     -
>     -       $'5\247@3\231+\306S8\237\242\352\263'
>     -
>     -   When compared to the intl.right(contain the converted
>     character), it failed.
>     -
>     -   Import parts of patch for intl.right from bash devel branch:
>     -
>     - http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel
>     <http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel>
>     -
>     -   commit is:
>     -
>     -       74b8cbb41398b4453d8ba04d0cdd1b25f9dcb9e3
>     -
>     -Upstream-Status: Backport
>     -
>     -Signed-off-by: Dengke Du <dengke.du@windriver.com
>     <mailto:dengke.du@windriver.com>>
>     ----
>     - tests/intl.right | 30 +++++++++++++++---------------
>     - 1 file changed, 15 insertions(+), 15 deletions(-)
>     -
>     -diff --git a/tests/intl.right b/tests/intl.right
>     -index acf108a..1efdfbe 100644
>     ---- a/tests/intl.right
>     -+++ b/tests/intl.right
>     -@@ -18,34 +18,34 @@ aÃ©b
>     - 1.0000
>     - 1,0000
>     - Passed all 1378 Unicode tests
>     --0000000   303 277 012
>     -+0000000 303 277 012
>     - 0000003
>     --0000000   303 277 012
>     -+0000000 303 277 012
>     - 0000003
>     --0000000   303 277 012
>     -+0000000 303 277 012
>     - 0000003
>     --0000000   303 277 012
>     -+0000000 303 277 012
>     - 0000003
>     --0000000   357 277 277 012
>     -+0000000 357 277 277 012
>     - 0000004
>     --0000000   357 277 277 012
>     -+0000000 357 277 277 012
>     - 0000004
>     --0000000   012
>     -+0000000 012
>     - 0000001
>     --0000000   012
>     -+0000000 012
>     - 0000001
>     --0000000   012
>     -+0000000 012
>     - 0000001
>     --0000000   012
>     -+0000000 012
>     - 0000001
>     --0000000   303 277 012
>     -+0000000 303 277 012
>     - 0000003
>     --0000000   303 277 012
>     -+0000000 303 277 012
>     - 0000003
>     --0000000   303 277 012
>     -+0000000 303 277 012
>     - 0000003
>     --0000000   101 040 302 243 040 305 222 012
>     -+0000000 101 040 302 243 040 305 222 012
>     - 0000010
>     - ./unicode3.sub: line 2: 5§@3™+ÆS8Ÿ¢ê³: command not found
>     --5§@3™+ÆS8Ÿ¢ê³
>     -+$'5\247@3\231+\306S8\237\242\352\263'
>     - + : $'5\247@3\231+\306S8\237\242\352\263'
>     ---
>     -2.8.1
>     -
>     diff --git a/meta/recipes-extended/bash/bash/test-output.patch
>     b/meta/recipes-extended/bash/bash/test-output.patch
>     index 2b09b7d..652ffb1 100644
>     --- a/meta/recipes-extended/bash/bash/test-output.patch
>     +++ b/meta/recipes-extended/bash/bash/test-output.patch
>     @@ -2,15 +2,21 @@ Add FAIL/PASS output to test output.
>
>      Signed-off-by: BjÃ¶rn Stenberg <bjst@enea.com <mailto:bjst@enea.com>>
>      Upstream-Status: Pending
>     +
>     +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com
>     <mailto:zhengrq.fnst@cn.fujitsu.com>>
>      ---
>     -diff -uNr a/tests/run-all b/tests/run-all
>     ---- a/tests/run-all    1999-10-08 17:07:46.000000000 +0200
>     -+++ b/tests/run-all    2012-10-27 21:04:18.663331887
>     <tel:18.663331887> +0200
>     -@@ -22,7 +22,15 @@
>     + tests/run-all | 11 ++++++++++-
>     + 1 file changed, 10 insertions(+), 1 deletion(-)
>     +
>     +diff --git a/tests/run-all b/tests/run-all
>     +index 2882fe0..069dbbe 100644
>     +--- a/tests/run-all
>     ++++ b/tests/run-all
>     +@@ -33,7 +33,16 @@ do
>             case $x in
>             $0|run-minimal|run-gprof)       ;;
>             *.orig|*~) ;;
>     --      *)      echo $x ; sh $x ;;
>     +-      *)      echo $x ; sh $x ; rm -f ${BASH_TSTOUT} ;;
>      +    *)  echo $x
>      +         output=`sh $x`
>      +         if [ -n "$output" ]; then
>     @@ -19,7 +25,11 @@ diff -uNr a/tests/run-all b/tests/run-all
>      +         else
>      +             echo "PASS: $x"
>      +         fi
>     ++         rm -f ${BASH_TSTOUT}
>      +         ;;
>             esac
>       done
>
>     +--
>     +2.7.4
>     +
>     diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb
>     <http://bash_4.3.30.bb>
>     b/meta/recipes-extended/bash/bash_4.3.30.bb <http://bash_4.3.30.bb>
>     deleted file mode 100644
>     index e398e87..0000000
>     --- a/meta/recipes-extended/bash/bash_4.3.30.bb
>     <http://bash_4.3.30.bb>
>     +++ /dev/null
>     @@ -1,72 +0,0 @@
>     -require bash.inc
>     -
>     -# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
>     -LICENSE = "GPLv3+"
>     -LIC_FILES_CHKSUM =
>     "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>     -
>     -SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-031;apply=yes;striplevel=0;name=patch031
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-032;apply=yes;striplevel=0;name=patch032
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-033;apply=yes;striplevel=0;name=patch033
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-034;apply=yes;striplevel=0;name=patch034
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-035;apply=yes;striplevel=0;name=patch035
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-036;apply=yes;striplevel=0;name=patch036
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-037;apply=yes;striplevel=0;name=patch037
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-038;apply=yes;striplevel=0;name=patch038
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-039;apply=yes;striplevel=0;name=patch039
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-040;apply=yes;striplevel=0;name=patch040
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-041;apply=yes;striplevel=0;name=patch041
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-042;apply=yes;striplevel=0;name=patch042
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-043;apply=yes;striplevel=0;name=patch043
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-044;apply=yes;striplevel=0;name=patch044
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-045;apply=yes;striplevel=0;name=patch045
>     \
>     -         
>      ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-046;apply=yes;striplevel=0;name=patch046
>     \
>     -           file://execute_cmd.patch;striplevel=0 \
>     -           file://mkbuiltins_have_stringize.patch \
>     -           file://build-tests.patch \
>     -           file://test-output.patch \
>     -         
>      file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
>     -           file://run-ptest \
>     -           file://fix-run-builtins.patch \
>     -         
>      file://0001-help-fix-printf-format-security-warning.patch \
>     -           file://fix-run-intl.patch \
>     -           file://CVE-2016-9401.patch \
>     -           "
>     -
>     -SRC_URI[tarball.md5sum] = "a27b3ee9be83bd3ba448c0ff52b28447"
>     -SRC_URI[tarball.sha256sum] =
>     "317881019bbf2262fb814b7dd8e40632d13c3608d2f237800a8828fbb8a640dd"
>     -
>     -SRC_URI[patch031.md5sum] = "236df1ac1130a033ed0dbe2d2115f28f"
>     -SRC_URI[patch031.sha256sum] =
>     "cd529f59dd0f2fdd49d619fe34691da6f0affedf87cc37cd460a9f3fe812a61d"
>     -SRC_URI[patch032.md5sum] = "2360f7e79cfb28526f80021025ea5909"
>     -SRC_URI[patch032.sha256sum] =
>     "889357d29a6005b2c3308ca5b6286cb223b5e9c083219e5db3156282dd554f4a"
>     -SRC_URI[patch033.md5sum] = "b551c4ee7b8713759e4143499d0bbd48"
>     -SRC_URI[patch033.sha256sum] =
>     "fb2a7787a13fbe027a7335aca6eb3c21cdbd813e9edc221274b6a9d8692eaa16"
>     -SRC_URI[patch034.md5sum] = "c9a56fbe0348e05a886dff97f2872b74"
>     -SRC_URI[patch034.sha256sum] =
>     "f1694f04f110defe1330a851cc2768e7e57ddd2dfdb0e3e350ca0e3c214ff889"
>     -SRC_URI[patch035.md5sum] = "e564e8ab44ed1ca3a4e315a9f6cabdc9"
>     -SRC_URI[patch035.sha256sum] =
>     "370d85e51780036f2386dc18c5efe996eba8e652fc1973f0f4f2ab55a993c1e3"
>     -SRC_URI[patch036.md5sum] = "b00ff66c41a7c0f06e191200981980b0"
>     -SRC_URI[patch036.sha256sum] =
>     "ac5f82445b36efdb543dbfae64afed63f586d7574b833e9aa9cd5170bc5fd27c"
>     -SRC_URI[patch037.md5sum] = "be2a7b05f6ae560313f3c9d5f7127bda"
>     -SRC_URI[patch037.sha256sum] =
>     "33f170dd7400ab3418d749c55c6391b1d161ef2de7aced1873451b3a3fca5813"
>     -SRC_URI[patch038.md5sum] = "61e0522830b24fbe8c0d1b010f132470"
>     -SRC_URI[patch038.sha256sum] =
>     "adbeaa500ca7a82535f0e88d673661963f8a5fcdc7ad63445e68bf5b49786367"
>     -SRC_URI[patch039.md5sum] = "a4775487abe958536751c8ce53cdf6f9"
>     -SRC_URI[patch039.sha256sum] =
>     "ab94dced2215541097691f60c3eb323cc28ef2549463e6a5334bbcc1e61e74ec"
>     -SRC_URI[patch040.md5sum] = "80d3587c58854e226055ef099ffeb535"
>     -SRC_URI[patch040.sha256sum] =
>     "84bb396b9262992ca5424feab6ed3ec39f193ef5c76dfe4a62b551bd8dd9d76b"
>     -SRC_URI[patch041.md5sum] = "20bf63eef7cb441c0b1cc49ef3191d03"
>     -SRC_URI[patch041.sha256sum] =
>     "4ec432966e4198524a7e0cd685fe222e96043769c9613e66742ac475db132c1a"
>     -SRC_URI[patch042.md5sum] = "70790646ae61e207c995e44931390e50"
>     -SRC_URI[patch042.sha256sum] =
>     "ac219322db2791da87a496ee6e8e5544846494bdaaea2626270c2f73c1044919"
>     -SRC_URI[patch043.md5sum] = "855a46955cb251534e80b4732b748e37"
>     -SRC_URI[patch043.sha256sum] =
>     "47a8a3c005b46e25821f4d8f5ccb04c1d653b1c829cb40568d553dc44f7a6180"
>     -SRC_URI[patch044.md5sum] = "29623d3282fcbb37e1158136509b5bb8"
>     -SRC_URI[patch044.sha256sum] =
>     "9338820630bf67373b44d8ea68409f65162ea7a47b9b29ace06a0aed12567f99"
>     -SRC_URI[patch045.md5sum] = "4473244ca5abfd4b018ea26dc73e7412"
>     -SRC_URI[patch045.sha256sum] =
>     "ba6ec3978e9eaa1eb3fabdaf3cc6fdf8c4606ac1c599faaeb4e2d69864150023"
>     -SRC_URI[patch046.md5sum] = "7e5fb09991c077076b86e0e057798913"
>     -SRC_URI[patch046.sha256sum] =
>     "b3b456a6b690cd293353f17e22d92a202b3c8bce587ae5f2667c20c9ab6f688f"
>     -
>     -BBCLASSEXTEND = "nativesdk"
>     diff --git a/meta/recipes-extended/bash/bash_4.4.bb
>     <http://bash_4.4.bb> b/meta/recipes-extended/bash/bash_4.4.bb
>     <http://bash_4.4.bb>
>     new file mode 100644
>     index 0000000..798bfdb
>     --- /dev/null
>     +++ b/meta/recipes-extended/bash/bash_4.4.bb <http://bash_4.4.bb>
>     @@ -0,0 +1,66 @@
>     +require bash.inc
>     +
>     +# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
>     +LICENSE = "GPLv3+"
>     +LIC_FILES_CHKSUM =
>     "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>     +
>     +SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
>     +         
>      ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-001;apply=yes;striplevel=0;name=patch001
>     \
>     +         
>      ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-002;apply=yes;striplevel=0;name=patch002
>     \
>     +         
>      ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-003;apply=yes;striplevel=0;name=patch003
>     \
>     +         
>      ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-004;apply=yes;striplevel=0;name=patch004
>     \
>     +         
>      ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-005;apply=yes;striplevel=0;name=patch005
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
>     +           file://execute_cmd.patch;striplevel=0 \
>     +           file://mkbuiltins_have_stringize.patch \
>     +           file://build-tests.patch \
>     +           file://test-output.patch  \
>     +         
>      file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
>     +           file://run-ptest \
>     +           file://fix-run-builtins.patch \
>     +         
>      file://0001-help-fix-printf-format-security-warning.patch \
>     +           file://0001-patch-to-obtain-pkgconfig-sanity.patch \
>     +         
>      file://0001-The-loadable-builtins-uname-could-not-be-parsed-by-r.patch
>     \
>     +           "
>     +
>     +SRC_URI[tarball.md5sum] = "148888a7c95ac23705559b6f477dfe25"
>     +SRC_URI[tarball.sha256sum] =
>     "d86b3392c1202e8ff5a423b302e6284db7f8f435ea9f39b5b1b20fd3ac36dfcb"
>     +
>     +SRC_URI[patch001.md5sum] = "817d01a6c0af6f79308a8b7b649e53d8"
>     +SRC_URI[patch001.sha256sum] =
>     "3e28d91531752df9a8cb167ad07cc542abaf944de9353fe8c6a535c9f1f17f0f"
>     +SRC_URI[patch002.md5sum] = "765e14cff12c7284009772e8e24f2fe0"
>     +SRC_URI[patch002.sha256sum] =
>     "7020a0183e17a7233e665b979c78c184ea369cfaf3e8b4b11f5547ecb7c13c53"
>     +SRC_URI[patch003.md5sum] = "49e7da93bf07f510a2eb6bb43ac3e5a2"
>     +SRC_URI[patch003.sha256sum] =
>     "51df5a9192fdefe0ddca4bdf290932f74be03ffd0503a3d112e4199905e718b2"
>     +SRC_URI[patch004.md5sum] = "4557d674ab5831a5fa98052ab19edaf4"
>     +SRC_URI[patch004.sha256sum] =
>     "ad080a30a4ac6c1273373617f29628cc320a35c8cd06913894794293dc52c8b3"
>     +SRC_URI[patch005.md5sum] = "cce96dd77cdd1d293beec10848f6cbb5"
>     +SRC_URI[patch005.sha256sum] =
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
>     +
>     +BBCLASSEXTEND = "nativesdk"
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


--------------D99A35B4240758BC65068A1F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2017年03月06日 23:32, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0La0fk_cBY6fGJ2fyaOqsH6VgWNfEKVzahr+oBc9YRY4Zg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div>The loadable package is empty when I do a build, do these
          have some floating build dependency?</div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <br>
    Analysis the examples/loadables/Makefile.in, only if
    SHOBJ_STATUS="unsupported",<br>
    the do_install will not install loadable binaries.<br>
    ------------------<br>
    [skip]<br>
    241 install-supported:      all installdirs install-dev<br>
    242         @echo installing example loadable builtins in
    $(DESTDIR)${loadablesdir}<br>
    243         @for prog in ${ALLPROG}; do \<br>
    244                 echo $$prog ; \<br>
    245                 $(INSTALL_PROGRAM) $(INSTALLMODE) $$prog
    $(DESTDIR)$(loadablesdir)/$$prog ;\<br>
    246         done<br>
    247         -( cd $(DESTDIR)$(loadablesdir) &amp;&amp; ln -snf
    uname-oe uname)<br>
    [snip]<br>
    260 install:        install-$(SHOBJ_STATUS)<br>
    [skip]<br>
    -------------------<br>
    <br>
    I could not reproduce the issue, could you tarball the workdir of
    bash and<br>
    send to me? I also need the local.conf of the build.<br>
    <br>
    Let me see what has happened, <br>
    <br>
    //Hongxu<br>
    <br>
    <br>
    <br>
    <blockquote
cite="mid:CAJTo0La0fk_cBY6fGJ2fyaOqsH6VgWNfEKVzahr+oBc9YRY4Zg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 22 February 2017 at 02:25, Hongxu
          Jia <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
            Zheng Ruoqin &lt;<a moz-do-not-send="true"
              href="mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
            <br>
            1) Upgrade bash from 4.3.30 to 4.4<br>
            2) Delete 1 patche below, since they are integrated
            upstream.<br>
               fix-run-intl.patch<br>
            3) Modify 2 patches below to make it compatible with new
            version<br>
               fix-run-coproc-run-heredoc-<wbr>run-execscript-run-test-f.<wbr>patch<br>
               test-output.patch<br>
            4) Add 1 patche below to solve pkgconfig sanity error<br>
               0001-patch-to-obtain-<wbr>pkgconfig-sanity.patch<br>
            <br>
            Signed-off-by: Zheng Ruoqin &lt;<a moz-do-not-send="true"
              href="mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
            <br>
            5) Delete CVE-2016-9401.patch which backported from 4.4<br>
            <br>
            6) Update patches from upstream to 4.4<br>
            <br>
            7) Add ${PN}-loadable for loadable builtins which is new
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
            8) Fix loadable builtins `uname' could not be parsed by
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
            <span class=""> ...e-builtins-uname-could-not-<wbr>be-parsed-by-r.patch
              |  89 +++++++++++++<br>
               .../0001-patch-to-obtain-<wbr>pkgconfig-sanity.patch   
              |  28 +++++<br>
               .../recipes-extended/bash/<wbr>bash/CVE-2016-9401.patch
              |  50 --------<br>
               ...roc-run-heredoc-run-<wbr>execscript-run-test-f.patch |
              137 ++-------------------<br>
               meta/recipes-extended/bash/<wbr>bash/fix-run-intl.patch |
              110 -----------------<br>
               meta/recipes-extended/bash/<wbr>bash/test-output.patch 
              |  20 ++-<br>
               meta/recipes-extended/bash/<a moz-do-not-send="true"
                href="http://bash_4.3.30.bb" rel="noreferrer"
                target="_blank">bas<wbr>h_4.3.30.bb</a>          |  72
              -----------<br>
               meta/recipes-extended/bash/<a moz-do-not-send="true"
                href="http://bash_4.4.bb" rel="noreferrer"
                target="_blank">bas<wbr>h_4.4.bb</a>             |  66
              ++++++++++<br>
               8 files changed, 209 insertions(+), 363 deletions(-)<br>
               create mode 100644 meta/recipes-extended/bash/<wbr>bash/0001-The-loadable-<wbr>builtins-uname-could-not-be-<wbr>parsed-by-r.patch<br>
               create mode 100644 meta/recipes-extended/bash/<wbr>bash/0001-patch-to-obtain-<wbr>pkgconfig-sanity.patch<br>
               delete mode 100644 meta/recipes-extended/bash/<wbr>bash/CVE-2016-9401.patch<br>
               delete mode 100644 meta/recipes-extended/bash/<wbr>bash/fix-run-intl.patch<br>
               delete mode 100644 meta/recipes-extended/bash/<a
                moz-do-not-send="true" href="http://bash_4.3.30.bb"
                rel="noreferrer" target="_blank">bas<wbr>h_4.3.30.bb</a><br>
               create mode 100644 meta/recipes-extended/bash/<a
                moz-do-not-send="true" href="http://bash_4.4.bb"
                rel="noreferrer" target="_blank">bas<wbr>h_4.4.bb</a><br>
              <br>
            </span>diff --git a/meta/recipes-extended/bash/<wbr>bash/0001-The-loadable-<wbr>builtins-uname-could-not-be-<wbr>parsed-by-r.patch
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
            diff --git a/meta/recipes-extended/bash/<wbr>bash/0001-patch-to-obtain-<wbr>pkgconfig-sanity.patch
            b/meta/recipes-extended/bash/<wbr>bash/0001-patch-to-obtain-<wbr>pkgconfig-sanity.patch<br>
            new file mode 100644<br>
            index 0000000..9b5e4ec<br>
            --- /dev/null<br>
            +++ b/meta/recipes-extended/bash/<wbr>bash/0001-patch-to-obtain-<wbr>pkgconfig-sanity.patch<br>
            @@ -0,0 +1,28 @@<br>
            +Subject: [PATCH] patch to obtain pkgconfig sanity<br>
            +<br>
            +Drop the paths from the pkgconfig file <a
              moz-do-not-send="true" href="http://bash.pc.in"
              rel="noreferrer" target="_blank">bash.pc.in</a> which will
            cause pkgconfig sanity error below:<br>
            +ERROR: QA Issue: bash.pc failed sanity test (tmpdir) in
            path /yocto/work001/fnst/zrq/<wbr>community/poky/build/tmp/work/<wbr>i586-poky-linux/bash 
              /4.4-r0/sysroot-destdir/usr/<wbr>lib/pkgconfig [pkgconfig]<br>
            +<br>
            +Upstream-Status: Pending<br>
            +<br>
            +Signed-off-by: Zheng Ruoqin &lt;<a moz-do-not-send="true"
              href="mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
            +---<br>
            + support/<a moz-do-not-send="true" href="http://bash.pc.in"
              rel="noreferrer" target="_blank">bash.pc.in</a> | 2 --<br>
            + 1 file changed, 2 deletions(-)<br>
            +<br>
            +diff --git a/support/<a moz-do-not-send="true"
              href="http://bash.pc.in" rel="noreferrer" target="_blank">bash.pc.in</a>
            b/support/<a moz-do-not-send="true" href="http://bash.pc.in"
              rel="noreferrer" target="_blank">bash.pc.in</a><br>
            +index 6009659..871fa9f 100644<br>
            +--- a/support/<a moz-do-not-send="true"
              href="http://bash.pc.in" rel="noreferrer" target="_blank">bash.pc.in</a><br>
            ++++ b/support/<a moz-do-not-send="true"
              href="http://bash.pc.in" rel="noreferrer" target="_blank">bash.pc.in</a><br>
            +@@ -12,8 +12,6 @@ LOCAL_CFLAGS = @LOCAL_CFLAGS@<br>
            + LOCAL_DEFS = @LOCAL_DEFS@<br>
            + CCFLAGS = ${LOCAL_DEFS} ${LOCAL_CFLAGS}<br>
            +<br>
            +-CC = @CC@<br>
            +-SHOBJ_CC = @SHOBJ_CC@<br>
            + SHOBJ_CFLAGS = @SHOBJ_CFLAGS@<br>
            + SHOBJ_LD = @SHOBJ_LD@<br>
            + SHOBJ_LDFLAGS = @SHOBJ_LDFLAGS@<br>
            +--<br>
            +2.7.4<br>
            +<br>
            diff --git a/meta/recipes-extended/bash/<wbr>bash/CVE-2016-9401.patch
            b/meta/recipes-extended/bash/<wbr>bash/CVE-2016-9401.patch<br>
            deleted file mode 100644<br>
            index 28c9277..0000000<br>
            --- a/meta/recipes-extended/bash/<wbr>bash/CVE-2016-9401.patch<br>
            +++ /dev/null<br>
            @@ -1,50 +0,0 @@<br>
            -From fa741771ed47b30547be63b5b5dbfb<wbr>51977aca12 Mon Sep
            17 00:00:00 2001<br>
            -From: Chet Ramey &lt;<a moz-do-not-send="true"
              href="mailto:chet.ramey@case.edu">chet.ramey@case.edu</a>&gt;<br>
            -Date: Fri, 20 Jan 2017 11:47:31 -0500<br>
            -Subject: [PATCH] Bash-4.4 patch 6<br>
            -<br>
            -Bug-Reference-URL:<br>
            -<a moz-do-not-send="true"
              href="https://lists.gnu.org/archive/html/bug-bash/2016-11/msg00116.html"
              rel="noreferrer" target="_blank">https://lists.gnu.org/<wbr>archive/html/bug-bash/2016-11/<wbr>msg00116.html</a><br>
            -<br>
            -Reference to upstream patch:<br>
            -<a moz-do-not-send="true"
              href="https://ftp.gnu.org/pub/gnu/bash/bash-4.4-patches/bash44-006"
              rel="noreferrer" target="_blank">https://ftp.gnu.org/pub/gnu/<wbr>bash/bash-4.4-patches/bash44-<wbr>006</a><br>
            -<br>
            -Bug-Description:<br>
            -Out-of-range negative offsets to popd can cause the shell
            to crash attempting<br>
            -to free an invalid memory block.<br>
            -<br>
            -Upstream-Status: Backport<br>
            -CVE: CVE-2016-9401<br>
            -Signed-off-by: Li Zhou &lt;<a moz-do-not-send="true"
              href="mailto:li.zhou@windriver.com">li.zhou@windriver.com</a>&gt;<br>
            ----<br>
            - builtins/pushd.def | 7 ++++++-<br>
            - 1 file changed, 6 insertions(+), 1 deletion(-)<br>
            -<br>
            -diff --git a/builtins/pushd.def b/builtins/pushd.def<br>
            -index 9c6548f..8a13bae 100644<br>
            ---- a/builtins/pushd.def<br>
            -+++ b/builtins/pushd.def<br>
            -@@ -359,7 +359,7 @@ popd_builtin (list)<br>
            -       break;<br>
            -     }<br>
            -<br>
            --  if (which &gt; directory_list_offset ||
            (directory_list_offset == 0 &amp;&amp; which == 0))<br>
            -+  if (which &gt; directory_list_offset || (which &lt;
            -directory_list_offset) || (directory_list_offset == 0
            &amp;&amp; which == 0))<br>
            -     {<br>
            -       pushd_error (directory_list_offset, which_word ?
            which_word : "");<br>
            -       return (EXECUTION_FAILURE);<br>
            -@@ -381,6 +381,11 @@ popd_builtin (list)<br>
            -        remove that directory from the list and shift the
            remainder<br>
            -        of the list into place. */<br>
            -       i = (direction == '+') ? directory_list_offset -
            which : which;<br>
            -+      if (i &lt; 0 || i &gt; directory_list_offset)<br>
            -+      {<br>
            -+        pushd_error (directory_list_offset, which_word ?
            which_word : "");<br>
            -+        return (EXECUTION_FAILURE);<br>
            -+      }<br>
            -       free (pushd_directory_list[i]);<br>
            -       directory_list_offset--;<br>
            -<br>
            ---<br>
            -1.9.1<br>
            -<br>
            diff --git a/meta/recipes-extended/bash/<wbr>bash/fix-run-coproc-run-<wbr>heredoc-run-execscript-run-<wbr>test-f.patch
            b/meta/recipes-extended/bash/<wbr>bash/fix-run-coproc-run-<wbr>heredoc-run-execscript-run-<wbr>test-f.patch<br>
            index 7f099ae..d6beaff 100644<br>
            --- a/meta/recipes-extended/bash/<wbr>bash/fix-run-coproc-run-<wbr>heredoc-run-execscript-run-<wbr>test-f.patch<br>
            +++ b/meta/recipes-extended/bash/<wbr>bash/fix-run-coproc-run-<wbr>heredoc-run-execscript-run-<wbr>test-f.patch<br>
            @@ -20,150 +20,35 @@ the test suite should not be run as
            root<br>
             Upstream-Status: Pending<br>
            <br>
             Signed-off-by: Hongxu Jia &lt;<a moz-do-not-send="true"
              href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;<br>
            +Signed-off-by: Zheng Ruoqin &lt;<a moz-do-not-send="true"
              href="mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
             ---<br>
            - tests/coproc.right   |  5 +----<br>
            - tests/coproc.tests   | 30 +++++++++++++++++++++++++-----<br>
            - tests/heredoc.right  |  5 ++---<br>
            - tests/heredoc3.sub   |  3 ++-<br>
            - tests/run-execscript |  3 ++-<br>
            - tests/run-test       |  3 ++-<br>
            - 6 files changed, 34 insertions(+), 15 deletions(-)<br>
            + tests/run-execscript | 3 ++-<br>
            + tests/run-test       | 3 ++-<br>
            + 2 files changed, 4 insertions(+), 2 deletions(-)<br>
            <br>
            -diff --git a/tests/coproc.right b/tests/coproc.right<br>
            -index 6d9deaa..94b001c 100644<br>
            ---- a/tests/coproc.right<br>
            -+++ b/tests/coproc.right<br>
            -@@ -1,11 +1,8 @@<br>
            --84575<br>
            - 63 60<br>
            - a b c<br>
            --84577<br>
            - 63 60<br>
            - flop<br>
            --./coproc.tests: line 22: 84577 Terminated             
            coproc REFLECT { cat -; }<br>
            --84579<br>
            -+coproc.tests: REFLECT: status 143<br>
            - 63 60<br>
            - FOO<br>
            - 63 60<br>
            -diff --git a/tests/coproc.tests b/tests/coproc.tests<br>
            -index 8be3563..d347eb7 100644<br>
            ---- a/tests/coproc.tests<br>
            -+++ b/tests/coproc.tests<br>
            -@@ -1,6 +1,13 @@<br>
            -+: ${TMPDIR:=/tmp}<br>
            -+TMPOUT=${TMPDIR}/coproc-<wbr>wait-$BASHPID<br>
            -+<br>
            - coproc { echo a b c; sleep 2; }<br>
            -<br>
            --echo $COPROC_PID<br>
            -+case $COPROC_PID in<br>
            -+[0-9]*)       ;;<br>
            -+*)    echo COPROC_PID not integer ;;<br>
            -+esac<br>
            -+<br>
            - echo ${COPROC[@]}<br>
            -<br>
            - read LINE &lt;&amp;${COPROC[0]}<br>
            -@@ -10,7 +17,11 @@ wait $COPROC_PID<br>
            -<br>
            - coproc REFLECT { cat - ; }<br>
            -<br>
            --echo $REFLECT_PID<br>
            -+case $REFLECT_PID in<br>
            -+[0-9]*)       ;;<br>
            -+*)    echo REFLECT_PID not integer ;;<br>
            -+esac<br>
            -+<br>
            - echo ${REFLECT[@]}<br>
            -<br>
            - echo flop &gt;&amp;${REFLECT[1]}<br>
            -@@ -18,12 +29,21 @@ read LINE &lt;&amp;${REFLECT[0]}<br>
            -<br>
            - echo $LINE<br>
            -<br>
            --kill $REFLECT_PID<br>
            --wait $REFLECT_PID<br>
            -+{ sleep 1; kill $REFLECT_PID; } &amp;<br>
            -+wait $REFLECT_PID &gt;$TMPOUT 2&gt;&amp;1 || echo
            "coproc.tests: REFLECT: status $?"<br>
            -+grep 'Terminated.*coproc.*REFLECT' &lt; $TMPOUT
            &gt;/dev/null 2&gt;&amp;1 || {<br>
            -+      echo "coproc.tests: wait for REFLECT failed"
            &gt;&amp;2<br>
            -+}<br>
            -+rm -f $TMPOUT<br>
            -+exec 2&gt;&amp;1<br>
            -<br>
            - coproc xcase -n -u<br>
            -<br>
            --echo $COPROC_PID<br>
            -+case $COPROC_PID in<br>
            -+[0-9]*)       ;;<br>
            -+*)    echo COPROC_PID not integer ;;<br>
            -+esac<br>
            -+<br>
            - echo ${COPROC[@]}<br>
            -<br>
            - echo foo &gt;&amp;${COPROC[1]}<br>
            -diff --git a/tests/heredoc.right b/tests/heredoc.right<br>
            -index 6abaa1f..8df91c5 100644<br>
            ---- a/tests/heredoc.right<br>
            -+++ b/tests/heredoc.right<br>
            -@@ -76,15 +76,14 @@ ENDEND<br>
            - end ENDEND<br>
            - hello<br>
            - end hello<br>
            --x star x<br>
            - end x*x<br>
            - helloEND<br>
            - end helloEND<br>
            - hello<br>
            - \END<br>
            - end hello&lt;NL&gt;\END<br>
            --./heredoc3.sub: line 74: warning: here-document at line 72
            delimited by end-of-file (wanted `EOF')<br>
            --./heredoc3.sub: line 75: syntax error: unexpected end of
            file<br>
            -+./heredoc3.sub: line 75: warning: here-document at line 73
            delimited by end-of-file (wanted `EOF')<br>
            -+./heredoc3.sub: line 76: syntax error: unexpected end of
            file<br>
            - comsub here-string<br>
            - ./heredoc.tests: line 105: warning: here-document at line
            103 delimited by end-of-file (wanted `EOF')<br>
            - hi<br>
            -diff --git a/tests/heredoc3.sub b/tests/heredoc3.sub<br>
            -index 73a111e..9d3d846 100644<br>
            ---- a/tests/heredoc3.sub<br>
            -+++ b/tests/heredoc3.sub<br>
            -@@ -49,9 +49,10 @@ hello<br>
            -     END<br>
            - echo end hello<br>
            -<br>
            --cat &lt;&lt;x*x &amp; touch 'x*x'<br>
            -+cat &lt;&lt;x*x &gt;/dev/null &amp; touch 'x*x'<br>
            - x star x<br>
            - x*x<br>
            -+wait $!<br>
            - echo end 'x*x'<br>
            - rm 'x*x'<br>
            -<br>
             diff --git a/tests/run-execscript b/tests/run-execscript<br>
            -index f97ab21..0d00a1b 100644<br>
            +index de78644..f7b075f 100644<br>
             --- a/tests/run-execscript<br>
             +++ b/tests/run-execscript<br>
             @@ -5,5 +5,6 @@ echo "warning: \`/tmp/bash-notthere' not
            being found or \`/' being a directory"<br>
              echo "warning: produce diff output, please do not consider
            this a test failure" &gt;&amp;2<br>
              echo "warning: if diff output differing only in the
            location of the bash" &gt;&amp;2<br>
              echo "warning: binary appears, please do not consider this
            a test failure" &gt;&amp;2<br>
            --${THIS_SH} ./execscript &gt; /tmp/xx 2&gt;&amp;1<br>
            +-${THIS_SH} ./execscript &gt; ${BASH_TSTOUT} 2&gt;&amp;1<br>
             +rm -f /tmp/xx<br>
             +su -c "${THIS_SH} ./execscript &gt; /tmp/xx 2&gt;&amp;1"
            test<br>
            - diff /tmp/xx exec.right &amp;&amp; rm -f /tmp/xx<br>
            + diff ${BASH_TSTOUT} exec.right &amp;&amp; rm -f
            ${BASH_TSTOUT}<br>
             diff --git a/tests/run-test b/tests/run-test<br>
            -index b2482c3..2e8f049 100644<br>
            +index d68791c..699855f 100644<br>
             --- a/tests/run-test<br>
             +++ b/tests/run-test<br>
             @@ -1,4 +1,5 @@<br>
              unset GROUPS UID 2&gt;/dev/null<br>
            <br>
            --${THIS_SH} ./test.tests &gt;/tmp/xx 2&gt;&amp;1<br>
            +-${THIS_SH} ./test.tests &gt;${BASH_TSTOUT} 2&gt;&amp;1<br>
             +rm -f /tmp/xx<br>
             +su -c "${THIS_SH} ./test.tests &gt;/tmp/xx 2&gt;&amp;1"
            test<br>
            - diff /tmp/xx test.right &amp;&amp; rm -f /tmp/xx<br>
            + diff ${BASH_TSTOUT} test.right &amp;&amp; rm -f
            ${BASH_TSTOUT}<br>
             --<br>
            -1.9.1<br>
            +2.7.4<br>
            <br>
            diff --git a/meta/recipes-extended/bash/<wbr>bash/fix-run-intl.patch
            b/meta/recipes-extended/bash/<wbr>bash/fix-run-intl.patch<br>
            deleted file mode 100644<br>
            index d4a3409..0000000<br>
            --- a/meta/recipes-extended/bash/<wbr>bash/fix-run-intl.patch<br>
            +++ /dev/null<br>
            @@ -1,110 +0,0 @@<br>
            -From a00d3161fd7b6a698bdd2ed5f0ac5f<wbr>aac580ee2a Mon Sep
            17 00:00:00 2001<br>
            -From: Dengke Du &lt;<a moz-do-not-send="true"
              href="mailto:dengke.du@windriver.com">dengke.du@windriver.com</a>&gt;<br>
            -Date: Wed, 3 Aug 2016 23:13:00 -0400<br>
            -Subject: [PATCH] fix run-intl failed<br>
            -<br>
            -1. Filter extra white space of intl.right<br>
            -<br>
            -   Due to the extra white space of intl.right, when the
            result of<br>
            -   sub-test unicode2.sub of intl.tests compared to it, the
            test<br>
            -   failed.<br>
            -<br>
            -   So we need to filter the extra white space of
            intl.right.<br>
            -<br>
            -   Import this patch for intl.right from bash devel branch:<br>
            -<br>
            -       <a moz-do-not-send="true"
              href="http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel"
              rel="noreferrer" target="_blank">http://git.savannah.gnu.org/<wbr>cgit/bash.git/log/?h=devel</a><br>
            -<br>
            -   commit is:<br>
            -<br>
            -       85ec0778f9d778e1820fb8c0e3e996<wbr>f2d1103b45<br>
            -<br>
            -2. Change intl.right correspond to the unicode3.sub's
            output<br>
            -<br>
            -   In sub-test unicode3.sub of intl.tests, the payload
            value is:<br>
            -<br>
            -       payload=$'\065\247\100\063\<wbr>231\053\306\123\070\237\242\<wbr>352\263'<br>
            -<br>
            -   It used quoted string expansion(escaped octal) to assign
            ASCII<br>
            -   characters to variables. So when the test run the
            following:<br>
            -<br>
            -       printf %q "$payload"<br>
            -<br>
            -   It produced:<br>
            -<br>
            -       $'5\247@3\231+\306S8\237\242\<wbr>352\263'<br>
            -<br>
            -   When compared to the intl.right(contain the converted
            character), it failed.<br>
            -<br>
            -   Import parts of patch for intl.right from bash devel
            branch:<br>
            -<br>
            -       <a moz-do-not-send="true"
              href="http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel"
              rel="noreferrer" target="_blank">http://git.savannah.gnu.org/<wbr>cgit/bash.git/log/?h=devel</a><br>
            -<br>
            -   commit is:<br>
            -<br>
            -       74b8cbb41398b4453d8ba04d0cdd1b<wbr>25f9dcb9e3<br>
            -<br>
            -Upstream-Status: Backport<br>
            -<br>
            -Signed-off-by: Dengke Du &lt;<a moz-do-not-send="true"
              href="mailto:dengke.du@windriver.com">dengke.du@windriver.com</a>&gt;<br>
            ----<br>
            - tests/intl.right | 30 +++++++++++++++---------------<br>
            - 1 file changed, 15 insertions(+), 15 deletions(-)<br>
            -<br>
            -diff --git a/tests/intl.right b/tests/intl.right<br>
            -index acf108a..1efdfbe 100644<br>
            ---- a/tests/intl.right<br>
            -+++ b/tests/intl.right<br>
            -@@ -18,34 +18,34 @@ aÃ©b<br>
            - 1.0000<br>
            - 1,0000<br>
            - Passed all 1378 Unicode tests<br>
            --0000000   303 277 012<br>
            -+0000000 303 277 012<br>
            - 0000003<br>
            --0000000   303 277 012<br>
            -+0000000 303 277 012<br>
            - 0000003<br>
            --0000000   303 277 012<br>
            -+0000000 303 277 012<br>
            - 0000003<br>
            --0000000   303 277 012<br>
            -+0000000 303 277 012<br>
            - 0000003<br>
            --0000000   357 277 277 012<br>
            -+0000000 357 277 277 012<br>
            - 0000004<br>
            --0000000   357 277 277 012<br>
            -+0000000 357 277 277 012<br>
            - 0000004<br>
            --0000000   012<br>
            -+0000000 012<br>
            - 0000001<br>
            --0000000   012<br>
            -+0000000 012<br>
            - 0000001<br>
            --0000000   012<br>
            -+0000000 012<br>
            - 0000001<br>
            --0000000   012<br>
            -+0000000 012<br>
            - 0000001<br>
            --0000000   303 277 012<br>
            -+0000000 303 277 012<br>
            - 0000003<br>
            --0000000   303 277 012<br>
            -+0000000 303 277 012<br>
            - 0000003<br>
            --0000000   303 277 012<br>
            -+0000000 303 277 012<br>
            - 0000003<br>
            --0000000   101 040 302 243 040 305 222 012<br>
            -+0000000 101 040 302 243 040 305 222 012<br>
            - 0000010<br>
            - ./unicode3.sub: line 2: 5§@3™+ÆS8Ÿ¢ê³: command not found<br>
            --5§@3™+ÆS8Ÿ¢ê³<br>
            -+$'5\247@3\231+\306S8\237\<wbr>242\352\263'<br>
            - + : $'5\247@3\231+\306S8\237\242\<wbr>352\263'<br>
            ---<br>
            -2.8.1<br>
            -<br>
            diff --git a/meta/recipes-extended/bash/<wbr>bash/test-output.patch
            b/meta/recipes-extended/bash/<wbr>bash/test-output.patch<br>
            index 2b09b7d..652ffb1 100644<br>
            --- a/meta/recipes-extended/bash/<wbr>bash/test-output.patch<br>
            +++ b/meta/recipes-extended/bash/<wbr>bash/test-output.patch<br>
            @@ -2,15 +2,21 @@ Add FAIL/PASS output to test output.<br>
            <br>
             Signed-off-by: BjÃ¶rn Stenberg &lt;<a
              moz-do-not-send="true" href="mailto:bjst@enea.com">bjst@enea.com</a>&gt;<br>
             Upstream-Status: Pending<br>
            +<br>
            +Signed-off-by: Zheng Ruoqin &lt;<a moz-do-not-send="true"
              href="mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
             ---<br>
            -diff -uNr a/tests/run-all b/tests/run-all<br>
            ---- a/tests/run-all    1999-10-08 17:07:46.000000000 +0200<br>
            -+++ b/tests/run-all    2012-10-27 21:04:<a
              moz-do-not-send="true" href="tel:18.663331887"
              value="+18663331887">18.663331887</a> +0200<br>
            -@@ -22,7 +22,15 @@<br>
            + tests/run-all | 11 ++++++++++-<br>
            + 1 file changed, 10 insertions(+), 1 deletion(-)<br>
            +<br>
            +diff --git a/tests/run-all b/tests/run-all<br>
            +index 2882fe0..069dbbe 100644<br>
            +--- a/tests/run-all<br>
            ++++ b/tests/run-all<br>
            +@@ -33,7 +33,16 @@ do<br>
                    case $x in<br>
                    $0|run-minimal|run-gprof)       ;;<br>
                    *.orig|*~) ;;<br>
            --      *)      echo $x ; sh $x ;;<br>
            +-      *)      echo $x ; sh $x ; rm -f ${BASH_TSTOUT} ;;<br>
             +    *)  echo $x<br>
             +         output=`sh $x`<br>
             +         if [ -n "$output" ]; then<br>
            @@ -19,7 +25,11 @@ diff -uNr a/tests/run-all b/tests/run-all<br>
             +         else<br>
             +             echo "PASS: $x"<br>
             +         fi<br>
            ++         rm -f ${BASH_TSTOUT}<br>
             +         ;;<br>
                    esac<br>
              done<br>
            <br>
            +--<br>
            +2.7.4<br>
            +<br>
            diff --git a/meta/recipes-extended/bash/<a
              moz-do-not-send="true" href="http://bash_4.3.30.bb"
              rel="noreferrer" target="_blank">b<wbr>ash_4.3.30.bb</a>
            b/meta/recipes-extended/bash/<a moz-do-not-send="true"
              href="http://bash_4.3.30.bb" rel="noreferrer"
              target="_blank">b<wbr>ash_4.3.30.bb</a><br>
            deleted file mode 100644<br>
            index e398e87..0000000<br>
            --- a/meta/recipes-extended/bash/<a moz-do-not-send="true"
              href="http://bash_4.3.30.bb" rel="noreferrer"
              target="_blank">b<wbr>ash_4.3.30.bb</a><br>
            +++ /dev/null<br>
            @@ -1,72 +0,0 @@<br>
            -require bash.inc<br>
            -<br>
            -# GPLv2+ (&lt; 4.0), GPLv3+ (&gt;= 4.0)<br>
            -LICENSE = "GPLv3+"<br>
            -LIC_FILES_CHKSUM = "<a class="moz-txt-link-freetext" href="file://COPYING;md5=">file://COPYING;md5=</a><wbr>d32239bcb673463ab874e80d47fae5<wbr>04"<br>
            -<br>
            -SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.<wbr>gz;name=tarball
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-031;apply=yes;<wbr>striplevel=0;name=patch031
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-032;apply=yes;<wbr>striplevel=0;name=patch032
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-033;apply=yes;<wbr>striplevel=0;name=patch033
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-034;apply=yes;<wbr>striplevel=0;name=patch034
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-035;apply=yes;<wbr>striplevel=0;name=patch035
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-036;apply=yes;<wbr>striplevel=0;name=patch036
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-037;apply=yes;<wbr>striplevel=0;name=patch037
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-038;apply=yes;<wbr>striplevel=0;name=patch038
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-039;apply=yes;<wbr>striplevel=0;name=patch039
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-040;apply=yes;<wbr>striplevel=0;name=patch040
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-041;apply=yes;<wbr>striplevel=0;name=patch041
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-042;apply=yes;<wbr>striplevel=0;name=patch042
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-043;apply=yes;<wbr>striplevel=0;name=patch043
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-044;apply=yes;<wbr>striplevel=0;name=patch044
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-045;apply=yes;<wbr>striplevel=0;name=patch045
            \<br>
            -           ${GNU_MIRROR}/bash/bash-4.3-<wbr>patches/bash43-046;apply=yes;<wbr>striplevel=0;name=patch046
            \<br>
            -           <a class="moz-txt-link-freetext" href="file://execute_cmd.patch">file://execute_cmd.patch</a>;<wbr>striplevel=0 \<br>
            -           <a class="moz-txt-link-freetext" href="file://mkbuiltins_have_">file://mkbuiltins_have_</a><wbr>stringize.patch \<br>
            -           <a class="moz-txt-link-freetext" href="file://build-tests.patch">file://build-tests.patch</a> \<br>
            -           <a class="moz-txt-link-freetext" href="file://test-output.patch">file://test-output.patch</a> \<br>
            -           <a class="moz-txt-link-freetext" href="file://fix-run-coproc-run">file://fix-run-coproc-run</a>-<wbr>heredoc-run-execscript-run-<wbr>test-f.patch
            \<br>
            -           <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \<br>
            -           <a class="moz-txt-link-freetext" href="file://fix-run-builtins.patch">file://fix-run-builtins.patch</a> \<br>
            -           <a class="moz-txt-link-freetext" href="file://0001-help-fix-printf">file://0001-help-fix-printf</a>-<wbr>format-security-warning.patch
            \<br>
            -           <a class="moz-txt-link-freetext" href="file://fix-run-intl.patch">file://fix-run-intl.patch</a> \<br>
            -           <a class="moz-txt-link-freetext" href="file://CVE-2016-9401.patch">file://CVE-2016-9401.patch</a> \<br>
            -           "<br>
            -<br>
            -SRC_URI[tarball.md5sum] = "<wbr>a27b3ee9be83bd3ba448c0ff52b284<wbr>47"<br>
            -SRC_URI[tarball.sha256sum] = "<wbr>317881019bbf2262fb814b7dd8e406<wbr>32d13c3608d2f237800a8828fbb8a6<wbr>40dd"<br>
            -<br>
            -SRC_URI[patch031.md5sum] = "<wbr>236df1ac1130a033ed0dbe2d2115f2<wbr>8f"<br>
            -SRC_URI[patch031.sha256sum] = "<wbr>cd529f59dd0f2fdd49d619fe34691d<wbr>a6f0affedf87cc37cd460a9f3fe812<wbr>a61d"<br>
            -SRC_URI[patch032.md5sum] = "<wbr>2360f7e79cfb28526f80021025ea59<wbr>09"<br>
            -SRC_URI[patch032.sha256sum] = "<wbr>889357d29a6005b2c3308ca5b6286c<wbr>b223b5e9c083219e5db3156282dd55<wbr>4f4a"<br>
            -SRC_URI[patch033.md5sum] = "<wbr>b551c4ee7b8713759e4143499d0bbd<wbr>48"<br>
            -SRC_URI[patch033.sha256sum] = "<wbr>fb2a7787a13fbe027a7335aca6eb3c<wbr>21cdbd813e9edc221274b6a9d8692e<wbr>aa16"<br>
            -SRC_URI[patch034.md5sum] = "<wbr>c9a56fbe0348e05a886dff97f2872b<wbr>74"<br>
            -SRC_URI[patch034.sha256sum] = "<wbr>f1694f04f110defe1330a851cc2768<wbr>e7e57ddd2dfdb0e3e350ca0e3c214f<wbr>f889"<br>
            -SRC_URI[patch035.md5sum] = "<wbr>e564e8ab44ed1ca3a4e315a9f6cabd<wbr>c9"<br>
            -SRC_URI[patch035.sha256sum] = "<wbr>370d85e51780036f2386dc18c5efe9<wbr>96eba8e652fc1973f0f4f2ab55a993<wbr>c1e3"<br>
            -SRC_URI[patch036.md5sum] = "<wbr>b00ff66c41a7c0f06e191200981980<wbr>b0"<br>
            -SRC_URI[patch036.sha256sum] = "<wbr>ac5f82445b36efdb543dbfae64afed<wbr>63f586d7574b833e9aa9cd5170bc5f<wbr>d27c"<br>
            -SRC_URI[patch037.md5sum] = "<wbr>be2a7b05f6ae560313f3c9d5f7127b<wbr>da"<br>
            -SRC_URI[patch037.sha256sum] = "<wbr>33f170dd7400ab3418d749c55c6391<wbr>b1d161ef2de7aced1873451b3a3fca<wbr>5813"<br>
            -SRC_URI[patch038.md5sum] = "<wbr>61e0522830b24fbe8c0d1b010f1324<wbr>70"<br>
            -SRC_URI[patch038.sha256sum] = "<wbr>adbeaa500ca7a82535f0e88d673661<wbr>963f8a5fcdc7ad63445e68bf5b4978<wbr>6367"<br>
            -SRC_URI[patch039.md5sum] = "<wbr>a4775487abe958536751c8ce53cdf6<wbr>f9"<br>
            -SRC_URI[patch039.sha256sum] = "<wbr>ab94dced2215541097691f60c3eb32<wbr>3cc28ef2549463e6a5334bbcc1e61e<wbr>74ec"<br>
            -SRC_URI[patch040.md5sum] = "<wbr>80d3587c58854e226055ef099ffeb5<wbr>35"<br>
            -SRC_URI[patch040.sha256sum] = "<wbr>84bb396b9262992ca5424feab6ed3e<wbr>c39f193ef5c76dfe4a62b551bd8dd9<wbr>d76b"<br>
            -SRC_URI[patch041.md5sum] = "<wbr>20bf63eef7cb441c0b1cc49ef3191d<wbr>03"<br>
            -SRC_URI[patch041.sha256sum] = "<wbr>4ec432966e4198524a7e0cd685fe22<wbr>2e96043769c9613e66742ac475db13<wbr>2c1a"<br>
            -SRC_URI[patch042.md5sum] = "<wbr>70790646ae61e207c995e44931390e<wbr>50"<br>
            -SRC_URI[patch042.sha256sum] = "<wbr>ac219322db2791da87a496ee6e8e55<wbr>44846494bdaaea2626270c2f73c104<wbr>4919"<br>
            -SRC_URI[patch043.md5sum] = "<wbr>855a46955cb251534e80b4732b748e<wbr>37"<br>
            -SRC_URI[patch043.sha256sum] = "<wbr>47a8a3c005b46e25821f4d8f5ccb04<wbr>c1d653b1c829cb40568d553dc44f7a<wbr>6180"<br>
            -SRC_URI[patch044.md5sum] = "<wbr>29623d3282fcbb37e1158136509b5b<wbr>b8"<br>
            -SRC_URI[patch044.sha256sum] = "<wbr>9338820630bf67373b44d8ea68409f<wbr>65162ea7a47b9b29ace06a0aed1256<wbr>7f99"<br>
            -SRC_URI[patch045.md5sum] = "<wbr>4473244ca5abfd4b018ea26dc73e74<wbr>12"<br>
            -SRC_URI[patch045.sha256sum] = "<wbr>ba6ec3978e9eaa1eb3fabdaf3cc6fd<wbr>f8c4606ac1c599faaeb4e2d6986415<wbr>0023"<br>
            -SRC_URI[patch046.md5sum] = "<wbr>7e5fb09991c077076b86e0e0577989<wbr>13"<br>
            -SRC_URI[patch046.sha256sum] = "<wbr>b3b456a6b690cd293353f17e22d92a<wbr>202b3c8bce587ae5f2667c20c9ab6f<wbr>688f"<br>
            -<br>
            -BBCLASSEXTEND = "nativesdk"<br>
            diff --git a/meta/recipes-extended/bash/<a
              moz-do-not-send="true" href="http://bash_4.4.bb"
              rel="noreferrer" target="_blank">b<wbr>ash_4.4.bb</a>
            b/meta/recipes-extended/bash/<a moz-do-not-send="true"
              href="http://bash_4.4.bb" rel="noreferrer" target="_blank">b<wbr>ash_4.4.bb</a><br>
            new file mode 100644<br>
            index 0000000..798bfdb<br>
            --- /dev/null<br>
            +++ b/meta/recipes-extended/bash/<a moz-do-not-send="true"
              href="http://bash_4.4.bb" rel="noreferrer" target="_blank">b<wbr>ash_4.4.bb</a><br>
            @@ -0,0 +1,66 @@<br>
            +require bash.inc<br>
            +<br>
            +# GPLv2+ (&lt; 4.0), GPLv3+ (&gt;= 4.0)<br>
            +LICENSE = "GPLv3+"<br>
            +LIC_FILES_CHKSUM = "<a class="moz-txt-link-freetext" href="file://COPYING;md5=">file://COPYING;md5=</a><wbr>d32239bcb673463ab874e80d47fae5<wbr>04"<br>
            +<br>
            +SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.<wbr>gz;name=tarball
            \<br>
            +           ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-001;apply=yes;<wbr>striplevel=0;name=patch001
            \<br>
            +           ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-002;apply=yes;<wbr>striplevel=0;name=patch002
            \<br>
            +           ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-003;apply=yes;<wbr>striplevel=0;name=patch003
            \<br>
            +           ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-004;apply=yes;<wbr>striplevel=0;name=patch004
            \<br>
            +           ${GNU_MIRROR}/bash/bash-4.4-<wbr>patches/bash44-005;apply=yes;<wbr>striplevel=0;name=patch005
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
            +           <a class="moz-txt-link-freetext" href="file://execute_cmd.patch">file://execute_cmd.patch</a>;<wbr>striplevel=0 \<br>
            +           <a class="moz-txt-link-freetext" href="file://mkbuiltins_have_">file://mkbuiltins_have_</a><wbr>stringize.patch \<br>
            +           <a class="moz-txt-link-freetext" href="file://build-tests.patch">file://build-tests.patch</a> \<br>
            +           <a class="moz-txt-link-freetext" href="file://test-output.patch">file://test-output.patch</a>  \<br>
            +           <a class="moz-txt-link-freetext" href="file://fix-run-coproc-run">file://fix-run-coproc-run</a>-<wbr>heredoc-run-execscript-run-<wbr>test-f.patch
            \<br>
            +           <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \<br>
            +           <a class="moz-txt-link-freetext" href="file://fix-run-builtins.patch">file://fix-run-builtins.patch</a> \<br>
            +           <a class="moz-txt-link-freetext" href="file://0001-help-fix-printf">file://0001-help-fix-printf</a>-<wbr>format-security-warning.patch
            \<br>
            +           <a class="moz-txt-link-freetext" href="file://0001-patch-to-obtain">file://0001-patch-to-obtain</a>-<wbr>pkgconfig-sanity.patch
            \<br>
            +           <a class="moz-txt-link-freetext" href="file://0001-The-loadable">file://0001-The-loadable</a>-<wbr>builtins-uname-could-not-be-<wbr>parsed-by-r.patch
            \<br>
            +           "<br>
            +<br>
            +SRC_URI[tarball.md5sum] = "<wbr>148888a7c95ac23705559b6f477dfe<wbr>25"<br>
            +SRC_URI[tarball.sha256sum] = "<wbr>d86b3392c1202e8ff5a423b302e628<wbr>4db7f8f435ea9f39b5b1b20fd3ac36<wbr>dfcb"<br>
            +<br>
            +SRC_URI[patch001.md5sum] = "<wbr>817d01a6c0af6f79308a8b7b649e53<wbr>d8"<br>
            +SRC_URI[patch001.sha256sum] = "<wbr>3e28d91531752df9a8cb167ad07cc5<wbr>42abaf944de9353fe8c6a535c9f1f1<wbr>7f0f"<br>
            +SRC_URI[patch002.md5sum] = "<wbr>765e14cff12c7284009772e8e24f2f<wbr>e0"<br>
            +SRC_URI[patch002.sha256sum] = "<wbr>7020a0183e17a7233e665b979c78c1<wbr>84ea369cfaf3e8b4b11f5547ecb7c1<wbr>3c53"<br>
            +SRC_URI[patch003.md5sum] = "<wbr>49e7da93bf07f510a2eb6bb43ac3e5<wbr>a2"<br>
            +SRC_URI[patch003.sha256sum] = "<wbr>51df5a9192fdefe0ddca4bdf290932<wbr>f74be03ffd0503a3d112e4199905e7<wbr>18b2"<br>
            +SRC_URI[patch004.md5sum] = "<wbr>4557d674ab5831a5fa98052ab19eda<wbr>f4"<br>
            +SRC_URI[patch004.sha256sum] = "<wbr>ad080a30a4ac6c1273373617f29628<wbr>cc320a35c8cd06913894794293dc52<wbr>c8b3"<br>
            +SRC_URI[patch005.md5sum] = "<wbr>cce96dd77cdd1d293beec10848f6cb<wbr>b5"<br>
            +SRC_URI[patch005.sha256sum] = "<wbr>221e4b725b770ad0bb6924df3f8d04<wbr>f89eeca4558f6e4c777dfa93e96709<wbr>0529"<br>
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
            +<br>
            +BBCLASSEXTEND = "nativesdk"<br>
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

--------------D99A35B4240758BC65068A1F--
