Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796F7CDD1AD
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 13:12:24 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.68752.1727442743749870765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 06:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yKd3ddCQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.169, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e20a8141c7so21649607b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 06:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727442743; x=1728047543; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgV3pLLQjSJP4HaB2MqnU7tYZ+0LpKvr97uJeCLPBNI=;
        b=yKd3ddCQfMkmsCyQrHytlequzNwTMt/1aXHe5vG8n/uEEKyb/9OswR2T3YTzChRBB1
         qRlg6/PFcqzrfNwH5Iz5OkmiF9R52wXtwr5/bokMlWAB0rsiomuei+96iT+GkbnotTnb
         5oLiMpMbqFRQFPSPFerdE2sFcxLm2JfWcgjs888gupJbbHWhauKlA9C97xop2BGTcOq2
         tvCOqLNqnZCkDTFB9KDLkZLm402Aexp07w+sHJBiODiKu1lAg1ukXuVOr6lhy+xKis7T
         atXNQIPT+2g9AYHjumw+ZQE3lBjurMGrTk2zfHoSM2JBd6ghgB8z7qrNFyRdFa7qrYcK
         iFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727442743; x=1728047543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgV3pLLQjSJP4HaB2MqnU7tYZ+0LpKvr97uJeCLPBNI=;
        b=nICZC04hBeKneLoB2H7/XH46itYAyuXHZUPIJY1E8pBoJzBa8pUnFSpXT3zGyjX5nI
         jKs4yrgBwuZc/l9o3XvXTXlo8tnQ6+aOHPtpMKipd+fkGJi0D/Rb7ZhPh3OBNfYNNXJl
         XBwwPKXCDVCRngZWM0YasFiWBIH1Enu6LfsQmi90tedQRZzrcN4D3/UPHyap9mCqQDCL
         HkifhPi1kae3HmfwBdOCKi+d0XMuK3i2kDnVPUGamYimO9ESvOXNR96QaJYKDQaq5nxM
         U2WTDkvpPEXZflPatVnT0i/0ULSVN6KePaPSxAd0TtPlcuWV60+Lfxf2TpfOx0PIW5cx
         r55w==
X-Gm-Message-State: AOJu0YxFpbF5IYVz2rD63OTBNGTF9bZLUAAJT7EVK4lcqhxwFsaww4k1
	cHZQ6DB/1e2SbjKzuBOmTYJLb0F8Y2fUxEOQ9Twgur8JdiBs59i507TkED3wn1f0s8IGrvF4Awv
	8AhJlLM5eCksBSoTAPnp2rPCAkeeb0Fv/fk7eng==
X-Google-Smtp-Source: AGHT+IGoS6cEk358nFbFAHXVjqwOOvcuO9s2zoRpjvD4bHKNS8lQkIrOsO3fNvAMZKLfOmHJDLXfQdifB5D+EJD1Uqw=
X-Received: by 2002:a05:690c:3188:b0:6e2:83b:94ed with SMTP id
 00721157ae682-6e2475722admr19422517b3.15.1727442742933; Fri, 27 Sep 2024
 06:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240924064159.54094-1-nikhilr5@kpit.com>
In-Reply-To: <20240924064159.54094-1-nikhilr5@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 27 Sep 2024 06:12:12 -0700
Message-ID: <CAOSpxdbDo_KnWr+E9cY_d3GZ9Rqgo-HoCv69F7Ks_7sv3-CCxA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] ffmpeg: Ignore CVE-2023-46407
To: nikhil.r@kpit.com
Cc: openembedded-core@lists.openembedded.org, nikhilr5@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 13:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205021

Since this is an error in the CVE database you should send an email to
cpe_dictionary@nist.gov requesting that they correct the error.
Please provide supporting information in the request.

This is our preferred solution.

Thanks!

Steve

On Mon, Sep 23, 2024 at 11:42=E2=80=AFPM Nikhil via lists.openembedded.org
<nikhil.r=3Dkpit.com@lists.openembedded.org> wrote:
>
> From: Nikhil R <nikhil.r@kpit.com>
>
> Ignore CVE-2023-46407 as Vulnerable code
> introduced later than 5.0.1 version
>
> Introduced by:
> https://github.com/FFmpeg/FFmpeg/commit/f7ac3512f5b5cb8eb149f37300b43461d=
8e93af3
>
> Debian link: https://security-tracker.debian.org/tracker/CVE-2023-46407
>
> Signed-off-by: Nikhil R <nikhil.r@kpit.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> index 1295d5cdf1..c0121edc7d 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> @@ -39,6 +39,10 @@ SRC_URI[sha256sum] =3D "ef2efae259ce80a240de48ec85ecb0=
62cecca26e4352ffb3fda562c21a
>  # https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2023-39018
>  CVE_CHECK_IGNORE +=3D "CVE-2023-39018"
>
> +# CVE-2023-46407 was introduced in 6.1 version of ffmpeg
> +# Vulnerable code introduced later than 5.0.1 Version
> +CVE_CHECK_IGNORE +=3D "CVE-2023-46407"
> +
>  # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D7717
>  ARM_INSTRUCTION_SET:armv4 =3D "arm"
>  ARM_INSTRUCTION_SET:armv5 =3D "arm"
> --
> 2.25.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204835): https://lists.openembedded.org/g/openembedde=
d-core/message/204835
> Mute This Topic: https://lists.openembedded.org/mt/108624121/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

