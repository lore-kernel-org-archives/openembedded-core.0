Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F703C54FD2
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 09:33:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7858.1785403975622515991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 02:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tohyzTQ0;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so18424405e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 02:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785403974; x=1786008774; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qQ3ExG28aoinUvayLc73x1kd25jemeLxJQtxxwrk6v8=;
        b=tohyzTQ0uS0WpvPVR9KTbmtucj58mdGeBAm7BkacltSOx2tN7cbIdZCHyatNbaSrel
         UpMMoX6Ahuir3TPRkKkNPWI8kU2BKEHSOAsOuEmRbLuNfi7IvQkyIJNDS/oJcbJt9rtf
         9BGV/iCvrk81ijGiVt/h0JCDaaYKt9b+Hkg14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403974; x=1786008774;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQ3ExG28aoinUvayLc73x1kd25jemeLxJQtxxwrk6v8=;
        b=aPBy9xJ174jPwJs+aw0SuO67rYnpC09xK/2TOpG7hMHD+i2GSrqzhELoxbG0SXQGdf
         VxucD8tMV94geBO5arfzBQAdAsGwCS2pKK/+VQP9OhvUZfxZTDkOM3Suf0jcqiRiczVh
         A65pTzI+/3hTDg92skLzHv9xiBQsFQ+6510hQS0B0FuN6K3HpsA3wQf6ylL8nUq3lBsn
         ID0gW03jnie3I7Wb9sLR3d8aYEqqdTZn+jChPKz9mlm03+LKvw9cRJfu7Ory39agRmpv
         x8paLELm7JuVr4mXkw68dVNwV6jeSrSu8po0av0fLCZ6uJEduDV2/Kf2eTjB1Wd3BGi2
         0uWA==
X-Gm-Message-State: AOJu0YzEUZYa4rv/Hv6hTU4FIiE8UzxJzHWG5+2PLOq1t2XsFqAsNrRH
	IbhNFMVD5wbunJ483I1T7/g2qadmwGSMGZoi/ZZFyISSUz8RUwmYRL8tW3pUpeY0VCQ=
X-Gm-Gg: AR+sD11C01zrEmIu88NoVP4yFoAHkR1w3DAYwfJX+6+jlXed0R2lZ1G+iezl/WIKuD+
	5IfQnQ+GaDChuV923qnj6BA1seuk8Qd/XJ/OgLey7NRVnK/cc5yk5N5Q4C9iEfEpHq+P5JLUwKv
	aT13GYS5Tx7JuHjMSHnT68PJ5WLs1n7okyr2xKfL2HMnM8V5HhxjLGEoG0aINpNvW2oCmPdZeH9
	CAvQ9EHYKZCt4qXec5wgbTiUPf8lQl/jPSxwSspM6zfBrtWMBulzLmsAqoKWtcNAtabFx6T+d3J
	zHYhP6o/x1b2vjgPQmQGunSadXVt336WgoA0OtoOEWViWbOuBGXeDwWTQG1hTTlHEbNrWOAVehd
	mTkOSlu4nc9ZDBWrIZaClGV0vT30wiZhcDEu5KNxMWtZC/z7cg0InR3NPvwgar3O0jT48cEKgyx
	URbelaaTXSiHb4cTyW2HWFcAr+A3IgbVepWSLmqOVfKCmozZYqcLBc4XFBAzQW0q6VB+khpqR0q
	gLZpOB8xaS5MuQGWA+tDawDRQurpafGxSxPzFEhUl32t3Ntu213ddXHSQDE5/Ux
X-Received: by 2002:a05:600c:49a6:b0:496:bba5:33a9 with SMTP id 5b1f17b1804b1-49800eba0bamr13760455e9.34.1785403973781;
        Thu, 30 Jul 2026 02:32:53 -0700 (PDT)
