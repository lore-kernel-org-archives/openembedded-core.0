Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5197FC4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 13:27:45 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.11357.1705584462273711097
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 05:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P/wrmNEW;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e67e37661so17087960e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 05:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705584460; x=1706189260; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CA7LYTcAV+G31n2k3LXPnAa0CXIEO0cqAwPei517sZY=;
        b=P/wrmNEWoAE/L8AbgV8tPhMR+6jbAX8x63JRs1OOu4UtaavIPCfIMpByZI4BxAXk5S
         BDL8SvVSA0zZMTOYWul17XPeh0OPrFftyypOAlIa0djYw4OUm3je7pTGhuGLAz33uxZ2
         0dYiLeetzO0dmSqS6DzfyUnRgN7UboqD2Jwwu3Q242mIAlqyimxKEzeXibhJa1Zzg5i7
         984n778v3FBDTv4PrF9Pr7kBzoJ5mJVlPUT+TfOl/SHip/VlKG8se0l9xAH3XEqQ7p8O
         iH/oPaDAqGm8e8DECrw+v3nKmvYoT6toqvVB08h8JwYOkssdfeYh+Jwa90mjotcVpq9p
         sP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705584460; x=1706189260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CA7LYTcAV+G31n2k3LXPnAa0CXIEO0cqAwPei517sZY=;
        b=SVQXd5fjXpjM94erECgVXcbSAL92eirjIMMi3p1/+W0nGBY7ilkVla7fFtbT6axm9W
         JeJJpy4rbjBiWnXdJs/e8anUTKkJ266WbF3kK8fR2YdVuM/R2Q1+hPP2k33DtVCwZ2fq
         vScHElkLL4/u4slpidzIW9JMQTvbNUOm4DVT2pCd24qmCWh0tl352PZCm0KPSVF3xSwN
         6vc4LRTC9UfGo6n/jjxydtv7vXCaVm59STKazCrCMx6zIEnbmQ4zR3CUEWIMwBx4kCL3
         41dLWiLD2vlAHebDvCdwvCdWK8sPkT540fLVDZ3MRFlJMIGaMw2sLqqi1htSkoGOoD/E
         b4OQ==
X-Gm-Message-State: AOJu0Ywak21WxO5JriryELKRnPbmiVd5V7nvojEFZe5+dqB3tw6srxD9
	IFSBL4zvt4bxXa07roQ/M/RP5QtHC3E3dbjrQHfwMr9qb/qKdZWtJlzUEdLtk5ttXnDFouBxySo
	gL4Cn8Cqdb/r/5Uz5muuSIB4Vdto=
X-Google-Smtp-Source: AGHT+IF+CcZrp8zk9Jpu7Y94eDupzImsy9S4EKxoZ/31/n9OPun9hfD5kcaikw2U7sPu1M5WJtL9WiW25neuBa4P38E=
X-Received: by 2002:ac2:46e4:0:b0:50e:cbf3:8f73 with SMTP id
 q4-20020ac246e4000000b0050ecbf38f73mr584201lfo.52.1705584459999; Thu, 18 Jan
 2024 05:27:39 -0800 (PST)
MIME-Version: 1.0
References: <dfcf7a4a-81b1-ff26-d14-923bf379025@crashcourse.ca>
In-Reply-To: <dfcf7a4a-81b1-ff26-d14-923bf379025@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Jan 2024 14:27:28 +0100
Message-ID: <CANNYZj9aG5qcpe6PksShW4W69uk7EZ+j7yxHb43tgfDrk8ygFQ@mail.gmail.com>
Subject: Re: [OE-core] want to confirm i'm using "externalsrc" and
 "bin_package" efficiently
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 13:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193978

Mono-repo seemed like a good idea at the time, I'm sure.

I need to point out that externalsrc disables sstate and always
rebuilds from scratch. Is that okay?


Alex

On Thu, 18 Jan 2024 at 13:58, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   i'm pretty sure i know how to do this, just want to know if there's
> an even easier/more elegant way.
>
>   in current project, there is a *pile* of local content that is
> identified by various recipes. so since that content is local, the
> obvious starting point is for such recipes to "inherit externalsrc" to
> properly identify the local source directory.
>
>   in addition, many of those recipes represent packaging binary data
> (imagine firmware files), so that there is really no meaningful
> configure or compile tasks, so that further suggests inheriting
> "bin_package" as well.
>
>   finally, in some cases, there is a teeny bit of tweaking that might
> be needed for the final installed content, which suggests adding:
>
>   do_install:append()
>
> to the mix to handle whatever little adjustments are needed.
>
>   so given that scenario, can i reasonably summarize the right
> approach as:
>
>   inherit externalsrc
>   inherit bin_package
>   do_install:append()           [as needed]
>
> finally, it doesn't seem like many of those recipes are required as
> build-time dependencies, so i can just make them either RDEPENDS as
> appropriate, or just IMAGE_INSTALL them for the final image.
>
>   sound reasonable? am i overthinking this? seems fairly
> straightforward.
>
> rday
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193977): https://lists.openembedded.org/g/openembedded-core/message/193977
> Mute This Topic: https://lists.openembedded.org/mt/103807270/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

