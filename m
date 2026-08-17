Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D472BC5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 19:10:58 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2602.1786993857709569313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 12:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=NAzxb/Ax;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=mS1nEa0Z;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id BE2181D00194;
	Mon, 17 Aug 2026 15:10:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 17 Aug 2026 15:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786993856;
	 x=1787080256; bh=97zfpdE0HKHt6su3/iwth4gqYzOHaBx1wdSU5Fbdsvc=; b=
	NAzxb/Ax7MLr4eFeU4T9NdcHXnUs5JZSrGJxxhVGMXxpkatbSpyt8bpOoeiDYCV2
	WfjZq4qZqnVOF/ZOUpLv9S8dH2mx1rX7TuLutBDubkphfBfU1DK+qatu3L7QkHf+
	y4XduVU5JNArUJRKUC6b1lfbNxULiuRIR6N32pfFaNSNILpk4qa2nt1oz1A6Rjdf
	1ZfvDNcy8tg/HDNOT7rKs/rcznBlIJPgde3aywmuRG1zuIxmkbzJWLthFm/8HERJ
	qYArm8FeRkC7C+thiNCGskHH2dOOlh3MxZAcJ5FvISZiXQNEWS0hNl4fFyMIeF5L
	enlPwMmfWlDRi6pWnzLqmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786993856; x=1787080256; bh=9
	7zfpdE0HKHt6su3/iwth4gqYzOHaBx1wdSU5Fbdsvc=; b=mS1nEa0ZGnID/Pmpo
	8FHVHO8wcNTbqazk9EQpBFQG9r5M8loMCFomq6UR2Hb3ObHJTHr2BoM5hnxCC7Y6
	OSyybVdpMkFSlCthYrEVQbiP0X0oi21JjNQLrK5Su4O/XAgalC63cKHnAfEMPEN5
	hCSDRBMLQsCx7uUTQTIGao+8ZadBW+RhKQNsT3rcWaPKHNhuY2Z2+HJ2PzMYQuw6
	mZr+cg6X0sjY427Dg7Rt/GNd5Ky4oqk8oxJSUH4GMrn77e0zoNuYb4tZeF1aS2oC
	+JWL5WAmSmDI/zuy8sAMe4ciO+rAXUS7/F8M0pFSyWVt7+UQziYh1ISOztp2Uvhf
	j/VGg==
X-ME-Sender: <xms:wFyDao9YNjjTYKWrHbLv0i96x8CY2NoYPZIktqNn_ssK5XIipxPGRg>
    <xme:wFyDamvOG0F_EtKC1SNHenjc55qx78oLa4zQuUXm7LbWB-urboxNjesy4mnpf3Ult
    arf1rKz3l9oU7LM0xqA8sSVmm4fdsOCqpQ7XK_sAyv2IO0lpA_2I35I>
X-ME-Received: <xmr:wFyDarr7N_18_jAkejh5B49_7UmzH348aqvSfUQCdHZmOM6BzdUC-4jZLp4Xz20-Bs_wP4ifyOVMc9cGE49_6WoyV6NaksPEp5TJslQ>
X-ME-Proxy-Cause: dmFkZTGX2/fuCSdYEEmdT0blr9gKByqVFSBSMfh3CcrO6cW61FJzG1js2i8zLYADBWKru4
    DGegIsJuWuJ+O9WXBC/8KYyjdnmZpNDSiI/J+giD8fUbBzGnI1mSE2yhdiMuLgHE4PsvZb
    bthUu0qJ/Dv8erJEGEx9S4PkBX13ejXuKYkBrp/1ui6QJbjrXWEpzQDOyijUwsXVczx312
    pIX1jgHSsUCXzdKBORMoXdtmjczDtX+waeIrb2AZeZkV7t7OLfkYBFcpuULkFUc/5JYT/G
    REWrrW2/VpL8XmjdSmTjXcF3nkIOKXKx3RpIiC2UKQyDUaQNId/1jd7hhfCTTqRXTaDdRJ
    1oPFDk1tGcj0L4hoeL+LFWueZp/U3COez937Ge1gg7RV9Ah8Q/dlFfMtMycvuDRpLl35UK
    UB7bIAaf336JSyPQszgA3hj8vLLecr1ZKvX4SMh8LrCVusI+HkhRnsA4hvaEHB+mJg+w+a
    nBb3h3oVPXcZRGfqqPxkELh51dZ8bVwtYPxYnMZr1k+F8cMHbImTZikhXU265nC42Pw0SX
    yke93MVoH1MhsWFcghUTr0Z7s7qIoLbpcOvDcg0qN8sdrGtcHzgwwn9AHVnjan7CF4lXOD
    oC+e8tCekInNji0zzjBniY346/kUUdFb31g5+W209bOlQfPlx6Yuj8tx6ixQ
