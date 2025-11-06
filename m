Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF8DCCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 20:42:12 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7937.1762461724410926366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 12:42:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QWe87yaw;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7c6cc44ff62so30395a34.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 12:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762461723; x=1763066523; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mq+dgS/25WGSf1WPlL7rnu/IQmBHhdHZq6+qwunibY0=;
        b=QWe87yawB8vFxKs/FubZB16V8Q1mcXLz3s7E1sydiapxlxXVEf9tk/W5lBQtlRxs7Z
         vhPxSeRXdTm9vptSIU/sMAqgobB+5lj811SG2VGApq1NIObYhyCKmnckQSjLZ7Zf43Gr
         rg1Awk+qWlqZ7adfTyiWlnxQGMgztsIiwkzsbV6YN1JArUI5ht7x+AjTzN/sBOhtFuab
         rXX4/GfgCVCImVGWxPvGGSOPHSDMJb+AbBJWNSakO5r7U1kFt10w4rpFaxb+MNO9EDDv
         foCGiB4+spwJU23vSgXF9oMV2zUVwnxdpv7mF/x9I8IpfpVzoOO9XtY2GCXqg6cOvkVS
         fZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762461723; x=1763066523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mq+dgS/25WGSf1WPlL7rnu/IQmBHhdHZq6+qwunibY0=;
        b=ocdpQG7PEol8MdtGSY16sBFKvHkyjQ2+SFNfEBd2B9JPnV8JpMbFC7oT+8rpMxnTID
         ruw7eudTFWOluddevJbrJsVcJCn1Qao74e1yp0gNsALio0acOZZF6se35iHDMS6o9giq
         RdW1WdHYEVs2+jMCpsirMGMNjV4hSIl81dYHrie+svBIPIq6GMCUkdTG5kUObogbQZvo
         uwfKa4KC3a+vVp8IVBbZJ5AR7frSlK8plRm/x9+2wdSvkvDgkguHdv3E9UD3NcZAZZJi
         uT3xfm8pgdOgJwvqt6vUdBf19w+2cZaJqArzEYIxxVOgDCk2w4bMMoGnqsr0DmqeKQU4
         cGYQ==
X-Gm-Message-State: AOJu0YwCOnkc1C6TJ0KSL1Sc8sZenzBOov5M61DWay1HRS2jgnqso4cj
	0uWB6NTHo/ZB6oMjbXIJLN5W2kjKHSDZJQMXUxPKw+IIt/Gy2AEz0KBSwMZOflMhnr+25qxq2p3
	cL9j7URDv1w4zLJNNk9/caNXquiLN8KUNEA==
X-Gm-Gg: ASbGncsp+FeKj84eAOMof8VLAWxqRMAbZCYLX5VIItS9UV46XBiFPkzReE4bluD9WhU
	1dO0eSK3COcTjalMGqPdV0CXsRRyfBTrVI2fh498EYsGUzZq3GzJKOBFB/kGOE41F8i5UaFWunb
	wHaq9YXxZpfiJ2fJe5OM9vtmblIkqY7rcXFSEFdGzqkYIAtail5QfB0fCr3MRdaGq0yjYFpp9VP
	n8wj+76sJX4DTsm2hvIsTQTlMwjdfIcV2GjgKjjeTk5EPE6SaJhzgpkMo3zCQg=
X-Google-Smtp-Source: AGHT+IFDVIUxPyQlsMmOREfjwJfK79+s2Jjp9YiqqcBwTDhSUd0UJcEoHGjet8PxvYuSvvLiohwmc8RcSbWUka4RJ+Q=
X-Received: by 2002:a05:6808:7007:b0:437:dade:463f with SMTP id
 5614622812f47-45015efbd8fmr471971b6e.34.1762461723643; Thu, 06 Nov 2025
 12:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20251106202024.3084674-1-peter.marko@siemens.com>
In-Reply-To: <20251106202024.3084674-1-peter.marko@siemens.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 7 Nov 2025 09:41:52 +1300
X-Gm-Features: AWmQ_bkvhIKmGF2LUxuXnFwd6pXY4wCB_XOS3eRKlViHpsE3pql4fUcMJq5Qykw
Message-ID: <CADySD0Gi+0SdC9q3PMamqrB0H-m81fZo2yT9vm0rX5=L99++gg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] curl: ignore CVE-2025-10966
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 20:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225994

On Fri, Nov 7, 2025 at 9:20=E2=80=AFAM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Per [1] this CVE applies only when wolfssl backed is used.
> 8.17.0 removed WolfSSL support completely.

But the recipe version in use is 7.82, so how is this applicable? Or
am I missing something?

>
> [1] https://curl.se/docs/CVE-2025-10966.html
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-support/curl/curl_7.82.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-supp=
ort/curl/curl_7.82.0.bb
> index 54362e6978..2326392a4f 100644
> --- a/meta/recipes-support/curl/curl_7.82.0.bb
> +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> @@ -79,6 +79,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-42915"
>  CVE_CHECK_IGNORE +=3D "CVE-2024-32928"
>  # ignored: gzip decompression of content-encoded HTTP responses with the=
 `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older
>  CVE_CHECK_IGNORE +=3D "CVE-2025-0725"
> +# not-applicable-config: applicable only with wolfssl
> +CVE_CHECK_IGNORE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'openssl', =
'CVE-2025-10966','',d)}"
>
>  inherit autotools pkgconfig binconfig multilib_header
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225993): https://lists.openembedded.org/g/openembedde=
d-core/message/225993
> Mute This Topic: https://lists.openembedded.org/mt/116159924/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

