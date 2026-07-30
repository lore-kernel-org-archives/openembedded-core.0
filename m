Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEECC54FD2
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 10:15:34 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8301.1785406531982987528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 03:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Aa9vXsdG;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f707e5d75so1359127f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 03:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785406530; x=1786011330; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sygjcvDNzvlIgiSmJ5yYGgaFsbZoalJ2ZCjKrGmU52o=;
        b=Aa9vXsdG6/aImV4+4L7Yn7k9vRzz0TFXnJhYiljBViHfLl1B2JIotzn1qRLQ/UzdPi
         Tznd5g7slog/bDCDomYM95vQeznsMzJjXTAOypqO3oPS3YQoPhGgnQplsk2LbaHbrIwU
         g2MW71a7mNSXS3xFIVXrSY4Qk3FCZqI3jxtIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785406530; x=1786011330;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sygjcvDNzvlIgiSmJ5yYGgaFsbZoalJ2ZCjKrGmU52o=;
        b=NQzb29phcHtvs/DizGKffv0hycTb6OlX29+osJgB9mDVxwGl+8XGlVI6im6ZBYW1cM
         6ToEhCb+OgtdsFTmNbaJ9TnI17dvwMJP/FuciPkdOhhilSAyjYbD5QyW/wm2NxOb7OG4
         nwqAkOsyi1ArJe6+UBwvhjPgEeA/H7m1DUsSN5RxHoyKZqyylVyAFZvw1XsksK8XMIyL
         l+ALXCDHPIupKe0uzRApQxMVl4pHdCoUWO4ZB1l6+xFC5Ew4vBXfH0RwfDRbGUO7OXoM
         /v+ggbGGYOfn37o7SjwQhHbrUrs8vMzqDf753lgwo6vjroS2doypmXznR8gdJQrLEdQc
         FIwA==
X-Gm-Message-State: AOJu0YyXs2KT0iMs6/Hy0aCLv2GiQnm8f2oF3MoYwWZyeVeCCvSnwkfY
	fj/Q/5VeW8R8eixZlamT94xOGyEQRvDlWvlJyh0EXa8rtJqaKrtrh1NbvVKeSBfDPLw=
X-Gm-Gg: AR+sD13PVAsS574NQrKHpZ6GetArBvMqZlrg5V/kfCPYEOSj7YtHVUSbxhh9sicnKLE
	8lZX8ckqMFPPFZpRfV7mXBOXkLr54yBClJa8ox6QlWNwgdyKqFomEut07oJOgzladWu2USL7YnA
	QSTzUOKe34w2wrptbFjDWogxmwdJbl7CoTIgtS0slJBof4VfcCJIIUwOKdNjxRhn6F+LBNoyKwA
	qohNecPE5W0P//TS4gl5MpOGZO1h8ZlUwAs3pTPSaIXXs9GzwC4+01f8cMauiDG/qks8gL9KXrp
	o0M2c2iiDlae3/gswAkxyQ/n9ZDeK7vNLCSjZk+xKeTgEoFc4aLuYRq4ZcBAu1uczKJzV6/dUQo
	CojGGZ3WXAoUTBf5FmtKdo3JOrOv4mOrGPuiF15pC4rJ7Q7mK5/y/tQ/0ZypG8Uw96gxwq6xCuE
	nkVE50jnU0cwrmQwPJofcFEghJW/QSr0YPWlWcUKMVldbOUNxb5Kr76Xqrw+TDlGG/zpYKqgI3O
	H2TUFjtMbzosuVIZjzyUypna4Mt7wyCuuL1pQTJHFgzSviKfKA1eQ==
X-Received: by 2002:a05:6000:2507:b0:45e:73eb:5119 with SMTP id ffacd0b85a97d-47fc832b63amr2436322f8f.22.1785406530165;
        Thu, 30 Jul 2026 03:15:30 -0700 (PDT)
