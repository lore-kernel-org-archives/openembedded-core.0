Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105C0E92FE4
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 05:32:06 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.6540.1696570324437131322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 22:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KKMa5hUS;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1e141f543b2so1488700fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 22:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696570323; x=1697175123; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2HYSIXbdC4Py62JyQ80G4MmfxjnAKJ5SQHRQnSS3lc=;
        b=KKMa5hUS+1mtPqFXjIjImgKUoy1d7c8SsqkgaEI4+huqgaPcVkIWyveVnO82/p6F23
         1o+4uMqY1CMcqFys0Z0I6nwq0ubf80kCD5SGUd07/hYkMZe+37jOzWbwu3cc1vgZzAj8
         RwzNrlvETmKmo872RtSRL5aeddEXaomSKQ3kFuA38t6gGgs8FUV8zPhOxDI6cpWn+zSF
         dFU+T0S5TTaNZqiPDU/Nl3KMYxaWFi/WLu57ojc0UjDuIBFKb9HtvWvxO7a8EZ5lgLTN
         C5GbW5lRnkRjy4Q5D7S7K5YqKSM+UL1uU5jzyYQLFRf7B3bcSGIjA6EAaf04UsRr1u8j
         x54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696570323; x=1697175123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2HYSIXbdC4Py62JyQ80G4MmfxjnAKJ5SQHRQnSS3lc=;
        b=IpT5IyKY+dTcnTvc8V0w5AWfhklwIij57xhYI1F5mHKEmOajxVH2EHYhOcpKe/oIe7
         6ffmX2cv9R+yIfogjeO34egHPrH+7HuimsYQd/8t9dFV3OZEeLYIjJlHth1X/DG4jpzE
         ubE2HD277hi1WybekZ2zMnoE0jPFF1M3fV3Rrdt7UdyzVjG9TnOWhxoChBsOwXF5gmrQ
         KqXLRdH6ErXQIihmW7wU/nFceeoPki6KrNhViKRFLXdPhfymUVpQwhcUNr6RmBjE8Yl1
         uGhaAKgSCaTJVGKt7ivE8Ax8YyGxenMd92SEaxglslLMElwjmBQKWidQRAcODSrNwKrD
         RO9g==
X-Gm-Message-State: AOJu0YzkfCjnNoCHD2Ws9aQtEhuBZRcXJAHB18WyW6wN6ymw5LY6HqX1
	DFAAFQJXGwPGptpFDXhlyxqHvsxU4hC4DaqdAHQ=
X-Google-Smtp-Source: AGHT+IGhDnbJnjyK2EVD3xWTIxPeCrEg+oROm5aoS7TehsgXpBgeSoTdoavyRyW8I9yZHTml+60g8eCgiYYFmDEbfls=
X-Received: by 2002:a05:6870:1601:b0:1d5:cdf7:bdbc with SMTP id
 b1-20020a056870160100b001d5cdf7bdbcmr2684549oae.2.1696570323486; Thu, 05 Oct
 2023 22:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <wbIO.1696569288812482209.BHV9@lists.openembedded.org>
In-Reply-To: <wbIO.1696569288812482209.BHV9@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Oct 2023 22:31:37 -0700
Message-ID: <CAMKF1soL6jnHtuvZHMDGNuJyeNMRmuPzAwkG68V+ocvMDH3_rw@mail.gmail.com>
Subject: Re: [OE-core] Need suggestions: in case where linux-libc-headers and
 the kernel versions differ
To: woojoong.kim@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 05:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188744

On Thu, Oct 5, 2023 at 10:14=E2=80=AFPM <woojoong.kim@lge.com> wrote:
>
> Hi All,
>
> I am using different versions of the kernel and linux-libc-headers in the=
 project.
> Some modules are built using linux-libc-headers.
>
> I'm wondering which version to use as the basis when searching for vulner=
ability listings on nvd.nist.gov.
>
> To my knowledge, linux-libc-headers only contain headers and do not inclu=
de the kernel itself or source code. Additionally, the project may have onl=
y one kernel version.
>
> For example, the kernel is version 5.4, and linux-libc-headers is version=
 5.16.
> In this case, should I primarily check for vulnerabilities based on the k=
ernel version, which is 5.4? or 5.16 also need to be checked?

linux-libc-headers provide UAPIs mostly, so for CVE POV it may not be
interesting, although there might be case where CVEs could
involve APIs but maybe rare. 5.4 is your kernel proper which is the
candidate for CVEs

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188743): https://lists.openembedded.org/g/openembedde=
d-core/message/188743
> Mute This Topic: https://lists.openembedded.org/mt/101792123/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

