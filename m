Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CB3CD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 09:07:03 +0000 (UTC)
Subject: Re: Debugging rust oe-selftest failures
To: openembedded-core@lists.openembedded.org
From: "Yash Shinde" <Yash.Shinde@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 04 Apr 2024 02:07:02 -0700
References: <CAO5Uq5Q4f4Q+3yR6JZcxhXOP_mpmyzJ0yYtO5SO1_6ZOwdHEzw@mail.gmail.com>
In-Reply-To: <CAO5Uq5Q4f4Q+3yR6JZcxhXOP_mpmyzJ0yYtO5SO1_6ZOwdHEzw@mail.gmail.com>
Message-ID: <6447.1712221622103634934@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="wlaT2oIIRJOYekefLsVD"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 09:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197951

--wlaT2oIIRJOYekefLsVD
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 05:51 PM, Alex Kiernan wrote:

>=20
> Hi Sundeep (or anyone else with insight on this!)
>=20
> How do you go about debugging rust oe-selftest failures? I've bumped
> everything up to 1.77 ( https://github.com/akiernan/poky ) but
> oe-selftest fails for reasons that aren't immediately obvious to me...
>=20
> https://gist.github.com/akiernan/6cc6131c1ec3af866098a9318679cf1b
>=20
> Any clues?
>=20
> --
> Alex Kiernan

Hi Alex,

I faced the same errors when I was working on to upgrade rust from 1.75 to =
1.76. I discussed it with rust upstream here, https://github.com/rust-lang/=
rust/issues/122075 and the following change solves those failures,

https://github.com/rust-lang/rust/issues/122075#issuecomment-1985153524

PR- https://github.com/rust-lang/rust/pull/122205/commits/5aece7fad06baaa74=
5784d118db862b3e3ccf7f8

After this change was backported to poky, the rust build was successful but=
 it was seen that not all the tests are executed.

While discussing upstream, it was known that removing the *--doc* option fr=
om *python3 src/bootstrap/bootstrap.py test --exclude<some excluded test ca=
ses list> --doc --no-fail-fast --bless --target x86_64-poky-linux-gnu* cmd =
in oeqa/selftest/cases/rust.py file execute the other tests also.

But, while doing so another set of failures are observed as mentioned in ht=
tps://github.com/rust-lang/rust/issues/122285

Complete log using --doc option- https://gist.github.com/Yashinde145/7db6bd=
4a064021bf756b0c0dd6c8777c

Complete log without using --doc option- https://gist.github.com/Yashinde14=
5/036a934f0523307859f7c855b83ecfd6 ( https://gist.github.com/Yashinde145/03=
6a934f0523307859f7c855b83ecfd6 ) (this file is truncated in gist due to lar=
ge size, please see Complete raw file ( https://gist.githubusercontent.com/=
Yashinde145/036a934f0523307859f7c855b83ecfd6/raw/f7bc4558eed66a10b65bb915f2=
92ae166d3bb52a/log_1_76_without_doc_flag.txt ) )

I am not very familiar to these failures but=C2=A0 trying to understand the=
m.

>=20
> failures:
>=20
> ---- markdown::term::tests::test_output stdout ----
>=20
>=20
>=20
> thread 'markdown::term::tests::test_output' panicked at
> compiler/rustc_errors/src/markdown/tests/term.rs:75:55:
>=20
>=20
>=20
> called `Result::unwrap()` on an `Err` value: Os { code: 2, kind: NotFound=
,
> message: "No such file or directory" }
>=20
>=20
>=20
> stack backtrace:
>=20
>=20
>=20
> 0: rust_begin_unwind
>=20
>=20
>=20
> 1: core::panicking::panic_fmt
>=20
>=20
>=20
> 2: core::result::unwrap_failed
>=20
>=20
>=20
> 3: rustc_errors::markdown::term::tests::test_output
>=20
>=20
>=20
> 4: <rustc_errors::markdown::term::tests::test_output::{closure#0} as
> core::ops::function::FnOnce<()>>::call_once
>=20
>=20
>=20
> note: Some details are omitted, run with `RUST_BACKTRACE=3Dfull` for a
> verbose backtrace.
>=20
>=20
>=20
> Running unittests src/lib.rs
> (/home/poky/build-st/tmp/work/core2-64-poky-linux/rust/1.76.0/rustc-1.76.=
0-src/build/bootstrap/debug/deps/bootstrap-214111e112557758)
>=20
>=20
>=20
>=20
> uploaded
> "/home/poky/build-st/tmp/work/core2-64-poky-linux/rust/1.76.0/rustc-1.76.=
0-src/build/bootstrap/debug/deps/bootstrap-214111e112557758",
> waiting for result
>=20
>=20
>=20
> thread 'main' panicked at src/tools/remote-test-client/src/main.rs:310:9:
>=20
>=20
>=20
> client.read_exact(&mut header) failed with failed to fill whole buffer
>=20
>=20
>=20
> stack backtrace:
>=20
>=20
>=20
> 0: rust_begin_unwind
>=20
>=20
>=20
> at
> /rustc/82e1608dfa6e0b5569232559e3d385fea5a93112/library/std/src/panicking=
.rs:645:5
>=20
>=20
>=20
>=20
> 1: core::panicking::panic_fmt
>=20
>=20
>=20
> at
> /rustc/82e1608dfa6e0b5569232559e3d385fea5a93112/library/core/src/panickin=
g.rs:72:14
>=20
>=20
>=20
>=20
> 2: remote_test_client::main
>=20
>=20
>=20
> note: Some details are omitted, run with `RUST_BACKTRACE=3Dfull` for a
> verbose backtrace.
>=20
>=20
>=20
> error: test failed, to rerun pass `--lib`
>=20
>=20
>=20
> error: 1 target failed:
>=20
>=20
>=20
> `--lib`
>=20
>=20
>=20
> finished in 16.730 seconds
>=20
>=20

Regards,

Yash

--wlaT2oIIRJOYekefLsVD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 05:51 PM, Alex Kiernan wrote:<br />
<blockquote>Hi Sundeep (or anyone else with insight on this!)<br /><br />Ho=
w do you go about debugging rust oe-selftest failures? I've bumped<br />eve=
rything up to 1.77 (<a href=3D"https://github.com/akiernan/poky" target=3D"=
_blank" rel=3D"noopener">https://github.com/akiernan/poky</a>) but<br />oe-=
selftest fails for reasons that aren't immediately obvious to me...<br /><b=
r /><a href=3D"https://gist.github.com/akiernan/6cc6131c1ec3af866098a931867=
9cf1b" target=3D"_blank" rel=3D"noopener">https://gist.github.com/akiernan/=
6cc6131c1ec3af866098a9318679cf1b</a><br /><br />Any clues?<br /><br />-- <b=
r />Alex Kiernan</blockquote>
<br />&nbsp;
<p>Hi Alex,</p>
<p>I faced the same errors when I was working on to upgrade rust from 1.75 =
to 1.76. I discussed it with rust upstream here,&nbsp;<a href=3D"https://gi=
thub.com/rust-lang/rust/issues/122075" target=3D"_blank" rel=3D"noopener">h=
ttps://github.com/rust-lang/rust/issues/122075</a>&nbsp;and the following c=
hange solves those failures,</p>
<p><a href=3D"https://github.com/rust-lang/rust/issues/122075#issuecomment-=
1985153524" target=3D"_blank" rel=3D"noopener">https://github.com/rust-lang=
/rust/issues/122075#issuecomment-1985153524</a></p>
<p>PR-&nbsp;<a href=3D"https://github.com/rust-lang/rust/pull/122205/commit=
s/5aece7fad06baaa745784d118db862b3e3ccf7f8" target=3D"_blank" rel=3D"noopen=
er">https://github.com/rust-lang/rust/pull/122205/commits/5aece7fad06baaa74=
5784d118db862b3e3ccf7f8</a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>After this change was backported to poky, the rust build was successful =
but it was seen that not all the tests are executed.</p>
<p>While discussing upstream, it was known that removing the <strong>--doc&=
nbsp;</strong>option from&nbsp;<em><strong>python3 src/bootstrap/bootstrap.=
py test --exclude&lt;some excluded test cases list&gt; --doc --no-fail-fast=
 --bless --target x86_64-poky-linux-gnu</strong>&nbsp;</em> cmd in <em>oeqa=
/selftest/cases/rust.py</em> file execute the other tests also.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>But, while doing so another set of failures are observed as mentioned in=
&nbsp;<a href=3D"https://github.com/rust-lang/rust/issues/122285" target=3D=
"_blank" rel=3D"noopener">https://github.com/rust-lang/rust/issues/122285</=
a></p>
<p>Complete log using --doc option-&nbsp;&nbsp;<a href=3D"https://gist.gith=
ub.com/Yashinde145/7db6bd4a064021bf756b0c0dd6c8777c" target=3D"_blank" rel=
=3D"noopener">https://gist.github.com/Yashinde145/7db6bd4a064021bf756b0c0dd=
6c8777c</a></p>
<p>Complete log without using --doc option-&nbsp;&nbsp;<a href=3D"https://g=
ist.github.com/Yashinde145/036a934f0523307859f7c855b83ecfd6" target=3D"_bla=
nk" rel=3D"noopener">https://gist.github.com/Yashinde145/036a934f0523307859=
f7c855b83ecfd6&nbsp;</a>(this file is truncated in gist due to large size, =
please see&nbsp;<a href=3D"https://gist.githubusercontent.com/Yashinde145/0=
36a934f0523307859f7c855b83ecfd6/raw/f7bc4558eed66a10b65bb915f292ae166d3bb52=
a/log_1_76_without_doc_flag.txt" target=3D"_blank" rel=3D"noopener">Complet=
e raw file</a>)</p>
<p>I am not very familiar to these failures but&nbsp; trying to understand =
them.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<blockquote>failures:
<p>---- markdown::term::tests::test_output stdout ----</p>
<p>thread 'markdown::term::tests::test_output' panicked at compiler/rustc_e=
rrors/src/markdown/tests/term.rs:75:55:</p>
<p>called `Result::unwrap()` on an `Err` value: Os { code: 2, kind: NotFoun=
d, message: "No such file or directory" }</p>
<p>stack backtrace:</p>
<p>&nbsp; &nbsp;0: rust_begin_unwind</p>
<p>&nbsp; &nbsp;1: core::panicking::panic_fmt</p>
<p>&nbsp; &nbsp;2: core::result::unwrap_failed</p>
<p>&nbsp; &nbsp;3: rustc_errors::markdown::term::tests::test_output</p>
<p>&nbsp; &nbsp;4: &lt;rustc_errors::markdown::term::tests::test_output::{c=
losure#0} as core::ops::function::FnOnce&lt;()&gt;&gt;::call_once</p>
<p>note: Some details are omitted, run with `RUST_BACKTRACE=3Dfull` for a v=
erbose backtrace.</p>
<p>Running unittests src/lib.rs (/home/poky/build-st/tmp/work/core2-64-poky=
-linux/rust/1.76.0/rustc-1.76.0-src/build/bootstrap/debug/deps/bootstrap-21=
4111e112557758)</p>
<p>uploaded "/home/poky/build-st/tmp/work/core2-64-poky-linux/rust/1.76.0/r=
ustc-1.76.0-src/build/bootstrap/debug/deps/bootstrap-214111e112557758", wai=
ting for result</p>
<p>thread 'main' panicked at src/tools/remote-test-client/src/main.rs:310:9=
:</p>
<p>client.read_exact(&amp;mut header) failed with failed to fill whole buff=
er</p>
<p>stack backtrace:</p>
<p>&nbsp; &nbsp;0: rust_begin_unwind</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;at /rustc/82e1608dfa6e0b=
5569232559e3d385fea5a93112/library/std/src/panicking.rs:645:5</p>
<p>&nbsp; &nbsp;1: core::panicking::panic_fmt</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;at /rustc/82e1608dfa6e0b=
5569232559e3d385fea5a93112/library/core/src/panicking.rs:72:14</p>
<p>&nbsp; &nbsp;2: remote_test_client::main</p>
<p>note: Some details are omitted, run with `RUST_BACKTRACE=3Dfull` for a v=
erbose backtrace.</p>
<p>error: test failed, to rerun pass `--lib`</p>
<p>error: 1 target failed:</p>
<p>&nbsp; &nbsp; `--lib`</p>
<p><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"> =
</span>finished in 16.730 seconds</span></p>
</blockquote>
<p>Regards,</p>
<p>Yash</p>
<p>&nbsp;</p>

--wlaT2oIIRJOYekefLsVD--

