Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0314C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 16:56:55 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.67744.1702659410412070438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 08:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wc2T71IB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so759465f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 08:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702659409; x=1703264209; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=znOWd6wRNbwjkVEQDCbEi9e/wc0h4OxP3kiX+KVDlnc=;
        b=Wc2T71IBEpPLE9wNCeXsPZzBgPdJKrg8uindOhvAOdZ48fUtMINoFQeJ/2MiH/81iT
         OJm4Yqvx2OEF+jKpXVPcQ8IY1MsWmPXLXE06gK0MxpD+gW7qaIMaJXCOcAMrygicGII4
         Bhsz0WSPeAXV0kOAJALwb6kx1bZ6hWI1YPr9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702659409; x=1703264209;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=znOWd6wRNbwjkVEQDCbEi9e/wc0h4OxP3kiX+KVDlnc=;
        b=OxMjvDAvP/tnrC0XOsGH6V4skumSxfrzfaE8My+E+5f6/cs5MasxWY489tT+i+47IF
         WWlgHZXWWrGrsikpYPMT+u920XSJJ2FbbRDVVOZmFN4vhhCG0bx3ZHrKmHLUeFAouMs/
         EAFvoXuzgadDOIgZplqFOYzugoZM4tw0ak4lwAaS9luSg5N9R6Cq/4PcA2HlVdlXz5T/
         xipL7My8dETaHdGXakMhfwgK9dwIhO8LKACsme5twF5mccwHYxa17BUu2v4Bzua0f2dR
         iDFR0XIAWX9L0QKFRtbYCagdaZSs6ZKp4QHDuUG5bPNw8DinNUz/DR+4FyrWF7DFLobU
         52dg==
X-Gm-Message-State: AOJu0YzuBRCHjPvYx9S6iEjm+nMhD6ffhDyTJ2dTebQhxy0bviMcjfdQ
	amfLIe8ft12OL+iXnZkVbmyj/w==
X-Google-Smtp-Source: AGHT+IEJsyojTmuTVXaGp0wx+YfLg0547LGC2xb0XBIqZ13yJC5u4bX3uqeWAFcg6/GG6uF+FayhBg==
X-Received: by 2002:a05:600c:1c93:b0:40b:5e59:e9f8 with SMTP id k19-20020a05600c1c9300b0040b5e59e9f8mr5839763wms.151.1702659408787;
        Fri, 15 Dec 2023 08:56:48 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a04:9eb3:3437:42f8? ([2001:8b0:aba:5f3c:a04:9eb3:3437:42f8])
        by smtp.gmail.com with ESMTPSA id s18-20020a5d5112000000b0033330ace23asm19343241wrt.73.2023.12.15.08.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 08:56:48 -0800 (PST)
Message-ID: <e908c28d37f16e3085b45f8c98cd9e68a59edeca.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/9] bitbake/runqueue: initialize
 RunQueueExecute before printdiff rather than after
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Fri, 15 Dec 2023 16:56:47 +0000
In-Reply-To: <CANNYZj-E4kiuX+R+d29_4Bq3m1hnkgPch709QSKqyHRRAgR1vw@mail.gmail.com>
References: <20231214134528.1973602-1-alex@linutronix.de>
	 <20231214134528.1973602-3-alex@linutronix.de>
	 <bc4906880058d64446e62a2ff6f983b85246750b.camel@linuxfoundation.org>
	 <CANNYZj-3r41Ukp1GUGhChbbJK+ATh_eOBvpWJAhn90_UKBMBoQ@mail.gmail.com>
	 <70310808800e92bdb957f9f6fa7d937fcb1bc2f1.camel@linuxfoundation.org>
	 <CANNYZj-E4kiuX+R+d29_4Bq3m1hnkgPch709QSKqyHRRAgR1vw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 16:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192535

On Fri, 2023-12-15 at 17:49 +0100, Alexander Kanavin wrote:
> On Fri, 15 Dec 2023 at 17:04, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > > Meanwhile I'd like to implement what I mentioned in note (1) in patch
> > > 4/9, as it's a real regression that I realized only today as I was
> > > preparing the patchset for submission and now it's bothering me :)
> >=20
> > Yes, it is and I do agree we need to fix that.
>=20
> I just completed the fixing. It all works wonderfully in local builds,
> but who knows what situations AB will be able to come up with :) It's
> a bit crowded on the AB right now to start the tests there, so here
> are the patches:
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/fix-printdiff
> (I run the tests with a special contrib/kanavin/ branch of
> autobuilder-helper that only runs the three needed selftests, and not
> the whole gigantic set)

Sounds good. I think we are getting to the bottom of some of the
underlying issues which is good and longer term should help usability a
lot.

> I also reverted the gnu-config tweak in that branch as it should be no
> longer necessary.

I was torn on that. I can drop from -next too.

> I'll cherry-pick the bitbake patch before doing any further tests, but
> it's now Friday evening, so anxiously watching ongoing selftests is
> perhaps not the best idea.

Fair enough! I've run that patch through local only testing so far, as
you say, the AB has a lot going on.

I've been torn on waiting for these or building M1 but I'm aiming for
just the CDN fix since this may or may not take a while to settle on
the autobuilder and I don't think we need any more pressure. The
failures are driving Alexandre a bit crazy in swatbot so getting things
sorted is important.

Cheers,

Richard

