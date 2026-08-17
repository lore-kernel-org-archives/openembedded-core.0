Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC056C5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 10:52:04 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27698.1786963921100941903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 03:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f1DqbMq2;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso18430026d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 03:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786963920; cv=none;
        d=google.com; s=arc-20260327;
        b=aXoF5kAKxSLhpthryEG+/ailM7O34uALszShcJtGB9wW0shHdKydfh960gwpvsfogN
         uidUes+w+Nd2tSddeNSxEDehRl7jbL4l3xJ4YctRRxTGgMOM/NzBbLt7b6Aq1SkocB3L
         Y3dYcprmNEqNHF0Xaa1ySoIVEXWapBKwfFFCU0MDbH6O+vFLOJyjKx1Fq/BMoZsEy8cz
         fY1M9lsnrOeFnyRnjdnqpn/zwNAX0+SdEGVIBzNJ/fv0PIJ70n7GzajMjAQYhvEzT7YD
         VZ0lRi79EOVGCfRinSKFaet1LE6TI5QUldGG0wbo+z0hoFq0EFDmnqxc9Gh4iSgslKGS
         XBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T6Z1rYoUCoJ+DnINXHv7suArX+koo5tUqadjIABIDj4=;
        fh=M7gDd3tZef2XySrBjIBnsCdcMHE6rVHd24kw8dxAzMw=;
        b=e3rruRhf4F65RkUXxbIo+H2PmEFUR+2pRrECbYt1Yz2eK8VD40egAf6TegLTUq4iP9
         KVPPAOeo4qfmeFp9fXcqR6Q2pMTw4YnP0YL+5XuX2aJEqkKPuC2sSqwZi4SeiHRt67Xm
         ORXAdseHT2eC5h1VbS9o8d1hBri/oSZ2ewE9DqoBDi9Pvaf3wyymeNhfKxkbe/cxEse9
         q3WHyhBn5i6yTx7aZPuofscjdQcFykFVOSyVKKILtDBiqUJz9xVbDQq0Xz6XMl+2W+6m
         KbzpwDQXlLF8gs0iPa9luDJbGJdpsJGeofIOmFbt97LHj3miHoAQ7yNo/D59vqehy6eE
         fAJQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963920; x=1787568720; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T6Z1rYoUCoJ+DnINXHv7suArX+koo5tUqadjIABIDj4=;
        b=f1DqbMq2LzaVuirHRXgaZ7jKfxLZ/UHr0W0TOJ9DNtXuEosj31CuI1ifK92MMK/lGR
         VMw8RFI9GWjpao5raHgbui0LCjUPz3EiEUd53mr7i70gF9nEDZlf2FSlfJEh03DCMrMm
         LO8m3FfOUkJ8b8hcG9A9d6ZwCByW3iWPeTr5D7kfGNsuJXQ9hJA6tr8hbg0NAKK0PKl7
         hue/NMokemF8cwsDY88GK1Gqj5RjvACB2yCjmh5fB88L8UesyfwYcx9gYod92yYfZIDV
         ZZphZv7mMIyb2vJlMMevqQp9XD09VkN1G8M/LeEgQPijC3oCSEWGZSm0w2dUh6hsT+Ag
         cEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963920; x=1787568720;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T6Z1rYoUCoJ+DnINXHv7suArX+koo5tUqadjIABIDj4=;
        b=RVPu2Ser7QIvPmO4IUHEt8qYDM93O4XVZG2SFmNrubONAI27Tu697R/6g61I1CE4O7
         v6CKIm2qnUCHJd1MvSEpJw2ogEdX2i3p6szVoxk9JDvfCvlbkoKOm1B7oUhOm2PEUFEU
         MJ+F49c+7lxy/XQDd7bWwgXV3dpf+6Ju7ZBPiWY68qy42TCE0nTr5hfpOBJDK/LEYePZ
         uO0wL9LQ3DyVi2kJI2vYOGnfTGsoxLbHFeUNOKj3W1vqijDNTWeR9FhUSncW+5Z6liHm
         zPV/ifG1RacAab/ME/sjtwih6Ycmg5k+lsh2wUO/IT5uIXl7KzvAjh6/XWjsz/bOTmBR
         wsow==
X-Forwarded-Encrypted: i=1; AHgh+Rom8Yff5IeVJew9cf+rD9kYjZZtZmFlZnHYNNfJU4pJhqqxPuQFcfn6HW1JpSeBYy5HU2myfpaobeK+PBDDM4HanA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyR42Ee9H2tSAIMLw8iy5xh705fEN+091UkN3sYpkLMK+KM5y6H
	P+58oa81mjg4yefJGeL/ENBStiw8oh9mKmzjcx6O//nrbm2zePzPV9a0iJX9kTZHOT3aguNItlV
	u88ZQE2eUwDrGevtSXD+Rb2OX3uw5YNc=
X-Gm-Gg: AR+sD11/S7iATcQrmyj1oblYf630dVb9jF59QnB0tCO2mKS8IuKDu3VG+mVo/ZfV3cO
	IF73Kfnfi05pZ2VLOIetb9jsCYVV7gVq+Hjd3CmX/SxwgfLITLgRPPeDD3gLcF2D4OvWivIENml
	TT1wxz/vltezJ+66O11FmotuwEs7dE02kawMMkPEpkaDbQNh0T3yzodYm4/bvDsHA2bkS7DTEJe
	W7b4OogdwhA6CfBXK2mQusQ7WtVzvpp0I+z5wxmZrzOzWgWtSltJmVxiIC5B/5mJbeOI1kfJJJN
	O/9NXKAye5cLZCukL8tQwHpH6VoaDdnfB4HmHOLBhMw2WIc6+xPZj4Kphpji+xS12hLEArLCv00
	zlL8=
X-Received: by 2002:a05:6214:5888:b0:8f0:448c:f9db with SMTP id
 6a1803df08f44-90a91de9bddmr299553936d6.19.1786963919957; Mon, 17 Aug 2026
 03:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260813030515.1028627-1-twoerner@gmail.com> <20260813030515.1028627-2-twoerner@gmail.com>
 <7fc0bf78c8046ad9c23e49f80d8ed93103db3317.camel@pbarker.dev>
In-Reply-To: <7fc0bf78c8046ad9c23e49f80d8ed93103db3317.camel@pbarker.dev>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Aug 2026 12:51:48 +0200
X-Gm-Features: AcwNN1WjmOaevNYYnloxNFXu0xyQJT27RnAlmI_yFOoycrDRPHnDQd-NK1KVzWI
Message-ID: <CANNYZj9SqJ8CdKO6MruFqJ1mx3=NMEyx9wovrTe_QOYyRNFQpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] oeqa/sdk: update cryptodev to a revision
 that builds on kernel 6.18
To: paul@pbarker.dev
Cc: Trevor Woerner <twoerner@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 10:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243606

On Sun, 16 Aug 2026 at 13:12, Paul Barker via lists.openembedded.org
<paul=pbarker.dev@lists.openembedded.org> wrote:

> I'm wondering why we haven't spotted this issue previously, we've been
> using Linux 6.18 for months now. Are we missing a test case?

I suspect it's because the execution of useful cases for sdk and image
runtimes tends to regress due to 'soft-skip', e.g. if a needed package
isn't present, the test isn't run. I don't think this is quite right,
and each particular image and sdk should check that particular tests
do run, and if they aren't, that's a fail in itself. I'm not yet sure
how to technically implement this.

Alex

