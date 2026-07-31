Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7734CC54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 10:44:23 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3737.1785494659982515149
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 03:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TwqmPc3z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c16794450aeso108663366b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785494658; x=1786099458; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2bnTr6/omSOiZGW+BLAUxg2MpBO/n4Jj0BDzvvl1ARs=;
        b=TwqmPc3ziW7d6knJr2voEoxKG8+IqViFquHwhwRbSjLIyJUmH3Lq2WNKI3BzRPfhPS
         /n/nu+CasQXrVNz3uC4g1n10JUaVKxTyMy0VBoksYfrCB1fiVytPAnrsYTY0XTx06Cx0
         zQz+NKMe5XIXOJFxw0MIcgUz2fHFFaw5QKv+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494658; x=1786099458;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bnTr6/omSOiZGW+BLAUxg2MpBO/n4Jj0BDzvvl1ARs=;
        b=K7wqlDrjvyCNyyVnKr8Exij9V7Btd5lB29Bfn5C2XJPqGCf/JXHjeDC7QEuuGciNY2
         RCltmf7dXTu0PrqaQCJ/lAgTaWBYeJ9SifMMoHTWoy1pY6Qfl/duLBSxxffl5ZAMNEPd
         T52dPxRU4POVvlSfsTYXDDTQPPCgW+KoGFUy5JsUARVkfbAqChHq7Q2TaVShb02d8O8k
         bbSAkiVZLjRkBJq0ndrbVut9w/BhIcHk/ED062FV1SSX2vtzA196AlI1WUpb1aNv4eQ9
         rrLDHqgKkuMHPLMEnh9DOd7IW1NBt8f8rUh3xlwvdX4W4/ivJCk8Ne/SNDyvqL0/30cY
         v+IA==
X-Forwarded-Encrypted: i=1; AHgh+RrGxeoIVh01J6EkB6htxOsfFLMVrKkhtiG3mE+zMNIqs+Gv007PR2P8ihShpDvw3CWhrleC7KUQva44MVo7Q3+uhA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRrQ3qMTj/JS1O+JnYkcZAiMIsm56SHIkddbOxL75o5ghQ/wIQ
	yE6dUqr7OQw0ZmjPS/l891ofkzzin0kWMFhndQrRkeFNMCShjGm+/NtBB9GTesPVI18=
X-Gm-Gg: AR+sD12MLf/ILYSbMtKQc1FNPXXJ2fCpYb2VzkkgkdEE4khi+tXRctkINrjoAZMM/cU
	0D6vAsonxothX+cn5c8S7XP2FgeFRsi/A9wta9FjaGFGIxKDzpLZCWrAy9Xzi8T/gW1H+6j9tp6
	fF2YH0ZrwfihuJwXyjz2+aPiOnc+cO78RRXg6ZzZdsxEn8iNoZ6gItFd/Rg+mVLpRVvnfhOWuJf
	laswemIqDjWNgZJUi93qkhlJDoGvLjmLTvLnMjmKzhrEKiA0lKW4T++bJO2P5mKYZKJNsIWvOne
	MHGGDxRdXeVanPtYZyvjjB1SFHzoBZxSc87oHjoefeptgAEluvkbBkE4jp8hjGEydInoItKHktV
	OQrlknqs+FsqXw077IpuPOpOtcKFF+yGnQYxG6hBCmTForlbres24Nl+3FiMQtsdi7eQy+uzDFE
	PCBhfgGlyC0PN3JA9fWzJb1TO0SmwFMONHM5mWXlL1QyD/Mm44PenEDopAl9iSSXFLII/cfMU+1
	0WTHieNMakN3awJjCW+pR445Ujs/ls/rgtt1vd4Y3PjKE5N2tmt0A==
X-Received: by 2002:a17:907:6d22:b0:c16:7b66:4932 with SMTP id a640c23a62f3a-c1fd2752eb8mr75404866b.64.1785494657963;
        Fri, 31 Jul 2026 03:44:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7f7b:46f5:a0f7:875c? ([2001:8b0:aba:5f3c:7f7b:46f5:a0f7:875c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44542ddsm114754766b.29.2026.07.31.03.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:44:17 -0700 (PDT)
Message-ID: <15d504454286b8aa2c86f28a6dfca7a0946e3078.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] kernel-arch: limit KERNEL_TOOLCHAIN to the
 kbuild recipes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mark.yang@lge.com, openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2026 11:44:16 +0100
In-Reply-To: <20260724045917.3595374-1-mark.yang@lge.com>
References: <20260724045917.3595374-1-mark.yang@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 10:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242423

On Fri, 2026-07-24 at 13:59 +0900, mark.yang via lists.openembedded.org wro=
te:
> From: "mark.yang" <mark.yang@lge.com>
>=20
> u-boot and barebox inherit kernel-arch for the ARCH mapping, so since
> 0e3756efe0 ("kernel-arch: add KERNEL_TOOLCHAIN to switch the whole
> kernel toolchain") KERNEL_TOOLCHAIN =3D "clang" switches them too. That
> swaps u-boot's gcc-cross dependency for clang-cross, but its kbuild
> hardcodes ${CROSS_COMPILE}gcc:
>=20
> =C2=A0 /bin/sh: 1: x86_64-oe-linux-gcc: not found
>=20
> Full log: https://errors.yoctoproject.org/Errors/Build/242654/
>=20
> Pin TOOLCHAIN back to gcc in kernel-arch and set it from
> KERNEL_TOOLCHAIN in kernel.bbclass, module-base and make-mod-scripts.
>=20
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
> v2: add a comment explaining why kernel-arch keeps TOOLCHAIN pinned
> =C2=A0=C2=A0=C2=A0 to gcc
>=20
> The v2 series was merged, so this carries the remaining v3 3/3 delta
> (<20260720231714.1631366-1-mark.yang@lge.com>) as a follow-up fix.
>=20
> =C2=A0meta/classes-recipe/kernel-arch.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 5 ++++-
> =C2=A0meta/classes-recipe/kernel.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0meta/classes-recipe/module-base.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 1 +
> =C2=A04 files changed, 7 insertions(+), 1 deletion(-)

I really don't like having to set the same thing in multiple places, it
will cause a maintenance nightmare in the future. The kernel classes
are getting too convoluted and too much of a twisted maze already.

There is very little u-boot and barebox actually need from the class
anyway. Instead, I suggest we move the arch function to the python
library and then have u-boot and barebox call what they need from
there.

I've some patches on master-next which start to do this.

Cheers

Richard


