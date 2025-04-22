Return-Path: <semc.2042@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396EBC369D3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 11:03:05 +0000 (UTC)
Subject: Re: [PATCH] glibc-y2038-tests:add tests-special in run-built-tests yes
To: openembedded-core@lists.openembedded.org
From: "rajmohan r" <semc.2042@gmail.com>
X-Originating-Location: AU (167.103.7.4)
X-Originating-Platform: Linux Chrome 135
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 22 Apr 2025 04:03:02 -0700
References: <CANNYZj-vNYxOSBoUw=EhYbzN-s3vEKJZ+oROpo3P+tRm1VNXsQ@mail.gmail.com>
In-Reply-To: <CANNYZj-vNYxOSBoUw=EhYbzN-s3vEKJZ+oROpo3P+tRm1VNXsQ@mail.gmail.com>
Message-ID: <24438.1745319782531209052@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="SU8xytePvm06BIxkC9j4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 11:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215200

--SU8xytePvm06BIxkC9j4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 07:34 PM, Alexander Kanavin wrote:

>=20
> Thanks. This patch is invasive and adds to glibc maintenance burden.
> Which begs the question: do we need the recipe at all? Is there a
> particular reason you started looking into this issue?

When we moved from yocto kirkstone branch to scarthgap branch, we found tha=
t
compilation for this module taking longer time. hence started looking which=
 stage
in this module takes time. Found that it is in do_check() stage.

>=20
>=20
> It is by now well established that glibc itself works as it should,
> that all affected 32 bit targets are configured to use 64 bit time_t,
> and that any lingering y2038 issues are in components other than the c
> library, and usually come from C programming mistakes (e.g. storing
> timestamps in long). Maybe we can simply remove the recipe?

This recipe gives only two test cases in the packages to test. below are th=
e
test cases seen for this package
io/ftwtest
io/ftwtest-time64

