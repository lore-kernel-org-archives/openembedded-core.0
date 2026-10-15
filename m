Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BC0CC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:40:34 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4852.1792089989348183192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 11:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Xnm4isVh;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93ece7a73b9so713199285a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 11:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792089988; x=1792694788; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DEp4/6nkbtDWNlWrdMmldkCKsqPhEiKr8oOTIA0Lizc=;
        b=Xnm4isVhslPw1GHYplZDDldS7bkIKuplRJVBbimrgaNooPMqNfzebO/PIDQQApI+Ha
         Pxn7Tx1Tnt+IR8GDPwB+IT6CN3FPJq19dzniZV7vt6MhDzQkAKkPbWi72GUqtWbhuVRq
         O8GdxAO6nNwSnb63Znyqs5SxPgQBSUQAtfn/CGcMhYuING3ZQKLSa6wfDvrF8lj1Ghtf
         nFcKCac20hSp7b3gYrb2gkAKEDTXTxT1tpIkxVHzSgWweTo+u4LFQSdgRD9jMBdspVU+
         60bmE9JedCgt+sK0hwfpjhp7onPn/fMYNqxuY1uRXuhiF/j5JAVPLeFFmvBIbxlEmUfx
         Cu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792089988; x=1792694788;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEp4/6nkbtDWNlWrdMmldkCKsqPhEiKr8oOTIA0Lizc=;
        b=MCRtlyYv5fN6NvLdUJPZYkDJvg3GevdNf2xSJ/siAYGoS2g+SDxFmAhu0SCU2GhPuh
         8IeLYS41XJX82mI2ozk1uLz9IS507F18wCsgPOaRARAg/qNSywv+ancnzReRXLxW4k28
         mU3oJWoSpk7fv/gfc8WGkVqBs06FLkv+n+9cGdUVUVXYvchMkFlcsfVD6pasdb9su4TR
         7khi/Q+uoKpE0ChWfXyVVdUNhwaZGzxj6U4FLfb1129YROylL9q1Ltqxto4825a7PFMJ
         +mAYAU/m31QhT+Z78z8DvBuHK0VwtpZHqr9GaYwUOSCfdWLrehqjaQWmsCkuO7TCXtjj
         jocg==
X-Forwarded-Encrypted: i=1; AKwUvByJfDp6SchJXb4rOIRbxW+c5Xh+iQgkaDCpHOgTJ5V3E5nosoFO/8R6mTJ6I9gAGopOgqEEJHod1QgBxV08eTBwNA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKND8sWgA5rm/R9akdV6BY9JApO3+rDnkuoR5ZoFhK0mOeaGlGa
	MkiLqOEnpGJZmCqK3y0Ae1tUFgfzpKOj6Skq3gMtkiD78H/WxSsY4q0Mp1iDamza+nA=
X-Gm-Gg: AYBFou24kFwBsKDjGzmTyQ1/n/uku89mF46XsLlm0yjJwFWx/Hoehs2it+fsN72rnMD
	/RCPtaAvKoqHmo3oAl/b0spXp0v2pEf2J1MLLpr/bD/W6kXJUQ53fIzhYcyR3/IKBOM8kQYsfNK
	modUwFmJ2fx5xn+tHMI/JUKTdJCkFura3B6P9Ac2l9FkY3So5/fM3o2H0NDCiIUOA/e5lexZJnj
	42OOXlpao98SIJ1TqTtTYBfIjNmyvmn4PwwQTqCvHx+/bSoLApkX15LyxMMKwxKpfhUdr06XIk+
	c1HqrBr8jpG2JASwDj6Qtipv9AwWIVp6hoHl06xZq2bgmDcl9N59c9YWl1QZ+LBFm3OxbxuGQ58
	KD0MTwp8J+BmhX56fs3DTzyK2/PNKzR7rDbvEq9Sn1W3g/OpHxEa5ZUOMFJye46iYPcqYZ2NTQl
	Ur2Y6UUYjzgTEqOXV/ut43TSuxl5UpNr99FlqlLeLm2uVqNL4wymbn0EsimA0ciqEQfpY+JwHre
	zLFSqPjR8cMMpniGw4pX0ePgV6uE+YfIw==
X-Received: by 2002:a05:620a:7118:b0:93e:54d2:2285 with SMTP id af79cd13be357-93ebd249076mr3192068885a.33.1792089987874;
        Thu, 15 Oct 2026 11:46:27 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a16c21esm3682785a.16.2026.10.15.11.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 11:46:27 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 15 Oct 2026 14:46:24 -0400
Message-Id: <DM5MVPEC4VF9.29QPH3XUX3XRF@baylibre.com>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Subject: Re: [OE-core][PATCH RFC v2 01/19] tune-riscv: be explicit about riscv32gc, riscv64gc defaults
Cc: <raj.khem@gmail.com>
To: "Mark Hatle" <mark.hatle@kernel.crashing.org>, "Trevor Gamblin"
 <tgamblin@baylibre.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
 <20260930-riscv-tuning-rework-v2-1-9e29f3531d0e@baylibre.com>
 <d5460230-1fd9-48b5-a854-d9140dbe04c8@kernel.crashing.org>
In-Reply-To: <d5460230-1fd9-48b5-a854-d9140dbe04c8@kernel.crashing.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247907

