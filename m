Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E29C88E7F
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 15:53:26 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147.1789487596608068326
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 08:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=nU4k1Yod;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.0.5.46] (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id ECEB720B7169;
	Tue, 15 Sep 2026 08:52:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ECEB720B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1789487550;
	bh=bP/P0DsJZOeQ4LrGHdv7yr73hYYOUxNnd/nEhObLNXI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nU4k1YodBeIjlb98lu+uXwcuQpoQWF7DgxhXfPdAHNUN9fSk8hw9Al6XRY11IuVvM
	 HumnwSDARc7Hxv+6x6sjZvb6EjmgEpNKLTaAUNcXyVmSILZ+02TgVx/xTeJH3/VXLF
	 fwMQmdyjgR1o/5p0uE7TnlM0Apf/hjpymBrWEYVM=
Content-Type: multipart/alternative;
 boundary="------------d0Jc0jPoYdZMOROkN9D0dk0G"
Message-ID: <b8a0599c-a7e4-44b5-b8c9-6a72d14a70fc@linux.microsoft.com>
Date: Tue, 15 Sep 2026 09:53:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/5] rust: reproducibility fixes for arm build
 hosts
To: SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
 Randy.Macleod@windriver.com, alejandro@enedino.org
References: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
Content-Language: en-US
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 15:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245859

This is a multi-part message in MIME format.
--------------d0Jc0jPoYdZMOROkN9D0dk0G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hopefully these fix reproducibility issue when built from different hosts.

Unfortunately these go in a bit of a different way than my next version, so I
will wait for the result before sending to avoid confusion, but I'm fine with these
if they work, lets just add my sign off to the actual patches based off of mine
instead of the "Patch from Alejandro + OE link".

Cheers

Alejandro

On 9/15/2026 8:18 AM, Dora, Sunil Kumar via lists.openembedded.org wrote:
> From: Sunil Dora<sunilkumar.dora@windriver.com>
>
> The reproducible selftest fails for rust on the arm workers
> ([YOCTO #16376]). This series fixes that.
>
> rust: drop the cc object-name reproducibility patch
> rust: hash cc object names relative to their source roots
>
>    The patch we carried trimmed the build path by matching the string
>    "rustc", and the shared-source rework broke that for one of the two
>    sets of sources cc compiles. The replacement strips the roots the
>    sources actually come from. The OUT_DIR part is proposed upstream as
>    https://github.com/rust-lang/cc-rs/pull/1902.
>    The RUST_COMPILER_RT_ROOT part is specific to rust's own build
>    system, so it is not part of that pull request.
>
> rust: keep the build host triple out of cargo unit metadata
>
>    From Alejandro Enedino Hernandez Samaniego's strict-version-hash
>    series, carried with his sign-off:
>    https://lists.openembedded.org/g/openembedded-core/topic/120939810
>    cargo mixes the "host:" line of "rustc -vV" into build script and
>    proc-macro metadata, and target crates inherit it.
>    Upstream report:https://github.com/rust-lang/cargo/issues/8140
>
> rust: backport deterministic DocLinkResMap serialisation
>
>    Upstream commit f9d9939 by jprochazk and mejrs. It is in rust 1.99,
>    so this drops out at the next rust upgrade.
>
> rust: sort hygiene data before it is encoded
>
>    Also from Alejandro's series. Upstream is fixing the same problem
>    with a different approach in
>    https://github.com/rust-lang/rust/pull/161450, which is still open.
>
> Alejandro's StableCrateId patch is not included: the value it pins is
> already host-independent in our builds, and it broke three rust test
> suite cases when the autobuilder tested it.
>
> Tested on the autobuilder: the x86 reproducible builder green with
> zero differing packages, the rust test suite green, and on both arm
> builders rust, rust-dbg, rust-rustdoc and libstd-rs-dev gone from the
> failing list.
>
>
> Sunil Dora (5):
>    rust: drop the cc object-name reproducibility patch
>    rust: hash cc object names relative to their source roots
>    rust: keep the build host triple out of cargo unit metadata
>    rust: backport deterministic DocLinkResMap serialisation
>    rust: sort hygiene data before it is encoded
>
>   ...-host-triple-from-unit-metadata-hash.patch |  62 ++++++++++
>   ...oc-link-metadata-order-deterministic.patch |  40 ++++++
>   ...hygiene-encoding-order-deterministic.patch |  58 +++++++++
>   ...ject-names-relative-to-source-roots.patch} | 116 +++++++++---------
>   meta/recipes-devtools/rust/rust-source.inc    |   5 +-
>   5 files changed, 224 insertions(+), 57 deletions(-)
>   create mode 100644 meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
>   create mode 100644 meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
>   create mode 100644 meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch
>   rename meta/recipes-devtools/rust/files/{repro-issue-fix-with-cc-crate-hashmap.patch => cc-hash-object-names-relative-to-source-roots.patch} (70%)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245843):https://lists.openembedded.org/g/openembedded-core/message/245843
> Mute This Topic:https://lists.openembedded.org/mt/121261374/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [alhe@linux.microsoft.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------d0Jc0jPoYdZMOROkN9D0dk0G
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hopefully these fix reproducibility issue when built from different hosts.

