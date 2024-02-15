Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CD6C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 15:48:37 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.17215.1708012113265182355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 07:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=moP4udXP;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d109e7bed2so13374151fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 07:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708012111; x=1708616911; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPBeTXIdjEYomDBfsc9LrtQLtuGZh572H42HP7RDP2Q=;
        b=moP4udXPmaFjy7DTmh1zifl0AHQREV6v0KhhZI6Il6jcnVDZo4codauCUe/1BN+55Y
         AFlyFGw/w9sT1edwFr5x/IBRhh1j37E+Y4tEgbXF1IkmJ3a6CXCxvb2reyJpf+geYAE7
         Dei/q/synFhEYk0Mnp/T4h5iIQ5nXszm+ilpAMrHe0fSFSN81qttj7jFHL7SfCPGCgct
         03WlOBqu1ax554ySRq8G5WKOYxW88AZ7aCGfXsAZOt9f5WBtfV4A22TD7rZDZStUzRxp
         Ep8Ehpsz3XZqMXgzKc85hLAL1kqhebiBtaTBOrRWaHUGUKSCDaGVVSKBis7hf+DMivPH
         sHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708012111; x=1708616911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPBeTXIdjEYomDBfsc9LrtQLtuGZh572H42HP7RDP2Q=;
        b=JVyxZRLVrWSvo71DsEPo2/1Qo5Kd0BN4Q0A2+eeIjPkh5IwocRbCaVkKDsJR9TmRCK
         QsBD1G+0pucdJjWjeuahBxdgC9CKBWeg5SOCSRhKwl6hR+m7n4dfScpcPaGazEHFwbN4
         NJwTefVpDX08Tv1ffbBFMoW6fqmBmykG+bigmNf9YhF86lMLHjol3IMG697YCR8P3VDI
         iV0fNV0n+MvCH5l4yyS/0BQKRe9f5shgRXJjiCOpg9k4lKcI1/scMOM/ZHma0Dh1mEn1
         cw/x1mIM+MLdmIcF4qPZuK7xmTqnPc/lzSJywFlibva8u4yhZ4pKONQYnPNo3PQfBSX5
         4sUA==
X-Gm-Message-State: AOJu0YxFQb1wjAjUgrZvP0ZetwZ1dIET7FwKBHs0WvoIMLxe5sGxNhkv
	GUbWSwKiJYjbD3AWMxSrk72Tr3lodB4ny9xZstiw46UXpyv7t2GNcIIf2gTh0DOfGA6+N59B+Rt
	CqnQYy6K6wESG09ZErSqcSdUXczQ=
X-Google-Smtp-Source: AGHT+IErBhPrRkI6jXGnQY7k3gzdADHJvn6w2SLEPRWlU+4t5gI6Athhw+/az+eQ5tsYqYiFWjKCFxkMGT0Yu5aTD2w=
X-Received: by 2002:a2e:8919:0:b0:2d1:1d21:147e with SMTP id
 d25-20020a2e8919000000b002d11d21147emr1609082lji.4.1708012111148; Thu, 15 Feb
 2024 07:48:31 -0800 (PST)
MIME-Version: 1.0
References: <20240214013316.127190-1-m.belouarga@technologyandstrategy.com>
In-Reply-To: <20240214013316.127190-1-m.belouarga@technologyandstrategy.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 15 Feb 2024 08:48:18 -0700
Message-ID: <CAJdd5GYmR9iPOeWji5YpbZQVb_eDi_7g7KiUWZaNR2eVV9QYKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] create-spdx-2.2: Correct the default value of SPDX_NAMESPACE_PREFIX
To: belouargamohamed@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	f.lahoudere@technologyandstrategy.com, 
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 15:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195519

On Tue, Feb 13, 2024 at 6:33=E2=80=AFPM <belouargamohamed@gmail.com> wrote:
>
> From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
>
> This patch corrects the default value of SPDX_NAMESPACE_PREFIX as the pre=
vious
> value is not expected to exist.
> It adds also the documentation of the variable SPDX_NAMESPACE_PREFIX.
> This patch can also be linked to the bug: https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D15398
>
> Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
> ---
>  documentation/ref-manual/variables.rst | 5 +++++
>  meta/classes/create-spdx-2.2.bbclass   | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 6f7d6ff01e..907575ba82 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7913,6 +7913,11 @@ system and gives an overview of their function and=
 contents.
>        image), compared to just using the :ref:`ref-classes-create-spdx` =
class
>        with no option.
>
> +   :term:`SPDX_NAMESPACE_PREFIX`
> +      This option could be used in order to change the prefix of ``spdxD=
ocument``
> +      and the prefix of ``documentNamespace``. It is set by default to:
> +      ``https://spdx.org/spdxdocs`` .
> +
>     :term:`SPDX_PRETTY`
>        This option makes the SPDX output more human-readable, using
>        identation and newlines, instead of the default output in a
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> index 486efadba9..dedaffc043 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -28,7 +28,7 @@ SPDX_ARCHIVE_SOURCES ??=3D "0"
>  SPDX_ARCHIVE_PACKAGED ??=3D "0"
>
>  SPDX_UUID_NAMESPACE ??=3D "sbom.openembedded.org"
> -SPDX_NAMESPACE_PREFIX ??=3D "http://spdx.org/spdxdoc"
> +SPDX_NAMESPACE_PREFIX ??=3D "https://spdx.org/spdxdocs"

Per the spec [1], the recommended form is
"http://[CreatorWebsite]/[pathToSpdx]/[DocumentName]-[UUID]". If a
creator doesn't own a website for publishing, "spdx.org/spdxdocs" can
used for CreatorWebsite. Therefore, while the "spdxdocs" is required,
https:// isn't. I'd prefer to keep it that way in case anyone wants to
use that prefix to decide if the document can be downloaded or not.

[1]: https://spdx.github.io/spdx-spec/v2.2.2/document-creation-information/=
#652-intent

>  SPDX_PRETTY ??=3D "0"
>
>  SPDX_LICENSES ??=3D "${COREBASE}/meta/files/spdx-licenses.json"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195450): https://lists.openembedded.org/g/openembedde=
d-core/message/195450
> Mute This Topic: https://lists.openembedded.org/mt/104345729/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

