Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795CDC7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 12:32:07 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.7166.1686141124698215875
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 05:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=SnHzmiVN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-30af86a96b4so5778453f8f.3
        for <Openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686141123; x=1688733123;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xHJKCeJbnP9SJPNeYaMVLDAF5HhxrrfX0nHi7ffc/gI=;
        b=SnHzmiVNeoY9roPdVM8AhEAgFrh9uE6qnzMKDI0mVjRcFemJ/XTWrUZkfv92hpuyFk
         TsL3Vr7YaIuXaYhahHDiutfT7ywimxPoRliShtJrJMkxKxOJ6OkeNkYuS/fWvw4BenpN
         SgfC94Dm5FdxRwSBZ+6d3plYf3G3f2zB8x+uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686141123; x=1688733123;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHJKCeJbnP9SJPNeYaMVLDAF5HhxrrfX0nHi7ffc/gI=;
        b=fXtURfi9NsZbEixgWizkZVPWmZvPhlEp9ENtrbdgdNnmgZ+5TPTCcoZpuohqVMU56k
         w5DAPm2pWYyYf/qDPuhMv1zKTSBy8ZoX/ju8+jtNEb1fKx3ztbvD4aeSjeKb12N+1iNY
         kwN317kReUd7LQsQUzOoCsZiheNggb+Zw/Gud+afE4syConEsWr735s/SNfURyLjPcnX
         Y2KWjjw3ON1hk2nskpwWN91rXn1XNw0WnN3h9K+Qw61IsNMqRN0+QvvDLUfY6Fx9AV/Q
         C7OB9RM5BJc/MF7STf9QnUEp3hVvsmpVMeuqggWSXLUC1GkygSBQ6oVPhcKXh/xNrKch
         UkBQ==
X-Gm-Message-State: AC+VfDyG5d4eeEdkaV7suU17foTqamm2eY79CkVZAPhDycOjhTsICLkR
	8vp/qYrnWl+J/8zvGgn0iP/Uew==
X-Google-Smtp-Source: ACHHUZ5WtVYFk64VhaBDNo91uxeEUqmTWUVhbAI56C8Yz0/rVliNZMlezQcNQkA7iVXhvjVJ9Z2zSg==
X-Received: by 2002:a05:6000:108f:b0:306:2fab:1f81 with SMTP id y15-20020a056000108f00b003062fab1f81mr4149572wrw.21.1686141122990;
        Wed, 07 Jun 2023 05:32:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:247f:a475:41f0:cfdc? ([2001:8b0:aba:5f3c:247f:a475:41f0:cfdc])
        by smtp.gmail.com with ESMTPSA id y12-20020adff14c000000b0030ae7bd1737sm15582424wro.45.2023.06.07.05.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 05:32:02 -0700 (PDT)
Message-ID: <6dd34fafe17e89690507879ecaa0daa4f96557dd.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2 2/2] testimage: implement test artifacts
 retriever for failing tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Alexis
	=?ISO-8859-1?Q?Lothor=E9?=
	 <alexis.lothore@bootlin.com>
Cc: Openembedded-core@lists.openembedded.org, Thomas Petazzoni
	 <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Wed, 07 Jun 2023 13:32:01 +0100
In-Reply-To: <CANNYZj-sP9YMkaT1etGb5v-svWFgbxDCTFzKnNGvwV9+pP2zSw@mail.gmail.com>
References: <20230607083015.20760-1-alexis.lothore@bootlin.com>
	 <20230607083015.20760-3-alexis.lothore@bootlin.com>
	 <b8e4b45e013ed8fdfb2c6075336b388bb9904b7c.camel@linuxfoundation.org>
	 <CANNYZj_84WzoPgCLGE2wpKqmn=H5+3WxZV3u3vaH9_iYGCP-Ww@mail.gmail.com>
	 <f731aef7-c59b-c283-0ce2-369341b2594c@bootlin.com>
	 <CANNYZj-sP9YMkaT1etGb5v-svWFgbxDCTFzKnNGvwV9+pP2zSw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 12:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182475

On Wed, 2023-06-07 at 14:29 +0200, Alexander Kanavin wrote:
> On Wed, 7 Jun 2023 at 14:23, Alexis Lothor=C3=A9 <alexis.lothore@bootlin.=
com> wrote:
> > > Then core-image-ptest.bb should append "${libdir}/{MCNAME}/ptest" to
> > > that. As that same image recipe installs only a single ptest via
> > > IMAGE_INSTALL:append, and the artifacts are retrieved only if that
> > > ptest would fail, this would achieve the same outcome. Other images
> > > (which can potentially include many ptests) can then set what
> > > artifacts to retrieve themselves as they please.
> >=20
> > I am not familiar with multiconfig, so I'll have to document myself bef=
ore
> > trying what you suggest, especially to make sure it will not make the r=
etriever
> > too dependant on a proper multiconfig definition.
>=20
> core-image-ptest.bb is already set for this, so it just adds another
> usage of MCNAME variable into it to get the name of the ptest from the
> mcextend variant and substitute that into the path that gets added to
> TESTIMAGE_FAILED_QA_ARTIFACTS. The retriever won't know anything about
> it as it happens at the recipe parsing step.

It does seem like a neat way to handle things to me FWIW.

Cheers,

Richard

