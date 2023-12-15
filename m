Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3889C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 17:19:55 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.67906.1702660786211364856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 09:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d3TGn9/s;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e18689828so982114e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 09:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702660784; x=1703265584; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hj97Ix2HHaXcg8gnm5jRYDtySmth6d8drqIAOk7emH4=;
        b=d3TGn9/s33KFw75HNY/6yng/EWokpYZTNU0jHBYa8abHiw5UKI6bLXDPgth9W2pqny
         3wNLKJaiErxTjWqnfEjEjMtEGwtYFd0JzY+BM5xc6DjCj5Ck3kjGqASg/5MzCWO+7F76
         8hYqcp21I7nQKDM2S10J1mLIjn3lBnKI7jU3+tRX1gxDFi0egtS2fMSvWiIVMPtoJ1pS
         DyJ1NUkWDpsDSqmeMVRkHwH01qVZIn+Gq1hcW8mEJ+vY3T7ZJ461HjNMOAMk6C/62I/m
         Wlxjdaq99TJE2mzHKjNIKTRnUnsR5xRU/u0nK9F3/VA3yFXuJ57o5YdcZd6Sq/9hQaBB
         YiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702660784; x=1703265584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hj97Ix2HHaXcg8gnm5jRYDtySmth6d8drqIAOk7emH4=;
        b=gBQ4VrhyyYWWKVdeQDpWIO/RYJdB2GuE6sZqI1a9Tl3Gu4hcQCitDFoaCgwCbkazNF
         eW9vUngNvID15IJlhP9VjUeZRO0aSkR7+Ai3cspGeDEtdj973Kh8lgAE16tPpB6rcFNS
         mah13D/gTb0O2uxG4b5VzIPc8i6wAuH0xl15Js4TEYS45sMdi3IjmXS2+Rgj837XJwvT
         BOtbWntsuOGvehoGyi53O7FkzRCSOQzxCgIQEp1Xo79mPFkBrfycUmRYfBWPUTJQJWWJ
         sDd7OutqWAFYO1HD2oxa9kpNAjF+YWC1ZSlCb819daID+1oNzIcTcKTwTujjKEsDaN7L
         Q5rQ==
X-Gm-Message-State: AOJu0YzdZMRoHJs5wU6VpujCtLCPBl3pnyG0F3wkIhR+Jof+NO7AGSb2
	ccdOiGt+JEjmKlf38cWnadEj889JACVhhUQvtrYdUhbB
X-Google-Smtp-Source: AGHT+IHeq4zog7lLP2Dwv80GgLoMgtlU/Q7PKoQZHKcQloFsvE9FrmMdOxEwk1jj0t5TYTlrGqeWNLV1C4A5UufCxLU=
X-Received: by 2002:a05:6512:3b9d:b0:50b:fa5a:6a14 with SMTP id
 g29-20020a0565123b9d00b0050bfa5a6a14mr7105216lfv.2.1702660783825; Fri, 15 Dec
 2023 09:19:43 -0800 (PST)
MIME-Version: 1.0
References: <20231215171046.2926492-1-jpuhlman@mvista.com>
In-Reply-To: <20231215171046.2926492-1-jpuhlman@mvista.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 15 Dec 2023 10:19:31 -0700
Message-ID: <CAJdd5GZeR8=yT=u6P7e1rsriFZcPPx97rfS0=CHOoFTHXLu+Ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] create-spdx-2.2: combine spdx can try to write
 before dir creation
To: jpuhlman@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 17:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192537

LGTM, Thanks

Reviewed-By: Joshua Watt <JPEWhacker@gmail.com>

On Fri, Dec 15, 2023 at 10:11=E2=80=AFAM Jeremy Puhlman via
lists.openembedded.org <jpuhlman=3Dmvista.com@lists.openembedded.org>
wrote:
>
> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>
> On occasion a file is attmpeded to be opened prior to the
> creation of the spdx_workdir. Create the directory before
> the open, just in case.
>
> File: '/build/layers/poky/meta/classes/create-spdx-2.2.bbclass', lineno: =
1081, function: combine_spdx
>      1077:        )
>      1078:
>      1079:    image_spdx_path =3D spdx_workdir / (rootfs_name + ".spdx.js=
on")
>      1080:
>  *** 1081:    with image_spdx_path.open("wb") as f:
>      1082:        doc.to_json(f, sort_keys=3DTrue, indent=3Dget_json_inde=
nt(d))
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> index b0aef80db1..486efadba9 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -1075,7 +1075,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, =
rootfs_spdxid, packages, spdx
>              "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.SPDXI=
D),
>              comment=3D"Runtime dependencies for %s" % name
>          )
> -
> +    bb.utils.mkdirhier(spdx_workdir)
>      image_spdx_path =3D spdx_workdir / (rootfs_name + ".spdx.json")
>
>      with image_spdx_path.open("wb") as f:
> --
> 2.35.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192536): https://lists.openembedded.org/g/openembedde=
d-core/message/192536
> Mute This Topic: https://lists.openembedded.org/mt/103194653/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

