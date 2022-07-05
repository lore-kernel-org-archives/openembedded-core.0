Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71181C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 22:04:43 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.883.1657058679170989187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 15:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EF9lyouk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f45.google.com with SMTP id fi2so23943403ejb.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 15:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Q4SZqc9tdk4vJQKjvwy/dL/HG4wUBZsBWpEBdQZHNcc=;
        b=EF9lyoukTpVHzxOFdD0vdHvNnelfaWUeZagEKFkPbPqF+j14B961nItkJXKfGQvcjU
         GSLGm8r/GVF2DxCUrqzJcVanYePCDcTZfMCUzMOEwTr1uI6eJyzvFYsvKc8qUcyPbeZL
         a1gdEulhQEA15wkbQ1D8PTbmDjoxn/L9Gf1l4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Q4SZqc9tdk4vJQKjvwy/dL/HG4wUBZsBWpEBdQZHNcc=;
        b=htNbGnYAhKTOTaMv5W0kCOiWGPxpEh3RaOV+3EE+maLvcfrRPKLHEXPANg69K7Gm2H
         TH7ikvPouumFb/jp4BboPgJDtohVr7hOFv8hi4xtUnldhMtaDzRVN2ObDsuMkdL8QgZj
         ZPGjJOk4ORsz/o9uyyby5sPpsX7HJQe8NJhqgomv3tbHwnBXjBbNaUS6JE44WtEvBpcf
         JOtxSTjOhRekU680AGPeDQmsplCU1AtBTXpC1JXRyRo/d47plIZ/BI3TcwmSf6bHj173
         SPAvykn1tngbULb0dp63T5VOtiJslOH5hxqMfKitmm1rJWXIq4QiSu8uZievyKNOq1fD
         pJDg==
X-Gm-Message-State: AJIora9PxiYpbCU7DDwN+qrNMGPExcnZOaPwUHvU8WfJmVurhkn9Cc5a
	zTlZD302ZPur8/WEQmiGmeiafQ==
X-Google-Smtp-Source: 
 AGRyM1vTK7KNvLeuocpOb7Z2meVPAP8FdENU+0x7OpkYJPYDneYQWr4cOe74kl5sc2nwrQjSg0Z3zA==
X-Received: by 2002:a17:907:3f02:b0:6f3:5c42:321a with SMTP id
 hq2-20020a1709073f0200b006f35c42321amr35719136ejc.521.1657058677550;
        Tue, 05 Jul 2022 15:04:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8?
 ([2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8])
        by smtp.gmail.com with ESMTPSA id
 eo7-20020a056402530700b0043a78236cd2sm2418542edb.89.2022.07.05.15.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 15:04:37 -0700 (PDT)
Message-ID: 
 <ca3347502948ad012926db3e4e2ba93bc5714dbb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] externalsrc: write task locks into ${T}, not
 into ${S}
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>
Date: Tue, 05 Jul 2022 23:04:36 +0100
In-Reply-To: 
 <CANNYZj-EKVYunx2uf9nMrmCKEmg+q6D81Ny7YhVdOTVHQ=TjEw@mail.gmail.com>
References: <20220705163949.770641-1-alex@linutronix.de>
	 <38e843d999ac2ee830db7d058395704ac2563a84.camel@linuxfoundation.org>
	 <CANNYZj8wqKxXRFzykE_rbFeRRvGTysgi=PEtZHLOYM1Exgmcyw@mail.gmail.com>
	 <e7027f1165f7725145722e209cb549e3268a60d2.camel@linuxfoundation.org>
	 <CANNYZj-EKVYunx2uf9nMrmCKEmg+q6D81Ny7YhVdOTVHQ=TjEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 22:04:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167684

On Tue, 2022-07-05 at 23:51 +0200, Alexander Kanavin wrote:
> On Tue, 5 Jul 2022 at 23:48, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > I considered adding an exclusion for the lock filename to the code
> > > that tracebacks, but special casing like that is pretty ugh. Today
> > > here, tomorrow elsewhere.
> >=20
> > Right, but the lock was also added there for a reason so we're going to
> > have to work out some solution :/.
>=20
> One thing I don't quite understand is why the lock file is appearing
> and disappearing while the task itself is executing? Shouldn't it be
> happening when the task queue is being processed?

I think we do need to understand why that is happening. I don't
remember the specifics of the lock but it is possible it is being held
and then released by another task running in parallel?

Cheers,

Richard