>=20
> Alex
>=20
> On Thu, 10 Apr 2025 at 12:07, rajmohan r via lists.openembedded.org
> <semc.2042=3Dgmail.com@lists.openembedded.org> wrote:
>=20
>> If 'run-built-tests' is 'yes' run the test binaries, else do not run
>> the test binaries.
>>=20
>> Currently its taking 20min to complete do_check() for glibc-y2038-tests.
>> Test binaries are run in do_check() stage though 'run-built-tests' is
>> set 'no'. Which is wrong hence include 'tests-special' target inside
>> the 'run-built-tests' condition when set to 'yes' to avoid running the
>> test binaries.
>>=20
>> Also remove 'tests-special' target from the 'tests' and 'xtests' list
>> when run-built-tests set to 'no' to avoid running test binaries.
>>=20
>> After this change, no binary is run and time to complete do_check()
>> stage is 7min.
>>=20
>> Upstream-Status: Inappropriate [oe-specific]
>>=20
>> Signed-off-by: rajmohan r <semc.2042@gmail.com>
>> ---
>> .../glibc/glibc-y2038-tests_2.41.bb | 1 +
>> ...tests-special-in-run-built-tests-yes.patch | 184 ++++++++++++++++++
>> 2 files changed, 185 insertions(+)
>> create mode 100644
>> meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-y=
es.patch
>>=20
>>=20
>> diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
>> b/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
>> index 9ea09a4e12..2e1f9b02c9 100644
>> --- a/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
>> +++ b/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
>> @@ -5,6 +5,7 @@ inherit ptest features_check
>> REQUIRED_DISTRO_FEATURES =3D "ptest"
>>=20
>> SRC_URI +=3D "\
>> + file://include-tests-special-in-run-built-tests-yes.patch \
>> file://run-ptest \
>> "
>>=20
>> diff --git
>> a/meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests=
-yes.patch
>> b/meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests=
-yes.patch
>>=20
>> new file mode 100644
>> index 0000000000..f8f78c5863
>> --- /dev/null
>> +++
>> b/meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests=
-yes.patch
>>=20
>> @@ -0,0 +1,184 @@
>> +glibc-y2038-tests: include tests-special in run-built-tests yes
>> +
>> +If 'run-built-tests' is 'yes' run the test binaries, else do not run
>> +the test binaries.
>> +
>> +Currently its taking 20min to complete do_check() for glibc-y2038-tests=
.
>> +Test binaries are run in do_check() stage though 'run-built-tests' is
>> +set 'no'. Which is wrong hence include 'tests-special' target inside
>> +the 'run-built-tests' condition when set to 'yes' to avoid running the
>> +test binaries.
>> +
>> +Also remove 'tests-special' target from the 'tests' and 'xtests' list
>> +when run-built-tests set to 'no' to avoid running test binaries.
>> +
>> +After this change, no binary is run and time to complete do_check()
>> +stage is 7min.
>> +
>> +Upstream-Status: Inappropriate [oe-specific]
>> +
>> +Signed-off-by: rajmohan r <semc.2042@gmail.com>
>> +---
>> + Makefile | 16 ++++++++++++++++
>> + Makerules | 2 ++
>> + Rules | 8 ++++++--
>> + 3 files changed, 24 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index 5c20ed3..ed95e99 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -545,21 +545,26 @@ tests-clean: do-tests-clean
>> + @$(MAKE) subdir_testclean no_deps=3Dt
>> +
>> + ifneq (,$(CXX))
>> ++ifeq ($(run-built-tests),yes)
>> + vpath c++-types.data $(+sysdep_dirs)
>> +
>> + tests-special +=3D $(objpfx)c++-types-check.out
>> + $(objpfx)c++-types-check.out: c++-types.data scripts/check-c++-types.s=
h
>> + scripts/check-c++-types.sh $< $(CXX) $(filter-out -std=3Dgnu11
>> $(+gccwarn-c),$(CFLAGS)) $(CPPFLAGS) > $@; \
>> + $(evaluate-test)
>> ++endif # $(run-built-tests) =3D yes
>> + endif
>> +
>> ++ifeq ($(run-built-tests),yes)
>> + tests-special +=3D $(objpfx)check-local-headers.out
>> + $(objpfx)check-local-headers.out: scripts/check-local-headers.sh
>> + AWK=3D'$(AWK)' scripts/check-local-headers.sh \
>> + "$(includedir)" "$(objpfx)" < /dev/null > $@; \
>> + $(evaluate-test)
>> ++endif # $(run-built-tests) =3D yes
>> +
>> + ifneq "$(headers)" ""
>> ++ifeq ($(run-built-tests),yes)
>> + # Special test of all the installed headers in this directory.
>> + tests-special +=3D $(objpfx)check-installed-headers-c.out
>> + libof-check-installed-headers-c :=3D testsuite
>> +@@ -570,8 +575,10 @@ $(objpfx)check-installed-headers-c.out: \
>> + $(filter-out -std=3D%,$(CFLAGS)) -D_ISOMAC $(+includes)" \
>> + $(headers) > $@; \
>> + $(evaluate-test)
>> ++endif # $(run-built-tests) =3D yes
>> +
>> + ifneq "$(CXX)" ""
>> ++ifeq ($(run-built-tests),yes)
>> + tests-special +=3D $(objpfx)check-installed-headers-cxx.out
>> + libof-check-installed-headers-cxx :=3D testsuite
>> + $(objpfx)check-installed-headers-cxx.out: \
>> +@@ -581,14 +588,18 @@ $(objpfx)check-installed-headers-cxx.out: \
>> + $(filter-out -std=3D%,$(CXXFLAGS)) -D_ISOMAC $(+includes)" \
>> + $(headers) > $@; \
>> + $(evaluate-test)
>> ++endif # $(run-built-tests) =3D yes
>> + endif # $(CXX)
>> +
>> ++ifeq ($(run-built-tests),yes)
>> + tests-special +=3D $(objpfx)check-wrapper-headers.out
>> + $(objpfx)check-wrapper-headers.out: scripts/check-wrapper-headers.py
>> $(headers)
>> + $(PYTHON) $< --root=3D. --subdir=3D. $(headers) \
>> + --generated $(common-generated) > $@; $(evaluate-test)
>> ++endif # $(run-built-tests) =3D yes
>> + endif # $(headers)
>> +
>> ++ifeq ($(run-built-tests),yes)
>> + # Lint all Makefiles; including this one. Pass `pwd` as the source
>> + # directory since the top-level Makefile is in the root of the source
>> + # tree and these tests are run from there. We add light-weight linting
>> +@@ -598,7 +609,9 @@ tests-special +=3D $(objpfx)lint-makefiles.out
>> + $(objpfx)lint-makefiles.out: scripts/lint-makefiles.sh
>> + $(SHELL) $< "$(PYTHON)" `pwd` > $@ ; \
>> + $(evaluate-test)
>> ++endif # $(run-built-tests) =3D yes
>> +
>> ++ifeq ($(run-built-tests),yes)
>> + # Link libc.a as a whole to verify that it does not contain multiple
>> + # definitions of any symbols.
>> + tests-special +=3D $(objpfx)link-static-libc.out
>> +@@ -606,6 +619,7 @@ $(objpfx)link-static-libc.out:
>> + $(LINK.o) $(whole-archive) -nostdlib -nostartfiles -r \
>> + $(objpfx)libc.a -o /dev/null > $@ 2>&1; \
>> + $(evaluate-test)
>> ++endif # $(run-built-tests) =3D yes
>> +
>> + # Print test summary for tests in $1 .sum file;
>> + # $2 is optional test identifier.
>> +@@ -686,6 +700,7 @@ endif
>> + rm -f $(symbolic-link-list)
>> + touch $(objpfx)testroot.pristine/install.stamp
>> +
>> ++ifeq ($(run-built-tests),yes)
>> + tests-special-notdir =3D $(patsubst $(objpfx)%, %, $(tests-special))
>> + tests: $(tests-special)
>> + $(..)scripts/merge-test-results.sh -s $(objpfx) "" \
>> +@@ -700,6 +715,7 @@ xtests:
>> + $(sort $(subdirs)) \
>> + > $(objpfx)xtests.sum
>> + $(call summarize-tests,xtests.sum, for extra tests)
>> ++endif # $(run-built-tests) =3D yes
>> +
>> + # The realclean target is just like distclean for the parent, but we
>> want
>> + # the subdirs to know the difference in case they care.
>> +diff --git a/Makerules b/Makerules
>> +index ada6168..40b5ef2 100644
>> +--- a/Makerules
>> ++++ b/Makerules
>> +@@ -1232,6 +1232,7 @@ include $(patsubst
>> %,$(..)libof-iterator.mk,$(cpp-srcs-left))
>> + endif
>> +
>> + ifeq ($(build-shared),yes)
>> ++ifeq ($(run-built-tests),yes)
>> + # Generate normalized lists of symbols, versions, and data sizes.
>> + # This is handy for checking against existing library binaries.
>> +
>> +@@ -1321,6 +1322,7 @@ tests-special +=3D $(check-abi-list)
>> + endif
>> + endif
>> +
>> ++endif # $(run-built-tests) =3D yes
>> + endif
>> +
>> + FORCE:
>> +diff --git a/Rules b/Rules
>> +index c8adc00..5a77516 100644
>> +--- a/Rules
>> ++++ b/Rules
>> +@@ -94,6 +94,7 @@ $(objpfx)check-installed-headers-c.out: \
>> + ifneq "$(CXX)" ""
>> + # If a C++ compiler is available, also test that they can be compiled
>> + # in isolation as C++.
>> ++ifeq ($(run-built-tests),yes)
>> + tests-special +=3D $(objpfx)check-installed-headers-cxx.out
>> + libof-check-installed-headers-cxx :=3D testsuite
>> + $(objpfx)check-installed-headers-cxx.out: \
>> +@@ -103,8 +104,10 @@ $(objpfx)check-installed-headers-cxx.out: \
>> + $(filter-out -std=3D%,$(CXXFLAGS)) -D_ISOMAC $(+includes)" \
>> + $(headers) > $@; \
>> + $(evaluate-test)
>> ++endif # $(run-built-tests) =3D yes
>> + endif # $(CXX)
>> +
>> ++ifeq ($(run-built-tests),yes)
>> + # Test that a wrapper header exists in include/ for each non-sysdeps
>> header.
>> + # This script does not need $(py-env).
>> + tests-special +=3D $(objpfx)check-wrapper-headers.out
>> +@@ -112,6 +115,7 @@ $(objpfx)check-wrapper-headers.out: \
>> + $(..)scripts/check-wrapper-headers.py $(headers)
>> + $(PYTHON) $< --root=3D$(..) --subdir=3D$(subdir) $(headers) > $@; \
>> + $(evaluate-test)
>> ++endif # $(run-built-tests) =3D yes
>> +
>> + # Test that none of the headers installed by this directory use certai=
n
>> + # obsolete constructs (e.g. legacy BSD typedefs superseded by stdint.h=
).
>>=20
>> +@@ -153,9 +157,9 @@ tests: $(addprefix $(objpfx),$(filter-out
>> $(tests-unsupported), \
>> + $(tests-malloc-check:%=3D%-malloc-check) \
>> + $(tests-malloc-hugetlb1:%=3D%-malloc-hugetlb1) \
>> + $(tests-malloc-hugetlb2:%=3D%-malloc-hugetlb2)) \
>> +- $(test-srcs)) $(tests-special) \
>> ++ $(test-srcs)) \
>> + $(tests-printers-programs)
>> +-xtests: tests $(xtests-special)
>> ++xtests: tests
>> + else # $(run-built-tests) !=3D no
>> + # The $(xtests) dependency ensures that xtests are always built.
>> + tests: $(tests:%=3D$(objpfx)%.out) $(tests-internal:%=3D$(objpfx)%.out=
) \
>> --
>> 2.34.1
>>=20
>>=20
>=20
>

