Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0A0C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 09:01:12 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.3938.1744189266954498105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 02:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=El61bJOj;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f7019422so58303276d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 02:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744189266; x=1744794066; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYdoFuWXt+1VhX3r9yOkQ7fjYbbmOKK9fft4ae7we+Q=;
        b=El61bJOjOijyqoKyswfpF3jPv/0ZJ+kzWemf9sUDHaFb1ZCqR60er7/voDtCQ2XNlQ
         tLWGcwi/LYPezIJfZUTyIzY4/5QSP9i9hG+NrG9UD/a2dn/VPk9InrQ6HZq59P2NOYqy
         zlFTO5l4/Vang9FbBxgvW6himal25tRPhPRvJmalXR9W3fI+TyVKl1jn/abin6ZhUnvI
         7tKOsezpKHf4rLspQLrtNYP1qcWhorqPBd58oN+kJrjVUVT9UA7/KyZBIBBFc0p9Oevr
         f8CvE6vFlkONGTieLoEWmra0Aos9oZ90SYYO1RSlIGPdHOJPNTHDrQDQsGSvFqflC18y
         sXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744189266; x=1744794066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYdoFuWXt+1VhX3r9yOkQ7fjYbbmOKK9fft4ae7we+Q=;
        b=uSnCWs7DJN0HAlDLNxSzsE76a1x0zDLysEQe9QnIlre1BiMXO/TsavrFZ1ElBSmfeF
         gCvmvIs0Nt0EvRdsh+faT17m+MYsBX+tFcBRqGbXtAINYtf7AD1MvkSoiUxd4Kd0jJY2
         y9lCEYSSEXsmX2nt/HM8oHFOV/nDMBQw/h0BRigkfeA9jmvRXL7kjPVvfQ/Qo6mIXMld
         KhxPWn4WIegg5v59eaTK9uV5Qzi92z59hlJMxQ5wBZyAb6iR7LBq7TPyP+zq1T2IYnGE
         NNstcbF8/8stsSx7Nacdp6kfOHti95cZmPw/DEakwpI5Ly3phDLbVGMTQPaJ/TMdmEY6
         +qGA==
X-Gm-Message-State: AOJu0Yxs2/uyXmagJKYQXMgA9j3Q9Ta8eY7A65mkeFTK7OT+uor8lICF
	9uzjnnTn4d0CHQreYGbEiX3F4VMkNNW6xBfmJuwakQVHNr+Z/Tuf3rkcds9YP62MZoWNEk0YyPd
	Yk7Ch8NVyIMatNCRxQgk6FmBPa8Y=
X-Gm-Gg: ASbGncs4rojBJGDXzfib0RRSwtMbbC6oQs6tXBCsxCY/m6RfyGoBijFqrFPaLce4Ove
	ZW7gxjEZgDLxrjNgxHDN2I83PeZcYdxd7riGIoVGYAJwrsg5vTMQ2PUqTubXBS3M/l2Ms/UZ3MT
	9DpUhQRoaZ4AAJGBBoL2I0EJRuXR9lo8TwIyPK3u8UDJpaoFEVVcrTrWfM
X-Google-Smtp-Source: AGHT+IHWLI3H3goSam1mj6WoJ0/G3q5OcrclLicW+U6j6PKsvP3SDCpCNFtvSbKWvK+Lec/CPbj7kwpOm0+9dgRKotA=
X-Received: by 2002:a05:6214:20a1:b0:6d4:19a0:202 with SMTP id
 6a1803df08f44-6f0dd10e0d5mr21608396d6.33.1744189265940; Wed, 09 Apr 2025
 02:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250408100945.111801-1-jaeyoon.jung@lge.com> <CANNYZj-0eA7Qwei1HRD-oVzZ7qU2BgNj4jqhAyzBryaCWMjqdw@mail.gmail.com>
 <PU4P216MB1517AF25C34C8D73421370D89AB52@PU4P216MB1517.KORP216.PROD.OUTLOOK.COM>
 <CANNYZj_qmg0pksx+cuV_i7q_3eq8o4SWqDm-PQCmOirna=ow7A@mail.gmail.com> <PU4P216MB1517C42828F4460A79B72B1D9AB52@PU4P216MB1517.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <PU4P216MB1517C42828F4460A79B72B1D9AB52@PU4P216MB1517.KORP216.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Apr 2025 11:00:53 +0200
X-Gm-Features: ATxdqUHB5DhaKbNLtwoRIqasncaAJImJTY-At_d7swF2vkf7UErGdkXeMp3WxtY
Message-ID: <CANNYZj9X_xYwd4rtwRRKwaTEPn+2k3xD=_v639Tdf8Wmgcsk+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] send-error-report: Allow to set server using an
 environment variable
To: =?UTF-8?B?7KCV7J6s7JykL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKOyXsCnshKDtlolQbGF0Zm9ybeqwnA==?=
	=?UTF-8?B?67Cc7IukIOyLnOyKpO2FnFNXIFRhc2s=?= <jaeyoon.jung@lge.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 09:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214579

On Wed, 9 Apr 2025 at 00:27, =EC=A0=95=EC=9E=AC=EC=9C=A4/Task Leader/SW
Platform(=EC=97=B0)=EC=84=A0=ED=96=89Platform=EA=B0=9C=EB=B0=9C=EC=8B=A4 =
=EC=8B=9C=EC=8A=A4=ED=85=9CSW Task <jaeyoon.jung@lge.com> wrote:
> Okay. Let me give you an example from our particular use case.
> Suppose you set up a Jenkins CI with an automated error report when a bui=
ld job gets failed, and you've also configured a script for that using send=
-error-report in Jenkins which is used in common for all multiple Jenkins n=
odes. There might be a case where you want to gather error reports in diffe=
rent servers for a particular maintenance purpose.
> If the command line option is the only way to alter server URLs, then you=
 will have to configure and maintain different script command lines for nod=
es affected. Environment variables can be useful this case, and I think it =
is more flexible than having diverged script command lines.

But you don't have to hardcode the server value directly in the script
that calls send-error-report. You can obtain it from the same
environment variable, e.g. if the script is written in shell:

send-error-report -s $ERROR_REPORT_SERVER

Alex