Unfortunately these go in a bit of a different way than my next version, so I
will wait for the result before sending to avoid confusion, but I'm fine with these
if they work, lets just add my sign off to the actual patches based off of mine
instead of the "Patch from Alejandro + OE link".

Cheers

Alejandro</pre>
    <div class="moz-cite-prefix">On 9/15/2026 8:18 AM, Dora, Sunil Kumar
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20260915141834.1212812-1-sunilkumar.dora@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Sunil Dora <a class="moz-txt-link-rfc2396E" href="mailto:sunilkumar.dora@windriver.com">&lt;sunilkumar.dora@windriver.com&gt;</a>

The reproducible selftest fails for rust on the arm workers
([YOCTO #16376]). This series fixes that.

rust: drop the cc object-name reproducibility patch
rust: hash cc object names relative to their source roots

  The patch we carried trimmed the build path by matching the string
  "rustc", and the shared-source rework broke that for one of the two
  sets of sources cc compiles. The replacement strips the roots the
  sources actually come from. The OUT_DIR part is proposed upstream as
  <a class="moz-txt-link-freetext" href="https://github.com/rust-lang/cc-rs/pull/1902">https://github.com/rust-lang/cc-rs/pull/1902</a>.
  The RUST_COMPILER_RT_ROOT part is specific to rust's own build
  system, so it is not part of that pull request.

rust: keep the build host triple out of cargo unit metadata

  From Alejandro Enedino Hernandez Samaniego's strict-version-hash
  series, carried with his sign-off:
  <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/topic/120939810">https://lists.openembedded.org/g/openembedded-core/topic/120939810</a>
  cargo mixes the "host:" line of "rustc -vV" into build script and
  proc-macro metadata, and target crates inherit it.
  Upstream report: <a class="moz-txt-link-freetext" href="https://github.com/rust-lang/cargo/issues/8140">https://github.com/rust-lang/cargo/issues/8140</a>

rust: backport deterministic DocLinkResMap serialisation

  Upstream commit f9d9939 by jprochazk and mejrs. It is in rust 1.99,
  so this drops out at the next rust upgrade.

rust: sort hygiene data before it is encoded

  Also from Alejandro's series. Upstream is fixing the same problem
  with a different approach in
  <a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/pull/161450">https://github.com/rust-lang/rust/pull/161450</a>, which is still open.

Alejandro's StableCrateId patch is not included: the value it pins is
already host-independent in our builds, and it broke three rust test
suite cases when the autobuilder tested it.

Tested on the autobuilder: the x86 reproducible builder green with
zero differing packages, the rust test suite green, and on both arm
builders rust, rust-dbg, rust-rustdoc and libstd-rs-dev gone from the
failing list.


Sunil Dora (5):
  rust: drop the cc object-name reproducibility patch
  rust: hash cc object names relative to their source roots
  rust: keep the build host triple out of cargo unit metadata
  rust: backport deterministic DocLinkResMap serialisation
  rust: sort hygiene data before it is encoded

 ...-host-triple-from-unit-metadata-hash.patch |  62 ++++++++++
 ...oc-link-metadata-order-deterministic.patch |  40 ++++++
 ...hygiene-encoding-order-deterministic.patch |  58 +++++++++
 ...ject-names-relative-to-source-roots.patch} | 116 +++++++++---------
 meta/recipes-devtools/rust/rust-source.inc    |   5 +-
 5 files changed, 224 insertions(+), 57 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
 create mode 100644 meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
 create mode 100644 meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch
 rename meta/recipes-devtools/rust/files/{repro-issue-fix-with-cc-crate-hashmap.patch =&gt; cc-hash-object-names-relative-to-source-roots.patch} (70%)

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#245843): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/245843">https://lists.openembedded.org/g/openembedded-core/message/245843</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/121261374/4354175">https://lists.openembedded.org/mt/121261374/4354175</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------d0Jc0jPoYdZMOROkN9D0dk0G--