Received: from localhost (2a01cb001331aa00dd417ef569a828a8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dd41:7ef5:69a8:28a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88d7097sm4770286f8f.5.2026.07.30.03.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 03:15:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jul 2026 12:15:29 +0200
Message-Id: <DKBTSKKQ3ZGV.12KJTGZH1VPQF@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
 <alex.kanavin@gmail.com>
To: "Daniel Turull" <daniel.turull@ericsson.com>, "auh@yoctoproject.org"
 <auh@yoctoproject.org>, "quaresma.jose@gmail.com" <quaresma.jose@gmail.com>
Subject: Re: [OE-core] [AUH] glslang: upgrading to 1.4.357.0 SUCCEEDED
X-Mailer: aerc 0.20.0
References: <0101019facc2b137-724839c0-ea99-457b-873a-a5fc9ddf011e-000000@us-west-2.amazonses.com> <DKBSVY2RZILH.3GN90OFEO4WF6@smile.fr> <ea9b948d9c7fdfc3962321f14d990a8d41d26044.camel@ericsson.com>
In-Reply-To: <ea9b948d9c7fdfc3962321f14d990a8d41d26044.camel@ericsson.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 10:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242334

On Thu Jul 30, 2026 at 12:02 PM CEST, Daniel Turull wrote:
> On Thu, 2026-07-30 at 11:32 +0200, Yoann Congal wrote:
>> On Wed Jul 29, 2026 at 9:24 AM CEST, Auto Upgrade Helper via lists.opene=
mbedded.org wrote:
>> > Hello,
>> >
>> > this email is a notification from the Auto Upgrade Helper
>> > that the automatic attempt to upgrade the recipe(s) *glslang* to *1.4.=
357.0* has Succeeded.
>> >
>> > Next steps:
>> >      - apply the patch: git am 0001-glslang-upgrade-1.4.350.1-1.4.357.=
0.patch
>> >      - check the changes to upstream patches and summarize them in the=
 commit message,
>> >      - compile an image that contains the package
>> >      - perform some basic sanity tests
>> >      - amend the patch and sign it off: git commit -s --reset-author -=
-amend
>> >      - send it to the appropriate mailing list
>> >
>> > Alternatively, if you believe the recipe should not be upgraded at thi=
s time,
>> > you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
>> > automatic upgrades would no longer be attempted.
>> >
>> > Please review the attached files for further information and build/upd=
ate failures.
>> > Any problem please file a bug at
>> > https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20=
Update%20Handler
>> >
>> > Regards,
>> > The Upgrade Helper
>> >
>> > -- >8 --
>> > From 4a9231cb33f3d14661cb97c9a7b45f33eef2589a Mon Sep 17 00:00:00 2001
>> > From: Upgrade Helper <auh@yoctoproject.org>
>> > Date: Wed, 29 Jul 2026 06:14:19 +0000
>> > Subject: [PATCH] glslang: upgrade 1.4.350.1 -> 1.4.357.0
>> >
>> > Source: CHANGES.md
>> >
>> > * Add support for GL_EXT_opacity_micromap_ray_query_mode
>> >
>> > ## 16.4.0 2026-07-14
>> >
>> > ### Descriptor Heap
>> >
>> > * Implement `GLSL_EXT_structured_descriptor_heap` with SPIR-V layout g=
eneration, heap offset
>> > access, buffer references, matrix layout decorations, and correct `rea=
donly`/`writeonly`
>> > qualifier propagation for buffer and image descriptors
>> > * Fix descriptor heap-bound buffer access to use typed pointers
>> > * Omit `NonUniform` decoration when using descriptor heaps, as the SPI=
R-V spec does not require
>> > it
>> > * Add `--relax-set-binding-limits` option to allow large `layout(set)`=
 and `layout(binding)`
>> > values for descriptor heap-style workflows with sparse set spaces
>> > * Reject combined image samplers with `descriptor_heap`
>> >
>> > ### Compute Shader Derivatives
>> >
>> > * Fix `GL_KHR_compute_shader_derivatives` regressions on shaders using=
 the `GL_NV` variant
>> > * Update compute shader derivative rules to allow texture operations w=
ith implicit derivatives
>> > without extensions, falling back to LoD 0
>> >
>> > ### New Extensions
>> >
>> > * Implement `GL_EXT_ocp_microscaling_types`
>> > * Implement `GL_NV_cooperative_matrix_decode_vector`
>> > * Add basic support for `GL_NV_desktop_lowp_mediump`
>> > * Implement `GL_EXT_opacity_micromap_ray_query_mode`
>> >
>> > ### Bug Fixes
>> >
>> > * Fix generated decoration string from `UTF8EncodingKHR` to `UTFEncodi=
ngKHR`
>> > * Fix missing SPIR-V extension emission for `float16` derivative funct=
ions with
>> > `SPV_AMD_gpu_shader_half_float`
>> > * Apply `NoContraction` decoration to `dot()` when `noContraction` is =
set
>> > * Fix `OpStore` of buffer device address pointer to use 8-byte alignme=
nt, consistent with loads
>> > * Fix `RayTracingOpacityMicromapKHR` capability emission to only occur=
 when
>> > `gl_RayFlagsForceOpacityMicromap2StateEXT` is actually used, fixing SP=
IR-V validation failures
>> > in ray query shaders outside ray-tracing pipeline stages
>> > * Fix `setInvertY()` to apply Y-inversion to GLSL vertex, geometry, an=
d tessellation-evaluation
>> > shaders (previously only affected HLSL)
>> > * Fix `.length()` on arrays of long/cooperative vectors to use `OpArra=
yLength` instead of a
>> > constant component count
>> > * Fix unnecessary cooperative matrix conversions when creating arrays =
of KHR cooperative
>> > matrices
>> > * Add error for cooperative matrix `*=3D` with bf16/fp8 scalar operand=
s
>> > * Fix out-of-bounds access in `elseSeen` at maximum `#if`/`#ifdef` nes=
ting depth
>> > * Fix out-of-bounds read on empty struct texture template types
>> > * Fix crash in `layoutObjectCheck` when accessing members of an empty =
block
>> > * Emit an error when HLSL [numthreads] is given more than three argume=
nts instead of crashing
>> > the compiler.
>> > * Emit error when attempting to convert a literal string to an incompa=
tible type
>> > * Fix `abortKHR` to preserve the original user-defined string without =
modification
>> > * Fix out-of-bounds indexing in `TDefaultIoResolverBase::addStage` whe=
n a negative `EShLanguage`
>> > value is passed
>> >
>> > ### Other
>> >
>> > * Add `--discard-is-terminate` option to emit `OpTerminateInvocation` =
instead of
>> > `OpDemoteToHelperInvocation` for GLSL `discard` when tar
>> >
>> > [Changelog truncated as it exceeds 3000 characters;
>> > the full changelog can be found in an attachment to the AUH email]
>>
>> Hello David,
> I guess Daniel ;-)

