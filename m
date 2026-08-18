Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69846C5DF7E
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 12:18:21 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7648.1787055496547081070
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 05:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NsKovbBE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so41670085e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 05:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787055495; x=1787660295; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5Qpc827fcZ6fDL0xnYoUlWCLfwi0zNpGA6Iq4EwpLUE=;
        b=NsKovbBE+wVBh8aGCwKaiBAuzMuN/Ocsj24SNb5PMWZ4/t5EmLWk1R+XZfuo5+gNL+
         3NLVv1ro/iK4EEaelZGpSlad0v7HYyXxQWjVwu7rfyQ3SOwE9dEtgL4OJoF1ono5byqs
         MHH52ackLX6TRz73RoqNUEhRQ+43yHfhnBR2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787055495; x=1787660295;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Qpc827fcZ6fDL0xnYoUlWCLfwi0zNpGA6Iq4EwpLUE=;
        b=Tu32bRSa6MiWFA9d6ck1P5JAkp0MD/6pq+Gkqg7D4LWlH0EBtNH54WelI/pZbXAO8X
         6has3c5bhJiF6ONQ9eGWO+vd6YX+6qUwJV/IqTjUxsWCgF6JuGJ+ToS00ud+UY9Sx/EE
         +NhuSAd2R3cJtkue8BbdE4OKGkOF8qfdqd9GQqV5KD7REwphOGgLoWrKC2/v17X/hDzj
         VPyBbxc/J1bfBMCWrXaeRs/vOXmnxLj2cShnwz9afsdNgBwDpT7gEU0peFal5Bg0JXP2
         TsTfFRDTMlJpDmQzcJP79qNLYm/W0vxEi6p+/HYWOzcXT6LxV0rNflf9UJT5CnKbMxEt
         ZdaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPDsALyizIAQfLtFgDCW2NLObrZRxGUF3heghiCb5x0BultKqaFpfAqWSll8BEEoLGXODKU2v5U2E2POUmm1tVXw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyJ5WbZl+qNYny/FuK2SzZ8XSBMJYjfhCszcirLedBpQD8ctXZq
	pnQNfc5KCWfU1rhUQzvAL9gGxxItuPYElq97ml7hbCDQ6eihPLV8ahVXRAWY96ntlA+Fl3WCJhL
	EI67+SBA=
X-Gm-Gg: AR+sD13NvdOFfHD3WocVnTXCFmEHZFTTDfBgoAgRgxlFOvI8GMBgEny/MN1V/N+ZS1f
	gqTaXb0Z991CqJcuQTBqj0uOe9KA/7vrFfucD7SUh5YYcd5QimxNv0RkEeAagfxQ0pmdRIUUHg6
	GKrkrGpzb0LJ23uKJuXjqiusKks1LEzQMteYqlwU4g1RBsEUUV6w7TevbaJi/saUnQmQPzBHi9S
	3w9CC7eOD4UsV1uO5i9ja1XHsPId86qdaDfMAqYtlKpIG9zNKeKpDps8b4gOVXX3XU0Ib1BhPaJ
	QTZouRAbt7b+lHvp5r2QXEgP1nNVyA9bwbGC3TpQXIsADfDde5urEo3Ogxeurk6ZZkgjQ3ul4co
	Z+0vlk+pT8X2nKBZ1yO3EsicmseUDFq08vqdV8MZW/YiRV6u8P9RiVw+jQX6qkRjXqw6ASQkB6g
	a/Z9M5wo7zlaENGLhVjQyhk6+fn6uGmGFxHcAHJGkqF3rZIzlqFZ/k05zg7KBshVy72fMrTstC5
	Jng17IXh/b4eHONYkMRXubd46YpUac/BkRziyjYHLmBAn8Q6X7QkSP4EfVa8+Uc
X-Received: by 2002:a05:600c:1f91:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-4998797d111mr450430545e9.15.1787055494551;
        Tue, 18 Aug 2026 05:18:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ee4b:f6b4:d308:732d? ([2001:8b0:aba:5f3c:ee4b:f6b4:d308:732d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996100082sm326815295e9.2.2026.08.18.05.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 05:18:13 -0700 (PDT)
Message-ID: <bd1815271e8babc6248563bb7b8da5adecfe55a0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-pygments: update 2.20.0 -> 2.21.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, Mathieu Dubois-Briand	
 <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2026 13:18:12 +0100
In-Reply-To: <DKRWWL8NYSSQ.2TTCOYTRP2AO7@bootlin.com>
References: <20260817-update-pygments-v1-1-da836eab9640@bootlin.com>
	 <DKRTRX9N7CAV.1AZXJ5P8QS36Z@bootlin.com>
	 <DKRWWL8NYSSQ.2TTCOYTRP2AO7@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 12:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243676

On Tue, 2026-08-18 at 10:04 +0200, Antonin Godard via lists.openembedded.or=
g wrote:
> Hi,
>=20
> On Tue Aug 18, 2026 at 7:37 AM CEST, Mathieu Dubois-Briand wrote:
> > On Mon Aug 17, 2026 at 12:13 PM CEST, Antonin Godard via lists.openembe=
dded.org wrote:
> > > One notable change from this update is the addition of a Bitbake lexe=
r,
> > > which will allow us to do proper Bitbake syntax coloring in our
> > > documentation.
> > >=20
> > > Full list of changes:
> > > https://github.com/pygments/pygments/releases/tag/2.21.0
> > >=20
> > > Tested using this version for the documentation with our
> > > buildtools-docs-tarball recipe.
> > >=20
> > > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > > ---
> >=20
> > Hi Antonin,
> >=20
> > Thanks for your patch.
> >=20
> > It looks like this upgrade might be breaking some ptests, for a lot of
> > python recipes:
> >=20
> > Failed ptests:
> > {'python3-click': 'START: ptest-runner\n'
> > ...
> > Failed ptests:
> > {'python3-xmltodict': 'START: ptest-runner\n'
> > ...
> > Failed ptests:
> > {'python3-webcolors': 'START: ptest-runner\n'
> > ...
> > Failed ptests:
> > {'python3-wcwidth': 'START: ptest-runner\n'
> > ...
> > Failed ptests:
> > {'python3-uritools': 'START: ptest-runner\n'
> > ...
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2181
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4294
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4311
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/986
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/967
> >=20
> > Can you have a look at the issues?
>=20
> I don't really understand it yet, the issue is always the same it seems:
>=20
> =C2=A0 '"/usr/lib/python3.14/site-packages/pygments/util.py", '
> =C2=A0 'line 13, in <module>\n'
> =C2=A0 '=C2=A0=C2=A0=C2=A0 import html\n'
> =C2=A0 "ModuleNotFoundError: No module named 'html'\n"
>=20
> Yet the html module is provided by python3, and does show up in
> python3-pygments' sysroot when I build it:
>=20
> tmp/work/cortexa57-oe-linux/python3-pygments/2.21.0/recipe-sysroot/usr/li=
b/python3.14/html/

Those are ptest runtime errors (i.e. an image booted under qemu) so
probably a missing RDEPENDS on a python module somewhere...

Cheers,

Richard