Received: from localhost (2a01cb001331aa00dd417ef569a828a8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dd41:7ef5:69a8:28a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498019a50a8sm24037365e9.2.2026.07.30.02.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 02:32:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jul 2026 11:32:52 +0200
Message-Id: <DKBSVY2RZILH.3GN90OFEO4WF6@smile.fr>
Subject: Re: [OE-core] [AUH] glslang: upgrading to 1.4.357.0 SUCCEEDED
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: <auh@yoctoproject.org>, "Jose Quaresma" <quaresma.jose@gmail.com>,
 "Daniel Turull" <daniel.turull@ericsson.com>
X-Mailer: aerc 0.20.0
References: <0101019facc2b137-724839c0-ea99-457b-873a-a5fc9ddf011e-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019facc2b137-724839c0-ea99-457b-873a-a5fc9ddf011e-000000@us-west-2.amazonses.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 09:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242332

On Wed Jul 29, 2026 at 9:24 AM CEST, Auto Upgrade Helper via lists.openembe=
dded.org wrote:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *glslang* to *1.4.357=
.0* has Succeeded.
>
> Next steps:
>     - apply the patch: git am 0001-glslang-upgrade-1.4.350.1-1.4.357.0.pa=
tch
>     - check the changes to upstream patches and summarize them in the com=
mit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --ame=
nd
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this t=
ime,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update=
 failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_=
bug.cgi?product=3DAutomated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -- >8 --
> From 4a9231cb33f3d14661cb97c9a7b45f33eef2589a Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Wed, 29 Jul 2026 06:14:19 +0000
> Subject: [PATCH] glslang: upgrade 1.4.350.1 -> 1.4.357.0
>
> Source: CHANGES.md
>
> * Add support for GL_EXT_opacity_micromap_ray_query_mode
>
> ## 16.4.0 2026-07-14
>
> ### Descriptor Heap
>
> * Implement `GLSL_EXT_structured_descriptor_heap` with SPIR-V layout gene=
ration, heap offset access, buffer references, matrix layout decorations, a=
nd correct `readonly`/`writeonly` qualifier propagation for buffer and imag=
e descriptors
> * Fix descriptor heap-bound buffer access to use typed pointers
> * Omit `NonUniform` decoration when using descriptor heaps, as the SPIR-V=
 spec does not require it
> * Add `--relax-set-binding-limits` option to allow large `layout(set)` an=
d `layout(binding)` values for descriptor heap-style workflows with sparse =
set spaces
> * Reject combined image samplers with `descriptor_heap`
>
> ### Compute Shader Derivatives
>
> * Fix `GL_KHR_compute_shader_derivatives` regressions on shaders using th=
e `GL_NV` variant
> * Update compute shader derivative rules to allow texture operations with=
 implicit derivatives without extensions, falling back to LoD 0
>
> ### New Extensions
>
> * Implement `GL_EXT_ocp_microscaling_types`
> * Implement `GL_NV_cooperative_matrix_decode_vector`
> * Add basic support for `GL_NV_desktop_lowp_mediump`
> * Implement `GL_EXT_opacity_micromap_ray_query_mode`
>
> ### Bug Fixes
>
> * Fix generated decoration string from `UTF8EncodingKHR` to `UTFEncodingK=
HR`
> * Fix missing SPIR-V extension emission for `float16` derivative function=
s with `SPV_AMD_gpu_shader_half_float`
> * Apply `NoContraction` decoration to `dot()` when `noContraction` is set
> * Fix `OpStore` of buffer device address pointer to use 8-byte alignment,=
 consistent with loads
> * Fix `RayTracingOpacityMicromapKHR` capability emission to only occur wh=
en `gl_RayFlagsForceOpacityMicromap2StateEXT` is actually used, fixing SPIR=
-V validation failures in ray query shaders outside ray-tracing pipeline st=
ages
> * Fix `setInvertY()` to apply Y-inversion to GLSL vertex, geometry, and t=
essellation-evaluation shaders (previously only affected HLSL)
> * Fix `.length()` on arrays of long/cooperative vectors to use `OpArrayLe=
ngth` instead of a constant component count
> * Fix unnecessary cooperative matrix conversions when creating arrays of =
KHR cooperative matrices
> * Add error for cooperative matrix `*=3D` with bf16/fp8 scalar operands
> * Fix out-of-bounds access in `elseSeen` at maximum `#if`/`#ifdef` nestin=
g depth
> * Fix out-of-bounds read on empty struct texture template types
> * Fix crash in `layoutObjectCheck` when accessing members of an empty blo=
ck
> * Emit an error when HLSL [numthreads] is given more than three arguments=
 instead of crashing the compiler.
> * Emit error when attempting to convert a literal string to an incompatib=
le type
> * Fix `abortKHR` to preserve the original user-defined string without mod=
ification
> * Fix out-of-bounds indexing in `TDefaultIoResolverBase::addStage` when a=
 negative `EShLanguage` value is passed
>
> ### Other
>
> * Add `--discard-is-terminate` option to emit `OpTerminateInvocation` ins=
tead of `OpDemoteToHelperInvocation` for GLSL `discard` when tar
>
> [Changelog truncated as it exceeds 3000 characters;
> the full changelog can be found in an attachment to the AUH email]

Hello David,

Would it be possible to get the upstream URL for the changelog in this
truncated case? ... or even in every case?

Thanks!
--=20
Yoann Congal
Smile ECS


