Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACCAC0015E
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 12:20:09 +0000 (UTC)
Subject: Re: [PATCH] rust: Add failed test cases to exclude list for Rust Oe-selftest
To: openembedded-core@lists.openembedded.org
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 114
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 27 Jul 2023 05:20:02 -0700
References: <f48a214a-1209-87c5-badf-099c336003b2@windriver.com>
In-Reply-To: <f48a214a-1209-87c5-badf-099c336003b2@windriver.com>
Message-ID: <31108.1690460402157982218@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="CFLZbmUqWI1SVeWvJ8Lc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184931

--CFLZbmUqWI1SVeWvJ8Lc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 05:45 AM, Randy MacLeod wrote:

>=20
> I don't see this in master or master-next yet so see comments below and
> send a slightly updated v2.
>=20
> On 2023-07-26 12:25, Yash Shinde wrote:
>=20
>> Failed test cases are added to exclude list.
>> Drop
>> meta/recipes-devtools/rust/files/rust-oe-selftest.patch file.
>>=20
>> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com> (
>> Yash.Shinde@windriver.com )
>> ---
>>  meta/lib/oeqa/selftest/cases/rust.py    =20
>> |  209 +-
>>  .../rust/files/rust-oe-selftest.patch         | 2324
>> -----------------
>>  meta/recipes-devtools/rust/rust-source.inc    |    1 -
>>=20
>> 3 files changed, 208 insertions(+), 2326 deletions(-)
>>  delete mode 100644
>> meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>=20
>=20
>=20
> It's good to see the large patch be replaced with a 10x smaller rust.py
> change.
>=20
>=20
>=20
> If this change is acceptable to others, I'd like the commit log to be
> amended to explain
> how to (automatically?) update the exclude list when rust is updated.
> Alternatively
> we could add that to meta/recipes-devtools/rust/README-rust.md
> https://github.com/yoctoproject/poky/blob/master/meta/recipes-devtools/ru=
st/README-rust.md
>=20
>=20
>=20
>=20
> Is this a manual process now? Could it be mostly automated?
>=20
>=20
>=20
> Please sort the exclude list alphabetically in v2 so that it's
> easier for people to see what tests are being excluded (see below (*))
>=20
>=20
>=20
> I assume that this commit doesn't change the tests that are run but only
> moves the skipping from being a patch to the exclude list. Please confirm
> and in your v2 commit log, mention that as well as what the current numbe=
r
> of
> passed and skipped tests.
>=20
>=20

When updating to a newer version of Rust, it is manually needed to update t=
he exclude_list. The tests that fail are observed to work on some versions =
and fail on others.
I have updated the commit log in v2 and also mentioned the testing numbers =
for passed and skipped cases here, https://lists.openembedded.org/g/openemb=
edded-core/message/184926

>=20
>=20
>> diff --git a/meta/lib/oeqa/selftest/cases/rust.py
>> b/meta/lib/oeqa/selftest/cases/rust.py
>> index 7a0fd7033d..abd3ef8314 100644
>> --- a/meta/lib/oeqa/selftest/cases/rust.py
>> +++
>> b/meta/lib/oeqa/selftest/cases/rust.py
>> @@ -70,7 +70,214 @@ class
>> RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
>>   =20
>> # no-fail-fast: Run all tests regardless of failure.
>>              # bless:
>> First runs rustfmt to format the codebase,
>>              # then runs tidy
>> checks.
>> -            testargs =3D "--exclude tests/rustdoc --exclude
>> src/tools/rust-analyzer  --exclude tests/rustdoc-json  --exclude
>> tests/run-make-fulldeps --exclude src/tools/tidy --exclude
>> src/tools/rustdoc-themes --exclude src/rustdoc-json-types --exclude
>> src/librustdoc --exclude src/doc/unstable-book --exclude src/doc/rustdoc
>> --exclude src/doc/rustc --exclude compiler/rustc --exclude
>> library/panic_abort --exclude library/panic_unwind --exclude
>> src/tools/lint-docs  --exclude tests/rustdoc-js-std --doc --no-fail-fast
>> --bless"
>=20
>=20
>=20
> I think you're doing two things in the 2 lines above and the list below:
>=20
>=20
>=20
> 1. splitting up the testargs into one per line
>=20
>=20
>=20
> 2. adding an exclude list of tests that are know to fail.
>=20
>=20
>=20
> Is that true?
> If so can you use two seperate variables/lists to reflect the different
> intended purpose of each list?
> This should also help in maintaining each list and hopefully the tests
> that are exluded will all have a:
>=20
>=20
>=20
> tests/foo/bar.rs
>=20
>=20
>=20
> format rather than somewhat worrying prefixes like:
> compiler/rustc
>=20
>=20
>=20
> and
>=20
>=20
>=20
> library/panic_abort
>=20
>=20

