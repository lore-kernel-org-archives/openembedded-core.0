Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A397DC369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 14:09:00 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.76495.1744121338360433510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 07:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RQlN/nQ6;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so66050416d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744121337; x=1744726137; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SCNBn1Bitsu3iEgWMGyqXcZ5ndjM1CtMn2V9KhhYrU=;
        b=RQlN/nQ6ymBFSMOIGPHGrPSjU8HYMsfwljds8T/LRx2Di5Y0ng0Run1CdLUtv7mf/2
         TmnTuFZ5KW76crCFWlFL6sGEscm7gdJBWLIolv3toR7i3JFeApu4YJWucjrZuchAZFEI
         ieLqdxsIg5qs6mpSrHL4zlibA1xT1hmMU2kY3bZ6DNAAkR932+mfOrpQCvLmIeF1lkbx
         TyjmKTG7GfTUplqnM6BF/8/ZqfIXlERaskNqXEZC7VIDSumLMvI7eZtsvJtjOH3t7MHn
         CkmATLDc7svaHgWrtk698/fIf+wcJMdDNsrhVaiberzZTl/ritJqdNJGbHdQrr0foX2c
         dx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744121337; x=1744726137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SCNBn1Bitsu3iEgWMGyqXcZ5ndjM1CtMn2V9KhhYrU=;
        b=n6XnN17nZ+0SI4WAsAISeleQVsz8GQk0CkwovnQW7brTfLcqxExRFhWYyMb68AYKmC
         tK9+GYjIriRFwgIYuYfvSvZ1uDh3v74mcwnn4+G7ny1z+6TpIWyxIDHTJG68Gt4BG7SF
         cUP7VK82TAFO9ux6Ant5wJ0w233Md78VX6z+orIxSUYAyVp2/IpD+Ze8MJGsShgsrCdP
         zq5XidAn7cHBe1mh37WO0KVXyunZ4Y1mYYdK8DgoFAzR9slWoMTfkTYBQBDsYNAVavj3
         CWmNm+LkAdmRFn44TatAMjY5MZIoFG2CkxemVuohoe7AYqgkAabGcHtAFJMrScWsbu1E
         B0wA==
X-Gm-Message-State: AOJu0Yyovya/k8FzYarQB9vvCGL0kmtpN2cKFejS+I46jsjwTrP7vOvH
	jkHstjyF/hqqbj6pEyVEpfnMQ2Jh7OwhFR5K7RL1QcKPw3DW/WZEmvtk1zOJ5rw8nLlO6giHfa3
	ngsviYM97xt0ci0T4tpne5YGEO/zFAQ==
X-Gm-Gg: ASbGncumoeGrePuTIekO8Lvo+sWoUEvYdpi7vDhcz+frwabjoVRrQZEp8R6YtUqi3BC
	bgyv9Azn5yxSISwPlDaluV6nzw5kLmEGBInfuz3AMJKBEMSMTvFipEvRFVNCXH+uSqeMdz8Lkvu
	jE8wFn3ng9dgrgUnocC4yKJefhmErCZVHpgzZO9iL5XyQLJa31d7nUsTSZIyAN
X-Google-Smtp-Source: AGHT+IF3e+zNF16ekx+0afmUrAAVCCuCVq4z7ZswTr5LGidhmylqtgL/3AGHieOExYi2Pyoqh/skBZtmrK26CLVoYQk=
X-Received: by 2002:ad4:5cc7:0:b0:6e8:f3af:ed56 with SMTP id
 6a1803df08f44-6f00deed748mr279505866d6.13.1744121337337; Tue, 08 Apr 2025
 07:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250408100945.111801-1-jaeyoon.jung@lge.com> <CANNYZj-0eA7Qwei1HRD-oVzZ7qU2BgNj4jqhAyzBryaCWMjqdw@mail.gmail.com>
 <PU4P216MB1517AF25C34C8D73421370D89AB52@PU4P216MB1517.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <PU4P216MB1517AF25C34C8D73421370D89AB52@PU4P216MB1517.KORP216.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Apr 2025 16:08:44 +0200
X-Gm-Features: ATxdqUEMLrNZfXY2CP-Znr4ukoSeie0e4_hDuwx3vSlEhcdc5FtQ7a0RupR32AA
Message-ID: <CANNYZj_qmg0pksx+cuV_i7q_3eq8o4SWqDm-PQCmOirna=ow7A@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 14:09:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214540

On Tue, 8 Apr 2025 at 13:24, =EC=A0=95=EC=9E=AC=EC=9C=A4/Task Leader/SW
Platform(=EC=97=B0)=EC=84=A0=ED=96=89Platform=EA=B0=9C=EB=B0=9C=EC=8B=A4 =
=EC=8B=9C=EC=8A=A4=ED=85=9CSW Task <jaeyoon.jung@lge.com> wrote:
> I agree that command line options are more explicit. I didn't mean that t=
hey aren't suitable.
> But there's a case where adding a command line option isn't easy to the e=
xisting infra code and using an environment variable is considered as an al=
ternative.

Hello,

I'd like to understand this a bit better. What in particular makes
adding a command line option complicated, compared to adding an
environment variable setting?

Alex

