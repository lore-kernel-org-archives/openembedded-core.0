Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE3FC56205
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 15:50:20 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22439.1786031410953200139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 08:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=JLR6q/Ii;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.0.5.46] (unknown [70.37.26.62])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6678C20B710C;
	Thu,  6 Aug 2026 08:49:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6678C20B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1786031388;
	bh=xScQ+AHcvJRr54CFhX7GaYzuD3/E08pfc6ahM+S4vvI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=JLR6q/Ii8EsNDR8sdDPp4d+HkB0/nEx8NLI1yUKgTGDfa1dCNwSMzP2wOFYEZd+Ss
	 30J9NCjqaeOb+a+KsWRavuE+eFbZ0kOwMQ1EleaJYLmla1Kpj9YMozQA6JwfNYG6nL
	 zoTGTuywTOzdWoavhQt6UV/Kwk7MiYKcRsGKlV9Q=
Content-Type: multipart/alternative;
 boundary="------------CUltoy2mrvR5MeE4vCt4522a"
Message-ID: <0add5cde-b000-4147-bce7-8844067d250a@linux.microsoft.com>
Date: Thu, 6 Aug 2026 09:50:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] bitbake.conf, rust-common.bbclass: include
 RUST_BUILD_SYS in the task hash
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20260804220456.2342710-1-alhe@linux.microsoft.com>
 <20260804220456.2342710-4-alhe@linux.microsoft.com>
 <90b9c09acf04cca3d4d03e03b14577b0c1c63e11.camel@linuxfoundation.org>
Content-Language: en-US
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <90b9c09acf04cca3d4d03e03b14577b0c1c63e11.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 15:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242952

