Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08449C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 17:30:37 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.49858.1702920627704242762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 09:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KwCNFMf1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-336668a5a8dso1735426f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 09:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702920626; x=1703525426; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Eg05e21iEYytbnTV1OXTr4dmmWWVoUG9aAJRDMhe8Mw=;
        b=KwCNFMf1Rv3OvleXxHF0mmCE2H9oPkPT+fM9PW/TxEQOSPJTXU/LaOcBPT/TOLjN5a
         QE0bp0xBea59lelyD6ibAG8sA0C0m0n02J33YB8dkUhuuKE0PJ1AGQsCD2rGBR9ouEkA
         7aaR8ihyA0muUtMTMHuLCKSsmyp5dmFDUqXvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702920626; x=1703525426;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eg05e21iEYytbnTV1OXTr4dmmWWVoUG9aAJRDMhe8Mw=;
        b=oWnMWCa73apXYPcdW/Y1EO04yMaIFa5bgr6zRL7BNMiMFtAvAMfVyRL4q00niIMUj/
         ixwPiqiBED4JNXZj1Z9PUrE8f2LAW8/nZ5o3vdf+iEOXme4JZaeXjTpHcNCEAd9ICn4Q
         c4B75uBW0v7YhjJYZDQXzO3+AQmlPb7DxqZbqBw60LD9VDi4QXfAzVNJTPp+DNfk72CR
         SF95Mc4Atyva7VIfJMVAXdXUVdkLp3nLAQ3qwtDHbgFzYb7Bd94Pi/9reeMhZk/6J5He
         lxf7mPCvN/8RI1p7fzkTwrQUAorJQH8xyZQ+LW3F65DR0AboynXU1H1V/7dK5CLB6azF
         sBlA==
X-Gm-Message-State: AOJu0YwWf2QwaAl8skFpj5NVTnc2/ebwWpmpD82axEzeUo41Dxkq6l/6
	nIlz3Sedi2lP3X2OdIb7M0bfpg==
X-Google-Smtp-Source: AGHT+IEdK1EOd2aCGauXvT26boZBHohCoY+lua2x5WGCwHNeY4+RCONaJII3JQVJLCDZ1BJZxjBUIw==
X-Received: by 2002:a05:600c:3ca5:b0:40c:4b42:a1fd with SMTP id bg37-20020a05600c3ca500b0040c4b42a1fdmr6536541wmb.34.1702920625800;
        Mon, 18 Dec 2023 09:30:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a720:6e27:acc4:d591? ([2001:8b0:aba:5f3c:a720:6e27:acc4:d591])
        by smtp.gmail.com with ESMTPSA id j25-20020a05600c1c1900b004076f522058sm45473436wms.0.2023.12.18.09.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 09:30:25 -0800 (PST)
Message-ID: <9e6217677a13c374a5facbf83c2c9eda501927a0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] qemurunner: Impove stdout logging handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 18 Dec 2023 17:30:24 +0000
In-Reply-To: <CAOMZO5CNMvOBtL8Rg0+PKGBsFWoRoiCna7T+NMqe+LE+==8brg@mail.gmail.com>
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	 <CAOMZO5CNMvOBtL8Rg0+PKGBsFWoRoiCna7T+NMqe+LE+==8brg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 17:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192668

On Mon, 2023-12-18 at 13:04 -0300, Fabio Estevam wrote:
> On Mon, Dec 18, 2023 at 12:30=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > We need to ensure we read from and log the output from qemu stdout
> > as otherwise the buffers can fill and block, leading qemu to hand.
> > Use our existing logging thread to do this.
>=20
> s/Impove/Improve on the Subject line of both patches.

Ah, yes, thanks. I've tweaked it on master-next.

Cheers,

Richard

