Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC92C3DA78
	for <webhook@archiver.kernel.org>; Sat, 14 Jan 2023 17:02:33 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.120299.1673715747606395519
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 09:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FrF9Hpy7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id b5so2565952wrn.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 09:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ef/CNBZ1rN0iIuxOqdl6DTztxFB444yMWIG8kkXyHr4=;
        b=FrF9Hpy78uCqgvufcVyQhBIdIbU7HTwnWGLyQ5Z+XZ8AvJiz+TZnnYYcPKP9OQ7LMr
         S29YnlaX1FOvv+9LTtKjt4C09mPUaQmQDhyhqyiW9O7Rdns+mscMD9NJmE7JLtBwf4VR
         JLjeLTc0X69pXjXEd7Z+lWdAMZ2c4NQ2e2cg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ef/CNBZ1rN0iIuxOqdl6DTztxFB444yMWIG8kkXyHr4=;
        b=pNNMQHZ3zrZ0IySVXRljHl05FBn4q6u7JT0OIA4YFZ2gqjlUpbrezQTTs+1i8WUfmr
         McvUX8B7ZIHA8yecJCVX6uDHtKPOsKDwWDNoc+vWLl+T/smzphnjrD+kX5C2l2Ob76M6
         wCDl7COmMn8Xoeaf6JQmhg02OB0n+yHm4DQ524J6WWVaElNn+Dvms/l6GL/VpgRIVyD/
         DHsydECijw7jEuhuGeMbUPdiST4TDNLkp95YZEBmr/IU4holzVaGS1TdDSF0DB/ttD71
         MiwipMe1yFYoQbHiK5y77JRkON33fRD4YmIXt3gvkMMU9nnyURpB5e0PIp+dug7im7bA
         NP0A==
X-Gm-Message-State: AFqh2kq9gHb4kTHD0xTmoYrTZPpHlVBADd/u0FJUOdkLolrnvsOG5cxu
	KDNOdfN+1Uk4X1lsiflCYZxH+Q==
X-Google-Smtp-Source: AMrXdXubPA7BnmfHMcOQTCx3RJUlm+3utETeaACySn4gEO6EHkrf1wpAbdjxwkUaMkyuBQsecFKRDg==
X-Received: by 2002:a5d:50ca:0:b0:2bc:846a:8eb2 with SMTP id f10-20020a5d50ca000000b002bc846a8eb2mr14082095wrt.11.1673715746116;
        Sat, 14 Jan 2023 09:02:26 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9575:dc1:804e:bc61? ([2001:8b0:aba:5f3c:9575:dc1:804e:bc61])
        by smtp.gmail.com with ESMTPSA id r9-20020adff709000000b00291f1a5ced6sm1063313wrp.53.2023.01.14.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 09:02:25 -0800 (PST)
Message-ID: <3947c8fbe920b1fe97b1a933ef5f4e32e8fe174a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-good: Fix libsoup
 runtime dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Hochstein <tom.hochstein@nxp.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 14 Jan 2023 17:02:25 +0000
In-Reply-To: <20230113225155.1730922-1-tom.hochstein@nxp.com>
References: <20230113225155.1730922-1-tom.hochstein@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 17:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175857

On Fri, 2023-01-13 at 16:51 -0600, Tom Hochstein wrote:
> The runtime dependency on libsoup set via PACKAGECONFIG does not work.
> The problem is the dependency is placed on the main package, but the
> soup package has no dependency on the main package.
>=20
> I considered modifying the call to do_split_packages from
> gstreamer1.0-plugins-packaging.inc, changing extra_depends from '' to
> None:
>=20
> ```
>     extra_depends  -- extra runtime dependencies (RDEPENDS) to be set for
>                       all packages. The default value of None causes a
>                       dependency on the main package (${PN}) - if you do
>                       not want this, pass '' for this parameter.
> ```
>=20
> However, the problem with this solution is that it does add the runtime
> dependency to _all_ such split packages.
>=20
> So, fix the problem with an explicit runtime dependency.
>=20
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-good_1.20.5.bb      | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

This threw a load of warnings/errors, see:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4792

Cheers,

Richard

