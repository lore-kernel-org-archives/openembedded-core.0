Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DC4C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 18:57:37 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.3648.1707418653620146150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 10:57:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EzpccFTF;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d0cdbd67f0so2315881fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 10:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707418652; x=1708023452; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tpKNGvK9Nr7KSWdrO7cQI14xEcH0anCLYMp1p9we6qY=;
        b=EzpccFTFcgYl4BnSz0xW8lz4wXPe3c5SUJpjEVRNdjfU+LhOdk/JHcubTB65qKSPPu
         gEK9dhReRvrvJmyTJtXKrhe03BA+H8t33z6ljZyf8LeXh0GlE91Y8+SMIBapbX5SrGA5
         4z8p5GfyRrzT9tJW37FFD1mKKoeqS9fQfM2xDuFLfDTkbkO5mIY9qM4CI/7zh21SyMxr
         OsqZRxODeGiIRnOygwNbZI2TH3/eil0255ZmMyaoyWefBrsznf/bedaEr/ORSJJ1EeIZ
         NAfd5rWLyrK8lKMe294RkVaSORG3JV0DKK9P8Mc1+U5HWyzicSgNIuAoKoWlexPvrFvZ
         FVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707418652; x=1708023452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpKNGvK9Nr7KSWdrO7cQI14xEcH0anCLYMp1p9we6qY=;
        b=hCCf0XaBSfAJIrj+SX0nk1jcXzYi9SDnpHEICLizZGxSvg+bNcpj+uVU9HWxZVItaY
         tn+7G8DFCGEEM5ZCg6iYKuq9PZH6i511dYFTR3lMRskKCviUAcWA3Q10/R5oPMdrR/bq
         svUCjE2N+JTQ7glt59UQEVrrUsWCYitgvjNJ7PstV06rFw2rGof0AQYpJuUCKqFZNHii
         mGuc6WFcaWJ/3K/Jk5YmhmIC8gXVLmbVBz/xIe1z7G3/o0tJg8af4gzgwHDBaEVP5XhJ
         Ng+gtee86dkWbtzAkKixN0onqt2IOecHYppRtjAy9JyA1+ebtouCczqcxGvEAWT/HyXn
         +bbw==
X-Forwarded-Encrypted: i=1; AJvYcCUQMfpoIjVv2Z1nq+EVmtBiS1y+h5l38q06lsuPakR7Kq8p2Ico0MHb643m2QYOAdPaQZEaOKU0Jwvms8uHa1uiYBwZMQ/wEvuL2TdILROb2lao5WzgHF1r
X-Gm-Message-State: AOJu0Yy3lQZwHzfzCPxpucSe/TGbWhH8ogwiwOODWgNGrL2nOMmRjYMf
	V8eKg8cQuwrZzURUPb0AT6hnio1Pfo7bCmj9bbdH5F6pryMo6XzA9A53/QUVmZo9FXxZOE2nA4U
	cS/JjuiARyU8OMxy0vpNVWYhngPk=
X-Google-Smtp-Source: AGHT+IGuVlyyIbQSUGCG8LaOOQ/hZm7+rkVmKpDZdhqDGH2MLLkjTl9cYnt50GYTP7zrW2CMKhOodcAr5181GkSg5Yk=
X-Received: by 2002:a05:651c:1046:b0:2d0:cc43:1ff7 with SMTP id
 x6-20020a05651c104600b002d0cc431ff7mr133593ljm.48.1707418651568; Thu, 08 Feb
 2024 10:57:31 -0800 (PST)
MIME-Version: 1.0
References: <20240111131521.2305172-1-alex@linutronix.de> <51ee1c53-0687-22a5-ec9b-88c2ecd2bc66@windriver.com>
 <CANNYZj8Wqm1NNx0VuxOU7sxoxsKcKh+vG-3WrkKiDqQVGSDNsg@mail.gmail.com>
 <CO6PR11MB56024A3C9C403E77C038F106ED702@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CANNYZj-A5mfTyDSU0JzSpD_y29ByQrSbM=DupDWDFtMaDjtwEg@mail.gmail.com>
 <28d1f2fe-18fc-48a2-98a3-d6c4b84a242e@gmail.com> <CANNYZj_4rwjT5+Q4+Nm5czUPXiQG1gCzcnROj5cUVmQsG0Bt2g@mail.gmail.com>
 <17B1DDC9333F50F1.20876@lists.openembedded.org> <9c50fcac-5993-4293-a794-422fe8ec5e5c@gmail.com>
 <99fe5b08b06c72cf7bfc9818f2f415416f4419f4.camel@linuxfoundation.org>
 <fbb5123f-b2c6-4229-99ff-2d483e4b749c@gmail.com> <80f19340ae388da4e7b6cd36ef43b01b2f34900b.camel@linuxfoundation.org>
In-Reply-To: <80f19340ae388da4e7b6cd36ef43b01b2f34900b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Feb 2024 19:57:19 +0100
Message-ID: <CANNYZj8CCxAWS0GHeTMxRFY3bRJ1MHXpKhnt-=XL=CKpyuaXzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] shadow: update 4.13 -> 4.14.2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>, "Chen, Qi" <Qi.Chen@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 18:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195173

On Thu, 8 Feb 2024 at 14:27, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> since we don't (and shouldn't) build a systemd-native.
>
> You might want to see if there is a configure option we should be
> passing in to disable that.

I just sent a patch that does that.

Alex

