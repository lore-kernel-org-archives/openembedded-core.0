Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C23C28B30
	for <webhook@archiver.kernel.org>; Sun, 23 Mar 2025 10:54:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.13934.1742727244319722538
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Mar 2025 03:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iJ3QWFpm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe574976so19300965e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Mar 2025 03:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742727242; x=1743332042; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+caniuLkQYzQPF1Mn1jYgQsfLHNuEO7Q+Ei17fenKY=;
        b=iJ3QWFpm1KyC85ZLDgIV81oAclbagOIckzMBo1f4tgR4ywBgb3AXd/S3o0GZNTuMie
         yfh3AgDuKVYj/6Z1ouNBUXR+0Vfqt5UxaX3hEIqLx8zZtrhCD7pDK+jrk5v+PwsdchQq
         Aot5WpjPSO0DXDeUwNxqrQmyj0lOV0bG4ghag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742727242; x=1743332042;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L+caniuLkQYzQPF1Mn1jYgQsfLHNuEO7Q+Ei17fenKY=;
        b=szJ2DOtUjkDzOYqR1yNHghqAj7p0cz5I/y9HOzCzGURtaRlURB/Pz9VNzlTW7KZ53s
         h8XustrbTZ6ENydpimQWR0jvOvorZtBFb+PIivlGD7+KIOT2/Q8II3AYtIYTK10cFoaS
         LIfGf9ggx/kFOs1hnSGwB0xLXOcOuQOQKQ5w07Kw5tklqY7JdRxT9RR3/T8IE3P4esON
         ONNUhWPYrACNLvm78AtY33SCHf8BukMf65kPFOHzHPEcgYhT7IsQlYHESr+hqE9pUPJY
         pK7KkgKmAZbkmyDqZmXJpVtAGt2c/cNG976mQDmnQtkyqZ2TF29f5NyOMOxOmFXTYpPb
         SL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWl2OXZMLLP1wEIm9Evmxl/rlU/s1kcC6GNAFCTPQXfUdEzVJcxydY3d/dx8J2XEBbXfMCFCa8If8p39sq+UrRp3w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5HXy6hA1rMmHe29lw2ZbFgHuXSTy6F94GYfT6cmtowv8mWrNq
	BLTa5Y2+aicUZlQ2zsE6V2/6U5QyvNmsOqyaeyrm8VvaONJBdtSrER1ZO2+lNTY=
X-Gm-Gg: ASbGncso83Kg78yhdb/IjYd44bA1Tu8eRd4v4N1z86+aTVbQW7v80EjWPKAGfG7t7zJ
	y/WyDyk2uu9BfxtXLhNi66hdf+DGEV9nJ7e2ENM4vugFZXyCkTf3Re4YTejx6rRLgW/b+YlorPH
	g9GkfMeBXbaBxd/qVJ0SIJBzQWEu7elvtTpt/bmLF8+KOO9aP1F9N8BAYhB4Rc26Vyi/26sbBiS
	OLmb2UPGPusknpU7GVdAzkQQ8NCF4suBYtVZwQApalMDZ+oKETz8aj4SiYAt736bbkvPTNtDJIm
	xslM0EW+roNiXPLIYxPFweoqemzThcQcKjMkestWcWlazR1CugZAE6j4LCQDCMXX4MlE5RMbK/u
	XQp8Qr9VEP4P+rwEy6r2kFnfn9xqYYxM=
X-Google-Smtp-Source: AGHT+IF+DUC1gdEBKiTRl0fpS9F2Ag2ILF65pgBw36j7dD7IaJ5rXoHDNvyGv4FFjgKCGJuRCv4+qQ==
X-Received: by 2002:a05:600c:3b9f:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-43d509ea8e7mr96573345e9.10.1742727242476;
        Sun, 23 Mar 2025 03:54:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:975:45cc:33c7:7995? ([2001:8b0:aba:5f3c:975:45cc:33c7:7995])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3bb2b2ffsm123786345e9.1.2025.03.23.03.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 03:54:01 -0700 (PDT)
Message-ID: <d0f4460cc8338769479b0efdfbf4ed68b491fae1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 01/11] systemd: enable efi support if in
 MACHINE_FEATURES too
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Sun, 23 Mar 2025 10:53:59 +0000
In-Reply-To: <20250321132517.670372-2-mikko.rapeli@linaro.org>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
	 <20250321132517.670372-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Mar 2025 10:54:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213499

On Fri, 2025-03-21 at 15:25 +0200, Mikko Rapeli via lists.openembedded.org =
wrote:
> For example genericarm64 enables "efi" in MACHINE_FEATURES
> and in u-boot. Boot without "efi" in systemd works with
> EFI protocols but for example efivars is not mounted at
> all so various checks fail in userspace. Fix these by
> enabling "efi" support if it's in MACHINE_FEATURES.
> Fixes efivars mount to /sys/firmware/efi/efivars etc.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/recipes-core/systemd/systemd_257.3.bb | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/recipes-co=
re/systemd/systemd_257.3.bb
> index 64fb8fe69a..9bc4532021 100644
> --- a/meta/recipes-core/systemd/systemd_257.3.bb
> +++ b/meta/recipes-core/systemd/systemd_257.3.bb
> @@ -69,6 +69,7 @@ PAM_PLUGINS =3D " \
> =C2=A0
> =C2=A0PACKAGECONFIG ??=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit=
 apparmor efi ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('MACHINE_FEATURES', 'efi', d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'minideb=
uginfo', 'coredump elfutils', '', d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', =
'rfkill', '', d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '=
xkbcommon', '', d)} \

This makes the systemd recipe machine specific which isn't currently the ca=
se.

Cheers,

Richard