Oh right, sorry!
(That explain why I couldn't find your emails -_-')

>> Would it be possible to get the upstream URL for the changelog in this
>> truncated case? ... or even in every case?
>
> The changelog comes from doing a diff into Source: CHANGES.md and then it=
 is truncated.
> There is no URL. Having URL will required some heuristics.
>
> In the AUH email, there is the full changelog changes glslang-changelog.t=
xt, but in the commit
> message, it is truncated. It is a configuration option. In this particula=
r case only by 2 lines, so
> extending from 3000 characters will fix this case but longer changelogs w=
ill have the same issue.
> The idea was that if the changelog, the person submitting needs to resume=
 it and edit it.
>
> """
> ### Other
>
> * Add `--discard-is-terminate` option to emit `OpTerminateInvocation` ins=
tead of
> `OpDemoteToHelperInvocation` for GLSL `discard` when targeting SPIR-V 1.6=
+
> * Add REUSE license compliance infrastructure
> """
>
> There was a suggestion from Tim to include the github compare url. If it =
is worth I can try to
> create it but it will add some extra logic and hardcoding of github urls.
> https://lore.kernel.org/all/CANx9H-C+LOXUqnctwK3LicLdZb-qeW4erwH5SkOWTTiG=
OA3Uyw@mail.gmail.com/

I have not followed that development closely, so, I'm not sure it's
worth it.

If I remember correctly, patchtest checks for patches sent with AUH
author left in it. Maybe we can implement a similar check for this to
ensure this was seen by the contributor?
Something like:
* AUH puts a tag in its truncation message and
* patchtest check its absence

Thanks!
--=20
Yoann Congal
Smile ECS