This is a multi-part message in MIME format.
--------------CUltoy2mrvR5MeE4vCt4522a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 8/6/2026 6:53 AM, Richard Purdie via lists.openembedded.org wrote:
> On Tue, 2026-08-04 at 22:04 +0000, Alejandro Hernandez Samaniego via li=
sts.openembedded.org wrote:
>> RUST_BUILD_SYS is currently listed in BB_BASEHASH_IGNORE_VARS, which
>> tells bitbake that rust recipes should hash-match regardless of the
>> build machine's triplet. In practice that is not true:
>>
>> rustc computes each crate's Strict Version Hash (SVH) using inputs
>> that include the *stage0/stage1 bootstrap compiler* fingerprint, which
>> in turn depends on the build host arch. That seed cascades through
>> every dependent crate's mangled symbols and the packing order of
>> rodata sections, so an sstate blob populated on one worker arch and
>> reused on a differently-arched worker produces byte-different (but
>> semantically identical) artifacts and fails the reproducibility
>> selftest causing autobuilder intermittent issues when the sstate
>> matches for the incorrect architecture.
>>
>> Remove RUST_BUILD_SYS from BB_BASEHASH_IGNORE_VARS so the task hash
>> tracks the build triplet and mixed-arch autobuilder pools get an
>> sstate miss instead of a silently-wrong hit. RUST_HOST_SYS and
>> RUST_TARGET_SYS stay excluded because they're already covered by the
>> target/host arch hash inputs.
>>
>> While this is not ideal, it should unblock the reproducible test case,
>> another solution would be to patch rust sources manually and attempt
>> to upstream that change.
>>
>> This also has the side-effect that multiple variants of the conflictin=
g
>> rust recipes sstate artifacts are created, but they'll be correctly us=
ed
>> now in each architecture.
>>
>> Also add an explanatory comment next to the RUST_*_SYS[vardepvalue]
>> declarations in rust-common.bbclass so future readers don't re-add
>> the exclusion.
>>
>> Verified locally: Tier 1 sighash test toggling BUILD_ARCH now produces
>> different task hashes for rust/libstd-rs/rpm-sequoia/python3-crypto-
>> graphy/cargo/librsvg, where previously the hashes matched despite the
>> build machine change.
>>
>> [YOCTO #15554]
>>
>> Assisted-by: AI - OpenAI
>> Signed-off-by: Alejandro Hernandez<alhe@linux.microsoft.com>
>> ---
>>  =C2=A0meta/classes-recipe/rust-common.bbclass | 10 ++++++++++
>>  =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>  =C2=A02 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-re=
cipe/rust-common.bbclass
>> index 6bc42016d1..98b46c4e3c 100644
>> --- a/meta/classes-recipe/rust-common.bbclass
>> +++ b/meta/classes-recipe/rust-common.bbclass
>> @@ -114,6 +114,16 @@ RUST_HOST_SYS[vardepvalue] =3D "${RUST_HOST_SYS}"
>>  =C2=A0RUST_TARGET_SYS =3D "${@rust_base_triple(d, 'TARGET')}"
>>  =C2=A0RUST_TARGET_SYS[vardepvalue] =3D "${RUST_TARGET_SYS}"
>>  =20
>> +# Note: RUST_BUILD_SYS is intentionally NOT on BB_BASEHASH_IGNORE_VAR=
S
>> +# (see meta/conf/bitbake.conf). rustc's crate SVH (Strict Version Has=
h)
>> +# is seeded by the stage0/stage1 bootstrap compiler whose fingerprint
>> +# depends on the BUILD host arch; that seed cascades through every
>> +# dependent crate's mangled symbols and rodata packing order. Excludi=
ng
>> +# RUST_BUILD_SYS from task hashes let a mixed-arch autobuilder pool
>> +# populate sstate on one worker arch and get a cache hit on a differe=
ntly-
>> +# arched worker, producing byte-different (but semantically identical=
)
>> +# artifacts and failing reproducibility tests. See Yocto bug #15554.
>> +
>>  =C2=A0# wrappers to get around the fact that Rust needs a single
>>  =C2=A0# binary but Yocto's compiler and linker commands have
>>  =C2=A0# arguments. Technically the archiver is always one command but
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index bdf37d0da2..ee23459506 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -969,7 +969,7 @@ BB_HASHEXCLUDE_COMMON ?=3D "TMPDIR FILE PATH PWD B=
B_TASKHASH BBPATH BBSERVER DL_DI
>>  =C2=A0=C2=A0=C2=A0=C2=A0 SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HAS=
HSERVE GIT_CEILING_DIRECTORIES \
>>  =C2=A0=C2=A0=C2=A0=C2=A0 OMP_NUM_THREADS BB_CURRENTTASK"
>>  =C2=A0BB_BASEHASH_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} PSEUDO_I=
NCLUDE_PATHS BUILDHISTORY_DIR \
>> -=C2=A0=C2=A0=C2=A0 SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_H=
OST_SYS RUST_TARGET_SYS"
>> +=C2=A0=C2=A0=C2=A0 SSTATE_DIR SOURCE_DATE_EPOCH RUST_HOST_SYS RUST_TA=
RGET_SYS"
>>  =C2=A0BB_HASHCONFIG_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} DATE T=
IME SSH_AGENT_PID \
>>  =C2=A0=C2=A0=C2=A0=C2=A0 SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_PASSTHROUG=
H_ADDITIONS DISABLE_SANITY_CHECKS \
>>  =C2=A0=C2=A0=C2=A0=C2=A0 PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV B=
B_INVALIDCONF BBINCLUDED \
> Just to be clear, the sstatetests fail for this change for good reason,
> it breaks the way "native" works in our system. We work on the
> principle that "native" things work the same way regardless of
> architecture and that the sstate hashes remain the same.
>
> If you change this as above all of the rust targets will rebuild
> depending on the build architecture, despite the fact they're meant to
> be build architecture independent. It might manage to fool the test but
> the output would still not be build architecture independent and hence
> doesn't fix the real issue, just hides it from the tests.
>
> Cheers,
>
> Richard

Yes, that makes sense, the good thing is I think the root cause is correc=
t, but if we instead patch rusts sources
we'll end up with the same problem since the packages would also be arch =
independent, correct?

Is the correct thing here to add packages to an ignore/allow list?


Alejandro

