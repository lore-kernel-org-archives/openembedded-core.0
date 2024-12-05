Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305C6E7716D
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 12:17:13 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9554.1733401024683245623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 04:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BDRd1SRO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385deda28b3so722155f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 04:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733401023; x=1734005823; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ycNWg0Zxo/1zX8Zks2PBcgwFAqNbPCysruY7yPjp0+E=;
        b=BDRd1SRO6S3K5naiPrJVvHmpdOPmc/nSFFuiuo8n2VYPeOQ4Wxla0XF+Z6L8RgO2UE
         5TsNeQiXLFcjISSi80nFLS4VwqhwL338BY5OQQw3os2E+NMA6IaNnPjTd+wDB5LXOzUv
         xFdlkmwvfeF6pPiaT9xJz3mBay+LE6nnNd6MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733401023; x=1734005823;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ycNWg0Zxo/1zX8Zks2PBcgwFAqNbPCysruY7yPjp0+E=;
        b=cPV8vII+DjlKweja1dKnGknWAg8OHi4LOaBY+PIZ9AtMAm/chDkHIU7F9Yj4sTGOhL
         DsU3oVtufZF/ipQ6PMJKL3czmkDXsJbrMb+MspNNrYXCS3E3LSbyrIVJR1GMeFTG19sK
         TqqjC/3F221FdMSUTlAVP2+unPLxrAExT1Uh8X7laN8qhuOy6rtz/rdQ5jMDJNoSiSZ2
         WhjSUsVB/Fhx99hiLJgVgZUC4c0txZq1E8AQKi+7u5N4hcb/SQHTWKeVTm9lZf0TFUoh
         NRjxZmcxg1UFjyI1ZQpfOCdsDO3AVoa1EOJsaGkaXF6vElOUeNeGmPr7AWgjpgKCvSuK
         KVHw==
X-Forwarded-Encrypted: i=1; AJvYcCUHnQr88+p1Un69E+OiZHTi1ppA8PRc0aWKwyUVzkmh8T75GjxZNjCvq7ofgeFz8s4CeE4877fLLw2y3f4ow/SbGQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyUUvKbCalOnU3v/1AOaysCAzYg1I1H49oHmwprq07odDXvo5Gf
	9Uf0unvFnMbKpECidRMPhNmeJmB4WGE0gZQBT+OcbxQ7CViSrclf8R0CXjJpEQE=
X-Gm-Gg: ASbGncsVD/KANKIJGLbASUynVbQxqyMgwkj3IY5b+zzZMh0mmIE9/9/KRBScCXxt7vm
	8dy0tgk2EeE+i9TAK+jykJhanBI2Y4sul9YZJ5PT9Caj7hojSixKzu5kpIKU3tBbKw2JwM9Jexc
	Z7bgmKK+f7udBT7J6zZtWf3Q8CgM6IW1HiDbKEIm4JIEmjoc4Iq9JXb/o3nrS01xfvMatwK1x3G
	NHewa7EhfP2bCtV4ydjLiwLQDDYCY0DvKGD3IrtvGblc+pZwOvxpblO9WFBfKo8Pp1/ltiMkEVH
	XXVI57wIc5Sh7WymFOc30hMxCLkswdLoothz1dE=
X-Google-Smtp-Source: AGHT+IF5EtAqH+wi+LDm7kfLYxTiTZdUZBqEh+aWLLH0qM4FVAxM2dJvev80xlC9webtuP2X3GHbvA==
X-Received: by 2002:a5d:598c:0:b0:385:ea2b:12cc with SMTP id ffacd0b85a97d-385fd3e779bmr9378084f8f.13.1733401022942;
        Thu, 05 Dec 2024 04:17:02 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d2d:8585:e7e1:10f7? ([2001:8b0:aba:5f3c:7d2d:8585:e7e1:10f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f59ccd6sm1802538f8f.32.2024.12.05.04.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:17:02 -0800 (PST)
Message-ID: <f52d3c43d8ef2d786624ca5a50045dced51f1705.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 18/37] libtool: update 2.5.2 -> 2.5.4
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Thu, 05 Dec 2024 12:17:01 +0000
In-Reply-To: <20241204064920.817016-18-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
	 <20241204064920.817016-18-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 12:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208377

On Wed, 2024-12-04 at 07:49 +0100, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> 2.5.2 was a beta,=C2=A0

We made a deliberate move to use a beta due to the amount of changes
merged upstream, and putting us in a good place to ensure future good
releases.

> upstream made two stable releases since:
> https://savannah.gnu.org/news/?id=3D10676
> https://savannah.gnu.org/news/?id=3D10693

Nice to see releases there!

>=20
> Drop libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.pa=
tch
> (merged upstream)
>=20
> Apply all patches unconditionally; the two conditional patches weren't sp=
ecific
> to respective variants, and this significantly simplifies version updates=
 or
> other modifications.

I agree the multilib one can be unconditional but the fixinstall one
potentially has side effects for native builds. It breaks the ability
to run files in the .libs directory which in the cross case we don't
care about but some natives did once used to do that. The risk is they
find host things instead. I'm therefore a little nervous of this bit.

Cheers,

Richard


