Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32FCD3E2C2
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 19:49:24 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.2144.1730144961024098123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A1+q07Kn;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso4108280e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 12:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730144959; x=1730749759; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kh7ksb+R4P3MTBSpORJX6KOcT+9QgrYsgjcdYKsWM+E=;
        b=A1+q07KnNbxxg4iywPW8TRbIy9FsqVjj7D+sqcBmpq4hgdiQXlMjoaVIjbckzbZrs/
         cYIxv1c3O6/L0y/tDh51kD0XxCfVJlqYBgsAlwNwqoW/b0NuCu6bdIf5zGKd8qsaH0yp
         VkiG/iaWvSol7XNBMv5Bwy4zDvABJoI/JKH+Tt0lQPmbXqRZ5Lh7ZJf6Mqq2IbCtnynV
         neXCHeEG0Czrwlh+mwJZX6VSIGZ/lMJ6vcizi37VEz1/O4KB82QD6WiU3Ff4HIWYF6Bz
         l8FwGtpAneZj+7Bmea8igO4utCaPraHD0GKStLYtiMz+D6J5T3y7ePubiC/Kqk3M7hW6
         YX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730144959; x=1730749759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kh7ksb+R4P3MTBSpORJX6KOcT+9QgrYsgjcdYKsWM+E=;
        b=k3Rs6zWcKDx0OWO7+r6fmCMTCsgGh6ub1OZhxusdyQhZNn0hbYi8aGUUSifbESI1NQ
         BIMiJCu52TZMIfAPfK8um4LzRHEdoTm+7vMiYV0ywnAb/BSlfrM2OO+kNpUPWj2S+YHT
         +PYNlp2+VqFVJVM9dn1LhQio6YbFsTdwoGVmGfREZ3Snty7aOoxgnwuboEiACtH7WgGs
         nJv4jniVuSH4SoV6qkVDwO5ntolUJMHzrE80GdiH8YY9mhBStWfQ8IHb+fOLeS6VJ2vv
         m+oU52wXbhRs9NQQ3FPWmdSh2bjlhRovo/DWE67er8nPzuDIqum0SaOUjXVGMVgxm6zg
         4ywA==
X-Gm-Message-State: AOJu0YyEgef1hEZJYMt4APBWy30/sK88bpS7whqgs2+5ALuurXJuSOiR
	9YsYlyNgxDueCqzQRyZcIQuUXbFZmpnM3o7m01GSM1ndVrHcgvUIM55NMW8D4XUYX5G77qxfITL
	9GhRnL9JUTDx8M/9Oo5AXmJiLLqPcPA==
X-Google-Smtp-Source: AGHT+IFWIqjsFXqsHYO07uuCZW5WsCGUXS5dX/YQcsbCbgrz7bEmVrABcad5yydHFuBZicMQ+k81rMBJ3BJ7+K5VCmk=
X-Received: by 2002:a05:6512:e91:b0:539:f371:3279 with SMTP id
 2adb3069b0e04-53b348b5098mr3598073e87.7.1730144958970; Mon, 28 Oct 2024
 12:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241026032519.1968518-1-hongxu.jia@windriver.com> <20241026032519.1968518-4-hongxu.jia@windriver.com>
In-Reply-To: <20241026032519.1968518-4-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 28 Oct 2024 13:49:06 -0600
Message-ID: <CAJdd5GZNV9EH0MbVuKwpCqPYWQ7Btp9vrzwTHcZboex+m_JiTg@mail.gmail.com>
Subject: Re: [oe-core][PATCH 3/6] meta/lib/oe/sbom30.py: create
 hasDeclaredLicense relationship conditionally
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 19:49:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206461

On Fri, Oct 25, 2024 at 9:25=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> If file_licenses is empty, the hasDeclaredLicense relationship from sourc=
efile
> to NoneElement which makes no sense. Such as

This is intentional, as it indicates that we looked for licenses and
didn't find any. Omitting the relationship means we didn't even look
for any licenses (which can also be done explicitly by making a
relationship to "NoAssertion")

>
>     {
>       "type": "Relationship",
>       ...
>       "from": "http://spdx.org/spdxdocs/gettext-minimal-native-1fa0d5cb/s=
ourcefile/3323",
>       "relationshipType": "hasDeclaredLicense",
>       "to": [
>         "NoneElement"
>       ]
>     },
>
> Create hasDeclaredLicense relationship only if file_licenses is not empty
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/sbom30.py | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index f4cc1f49dd..6df5759596 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -620,11 +620,12 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>          for extracted_lic in oe.spdx_common.extract_licenses(filepath):
>              file_licenses.add(self.new_license_expression(extracted_lic,=
 license_data))
>
> -        self.new_relationship(
> -            [spdx_file],
> -            oe.spdx30.RelationshipType.hasDeclaredLicense,
> -            file_licenses,
> -        )
> +        if file_licenses:
> +            self.new_relationship(
> +                [spdx_file],
> +                oe.spdx30.RelationshipType.hasDeclaredLicense,
> +                file_licenses,
> +            )
>          spdx_file.extension.append(OELicenseScannedExtension())
>
>      def new_file(self, _id, name, path, *, purposes=3D[]):
> --
> 2.25.1
>