--SU8xytePvm06BIxkC9j4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Apr 10, 2025 at 07:34 PM, Alexander Kanavin wrote:</div>
<div>
<blockquote>Thanks. This patch is invasive and adds to glibc maintenance bu=
rden.<br />Which begs the question: do we need the recipe at all? Is there =
a<br />particular reason you started looking into this issue?</blockquote>
When we moved from yocto kirkstone branch to scarthgap branch, we found tha=
t</div>
<div>compilation for this module taking longer time. hence started looking =
which stage</div>
<div>in this module takes time. Found that it is in do_check() stage.</div>
<div>
<blockquote><br />It is by now well established that glibc itself works as =
it should,<br />that all affected 32 bit targets are configured to use 64 b=
it time_t,<br />and that any lingering y2038 issues are in components other=
 than the c<br />library, and usually come from C programming mistakes (e.g=
. storing<br />timestamps in long). Maybe we can simply remove the recipe?<=
/blockquote>
This recipe gives only two test cases in the packages to test. below are th=
e</div>
<div>test cases seen for this package</div>
<div>&nbsp; &nbsp; &nbsp;io/ftwtest<br />&nbsp; &nbsp; &nbsp;io/ftwtest-tim=
e64</div>
<div>&nbsp;</div>
<div>
<blockquote>Alex<br /><br />On Thu, 10 Apr 2025 at 12:07, rajmohan r via li=
sts.openembedded.org<br />&lt;semc.2042=3Dgmail.com@lists.openembedded.org&=
gt; wrote:<br />
<blockquote>If 'run-built-tests' is 'yes' run the test binaries, else do no=
t run<br />the test binaries.<br /><br />Currently its taking 20min to comp=
lete do_check() for glibc-y2038-tests.<br />Test binaries are run in do_che=
ck() stage though 'run-built-tests' is<br />set 'no'. Which is wrong hence =
include 'tests-special' target inside<br />the 'run-built-tests' condition =
when set to 'yes' to avoid running the<br />test binaries.<br /><br />Also =
remove 'tests-special' target from the 'tests' and 'xtests' list<br />when =
run-built-tests set to 'no' to avoid running test binaries.<br /><br />Afte=
r this change, no binary is run and time to complete do_check()<br />stage =
is 7min.<br /><br />Upstream-Status: Inappropriate [oe-specific]<br /><br /=
>Signed-off-by: rajmohan r &lt;semc.2042@gmail.com&gt;<br />---<br />.../gl=
ibc/glibc-y2038-tests_2.41.bb | 1 +<br />...tests-special-in-run-built-test=
s-yes.patch | 184 ++++++++++++++++++<br />2 files changed, 185 insertions(+=
)<br />create mode 100644 meta/recipes-core/glibc/glibc/include-tests-speci=
al-in-run-built-tests-yes.patch<br /><br />diff --git a/meta/recipes-core/g=
libc/glibc-y2038-tests_2.41.bb b/meta/recipes-core/glibc/glibc-y2038-tests_=
2.41.bb<br />index 9ea09a4e12..2e1f9b02c9 100644<br />--- a/meta/recipes-co=
re/glibc/glibc-y2038-tests_2.41.bb<br />+++ b/meta/recipes-core/glibc/glibc=
-y2038-tests_2.41.bb<br />@@ -5,6 +5,7 @@ inherit ptest features_check<br /=
>REQUIRED_DISTRO_FEATURES =3D "ptest"<br /><br />SRC_URI +=3D "\<br />+ fil=
e://include-tests-special-in-run-built-tests-yes.patch \<br />file://run-pt=
est \<br />"<br /><br />diff --git a/meta/recipes-core/glibc/glibc/include-=
tests-special-in-run-built-tests-yes.patch b/meta/recipes-core/glibc/glibc/=
include-tests-special-in-run-built-tests-yes.patch<br />new file mode 10064=
4<br />index 0000000000..f8f78c5863<br />--- /dev/null<br />+++ b/meta/reci=
pes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch<br =
/>@@ -0,0 +1,184 @@<br />+glibc-y2038-tests: include tests-special in run-b=
uilt-tests yes<br />+<br />+If 'run-built-tests' is 'yes' run the test bina=
ries, else do not run<br />+the test binaries.<br />+<br />+Currently its t=
aking 20min to complete do_check() for glibc-y2038-tests.<br />+Test binari=
es are run in do_check() stage though 'run-built-tests' is<br />+set 'no'. =
Which is wrong hence include 'tests-special' target inside<br />+the 'run-b=
uilt-tests' condition when set to 'yes' to avoid running the<br />+test bin=
aries.<br />+<br />+Also remove 'tests-special' target from the 'tests' and=
 'xtests' list<br />+when run-built-tests set to 'no' to avoid running test=
 binaries.<br />+<br />+After this change, no binary is run and time to com=
