Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF15C1049512
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:14:29 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16617.1773220467977036555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NiDNr32z;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-89a1d7cc7f0so62723896d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 02:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773220467; cv=none;
        d=google.com; s=arc-20240605;
        b=TCwjayAIOlk/7Kz2EeKZknIIWrjcf1TL6w15LbXCxGX+Hc4F90UUfa+vaLI7ED6P5j
         R/rFVBFLRK8ZfkBhTp3zfJi4A093dL925sdbdGz0XioglH1swmCORgLpMn7wgHPKklah
         Je0H3NQiHrJZ0mR6KVWqZpaO4hc8kLfn10tCpVZ4K57VEt1GgNbbBsWBAhZqWl2VHzYe
         3pBWJ11z1qDKK1RcfXAm5MuVJ388kHoGp43xWJMDZyOjpfR6iIZ9zyjvwRt6LQPKCQWL
         eN4EpyeGSygrUni4Aq2ZCbML1LqOzE716R7kURsNY5Gul8Rdj8LAxapFmsYzN0yUt6OR
         pmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h5Yi4dgwE6s3PVKgYjWLa3Ne1GvEzulSGgzXzEtWmbM=;
        fh=hIqQ0rvnAIikfwfWfNsnLAUNegISltubT+TIz8SUtag=;
        b=Lee/t5CJxBM/exdy0gxJhz//XbZeYLuPAlbuW6u5UcdanLRDrufLJlKSsnySV71wwI
         MpftpWHbIT/NKM/MrQLTTds3faykG81TB5ix0pgB26M+4eXbuPfO4ooFjczAvMklA5kU
         JsnhLPXPwoNpG6DyVNI+aFIsOCmurLt0LoiS4C3a9lVsbhYFLYCkHbsQMaiLzdCRRLRN
         7Tyta18qk44TPR5lhqKqgR+iz4FmC0FfhtAXiiA7diOtIZ7UnyVY1jNiAhxwJ+VnyXa0
         XNRQqMZfLnz0uDdhicjDypy76j/Fc13V/TzMuN9ogu1i/oD0pG2HVaJf5xRn7FNmv+zI
         Mj2g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773220467; x=1773825267; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h5Yi4dgwE6s3PVKgYjWLa3Ne1GvEzulSGgzXzEtWmbM=;
        b=NiDNr32zR61rMMYSRPGgsATGPzrIZjEHe0ZlR8hT2IkJZbpAjJAHEssxz9N1waIioZ
         f5iXOgzZkaMkbVFcVy4915LEOWzh+o5aWyZnF3HfSrnWEgCwkYf52FsPvYl+HSMJwlb3
         jFNnr1N7B/S5v8/5w1jYhFOgB4vIl7am02bJ85eTGAnaKg7B917ASmOWgLcWPzjtI0ok
         v2f9BQhi354k06NY2HZhuof1NeR+JjDDwedf5288oKxLNhPIN4f4HwNBQnYrvUUpk9gB
         LuGESfDeLpa89zCbhSdEYVq1xYwETXJ0OdhBjA/IVzucQeEt9ey60fEVcyKeSPAdrk9n
         tpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773220467; x=1773825267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5Yi4dgwE6s3PVKgYjWLa3Ne1GvEzulSGgzXzEtWmbM=;
        b=rSCd83YSjHDnH4eSTxM+ftn9wABmk1FeFagVc+FRuDSk9Wo8uYJ8fgAq822ub4nqWV
         h1oLmU3P72hl5rVHoOhflfr5PFSf0gRLEWSWebT5uVDxAma0yn4L70kUidwVT0Kwac1W
         UxW7TAvikqh9fehEH3NguLL41g4DRqZVfAHlIMl/ixHxYKIoTvBE7D2Jy2F6BS1z+2t0
         Dc/0Zv5kM3/dZgvV0fbiFqXLA8vkWAaXc3WpjMGz6onaP9z8jvJFWwFEQKPtsKpxBvw+
         9q+vgfzXjrtMa6KzFIWRUlVEUpZYuDdnGBLU4+sdz+RtmREQkE3AAuARe3Wcudhzw2N4
         pTYg==
