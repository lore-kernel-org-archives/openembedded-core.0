Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48A2C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 12:37:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.11873.1700051844293605007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 04:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h1L6g9LL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40906fc54fdso55434445e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 04:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700051843; x=1700656643; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksIeclD/Va2rLC9jtFhHTf4GRs608B7nsdjTAcUaQgI=;
        b=h1L6g9LLOv/kFNmpeXjuuhp9PdVajfV4s9Pzf2FjcyNn+Zn7/9YTlXOe9YM2BjFRXI
         M/8AJ0Ntta8V9aMUvGwRPFU4JFmi0ov0Src11Vn8NeKV8Zq2OxZiRNRE12QUP8LCP+8r
         ySAuFZ2yMEM3lHcKHfMG1FiV/yQHnuxcuKeL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700051843; x=1700656643;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ksIeclD/Va2rLC9jtFhHTf4GRs608B7nsdjTAcUaQgI=;
        b=rdmrhSdtHCBmI7u/112Lg0PnvMTZwjRoC71miBuMj6Asbqs0rORfN2MJshJjMLiCYp
         u9g+OF+QU3rEVJeOj40sMypqBZd3ayANOmy+UrduSDlcUPzvrIm49/72b0LDElWYvQWb
         RPTqSe2LT9QPw2WTEEkgJqcL+MF4pXxg/fS3zAPKGZcU9z6ExXcFIZZeEhqkPxyzU+CB
         quGKYnpHBhyATS22yrqLvkOuux1Xcy3IWQYL3q52Mx7XEMm//CFvU4W+LQL/ZGtO01h3
         zmk49Rm1Tgmw4taYxBDWoc3vF6pu+BRjiunDAaWyyin/xwrGCJPs5WagC0MJjlwPaVwc
         lQjQ==
X-Gm-Message-State: AOJu0Yyrp+ZtXSWRWjJAdVg9bD0jp+JRh5Zx0yMqQrzdFp8NQfF/tmlA
	mdSLcG8eNM/15siaNQOEE5pe/4SdCWZ83js9m18=
X-Google-Smtp-Source: AGHT+IEg4kCnJrYhrYHqszeWhiS+ix29a7+J86Y2XFmgslXH3kVdXehc0EE0dhnFWzKzGF6EESBmew==
X-Received: by 2002:a05:600c:3b8b:b0:405:348e:aa43 with SMTP id n11-20020a05600c3b8b00b00405348eaa43mr10747674wms.12.1700051842657;
        Wed, 15 Nov 2023 04:37:22 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bbf9:c35a:2291:eb7c? ([2001:8b0:aba:5f3c:bbf9:c35a:2291:eb7c])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c021000b004060f0a0fdbsm20293465wmi.41.2023.11.15.04.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 04:37:22 -0800 (PST)
Message-ID: <479f742da1557615f8ce6b30bdeda341f2cdd4b5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] vim: Improve locale handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Polampalli, Archana" <Archana.Polampalli@windriver.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Nov 2023 12:37:21 +0000
In-Reply-To: <MW4PR11MB58224AD271C46B0D27AABBF684B1A@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20231114233220.2567795-1-richard.purdie@linuxfoundation.org>
	 <20231114233220.2567795-2-richard.purdie@linuxfoundation.org>
	 <MW4PR11MB58224AD271C46B0D27AABBF684B1A@MW4PR11MB5822.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 12:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190592

On Wed, 2023-11-15 at 12:11 +0000, Polampalli, Archana wrote:
>=20
> Hi Richard,
>=20
>=20
> I am planning to send Vim upgrade patch for all branches.
>=20
>=20
> Could you please confirm Is it applicable to other branches as well,
> if yes please confirm are you planning=C2=A0to send other branches also I=
t
> will avoid patch conflicts to further vim patches.

It is applicable to all branches and I believe our LTS maintainer has
it queued for them already.

Cheers,

Richard