The 'compiler/rustc', 'library/panic_abort' and similar other dir paths are=
 the part of test exclude_list since they fail during rust build. Actually,=
 the 'testargs' directly contained the excluded failing test dirs in previo=
us patch versions. Thus, added exclude_list as=C2=A0 a separate list for fa=
iling test cases and dirs which is then added to testargs with other args l=
ike '--doc --no-fail-fast --bless'.

>=20
>=20
>> +            exclude_list =3D """  --exclude tests/run-make
>=20
> If python will let you, please split this line like this:
> +            exclude_list =3D """=20
> +                               =20
> --exclude tests/run-make
>=20
> to separate the variables from the list name to
> make future updates a bit easier.
>=20
>> +                                --exclude
>> tests/run-make/pgo-branch-weights/
>> +                              =20
>> --exclude tests/ui/macros/restricted-shadowing-legacy.rs
>> +               =20
>> --exclude tests/ui-fulldeps/issue-14021.rs
>>=20
>>=20
>>=20
>=20
>=20
>=20
> ><snip>< -- the middle bits of the long unsorted list.
>=20
>=20
>=20
>=20
>=20
>=20
>> +                                --exclude library/panic_unwind
>> +        =20
>> --exclude src/tools/lint-docs
>> +                                --exclude
>> tests/rustdoc-js-std"""
>=20
>=20
>=20
> Similarly, if python will let you, put the terminating triple quote on a
> new line with proper identation of course.
>=20
>=20
>=20
> These last two comments are "nice-to-have" so just call me a python newbi=
e
> if that's not possible or is not pythonic!
>=20
>=20

Modified the patch in v2 accordingly along with alphabetically sorted exclu=
de_list.

>=20
>=20
>> +
>> +            exclude_fail_tests =3D exclude_list.split("\n")
>> +          =20
>> exclude_fail_tests =3D " ".join(exclude_fail_tests)
>> +
>> +            # Add
>> exclude_fail_tests with other test arguments
>> +            testargs =3D=20
>> exclude_fail_tests + " --doc --no-fail-fast --bless"
>> =20
>>              # Set
>> path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.
>>          =20
>> cmd =3D " export PATH=3D%s/recipe-sysroot-native/usr/bin:$PATH;" % rustl=
ibpath
>> diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>>=20
>=20
>=20
>=20
>=20
> ><snip><=C2=A0 -- giant 10x bigger than it needs to be patch
>=20
>=20
>=20
>=20
>=20
>=20
>> -diff --git a/tests/run-make/pointer-auth-link-with-c/Makefile
>> b/tests/run-make/pointer-auth-link-with-c/Makefile
>> -index
>> dffbd303582..5347d0a90f1 100644
>> ----
>> a/tests/run-make/pointer-auth-link-with-c/Makefile
>> -+++
>> b/tests/run-make/pointer-auth-link-with-c/Makefile
>> -@@ -1,3 +1,4 @@
>> -+#
>> ignore-stage1
>> - include ../tools.mk
>> -=20
>> - # only-aarch64
>> diff --git
>> a/meta/recipes-devtools/rust/rust-source.inc
>> b/meta/recipes-devtools/rust/rust-source.inc
>> index 8b9199e9ab..4a720e645b
>> 100644
>> --- a/meta/recipes-devtools/rust/rust-source.inc
>> +++
>> b/meta/recipes-devtools/rust/rust-source.inc
>> @@ -6,7 +6,6 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${=
RUST_VERSION}-src.tar.xz;n
>> file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=3D${RUSTS=
RC}
>> \
>>              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
>>           =20
>> file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=3D=
${RUSTSRC}
>> \
>> -            file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
>>       =20
>> file://bootstrap_fail.patch;patchdir=3D${RUSTSRC} \
>>  " (
>> https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;nfile=
://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=3D${RUSTSRC}\fil=
e://zlib-off64_t.patch;patchdir=3D${RUSTSRC}\file://0001-musl-Define-SOCK_S=
EQPACKET-in-common-place.patch;patchdir=3D${RUSTSRC}\-file://rust-oe-selfte=
st.patch;patchdir=3D${RUSTSRC}\file://bootstrap_fail.patch;patchdir=3D${RUS=
TSRC}\
>> )
>>  SRC_URI[rust.sha256sum] =3D
>> "bb8e9c564566b2d3228d95de9063a9254182446a161353f1d843bfbaf5c34639"
>>=20
>=20
>=20
>=20
> *
> The sorted list so people (mostly me!) can see what is being skipped.
> I'm tempted to ask about some of the exclusions but I'll leave that for
> another time.
>=20
>=20
>=20
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --exclude compiler/rustc
> ><snip>< -- the middle bits of the long unsorted list.
>=20
>=20
>=20
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --exclude
> tests/ui/simd/target-feature-mixup.rs
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --exclude
> tests/ui/structs-enums/multiple-reprs.rs
>=20
>=20
>=20
> Better, eh?
>=20
>=20
>=20
> Thanks for the quick turn-around on this nice change!
>=20
> --=20
> # Randy MacLeod
> # Wind River Linux

--CFLZbmUqWI1SVeWvJ8Lc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 05:45 AM, Randy MacLeod wrote:<br />
<blockquote>
<div class=3D"moz-cite-prefix">I don't see this in master or master-next ye=
t so see comments below and<br />send a slightly updated v2.</div>
<div class=3D"moz-cite-prefix">&nbsp;</div>
<div class=3D"moz-cite-prefix">On 2023-07-26 12:25, Yash Shinde wrote:</div=
>
<blockquote cite=3D"mid:20230726162530.2119-1-Yash.Shinde@windriver.com">
<pre class=3D"moz-quote-pre">Failed test cases are added to exclude list.
Drop meta/recipes-devtools/rust/files/rust-oe-selftest.patch file.

Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/rust.py          |  209 +-
 .../rust/files/rust-oe-selftest.patch         | 2324 -----------------
 meta/recipes-devtools/rust/rust-source.inc    |    1 -
 3 files changed, 208 insertions(+), 2326 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/files/rust-oe-selftest.patch=
</pre>
</blockquote>
<p>It's good to see the large patch be replaced with a 10x smaller rust.py =
change.</p>
<p>If this change is acceptable to others, I'd like the commit log to be am=
ended to explain<br />how to (automatically?) update the exclude list when =
rust is updated. Alternatively<br />we could add that to meta/recipes-devto=
ols/rust/README-rust.md<br />&nbsp; <a class=3D"moz-txt-link-freetext" href=
=3D"https://github.com/yoctoproject/poky/blob/master/meta/recipes-devtools/=
rust/README-rust.md">https://github.com/yoctoproject/poky/blob/master/meta/=
recipes-devtools/rust/README-rust.md</a></p>
<p>Is this a manual process now? Could it be mostly automated?</p>
<p>Please sort the exclude list alphabetically in v2 so that it's <br />eas=
ier for people to see what tests are being excluded (see below (*))</p>
<p>I assume that this commit doesn't change the tests that are run but only=
<br />moves the skipping from being a patch to the exclude list. Please con=
firm<br />and in your v2 commit log, mention that as well as what the curre=
nt number of<br />passed and skipped tests.</p>
</blockquote>
<div><span style=3D"font-size: 14px;">When updating to a newer version of R=
ust, it is manually needed to update the exclude_list. The tests that fail =
are observed to&nbsp;</span><span style=3D"font-size: 14px;">work on some v=
ersions and fail on others.</span></div>
<div><span style=3D"font-size: 14px;">I have updated the commit log in v2 a=
nd also mentioned the testing numbers for passed and skipped cases here,&nb=
sp;<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/18=
4926" target=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g/o=
penembedded-core/message/184926</a>&nbsp;</span>&nbsp;</div>
<blockquote>
<blockquote cite=3D"mid:20230726162530.2119-1-Yash.Shinde@windriver.com">
<pre class=3D"moz-quote-pre">diff --git a/meta/lib/oeqa/selftest/cases/rust=
.py b/meta/lib/oeqa/selftest/cases/rust.py
index 7a0fd7033d..abd3ef8314 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -70,7 +70,214 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OE=
PTestResultTestCase):
             # no-fail-fast: Run all tests regardless of failure.
             # bless: First runs rustfmt to format the codebase,
             # then runs tidy checks.
-            testargs =3D "--exclude tests/rustdoc --exclude src/tools/rust=
-analyzer  --exclude tests/rustdoc-json  --exclude tests/run-make-fulldeps =
--exclude src/tools/tidy --exclude src/tools/rustdoc-themes --exclude src/r=
ustdoc-json-types --exclude src/librustdoc --exclude src/doc/unstable-book =
--exclude src/doc/rustdoc --exclude src/doc/rustc --exclude compiler/rustc =
--exclude library/panic_abort --exclude library/panic_unwind --exclude src/=
tools/lint-docs  --exclude tests/rustdoc-js-std --doc --no-fail-fast --bles=
s"</pre>
</blockquote>
<p>I think you're doing two things in the 2 lines above and the list below:=
</p>
<p>&nbsp;1. splitting up the testargs into one per line</p>
<p>&nbsp;2. adding an exclude list of tests that are know to fail.</p>
<p>Is that true? <br />If so can you use two seperate variables/lists to re=
flect the different intended purpose of each list?<br />This should also he=
lp in maintaining each list and hopefully the tests that are exluded will a=
ll have a:</p>
<p>&nbsp;&nbsp; tests/foo/bar.rs</p>
<p>format rather than somewhat worrying prefixes like:<br />&nbsp;&nbsp; co=
mpiler/rustc</p>
<p>and</p>
<p>&nbsp;&nbsp; library/panic_abort</p>
</blockquote>
The 'compiler/rustc', 'library/panic_abort' and similar other dir paths are=
 the part of test exclude_list since they fail during rust build. Actually,=
 the 'testargs' directly contained the excluded failing test dirs in previo=
us patch versions. Thus, added exclude_list as&nbsp; a separate list for fa=
iling test cases and dirs which is then added to testargs with other args l=
ike '--doc --no-fail-fast --bless'.&nbsp;<br />
<blockquote>
<blockquote cite=3D"mid:20230726162530.2119-1-Yash.Shinde@windriver.com">
<pre class=3D"moz-quote-pre">+            exclude_list =3D """  --exclude t=
ests/run-make</pre>
</blockquote>
If python will let you, please split this line like this:<br />
<pre class=3D"moz-quote-pre">+            exclude_list =3D """=20
+                                 --exclude tests/run-make

to separate the variables from the list name to make future updates a bit e=
asier.
</pre>
<blockquote cite=3D"mid:20230726162530.2119-1-Yash.Shinde@windriver.com">
<pre class=3D"moz-quote-pre">+                                --exclude tes=
ts/run-make/pgo-branch-weights/
+                                --exclude tests/ui/macros/restricted-shado=
wing-legacy.rs
+                                --exclude tests/ui-fulldeps/issue-14021.rs


</pre>
</blockquote>
<p>&gt;&lt;snip&gt;&lt; -- the middle bits of the long unsorted list.</p>
<p>&nbsp;</p>
<blockquote cite=3D"mid:20230726162530.2119-1-Yash.Shinde@windriver.com">
<pre class=3D"moz-quote-pre">+                                --exclude lib=
rary/panic_unwind
+                                --exclude src/tools/lint-docs
+                                --exclude tests/rustdoc-js-std"""</pre>
</blockquote>
<p>Similarly, if python will let you, put the terminating triple quote on a=
 new line with proper identation of course.</p>
