Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D8FC55182
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 04:16:21 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33182.1785903371730464181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 21:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=iCK2hnm2;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.0.5.46] (unknown [70.37.26.58])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1CF9120B7169
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 21:15:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1CF9120B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1785903350;
	bh=7F8DHeYhJUzyzaShGKBeweIUft0pfk4kXf43EUTFbLg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=iCK2hnm2H6nKnArp8rJ4g0RxBqo2iPFf8EIo85C/g6zPvpuwJlXllLOIPxxnR0AJi
	 zz0nVVenSiNIKHZ0doeuHaGQ3NJRH/ebGQu/yzsI9OEnve9KP7Ets9VqapY8RfOUig
	 oi8eufF9NF0mKJl9lmPUq8k2vtKnInaHH4bcNCE8=
Content-Type: multipart/alternative;
 boundary="------------01Kz3udxboGvCaCJIYO45qcF"
Message-ID: <0948e3fd-adf5-4cda-bfc0-8b04e84d4d3f@linux.microsoft.com>
Date: Tue, 4 Aug 2026 22:16:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] bitbake.conf, rust-common.bbclass: include
 RUST_BUILD_SYS in the task hash
To: openembedded-core@lists.openembedded.org
References: <20260804220456.2342710-1-alhe@linux.microsoft.com>
 <18C8B9671621C916.3417489@lists.openembedded.org>
Content-Language: en-US
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <18C8B9671621C916.3417489@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 04:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242811

This is a multi-part message in MIME format.
--------------01Kz3udxboGvCaCJIYO45qcF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Apologies, I was planning on sending this particular one as RFC due to its intrusiveness and forgot.

Alejandro

On 8/4/2026 4:04 PM, Alejandro Hernandez Samaniego via 
lists.openembedded.org wrote:
> RUST_BUILD_SYS is currently listed in BB_BASEHASH_IGNORE_VARS, which
> tells bitbake that rust recipes should hash-match regardless of the
> build machine's triplet. In practice that is not true:
>
> rustc computes each crate's Strict Version Hash (SVH) using inputs
> that include the *stage0/stage1 bootstrap compiler* fingerprint, which
> in turn depends on the build host arch. That seed cascades through
> every dependent crate's mangled symbols and the packing order of
> rodata sections, so an sstate blob populated on one worker arch and
> reused on a differently-arched worker produces byte-different (but
> semantically identical) artifacts and fails the reproducibility
> selftest causing autobuilder intermittent issues when the sstate
> matches for the incorrect architecture.
>
> Remove RUST_BUILD_SYS from BB_BASEHASH_IGNORE_VARS so the task hash
> tracks the build triplet and mixed-arch autobuilder pools get an
> sstate miss instead of a silently-wrong hit. RUST_HOST_SYS and
> RUST_TARGET_SYS stay excluded because they're already covered by the
> target/host arch hash inputs.
>
> While this is not ideal, it should unblock the reproducible test case,
> another solution would be to patch rust sources manually and attempt
> to upstream that change.
>
> This also has the side-effect that multiple variants of the conflicting
> rust recipes sstate artifacts are created, but they'll be correctly used
> now in each architecture.
>
> Also add an explanatory comment next to the RUST_*_SYS[vardepvalue]
> declarations in rust-common.bbclass so future readers don't re-add
> the exclusion.
>
> Verified locally: Tier 1 sighash test toggling BUILD_ARCH now produces
> different task hashes for rust/libstd-rs/rpm-sequoia/python3-crypto-
> graphy/cargo/librsvg, where previously the hashes matched despite the
> build machine change.
>
> [YOCTO #15554]
>
> Assisted-by: AI - OpenAI
> Signed-off-by: Alejandro Hernandez<alhe@linux.microsoft.com>
> ---
>   meta/classes-recipe/rust-common.bbclass | 10 ++++++++++
>   meta/conf/bitbake.conf                  |  2 +-
>   2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
> index 6bc42016d1..98b46c4e3c 100644
> --- a/meta/classes-recipe/rust-common.bbclass
> +++ b/meta/classes-recipe/rust-common.bbclass
> @@ -114,6 +114,16 @@ RUST_HOST_SYS[vardepvalue] = "${RUST_HOST_SYS}"
>   RUST_TARGET_SYS = "${@rust_base_triple(d, 'TARGET')}"
>   RUST_TARGET_SYS[vardepvalue] = "${RUST_TARGET_SYS}"
>   
> +# Note: RUST_BUILD_SYS is intentionally NOT on BB_BASEHASH_IGNORE_VARS
> +# (see meta/conf/bitbake.conf). rustc's crate SVH (Strict Version Hash)
> +# is seeded by the stage0/stage1 bootstrap compiler whose fingerprint
> +# depends on the BUILD host arch; that seed cascades through every
> +# dependent crate's mangled symbols and rodata packing order. Excluding
> +# RUST_BUILD_SYS from task hashes let a mixed-arch autobuilder pool
> +# populate sstate on one worker arch and get a cache hit on a differently-
> +# arched worker, producing byte-different (but semantically identical)
> +# artifacts and failing reproducibility tests. See Yocto bug #15554.
> +
>   # wrappers to get around the fact that Rust needs a single
>   # binary but Yocto's compiler and linker commands have
>   # arguments. Technically the archiver is always one command but
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index bdf37d0da2..ee23459506 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -969,7 +969,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
>       SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
>       OMP_NUM_THREADS BB_CURRENTTASK"
>   BB_BASEHASH_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_INCLUDE_PATHS BUILDHISTORY_DIR \
> -    SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS RUST_TARGET_SYS"
> +    SSTATE_DIR SOURCE_DATE_EPOCH RUST_HOST_SYS RUST_TARGET_SYS"
>   BB_HASHCONFIG_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
>       SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_PASSTHROUGH_ADDITIONS DISABLE_SANITY_CHECKS \
>       PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242808):https://lists.openembedded.org/g/openembedded-core/message/242808
> Mute This Topic:https://lists.openembedded.org/mt/120602088/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [alhe@linux.microsoft.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------01Kz3udxboGvCaCJIYO45qcF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Apologies, I was planning on sending this particular one as RFC due to its intrusiveness and forgot.</pre>
    <pre>Alejandro</pre>
    <div class="moz-cite-prefix">On 8/4/2026 4:04 PM, Alejandro
      Hernandez Samaniego via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:18C8B9671621C916.3417489@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">RUST_BUILD_SYS is currently listed in BB_BASEHASH_IGNORE_VARS, which
