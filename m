Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71701C7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 12:29:47 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.7174.1686140982564606001
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 05:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BkCYiFK6;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b1bdfe51f8so6723441fa.0
        for <Openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 05:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686140981; x=1688732981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVsWNIHPwu3Y30zEIVRfBKmstksOd09tIPd52a74eyE=;
        b=BkCYiFK6N/VC0v2sLSsRftpN0LCkhhjivC+DXAUI30fEyQVDC2MJECx/+kr1zrpqsy
         jfu/3U3NVNJWffrQZKM12qUazti4ARgWS4Dv6NAMBIqRBkfbPBmFyPaX1FUgs1QMEAwe
         gmOysgIqooPichWT10L5lYtNeFy72G8t4by4+/pZ692OHOV9ZJ8myF+JGWyFwbph6JFM
         yTXT/TPQpiZz2MYQXbApXf73P+FFP0WomsTVF1gaYJY70dqbwVmK55zDVvXuuTiGhgv+
         VZ6T+BcgfJNXnEe1cfhuHeCGAszsbQnjlF/8CNRpitFMdQmlbR8XFhfmJuGaFgbZk6OZ
         JHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686140981; x=1688732981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVsWNIHPwu3Y30zEIVRfBKmstksOd09tIPd52a74eyE=;
        b=jsBbsqZ6KzGrfm/eNsWxly0Vfhjtq2H860Amv9dhNEzMTPDOXoBzRP9TzVDngOJu1w
         SnAw5ihwXncJPd7rTjv31hXDsd1dhBWpjx0/GVGGhhFcTvUCaot+eg428lU1twS8lDS+
         fvJT9sQzqw0AT7Lpj8yLHNo29snxLjkyNcO0pbxj5BMV7p0H9JMYqqzXi4c25dzTcxuU
         e5TVwYSJ2vU84z97H2W7GiiJJiZobAlsunQ7EweRFiXRLCwPAkHAkWDBofwT3wPTbjkK
         Ado2m2+LY5K+yEs9OXHE68Y4QzDpRWSCfrZGHWcD3wO11klUlXk/dmTsewy9GynGNmDL
         3AnQ==
X-Gm-Message-State: AC+VfDwe2tDOOIc4f4+73DyFNY/ceGmC+obhVHvCSjgCg70f5uDivXsS
	rIj5vYqJfkH9n7dUxDWoLN8JfqZYp0aSfourWfI=
X-Google-Smtp-Source: ACHHUZ4JR4tyjzF5vdYyWKEe7XuVa8snE42u2zTEItvhygknN/Fh1ODqKjkzKs1SP3E14TLq/xhMAV36S2fG2gVXttA=
X-Received: by 2002:a05:651c:1722:b0:2a8:b792:d7cd with SMTP id
 be34-20020a05651c172200b002a8b792d7cdmr4378953ljb.4.1686140980429; Wed, 07
 Jun 2023 05:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230607083015.20760-1-alexis.lothore@bootlin.com>
 <20230607083015.20760-3-alexis.lothore@bootlin.com> <b8e4b45e013ed8fdfb2c6075336b388bb9904b7c.camel@linuxfoundation.org>
 <CANNYZj_84WzoPgCLGE2wpKqmn=H5+3WxZV3u3vaH9_iYGCP-Ww@mail.gmail.com> <f731aef7-c59b-c283-0ce2-369341b2594c@bootlin.com>
In-Reply-To: <f731aef7-c59b-c283-0ce2-369341b2594c@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Jun 2023 14:29:29 +0200
Message-ID: <CANNYZj-sP9YMkaT1etGb5v-svWFgbxDCTFzKnNGvwV9+pP2zSw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2 2/2] testimage: implement test artifacts
 retriever for failing tests
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 12:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182473

On Wed, 7 Jun 2023 at 14:23, Alexis Lothor=C3=A9 <alexis.lothore@bootlin.co=
m> wrote:
> > Then core-image-ptest.bb should append "${libdir}/{MCNAME}/ptest" to
> > that. As that same image recipe installs only a single ptest via
> > IMAGE_INSTALL:append, and the artifacts are retrieved only if that
> > ptest would fail, this would achieve the same outcome. Other images
> > (which can potentially include many ptests) can then set what
> > artifacts to retrieve themselves as they please.
>
> I am not familiar with multiconfig, so I'll have to document myself befor=
e
> trying what you suggest, especially to make sure it will not make the ret=
riever
> too dependant on a proper multiconfig definition.

core-image-ptest.bb is already set for this, so it just adds another
usage of MCNAME variable into it to get the name of the ptest from the
mcextend variant and substitute that into the path that gets added to
TESTIMAGE_FAILED_QA_ARTIFACTS. The retriever won't know anything about
it as it happens at the recipe parsing step.

Alex

