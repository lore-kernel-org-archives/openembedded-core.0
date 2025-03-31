Return-Path: <semc.2042@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7879C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 11:13:31 +0000 (UTC)
Subject: Re: [scarthgap][PATCH] glibc-y2038-tests:add tests-special in run-built-tests yes
To: openembedded-core@lists.openembedded.org
From: "rajmohan r" <semc.2042@gmail.com>
X-Originating-Location: US (136.226.242.251)
X-Originating-Platform: Linux Chrome 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 31 Mar 2025 04:13:24 -0700
References: <CANNYZj-iggtcaaeJfD5opNQEr8A0TFaqaLuEuYwUCXrk=ZVoKw@mail.gmail.com>
In-Reply-To: <CANNYZj-iggtcaaeJfD5opNQEr8A0TFaqaLuEuYwUCXrk=ZVoKw@mail.gmail.com>
Message-ID: <32465.1743419604038823066@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="VxZF91B7Aw5SKe8F3wHG"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 11:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213966

--VxZF91B7Aw5SKe8F3wHG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 01:18 PM, Alexander Kanavin wrote:

>=20
> Thanks for the patch. It does need to be rebased to master, and
> submitted for that branch first, then backported to scarthgap.

I have done the patch for master branch also.
Checking the time difference with and without patch.
I will upload the patch for master branch.

Since the change is in 'Make[file/rules]' and 'Rules' file,
so upstreamed for scarthgap branch.
Once the scarthgap patch is reviewed and no comment or
any comment is present, this scarthgap patch will help to
avoid extra-work for master branch. Hence upstreamed to
scarthgap branch.

>=20
> Also, Khem can you take a look please?

Thanks for reviewing.

