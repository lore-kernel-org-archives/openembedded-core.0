Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27307C35FFF
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 09:11:20 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.3578.1742375470175857170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 02:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IWpuFYCa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so28966205e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 02:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742375468; x=1742980268; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvsG9nSbEULJBKqkSKLXw+OL3wrGtlziLpuDYC2fTKk=;
        b=IWpuFYCa0t7R2m7AbA04MvK0pOvKA5qksZICiMWpCWY5cAZPyuTcKVAZWkBsp6/XAW
         h9g9YkcyQC2GYIxA8RN7l7e2eZldnW1v3PdJlgHLA9Sp1MPBkcotd2s0qADr9sk1R0sB
         x6qz0BBMrRMzSDeh3zGdxfxqT4kc4uTQM7SNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375468; x=1742980268;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SvsG9nSbEULJBKqkSKLXw+OL3wrGtlziLpuDYC2fTKk=;
        b=p4ekvg7CWZcFpLed/4g1oabSpVmW3zLBBs6/5sor43ElYsD97lTqQ3QSbvZDXbFAV6
         jxLFVZcRb6SaMbKnwHFvMEtzEPq8RqwOxw5ys2ZDr4jDoBhvX5dImDm7/gE0BHLpQsJq
         /GcHuR1Esz+iZ8yK/Cz4G1B/9/opwYqjmNv8mAcmsxJiVaedIHz9IAHSUIj0thkCqdVg
         3ddUNcoGVK4e2968DS8gckIkK14ErSP476dtiYngfndAk+NDWmMA+ovpVbonL0EnQoNi
         U36/0DQ7IyccDNsCQd3N0aNbj0Cd0NJIZvxl57Q9RjAJQODUf1QicMA2q3oIgWp68E7P
         q1CA==
X-Forwarded-Encrypted: i=1; AJvYcCWoqul+2bX5QSZDmRzd32aASCHtYp7Iupunpeo3EvTrRvmA76GXtZqBfzu9/8jSrKZLpOoz+DdfLWmdVXn6RIyjvg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyDa07NjAvZaTVZGZyc/SCuGmh+NsHi/icfBNNgsU/BKhWksHeZ
	Wda+YLIsQwJUYSGd8nfAslRXCIT5dxE+lhdrsW2yL5pv7uDzXM2ntOig+C+CODg=
X-Gm-Gg: ASbGnctmN5vDp5AEsLyHhjYT6YfGXwI3bAzuD4RAu5j4Aw/KkFsLC3TPaD9n/ZADHqO
	zJAv7+0b+NwLxXtTDJkPO0FQ0yS/g5hWaSqzqS0u9Gtp0iBpuVGkyDhwmwaKSpC5F3tnSntNv4X
	G31iB4fGiLQld9SSRCJbNjDn9J/qMlMyzL4yyX3e1WfDoayHyzzN3p/1O8wVWlerqaDojpaGtSr
	6ul1y7qQy8P/fCp4VVOBqpImby5P7O/Kt6V7K3pdrgQWeUanCQAl35zX5Vq/3jZu84Ef+J64PCs
	Vj1+LItgzNplEMrTcUFfrX6ZEJbNuisf3UWYyWkAMBlHWYaZKUv2xtOX1NE4fnM6OCwWkSmU3uU
	+I035UgK+FQgsp48Er1SH3TjQF+m7tcM=
X-Google-Smtp-Source: AGHT+IFoMF1RCDu8289gSqY4Ml7DEMwGEPHdTqz+awzK2xWf0r58CZISsVT9D+0jGVmpIUCpf55dDg==
X-Received: by 2002:a05:600c:4252:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-43d4454b284mr7811595e9.23.1742375468313;
        Wed, 19 Mar 2025 02:11:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dad:b471:9c34:4577? ([2001:8b0:aba:5f3c:dad:b471:9c34:4577])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f74c8esm12766445e9.30.2025.03.19.02.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:11:06 -0700 (PDT)
Message-ID: <df7ca8af2883c0b3974df9f95a29be827e817516.camel@linuxfoundation.org>
Subject: Re: [OE-core] Issue: /var/tmp does not persist due to /var/volatile
 being tmpfs in fstab #scarthgap
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: vs.yocto@outlook.com, openembedded-core@lists.openembedded.org
Date: Wed, 19 Mar 2025 09:11:04 +0000
In-Reply-To: <29973.1742340247475380282@lists.openembedded.org>
References: 
	<83c9c92162d9c0bc1387c633f1464e67f57c70bc.camel@linuxfoundation.org>
	 <29973.1742340247475380282@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213311

On Tue, 2025-03-18 at 16:24 -0700, Vish via lists.openembedded.org wrote:
> Thanks for the reply.=C2=A0
> =C2=A0
> Do maintainers recognize this as an issue with having this as default
> option? There are chances that similar to us other devs/orgs are
> planning migration in phases to Scarthgap considering Kirkstone
> getting updates, so this could potentially become issue for others as
> well.

I recognise there is an issue when behaviours change. We can't change
this in that release now but I would happily see patches/updates to the
migration guide and release notes making the issue clear.

> We do have sizable amount of edge systems in production with various
> CI, and this change broke an important feature and took some time for
> us to find root cause.

Sorry it was a pain. If you are able to check the state of master
periodically, it may help head some of these kinds of issues off.

> I believe correcting is still a proper thing to do and can be planned
> during any releases.
>=20
> Additional reference -
>=20
>=20
> https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s15.html=C2=A0
> =C2=A0
> Also, it would be good to know what scenarios were considered with
> this change, probably we are missing some context.

Traditionally, OpenEmbedded was used in resource constrained embedded
systems and all "tmp" space was transient, not persistent. This
configuration is in keeping with the project's history.

Our approach isn't entirely against FHS, it is just not quite what
other distros do in our default config. There are other areas we do
differ from FHS too.

On this specific one, we support two init systems and I think the
configuration was mismatched between the two and the configuration
options were hard to get right and not working in all cases. There were
various patches over the last few years trying to make the docs,
options and init systems match up and be configurable. I suspect
somewhere on the way things changed in a way that wasn't realised.

The project is crying out for maintainer and review help. We do the
best we can with what we have, like most open source projects. An
implication of this is that where patches are submitted and nobody
objects and I don't see/spot any problem with them, they can be merged
even if there is an issue we didn't realise. We do the best we can.

How we react when things are merged depends on the circumstances.
Scarthgap has been out for nearly a year so a major behaviour change is
not really an option now. Even for master, I think the situation is
relatively well understood and more consistent now so any change would
need to demonstrate that isn't the case and that a change would improve
things rather than further confuse people.

I don't know who you work for but if you are able to help support the
project through patch review, recipe maintenance or anything else that
be nice. Alternatively, project membership does give us funding which
allows us to help in a different way too if that is an option. If you
don't do any of these things...

Hope that helps give some of the context.

Cheers,

Richard


