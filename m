Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C542ECF9C6F
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 18:40:47 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.2323.1727116846829297343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 11:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l2Z5eHoh;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5356bb55224so6236597e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 11:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727116845; x=1727721645; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2osqS21VbfYUe9QasPJ4elEc50fMc4Xk+fYmVpnchgA=;
        b=l2Z5eHohQhK9872jyuWZpnoqJGjIJbhXzDlGFmrLdw/oYfkQX2NQBDn5onZmEUetOs
         BVoMhFuzJbiFcsm4uHIR062YQbO/31AWHlG07HJE8q91zudYKDesmVeBOGLWVhdJ3mHT
         Sv5Qi3MFpNgcOfL0spl7KaHvOd3D5MWO8yoSA64p6fYlIpuyTM/iKeZkKwexv0E5C03n
         ZOAc6eUMMd21eksNhUoaIP5e0dgjn+G5be+ddkbBAbEMpKD5tr5uKDv1mqEDZDNE61uz
         PjTmlzlIC1fhEfJb1bNeeirNQEw7JipxgH53yUCSkoz0rsI8z77DvPCrRClVsF/1dHQ1
         l6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727116845; x=1727721645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2osqS21VbfYUe9QasPJ4elEc50fMc4Xk+fYmVpnchgA=;
        b=uBpPFmFGjk6X+SmhRLqfXNJeaOL/82l1/2r/wnmHwWdpIkxq1WGJeev6+arEZu6yK9
         rZSF2VJnsm10IhoDygVqrA9Ckz+l1KvRQayxE0onfe5VqbWAGRx6Vv97XNjUVsK/yHRG
         GGX/ipfaIl6eofASguZjYDtnQdviki+MfczgsdjPVnKGdoYj5VzoeeYKjh4GZzs2l3eb
         k9nLUZq+8IdFBtRd0A58KGVe8VyYNShfJCpHs7Wl5+sEeEJioJK/nkrGRWSl9M+j159D
         pyqJoR+QK+uxk80Lx9Uh4hWpxV3UVfuavwXaY+dH+lm9ruqf9em6j/KHPc3mtbyR+LsL
         8vGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAbJdes6zca1tKty5DDJ7+OyEKiE6G/rj6uRI5II4KJaCDWDKc7i4CQcQztiqGyZeLblnnzkyHgPxB/K3XHg29KA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywg6YdsyU4DkbtBMcPP0RLDbVKj1kCf8J+F9sRGDOjhM7YkkcWe
	n4d2TD95p377JA5ikXqVmvtGVdRUO5sAJ28kFvGJwz/lzvDtY7ATB14oL7Kd0I/FEnt+DPKYu4o
	OW3J3/Z3pBY+jDIcRrhUkoL6t2Gg=
X-Google-Smtp-Source: AGHT+IHsPppfULVWdAfDiBzNtasnfpqotCvqZMXgvcq/9AlEPyCSrOtXK+Rk5e9hCu0KTGcWDbvDsLu03lTv9P0QSvM=
X-Received: by 2002:a05:6512:3d07:b0:52e:76d5:9504 with SMTP id
 2adb3069b0e04-536acf6acffmr6467847e87.3.1727116844680; Mon, 23 Sep 2024
 11:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723551231.git.steve@sakoman.com> <092d2a6df6eae6f93a35a0429d2cdfc9b246cecf.1723551231.git.steve@sakoman.com>
 <DS7PR10MB4926DCB745BE2CB39CA0A994FA6F2@DS7PR10MB4926.namprd10.prod.outlook.com>
In-Reply-To: <DS7PR10MB4926DCB745BE2CB39CA0A994FA6F2@DS7PR10MB4926.namprd10.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Sep 2024 20:40:33 +0200
Message-ID: <CANNYZj-xXKRZSX8TWZnJSEsYc8+-7uKVdWy==4g5Uz0x5_q1cA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 10/11] orc: upgrade 0.4.32 -> 0.4.39
To: Arturo.Buzarra@digi.com
Cc: Steve Sakoman <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 18:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204824

This needs to be updated in master first, and then you can send a backport.

Alex

On Mon, 23 Sept 2024 at 15:33, abuzarra via lists.openembedded.org
<Arturo.Buzarra=digi.com@lists.openembedded.org> wrote:
>
> Hi all,
>
> After this update of the ORC recipe for the kirkstone branch the build is broken with Ubuntu 18.04 due to an issue with the GCC version supported on that version ( GCC < 8 ).
>
> The build throws an unexpected error related with a missing _xgetbv intrinsic function that apparently was introduced in GCC > 8
>
> I notice that there is a new version ORC v0.4.40 that fixes the build issues, is there a plan to backport this ORC version to kirkstone branch?
>
> Thanks in advance,
>
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Steve Sakoman
> Sent: martes, 13 de agosto de 2024 14:17
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][kirkstone 10/11] orc: upgrade 0.4.32 -> 0.4.39
>
> [EXTERNAL E-MAIL] Warning! This email originated outside of the organization! Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>
>
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Include security fix CVE-2024-40897
>
> Ref: https://github.com/GStreamer/orc/blob/0.4.39/RELEASE
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-devtools/orc/{orc_0.4.32.bb => orc_0.4.39.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)  rename meta/recipes-devtools/orc/{orc_0.4.32.bb => orc_0.4.39.bb} (92%)
>
> diff --git a/meta/recipes-devtools/orc/orc_0.4.32.bb b/meta/recipes-devtools/orc/orc_0.4.39.bb
> similarity index 92%
> rename from meta/recipes-devtools/orc/orc_0.4.32.bb
> rename to meta/recipes-devtools/orc/orc_0.4.39.bb
> index 829255f110..320abf536a 100644
> --- a/meta/recipes-devtools/orc/orc_0.4.32.bb
> +++ b/meta/recipes-devtools/orc/orc_0.4.39.bb
> @@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
>
>  SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de7ce134ba73da4af18f0"
> +SRC_URI[sha256sum] = "33ed2387f49b825fa1b9c3b0072e05f259141b895474ad085ae51143d3040cc0"
>
>  inherit meson pkgconfig gtk-doc
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204822): https://lists.openembedded.org/g/openembedded-core/message/204822
> Mute This Topic: https://lists.openembedded.org/mt/107874802/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