>=20
>=20
> Alex
>=20
> On Fri, 28 Mar 2025 at 13:40, rajmohan r via lists.openembedded.org
> <semc.2042=3Dgmail.com@lists.openembedded.org> wrote:
>=20
>> If 'run-built-tests' is 'yes' run the test binaries, else do not run
>> the test binaries.
>>=20
>> Currently its taking 13min to complete do_check() for glibc-y2038-tests.
>> Test binaries are run in do_check() stage though 'run-built-tests' is
>> set 'no'. Which is wrong hence include 'tests-special' target inside
>> the 'run-built-tests' condition when set to 'yes' to avoid running the
>> test binaries.
>>=20
>> Also remove 'tests-special' target from the 'tests' and 'xtests' list
>> when run-built-tests set to 'no' to avoid running test binaries.
>>=20
>> After this change, no binary is run and time to complete do_check()
>> stage is 3min.
>>=20
>> Upstream-Status: Inappropriate [oe-specific]
>>=20
>> Signed-off-by: rajmohan r <semc.2042@gmail.com>
>> ---
>> .../glibc/glibc-y2038-tests_2.39.bb | 1 +
>> ...tests-special-in-run-built-tests-yes.patch | 184 ++++++++++++++++++
>> 2 files changed, 185 insertions(+)
>> create mode 100644
>> meta/recipes-core/glibc/glibc/include-tests-special-in-run-built-tests-y=
es.patch
>>=20
>>=20
>> diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
>> b/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
>> index be49ca4cb7..90c112c12f 100644
>> --- a/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
>> +++ b/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
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
>> index 0000000000..25777be2eb
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
>> +Currently its taking 13min to complete do_check() for glibc-y2038-tests=
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
>> +stage is 3min.
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
>> +index c8b7e3f..2812e97 100644
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
>> +@@ -569,8 +574,10 @@ $(objpfx)check-installed-headers-c.out: \
>> + "$(CC) $(filter-out -std=3D%,$(CFLAGS)) -D_ISOMAC $(+includes)" \
>> + $(headers) > $@; \
>> + $(evaluate-test)
>> ++endif # $(run-built-tests) =3D yes
>> +
>> + ifneq "$(CXX)" ""
>> ++ifeq ($(run-built-tests),yes)
>> + tests-special +=3D $(objpfx)check-installed-headers-cxx.out
>> + libof-check-installed-headers-cxx :=3D testsuite
>> + $(objpfx)check-installed-headers-cxx.out: \
>> +@@ -579,14 +586,18 @@ $(objpfx)check-installed-headers-cxx.out: \
>> + "$(CXX) $(filter-out -std=3D%,$(CXXFLAGS)) -D_ISOMAC $(+includes)" \
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
>> +@@ -596,7 +607,9 @@ tests-special +=3D $(objpfx)lint-makefiles.out
>> + $(objpfx)lint-makefiles.out: scripts/lint-makefiles.sh
>> + $(SHELL) $< "$(PYTHON)" `pwd` > $@ ; \
>> + $(evaluate-test)
>> ++endif # $(run-built-tests) =3D yes
>> +
>> ++ifeq ($(run-built-tests),yes)
>> + # Link libc.a as a whole to verify that it does not contain multiple
>> + # definitions of any symbols.
>> + tests-special +=3D $(objpfx)link-static-libc.out
>> +@@ -604,6 +617,7 @@ $(objpfx)link-static-libc.out:
>> + $(LINK.o) $(whole-archive) -nostdlib -nostartfiles -r \
>> + $(objpfx)libc.a -o /dev/null > $@ 2>&1; \
>> + $(evaluate-test)
>> ++endif # $(run-built-tests) =3D yes
>> +
>> + # Print test summary for tests in $1 .sum file;
>> + # $2 is optional test identifier.
>> +@@ -684,6 +698,7 @@ endif
>> + rm -f $(symbolic-link-list)
>> + touch $(objpfx)testroot.pristine/install.stamp
>> +
>> ++ifeq ($(run-built-tests),yes)
>> + tests-special-notdir =3D $(patsubst $(objpfx)%, %, $(tests-special))
>> + tests: $(tests-special)
>> + $(..)scripts/merge-test-results.sh -s $(objpfx) "" \
>> +@@ -698,6 +713,7 @@ xtests:
>> + $(sort $(subdirs)) \
>> + > $(objpfx)xtests.sum
>> + $(call summarize-tests,xtests.sum, for extra tests)
>> ++endif # $(run-built-tests) =3D yes
>> +
>> + # The realclean target is just like distclean for the parent, but we
>> want
>> + # the subdirs to know the difference in case they care.
>> +diff --git a/Makerules b/Makerules
>> +index 00365bc..843f1c0 100644
>> +--- a/Makerules
>> ++++ b/Makerules
>> +@@ -1225,6 +1225,7 @@ include $(patsubst
>> %,$(..)libof-iterator.mk,$(cpp-srcs-left))
>> + endif
>> +
>> + ifeq ($(build-shared),yes)
>> ++ifeq ($(run-built-tests),yes)
>> + # Generate normalized lists of symbols, versions, and data sizes.
>> + # This is handy for checking against existing library binaries.
>> +
>> +@@ -1314,6 +1315,7 @@ tests-special +=3D $(check-abi-list)
>> + endif
>> + endif
>> +
>> ++endif # $(run-built-tests) =3D yes
>> + endif
>> +
>> + FORCE:
>> +diff --git a/Rules b/Rules
>> +index 9010c5d..6825f63 100644
>> +--- a/Rules
>> ++++ b/Rules
>> +@@ -93,6 +93,7 @@ $(objpfx)check-installed-headers-c.out: \
>> + ifneq "$(CXX)" ""
>> + # If a C++ compiler is available, also test that they can be compiled
>> + # in isolation as C++.
>> ++ifeq ($(run-built-tests),yes)
>> + tests-special +=3D $(objpfx)check-installed-headers-cxx.out
>> + libof-check-installed-headers-cxx :=3D testsuite
>> + $(objpfx)check-installed-headers-cxx.out: \
>> +@@ -101,8 +102,10 @@ $(objpfx)check-installed-headers-cxx.out: \
>> + "$(CXX) $(filter-out -std=3D%,$(CXXFLAGS)) -D_ISOMAC $(+includes)" \
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
>> +@@ -120,6 +123,7 @@ $(objpfx)check-obsolete-constructs.out: \
>> + $(..)scripts/check-obsolete-constructs.py $(headers)
>> + $(PYTHON) $^ > $@ 2>&1; \
>> + $(evaluate-test)
>> ++endif # $(run-built-tests) =3D yes
>> +
>> + endif # $(headers)
>> +
>> +@@ -146,9 +150,9 @@ ifeq ($(run-built-tests),no)
>> + tests: $(addprefix $(objpfx),$(filter-out $(tests-unsupported), \
>> + $(tests) $(tests-internal) \
>> + $(tests-container)) \
>> +- $(test-srcs)) $(tests-special) \
>> ++ $(test-srcs)) \
>> + $(tests-printers-programs)
>> +-xtests: tests $(xtests-special)
>> ++xtests: tests
>> + else
>> + tests: $(tests:%=3D$(objpfx)%.out) $(tests-internal:%=3D$(objpfx)%.out=
) \
>> + $(tests-container:%=3D$(objpfx)%.out) \
>> --
>> 2.34.1
>=20
>

