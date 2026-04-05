Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EE8E64018
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 09:17:46 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32287.1775380664301786409
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 02:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZsPZzPG8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cf7683a28so1787105f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 02:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775380662; x=1775985462; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q4smTfVrr7bBOt+Fjt0JNHN2wQ+ZULaANrUAY4zQLyc=;
        b=ZsPZzPG8tH8TWXzbhIKOxzWyTkR/FPqWRPRjbhhNM86Uq43Uqen+0Sp3thM07PaYhE
         ncl9Hg35OAZyUFy8lxjsJvWBxD/KACk1RNDWYj+fVF65O7qsN7uUZQiRiuM7uEW/Dtt5
         oJlDzF6laWFx4end7xH2uD8iPeJEwcewfy+D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775380662; x=1775985462;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4smTfVrr7bBOt+Fjt0JNHN2wQ+ZULaANrUAY4zQLyc=;
        b=PnawQrPc8J3FP42X8Nat+P/miLubskmW7vbnuntQCR/tztqBDKuiTTlLsM6LIk2/en
         C28uoz4Q0OV+Dyyl/AA99bRXV7ZgZYDfIQypYOilra2pPzE8GS0X15S5YgaKEf/BwaFr
         CgJ95dLBzdsJBVOlO+nzc+Vs8wCTSyvRYsgvXuGLAyzrDpFhzJadadFAm/qFGkyjXuOW
         PQoVACdfLwoK9IZ5zGrcWwvcd2p4vQ5CjNHtdKyZv3updu9l9s3Zi97LJdvfqNOG6mRd
         Znl9bES4d3VwuWBnGUAj7aG9+FGKuOLPYp4+HLpHybI3Adsed+/zcXDir1OLVH52WeoE
         5ZmA==
X-Gm-Message-State: AOJu0YwChb+tSq2kWG37zljwourIiVduECWWUWssk9cxFNw1XFttYRNm
	DXPzLyCe+vwXfny+LXHKBC9I0zUOv6se050CJCaqZeVnNSU3jjxr4rRwEixU03v3fxw=
X-Gm-Gg: AeBDiev8JvFEh56P7X35EnzxFYuYPY7yVj6KzbW/eJY1P345D2lIs7UJyZlEWywTVJv
	IJp4mRC1Le1HcAbU6eHbd1nl3Ixg1wxnD7EdfIPmvYCXOmfoA70L6Vlh5xhHyIuMq++QjzyRK2A
	SZM4pd0VOLlPC80TJnBbITITTf7eZfYDCQ8zMYFwZXitmKWIOD/BCkqJ9M3uz/wyrtvt/5a68ao
	La2uhZx9JJStuXU0/yraX9818QknuK2/tF8WYAaiGEOBL2EjaRNzNEqTHzvwVYXcvzaTG975bdR
	WEAmDzOHvwHQ4ZbJr0pkheVCz07hYMZsKuAr7nbw1bHYoFBzNlZY2jDY6jNpdFJ/SUEMJZDS1p7
	LGGjZDdOby2R/dhhpaBVyEevJ9cC/4lTZQw8mPF+n7CqphP0SOrta8WH121dk4h17qriD267SKO
	IRR3eAtO7ylMzVrOY7TSy2SquJp45xE3NM39SvAztDgrepr5xUSe2dAqpCCc3wlsIePpCjUqfyl
	m1R/wKp0FGFuE1J
