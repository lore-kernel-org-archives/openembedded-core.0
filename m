Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.3356.1586207192457353139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 14:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WCUzZcg4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id h9so1219997wrc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 14:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=PyUiwShdcQPyfPm4aDC61aM+fho0yLcNr36Ac8p8QoI=;
        b=WCUzZcg4+VEJe1YCyu4elyczHKamchv5/7Ibipcq5qhkdm718DYTeWWAUDUphGpCW4
         KWf0wrwTDKtfprnHnszo3qaRofIhh4m3ztV90YZE6OJqAWY017Y+2mCNEaNZlGOJkFaI
         OxSMmkJgBcvsoRFG7dWXK7LvSw+KbqnTsnRF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PyUiwShdcQPyfPm4aDC61aM+fho0yLcNr36Ac8p8QoI=;
        b=JnIO4D6yeXPVuVs0/AG0lx+T1L1l/nGZ0/Mexn21hdjcDzlREJIkdfjF7Gssdcr4SB
         yFkuRu/PDdqMKurpw+gTmR0P8J9mPSmLaUdMciVYnH+sEDkFbb+KH0SgkLPy1sT30K1K
         P5rn0UtH9UeXkBFNG8yRJLQDpUA6p3Kptoe7ONnBHV25ZNIUJDS2IM+kFfRnhR1cfU+A
         DxoQmr5x6aM9HYJRkD4SKWUVdnF+2nzQbtk/L+yNRoQ3RcvqTsOa/Q5n0KeMv55C4Iro
         nrJVIxjTzCmiriSQZ+pTpDdsIiyjU3Cc72mYmsJLzYkUqFTc2ni6JpgBKrCJ9hLSFXAR
         g67A==
X-Gm-Message-State: AGi0Pub0kyGjmfgJSWHu3X5m/+RJvW7Ml+wwAKzXw/RPNmQjHDC5gHZ6
	Dc1igK9thSawAqoK8LIfq60kcA==
X-Google-Smtp-Source: APiQypL8zU185wKImb010JAJmtztYJEfdKsRx1ta8AxCaHRBxpT/+BCOeEYXHyhIukq1Q1abKQg/dg==
X-Received: by 2002:a5d:44c4:: with SMTP id z4mr1169791wrr.221.1586207190982;
        Mon, 06 Apr 2020 14:06:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 132sm868592wmc.47.2020.04.06.14.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 14:06:30 -0700 (PDT)
Message-ID: <47d3a012664b3477a953d4c06e797243218eed01.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] curl: allow configuration of default CA bundle location
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Yann Dirson <yann.dirson@blade-group.com>, Jim Broadus
 <jbroadus@xevo.com>
Cc: Jim Broadus <jbroadus@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 06 Apr 2020 22:06:29 +0100
In-Reply-To: <CA+4=imZeFQwOUtfmD4AR=EJ_sSvqAZy_fiN6xPurTLB-cfBkLA@mail.gmail.com>
References: <20200406060014.78150-1-jbroadus@xevo.com>
	 <3d20f00ac2d4f54f6bf4e67998df400548f0bfeb.camel@linuxfoundation.org>
	 <ee3a15cb-afde-3b3f-59be-9c279313927c@xevo.com>
	 <CA+4=imZeFQwOUtfmD4AR=EJ_sSvqAZy_fiN6xPurTLB-cfBkLA@mail.gmail.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-04-06 at 22:58 +0200, Yann Dirson wrote:
> The problem motivating this patch may be the same that motivated a
> hack of mine which I never
> cleaned up for submit: at least in some early warrior versions curl
> was attempting to use cacerts
> from the host.
> 
> This is a hand-edited copypaste and may not apply cleanly, but you
> should get the idea: make it
> so curl-native uses its own certs and not the host ones.

This should have been the case from 2014:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=92cad721d764ec28c3570dfe4a80847c3df19453

You can see fallout from that such as:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=754a9c31232979b3f0c28906c28191af55e96be2

where we had to fix curl in nativesdk to have the certs present.

So something odd is going on somewhere but I think OE-Core is fairly
consistent and has been for a few years.

Cheers,

Richard