--VxZF91B7Aw5SKe8F3wHG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, Mar 28, 2025 at 01:18 PM, Alexander Kanavin wrote:</div>
<div>
<blockquote>Thanks for the patch. It does need to be rebased to master, and=
<br />submitted for that branch first, then backported to scarthgap.</block=
quote>
I have done the patch for master branch also.</div>
<div>Checking the time difference with and without patch.</div>
<div>I will upload the patch for master branch.</div>
<div>&nbsp;</div>
<div>Since the change is in 'Make[file/rules]' and 'Rules' file,</div>
<div>so upstreamed for scarthgap branch.</div>
<div>Once the scarthgap patch is reviewed and no comment or</div>
<div>any comment is present, this scarthgap patch will help to</div>
<div>avoid extra-work for master branch. Hence upstreamed to</div>
<div>scarthgap branch.<br />
<blockquote>Also, Khem can you take a look please?</blockquote>
Thanks for reviewing.<br />
<blockquote><br />Alex<br /><br />On Fri, 28 Mar 2025 at 13:40, rajmohan r =
via lists.openembedded.org<br />&lt;semc.2042=3Dgmail.com@lists.openembedde=
d.org&gt; wrote:<br />
<blockquote>If 'run-built-tests' is 'yes' run the test binaries, else do no=
t run<br />the test binaries.<br /><br />Currently its taking 13min to comp=
lete do_check() for glibc-y2038-tests.<br />Test binaries are run in do_che=
ck() stage though 'run-built-tests' is<br />set 'no'. Which is wrong hence =
include 'tests-special' target inside<br />the 'run-built-tests' condition =
when set to 'yes' to avoid running the<br />test binaries.<br /><br />Also =
remove 'tests-special' target from the 'tests' and 'xtests' list<br />when =
run-built-tests set to 'no' to avoid running test binaries.<br /><br />Afte=
r this change, no binary is run and time to complete do_check()<br />stage =
is 3min.<br /><br />Upstream-Status: Inappropriate [oe-specific]<br /><br /=
>Signed-off-by: rajmohan r &lt;semc.2042@gmail.com&gt;<br />---<br />.../gl=
ibc/glibc-y2038-tests_2.39.bb | 1 +<br />...tests-special-in-run-built-test=
s-yes.patch | 184 ++++++++++++++++++<br />2 files changed, 185 insertions(+=
)<br />create mode 100644 meta/recipes-core/glibc/glibc/include-tests-speci=
al-in-run-built-tests-yes.patch<br /><br />diff --git a/meta/recipes-core/g=
libc/glibc-y2038-tests_2.39.bb b/meta/recipes-core/glibc/glibc-y2038-tests_=
2.39.bb<br />index be49ca4cb7..90c112c12f 100644<br />--- a/meta/recipes-co=
re/glibc/glibc-y2038-tests_2.39.bb<br />+++ b/meta/recipes-core/glibc/glibc=
-y2038-tests_2.39.bb<br />@@ -5,6 +5,7 @@ inherit ptest features_check<br /=
>REQUIRED_DISTRO_FEATURES =3D "ptest"<br /><br />SRC_URI +=3D "\<br />+ fil=
e://include-tests-special-in-run-built-tests-yes.patch \<br />file://run-pt=
est \<br />"<br /><br />diff --git a/meta/recipes-core/glibc/glibc/include-=
tests-special-in-run-built-tests-yes.patch b/meta/recipes-core/glibc/glibc/=
include-tests-special-in-run-built-tests-yes.patch<br />new file mode 10064=
4<br />index 0000000000..25777be2eb<br />--- /dev/null<br />+++ b/meta/reci=
pes-core/glibc/glibc/include-tests-special-in-run-built-tests-yes.patch<br =
/>@@ -0,0 +1,184 @@<br />+glibc-y2038-tests: include tests-special in run-b=
uilt-tests yes<br />+<br />+If 'run-built-tests' is 'yes' run the test bina=
ries, else do not run<br />+the test binaries.<br />+<br />+Currently its t=
aking 13min to complete do_check() for glibc-y2038-tests.<br />+Test binari=
es are run in do_check() stage though 'run-built-tests' is<br />+set 'no'. =
Which is wrong hence include 'tests-special' target inside<br />+the 'run-b=
uilt-tests' condition when set to 'yes' to avoid running the<br />+test bin=
aries.<br />+<br />+Also remove 'tests-special' target from the 'tests' and=
 'xtests' list<br />+when run-built-tests set to 'no' to avoid running test=
 binaries.<br />+<br />+After this change, no binary is run and time to com=
