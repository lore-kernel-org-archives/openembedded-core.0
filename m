Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA0AC7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 21:27:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.83.1685741252254202158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 14:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=NAFPIDzc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-30b023b0068so1969345f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 14:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685741251; x=1688333251;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1/xFRmedFI0jElhMe88D96QXyo4oX/po3CwdUYQa0uk=;
        b=NAFPIDzc+zHNEeEv9R7j5J9bFHzn8jI9hs67So9wlf7Q4w+Wia8hvlzBmSk2yvevUC
         Ux5fD9Me7it48e4EvotSo8u5mPfL3eqi/3tCV29ZwUd29YXVH5Gj01HXYrmMsHNqHn1+
         vZKyaiUhNXwJX8VL8NPr7HHDoj2eUux4k1lZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685741251; x=1688333251;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1/xFRmedFI0jElhMe88D96QXyo4oX/po3CwdUYQa0uk=;
        b=kGKVGcW3yCV2USLiUNpafOcuZYTADIUrElJMSRCaW1dBlhj2Db22S/pfUPyV4plGRV
         drHY3oHtna4ODk4tJaR3GFcgwVn4IBIu1cdVVXxDA7eZxktGj3mwXx7O71p/lm9BMSZc
         121pdAZTwHCtklMn3f/7ntLi12VDHFrDNGnIMvcaEGQS5iElL216HQJ6bKHCr+KXw/1z
         Ada790N8cmAreHvxnDJyRzvpIVF/gxkGQF5//RmrPTlKF5drFOk55RxM3ZwjxlOV3TA9
         lAFgrPUPYUhGxYhI6pgb+bJgc17nP5VElAMbs25qFgcRhkQguL8Vkc9cgeWJSzNDAHtw
         vi0g==
X-Gm-Message-State: AC+VfDwCqoaKxKA6PKFF0pV9xj8C0QfQtfVZ5C6Zgr6iioCuTqEYhF6p
	uqUwLZQigGtPRZdnDU6agmJNbA==
X-Google-Smtp-Source: ACHHUZ71LkDwibWjFjTAI4Digke5Yj6GnMZQLuZ5gyTPGkvHviO4Ewh0Zi0bNeYkSWLN0Mr5GEqU3g==
X-Received: by 2002:a05:6000:4f0:b0:30a:d278:5682 with SMTP id cr16-20020a05600004f000b0030ad2785682mr740128wrb.7.1685741250694;
        Fri, 02 Jun 2023 14:27:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a5ef:205d:ab93:38e4? ([2001:8b0:aba:5f3c:a5ef:205d:ab93:38e4])
        by smtp.gmail.com with ESMTPSA id k9-20020a056000004900b002c71b4d476asm2648397wrx.106.2023.06.02.14.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 14:27:30 -0700 (PDT)
Message-ID: <f3be9c663e6a141695cb71215b1f91ec1a3081a4.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3 1/3] cve-check: add option to add additional
 patched CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@gmail.com, "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "rybczynska@gmail.com" <rybczynska@gmail.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "mikko.rapeli@linaro.org"
	 <mikko.rapeli@linaro.org>, "Marko, Peter" <Peter.Marko@siemens.com>, 
	schitrod@cisco.com
Date: Fri, 02 Jun 2023 22:27:28 +0100
In-Reply-To: <820f56354ef339f1b2cc10e379d6c7a3988d889e.camel@gmail.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
	 <20230519062420.37015-1-andrej.valek@siemens.com>
	 <CAApg2=QtoHacGg6sXs+dsVZ6jg6VnyuepkSVTWhCNY5YrmMv=g@mail.gmail.com>
	 <ZGsghWIXfholEAdA@nuoska>
	 <19c1472f11e4f1eef2c8dbe52926510830408d4b.camel@siemens.com>
	 <863cf26da9230367daab70ff37b8196dbef7b8a7.camel@siemens.com>
	 <7ec035c989c9655738e01c9dca041594c5aa8678.camel@linuxfoundation.org>
	 <820f56354ef339f1b2cc10e379d6c7a3988d889e.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182341

On Fri, 2023-06-02 at 23:10 +0200, adrian.freihofer@gmail.com wrote:
> I like the VEX proposal from Sanjay.
>=20
> - It is a standard that can be supported by many tools and requested by
> customers. One use case I see is where a vendor sells a product with an
> SBOM. The customer can then match the open vulnerabilities to the
> current state of the NIST database using a standard tool based on SBOM.
> Aligning the categories to a standard would be helpful for this.
> (Yocto's CVE check is great for Yocto, but cannot be used independently
> of Yocto.)
> - A minimum number of categories is defined. All details can be added
> to the REASON variable.

I think you could map some of the status items I proposed to VEX
statuses but I'm not convinced it makes sense to go directly to that.

Anything we don't have a status for is effectively "under
investigation", anything we don't list is fixed or not affected and if
we know something is affected, a fix would likely follow very quickly.
The data set doesn't really fit what we're able to do or the wrkflows
we can follow, even if it is what some product customers would want to
know. Part of the issue is we're not the actual product here.

Cheers,

Richard

