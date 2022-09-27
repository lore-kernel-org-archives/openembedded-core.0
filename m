Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65769C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 21:50:24 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.800.1664315415446737973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 14:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iCH1krVx;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id z25so17688186lfr.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 14:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=N2xSXrmTEjoSwbsECEJDgtvfwzLArZn1yABuJ0rXoGQ=;
        b=iCH1krVxI10JZoRPhzPoGIey6pDeZ+8CDNLa0cypQ/PlXW8wtyITuIzDs7LGrl/EMN
         1AC9cMGNxw6S4S6xXNNnjsADc/1A0hyik/EZNNzMF7jnScXb18XbyjdOLiuOEPTc4HBq
         QI/ot1FOnj7X0aGUibsCb3IkEAG9H7NSCeoS6DaT8WRwt1h3pr+hYQzbDT9UcT60sxQe
         PJgCZ1JKDy2Y9i9vooMljkFBPooMaYVnpGV9mZRWLjiCCznnaageF3GGqRbKzZm4KDTJ
         syLfIQ8cEcW2Cq/joTxhG7StneihGo8BdwfZ+gJ1ScXTQ4Pey5FpVVA3B/5rR4JgcbYj
         OOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=N2xSXrmTEjoSwbsECEJDgtvfwzLArZn1yABuJ0rXoGQ=;
        b=N2bz2hOnM/fHHZX93EGiXhQ/vpo9Kvd/h1Y6HA1AbOv+KUo+plap8cgA9aXARyHRlw
         mTd2ZiVr8Qg18W1L0oVXJQW+nrq+KCVRxlrXrIOpNFZOo5Oz9QtodYhrOXN10JtcJP0t
         3lU+akgvm1i+2fxJvdiGa2KdFpAzNaG4+fSSDdf9VA1HR3GgZN4AyORTWLcsRSV4pSNr
         BxRK1UvDEq6vRYjXXsxX3h5o7730aU+U8oGJr8I8BVvwHcOzjxQNWtKTFSgeJRPiXOtd
         akiOG5StsauXB3Xrc9Lze33uXCFn4FGWeg0Y/8Qvw/CqtegygQC1jGuWd6/JgYQnWuLu
         mJ7w==
X-Gm-Message-State: ACrzQf0j5QkWJCerMsA9Be6QJXpkLgzdhpZsTvCGn5DvCGyFPofAIZDz
	WO/T3yzPaSzETdUGyu2P2Re++24yuLKjTMtnpwo=
X-Google-Smtp-Source: 
 AMsMyM53jc+jtPUtFHstbAbPJDWJ/iRsBlxG9iLhZFRvGE2YhZ+N7PYRDfLHjR3VvOblK66wqmlcSmiA6DMrh0D3zdU=
X-Received: by 2002:a05:6512:3612:b0:499:aea7:8bed with SMTP id
 f18-20020a056512361200b00499aea78bedmr11310756lfs.26.1664315413173; Tue, 27
 Sep 2022 14:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124708.2218995-1-pkj@axis.com>
 <20220922124708.2218995-2-pkj@axis.com>
 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
 <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
 <c78bac9a0a53243336d237bc5f6d51758f5a5dfe.camel@linuxfoundation.org>
 <6dbf0e264c68433a8aee1a772015c852@axis.com>
 <1718C14CEB633922.9698@lists.openembedded.org>
 <CANNYZj_rRJFsnOcSrkONYfmkZdUe1eCZKYcvnkpPj7jm7eVu+g@mail.gmail.com>
 <faab0d74b95849bdb1d39ac0146dd523@axis.com>
 <CANNYZj_2+-GiZ4Qa67GJ3KFJMqFxLFXW6XKMtL+a9=NrPmi66A@mail.gmail.com>
 <77825785242f4d99b336af0da596e286@axis.com>
 <CANNYZj81uAD1wMJyizCHTiwCnCnw_XMOLqPOzKGu0Og1sejauw@mail.gmail.com>
 <1568abaf9b604bfaae699a53c537d51b@axis.com>
In-Reply-To: <1568abaf9b604bfaae699a53c537d51b@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Sep 2022 23:50:01 +0200
Message-ID: 
 <CANNYZj_L2+OJE4TYt4A2QVXjsmSOVWKbWD4EPz=AkQj5snxXgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 21:50:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171134

On Tue, 27 Sept 2022 at 23:31, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> I am not too fond of the "writing the config directly" idea. The reason
> for that is that things change upstream (as you are well aware of, that's
> after all the whole reason for the discussion). This is why I prefer to
> go through the templates and basically only provide the list of layers
> to add. That way when things change upstream in the template files, we
> automatically follow. (And if it has not been obvious before, our wrapper
> uses the bblayers.conf.sample file from meta-poky and just replaces the
> list of layers with our list of layers. Which of course sounds like then
> we could just write the final config file directly, but we also want to
> continue to rely on oe-init-build-env for determining _where_ to write
> the final files.)

Wait, wait, wait. If so, you can initialize using the template from
poky, then you get BBPATH or BUILDDIR placed in the environment (by
oe-init-build-env) telling where the config files are. So you can
write to them directly (e.g. local.conf), or use 'bitbake-layers
add-layer' (or 'remove-layer') to tweak the list of layers using
supported tooling -  after the initialization, but before any builds.
No?

Alex