On Thu Oct 8, 2026 at 11:19 AM EDT, Mark Hatle wrote:
> Sorry for the late reply, but I missed this when it came in.
>
> On 9/30/26 11:38 AM, Trevor Gamblin wrote:
>> The string 'riscv64' is a generic descriptor for the 64-bit RISC-V ISA,
>> and can mean different things under different contexts. In the case of
>> tune-riscv.inc, it has served as an alias for the 'riscv64gc' profile
>> which packages are typically built against, resulting in the following
>> output (from a typical bitbake preamble):
>>=20
>> |TUNE_FEATURES        =3D "rv 64 i m a f d c zicsr zifencei"
>>=20
>> Modify tune-riscv.inc to avoid overloading the 'riscv64' string in this
>> way, instead setting DEFAULTTUNE to 'riscv64gc', and changing other
>> occurrences to match. TUNE_FEATURES remains the same under this
>> adjustment, but the .inc file is clearer which profile is being
>> targeted.
>>=20
>> Do the same for riscv32 -> riscv32gc. In this case, we also need to
>> update qemuriscv32.conf, since it sets DEFAULTTUNE to override the
>> default.
>>=20
>> Also add TUNE_FEATURE aliases for the old riscv32 and riscv64 names so
>> that other layers using them don't break.
>>=20
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   meta/conf/machine/include/riscv/tune-riscv.inc | 18 ++++++++++++------
>>   meta/conf/machine/qemuriscv32.conf             |  2 +-
>>   2 files changed, 13 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/=
machine/include/riscv/tune-riscv.inc
>> index 12c1125c8b..8a14971d5f 100644
>> --- a/meta/conf/machine/include/riscv/tune-riscv.inc
>> +++ b/meta/conf/machine/include/riscv/tune-riscv.inc
>> @@ -1,15 +1,21 @@
>>   require conf/machine/include/riscv/arch-riscv.inc
>>  =20
>> -DEFAULTTUNE ?=3D "riscv64"
>> +DEFAULTTUNE ?=3D "riscv64gc"
>>  =20
>> -AVAILTUNES +=3D "riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
>> +AVAILTUNES +=3D "riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64n=
f riscv32nf"
>
> I am in favor of the above.  The original riscv64 was there only for lega=
cy=20
> compatibility, but I never liked it.  Being more specific, especially on=
=20
> _embedded_ riscv systems seems like a good thing to me.

Thanks! I think I'll re-submit the simplest changes like these, since they =
can
be taken with little or no further review.
>
> --Mark
>
>>   # Default
>> -TUNE_FEATURES:tune-riscv64 :=3D "${@oe.tune.riscv_isa_to_tune("rv64gc")=
}"
>> -PACKAGE_EXTRA_ARCHS:tune-riscv64 =3D "${TUNE_RISCV_PKGARCH}"
>> +TUNE_FEATURES:tune-riscv64gc :=3D "${@oe.tune.riscv_isa_to_tune("rv64gc=
")}"
>> +PACKAGE_EXTRA_ARCHS:tune-riscv64gc =3D "${TUNE_RISCV_PKGARCH}"
>>  =20
>> -TUNE_FEATURES:tune-riscv32 :=3D "${@oe.tune.riscv_isa_to_tune("rv32gc")=
}"
>> -PACKAGE_EXTRA_ARCHS:tune-riscv32 =3D "${TUNE_RISCV_PKGARCH}"
>> +TUNE_FEATURES:tune-riscv32gc :=3D "${@oe.tune.riscv_isa_to_tune("rv32gc=
")}"
>> +PACKAGE_EXTRA_ARCHS:tune-riscv32gc =3D "${TUNE_RISCV_PKGARCH}"
>> +
>> +# Compatibility aliases so that layers using old tunes don't break
>> +TUNE_FEATURES:tune-riscv64 :=3D "${TUNE_FEATURES:tune-riscv64gc}"
>> +PACKAGE_EXTRA_ARCHS:tune-riscv64 =3D "${PACKAGE_EXTRA_ARCHS:tune-riscv6=
4gc}"
>> +TUNE_FEATURES:tune-riscv32 :=3D "${TUNE_FEATURES:tune-riscv32gc}"
>> +PACKAGE_EXTRA_ARCHS:tune-riscv32 =3D "${PACKAGE_EXTRA_ARCHS:tune-riscv3=
2gc}"
>>  =20
>>   # No float
>>   TUNE_FEATURES:tune-riscv64nf :=3D "${@oe.tune.riscv_isa_to_tune("rv64i=
mac_zicsr_zifencei")}"
>> diff --git a/meta/conf/machine/qemuriscv32.conf b/meta/conf/machine/qemu=
riscv32.conf
>> index aff36c28a5..5cb9ba5aa9 100644
>> --- a/meta/conf/machine/qemuriscv32.conf
>> +++ b/meta/conf/machine/qemuriscv32.conf
>> @@ -2,7 +2,7 @@
>>   #@NAME: generic riscv32 machine
>>   #@DESCRIPTION: Machine configuration for running a generic riscv32
>>  =20
>> -DEFAULTTUNE ?=3D "riscv32"
>> +DEFAULTTUNE ?=3D "riscv32gc"
>>  =20
>>   require conf/machine/include/riscv/qemuriscv.inc
>>  =20
>>=20



