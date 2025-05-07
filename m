Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE5FC3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 07:59:11 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.3409.1746604742719639330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 00:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M8L4lNK0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so4299795e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 00:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746604741; x=1747209541; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MHxi2q5bcPaKQwpWtLqjOcqRl2ebuJyagnegslOVNIA=;
        b=M8L4lNK0le7xtsHKGi8iXG1TMuWY9epxRzrwTIBexzKlXE0f0XODzHG11Utf7l2e17
         SrjHs9s+xZLziKOkQ2n4qqDToYamfchRRO+p+3Z44fhatbQ9fYd+CruRUjLd/TdtDTDM
         qhVABX2LaSrrcxd5MulJM1sbDxYNkNYk420Fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604741; x=1747209541;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHxi2q5bcPaKQwpWtLqjOcqRl2ebuJyagnegslOVNIA=;
        b=qBw1zo6eW7gxW+dvlayKJfo9mYzYGh55q2I7QURMeLtt/sfQH37KRZOwqXHfBerhhu
         IWAzKmoF3CicZIeh7fpm1Mgqny3UhcaMggTLKnktvVyqh+sAV0ZdA3F2s96JnctHO+U1
         55KTIHAInq/vHpWdJDs6nAOkciVsbVlQ8ppnPramMOz/2Ejquaqibyopc1WhY/QszppN
         LEutsRp57AcYf5lH3J/8i93AZ6qWN70dO+fAor+W9WbWtxT4iv4WYL702AdrFOXjkS82
         JBoN97JDOZ6VDzAeekZ/pp84uE4Vrfogp8BITEEBgiCaa2iGk+FIkartK2RM0ycRCSOg
         Ft1A==
X-Gm-Message-State: AOJu0YxU5eSzsiu0RB/hL2Cz1Z9x4ONkqw2w6MRir2iKfxnG75WB6qXf
	X5zo9rHy+SrX4SvPGdjCWZQk43nLiNyJkZ1790ybO9rcQZjcv5oQY6eg+gBp2YY=
X-Gm-Gg: ASbGncv2fqYoVDyBzgtMiDd2OGfpS/1d3RsKl/ydhFA5gECLA9Yr3kFg8+eSB5agEpE
	nWFRkCrHiRBP+eD4DGIW4dzhHbva50F7NnrNIMEjQUoz19yixRvU1SdZBHechioQ3qRfIZe8zje
	TuMcQJY3BF6bAKblcyYiesYJWCGexaUfCjcYVCZYgNZJNMapqyE2VuwqH4DNU6iM7EVc6kwq54L
	/LfvWX5PjPZDeRiLgy/IJc0H5nRT/qHyq2Nh73ylpEXG+s81fy0CjXMa6Y6vEkq/I0J6uoeO8uo
	3f1MiuRm9gn16Pip8pZz2L+MKlYwG4idZ5J4M7LE3tNRI4Z1XHb7Qpg1r8AEuIpE+DuYgGs+2tA
	nGdN6E50o/X+tk+pIuW+RCUnKQZA=
X-Google-Smtp-Source: AGHT+IFCmz4HoqeK1p5+vGzMzYCrsOjb2+KE/g0ZD/7K75V9zocbs07DB3mkowwosvtaz8jzf1Ucjw==
X-Received: by 2002:a05:600c:cca:b0:442:7c40:fda4 with SMTP id 5b1f17b1804b1-4427c40ff41mr8690285e9.1.1746604740784;
        Wed, 07 May 2025 00:59:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:12c3:1543:c9e5:5d2? ([2001:8b0:aba:5f3c:12c3:1543:c9e5:5d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d43cb5f0sm22782065e9.6.2025.05.07.00.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:58:59 -0700 (PDT)
Message-ID: <f108401a73fca43946481dd2488fbb05cd8540d8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/6] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 07 May 2025 08:58:58 +0100
In-Reply-To: <D9PRCP2WLN68.1VIO3IX3SQ7IH@bootlin.com>
References: <cover.1746548780.git.bruce.ashfield@gmail.com>
	 <D9PRCP2WLN68.1VIO3IX3SQ7IH@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 07:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216097

On Wed, 2025-05-07 at 09:42 +0200, Mathieu Dubois-Briand wrote:
> On Tue May 6, 2025 at 6:32 PM CEST, Bruce Ashfield via lists.openembedded=
.org wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >=20
> > Hi Richard,
> >=20
> > Now that I'm back at my desk, here are the queued -stable, configuratio=
n
> > and feature changes that I have queued.
> >=20
> > I'll be sending -stable updates to the LTS branches as well.
> >=20
> > Note: once patch #1 is in the tree and doesn't need any more tweaks, I'=
ll
> > send a documenation update. This is the patch that we need to enable th=
e
> > modular initrd work in kernel-yocto references.
>=20
> I took this series in my branch and everything seems to be fine so far,
> except for a warning:
>=20
> WARNING: linux-yocto-tiny-6.12.27+git-r0 do_kernel_configcheck: [kernel c=
onfig]: specified values did not make it into the kernel's final configurat=
ion:
>=20
> =C2=A0=C2=A0=C2=A0 [NOTE]: 'CONFIG_CRYPTO_CHACHA20_NEON' last val (y) and=
 .config val (n) do not match
> =C2=A0=C2=A0=C2=A0 [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/1565

There are a few, it likely depends which build built a component first.
I think there are three groups of failures, I've listed them all for
completeness:

Another qemuarm poky-tiny:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/50/builds/1564
qemuarm:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/16/builds/1563
qemuarm-alt:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/74/builds/1532
qemuarm nodistro:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/40/builds/1531


lttng-tools ptest failure:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/1445


genericarm64:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/60/builds/1549
genericarm64-alt:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/22/builds/1552

Cheers,

Richard