plete do_check()<br />+stage is 3min.<br />+<br />+Upstream-Status: Inappro=
priate [oe-specific]<br />+<br />+Signed-off-by: rajmohan r &lt;semc.2042@g=
mail.com&gt;<br />+---<br />+ Makefile | 16 ++++++++++++++++<br />+ Makerul=
es | 2 ++<br />+ Rules | 8 ++++++--<br />+ 3 files changed, 24 insertions(+=
), 2 deletions(-)<br />+<br />+diff --git a/Makefile b/Makefile<br />+index=
 c8b7e3f..2812e97 100644<br />+--- a/Makefile<br />++++ b/Makefile<br />+@@=
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
heck-installed-headers-c :=3D testsuite<br />+@@ -569,8 +574,10 @@ $(objpfx=
)check-installed-headers-c.out: \<br />+ "$(CC) $(filter-out -std=3D%,$(CFL=
AGS)) -D_ISOMAC $(+includes)" \<br />+ $(headers) &gt; $@; \<br />+ $(evalu=
ate-test)<br />++endif # $(run-built-tests) =3D yes<br />+<br />+ ifneq "$(=
CXX)" ""<br />++ifeq ($(run-built-tests),yes)<br />+ tests-special +=3D $(o=
bjpfx)check-installed-headers-cxx.out<br />+ libof-check-installed-headers-=
cxx :=3D testsuite<br />+ $(objpfx)check-installed-headers-cxx.out: \<br />=
+@@ -579,14 +586,18 @@ $(objpfx)check-installed-headers-cxx.out: \<br />+ "=
$(CXX) $(filter-out -std=3D%,$(CXXFLAGS)) -D_ISOMAC $(+includes)" \<br />+ =
$(headers) &gt; $@; \<br />+ $(evaluate-test)<br />++endif # $(run-built-te=
sts) =3D yes<br />+ endif # $(CXX)<br />+<br />++ifeq ($(run-built-tests),y=
es)<br />+ tests-special +=3D $(objpfx)check-wrapper-headers.out<br />+ $(o=
bjpfx)check-wrapper-headers.out: scripts/check-wrapper-headers.py $(headers=
)<br />+ $(PYTHON) $&lt; --root=3D. --subdir=3D. $(headers) \<br />+ --gene=
rated $(common-generated) &gt; $@; $(evaluate-test)<br />++endif # $(run-bu=
ilt-tests) =3D yes<br />+ endif # $(headers)<br />+<br />++ifeq ($(run-buil=
t-tests),yes)<br />+ # Lint all Makefiles; including this one. Pass `pwd` a=
s the source<br />+ # directory since the top-level Makefile is in the root=
 of the source<br />+ # tree and these tests are run from there. We add lig=
ht-weight linting<br />+@@ -596,7 +607,9 @@ tests-special +=3D $(objpfx)lin=
t-makefiles.out<br />+ $(objpfx)lint-makefiles.out: scripts/lint-makefiles.=
sh<br />+ $(SHELL) $&lt; "$(PYTHON)" `pwd` &gt; $@ ; \<br />+ $(evaluate-te=
st)<br />++endif # $(run-built-tests) =3D yes<br />+<br />++ifeq ($(run-bui=
lt-tests),yes)<br />+ # Link libc.a as a whole to verify that it does not c=
ontain multiple<br />+ # definitions of any symbols.<br />+ tests-special +=
=3D $(objpfx)link-static-libc.out<br />+@@ -604,6 +617,7 @@ $(objpfx)link-s=
tatic-libc.out:<br />+ $(LINK.o) $(whole-archive) -nostdlib -nostartfiles -=
r \<br />+ $(objpfx)libc.a -o /dev/null &gt; $@ 2&gt;&amp;1; \<br />+ $(eva=
luate-test)<br />++endif # $(run-built-tests) =3D yes<br />+<br />+ # Print=
 test summary for tests in $1 .sum file;<br />+ # $2 is optional test ident=
