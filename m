Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8271CC3ABCB
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 06:41:38 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.96370.1747204889076935505
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 23:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LAqmvDKl;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54ea69e9352so8858545e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 23:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747204887; x=1747809687; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMrXPn4o1VBI0Oc2zbR2NtG2+MLMsJIOKv9XxH67Iow=;
        b=LAqmvDKlKB5iAeQeGJd7u6Nct6HXGcwy8lskaFAfZgwruILCXRbF8NI6FO35nZ1zlM
         nR/Blrs5kK4GRz5HT3J/T2hmz3dhedxQhbWRIr6b6N22RhsUDNdUAr4v0ZXi4sHU4Sy6
         u8NA2kRjcexl7vTRPSaVJawsNGgog7enonLJ77RaDgx8jrVUhRUQRtGkZWhp7bpnyTyK
         Jz2qgSBr8z7DXkbkdwC+zoJkmBqyBbDsWhZV1xXaDIWBlKPMkxH1JspjBV7gsGNSUKGN
         zJcQNYJ/TNnTx6pzFuotZ96fSXxVoZ06e2e5CEad1KmHxK7KNzaveT8PIRN/mQm3EzYC
         uY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747204887; x=1747809687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMrXPn4o1VBI0Oc2zbR2NtG2+MLMsJIOKv9XxH67Iow=;
        b=oG3jRDKVjCCENQfoDfv3IAeBqxiL5eSQ/YVYcuHW4cj8bWctFQqhNJJmOQXv5au0SP
         65JTAacq7BwiRlvU4weUUF/1aCmdCuHAmoWsbkTqeWbakdeSJh3aJpovJByPMeo9dNqv
         rhhKMJrMSz49BdbTtinkYnWgzUfPDvJZ6jVcwBlMw86vepfGf5Mn5s7jjEq6UNnEtkxe
         ILTx4iyejdSOhL/sRmOrKeEFGpsMgbZInuD8rvyXynKIZKgLmd4c+9tD/HVxL/wPH+UE
         Wa2cjN07+9WUi6H9owYOEir+Y1qNAWmpuLFjnMXa6nCN23exfovFSbB79no3WyJSPBp/
         s9vQ==
X-Gm-Message-State: AOJu0YxkGOZf7s6lzpBTSr0rLyKJNOm0kLJGoLYup3lUJnRGTGt1jbOv
	75+XWc/B92+9Yk3IBkTYFKsCjwyGNYuQ7567ybjq6rHOWAq7LjyFWKoOwuFBYdjjQdAgMJq0GBo
	KhEQ9dM8dtnUnlDHLgLdhlVp5Cvw=
X-Gm-Gg: ASbGnctaSZkPtART9bw/Ow44FqCE1V5eUm6hopOI+Hot7vgo9K6CJrXpiZAyu2C1RJ/
	Mbmn4HuMtuEPjRQRc3yV3RnS6RXOXR4a+Ly7fgcjOj+XdXD26NDbZdPilrhYua43LtRNWMnlkiG
	lCkVY+/yxhtmXwdLLeNwfa0yd0dYf5MFSRN4U=
X-Google-Smtp-Source: AGHT+IHhcNHAF4ZNaHX+6YJlIL2uG/Fwj3w9O8uQ5931HqAdoVRDhyOOUAsDCLQ4FlmtmvO18oVnKTHbujP9NppexOw=
X-Received: by 2002:a05:6512:450a:b0:545:2fa9:8cf5 with SMTP id
 2adb3069b0e04-550d61e8093mr663954e87.49.1747204886804; Tue, 13 May 2025
 23:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com> <1747040619-7566-37-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1747040619-7566-37-git-send-email-wangmy@fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 14 May 2025 08:41:13 +0200
X-Gm-Features: AX0GCFuqW90O_wS8XfayJ5WxRS8e0fWy7D4P0OwD-cucuLVpsWMuhN1WIMIBNSQ
Message-ID: <CA+chaQc5av1DKKu7arqbnG-Vr8A2yVeCAxmy=kr7THKBAUusxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 37/56] python3-hatch-fancy-pypi-readme: upgrade
 24.1.0 -> 25.1.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 06:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216474

This seems to break python3-gcovr-8.3 which depends on older version.

* Getting build dependencies for wheel...

ERROR Missing dependencies:
hatch-fancy-pypi-readme=3D=3D24.1.0

Do you have pending gcovr update somewhere? Might require patch update
as in meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml=
-Support-newer-versions.patch
as https://github.com/gcovr/gcovr/blob/main/pyproject.toml still
depends on 24.1.0.

Cheers,

On Mon, May 12, 2025 at 11:04=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - $HFPR_PACKAGE_NAME is now replaced by the package name in the PyPI read=
me.
> - Support for Python 3.7.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...adme_24.1.0.bb =3D> python3-hatch-fancy-pypi-readme_25.1.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-hatch-fancy-pypi-readme_24.=
1.0.bb =3D> python3-hatch-fancy-pypi-readme_25.1.0.bb} (80%)
>
> diff --git a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme=
_24.1.0.bb b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_2=
5.1.0.bb
> similarity index 80%
> rename from meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_=
24.1.0.bb
> rename to meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25=
.1.0.bb
> index b32527f949..5d8d82edd8 100644
> --- a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0=
.bb
> +++ b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0=
.bb
> @@ -8,6 +8,6 @@ inherit pypi python_hatchling
>  PYPI_PACKAGE =3D "hatch_fancy_pypi_readme"
>  UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
> -SRC_URI[sha256sum] =3D "44dd239f1a779b9dcf8ebc9401a611fd7f7e3e14578dcf22=
c265dfaf7c1514b8"
> +SRC_URI[sha256sum] =3D "9c58ed3dff90d51f43414ce37009ad1d5b0f08ffc9fc2169=
98a06380f01c0045"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216335): https://lists.openembedded.org/g/openembedde=
d-core/message/216335
> Mute This Topic: https://lists.openembedded.org/mt/113067219/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