<p>These last two comments are "nice-to-have" so just call me a python newb=
ie if that's not possible or is not pythonic!</p>
</blockquote>
Modified the patch in v2 accordingly along with alphabetically sorted exclu=
de_list.<br />
<blockquote>
<blockquote cite=3D"mid:20230726162530.2119-1-Yash.Shinde@windriver.com">
<pre class=3D"moz-quote-pre">+
+            exclude_fail_tests =3D exclude_list.split("\n")
+            exclude_fail_tests =3D " ".join(exclude_fail_tests)
+
+            # Add exclude_fail_tests with other test arguments
+            testargs =3D  exclude_fail_tests + " --doc --no-fail-fast --bl=
ess"
=20
             # Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hos=
ttools.
             cmd =3D " export PATH=3D%s/recipe-sysroot-native/usr/bin:$PATH=
;" % rustlibpath
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta=
/recipes-devtools/rust/files/rust-oe-selftest.patch
</pre>
</blockquote>
<br />
<p>&gt;&lt;snip&gt;&lt;&nbsp; -- giant 10x bigger than it needs to be patch=
</p>
<p>&nbsp;</p>
<blockquote cite=3D"mid:20230726162530.2119-1-Yash.Shinde@windriver.com">
<pre class=3D"moz-quote-pre">-diff --git a/tests/run-make/pointer-auth-link=
-with-c/Makefile b/tests/run-make/pointer-auth-link-with-c/Makefile
-index dffbd303582..5347d0a90f1 100644
---- a/tests/run-make/pointer-auth-link-with-c/Makefile
-+++ b/tests/run-make/pointer-auth-link-with-c/Makefile
-@@ -1,3 +1,4 @@
-+# ignore-stage1
- include ../tools.mk
-=20
- # only-aarch64
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 8b9199e9ab..4a720e645b 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -6,7 +6,6 @@ SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"htt=
ps://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;nfile://000=
1-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=3D${RUSTSRC}\file://zl=
ib-off64_t.patch;patchdir=3D${RUSTSRC}\file://0001-musl-Define-SOCK_SEQPACK=
ET-in-common-place.patch;patchdir=3D${RUSTSRC}\-file://rust-oe-selftest.pat=
ch;patchdir=3D${RUSTSRC}\file://bootstrap_fail.patch;patchdir=3D${RUSTSRC}\=
">"https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=
=3D${RUSTSRC} \
             file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;p=
atchdir=3D${RUSTSRC} \
-            file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
             file://bootstrap_fail.patch;patchdir=3D${RUSTSRC} \
 "</a>
 SRC_URI[rust.sha256sum] =3D "bb8e9c564566b2d3228d95de9063a9254182446a16135=
3f1d843bfbaf5c34639"
</pre>
</blockquote>
<p>*<br />The sorted list so people (mostly me!) can see what is being skip=
ped.<br />I'm tempted to ask about some of the exclusions but I'll leave th=
at for another time.</p>
<p><br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --exclude compiler/rustc<br =
/>&gt;&lt;snip&gt;&lt; -- the middle bits of the long unsorted list.</p>
<p><br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --exclude tests/ui/simd/targ=
et-feature-mixup.rs<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --exclude te=
sts/ui/structs-enums/multiple-reprs.rs</p>
<p>Better, eh?</p>
<p>Thanks for the quick turn-around on this nice change!</p>
<pre class=3D"moz-signature">--=20
# Randy MacLeod
# Wind River Linux</pre>
</blockquote>

--CFLZbmUqWI1SVeWvJ8Lc--

