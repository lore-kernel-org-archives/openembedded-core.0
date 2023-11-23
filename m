Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1B5C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 15:03:48 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.93048.1700751822898533948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 07:03:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IbryBZRZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40b34563987so5678015e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 07:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700751821; x=1701356621; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KBW6m0stGMdYw5Pu++QlzGNKITIuA9Xj8dQmVLvWqlo=;
        b=IbryBZRZVpD0Lgv9Qxf5n4XIR5v8CjI5qCrAP0+u0wKzF9M61bsln4DNKttySngMQl
         HsrLuldnEPGueqsk78aOXlxK+DH/5EwQcw1N7NCI2Bg16jxTo8filamonN2X4ovprUzk
         7n8Y4Pg1zUU/C8VVXemmKYI9E36XDYadc86HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700751821; x=1701356621;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBW6m0stGMdYw5Pu++QlzGNKITIuA9Xj8dQmVLvWqlo=;
        b=dn/dm4qqxYu2tyauFSUcGaHgFz/BQCk+GCuasDOgxlt2YfBS9bOzTCVLsFtMZDDIwx
         8EUeqERj+4c5cRXT3RXIUjP9ZyF9e0Hn/9EEC7p/T0pd/aSiU/HjO3+klLuqR/+NhIfU
         H9z0UvwInSy6KoBY6TPtWDyuCuKcnx3hmn4WqIEG9aWWMumbe5JTRIHyPl2t6XeZAzga
         Yio0052Bw0uUky9Vji5x2lrNyeumaTgnAfeDF06kEBe70De8uf5Ij1fEszecM/jTc0JN
         1nWcXo5QijD/lk4rD8wuztAtudXwNXJdlGVLvRVxTc7iLDkhv5uYNGRuCp0hDIEBGv8c
         Qi8g==
X-Gm-Message-State: AOJu0Yy51eswfnmshWUJyghQhX5+VW4E/EaAyiPT6haF3NoQVjwHyP9s
	n2iUFQY9ESoS6gxA2IcUjZpi2Q==
X-Google-Smtp-Source: AGHT+IEygnZferpo6SKyzTMRnPwpGx578x6sESJ9LCWNimVzcP7JAcyQsv18w7T3/2AjzxYUlMzRWg==
X-Received: by 2002:a05:600c:348f:b0:401:b92f:eec5 with SMTP id a15-20020a05600c348f00b00401b92feec5mr2593953wmq.9.1700751820883;
        Thu, 23 Nov 2023 07:03:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c511:4d31:367c:ab3c? ([2001:8b0:aba:5f3c:c511:4d31:367c:ab3c])
        by smtp.gmail.com with ESMTPSA id z11-20020a05600c0a0b00b00405c7591b09sm2258346wmp.35.2023.11.23.07.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 07:03:40 -0800 (PST)
Message-ID: <46771525c2282f66edbf766d3b9c7dd8abbc2147.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv3] cups: Allow to be controlled by root and
 users in wheel
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2023 15:03:39 +0000
In-Reply-To: <7NWK4S.WL0GC9LYMOPE3@t-online.de>
References: <20231120161848.1461683-1-f_l_k@t-online.de>
	 <aa9e1e82072027c73d4ce2b787a0a2cc9e4ada79.camel@linuxfoundation.org>
	 <7NWK4S.WL0GC9LYMOPE3@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 15:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191168

On Thu, 2023-11-23 at 14:40 +0100, f_l_k@t-online.de wrote:
> On Thu, Nov 23 2023 at 12:50:20 PM +00:00:00, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > This definitely needs more explanation about the problem being
> > solved
> > and why this is the right way to solve it...
> >=20
> > root could presumably control this before so even the current
> > commit
> > message doesn't quite make sense to me.
>=20
>=20
> With this commit the printer configuration in gnome-control-center
> works as i would expect:
>=20
> To unlock the printer configuration a user who is in the wheel group
> only needs his own password, if he is not in wheel the root password
> is requested.
> If the printer configuration is unlocked, all configuration options
> of gnome-control-center can be used
>=20
> With the lpadmin group you can unlock the printer configuration with
> cups-pk-helper, but then you still do not have the needed permission
> to make meaningful changes. You can only print ... Adding or removing
> printers or changing the print quality or paper size can then only be
> done via the web interface
>=20
> In other words. This makes the cups-pk-helper unlock mechanism work
> out of the box without further configuration

That sounds like the patch would therefore add wheel as one of the
groups.=C2=A0I'm still not sure why sys and root in there?

I'm guessing lpadmin is removed as it is unneeded but it does mean you
lose the ability to control printers separately from complete wheel
access.

Could we not allow wheel access to lpadmin instead?

Cheers,

Richard



