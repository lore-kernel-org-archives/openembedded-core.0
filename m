Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB84C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:36:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.19918.1702031767351180270
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:36:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FrgXyW/G;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c31f18274so8620365e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702031766; x=1702636566; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LD7vFIfceTwtjV5KJV0PjLnXIGwsPXifBLCBP/TlMvI=;
        b=FrgXyW/GSm94tIfex4aBt5eAR0GFYUQ3OBsN97eQk/GOmcEl0XZiwfAbMo41taBTeL
         zE3W5trWMXCsyVSQGEiS5ZI+X/fUJ0gu3jOPcSJbYJoowmjxM9BrRXMsGoIcpbLvglnC
         zI47+vMPZMpfEqkb69JVRy52ajZaDoBnXUiFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702031766; x=1702636566;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LD7vFIfceTwtjV5KJV0PjLnXIGwsPXifBLCBP/TlMvI=;
        b=bdFwnXndV3e0glzgKn9vtVzW4xgIAfCCVU8fAcc95255PTQHRp/RN8wpztLl+Y8+cc
         KuHd60ehw6E4YvdtY9jsDHK1vEU/A9EXjc/xUIiZb9TfU2hkeh/RwNx/ulId5XOnGudU
         TSyKBOWx8SEB0IZ0n8qCKAa0NVwm9aL1pVyMSL+Qy/xwfb3b5RtpAD/RxGIn4KWckNNP
         46556dcrQJXsE00v8nyJ74c0MutSJyzJcqH4uUOJVPh9b5PC/fiGt+6LP+yTGQeafxCW
         y6Zrmy/H+pJ7flUusegXSAvSBXS6iSgxuI0gIMGOSBa40KMXhco/eJdsajdytJy8bh9I
         o7gQ==
X-Gm-Message-State: AOJu0YwoZN02gdgncip85/OPDVldJZbcQr7l07CXYuLpOxGKIYx2kuw/
	JZFQ7msF8nO8peAneQ7LrPR6KQ==
X-Google-Smtp-Source: AGHT+IH1AobHQY8ptBHQhYI12YL+6rBxGFO7Xj4lFvgpHOgRN2LF/jSXh2j/h3PYgW6c9FyxYNp9gw==
X-Received: by 2002:a05:600c:154f:b0:40b:5e21:bdb4 with SMTP id f15-20020a05600c154f00b0040b5e21bdb4mr2241720wmg.67.1702031765337;
        Fri, 08 Dec 2023 02:36:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b? ([2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b])
        by smtp.gmail.com with ESMTPSA id je16-20020a05600c1f9000b00405442edc69sm4748271wmb.14.2023.12.08.02.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:36:05 -0800 (PST)
Message-ID: <c5fcd8f57395287e09c9106609c73744874cc5ba.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/6] runqueue: rework 'bitbake -S printdiff'
 logic
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Fri, 08 Dec 2023 10:36:04 +0000
In-Reply-To: <20231208101522.198832-5-alex@linutronix.de>
References: <20231208101522.198832-1-alex@linutronix.de>
	 <20231208101522.198832-5-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:36:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192037

On Fri, 2023-12-08 at 11:15 +0100, Alexander Kanavin wrote:
> Previously printdiff code would iterate over tasks that were reported as =
invalid or absent,
> trying to follow dependency chains that would reach the most basic invali=
d items in the tree.
>=20
> While this works in tightly controlled local builds, it can lead to bizar=
re reports
> against industrial-sized sstate caches, as the code would not consider wh=
ether the
> overall target can be fulfilled from valid sstate objects, and instead re=
port
> missing sstate signature files that perhaps were never even created due t=
o hash
> equivalency providing shortcuts in builds.
>=20
> This commit reworks the logic in two ways:
>=20
> - start the iteration over final targets rather than missing objects
> and stop at the first invalid object
>=20
> - if a given object can be fulfilled from sstate, do not recurse into
> its dependencies; bitbake wouldn't care if they're absent, and neither
> should printdiff

Unfortunately this isn't actually true, the real answer is "it
depends".

For many things that is the case, however for example an XXX-
native:do_populate_sysroot, we would need the dependencies in case they
contain shared libraries, unless it is listed as one of the special
cases in SSTATE_EXCLUDEDEPS_SYSROOT.

Bitbake works this out using setscene_depvalid() in sstate.bbclass via
BB_SETSCENE_DEPVALID.

I suspect this is the right direction but it may need the logic
tweaking slightly.

Cheers,

Richard




