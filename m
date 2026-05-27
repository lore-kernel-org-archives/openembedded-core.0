Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C084DCD5BC9
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 10:13:24 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17277.1779876803586351219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 03:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rE2EFRdO;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8b5de17382cso88878746d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 03:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779876802; cv=none;
        d=google.com; s=arc-20240605;
        b=ZNLsABXlUVWRUc7Hre0k4DPTs1+Ow4eY19Mva6hOWFYVS+DYuF3WkQPFXrdSNhbXQX
         2rGJDtRzNTTEQ5m/T/WtBkzxn5qBZO9mHuo2k8rYELDws+gkIujyG8/ELiVTwCKr1Ypi
         ARXrnsQEWv4PzShc7NUoy632mPWn08smcd1aTM0vhWRwyYU9nMa+RYmv7bhaje+Vdfb3
         QJ4k7h3niRekFrEOPUBgl5VtxMZpJIQ6rz4s7KsWuCVolJ+FY5MMvRc/wmEbNgWQ9TW4
         UT3Ll83iuKNvQ8zsbFlBnG4EFvAKrqnfd66HG/AD0QDyeEEvB17okdp2FrxlpU1JngWM
         laIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=72IX4FEsy31GdnoGa09F99AX/zMD+Nhlu67DZ41noTs=;
        fh=MtFXnbtSY8cYZkrXRgxdOGzOIF+Ezgbo2KzA7GBSL4o=;
        b=P4e6u5RuJsz0hNk2HE5ICQ4F+fjnI3mV8EC65hRIPM78SC6w1WD1iEcipRbCTePcaW
         3luiuKX6kLHZoUQUxV9/Sj4bWZI/N6gbmXaw+D3cuJGjuK7WU6T8U+C+W7n4eRGlCGSA
         ApnYnbs7Crsp0GIysHOaC27g9AIDwPpuOW7oV4P/EHrXzIEb9hkG2xYRnxpIo38W60YC
         WLVFgbD/K2tyMRhX9hJI2StElekEoz3AJDiMd6ASK06ysoNEOvgWjGoers+6I5hw2IGL
         q4k1kq2SCf+4v1/nFRq7XNs4Cfco1lirrx/Mq6amQnJ9yhSYQZ5BzoIUYR10zixRKWDh
         TUIQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779876802; x=1780481602; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72IX4FEsy31GdnoGa09F99AX/zMD+Nhlu67DZ41noTs=;
        b=rE2EFRdOevuq5cufnZdcb90J+LF2eVskeBathFHGAZhPqeVTJOL9tHymo0WW5mtXP6
         HlAgJnWsVL5n7hRm4uzgSeiQH+Xtt04RShx3O8kLTUhSPozit1iz5IOZ7lVUtTcmCB4y
         9KX0qxvA/NSpFRFhPSoelJDLJLpjZrbMphvGCSlTBjRtC0aVy+k54oS6fJm9MFZe7KOe
         0ASJ95NpOeLEUhpCKf7wnOPkUc1xjCjy1FaHp4VPbLlaq7InqZWMJ7+5ujxpyzlOsFwh
         T8XGfiQZvdZazDbeQfSI4V3An4x2B1CUxSah5OUUrKO2pH5e9I4l4Z6YRkkumA3HOq6e
         4A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876802; x=1780481602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=72IX4FEsy31GdnoGa09F99AX/zMD+Nhlu67DZ41noTs=;
        b=LINk20zFFs1unoZChP5S8ReAs2bSCh2Pf44B8bnwIVrXrL+tP7bGOapIIbgGtSQEqT
         KXdNCSwpAhsMFZmkVVLgKrN+iSiqGAs66eAYm3E+HpQtLy+yJQ8js7swzBJRe3yUcNRS
         6sNXBhHpERW5QW0cLYYTRY/5MtcsIOQqMnFf8nO8KXCLJnHi5G7jBLT6kd/x3ey5U8ss
         6SIV0gs88x3epqKPHrDCsRkAvPJ5sF/h3rqOx1HBnKOBuVAknhT75juZ8KE2jaoVAVr1
         dFqWvLArH3+9/hakn2ZbAO0FYD5eofRWBsmiifBrxAQ8Qz2HX0h5Hre3GqLmYNROxhAJ
         vRXQ==
