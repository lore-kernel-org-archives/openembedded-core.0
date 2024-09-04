Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A47CD37B4
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 11:57:17 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.48140.1725451034546657888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 04:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U8E1MQQY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374c84dcc64so2370796f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 04:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725451031; x=1726055831; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LmBtAHUOdTYMvVMVsh79+6ulEElY9KmU1rjy3pPrO1A=;
        b=U8E1MQQY2gjSeAJii64hd0oTbelL7k+HZomg5sVNDRcgUSRj9E8NFRxM2xG5ouQhW7
         3j0Zkz7pcDen9vf1lMnOlJhwFsRwNFtn3hQiOxC48ETZiqjL8zWPTCeuspnGlozSu0h4
         PFaYPlhxDQzGrEnhq0AEIpfaUSiDYG04ClZfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725451031; x=1726055831;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LmBtAHUOdTYMvVMVsh79+6ulEElY9KmU1rjy3pPrO1A=;
        b=Wbw3+i8Hra+plbjdwYmVOoIVjIzbgUdk2NkPcdPLP8y4zPpmstl4igib5+7gWUThtp
         AGYsGr8QhDcIWxuKeci0we+1S/HuQjL1ML4G3Yr0KdeFkPEVdaNeBtLeEIdATq+g68nd
         5tmnNR4EtQ45wfeUNKlEsNWKYcUszx5Ju0+feRDjDELqD3Wu1jFlDjFLW2ueFPNAXRPa
         qa2VifVYkACZQ4TK9YLXXhG0X5E/wPPB7bzQ79UdXudBgUHaj7cs2cbRjxRXuDUqMdfP
         xlzV3cdQRMcQNmzmi3T39j1zivgtvM88x/5pnJQGahEdtOm2PLhat5AeowyPhtZhTHrV
         ASjA==
X-Gm-Message-State: AOJu0YzL1yK6jdbMhxwYZvEHH1eORJUmrlI6c1WMrufU9S5Vfps8mxAO
	v3y/cY8J89H6Pxw0/5bp3AvgUWaFak9LoyUq3LdJi/pHzMZI4ZOKY64Ldwxl17I=
X-Google-Smtp-Source: AGHT+IFSEBr3A1Hb4kZ6Uoqa+BNrIGvPMrv11aNGujvi6Oz3xEYScu/AkeyKpl/x8eE2zWMKugZUbw==
X-Received: by 2002:adf:e791:0:b0:374:bec7:8f with SMTP id ffacd0b85a97d-374bec700f2mr11295094f8f.28.1725451030820;
        Wed, 04 Sep 2024 04:57:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:99f4:e9dc:3777:c785? ([2001:8b0:aba:5f3c:99f4:e9dc:3777:c785])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c07eed5dsm11527510f8f.116.2024.09.04.04.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 04:57:10 -0700 (PDT)
Message-ID: <3bb72a1e2632be40fc1e78450b09e16e15f853ea.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] bitbake.conf: DEBUG_PREFIX_MAP: move
 STAGING_DIR_NATIVE before STAGING_DIR_HOST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 04 Sep 2024 12:57:09 +0100
In-Reply-To: <CA+chaQcUf_Uw=uQD0fdheV_Cu7ohrpk6qudfaadBYz4hGZBMvg@mail.gmail.com>
References: <17F17A442A5285BD.17352@lists.openembedded.org>
	 <17F1F7644487505D.17352@lists.openembedded.org>
	 <CA+chaQcUf_Uw=uQD0fdheV_Cu7ohrpk6qudfaadBYz4hGZBMvg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 11:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204201

On Wed, 2024-09-04 at 08:53 +0200, Martin Jansa via
lists.openembedded.org wrote:
> Some related info I've found now:
> https://reviews.llvm.org/D148975?id=3D516863
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109591
>=20
> maybe affected by -fcanon-prefix-map used since gcc-13:
> https://git.openembedded.org/openembedded-core/commit/?id=3Dabe97fa74b10c=
2c71d79bc3573d4edb509b111f5
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108464#c8
>=20
> and I was also using ccache which used to have some issues in this
> area (but the python3-matplotlib issue is IIRC reproducible without
> ccache as well):
> https://github.com/ccache/ccache/issues/163
>=20
> We might need more experiments before this is applied (I'm glad I've
> sent it only as RFC). I'll try to find some time next week.

I'm a bit worried that gcc might apply the ordering one way in some
locations and the other way around in others so there may be a bug
lurking somewhere. I agree we should look further into this.

Cheers,

Richard

