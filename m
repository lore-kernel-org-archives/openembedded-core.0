Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123C0C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 15:10:08 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.19939.1707405005220236573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 07:10:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PJ5Yo3qw;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.172, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc74897c01bso344324276.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 07:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707405004; x=1708009804; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJitvr0gZkKgylBCC0iOlRsoI8rXMG+lhfVrD5J3p/o=;
        b=PJ5Yo3qwI8GgbF89qroctAu5LEEjDN4pduwcbwhfsX3O6zQilocouuuFeKA7CTygIF
         jGfaTmIKQRqam/rPVYYnxWrmcxdEpvvhSmNH5U+3wj5DdnxWR61ly6Hrp0MYG7YkJyUG
         Qt6ve+kgc2d6E0GCe1Ps12+9yAFC3aZxQ87zPbfolFwA1I0c62cAqJEpbKQy+6lDtIKC
         KdOcve8KWBYpDm+VGoTrnfLuA/+lGASlVPGMgrrE0S6vQ6a1ElrLRQ5m18yLogYt8cE1
         jBaQTqo/+0Y1zh07UseeOyYBmYRAxUR4+LGRFLAVIidmmq/DLiUs2xKHOIV9rYQhNWti
         aTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707405004; x=1708009804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJitvr0gZkKgylBCC0iOlRsoI8rXMG+lhfVrD5J3p/o=;
        b=Hs89R+niZgnwomnU1KNKnRGFNvXZmrVPXdF/Kyjn56g2Dd0ONWPSMC/1KqUFSkgekb
         jXPWRfbNBDM5DyS1FWYdssecbGBe/zrZeAUP6apjbTECjD8f7D/x1YY8r70yN9aoW5hM
         qKhb+XtnZPGtLVYZDEfSY6gZqEIf8kBpYgQ7LSuF2uA+uMQofCEQD6e0+uTcA9kN7A6s
         dOr5Qj2dhMLuj91v9ZKxlx1FYyO8hZL53ZTyAD7yFhKIFd50CfnuU9ysNhZifwxICDfJ
         qruCHvyurKCIZQgpaJ61N43zaqmcXbGz/Y5QizU8KvXlcRkC4tTlD7DRxgDQ47j+LFYZ
         xsQA==
X-Gm-Message-State: AOJu0Yyloo1ljKUCHDZvo2njWEdaDrl5nQoWrGRPVZxsjxU30Lmt5E1b
	icQLRGjq2AoOhwh7xKVp3L0diYafQkDPocfva/I9/4suc8ZJYj8cObByz2dW7a5SoA6sFfvXMP1
	cjAQlaCA4nAXdDxAwH/jsNC45Xj6a30KZRciQMQ==
X-Google-Smtp-Source: AGHT+IGBM1ieHNfRCLdIfKUoPSyMOfokpnbdmlyBHy5W9pNzk3isULHW4vMqldFk1p08dS1g+ATYz3fhX7gkXmIllhI=
X-Received: by 2002:a25:8751:0:b0:dc6:ffb0:d2d0 with SMTP id
 e17-20020a258751000000b00dc6ffb0d2d0mr7746340ybn.19.1707405004283; Thu, 08
 Feb 2024 07:10:04 -0800 (PST)
MIME-Version: 1.0
References: <20240208064030.118190-1-vanusuri@mvista.com>
In-Reply-To: <20240208064030.118190-1-vanusuri@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 8 Feb 2024 05:09:53 -1000
Message-ID: <CAOSpxdYeRmheWtPVkTHXO=8EOorxG+2p8nFkEOa5oK6FTf-Zpg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] ghostscript: ignore CVE-2020-36773
To: vanusuri@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 15:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195158

On Wed, Feb 7, 2024 at 8:42=E2=80=AFPM Vijay Anusuri via
lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
wrote:
>
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Artifex Ghostscript before 9.53.0 has an out-of-bounds write and use-afte=
r-free in devices/vector/gdevtxtw.c (for txtwrite) because a single charact=
er code in a PDF document can map to more than one Unicode code point (e.g.=
, for a ligature).
>
> Reference: https://ubuntu.com/security/CVE-2020-36773
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/me=
ta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
> index e0d1e4618f..cc06d092c1 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
> @@ -26,6 +26,10 @@ CVE_CHECK_IGNORE +=3D "CVE-2013-6629"
>  # Issue in the GhostPCL. GhostPCL not part of this GhostScript recipe.
>  CVE_CHECK_IGNORE +=3D "CVE-2023-38560"
>
> +# This CVE affects Ghostscript before 9.53.0
> +# https://ubuntu.com/security/CVE-2020-36773
> +CVE_CHECK_IGNORE +=3D "CVE-2020-36773"

When there is an error in the upstream database it is preferred that
you send an email to cpe_dictionary@nist.gov requesting an update
(giving links that justify the change to make it easy for them to
research)

They are usually quite responsive, and this is much preferred to
carrying an IGNORE in our metadata.

Thanks!

Steve

> +
>  def gs_verdir(v):
>      return "".join(v.split("."))
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195101): https://lists.openembedded.org/g/openembedde=
d-core/message/195101
> Mute This Topic: https://lists.openembedded.org/mt/104234914/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

