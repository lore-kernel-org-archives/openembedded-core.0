Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCC8C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 07:43:48 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.28820.1744271023999914229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 00:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=amrjryUc;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8ec399427so3759356d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 00:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744271023; x=1744875823; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1OTjTX1e64hv3MNn9e3wGz6rG4wF4PyM1NpYjc6mh8=;
        b=amrjryUcoFjjtENQ1rsZVGp7CGe+iu/Hdx2ZzC8ih7tp8P1fxkhZcd6GqUT6dR64Oo
         L6D2SsqfbAw1vYwAkWj9YmFzGC5n83QSth+zayWGciziBtT+Wibf5ZtY1vIIzNRt1U3c
         qr/mCJtlupVo6sucI6yY11fsSXug6o1O4YhVN/kblUuVLJ0k2FsIV9PHKcC+VF1CUNDj
         wvd0kYTv2+NjgrWTYLqYs2xLeASblIqwCXWol+4HmItRxpy0yK9UmgOyy/p3nmvrn2eI
         OIXvYblM36ANu502mrJq89tOWuYpuFNtRMv5LZRGH4HsXwrSAMvdy1GQfOgJ1oCd0wyv
         t5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744271023; x=1744875823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1OTjTX1e64hv3MNn9e3wGz6rG4wF4PyM1NpYjc6mh8=;
        b=BJcThjdU6DGpNmpi/d3ReSd6ntL1Sw5PtHAXvRY69GP8c3QxBn3Kjvg8JnzWI8LcE1
         OusW4zZi+Kk26+uY0uHJ/PNalNcVHauZXYt9C+pGBPe6aYaV6Da4WzEprjR9wJ33LBAW
         77kI3tMHt0bfvjUikVCR0lAUwY+XhevHllm6M2FGfu/NL9uvAppEqNu0eGnSZ0lf7dAL
         jLVUAY3YKB2kUuknQs5KJal6zAgYOCCfOBIDce1bfjSpapmHYMccJ8C897fkVBX77glL
         0St7t4MYknVlMHeq890OzhWb52qzDzIgm5DpVNt+swc7TCxYm8Tb2AorX8SwxNvNC4Gl
         9iUA==
X-Gm-Message-State: AOJu0Yxe8SBJxttNV+dzvCtmNjkqVfcrGK/OX4q0JT31xt3P/RXObbC3
	LTMQ0LzB4cT8AH8dthx4gmqISdz/B0VSV//1IhqWYDKNyRip4vlod+4ANRd6/D/Dsda8Sk9FMLc
	OlPiVdL/sRXilb/NvG8XfXltk/VA=
X-Gm-Gg: ASbGncsUB7vv9q66yMe7rFfQ9+PMD15gKw17SDKPpZGuNH8u3YF736dqHBgzFq/7PVi
	iMy+HqkyaJyTF8dF6c8tV1mv45//AGWFUZ14iUOniHNdbSHZI2r6EDz/izGFsawe/T2yHSOrf8l
	mNnZJFhjKk+/SxWkFRGa3dYEOLPFhiwxR2CDlep+jJQ7hx2kaJy42huQOh
X-Google-Smtp-Source: AGHT+IHVMAm66GfZ6HymyaHQtyfVpI8UNWi+dhpGONbyYkkyz7sAho1zR1D1xClk8zBSCXGgpsrLg1pdVsqddnzhlH8=
X-Received: by 2002:a05:6214:20ee:b0:6d8:8fdd:9791 with SMTP id
 6a1803df08f44-6f0e5aa9769mr23072246d6.25.1744271023039; Thu, 10 Apr 2025
 00:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250408100945.111801-1-jaeyoon.jung@lge.com> <CANNYZj-0eA7Qwei1HRD-oVzZ7qU2BgNj4jqhAyzBryaCWMjqdw@mail.gmail.com>
 <PU4P216MB1517AF25C34C8D73421370D89AB52@PU4P216MB1517.KORP216.PROD.OUTLOOK.COM>
 <CANNYZj_qmg0pksx+cuV_i7q_3eq8o4SWqDm-PQCmOirna=ow7A@mail.gmail.com>
 <PU4P216MB1517C42828F4460A79B72B1D9AB52@PU4P216MB1517.KORP216.PROD.OUTLOOK.COM>
 <CANNYZj9X_xYwd4rtwRRKwaTEPn+2k3xD=_v639Tdf8Wmgcsk+Q@mail.gmail.com> <PU4P216MB151767AD4871A6C4C7C3B4C09AB42@PU4P216MB1517.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <PU4P216MB151767AD4871A6C4C7C3B4C09AB42@PU4P216MB1517.KORP216.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 09:43:32 +0200
X-Gm-Features: ATxdqUGgYDsACrcmFVhHHaJhF4lRYlays96iOn1lJZwA7qEokQ8d9W_E52h3WdQ
Message-ID: <CANNYZj8xkNqbBwy-8vwzFC=Uh1FAraYugCy2UuukX0VKH4QdWA@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 07:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214627

On Wed, 9 Apr 2025 at 15:24, =EC=A0=95=EC=9E=AC=EC=9C=A4/Task Leader/SW
Platform(=EC=97=B0)=EC=84=A0=ED=96=89Platform=EA=B0=9C=EB=B0=9C=EC=8B=A4 =
=EC=8B=9C=EC=8A=A4=ED=85=9CSW Task <jaeyoon.jung@lge.com> wrote:
> Yes, that's possible too. But I have to make a command line change on my =
Jenkins which is still a less preferred option than environment variables. =
One more issue is that it is not applicable if you have https:// and http:/=
/ servers mixed where the latter requires additional --no-ssl flag. I think=
 environment variables are useful when dealing with such variations.

The --no-ssl issue seems like a different issue that should be split
into a separate commit and reviewed on its own? Can you please do
that?

Otherwise, yes, you have to change the invocation of the tool to
include the option, and set the value from unix environment, if you
must. We can't start adding environment variables for anything and
everything that is configurable. You want --server, someone else will
then want --email, or --name, or something in some other tool they
use.

Alex

