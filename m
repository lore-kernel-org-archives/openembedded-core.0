Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0384CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 19:18:03 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1397.1762802281100409495
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 11:18:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DT7c/x+l;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-63fc72db706so3159491d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 11:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762802280; x=1763407080; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1DnlaahhoLNozNnL2LTtrdcWNdFjzrPAbUzpDR4fFc=;
        b=DT7c/x+lcp5t0XVMPHcfcCmgM5DQ4aJe5VrF4Qb+zJj3/QEueU7nK4yET/Iqkkl9cc
         PjI2AccgAMxx0uOSSfanjtWpqGbBwPkFlko0f0c6AuRZ9aYBvRlCYahIaojf2vsHedAx
         L3uuc6irmS6Yk6PcjaV0ulCxjjf7gjKMRAwgz5n1LAAIItu6J1WFulSiLF0Gl0taWlMb
         Gc0I/pIF+vzsCY/UKuj09FHCUfXL1xmPryQlDK0DhtG/wRPipkjKj4f/3yoCTwB5pWgi
         Mn03hg/B2Hmo1OvbY5H9afRCRxPl+5FyTFdtEgSocIWDmPScppEOYgunSihsTaQJUncH
         07UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802280; x=1763407080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q1DnlaahhoLNozNnL2LTtrdcWNdFjzrPAbUzpDR4fFc=;
        b=V4OFuOeI2sWZoB46uDa8MlAnKNjrqaUf24YNrdE+igj4ewAx5pefu8paXaaQikDXK1
         8TKmDOOw0hon0/z4QwsHUiS1geR6Ey7NQv5gH/eLkqGypwwb/lG3PQLQZdAm74tBwTGo
         aO7kp1O+1JVNFR3/Wp3m5+QucrMFj6YOjy/kPLu1WhXko4BW3DRRmj/JdTAWcijiAoJQ
         pbz/XuKfELINQN42sdWxhoB6zdn+jRY4DFeOBc9pJAk/tYdD7W3icHRv6A1yUXEVLOay
         r2yfgafxPiVO+CUA2gulbCPpZT4+1hUDFaDKO7bm4HbAywcBXUh5+c4kJ3cBaOCxxAPj
         ixHw==
X-Gm-Message-State: AOJu0YzW60N4YZeDgxLumEp/0AxhMDBUFI7BIPdezWXJKRc+nh8+dKWl
	EWCemYshamhd7iFdAugnFX6n462YPM6uXYWspeOqk+I49iNpNPMx8CZnJPZLNdpN+SG1kwaK/SS
	D8hspn5y5RME221NjFgdLalEIdOFGTrg=
X-Gm-Gg: ASbGnctjBQmfiyc9JHzNevSLCswIYF/T6PZyXDkLUQ+2Iiakwx5k7CgdSlpUxJlKzPp
	nqPji+iRjQoy0VJcBgxcYvGneArPoz5fgShBNytUu+oSWndlm4qyP0CAVq54FFYuDuljR1iirWA
	9KoW881kXsYpKA9d9rurJ3svZsI1BYJCTAI4EBumTlHwVHuUzv/6BRvgVuUTadWlT9DSgfAW/aH
	NqQeru5uvUZOZSSIcrZVgkgR7+c6g/tLlSXGSd1GX5ckFYFG7wbh6/Bj1ihbGdJxQma8f7ujdnD
	Tj1z2lEhbA==
X-Google-Smtp-Source: AGHT+IFSzo5Kt6jPBTTkZVKpFLwSnZGYVaOIbsYFngY/njF1ENz2dbB1bL4EWEPAgUj6XG8KQKKDh03famYMeBK0qdg=
X-Received: by 2002:a05:690e:15c8:b0:63f:c4f4:e180 with SMTP id
 956f58d0204a3-640d444a16emr7347646d50.0.1762802280112; Mon, 10 Nov 2025
 11:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20251107040923.4127069-1-namanj1@kpit.com>
In-Reply-To: <20251107040923.4127069-1-namanj1@kpit.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 10 Nov 2025 12:17:48 -0700
X-Gm-Features: AWmQ_bkpbb6XATJG_p_5dX8w1bK1TIb5CC6UIzdHk_dpIEYz_53ZwnQmQfmHjuw
Message-ID: <CAJdd5GZnHbXCuNn64rx4YnPmxJ27oERiuft1wRvDNbrgzR7kNQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][master][PATCH] socat: Update LICENSE field
To: nmjain23@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Virendra Thakur <virendra.thakur@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 19:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226137

On Thu, Nov 6, 2025 at 9:09=E2=80=AFPM Naman Jain via lists.openembedded.or=
g
<nmjain23=3Dgmail.com@lists.openembedded.org> wrote:
>
> The below reference clearly states that GPL-2.0-with-OpenSSL-exception
> is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
> Therefore, update the correct license.
>
> Reference:
> https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14=
a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7
>
> Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
> Signed-off-by: Naman Jain <namanj1@kpit.com>
> ---
>  meta/recipes-connectivity/socat/socat_1.8.0.3.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb b/meta/reci=
pes-connectivity/socat/socat_1.8.0.3.bb
> index ee6ca1fe44..964af9d124 100644
> --- a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
> +++ b/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
> @@ -5,9 +5,10 @@ HOMEPAGE =3D "http://www.dest-unreach.org/socat/"
>
>  SECTION =3D "console/network"
>
> -LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
> +LICENSE =3D "GPL-2.0-only & GPL-2.0-with-OpenSSL-exception"

I don't think & here is really correct. If we were doing this in
accordance with SPDX guidelines, it would be something like
"GPL-2.0-only WITH OpenSSL-exception" or similar, but we don't
(currently) support the WITH operator, or dsitinct license exceptions
in general. However, our "GPL-2.0-with-OpenSSL-exception" is not just
the exception (as scancode claims), but it is the complete license
text; it also isn't a SPDX license identifier. I'm not sure why
scancode is identifying as just the exception instead of the full
license with the exception, I'm pretty sure that's the problem here,
and adding in the GPL-2.0-only is not correct.

>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
> -                    file://README;beginline=3D248;endline=3D278;md5=3D33=
8c05eadd013872abb1d6e198e10a3f"
> +                    file://README;beginline=3D248;endline=3D278;md5=3D33=
8c05eadd013872abb1d6e198e10a3f \
> +                    file://COPYING.OpenSSL;md5=3D5c9bccc77f67a8328ef4eba=
f468116f4"
>
>  SRC_URI =3D "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.=
bz2 \
>             file://0001-fix-compile-procan.c-failed.patch \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226007): https://lists.openembedded.org/g/openembedde=
d-core/message/226007
> Mute This Topic: https://lists.openembedded.org/mt/116166040/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

