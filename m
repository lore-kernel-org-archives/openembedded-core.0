Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60838EB64DA
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 13:34:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.18539.1686836050675481048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 06:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=JtE6ZrWr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-30e3caa6aa7so7771426f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686836049; x=1689428049;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc8t7C5yvDAM090igpHYv28rY9XjQn3yYDa7nwU+SDI=;
        b=JtE6ZrWrZN9aIUdH2OO0xUVaaapprAc2FywOeOd+l/ol+Jl8lgzE5xbfmogvqorooF
         Ye+ngOr0kTjqsZcChAWEZNuUB4tLa8dL1/9dKOgZ52hDkt2Bzan3NftcVyME/nFO8oMu
         aLAKnFHyE/j7JKhfwk6OoQ3wlxVUvJmPHy7ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686836049; x=1689428049;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qc8t7C5yvDAM090igpHYv28rY9XjQn3yYDa7nwU+SDI=;
        b=bg2v0C+3jZiTMvGL27OpdxDM5dacL2C1AVReYMqKRkhCXRhMLT7jzn5Tx72lmiM+me
         WOdqTOGQbF6DNKzoIna7O5CJaflTGDfnJGDe+iePBiGgzTMXf0N2xk8w5WqNV1RhWRt6
         GtXGbWfK57g+Ujm0FBANwEdMSzZAJ+l3BzIAjjJj6NwyYcxSl3b+e2a+6jK2vRLGMWao
         7KXT8SH60kZB5pcuxZmOKTSL3N4h+SxmHwMtC5aPXOlZjaTBT9TqA41loWCeK7jejg5D
         i8EkGz7vKyL4zuroAeKX1xKU+v/vykfvk7tGgOdkhWKlqqGccBFkQYUoPeERmIF6gfnv
         2uTA==
X-Gm-Message-State: AC+VfDz/fHlb+XVxmVvM0CPYGj/J/AAYHauJisM0Yu6Ocdhb0riVEr+X
	31pWa5/Yp+/uZW5H7mEqnY28aA==
X-Google-Smtp-Source: ACHHUZ6FYjDqj1zYyCdtDIJY70idDN0ga0RfI+sCBvKIZCg2PQAzqsRygS9LMp4lhX4NwLA1CGFrcw==
X-Received: by 2002:a05:6000:1802:b0:311:166b:b3b4 with SMTP id m2-20020a056000180200b00311166bb3b4mr1281454wrh.36.1686836049057;
        Thu, 15 Jun 2023 06:34:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:441c:bff7:bd09:d1e1? ([2001:8b0:aba:5f3c:441c:bff7:bd09:d1e1])
        by smtp.gmail.com with ESMTPSA id m7-20020a056000008700b0030fa166d8a1sm18584117wrx.34.2023.06.15.06.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 06:34:08 -0700 (PDT)
Message-ID: <e3536a055768ea84598762f8873165f5570da0b8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] bitbake.conf: add unzstd in HOSTTOOLS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alberto Planas Dominguez <aplanas@suse.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jun 2023 14:34:07 +0100
In-Reply-To: <DB7PR04MB466644241F9DEDB9DB022EBEC55BA@DB7PR04MB4666.eurprd04.prod.outlook.com>
References: <20230615105447.29690-1-aplanas@suse.com>
	 <20230615105447.29690-2-aplanas@suse.com>
	 <3c195fe070c377e91e697d5eb9eda135e2959ff4.camel@linuxfoundation.org>
	 <DB7PR04MB466644241F9DEDB9DB022EBEC55BA@DB7PR04MB4666.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 13:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182861

On Thu, 2023-06-15 at 12:58 +0000, Alberto Planas Dominguez wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> > Couldn't we just use zstd -d in the script? They're always the same
> > binary anyway as far as I understand it...
>=20
> Yes, this should work. I decided to include the second patch to avoid
> changing the rpm2cpio.sh code, that is a verbatim copy of the
> upstream script (minus the added comment from the old version, that
> reference where to find the script)
>=20
> If this is the preferred way I can do a v3 that drop this patch and
> changes rpm2cpio.sh.

I guess we can stay in sync then, I was just hoping not to add more to
HOSTTOOLS. Thanks for the context.

Cheers,

Richard