X-Received: by 2002:a05:6000:25ca:b0:43d:b99:bdc3 with SMTP id ffacd0b85a97d-43d292cba48mr13898068f8f.26.1775380662209;
        Sun, 05 Apr 2026 02:17:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5e42:a555:17a8:9bbc? ([2001:8b0:aba:5f3c:5e42:a555:17a8:9bbc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d58e5sm32047831f8f.23.2026.04.05.02.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 02:17:41 -0700 (PDT)
Message-ID: <889c5788a6c49ddf77b22859b7d82014c75ecb98.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v9 4/5] wic: move canned *wks files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, Mark Hatle <mark.hatle@kernel.crashing.org>
Date: Sun, 05 Apr 2026 10:17:40 +0100
In-Reply-To: <adF2qsDHX3SzWqzy@localhost.localdomain>
References: <20260403183541.2631883-1-twoerner@gmail.com>
	 <20260403183541.2631883-5-twoerner@gmail.com>
	 <59476a47af44f95f70e14869226d336e90c009a4.camel@linuxfoundation.org>
	 <adA94CgwRzIvBl1R@localhost.localdomain>
	 <c15be3d11d7381e0be75e56340dc985628ba513a.camel@linuxfoundation.org>
	 <adEyY7c8FLpJPNkc@localhost.localdomain>
	 <f366155401c254d33792e00d0f6b60b81ed34d8b.camel@linuxfoundation.org>
	 <adF2qsDHX3SzWqzy@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 09:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234625

On Sat, 2026-04-04 at 16:38 -0400, Trevor Woerner wrote:
> On Sat 2026-04-04 @ 07:36:05 PM, Richard Purdie wrote:
> > On Sat, 2026-04-04 at 11:46 -0400, Trevor Woerner wrote:
> > > On Sat 2026-04-04 @ 08:27:13 AM, Richard Purdie wrote:
> > >=20
> > > I'm only guessing here, but it looks like someone wrote "wic create" =
to
> > > run two different ways: with the wks file specified with or without t=
he
> > > ".wks" extension.
> > >=20
> > > If ".wks" is not given (e.g. "wic create directdisk-gpt ...", which i=
s
> > > what occurs in the oe-selftest tests, i.e. when wic is run independen=
tly
> > > without being part of a bitbake build) then wic invokes its own searc=
h
> > > algorithm to try to find the wks file using BBLAYERS and script_dir. =
In
> > > this case the wks file is specified without the ".wks" and no path
> > > information is given on the cmdline. It is up to wic to find the actu=
al
> > > wks file itself.
> > >=20
> > > If the ".wks" is included (which is what happens when wic is called a=
s
> > > part of a bitbake build and therefore the image_types_wic.bbclass is
> > > used) then the class adds the ".wks" at the end, and also gives wic t=
he
> > > path to the wks file which it finds using WKS_SEARCH_PATH which is ba=
sed
> > > on BBPATH and COREBASE.
> > >=20
> > > Assuming the persona of someone who wants to use this new, independen=
t
> > > wic tool, and who knows nothing about The Yocto Project or bitbake, I
> > > think having wic look in "magical" places for the wks file would be h=
ard
> > > to understand and surprising. As an independent tool I think the user
> > > should provide the path to the actual wks file (with the ".wks"
> > > extension) and if that file can't be found as specified on the cmdlin=
e,
> > > wic should simply fail with an error.
> > >=20
> > > As part of making wic an independent tool, I think wic's code to sear=
ch
> > > for a wks file if the ".wks" is not provided should be removed. This
> > > means that, as part of the transition, I would have to modify each "w=
ic
> > > create" test in oe-core's oe-selftests. I'm fine with that. That coul=
d
> > > be done cleanly if I write a little function to find the wks file in
> > > the wic.py oe-selftest itself using the same logic as is used in the
> > > image_types_wic.bbclass.
> > >=20
> > > To summarize: in my opinion, wic shouldn't have search logic. From wi=
c's
> > > point of view the wks file should be specified on the cmdline in a wa=
y
> > > that wic will find the file the user wants to use (or not find it).
> > > The oe-selftests should be updated to use the same search logic from
> > > the image_types_wic.bbclass so that when it invokes "wic create" it i=
s
> > > providing wic with the path to a wks file that has a ".wks" extension
> > > (which is how bitbake invokes wic) instead of specifying a bare wks f=
ile
> > > and hoping wic will find it.
> > >=20
> > > I'm happy to add "files/wic" as another location for
> > > image_types_wic.bbclass to search for wks files.
> >=20
> > I guess the first question is are we going to take this for wrynose or
> > not? I'm not particularly happy with the files a top level wic
> > directory, I think it needs to be meta/files/wic. To make that work, we
> > need to tweak the search paths in wic and in image_types_wic.bbclass.
> > If we can resolve that issue, we're probably good to move forward with
> > merging.
> >=20
> > I agree that the search path logic should be tidied up. Whether you can
> > provide a search path to wic or whether that has to be done in metadata
> > is an open question. I do see your perspective, equally, if you are
> > using wic within OE, having some search knowledge may be ok. I would
> > want to see it basically using files/wic from BBPATH=C2=A0 with everyth=
ing
> > else removed. There is a question of how you warn users about old
> > paths. This piece is too late for the release though.
> >=20
> > So I'd propose we add files/wic to the search path, move the files
> > there and that lets us at least get some of the changes into the
> > release?
>=20
> Sounds perfect, thanks!

Since we're running out of time and I really don't want to have to
think about this too much more/again, I've:

* written a patch to add files/wic as a search path in wic
* written a patch to add files/wic as a search path in the class
* dropped wic and the canned-wks paths in wic
* dropped wic and the canned-wks paths in the class
* converted wic to use BBPATH instead of BBLAYERS
* added a sanity test to detect the old paths and error
* pushed a contrib/rpurdie branch into the wic repo with the patches

This is going to mean people have to update layers to use "files/wic"
but we can clearly tell people they need to do it. If we went with
either of the other locations and changed BBLAYERS -> BBPATH, there
could be corner cases we miss in the detection.

Autobuilder testing shows this will break a few layers but it is a
clear error which people can easily fix.

How does that look to people?

Cheers,

Richard






