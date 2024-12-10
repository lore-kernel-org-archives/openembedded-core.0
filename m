Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F0AE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 15:27:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.13063.1733844457655671637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 07:27:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FRYQmDzH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434e398d28cso24481615e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 07:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733844456; x=1734449256; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ibRxgsBqt1J01Ys5fBaNlULu+O0zHtvA63PX05QRSus=;
        b=FRYQmDzHuyS77KHUuyV6YXxjmU+6N9ymep9k24z8VoHb6nuGWhqvCYYstSXBlNQ8y1
         mz+DR2BeEaTRdfdQpVXyOfwm5z6+fO4D93RAX6VwNIPCCuOedidinb+uN8aR1FJeT9ED
         dPNEA+ZleTYdtP/hNDcHzndrA9An4KYEcnhD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844456; x=1734449256;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ibRxgsBqt1J01Ys5fBaNlULu+O0zHtvA63PX05QRSus=;
        b=sp0pAZTFe5SV4AxNwwZML1cyYZs4YoWh3L4yGOIWsPfDfLOGis7XAUmVRoEyTE8NoS
         59YZVx0hTfv0dAwShUBIQ+57mSC0vMYT45pkue4m6sskNMuKCM7YAiPtjOQTH97+YW0r
         GB94BpdQDFzAA6ROFVy9CJTKr6JnFl1LfTbwq8z8wZ4l2iJDtQauKuotcWRu3stk0QYw
         +64pNCLKhudfowgzr7iJlmXjxX9bIrb0IyKjJf2tw9dfnBOwr0V8yPQ0h1EcJ57V19B2
         B/OuvDgsgfV+b3KxFANAg8mErrGfnIRvvxVzZJehsJqSNIkObJxMLYeflYM8fZ3R4Efw
         q30w==
X-Gm-Message-State: AOJu0Yz5/7KnSKuDy+evhg6xbXyCoYdqGHnKmj/azYsrmnyoWQtAUB6s
	+1bsECCshzd6uEIlHjKdLCFaq/MCAxleRaR4sQ+eGyMZ5MtVvnivdsPBnyFyKL0=
X-Gm-Gg: ASbGncsNG8fqOVkk93si2xPrXhkSqIYt+noXU4qfGfsOFpxuV9pMAqhknQzQG7CWBk4
	jF7Hu2Ik4qPv9h/yC0pYFfr0VNY1vGuVUUO/EDsAPkTextPkG3d78t8LzDVNFHZxrT3M56Yde8f
	gzzjzcbKbiuHRBNu8xdNZGEqaUKoY9wJMDyJaQtqoqyC0Aih2V49jqCpy6SWFFC2DkipLLq1Chm
	n/6MWVSPhNqj5NKNliyL1xD2OpOsbetQ0vP490q+rsn4EyehB7kFCfENsbGsRley2RrEalYtcme
	UZ5f48J7mXpnbGpYoyu8YJGxkHJUm8WVEvVaK1LT
X-Google-Smtp-Source: AGHT+IE4maHhOopqwCI7H+tlaw4ZG9Z+OuBTzivo4bv1JKOooAdeD5rVIHPcysbwTCCy0AnaEtbs5w==
X-Received: by 2002:a05:6000:1449:b0:386:930:fad4 with SMTP id ffacd0b85a97d-386453d663bmr3737779f8f.19.1733844455862;
        Tue, 10 Dec 2024 07:27:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8bb1:c3e0:4c7:12f0? ([2001:8b0:aba:5f3c:8bb1:c3e0:4c7:12f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862190966bsm16462220f8f.75.2024.12.10.07.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 07:27:35 -0800 (PST)
Message-ID: <4254d23ae9ad100e70f199fa4949ce00bfe7063c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 3/3] bitbake-config-build: add a plugin for
 config fragments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Tue, 10 Dec 2024 15:27:34 +0000
In-Reply-To: <CANNYZj_ONOGam=9um4qqqAc_D0gQHrQML3a9eXBEgHLCiRtM1A@mail.gmail.com>
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
	 <20241118162643.1423409-3-alex.kanavin@gmail.com>
	 <c799588bada27abdf2b412115868c5b84c24a0e2.camel@linuxfoundation.org>
	 <CANNYZj_ONOGam=9um4qqqAc_D0gQHrQML3a9eXBEgHLCiRtM1A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 15:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208539

On Tue, 2024-12-10 at 14:05 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> On Mon, 9 Dec 2024 at 18:00, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Firstly, I think the "(disabled)" is the wrong way to show that
> > information. It would be more compact and perhaps more usable to
> > show
> > the elements sorted into two sections along the lines of:
> >=20
> > """
> > Enabled fragments:
> >=20
> > selftest/test-fragment - This is a configuration fragment intended
> > for testing in oe-selftest context
> >=20
> > Unused fragments:
> >=20
> > selftest/more-fragments-here/test-another-fragment - This is a
> > second configuration fragment intended for testing in oe-selftest
> > context
> > """
>=20
> This is fine, I can fix it.

Right, this on is not too hard to implement from a code perspective.

>=20
> > Secondly when listing the fragments, the current approach does lend
> > itself to cut and past but also doesn't group neatly. For example
> > you
> > could do something like:
> >=20
> > selftest/
> > =C2=A0 test-fragment - This is a configuration fragment intended for
> > testing in oe-selftest context
> > =C2=A0 more-fragments-here/test-another-fragment - This is a second
> > configuration fragment intended for testing in oe-selftest context
>=20
> If we start going down this path, we might as well write an
> interactive curses UI, and keep the command line output 'flat' like it
> is now. I'm also not sure what is the best approach, we'd need to take
> fragments into practical use and accumulate a sizable amount of them
> perhaps. Such things can be easily tweaked from experience.

Having experimented with curses UIs, they're a pain and don't really do
what you hope/think they would.

Some of the other tools like bitbake-layers do "group" output for ease
of usability so this is something our commandline tools do to some
extent already. I'm not saying we have to do this, or do it now. I did
want to at least put the idea out there to see what people's thoughts
were.

I just know from experience that showing users large blocks of text
without something to guide the eye can make them harder to use.

We can leave this part for now...

Cheers,

Richard