X-ME-Proxy: <xmx:wFyDajmTUaAOLWe0UqCWJMDYEWgSYwXCxLCeofjcX2p0eaWdKlj1pA>
    <xmx:wFyDavxiU51J00JZ875WkCD46imhFTTg0l6VPUqWOfGT16F1tB3s8A>
    <xmx:wFyDarl4V03tNcNzxEjw48iv918ywnltu8C0bFP6WkOOKta-oTcMWw>
    <xmx:wFyDaodP1RgQ045DfbviTaynFmaAaRVQHp9u51JMQdwxqDEDyMD9NA>
    <xmx:wFyDauPTcKBUw_AURLyNOzluxfQXwmzy0ERCVnLPJQvrUYVr1rZs0tlA>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Aug 2026 15:10:55 -0400 (EDT)
Message-ID: <483e1f11846c0941d287a3a9228bd759a1310bdd.camel@pbarker.dev>
Subject: Re: [PATCH] classes/sbom-cve-check: fall back to the stable SBOM
 symlink
From: Paul Barker <paul@pbarker.dev>
To: roosesweb@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 17 Aug 2026 20:10:54 +0100
In-Reply-To: <20260804112437.3357583-1-roosesweb@gmail.com>
References: <20260804112437.3357583-1-roosesweb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 19:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243636

On Tue, 2026-08-04 at 13:24 +0200, roosesweb@gmail.com wrote:
> do_sbom_cve_check builds its input path from ${IMAGE_NAME}, which carries
> ${IMAGE_VERSION_SUFFIX} and so ${DATETIME}. That value is excluded from t=
ask
> hashes but changes on every bitbake invocation, so the path is only corre=
ct when
> do_create_image_sbom_spdx ran in the same invocation.
>=20
> It does not when the class is newly enabled on an existing build tree: th=
e image
> SBOM is already deployed and stamped from an earlier build, do_sbom_cve_c=
heck has
> never run, so bitbake executes only the latter and it looks for a file wh=
ose
> timestamp belongs to the current invocation. The same happens on any forc=
ed re-run
> of just this task:
>=20
>   $ bitbake -f -c sbom_cve_check core-image-minimal
>   ERROR: core-image-minimal-1.0-r0 do_sbom_cve_check: sbom-cve-check fail=
ed: [...]
>   sbom-cve-check: error: [Errno 2] No such file or directory:
>     '.../core-image-minimal-qemux86-64.rootfs-20260804101106.spdx.json'
>=20
>   $ ls tmp/deploy/images/qemux86-64/*.spdx.json
>   core-image-minimal-qemux86-64.rootfs-20260804095834.spdx.json
>   core-image-minimal-qemux86-64.rootfs.spdx.json -> ...-20260804095834.sp=
dx.json
>=20
> The file is there under ${IMAGE_LINK_NAME}, the symlink do_create_image_s=
bom_spdx
> maintains. Keep preferring the timestamped name, so behaviour is unchange=
d whenever
> it exists, and fall back to the symlink rather than failing. Guarded on l=
ink_name
> being set, since IMAGE_LINK_NAME can be empty.
>=20
> Signed-off-by: Thomas Roos <roosesweb@gmail.com>

Hi Thomas,

This code has already changed recently in commit 2a80840a4fe0
("sbom-cve-check: Fix breakage with empty IMAGE_LINK_NAME"). Perhaps we
should have just added a fallback to IMAGE_NAME if IMAGE_LINK_NAME is
unset.

A quick scan of the code shows that there are other places where it is
assumed that IMAGE_LINK_NAME is valid, such as vex.bbclass.

Best regards,

--=20
Paul Barker