>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242942):https://lists.openembedded.org/g/openembedd=
ed-core/message/242942
> Mute This Topic:https://lists.openembedded.org/mt/120602088/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [a=
lhe@linux.microsoft.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------CUltoy2mrvR5MeE4vCt4522a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 8/6/2026 6:53 AM, Richard Purdie vi=
a
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:90b9c09acf04cca3d4d03e03b14577b0c1c63e11.camel@linuxfoundatio=
n.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Tue, 2026-08-04 at 22:04 =
+0000, Alejandro Hernandez Samaniego via lists.openembedded.org wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">RUST_BUILD_SYS is currentl=
y listed in BB_BASEHASH_IGNORE_VARS, which
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
Signed-off-by: Alejandro Hernandez <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a=
>
---
=C2=A0meta/classes-recipe/rust-common.bbclass | 10 ++++++++++
=C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
=C2=A02 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recip=
e/rust-common.bbclass
index 6bc42016d1..98b46c4e3c 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -114,6 +114,16 @@ RUST_HOST_SYS[vardepvalue] =3D "${RUST_HOST_SYS}"
=C2=A0RUST_TARGET_SYS =3D "${@rust_base_triple(d, 'TARGET')}"
=C2=A0RUST_TARGET_SYS[vardepvalue] =3D "${RUST_TARGET_SYS}"
=C2=A0
+# Note: RUST_BUILD_SYS is intentionally NOT on BB_BASEHASH_IGNORE_VARS
+# (see meta/conf/bitbake.conf). rustc's crate SVH (Strict Version Hash)
+# is seeded by the stage0/stage1 bootstrap compiler whose fingerprint
+# depends on the BUILD host arch; that seed cascades through every
+# dependent crate's mangled symbols and rodata packing order. Excluding
+# RUST_BUILD_SYS from task hashes let a mixed-arch autobuilder pool
+# populate sstate on one worker arch and get a cache hit on a differentl=
y-
+# arched worker, producing byte-different (but semantically identical)
+# artifacts and failing reproducibility tests. See Yocto bug #15554.
+
=C2=A0# wrappers to get around the fact that Rust needs a single
=C2=A0# binary but Yocto's compiler and linker commands have
=C2=A0# arguments. Technically the archiver is always one command but
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdf37d0da2..ee23459506 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -969,7 +969,7 @@ BB_HASHEXCLUDE_COMMON ?=3D "TMPDIR FILE PATH PWD BB_T=
ASKHASH BBPATH BBSERVER DL_DI
=C2=A0=C2=A0=C2=A0=C2=A0 SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSER=
VE GIT_CEILING_DIRECTORIES \
=C2=A0=C2=A0=C2=A0=C2=A0 OMP_NUM_THREADS BB_CURRENTTASK"
=C2=A0BB_BASEHASH_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} PSEUDO_INCLU=
DE_PATHS BUILDHISTORY_DIR \
-=C2=A0=C2=A0=C2=A0 SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST=
_SYS RUST_TARGET_SYS"
+=C2=A0=C2=A0=C2=A0 SSTATE_DIR SOURCE_DATE_EPOCH RUST_HOST_SYS RUST_TARGE=
T_SYS"
=C2=A0BB_HASHCONFIG_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} DATE TIME =
SSH_AGENT_PID \
=C2=A0=C2=A0=C2=A0=C2=A0 SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_PASSTHROUGH_AD=
DITIONS DISABLE_SANITY_CHECKS \
=C2=A0=C2=A0=C2=A0=C2=A0 PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_IN=
VALIDCONF BBINCLUDED \
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Just to be clear, the sstatetests fail for this change for good reason,
it breaks the way "native" works in our system. We work on the
principle that "native" things work the same way regardless of
architecture and that the sstate hashes remain the same.

If you change this as above all of the rust targets will rebuild
depending on the build architecture, despite the fact they're meant to
be build architecture independent. It might manage to fool the test but
the output would still not be build architecture independent and hence
doesn't fix the real issue, just hides it from the tests.

Cheers,

Richard</pre>
    </blockquote>
    <pre>Yes, that makes sense, the good thing is I think the root cause =
is correct, but if we instead patch rusts sources
we'll end up with the same problem since the packages would also be arch =
independent, correct?

Is the correct thing here to add packages to an ignore/allow list?


Alejandro

</pre>
    <blockquote type=3D"cite"
cite=3D"mid:90b9c09acf04cca3d4d03e03b14577b0c1c63e11.camel@linuxfoundatio=
n.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#242942): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/242942">https:/=
/lists.openembedded.org/g/openembedded-core/message/242942</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/120602088/4354175">https://lists.openembedded.org/mt=
/120602088/4354175</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------CUltoy2mrvR5MeE4vCt4522a--