plete do_check()<br />+stage is 7min.<br />+<br />+Upstream-Status: Inappro=
priate [oe-specific]<br />+<br />+Signed-off-by: rajmohan r &lt;semc.2042@g=
mail.com&gt;<br />+---<br />+ Makefile | 16 ++++++++++++++++<br />+ Makerul=
es | 2 ++<br />+ Rules | 8 ++++++--<br />+ 3 files changed, 24 insertions(+=
), 2 deletions(-)<br />+<br />+diff --git a/Makefile b/Makefile<br />+index=
 5c20ed3..ed95e99 100644<br />+--- a/Makefile<br />++++ b/Makefile<br />+@@=
 -545,21 +545,26 @@ tests-clean: do-tests-clean<br />+ @$(MAKE) subdir_test=
clean no_deps=3Dt<br />+<br />+ ifneq (,$(CXX))<br />++ifeq ($(run-built-te=
sts),yes)<br />+ vpath c++-types.data $(+sysdep_dirs)<br />+<br />+ tests-s=
pecial +=3D $(objpfx)c++-types-check.out<br />+ $(objpfx)c++-types-check.ou=
t: c++-types.data scripts/check-c++-types.sh<br />+ scripts/check-c++-types=
.sh $&lt; $(CXX) $(filter-out -std=3Dgnu11 $(+gccwarn-c),$(CFLAGS)) $(CPPFL=
AGS) &gt; $@; \<br />+ $(evaluate-test)<br />++endif # $(run-built-tests) =
=3D yes<br />+ endif<br />+<br />++ifeq ($(run-built-tests),yes)<br />+ tes=
ts-special +=3D $(objpfx)check-local-headers.out<br />+ $(objpfx)check-loca=
l-headers.out: scripts/check-local-headers.sh<br />+ AWK=3D'$(AWK)' scripts=
/check-local-headers.sh \<br />+ "$(includedir)" "$(objpfx)" &lt; /dev/null=
 &gt; $@; \<br />+ $(evaluate-test)<br />++endif # $(run-built-tests) =3D y=