tells bitbake that rust recipes should hash-match regardless of the
build machine's triplet. In practice that is not true:

rustc computes each crate's Strict Version Hash (SVH) using inputs
that include the *stage0/stage1 bootstrap compiler* fingerprint, which
in turn depends on the build host arch. That seed cascades through
every dependent crate's mangled symbols and the packing order of
rodata sections, so an sstate blob populated on one worker arch and
reused on a differently-arched worker produces byte-different (but
semantically identical) artifacts and fails the reproducibility
selftest causing autobuilder intermittent issues when the sstate
matches for the incorrect architecture.

Remove RUST_BUILD_SYS from BB_BASEHASH_IGNORE_VARS so the task hash
tracks the build triplet and mixed-arch autobuilder pools get an
sstate miss instead of a silently-wrong hit. RUST_HOST_SYS and
RUST_TARGET_SYS stay excluded because they're already covered by the
target/host arch hash inputs.

While this is not ideal, it should unblock the reproducible test case,
another solution would be to patch rust sources manually and attempt
to upstream that change.

This also has the side-effect that multiple variants of the conflicting
rust recipes sstate artifacts are created, but they'll be correctly used
now in each architecture.

Also add an explanatory comment next to the RUST_*_SYS[vardepvalue]
declarations in rust-common.bbclass so future readers don't re-add
the exclusion.

Verified locally: Tier 1 sighash test toggling BUILD_ARCH now produces
different task hashes for rust/libstd-rs/rpm-sequoia/python3-crypto-
graphy/cargo/librsvg, where previously the hashes matched despite the
build machine change.

[YOCTO #15554]

Assisted-by: AI - OpenAI
Signed-off-by: Alejandro Hernandez <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a>
---
 meta/classes-recipe/rust-common.bbclass | 10 ++++++++++
 meta/conf/bitbake.conf                  |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 6bc42016d1..98b46c4e3c 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -114,6 +114,16 @@ RUST_HOST_SYS[vardepvalue] = "${RUST_HOST_SYS}"
 RUST_TARGET_SYS = "${@rust_base_triple(d, 'TARGET')}"
 RUST_TARGET_SYS[vardepvalue] = "${RUST_TARGET_SYS}"
 
+# Note: RUST_BUILD_SYS is intentionally NOT on BB_BASEHASH_IGNORE_VARS
+# (see meta/conf/bitbake.conf). rustc's crate SVH (Strict Version Hash)
+# is seeded by the stage0/stage1 bootstrap compiler whose fingerprint
+# depends on the BUILD host arch; that seed cascades through every
+# dependent crate's mangled symbols and rodata packing order. Excluding
+# RUST_BUILD_SYS from task hashes let a mixed-arch autobuilder pool
+# populate sstate on one worker arch and get a cache hit on a differently-
+# arched worker, producing byte-different (but semantically identical)
+# artifacts and failing reproducibility tests. See Yocto bug #15554.
+
 # wrappers to get around the fact that Rust needs a single
 # binary but Yocto's compiler and linker commands have
 # arguments. Technically the archiver is always one command but
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdf37d0da2..ee23459506 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -969,7 +969,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
     OMP_NUM_THREADS BB_CURRENTTASK"
 BB_BASEHASH_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_INCLUDE_PATHS BUILDHISTORY_DIR \
-    SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS RUST_TARGET_SYS"
+    SSTATE_DIR SOURCE_DATE_EPOCH RUST_HOST_SYS RUST_TARGET_SYS"
 BB_HASHCONFIG_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_PASSTHROUGH_ADDITIONS DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#242808): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/242808">https://lists.openembedded.org/g/openembedded-core/message/242808</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/120602088/4354175">https://lists.openembedded.org/mt/120602088/4354175</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------01Kz3udxboGvCaCJIYO45qcF--

