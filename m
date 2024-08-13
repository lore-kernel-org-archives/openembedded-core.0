Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E13BC52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 21:49:36 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.84078.1723585769526649394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 14:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e5N/tkCb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-368712acb8dso3505064f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 14:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723585768; x=1724190568; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dxVBEZt5Dwaac+HYirDQ7O5B22SS00UETfQX706Eu6w=;
        b=e5N/tkCbnqRs+UF4ef4qSqIP4b5UvMD2ftEoyk1JbyRJLzj8Fw3Rdh7FAzwHavcj7F
         RK0Qi4+PKZbemROPve9mcLrwQynv5QIYlnqML74Gh3Rr3tQHnWzMPCoGEjnEVHLb+8hr
         ovQlNzeieATCpMByuUC9kSXG+oALGvqVJkTto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723585768; x=1724190568;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dxVBEZt5Dwaac+HYirDQ7O5B22SS00UETfQX706Eu6w=;
        b=djH8+28Mo50X8+dhCWPXLIPVrMwzsNUoSObQzhnZ9e8cfevA925cm+7Mkpwp5pBaoE
         mKnlZv4hLmbhSyW1mWCQF0WtNRp+Sgyvs3B+BQHpSpwBz2/4z1VWCJAhinokmOsQ17px
         gJpB3zB6Umz8iCyz3l+lnlcVDwFWXHZZ1sNEPxAWIea0lbM1qKCmph3HJqKqovqeyalu
         47EFalFgRe2T0bA9tiHgud+mtVE7s85FqlB8i1pwswj+7Y5fgCVWcpi+Eh2sUWeg66lu
         V1UPIFIvdmnx309yjw8E9eLVN3x3d0rrlqC/WfcXnJT9+Y+FWokz5vsn/xZL7lz7Sa/4
         Tt+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbgVdGFcgjRkecP1NwEohlrq8MaPujPdydGSyX2m1X5TAAyDljb7/Q7ZE8rLOY7itIt4OaYEVgQ5C8gVhswWjkxbcPLYHBTMar2kIWdI1dpQqhUKbCM+1f
X-Gm-Message-State: AOJu0YwKIkNZst3Pa+/rQUQ+itD7vND4Hhh3qdb36AR3fQpngStaoPk3
	9e/fltWRO7x2F/cqPX+fjXrFpJB5r7K78Ov6OcLVZQIxiu4W7D/iq6wb1x7EP6g=
X-Google-Smtp-Source: AGHT+IHky1U3+VEXQtKzUF8J2YZdkVJ2fsnp7mycLRMhiuII5pLfpkyhn7w0HxxB/PL+X5uRM2Z8Uw==
X-Received: by 2002:a5d:5f45:0:b0:367:35d7:bf11 with SMTP id ffacd0b85a97d-371777968d8mr660925f8f.25.1723585767642;
        Tue, 13 Aug 2024 14:49:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7404:f62d:799c:7e88? ([2001:8b0:aba:5f3c:7404:f62d:799c:7e88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4cfee676sm11377583f8f.49.2024.08.13.14.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 14:49:27 -0700 (PDT)
Message-ID: <9b6a5702e893e632c27657a2b376dbe3d74373a5.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/2] linux-yocto/6.6: fix genericarm64 config warning
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Jon.Mason@arm.com, openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2024 22:49:26 +0100
In-Reply-To: <ZrvUAceA3PQRD1yn@kudzu.us>
References: <20240813195753.576442-1-bruce.ashfield@gmail.com>
	 <20240813195753.576442-2-bruce.ashfield@gmail.com>
	 <ZrvHMQCZgXQjYCj4@kudzu.us>
	 <CADkTA4OOJOfyVODZgbhpQ2xUTkBPkspuh-EF99mekPsjGi3nOQ@mail.gmail.com>
	 <ZrvUAceA3PQRD1yn@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 21:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203297

On Tue, 2024-08-13 at 17:45 -0400, Jon Mason wrote:
> On Tue, Aug 13, 2024 at 05:02:34PM -0400, Bruce Ashfield wrote:
> >=20
> > That''s already fixed in the recent bumps that I've been sending
> > Richard.
> >=20
> > https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=3Dyocto-6.10&=
id=3D107c15b3ee3f07842384208ea021588d589e51ef
> >=20
> > Maybe your meta SRCREVS are different ?
>=20
> It's from this morning, but I do expect it lacks your fixes.=C2=A0 Thanks=
.
>=20
> Seems like my CI is unhappy today.=C2=A0 Very convenient=C2=A0that Ross i=
s on
> holiday, almost as if he planned it that way.

Just be thankful he didn't send the experimental code he was working on
last minute as he couldn't get it stable enough to share!

Cheers,

Richard