es<br />+<br />+ ifneq "$(headers)" ""<br />++ifeq ($(run-built-tests),yes)=
<br />+ # Special test of all the installed headers in this directory.<br /=
>+ tests-special +=3D $(objpfx)check-installed-headers-c.out<br />+ libof-c=
heck-installed-headers-c :=3D testsuite<br />+@@ -570,8 +575,10 @@ $(objpfx=
)check-installed-headers-c.out: \<br />+ $(filter-out -std=3D%,$(CFLAGS)) -=
D_ISOMAC $(+includes)" \<br />+ $(headers) &gt; $@; \<br />+ $(evaluate-tes=
t)<br />++endif # $(run-built-tests) =3D yes<br />+<br />+ ifneq "$(CXX)" "=
"<br />++ifeq ($(run-built-tests),yes)<br />+ tests-special +=3D $(objpfx)c=
heck-installed-headers-cxx.out<br />+ libof-check-installed-headers-cxx :=
=3D testsuite<br />+ $(objpfx)check-installed-headers-cxx.out: \<br />+@@ -=
581,14 +588,18 @@ $(objpfx)check-installed-headers-cxx.out: \<br />+ $(filt=
er-out -std=3D%,$(CXXFLAGS)) -D_ISOMAC $(+includes)" \<br />+ $(headers) &g=
t; $@; \<br />+ $(evaluate-test)<br />++endif # $(run-built-tests) =3D yes<=
br />+ endif # $(CXX)<br />+<br />++ifeq ($(run-built-tests),yes)<br />+ te=
sts-special +=3D $(objpfx)check-wrapper-headers.out<br />+ $(objpfx)check-w=
rapper-headers.out: scripts/check-wrapper-headers.py $(headers)<br />+ $(PY=
THON) $&lt; --root=3D. --subdir=3D. $(headers) \<br />+ --generated $(commo=
n-generated) &gt; $@; $(evaluate-test)<br />++endif # $(run-built-tests) =
=3D yes<br />+ endif # $(headers)<br />+<br />++ifeq ($(run-built-tests),ye=
s)<br />+ # Lint all Makefiles; including this one. Pass `pwd` as the sourc=
e<br />+ # directory since the top-level Makefile is in the root of the sou=
rce<br />+ # tree and these tests are run from there. We add light-weight l=
inting<br />+@@ -598,7 +609,9 @@ tests-special +=3D $(objpfx)lint-makefiles=
.out<br />+ $(objpfx)lint-makefiles.out: scripts/lint-makefiles.sh<br />+ $=
(SHELL) $&lt; "$(PYTHON)" `pwd` &gt; $@ ; \<br />+ $(evaluate-test)<br />++=
endif # $(run-built-tests) =3D yes<br />+<br />++ifeq ($(run-built-tests),y=
es)<br />+ # Link libc.a as a whole to verify that it does not contain mult=
iple<br />+ # definitions of any symbols.<br />+ tests-special +=3D $(objpf=
x)link-static-libc.out<br />+@@ -606,6 +619,7 @@ $(objpfx)link-static-libc.=
out:<br />+ $(LINK.o) $(whole-archive) -nostdlib -nostartfiles -r \<br />+ =
$(objpfx)libc.a -o /dev/null &gt; $@ 2&gt;&amp;1; \<br />+ $(evaluate-test)=
<br />++endif # $(run-built-tests) =3D yes<br />+<br />+ # Print test summa=
ry for tests in $1 .sum file;<br />+ # $2 is optional test identifier.<br /=
>+@@ -686,6 +700,7 @@ endif<br />+ rm -f $(symbolic-link-list)<br />+ touch=
 $(objpfx)testroot.pristine/install.stamp<br />+<br />++ifeq ($(run-built-t=
ests),yes)<br />+ tests-special-notdir =3D $(patsubst $(objpfx)%, %, $(test=
s-special))<br />+ tests: $(tests-special)<br />+ $(..)scripts/merge-test-r=
esults.sh -s $(objpfx) "" \<br />+@@ -700,6 +715,7 @@ xtests:<br />+ $(sort=
 $(subdirs)) \<br />+ &gt; $(objpfx)xtests.sum<br />+ $(call summarize-test=
s,xtests.sum, for extra tests)<br />++endif # $(run-built-tests) =3D yes<br=
 />+<br />+ # The realclean target is just like distclean for the parent, b=
