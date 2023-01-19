Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC254C46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 14:40:31 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.46641.1674139227994847384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 06:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZXDPfSAK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id bk16so2056878wrb.11
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 06:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UkVvglUdU1WGYUf2A1Bf5ELQuI/zq4sFdaNmz6w4Aqo=;
        b=ZXDPfSAKiOBzS25p63iTJ3orxWFW0rhWJe0GqLNRfHMFtY5Tp5rEigj51O3GEAcO2Q
         wBVqBUVvCN/yj9K/Olg+Toh45gR429c6gq40cj6iWOAjg/8rCEoY5i3pLAqU04cboOlI
         9MmTV2RhIUnxY0Io5iKY7Qgn7z36cCOzBjQWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UkVvglUdU1WGYUf2A1Bf5ELQuI/zq4sFdaNmz6w4Aqo=;
        b=ZFxk9iCiK7tefT+3jUoQL4bUiB4QYxxXWLf8KXG+4wV06m6jejP7MygUeXsMcXbagz
         iIYw4PNHYvfx7fZMhCJT5h9bFAeY8s1ETmR9JOmWKLImX6SS+31P5sVERuK7dWrr7QY+
         Q1tzBUhlaAf4H93ivB2zh5uVYPe0SL2lznXGZUoxmGCz5p7F9++E+bqtz88ov4sn6Bmr
         7DYJWDFz1Lns1RSfjC+RBAmbufvncmcEFF72cOnLl0rs8h2y3TO8obdzOpGCH8i/Zwa4
         8DDBO7lvGDdbgkuOL5gSB2mZtEGB2j24U5NBvdKqrtxrKjGWq/GKps4lk3vciwoi7OM+
         Z8pA==
X-Gm-Message-State: AFqh2krlc5jt3woogEvVzLASRTv/KIXKMj1Y93MXuznPQzSv9jxmiUFW
	1/F4ZPw9p2K5ierOw6kLn7oCqw==
X-Google-Smtp-Source: AMrXdXvOpZHoiNiM/59dnCbIS3Gx66/IWWIhul2LvE7j2HT3apRruDgDoFnldYDVIWRqa5oHcVpjDg==
X-Received: by 2002:a5d:4a8a:0:b0:2be:50b1:c13 with SMTP id o10-20020a5d4a8a000000b002be50b10c13mr543480wrq.45.1674139226256;
        Thu, 19 Jan 2023 06:40:26 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bbd2:83db:332a:f7e3? ([2001:8b0:aba:5f3c:bbd2:83db:332a:f7e3])
        by smtp.gmail.com with ESMTPSA id w8-20020adf8bc8000000b002bdc39849d1sm22016482wra.44.2023.01.19.06.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 06:40:25 -0800 (PST)
Message-ID: <6597547835fc9c22bc2267362da8c1a84f2fce68.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error
 handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Jan-Simon
 =?ISO-8859-1?Q?M=F6ller?= <jsmoeller@linuxfoundation.org>, Anuj Mittal
 <anuj.mittal@intel.com>, Scott Murray <scott.murray@konsulko.com>, 
 openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2023 14:40:25 +0000
In-Reply-To: <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com>
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
	 <20230119102423.3493565d@booty>
	 <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
	 <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 14:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176141

On Thu, 2023-01-19 at 08:55 -0500, Bruce Ashfield wrote:
> On Thu, Jan 19, 2023 at 4:57 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > Hi Anuj/Bruce/Jan-Simon/Scott,
> >=20
> > Please see the links below. This patch, pending for master triggers a
> > few warnings in a few layers as there are a handful of patches with no
> > Upstream-Status present in them.
> >=20
> > I know this kind of thing is annoying but it is probably worth starting
> > to give the wider community the hint that they should document this,
> > and if they do document it, it might remind them to try and submit them
> > too. You're not the target audience but as layers being tested on the
> > autobuilder you get to lead by example! :)
> >=20
> > If anyone doesn't want to tweak things to fix this, we can disable the
> > warnings for that specific test but I would prefer not to, I think this
> > is the right thing to encourage. The numbers of issues are low and
> > easily avoided one way or another.
>=20
> I'd prefer the upstream-status check to be disabled for meta-virtualizati=
on.
>=20
> This isn't something that I'm strictly enforcing, and not something that =
I
> want to start strictly enforcing.

I understand and will see what I can do to change the configurations, I
was hoping to avoid that.

Just as a heads up, there is an open action for the TSC to discuss
which QA checks shouldn't be bypassed for compatible layer status.

Cheers,

Richard

