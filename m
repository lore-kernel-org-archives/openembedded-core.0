Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D01AEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 21:10:21 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.850.1687986616580711238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 14:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Az8+0ncV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso5468475e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687986615; x=1690578615;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=io9UR2sKJCEthNRbkZb5GC4AUirvq0mGA1izY+aSe1E=;
        b=Az8+0ncVRWPLuqweZIPqwSeLkfyCB5C0GLAc/+6oAMSNnEkM1IAkaMsPeH3k3r05gj
         MDg5gGm6l4D87Zixfr+MnVojC0JfdK0V5ABrd+jG+VNPp+ky46hpzgU2kjRpkPOfKpFm
         dpehUJNcc7fBUqnnYpx3tHQT9treNK1Lg2oWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687986615; x=1690578615;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=io9UR2sKJCEthNRbkZb5GC4AUirvq0mGA1izY+aSe1E=;
        b=crUl41+DgWokDQ52DBANDPyFX3SGzgtilfES5OCalYk0GOiuwwR4pXKEGydECBreuJ
         cHazyuCsYVu1wXScI49y4hQl1CdHcPTFsz1TU06QzPmNGp+kplG7ADDXw0RLaiNtUFlz
         gVj16Wqapj8LFNhy8Aw4MrxZZcm/ldywpDQQZjwSjT4BjnEL9k3MsZVS8Td3Esv7bk/n
         sdcLHCZUj/4WWrQq+vhQVeeJmwnZyIm82/qFAda57mTCoWFJsBLZ98o/qIJBnttljbzY
         ovCpDAMYL5fe8MFln8wfGzgcbRjPn8bQt6bB5Ws2/cSqGDAQwuuApB3NDeb7sw3TnYqI
         za4w==
X-Gm-Message-State: AC+VfDzOVd5ptyTlSbiiqPgnCqOPA8KSwC/LSPeMNUQZzV5XFQnxjKNc
	rYOlAkK7WuMgA0GfJBfWN1JDsQ==
X-Google-Smtp-Source: ACHHUZ53RboV1m0C94wX7NJXqFY6a6Ez3BpKp6Uvk3psaB+m87KBzw+yu4CBwp5ZrUw6BBpJPmZ/yQ==
X-Received: by 2002:a05:600c:214f:b0:3fb:b280:f548 with SMTP id v15-20020a05600c214f00b003fbb280f548mr2651544wml.0.1687986614965;
        Wed, 28 Jun 2023 14:10:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717? ([2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717])
        by smtp.gmail.com with ESMTPSA id k10-20020a05600c1c8a00b003f9b3829269sm7385173wms.2.2023.06.28.14.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 14:10:14 -0700 (PDT)
Message-ID: <65959bf734fec05fa14ceddf20733b851bf8d78d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ptest-runner: Pull in sync fix to improve log
 warnings
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2023 22:10:13 +0100
In-Reply-To: <CANNYZj9exqWr7e2yd_JcYLhjV_D4QZ=TRnwDMWdcKjNNN=6ekQ@mail.gmail.com>
References: <20230618090946.2478083-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj9exqWr7e2yd_JcYLhjV_D4QZ=TRnwDMWdcKjNNN=6ekQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 21:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183601

On Wed, 2023-06-28 at 16:24 +0200, Alexander Kanavin wrote:
> This appears to have regressed glib-2.0 ptest, particularly:
> Failed ptests:
> {'glib-2.0': ['glib/codegen.py.test']}
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5273/st=
eps/12/logs/stdio
>=20
> I didn't yet got to the root cause, just wanted to register where it
> happened. Note that the ptest passes when run directly and fails only
> under ptest-runner, and it somehow is specific to qemux86_64 as well.
> Bizarre, yes.

It happens on qemuarm64 too:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5091/step=
s/12/logs/stdio

Cheers,

Richard

