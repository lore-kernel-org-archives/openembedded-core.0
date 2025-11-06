Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC40CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 20:43:01 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7921.1762461780057519035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 12:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vkz/ezid;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-44ff6f47c9dso26075b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 12:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762461779; x=1763066579; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edE1pGZFNE6KKYb+JyKrc/axSMp1+DGiH1DQiA3YNwI=;
        b=Vkz/ezidWcdOOGPRbadWPs73a9wi3bKQjPDuA9BrH8yOZ87c3SHLY/ums1cZnTDhIg
         Kxxdfl17h9vIaoO9LZx4qDzYlcS1ESisi8byuqJtOM5hPLEme9pOnzf/0JKpKX+yn9Ii
         aAUuHbZLccQsjol7ASCQYii+jYO4D2VDcDDNWgBTf2xMQ5g1Na8Ddl4SLExCpi9vBpXM
         xdk1+twqpVQbe+R6YobTOtaHJGt46uR4KwSSLNuoOC168bu3c8MSSjvqhrLdWpyTj8Fp
         ZgJhg2g7/dpfiO3qgXZjU02cOYXgeaQmywz7tZuAke4OrGcZof0KDe9Jg1aRLdCksodc
         MbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762461779; x=1763066579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=edE1pGZFNE6KKYb+JyKrc/axSMp1+DGiH1DQiA3YNwI=;
        b=wmAyPjmZtdflMV4Vkch74hZW03guksU0cmmnW9ReXweT1UlcFDg/S+pXhuD6x2XN+A
         T4bGeiPEzi44NdV3Xx+WHXm3Ro1HUHDe3iLyk82+f3akq8IcRG+UhjE9JKQYIX//7Nvc
         5SKNs3Ww7btbA9+BAeXvAi2dWHL7gYtJrcBDQqjAZ+58sdyj4tt4obdFpxRRrKismtTv
         9LajBI4CNWNWhXkU/DBNPCMGTmx7Sstz8x45bN7XUG133nYInSG0XshvnTKbSkBoIlHZ
         AOkvCKrcJcS4zhSLfp8Mle7dphAkmkTPzX9VZnY1W/t0NwYIT3FsZFH6Q2br6Fp+XVzl
         S7+w==
X-Gm-Message-State: AOJu0YwsnACy76eXzoS0PRBm9dqhPKhmmenhFOtjrOWVnA5KmQeua/sy
	mFF70HqpH8Igh5+diVcTzaLd9pd/Mo1eYZ4Z0xw0IvKMrgvTGS/xXnE2PNjhFlOT6T98+kNMl0T
	3PtcMFdsfJQkr2zYZcPjCwFI4uAWVtEWZTaqI
X-Gm-Gg: ASbGncujV9b6Yc3MBGOBGiOcNhvbMMlljsZe1RoVi1onRMezCSS75ErWAGM9X6Au8TZ
	TEE0MBwJ4lVy437Z3AmITb0eAisdMu3JtwEepOdUQ3hOR7pPGtgVQO40hs3hg5YqwPCxugAtZbE
	K4m0moJW+wgPkHIgevrtduVjHM05oUEkqJiTApK816lLgRZ+qHq1bJcjoQvzwn+NALgA4hbf/OS
	qqHGLYJoaHOH/0bhzFlYeZ4VDlo+TUbKDTXA8piG1zZG+lBg+pjtlc5OsKwcbQ=
X-Google-Smtp-Source: AGHT+IGuHKP2jahseLiQeM/kUWe3CojNyJsTfo+WlHpr0T1jo6EykSAjZoeV7CjIMlREV/bxNkX6rK8UVIKuPy4bB10=
X-Received: by 2002:a05:6808:bc3:b0:44d:c185:f816 with SMTP id
 5614622812f47-45015ee46fcmr527078b6e.34.1762461779235; Thu, 06 Nov 2025
 12:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20251106202021.3084656-1-peter.marko@siemens.com>
In-Reply-To: <20251106202021.3084656-1-peter.marko@siemens.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 7 Nov 2025 09:42:47 +1300
X-Gm-Features: AWmQ_bmjprXcZJfI1dX9uNRuYdMQNrYYYdzmg8FddSA1y44VJ5u8RkgHRdkKWfE
Message-ID: <CADySD0EgHBdCVRD0evUJ+tzwTMpSZBnG6qMOC+z5NqnMKEg9bg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] curl: ignore CVE-2025-10966
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 20:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225995

On Fri, Nov 7, 2025 at 9:21=E2=80=AFAM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Per [1] this CVE applies only when wolfssl backed is used.
> 8.17.0 removed WolfSSL support completely.

But the recipe version in use is 8.7.1, so how is this applicable? Or
am I missing something?

>
> [1] https://curl.se/docs/CVE-2025-10966.html
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-support/curl/curl_8.7.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 713d90a3787..6c027463949 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -39,6 +39,7 @@ CVE_STATUS[CVE-2024-32928] =3D "ignored: CURLOPT_SSL_VE=
RIFYPEER was disabled on go
>
>  CVE_STATUS[CVE-2025-0725] =3D "not-applicable-config: gzip decompression=
 of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` optio=
n, using zlib 1.2.0.3 or older"
>  CVE_STATUS[CVE-2025-5025] =3D "${@bb.utils.contains('PACKAGECONFIG', 'op=
enssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d=
)}"
> +CVE_STATUS[CVE-2025-10966] =3D "${@bb.utils.contains('PACKAGECONFIG', 'o=
penssl', 'not-applicable-config: applicable only with wolfssl','unpatched',=
d)}"
>
>
>  inherit autotools pkgconfig binconfig multilib_header ptest
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225992): https://lists.openembedded.org/g/openembedde=
d-core/message/225992
> Mute This Topic: https://lists.openembedded.org/mt/116159923/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

