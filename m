Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4AFC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 10:16:29 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.30911.1744280181409212856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 03:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=neqtYNyp;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so7101475e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 03:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744280180; x=1744884980; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaMHIDAYaGRURZtCDWWm5v+kPGG+5HHk5AGe4k5a8wo=;
        b=neqtYNypj2bzrlFxama5uMyKvJPFJk106uIoNu8jQ2CwdEH7vNSAuMuc8ruWJMkCj3
         LScneES1S4MjJwTKidNxpI7zugi3F5j4lXvasZSjmWUBQJeDwvaMpQjhoMnFJG0g3YXO
         VYJvbo8gGXTos1o6VT7+SqFHQN+XuUJjkOPmun7KvIcgbZacx531TrHhoNJK4MkNwL5K
         xUbtANiBAbWMLyZOSTaJISe8OwYMktR+LoMhDr2WEgODFBWvKOMKnGw6oqoMLoHeUn3g
         anzhEQLFJAln88wLNQ6rixiAce/bHMgd4lntNteYXlugnnr9ZPYu6ll350vnIq0C8k/K
         z+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744280180; x=1744884980;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XaMHIDAYaGRURZtCDWWm5v+kPGG+5HHk5AGe4k5a8wo=;
        b=uBnjBX6fRRkZcdIsIAphDUXTHql0n01+fZE/5gddo6fRktOW+QhC+GREPe17TgjoGu
         ZOvbANStwjGY2VBKTot0Zmac5xX0h+evu02pDZjdFmh7vIbVh3P3J0wk5eFuOT+V7mgZ
         iePoy+OrO0DpcnIoQ7iW3kB8Xbnlsmu5cW/vYwhlN7v8EWeQUL5Xd35i+tOs8JsL5pkg
         anYHg63ubVg/JQGn1D1rJPI8CyJTYBNZPsuC6XnvoooDgOUcOqt6Ig+gy8uMLMt8e+71
         0F5Mlu0k1ploQ0pp3+LctTjdzGABcQN8FyYlWy+qkkVDc4V1Klmnn7CcxIlmgPlb50sv
         yuTA==
X-Forwarded-Encrypted: i=1; AJvYcCV1arXwyzWilK4ijA3ql1TZ+aS6/0Kcz48pXBWaVh+eGb4oGLAVa9Y+5f4YOI+zO9sBxTv1znX89lGipc1oJvQSxQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy14w8tS/4MQu4uHmdZgHNjQ6YT7K8uh/iv9AFDUeXtVZqOJBS8
	bEKSyPlcnwN7hhMf6FTFUqcn+xq48fvmLYVO2RjriihuB8QEHJIE
X-Gm-Gg: ASbGncvAcs22r3q+OpVOXYTgHpf6avH0uwhRt2IB0cmZfZvykNe0Euxl8qFrAV2q178
	af7GfpU/eg0llD+zPZgkn8bBAQNuehkoHG6ZFOeFu1vUD2P1p2Hh2AHZkGI+YYLv58MovI++4mr
	u6+Lfqq3AQDyln8paBGHnoqy/Xs3ljWtowivXjqmMmJ3X/wqctRKd0bYjHDkFiAVaFVUiOkVFyx
	QLgPK9sMB1WcLKkVb1QLFeJ9FLDeXSlZuyCr8ms4sCSUDIMEv0EbFqtH1WMz3+ZF/6zpa97NqA9
	w55Ulp5pzgPJPjQLGejEvIafnhvZ1PXNXZNGWDoxro0ELUhXllPjIcJ5HlnabQoaJKr/UCOPlxO
	GqSzbpSAWMvBgHA==
X-Google-Smtp-Source: AGHT+IGcPHhHbIE72axKP30ijfgpBOoeyGD2tcuglREC2IjB0A3X8JBvGr3c85kwhAc9Q2rlxV2fqw==
X-Received: by 2002:a05:600c:4fc1:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-43f2ff99feamr13504215e9.23.1744280179569;
        Thu, 10 Apr 2025 03:16:19 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0cfdsm4332412f8f.76.2025.04.10.03.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:16:19 -0700 (PDT)
Message-ID: <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by
 default
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2025 12:16:18 +0200
In-Reply-To: <20250404162932.447699-2-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
	 <20250404162932.447699-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 10:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214639

Hi Mikko

On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
lists.openembedded.org wrote:
> For example genericarm64 enables "efi" in MACHINE_FEATURES
> and in u-boot. Boot without "efi" in systemd works with
> EFI protocols but for example efivars is not mounted at
> all so various checks fail in userspace. Fix these by
> enabling "efi" support by default to avoid making
> it machine specific. Fixes efivars mount to
> /sys/firmware/efi/efivars etc.

My point is that many OE/Yocto-based embedded products rely on a fully
redundant and power fail-safe firmware update and boot implementation.
So far I have not understood how this could be implemented in a
similarly robust way based on EFI as we have now without EFI-based
boot-up. I would therefore like to see the EFI implementation remain
opt-in until it covers at least the most important use cases for robust
embedded systems. What I primarily miss with EFI is a reference
implementation for an A/B update system without having to rely on a FAT
partition without journaling. Please correct me if I'm missing
something!

Would it make sense to declare poky as an EFI ready reference
distribution by enabling the efi DISTRO_FEATURE there, rather than
starting with making recipes enabling efi unconditionally?

Could something like this in poky.conf work?
DISTRO_FEATURES:append:aarch64 =3D " efi"
DISTRO_FEATURES:append:riscv64 =3D " efi"
DISTRO_FEATURES:append:x86-64 =3D " efi"

Thank you and regards,
Adrian

>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/recipes-core/systemd/systemd_257.4.bb | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_257.4.bb
> b/meta/recipes-core/systemd/systemd_257.4.bb
> index 64fb8fe69a..06e5621398 100644
> --- a/meta/recipes-core/systemd/systemd_257.4.bb
> +++ b/meta/recipes-core/systemd/systemd_257.4.bb
> @@ -68,13 +68,14 @@ PAM_PLUGINS =3D " \
> =C2=A0"
> =C2=A0
> =C2=A0PACKAGECONFIG ??=3D " \
> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit appa=
rmor efi
> ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit appa=
rmor
> ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'minideb=
uginfo',
> 'coredump elfutils', '', d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', =
'rfkill', '',
> d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '=
xkbcommon', '',
> d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'sysvini=
t', 'sysvinit',
> 'link-udev-shared', d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0 backlight \
> =C2=A0=C2=A0=C2=A0=C2=A0 binfmt \
> +=C2=A0=C2=A0=C2=A0 efi \
> =C2=A0=C2=A0=C2=A0=C2=A0 gshadow \
> =C2=A0=C2=A0=C2=A0=C2=A0 hibernate \
> =C2=A0=C2=A0=C2=A0=C2=A0 hostnamed \
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214352):
> https://lists.openembedded.org/g/openembedded-core/message/214352
> Mute This Topic: https://lists.openembedded.org/mt/112087523/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


