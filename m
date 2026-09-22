Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F37C982FF
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 13:40:46 +0000 (UTC)
Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10422.1790084337184167020
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 06:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=muUPkxZC;
 spf=pass (domain: baylibre.com, ip: 74.125.228.99, mailfrom: tgamblin@baylibre.com)
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso6556729a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 06:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790084335; x=1790689135; darn=lists.openembedded.org;
        h=in-reply-to:references:from:to:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WH+Y0Y4tVrsAoFVdXVrFTOSSnqtFe4HDLEvWh4K/5Ho=;
        b=muUPkxZC9gSmahsFrUfdnRkLsUD5fLGXvNG/EAf3YV5C+NjSVQeaVDHUWVkzTNeHTA
         /l5iDJ3ri9NtqWBz0sIO9yPF63sZ0NPiUa0Hi1H4Z6T+pa/NC5ivoS2whZRtsHfzDOdV
         PyG0neCBiLymirmUauUeEvo8tWT04/G2Akrf08XhBYjSgUdYXxFmHDD/JrMbB9x6rDBN
         dKPrRn0iutqYoeitiTv8HVRdl0pOGBsm7+iJpBjmZV/qZiBNJgzuFCMKhLmD8Uw5eF+x
         QiCzp5WYr7PVoqwiHsjoEBDFmT93ca10raWWKyv/piu8q/aFX0dqIPbouERx/tvyXvhJ
         J2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084335; x=1790689135;
        h=in-reply-to:references:from:to:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WH+Y0Y4tVrsAoFVdXVrFTOSSnqtFe4HDLEvWh4K/5Ho=;
        b=BLHpH9Zd8tbHtKXlwd5k+dhNSLptgnZSOO0/32i1IOIHPG6b+RruQTEc8yuifqaRsK
         Op6pWY/vW4l6XWeyfaXDe842/3szXVcPfUpSSkFYzLvOiX2RGlAJIdOM89q4qtCW07U5
         1NXkAWyGEfGNqZQfHTJckmv1+rMZsKNcIfAkXzAesjUvETVvFJwufHGMdQDgqy+omz/9
         OVFuIpS07XuPAY7U7CXoUD8A+py6b/8LOu7v8Vw5muJCD1SfUomxTm5BaUSRpDwrIOVB
         mXcbSgnCjJjgR0+zesdjLMsxc0LSnLnMkjp8/Lt8oq5QQ1/xQX9K1CS48+O5hvolGukQ
         Ap4w==
X-Forwarded-Encrypted: i=1; AKwUvBxPuJO8Z3JkpgWgV/BGxholjUcKVUFDNvWbrW+wyFLLhs3MEXaz0ZWSI4imOpfe3p1pfEeUoLD2pk2uiTf6GkwQVg==@lists.openembedded.org
X-Gm-Message-State: AFuF++llXRzJXNaXsmG7vPMAWPk5OyD5VlgbJzwZJ8jTqpb4sD9T98bt
	VkcpJMHFsAP4clTLkjBspbObvbab9YYmI5OYJa7FRQA4ovAcIc04ZVDwinJApM3ryHU=
X-Gm-Gg: AYBFou1U23YkM07WKs+j8JcDH3GCAzjWEM937M0YQN6+ooWpt8TLBxKmx4cGZ6ENY1b
	OyWQvJkLPKIkWxgK557n3ZI5rXMAF3MGvOTrBlySV0sQsZqXU0tUMnp5H3988RYVt2sjCi3dDUy
	c6Evl5AAi2guJzO/qte5XKx4hvXMFN4St1RHhyicmbbI04HQTPiMOJ6PuNAkFKUes99RZGvlf88
	uUQFtnrH7ZNM/rshABLO/ovNVnFNfTn2C62YQHHUZBrC+T4IC0PibZwJJx5oFfDSMo7jfJprz8y
	Ep0HDzsR2TDK2IrLrMjw4F3mzIw1+m3tH3oOgOK7CbeUReVtQwMJjaMzNTg9+6tZJHzIAB8rott
	H81b15FMbOg6Pv2YFhmon3+fSu4NpQrmhgLT7KNxPtrmcPH+9NQh2VyNYudyPtmNXOlJbTRazZ6
	Xwx/nEBEveqDyfrG2q3hAkGyTITEy/iBKl5MDX7YCDTqOiwqD7zGAV1gTHVouvtoK1UjYEs/sop
	/BA7DhfXIAA21kQ+FuKK28/R7BlVC/YiQ==
