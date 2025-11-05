Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B3FCCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:35:40 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2759.1762385732963065674
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:35:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MMPCc2Jl;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-63fbed0f71aso424052d50.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 15:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762385732; x=1762990532; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yX9iEAQF+TS8WGOhwfXocU9IjqNF8Kd7Gl+0DYLmo4=;
        b=MMPCc2JlnB0MEU4fkwDjv9rZs3Ncy5bzybnPc5AfKQx9KJ0k5lSytru9eyhLsH3OvU
         FRos8RMC4tbaSFNZUzT8U88Svsp6IIfU2VopkYOFRb4uUgnY2Mp44R9d+THssZhf4q9A
         Jl4cigbO+DprKUpQ6IorCJDDQTcAgt6izw3isMO+C0deoqtLHum4KukSXeuZMu0LoeGO
         /L8fQoKoU2yJlBEC5aJImEiXlHJgmkz53ANCtVzA13CUfNTqSd/Hb/vSyW4z6OcwnrDb
         nnhjUyk87EhfNbiEBUYMnpoURD/dzspAxZCV+OO5y9Z01tuy11t4yvWWVeHQ4SleFnbV
         AYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762385732; x=1762990532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yX9iEAQF+TS8WGOhwfXocU9IjqNF8Kd7Gl+0DYLmo4=;
        b=mTdrrjw+oLJfBeiV2gsPzWqb5RUUDkK+Lgw9TVFbKYiKJhj6lkhdfsmHAoa1AYK0I+
         PABvzlwsBAHnMqT7LRHo+S8PtDHoi+f5ljDtujjw24IocqtVw/V7i/54qGoP3od//n03
         ci7aSuUrSZY+G7+f6Dgfj/xSBoV9OsHH9P67o0vxefeMZXbbpD1xo0uJGPUAD3XaKLzd
         7SaWnEFB+QNJRFaTvqUr5H1hujymxURxYXvdWST391Gzh5Sc+UpdH7IjPIQqIbFpNxqz
         F4nzFvXIk+yXhXR1w0kVEFdshpzySYiWKRLvUfitg/s2JvEDPg41uVBPl6K3iL98T1/F
         LfdA==
X-Gm-Message-State: AOJu0YxOX4NILer30h+MTCxH5vfK4MWFj6akynL4YpCCbPKNq1cW5ySz
	rTjNo/+3b5g9JGnrDUBe5KDjOmUWO4hegLEuZ9OkqW5iF7BRPQ34tOrBNvun5D//I10yJFD3H79
	mkohp4YCTgS5EGANmHC06B1OVYLTiAK4=
X-Gm-Gg: ASbGncvJdbNN5eTnlDTAL3mhX/JOvbIdgPzyCamNjtJXI6M5WW/g4jHZR73T8rAt14U
	0CrLRelWy3x50MaOws0t6D4ZliwVi4WV91y3YKThf59Zbw3XlCQ5yeu/6uPg9qCLm7bpcYD1GbG
	D0w9bai9OgOzXCli7QTinyBNAkCO12iKxPbj4vuA3Umc+NsXqmd7WzF2jEhsCh6oFgS6xTV9UxF
	ULHhfbkpiYMAZrvXMNcrwrbkCsr1HSDXuHueRMvul5hOOxx9D9QfnsdZGEcFDK8rUIx/CRJ/h0=
X-Google-Smtp-Source: AGHT+IEQbiqs91BqL1QNCiCr8uyZNYGm5SxG45tOEF94fGfq6ljIc9cQM/YptN/d9ny4agCYd3fdBA8r3z7SevOIxpI=
X-Received: by 2002:a53:acdb:0:10b0:63f:adfa:e5ff with SMTP id
 956f58d0204a3-63fd35b0572mr3650635d50.57.1762385732067; Wed, 05 Nov 2025
 15:35:32 -0800 (PST)
MIME-Version: 1.0
References: <20251105232333.2800541-1-yoann.congal@smile.fr>
In-Reply-To: <20251105232333.2800541-1-yoann.congal@smile.fr>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 5 Nov 2025 16:35:21 -0700
X-Gm-Features: AWmQ_blOu-fXHuSgycJ0MWFWp4ScIlrUYBHp43jTrIw8M10oaZLwpgANsG_pxgs
Message-ID: <CAJdd5Ga4O9AWOCg=NrOnwdd_m_u24L4OS+cqB0ojmT39zFhj1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake-setup.schema.json: Add schema for
 "{THISDIR}" bb-layer
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225930

On Wed, Nov 5, 2025 at 4:23=E2=80=AFPM Yoann Congal via lists.openembedded.=
org
<yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>
> From: Yoann Congal <yoann.congal@smile.fr>
>
> A "bb-layers" element can either:
> * start with "{THISDIR}/meta-xxx", then "meta-xxx" is found relative to
>   the configuration file,
> * or not, the layer is found where bitbake-setup has cloned
>   the layer from the "sources" list (usually a layers/ directory)
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/files/bitbake-setup.schema.json | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/meta/files/bitbake-setup.schema.json b/meta/files/bitbake-se=
tup.schema.json
> index 5101b0de53e..65d6abd16b0 100644
> --- a/meta/files/bitbake-setup.schema.json
> +++ b/meta/files/bitbake-setup.schema.json
> @@ -41,7 +41,20 @@
>                                  "type": "array",
>                                  "description": "List of BitBake layers t=
o include",
>                                  "items": {
> -                                    "type": "string"
> +                                    "oneOf": [
> +                                        {
> +                                            "type": "string",
> +                                            "description": "Path relativ=
e to the directory containing the configuration file",
> +                                            "pattern": "^\\{THISDIR\\}/"
> +                                        },
> +                                        {
> +                                            "type": "string",
> +                                            "description": "Path relativ=
e to the directory created by bitbake-setup to store sources",
> +                                            "not": {
> +                                                "pattern": "^\\{THISDIR\=
\}/"
> +                                            }
> +                                        }
> +                                    ]

This seems tautological to me; can you give an example of a string
that would fail to validate?

>                                  }
>                              },
>                              "oe-template": {
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225929): https://lists.openembedded.org/g/openembedde=
d-core/message/225929
> Mute This Topic: https://lists.openembedded.org/mt/116144544/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