ifier.<br />+@@ -684,6 +698,7 @@ endif<br />+ rm -f $(symbolic-link-list)<b=
r />+ touch $(objpfx)testroot.pristine/install.stamp<br />+<br />++ifeq ($(=
run-built-tests),yes)<br />+ tests-special-notdir =3D $(patsubst $(objpfx)%=
, %, $(tests-special))<br />+ tests: $(tests-special)<br />+ $(..)scripts/m=
erge-test-results.sh -s $(objpfx) "" \<br />+@@ -698,6 +713,7 @@ xtests:<br=
 />+ $(sort $(subdirs)) \<br />+ &gt; $(objpfx)xtests.sum<br />+ $(call sum=
marize-tests,xtests.sum, for extra tests)<br />++endif # $(run-built-tests)=
 =3D yes<br />+<br />+ # The realclean target is just like distclean for th=
e parent, but we want<br />+ # the subdirs to know the difference in case t=
hey care.<br />+diff --git a/Makerules b/Makerules<br />+index 00365bc..843=
f1c0 100644<br />+--- a/Makerules<br />++++ b/Makerules<br />+@@ -1225,6 +1=
225,7 @@ include $(patsubst %,$(..)libof-iterator.mk,$(cpp-srcs-left))<br /=
>+ endif<br />+<br />+ ifeq ($(build-shared),yes)<br />++ifeq ($(run-built-=
tests),yes)<br />+ # Generate normalized lists of symbols, versions, and da=
ta sizes.<br />+ # This is handy for checking against existing library bina=
ries.<br />+<br />+@@ -1314,6 +1315,7 @@ tests-special +=3D $(check-abi-lis=
t)<br />+ endif<br />+ endif<br />+<br />++endif # $(run-built-tests) =3D y=
es<br />+ endif<br />+<br />+ FORCE:<br />+diff --git a/Rules b/Rules<br />=
+index 9010c5d..6825f63 100644<br />+--- a/Rules<br />++++ b/Rules<br />+@@=
 -93,6 +93,7 @@ $(objpfx)check-installed-headers-c.out: \<br />+ ifneq "$(C=
XX)" ""<br />+ # If a C++ compiler is available, also test that they can be=
 compiled<br />+ # in isolation as C++.<br />++ifeq ($(run-built-tests),yes=
)<br />+ tests-special +=3D $(objpfx)check-installed-headers-cxx.out<br />+=
 libof-check-installed-headers-cxx :=3D testsuite<br />+ $(objpfx)check-ins=
talled-headers-cxx.out: \<br />+@@ -101,8 +102,10 @@ $(objpfx)check-install=
ed-headers-cxx.out: \<br />+ "$(CXX) $(filter-out -std=3D%,$(CXXFLAGS)) -D_=
ISOMAC $(+includes)" \<br />+ $(headers) &gt; $@; \<br />+ $(evaluate-test)=
<br />++endif # $(run-built-tests) =3D yes<br />+ endif # $(CXX)<br />+<br =
/>++ifeq ($(run-built-tests),yes)<br />+ # Test that a wrapper header exist=
s in include/ for each non-sysdeps header.<br />+ # This script does not ne=
ed $(py-env).<br />+ tests-special +=3D $(objpfx)check-wrapper-headers.out<=
br />+@@ -120,6 +123,7 @@ $(objpfx)check-obsolete-constructs.out: \<br />+ =
$(..)scripts/check-obsolete-constructs.py $(headers)<br />+ $(PYTHON) $^ &g=
t; $@ 2&gt;&amp;1; \<br />+ $(evaluate-test)<br />++endif # $(run-built-tes=
ts) =3D yes<br />+<br />+ endif # $(headers)<br />+<br />+@@ -146,9 +150,9 =
@@ ifeq ($(run-built-tests),no)<br />+ tests: $(addprefix $(objpfx),$(filte=
r-out $(tests-unsupported), \<br />+ $(tests) $(tests-internal) \<br />+ $(=
tests-container)) \<br />+- $(test-srcs)) $(tests-special) \<br />++ $(test=
-srcs)) \<br />+ $(tests-printers-programs)<br />+-xtests: tests $(xtests-s=
pecial)<br />++xtests: tests<br />+ else<br />+ tests: $(tests:%=3D$(objpfx=
)%.out) $(tests-internal:%=3D$(objpfx)%.out) \<br />+ $(tests-container:%=
=3D$(objpfx)%.out) \<br />--<br />2.34.1</blockquote>
</blockquote>
</div>

--VxZF91B7Aw5SKe8F3wHG--