X-Received: by 2002:a05:6402:304c:b0:6a6:c4b:c92f with SMTP id 4fb4d7f45d1cf-6aa564b623amr8457531a12.9.1790084335195;
        Tue, 22 Sep 2026 06:38:55 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa431935csm1132072a12.0.2026.09.22.06.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:38:54 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 22 Sep 2026 09:38:53 -0400
Message-Id: <DLLVXPXUJIV3.32MF2EO90TEFR@baylibre.com>
Subject: Re: [OE-core] [PATCH] ptest-packagelists.inc: disable gnutls for RISCV64
To: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20260918090731.467954-1-joaomarcos.costa@bootlin.com>
 <DLL938ATXJZ6.KL4GU5AB1OH0@baylibre.com>
 <fd3722a7-d7aa-47cd-b20d-72762f9177f1@bootlin.com>
In-Reply-To: <fd3722a7-d7aa-47cd-b20d-72762f9177f1@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 13:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246415

On Tue Sep 22, 2026 at 4:01 AM EDT, Joao Marcos Costa wrote:
> Hello, Trevor
>
> On 9/21/26 9:44 PM, Trevor Gamblin wrote:
>> On Fri Sep 18, 2026 at 5:07 AM EDT, Jo=C3=A3o Marcos Costa wrote:
>>> Timeouts have been observed (very frequently in the past weeks)
>>> in the autobuilder, and a bug [1] was filed at Bugzilla.
>>>
>>> For now, it's not quite clear what specific test case is causing the ti=
meout.
>>>
>>> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162
>>=20
>> I think that this change is too aggressive given what we actually see in=
 the AB
>> issue - most of the logs seem to show a timeout at the same part of the =
ptest
>> run, after the 'mini-record' test. I'm doing some investigation locally =
to see
>> what the heaviest tests in the suite are, so that we can more surgically=
 disable
>> only the problematic ones instead.
>
> Well, it was agressive indeed, considering how frequent this one became=
=20
> in the past few weeks, and I was not 100% happy to send this patch=20
> either way.
>
> So thanks a lot for narrowing it down. I can send a v2 later this week=20
> to handle the worst offenders (as per your comment in bugzilla).

Sure! Let me know if I can help.
>
>> Trevor
>>>
>>> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>>> ---
>>>   meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/con=
f/distro/include/ptest-packagelists.inc
>>> index 79e27f617b..9b264657bb 100644
>>> --- a/meta/conf/distro/include/ptest-packagelists.inc
>>> +++ b/meta/conf/distro/include/ptest-packagelists.inc
>>> @@ -163,8 +163,8 @@ PTESTS_PROBLEMS:append:riscv32 =3D " lttng-tools st=
race"
>>>   PTESTS_SLOW:append:libc-musl =3D " libc-test"
>>>  =20
>>>   # These tests don't yet pass for riscv64
>>> -PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-too=
ls python3-numpy perl glib-2.0 zstd"
>>> -PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace lttn=
g-tools python3-numpy perl glib-2.0 zstd"
>>> +PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-too=
ls python3-numpy perl glib-2.0 zstd gnutls"
>>> +PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace lttn=
g-tools python3-numpy perl glib-2.0 zstd gnutls"
>>>  =20
>>>   # These tests don't yet pass for musl qemuarm64
>>>   PTESTS_SLOW:remove:libc-musl:qemuarm64 =3D "strace perl gnutls glib-2=
.0"
>>=20
>>=20
>>=20
>>=20
>>=20
>>=20



