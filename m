Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6229.1793972539949785575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 05:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=qPqXfun6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B25154E41216
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 13:42:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80B785FFBC;
	Fri,  6 Nov 2026 13:42:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBDAA1032929C;
	Fri,  6 Nov 2026 14:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793972536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=C6S88gYKPm/eTICvf8y3arIZ0hXxdSJTNveDz7zVtYc=;
	b=qPqXfun6M5axQ4IZAiEPUKg30nOT+AY67NDDlTFni1/vBCytCU+piBXpWR0Rb5RG3ZOjdj
	NrwIDy8llYDKGVZRnc4meB2ND1myJbs0E0/vOp7Z8893YSEJaonwvO4lIgkoScJY2eH9U3
	dizAugA4E8GOsGuYmk6QRng0PFo8Q7NWSTZAjuJFmjgz3JJ67a1BSHJhjsxaBaiI22kvwz
	u3YvzIVQJn2rPbgD/GtFPEyeSS/5KHsAbOfBmqpDT5TCGKKX2RMzcAVYfkz0cvCDiOxRV8
	+Vc/4kdRX3NEgNvEoMeg3ULVOmMHvY/DdfjqPbMh58AMjmfl7b0rWCBkAwGNLg==
Message-ID: <f22757c7-ed1d-4c09-ac71-81b565fd3771@bootlin.com>
Date: Fri, 6 Nov 2026 14:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] llvm-project-source: make do_preconfigure re-entrant
To: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>,
 openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20261104224627.1280147-1-ricardo.salveti@oss.qualcomm.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20261104224627.1280147-1-ricardo.salveti@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 13:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249650

Hello, Ricardo

On 11/4/26 11:46 PM, Ricardo Salveti wrote:
> do_preconfigure replaces the //CLANG_EXTRA_OE_* anchors in the shared
> source tree with the vendor and distro lists of the current
> configuration, consuming the anchors, so it only works on a freshly
> patched tree.
>=20
> When the configuration changes in an existing TMPDIR, for example from
> DISTRO=3Dnodistro to a DISTRO with TARGET_VENDOR =3D "-qcom", do_unpack=
 and
> do_patch stay valid and only do_preconfigure re-runs. Its seds find
> nothing to replace, so the tree keeps the previous vendor list while
> the task hash promises the new one. llvm-native and clang-native are
> built from that tree and published to sstate under the new hash, from
> where pristine builds of the same configuration restore them. That
> clang does not treat aarch64-qcom-linux as an OpenEmbedded vendor,
> skips the <sysroot>/usr/lib/<triple>/<version> GCC layout and finds no
> libstdc++ headers; mesa's rusticl bindgen fails with "'cstddef' file
> not found".
>=20
> Keep the anchors in place and insert the generated lines before them,
> each tagged with a comment naming its anchor, so that a run first
> drops what the previous run inserted. The task can now run any number
> of times, with any configuration, and always leaves the tree that
> configuration describes, as suggested when adding vardeps was proposed
> instead [1]. The generated code is unchanged apart from whitespace and
> the tags; an empty CLANG_EXTRA_OE_DISTRO now yields an IsOpenEmbedded()
> that returns false instead of invalid C++.
>=20
> Move the Gnu.cpp anchor onto a line of its own like the others. The
> changed patch also makes existing build directories, whose tree has
> already lost its anchors, unpack and patch the sources again.
>=20
> [1] https://patchwork.yoctoproject.org/project/oe-core/patch/2026062312=
0818.110754-5-joaomarcos.costa@bootlin.com/
>=20
> Assisted-by: Claude Code:claude-fable-5-1
> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> ---
(...)

Thanks for this patch. I left this issue pending in my backlog, as I=20
didn't have much bandwidth to handle it. I'm glad to see it will now be=20
fixed!

Reviewed-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>

--=20
Best regards,
Jo=C3=A3o Marcos Costa