X-Gm-Message-State: AOJu0YxHE0xfoBDRDuI78Ussc2jng1XQydeHMKHzF1NL/Viekm5aCKld
	xkzgXvLWc1x69mQ/+I74/zL45Pbxdw6ykyC/XTJZyIZwKtbh/YEJxv01LmduXiq4xi0xv7F/eP9
	zJVcFQZAANBGFY1kpX5sESToy6bqI0F4=
X-Gm-Gg: Acq92OEofDyjyunerAqAFOsDq8iJbVttY/BhXtsjRsjoYMhXdmqeLsHyQNuLoQqwF5j
	/axRxN0ei7sRp6SwTBzEUFV+TShnQCg/iyOD3p7mGJhdKCS+gnIhHqqTymQeYpT6biVr22v5ja8
	j367BelYp7SUBB1hLeJk7bNpKp4+VuvZF9xxGMbJSnWnMeaQCC8InSL31CEWjFOILZAgBjDxrRg
	7rjvKXR/DhvCPj2Plj6mBl+jGBSjXJV6e9UUnE/Zn5IjTsS2XJiV3lXYvvzimGvIBVKUZNm0ir9
	ebN5ODqT4jOdpGO95qPvpKXVc/p8zd+n5QFoulQr5UI7+EgQsX3N
X-Received: by 2002:a05:6214:4009:b0:8c6:27f7:30e1 with SMTP id
 6a1803df08f44-8cc7b568423mr359991026d6.15.1779876802434; Wed, 27 May 2026
 03:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260526112501.15985-1-adityags2004@gmail.com>
 <CANNYZj-CRdJjU1z-0m8bqfWtS=X_PVzyg8uKS4mcRXMua+ikVQ@mail.gmail.com> <CAHaUZZAZGRx0H4z5sr8ndJVqjdUk4N9kaSRKp=6-DyX73e0VkQ@mail.gmail.com>
In-Reply-To: <CAHaUZZAZGRx0H4z5sr8ndJVqjdUk4N9kaSRKp=6-DyX73e0VkQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 May 2026 12:13:10 +0200
X-Gm-Features: AVHnY4L9kFydoBHP98QwfCI1GqQSpUOqo1oCRpKHR4XA416QUK2kddHJW-HxF0s
Message-ID: <CANNYZj_T4TDeN0LgrxqO4GZvebhhZx9smKrwN+MFG845z5dMUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] randtest: retry on unstable sigma instead of
 tolerating statistical outliers
To: "Aditya G.S" <adityags2004@gmail.com>
Cc: openembedded-core@lists.openembedded.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 10:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237639

On Wed, 27 May 2026 at 07:48, Aditya G.S <adityags2004@gmail.com> wrote:
> Thanks for your feedback.
>
> Originally, this patch was created on the Yocto side to handle intermitte=
nt failures in randtest.sh by skipping the test. However, when I submitted =
it via Bugzilla, I was advised to also engage with the gawk upstream mainta=
iners since the root cause lies within the gawk test itself.
>
> Based on upstream feedback, instead of masking the issue in Yocto (by ski=
pping the test), I reworked the approach and created a patch for gawk's ran=
dtest.sh to address the underlying problem (unstable sigma leading to false=
 failures). The idea is that if this fix is accepted upstream, it would res=
olve the issue globally, including for Yocto, without needing a workaround.
>
> Following that, Bugzilla suggested sharing the updated gawk-side solution=
 here as well for visibility and review.
>
> If the upstream fix is not accepted or takes time to land, I can provide =
the original Yocto-specific patch (which skips the test) as a fallback solu=
tion.
>
> Please let me know how you would prefer to proceed.

I'd like to see the upstream submission and upstream reaction (if any)
first, can you please provide a link to that?

Alex