ut we want<br />+ # the subdirs to know the difference in case they care.<b=
r />+diff --git a/Makerules b/Makerules<br />+index ada6168..40b5ef2 100644=
<br />+--- a/Makerules<br />++++ b/Makerules<br />+@@ -1232,6 +1232,7 @@ in=
clude $(patsubst %,$(..)libof-iterator.mk,$(cpp-srcs-left))<br />+ endif<br=
 />+<br />+ ifeq ($(build-shared),yes)<br />++ifeq ($(run-built-tests),yes)=
<br />+ # Generate normalized lists of symbols, versions, and data sizes.<b=
r />+ # This is handy for checking against existing library binaries.<br />=
+<br />+@@ -1321,6 +1322,7 @@ tests-special +=3D $(check-abi-list)<br />+ e=
ndif<br />+ endif<br />+<br />++endif # $(run-built-tests) =3D yes<br />+ e=
ndif<br />+<br />+ FORCE:<br />+diff --git a/Rules b/Rules<br />+index c8ad=
c00..5a77516 100644<br />+--- a/Rules<br />++++ b/Rules<br />+@@ -94,6 +94,=
7 @@ $(objpfx)check-installed-headers-c.out: \<br />+ ifneq "$(CXX)" ""<br =
/>+ # If a C++ compiler is available, also test that they can be compiled<b=
r />+ # in isolation as C++.<br />++ifeq ($(run-built-tests),yes)<br />+ te=
sts-special +=3D $(objpfx)check-installed-headers-cxx.out<br />+ libof-chec=
k-installed-headers-cxx :=3D testsuite<br />+ $(objpfx)check-installed-head=
ers-cxx.out: \<br />+@@ -103,8 +104,10 @@ $(objpfx)check-installed-headers-=
cxx.out: \<br />+ $(filter-out -std=3D%,$(CXXFLAGS)) -D_ISOMAC $(+includes)=
" \<br />+ $(headers) &gt; $@; \<br />+ $(evaluate-test)<br />++endif # $(r=
un-built-tests) =3D yes<br />+ endif # $(CXX)<br />+<br />++ifeq ($(run-bui=
lt-tests),yes)<br />+ # Test that a wrapper header exists in include/ for e=
ach non-sysdeps header.<br />+ # This script does not need $(py-env).<br />=
+ tests-special +=3D $(objpfx)check-wrapper-headers.out<br />+@@ -112,6 +11=
5,7 @@ $(objpfx)check-wrapper-headers.out: \<br />+ $(..)scripts/check-wrap=
per-headers.py $(headers)<br />+ $(PYTHON) $&lt; --root=3D$(..) --subdir=3D=
$(subdir) $(headers) &gt; $@; \<br />+ $(evaluate-test)<br />++endif # $(ru=
n-built-tests) =3D yes<br />+<br />+ # Test that none of the headers instal=
led by this directory use certain<br />+ # obsolete constructs (e.g. legacy=
 BSD typedefs superseded by stdint.h).<br />+@@ -153,9 +157,9 @@ tests: $(a=
ddprefix $(objpfx),$(filter-out $(tests-unsupported), \<br />+ $(tests-mall=
oc-check:%=3D%-malloc-check) \<br />+ $(tests-malloc-hugetlb1:%=3D%-malloc-=
hugetlb1) \<br />+ $(tests-malloc-hugetlb2:%=3D%-malloc-hugetlb2)) \<br />+=
- $(test-srcs)) $(tests-special) \<br />++ $(test-srcs)) \<br />+ $(tests-p=
rinters-programs)<br />+-xtests: tests $(xtests-special)<br />++xtests: tes=
ts<br />+ else # $(run-built-tests) !=3D no<br />+ # The $(xtests) dependen=
cy ensures that xtests are always built.<br />+ tests: $(tests:%=3D$(objpfx=
)%.out) $(tests-internal:%=3D$(objpfx)%.out) \<br />--<br />2.34.1<br /><br=
 /></blockquote>
</blockquote>
</div>

--SU8xytePvm06BIxkC9j4--

