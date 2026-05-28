Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFC8CD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 17:03:34 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15711.1779987806945528980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 10:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xcjw4Ous;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso38874595e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 10:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779987805; x=1780592605; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gRPuG7qHnaohvffVA0Jze4ImKnsM1vAzp70gKtmoTGU=;
        b=Xcjw4OuskTUzgmiBbTLuYRN0ooOTQmdszgD2oOiLcTcV7MyEi6hG7coQcNMK/CO/sO
         hzkfR31W+cKnl8SjWIJmUH0ECsFEoRR+pP1oTby2KMUo3r34vJQYgn8FoxNawrDMlEhS
         lNvHpl8aS6xMdwKKQw0jN6zt82LGmkwXNVjvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779987805; x=1780592605;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gRPuG7qHnaohvffVA0Jze4ImKnsM1vAzp70gKtmoTGU=;
        b=JCYNsdX34GFkO5YSjbVwdVf5K3OmQ7p+HUsHl+uXnm3YbuIMeqQRVd7ngrxNW+Rmmm
         2x5HnGgayFNNjjNPNUq/nkTg2OXqqEPpFCl+yQJdyRmZ9RlKc6ulu0tYENOH1NDT750p
         8F6QCKv0FcBpw+QWJY6SGqEjSGlA5WdD/tnyUjD37bIw9mxuyDZqUwANZBxJQt8zSu0N
         OZQ9RCBHwLEf6ZmrJ5rODHZCdsA8ZEfkqYqZdBsfYq4BtTjM8vJfMxidPOue3MqscY89
         MKu89ObQMhU0kHkQBrHUnAtAu/UABDjPNm7QDA4s+/iK5ykZtb+f2tub41BmNbUKS73A
         OPOA==
X-Gm-Message-State: AOJu0YwK3Gf3f7A+uMHlLOVnvV43wT4Jy19wkprwHhqjQuGDXsaxjGPW
	9G6lUyFsepuBv2rNLJ1tx/yiGmWo4QvVeNIQYxEwewGzxuMnIImFedpQe8mQi8YRXBI=
X-Gm-Gg: Acq92OGqngx8kwysggL9wGg+LWGR+93huMbKjMGfv9l+FInuIRhDrfhMhhkRpspHsTT
	Z/9wPp86DZOyJV7ZBdx/LZhGDMOZ83bQEcSp9UFNSSm69VIESzRylZcSxIqeshfr1C73BKUoyzd
	LNSQ+HUXxa8amnBn1nEM2gtfp3Fv3ZdWmGV0qf2ygk/zr82q543aahl/paLwBxUouRYfOGdIuez
	fYPk55gBZw7gSZPI8v5HgwCW7L/grESAqhQloQVq3B7UoBy2xILoS76aEkDQviLBxicLPBi6w7I
	osObtFSbc00aY2yASaX9iijLp98iS7n0XciFRikmuV2oU3CPcGAjKmmbZqRh/MviY1msOYBrLJL
	amxnIqLMhgZJnOKrWOCF6rSDcUyHZk1d8z09Y2jj8H/tBfngIo97/9xcdW+hS8BDpY4Fsvc0qI7
	XzKohXPN8UGoDuBQGBMnySklndwnHWUBF3vM/g6+AM6FeZZ9wevpKl3IRak54LDb9u150J27HcV
	r5D1icse1V1M+tSXaROay3a
X-Received: by 2002:a05:600c:4f91:b0:490:6e12:a40f with SMTP id 5b1f17b1804b1-4906e12a673mr230719345e9.12.1779987794319;
        Thu, 28 May 2026 10:03:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd? ([2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909236ad1fsm55225815e9.5.2026.05.28.10.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:03:13 -0700 (PDT)
Message-ID: <f396af25d398685f31b9b55c079aa9fbb757dc1f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] randtest: retry on unstable sigma instead of
 tolerating statistical outliers
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Aditya G.S" <adityags2004@gmail.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com
Date: Thu, 28 May 2026 18:03:12 +0100
In-Reply-To: <CAHaUZZAG5d3WsGq_u-Kb4HuHc1u8H21gfcmSay4CxR-uxmE4Fg@mail.gmail.com>
References: <20260526112501.15985-1-adityags2004@gmail.com>
	 <CANNYZj-CRdJjU1z-0m8bqfWtS=X_PVzyg8uKS4mcRXMua+ikVQ@mail.gmail.com>
	 <CAHaUZZAZGRx0H4z5sr8ndJVqjdUk4N9kaSRKp=6-DyX73e0VkQ@mail.gmail.com>
	 <CANNYZj_T4TDeN0LgrxqO4GZvebhhZx9smKrwN+MFG845z5dMUA@mail.gmail.com>
	 <CAHaUZZCEHB_OVEpJgbE8tfsKyRP0JjOFBgjRyg54tLdFZY6Wtg@mail.gmail.com>
	 <CANNYZj-BEjNW54zU6tOQ54BmtK8magKQe7oakp=iOggj6BBk-w@mail.gmail.com>
	 <CAHaUZZBBwdufvhvggvG=xtoHuOFBZx+ExFGC+s_tK3Q51Qdwgw@mail.gmail.com>
	 <CAHaUZZAG5d3WsGq_u-Kb4HuHc1u8H21gfcmSay4CxR-uxmE4Fg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 17:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237717

On Thu, 2026-05-28 at 20:43 +0530, Aditya G.S wrote:
> I wanted to provide an update on this issue.
>=20
> The proposed fix has now been accepted upstream by the gawk
> maintainer.
>=20
> The changes to randtest.sh have been reviewed and integrated into the
> upstream repository, with appropriate updates to the original file
> and test/ChangeLog.
>=20
> Given that the root cause has now been addressed upstream, this issue
> can be resolved in oe-core by backporting the corresponding upstream
> fix, rather than relying on a workaround such as skipping the test.
>=20
> Please let me know if you would like me to prepare a backport patch
> for oe-core based on the upstream changes.

Big thanks and kudos for getting it sorted upstream!

We would happily take a backport patch.

Cheers,

Richard

