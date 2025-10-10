Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2208CCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 15:41:07 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.12107.1760110861947573633
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 08:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fojv45t2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42557c5cedcso1310755f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 08:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760110860; x=1760715660; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEk2NIR5pfqIIg74jXT+WHtsQ1m6AhmTywUuPVFhjDI=;
        b=fojv45t293oiglJFfmWLSB0Cbdiel1d14MmS0Kx3qDlMDRGt5NH0FWy3UHlSYM/4a7
         9NEUpjRIL+dWlXoVYXyOo1mYuVO1bRxp5tbg4cu4J8BSuzEatjU6RQbYXfhDU2ZPaja3
         yBW3Jm1Y8Jq6pb45IKUgZgx063Vy+jMF7/n0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760110860; x=1760715660;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qEk2NIR5pfqIIg74jXT+WHtsQ1m6AhmTywUuPVFhjDI=;
        b=mD/pIaZuNm/IzAKjJRresNFU0txnICUgBVKqboNjhGtskNrzpLfylivikmCXAe/je/
         qjdRHOXiSrMcNTOjgwAZ8xYPtVmcmYzzfmXENVQ1Zd+QasAsWrT47CpX96bXXT+1YMi+
         120BMARcSFtgHW6KOUUAUJamrknBTCmIu4IbYcHen5FtJrJSv2SezB6nWy/hiiqPyd4L
         XwnO2NWdHO5KbrY4gOEXENzIjTLAG9mvMOlK04NgFihQ8RMg2Je22LE9d8178A7zIzNM
         ylxpJ2TWOFMv8lf+Hsvj+tK0whlhvkOZDF4X1IKSbMYE9tYLImoPUXXkyUtny2h4pAml
         ZgFg==
X-Forwarded-Encrypted: i=1; AJvYcCXl8VnN4keE7ur7O6LfZCn1yDu7XDZWkbenSWwf55+V/3SwZ8LKauDwY+MSt6v1ZWxySwCPIgbUFyFRPec9l6Mq3Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz2rJWXQl5RaJ1mDbasiaLwenOcPAwNiE+I/U9WQcXHMiA97FHF
	5WSO6ISP32CW86LmmIb8ckAIfjZMwLX/SAcIkpUxA7r1ZdkblZI5YHSRXDVO76s1NbE=
X-Gm-Gg: ASbGncv4aPpZPyx9/heTZ6w+CVAbclGBbcGD5bNEqnqhlUls50K1MJ6MkDYHB95xTOx
	vYO0pRW129FnRe7GoQ/GyPSv0vcVPGoEyOnuaR72eisAoaKJoZXF/NWNwNPPeHm8U4u7yOQwdYn
	Y2L3kWg/lygTDuQTdUr0Qi1deq5Wq24omi3C9YRE8qQdQ5c3RplpjcJ6zuYVmbRFbHO1ECIkcoU
	xM05W/brp9xxyWmjtwH0BmDIWsAk7kSxLZMK0KrwsBuW1SmO+8G4ejgAr1Q//PVjLrlMt7HebVG
	CkJWWP95e16kpe71LyK6OgHDLEYDZouu1iakBt95+uX0Xg8OVc9xtxTa2+D5D+DZrh6hxb9/cQM
	Gv6OQ3ipTvqKV4e1dgiHWkrVx39wATbpsjVMiZT9Uyix9lINNkctfUDuDKN1/zvdBnKMqe5els+
	FHX0p4ebZS7awSldPfZ+hFPsWkhtBYtA==
X-Google-Smtp-Source: AGHT+IGg/OOnJbs3LTJmZ/zdsuAIvKeW558ExoXxZZVnMwtx4Dxta+2iLBTlesboD9wDjt1WUNoCzQ==
X-Received: by 2002:a05:6000:2909:b0:3ee:11d1:29dd with SMTP id ffacd0b85a97d-4266e7dfd91mr7846738f8f.35.1760110860270;
        Fri, 10 Oct 2025 08:41:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3d6b:fc42:c556:a557? ([2001:8b0:aba:5f3c:3d6b:fc42:c556:a557])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce582b39sm4703176f8f.15.2025.10.10.08.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:40:59 -0700 (PDT)
Message-ID: <c62656752249cec0bdcf7699ff69f7471a118029.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3]
 oeqa/selftest/bblock/fitimage/sstatetests: Fix changing MACHINE during the
 test
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 10 Oct 2025 16:40:58 +0100
In-Reply-To: <DDER4TNFACYK.197FU3Y7W8OXL@bootlin.com>
References: <20251006131454.846597-1-richard.purdie@linuxfoundation.org>
	 <DDER4TNFACYK.197FU3Y7W8OXL@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 15:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224694

On Fri, 2025-10-10 at 17:36 +0200, Antonin Godard wrote:
> On Mon Oct 6, 2025 at 3:14 PM CEST, Richard Purdie via
> lists.openembedded.org wrote:
> > With config fragments, changing MACHINE in the test like this no
> > longer works. Use the forcevarable override to allow it to work.
> > This also needs a tweak to bitbake to work correctly, sent
> > seperately. Whilst ugly, this avoids the need to start changing
> > config fragments within oeqa right now.
>=20
> Why not move the inclusion of auto.conf after the addfragments call
> in bitbake.conf? Maybe this triggers another issue, but I'm just
> wondering.

It would change behaviour, there is a lot of things out there which
assume the current ordering and we don't really want to change it as
the breakage is potentially very subtle and not obvious.

Cheers,

Richard

