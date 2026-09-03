Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5ABC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 06:46:58 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1918.1788418011579504192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 23:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HCfyzLq4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48433fad54aso1267320f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 23:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788418010; x=1789022810; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oYqs0xK7Z7c5UaQOeyUFSACqMiWtM+3RSIELLjXVmLg=;
        b=HCfyzLq4gCzw6lPbporJo+pk3Qxn/m0U1pOSPvu4eKjM1/VJyLc81n1YxKGmV0nDxZ
         0VfL+Tmy7BZeACTteYlBuvYNwNtpB7qgb+dtOwjCi9YTgiCiUnEoTu67DTrubwUqLcHI
         TYXv9oeXkkGzQAmsqbrYM084hOV5SOkpbWEj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418010; x=1789022810;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYqs0xK7Z7c5UaQOeyUFSACqMiWtM+3RSIELLjXVmLg=;
        b=lpL66CncTArdWwCCxzCXym9ow8C3N6yLrp/PlgLKEYGKMK1VQy1dV1PVcI/2eujld6
         Hn2cWYNe6reW1nSA75gHZXl84zNeNg7TMytQf9xWh9Jei+sMWDE/t31Zf2sJImkOHn7O
         GCbqgBhzhgFIc5FCDpJYTwV+8td8YVnbAhG0HQfvbxVkbBfr5udqGo4ykHQ4EkaOsB7u
         JT6F0wFKVo/QGoJ5zyQEF6K33ZVHrYNTBY+VI7Ki5Ek7cmgwjb6wQlpl8s2PyyPyU43Y
         ZzT2DpErq7EY2q9lOjyR5DeIzJnH9CCYI5E/8dFYF3S3oj9dClHBsriSJJhG+QtBnlnl
         OxSw==
X-Forwarded-Encrypted: i=1; AKwUvBz+SDICmFuW3Ua78oFxDXhCxVfZEvrd9zXvm41qA+mKA/fSrWMUnCPXMnoBkej/zUfDaMwCXCmFP72T0JfbKVs2gg==@lists.openembedded.org
X-Gm-Message-State: AFuF++kBuqvDZXGr4LjI/OACZMyoPBD4vKzDT9Mv2Qm9NuHWfFdL0Ads
	tzY7biHOZQbe31VaqqcMeCaHgXRyfIkybC15qXg5OWrHUjKtLClEYGhtFmxOWfmfj41eKE2/UxR
	jG6bobY0=
X-Gm-Gg: AYBFou1JSEfVDrVpk2Ti/Dr2hh9E3FHrJh/DjqF7X+rMd49q2lVCkdfcEzheyjNLqLF
	L/9jzL6k6PY6MW6pgaPUHGCc5bJKX1S/y8Bf5n5W3Rg4TFIJDiTnoayop3DwTE4TxM/NI94oqyG
	3xfdtOzILIDj1z4ehZvXxdU7PZRY2Ci6Hw+YQl898sMEMqpwKd5XHW8xvUigDKcgbdOIetmDmuI
	OQuIpuvaD9EvAGa4Y0DT0K1bzQ9NDRFD+iRuJMpJjjqlkNFGGAQ7xvHJxpkNIrhhGbSgp1eCGdq
	hLwsa4tUdeGfMF56PRzB112xLrECvoYZqCyt23t5DxaUCyasITXy+uIVnJirg+K1eczI37HP1gp
	8UezVZGU40KgvKHs2LSVThsf/wR865sKGDeyLrW/hHyJ8fIqwcOuJlyqVJ2MwMiaGMA0QPUZElC
	SuP6EvZ09Ygig10OTgJWCnmzZFE9E46zExbbtTQtxA43s3yRP56vt3M29V/EvkfQ2s1eNo7Pktc
	NtOHfL2ElLXD6c3XNO0NUUWuTxkzIPe4g/ykPA6kBInyYtezAjMAw==
X-Received: by 2002:a05:600c:8411:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49ce58204a0mr186383975e9.8.1788418009806;
        Wed, 02 Sep 2026 23:46:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a76d:4840:1f4f:ed41? ([2001:8b0:aba:5f3c:a76d:4840:1f4f:ed41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm45501165e9.10.2026.09.02.23.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 23:46:49 -0700 (PDT)
Message-ID: <24c12b9706da066e59f1581c91a8f238f5fe83b8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] mesa-tools-native,mesa: upgrading to
 26.2.2,26.2.2 SUCCEEDED
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: auh@yoctoproject.org, openembedded-core@lists.openembedded.org
Cc: "daniel.turull" <daniel.turull@ericsson.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Date: Thu, 03 Sep 2026 07:46:46 +0100
In-Reply-To: <010101a065cacddf-8c4c8571-518d-437d-988e-c3642ad3b435-000000@us-west-2.amazonses.com>
References: 
	<010101a065cacddf-8c4c8571-518d-437d-988e-c3642ad3b435-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 06:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245009

On Thu, 2026-09-03 at 05:43 +0000, Auto Upgrade Helper via lists.openembedd=
ed.org wrote:
>=20
> -- >8 --
> From 8582fd6e2b35a2634ddd44abd5152198717ced77 Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Thu, 3 Sep 2026 05:26:37 +0000
> Subject: [PATCH] mesa-tools-native,mesa: upgrade 26.2.1 -> 26.2.2,26.2.1 =
->
> =C2=A026.2.2
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> Source: docs/relnotes/26.2.1.rst, docs/relnotes/26.2.2.rst
>=20
> Mesa 26.2.1 Release Notes / 2026-08-20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Mesa 26.2.1 is a bug fix release which fixes bugs found since the 26.2.0 =
release.
>=20
> Mesa 26.2.1 implements the OpenGL 4.6 API, but the version reported by
> glGetString(GL_VERSION) or glGetIntegerv(GL_MAJOR_VERSION) /
> glGetIntegerv(GL_MINOR_VERSION) depends on the particular driver being us=
ed.
> Some drivers don't support all the features required in OpenGL 4.6. OpenG=
L
> 4.6 is **only** available if requested at context creation.
> Compatibility contexts may report a lower version depending on each drive=
r.
>=20
> Mesa 26.2.1 implements the OpenCL 3.1 API, but the version reported by
> the CL_DEVICE_VERSION, CL_DEVICE_NUMERIC_VERSION and CL_DEVICE_OPENCL_C_A=
LL_VERSIONS
> clGetDeviceInfo queries depends on the particular driver being used.
>=20
> Mesa 26.2.1 implements the Vulkan 1.4 API, but the version reported by
> the apiVersion property of the VkPhysicalDeviceProperties struct
> depends on the particular driver being used.

The changelog is a bit weird on mesa, it always seems to find the N-1
version rather than the one it is upgrading too.

I'm also thinking the AUH shouldn't include the same info twice for the
changelog, or the version in the subject line. If it is the same, we
don't need it twice?

Cheers,

Richard

