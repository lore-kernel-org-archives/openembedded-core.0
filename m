Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B25C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 15:39:49 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.10913.1742485181085151530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 08:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hMNUNFUh;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54954fa61c8so997660e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 08:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742485179; x=1743089979; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgSxL4ZlY3AO/XxarsJ9opxj735nfjLasiub7M34f6U=;
        b=hMNUNFUhabg116r3MW8udQIeCjCic2+gMM7+JEOVplofquUEkPFAxCAFHM1/5KiH6g
         C45fSOMZRUgG7kS9cFyr/r1NBuQZ1FJrNs/atfLHUq2foYsHdoklTcZjireubFk1pWwN
         OpV5+eV+qMfNU4augvpBoAP4r/M8pw3aD1d6zwrueuy8I89xaHB6wOwxHooNGu89ABFt
         wfbUAQkBfm+pt8D0m1L7kBTo17pF/uq21Yjy9ueRM8P5LfqwFzfw5uVlb8QajiuKlJBW
         ECDR2Sd+mmwEJdvSB5X7vM92JZRuoTtRQT5E/IWLgs8cxgXRkSBlfdQXPnSNb02i3I0L
         t3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742485179; x=1743089979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgSxL4ZlY3AO/XxarsJ9opxj735nfjLasiub7M34f6U=;
        b=o1Xm/pmivnFuGZEDpa2G8GY907BOA1UaJoS759bq8MAWF0ckEvh55XeadP6uOD9FK8
         6209yQ4mhgCH3FSGPyOE0O7G//3X9/IaTYZ2nkBuZhjuClwzbEuoc3axTWAmjC/1Azp8
         q8wttS/t7clrHloJzmUqVyno2DIJ692Mur14LBb4xm1eafH9w0T6MGuty9g14I0RPI+D
         a8xRYLhZs2x8lmtOa14BlS54kSFCehoHC/q+QHXNqKCjQ8n1XmQXGj+dzfGjPcvsmuez
         qJOo6YX4ZdsxWbue0MPepLjN2vXrnDBKe6VyJbIV00z4YRK4w6FEIZSeXol6bq4/Dkux
         IGcA==
X-Gm-Message-State: AOJu0YyCDcoxFCo+81u9bprNx71NAQq6vcjBvjQ22vXeaZ06w8SO2fIE
	Y3+f/Mu6M6wAq+mGGgBaFz4rod/khfqHnH4wZXqzJd4LyLETgvhZ0bAaE/qJAHURfKPTeAjb9tH
	lW+xvhSRrKePS/ru/MscpefRuKdo=
X-Gm-Gg: ASbGncsGRdti7Dc/iSwkJGs1XhBVx7BQ56s9lY/8dBh/effMszm0YjQXBWYnPrr76YF
	UJFLsztVqsRq+gIuX+pLc1eZiuIix7w3C6tFJZR+zAJ6a09vPtZ2JEFcPtPm7A9umCnsBCmjQis
	00F9G4aa9X/z572xadQsY6JGqykBiyrQE34bw/G3W1
X-Google-Smtp-Source: AGHT+IGZBvG1N75Y83iAS2QvvrdnjI7FuwFWF5rR/quxXTD3o1NzVuuP6jqBKJV/fUTCrsUrFA40rixHmsL2V4pqCQE=
X-Received: by 2002:a05:6512:23a9:b0:54a:c4d2:4b83 with SMTP id
 2adb3069b0e04-54acb1ce7e1mr3311052e87.23.1742485178890; Thu, 20 Mar 2025
 08:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250320121533.39356-1-peter.marko@siemens.com>
In-Reply-To: <20250320121533.39356-1-peter.marko@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 20 Mar 2025 09:39:25 -0600
X-Gm-Features: AQ5f1JotmxDSc0PwRbByFGmzkvXy_OkV6kpuam9UGLZmhCcHTdE1yF0TPpkN-tI
Message-ID: <CAJdd5GasOkEqbWHr-Jkok3VmZDwhKeH2cW8wNCkRG+b-=StXPA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] spdx30: handle links to inaccessible locations
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 15:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213409

LGTM, Thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Thu, Mar 20, 2025 at 6:16=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> This is the same as e105befbe4ee0d85e94c2048a744f0373e2dbcdf on
> additional place in the code.
>
> When a link is pointing to location inaccessible to build user (e.g. "/ro=
ot/something"),
> filepath.is_file() throws "PermissionError: [Errno 13] Permission denied"=
.
> Fix this by first checking if it is a link.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 0618f2f139..bba11ae930 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -1068,7 +1068,7 @@ def create_rootfs_spdx(d):
>          filenames.sort()
>          for fn in filenames:
>              fpath =3D Path(dirpath) / fn
> -            if not fpath.is_file() or fpath.is_symlink():
> +            if fpath.is_symlink() or not fpath.is_file():
>                  continue
>
>              relpath =3D str(fpath.relative_to(image_rootfs))
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213385): https://lists.openembedded.org/g/openembedde=
d-core/message/213385
> Mute This Topic: https://lists.openembedded.org/mt/111807091/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