X-Forwarded-Encrypted: i=1; AJvYcCU0Qa1vuiMndMa+Hc7eH8zVbrTmNT2w4c3TW/d+Li3kcGVpe47fC47RaChwO3dNbXqaNVUiT1kjyTpC/W1cXwMGCg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyRHYynJV9sDQ+aDsSFBffGZz36CmCJ0Io3eEDr5HMFA5vMdtBr
	CIuYZOP0b9/M08+L3yOaEg6PIDxgbUXh6kS7gtLbpecxPF9PrQmgjP3M2fLtXRTcBKtK8GYO+wy
	PLKtP9oYIdmtQNK+bgr7bQsDJQR7c0wg=
X-Gm-Gg: ATEYQzzSGLhFTEs0TNfqxCqjS6Li0W4Z2kIkP8QINwdTD/Ee5rPkxmjkAgsSJOJXJ5J
	AHmJLWWTu4MQws0goJJt2gz/Q7kLq10yeWmcOhLqMJ1yRoPc65gSKcDZQppiCSZuQYVz7Px2liO
	AppMmaSk15BFomOwpU6Yb/yqDtrqSvfjIznYNIjRkN3G1jgE4OHfB7TSJc+03YFu7mXq6CFchen
	kLi1HUXEnevfXYb1GOonidC5r67jtidjgpKyGL8jUmP8x4MyWYwp2yR7jQzCSbFVkLLYwXBYnmd
	oX/FFXjaN2ZavjNJg8gzn13prkVV4REfe8nnW7NpXA==
X-Received: by 2002:a05:6214:dc6:b0:89a:ec6:1028 with SMTP id
 6a1803df08f44-89a66a1b3b0mr20678146d6.30.1773220466840; Wed, 11 Mar 2026
 02:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260121075430.436353-1-Deepesh.Varatharajan@windriver.com>
 <AS1PR10MB56975E18D333A47C8DA8AC39FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <c6ab8919113f64c3891f0987246ce4d9a537ac00.camel@linuxfoundation.org> <0f19a07e-0499-4520-b0b4-22669fd5a68d@windriver.com>
In-Reply-To: <0f19a07e-0499-4520-b0b4-22669fd5a68d@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Mar 2026 10:14:15 +0100
X-Gm-Features: AaiRm51zOv9VJ63HMuah-78Teq8AdVcaxknOAOPr55U6ppF1aCRQjU0QLnXVP24
Message-ID: <CANNYZj8tiX1SKZDuvGE64JNWvFFjaO9pha1yMhPoTqvfu2xQsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Drop oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
To: deepesh.varatharajan@windriver.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>, 
	"Tatrai, Peter" <peter.tatrai.ext@siemens.com>, peter.marko@siemens.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232849

On Wed, 11 Mar 2026 at 09:42, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
> > There is a bugzilla ticket number in there:
> >
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=15625
> >
> > and that shows that it did happen on the yocto project autobuilder when
> > testing 32 bit PPC. The autobuilder would have been under load and this
> > happened in 2024 with this fix around a year ago.
> >
> > I think Deepesh is right, we should see if upstream would be willing to
> > increase the timeout. Carrying patches like this with no hope of ever
> > removing them is something we have a natural pressure to try and avoid
> > it at all possible.
>
> Hi Richard,
>
> How we should proceed further on this? After our discussion, it stayed
> in master-next
> for a few weeks but has now been removed. Would it be okay if I resend
> the patch
> after rebasing it to the latest sources?
>
> If the mentioned failure shows up again, I can open an upstream ticket and
> follow up with the community. Please let me know what you suggest.

Yes, please rebase/resend. I would suggest also to open the upstream
ticket up front, although upstream might ask for hard evidence that
the problem is real, and we don't have any recent/actual evidence.

Alex

