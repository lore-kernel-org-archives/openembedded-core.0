Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9242DC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:43:57 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web10.1601.1639590209707624462
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 09:43:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pnE5yiEo;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id 30so42354162uag.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 09:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vVgWq8EWA0vP5AwQOjChsBRMXZ4v2Bt8+bJSc9JIjg0=;
        b=pnE5yiEo+hmtF3feYX2idesZ6n03itsJJy5jODyi1Bn7aZ1sEbww9pcu5SwqGXHro9
         219pBtPHC0dw8vh9H2Y0pPXn/qrSDAEjEXblrVYBkmm9LAvEDx6o/mbevjKF5vd/T/+n
         gowFfimcWOURp2raAsqTZnPSGFk4Qs1SXYxMfpvpkJUhnupH5CcZF8NNMeHUfBz83wnH
         0IVI4j+aObQJ6rKUbcrgIIgPdpA4oUb+u92tcx3ZBoM6306DZADtyQj7/ZngvZsQPDSG
         SO26iMHMKnGD19upErxqhGuCWFJedi+QMp7K6sW6Z2JAR6mKzfX/o9RvF/L2uzwMCxcq
         UR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vVgWq8EWA0vP5AwQOjChsBRMXZ4v2Bt8+bJSc9JIjg0=;
        b=Vd4LVqHnZoLbQBd35dkeV60ZxJm+6XOjlgn221j0EKjKOyzJfdMsy8CiGZm65A2UYX
         ePV2boK4KoEyqvvv+rqdkLrtcJd3fvkPv20rJP3GDdLppbP5b6PmMqeckBpI7zNwfbha
         RTbU2mJglbfPrsKLchMH5j5TpsuuZ9JnrhEcL5rGmNAMvQF5YCUIqjVy84RuVca5GWVy
         gpVWPl7IQxFo2o9i9RHdTKfmhpUuQOVZXplMvLEuqb/1ver4ky8DVk2v7wG6rnlWDQNY
         Cy0m/T0kNYF9Jgkrz9gJmfI4Bc5E8EAWTtchXWNl4Z/NgriJK0SDcKi0YRxtwwGxzIdQ
         PU1Q==
X-Gm-Message-State: AOAM532SY2p0GkxtsOrZLnk91UDvGmAPn3igD4JiWdjsdgJUF2wohcIA
	z76Oa+eDr/g3l8VA52WtYikAWin3OEGSybApLlFhnUq+tWo=
X-Google-Smtp-Source: 
 ABdhPJzis2CEnH4yoGUlS31n5oZ+WH7vdB8x0U3NAunPHWTaMiAkAhZ63MEyfMBumnvG0+ABAJk+rMlC1e+7zuQvP4I=
X-Received: by 2002:a67:efd5:: with SMTP id s21mr3678390vsp.73.1639590208832;
 Wed, 15 Dec 2021 09:43:28 -0800 (PST)
MIME-Version: 1.0
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-3-alex@linutronix.de>
 <CAGgRHJpbpit-O5dRs_ytafLgk8cOb4qReACeGDaB2sk=jB+qWQ@mail.gmail.com>
 <CANNYZj_eCMyQYHhx7uhZ34NTGekeWAwcGSPCvE1P-tO5wLhp8g@mail.gmail.com>
 <12b73e8c-d4b7-d8cc-0c1f-425c045a95bf@gmail.com>
In-Reply-To: <12b73e8c-d4b7-d8cc-0c1f-425c045a95bf@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Dec 2021 18:43:17 +0100
Message-ID: 
 <CANNYZj84Y8azO2aGLUu8q8_AqcSX=iaP8MUfJGuGS-wB6+7fyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/26] meson: configure and use generic
 exe_wrapper
To: Khem Raj <raj.khem@gmail.com>
Cc: Matt Madison <matt@madison.systems>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000f9889605d332d766"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:43:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159736

--000000000000f9889605d332d766
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Dec 2021 at 18:40, Khem Raj <raj.khem@gmail.com> wrote:

>
> Lets try dropping -r option, I think it should work. Good test would be
> building qemuarm64 on a build host running < 3.8 kernel and see if all
> builds ok. or qemuriscv64 on hosts with kernel < 4.15
>

I don't think such hosts are tested or supported, and they're going to
break in various other ways anyway.

Alex

--000000000000f9889605d332d766
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 15 Dec 2021 at 18:40, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
Lets try dropping -r option, I think it should work. Good test would be<br>
building qemuarm64 on a build host running &lt; 3.8 kernel and see if all <=
br>
builds ok. or qemuriscv64 on hosts with kernel &lt; 4.15<br></blockquote><d=
iv><br></div>I don&#39;t think such hosts are tested or supported, and they=
&#39;re going to break in various other ways anyway.</div><div class=3D"gma=
il_quote"><br></div><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000f9889605d332d766--

