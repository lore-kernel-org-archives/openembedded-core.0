Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3103C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 10:45:06 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.19236.1705661097176171738
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 02:44:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hfREbrjf;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e7b51b0ceso743205e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 02:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705661095; x=1706265895; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LTQBMffA+Ev0iPUs1DXreK6e342XlwOWWnBNnYcfvWw=;
        b=hfREbrjf4jjdxGv0olHAy7YuHJBw/qgB7pM/cOp705KjkYi/emgYwBaC3Ig2JHeGD7
         lmdiHcH3VOD6hgJW3ICcSfkgpWcsjTPgokzihKwleqXPd/9iCoN7b3eTAcHmlwGVylri
         kBkBA5q8qi4T7mnWQWoz5UNwU1e+yvIzjSNwm+CNSEvcYEEHpw8WXG7i7DmtVjSBO4LT
         vt8AwEH4TyX+OGZv3Ph6DDAS6E58BL1HxMTMzTCLEL/ppzSoVN7oElQBb4zOe+OA0nF2
         GT5Mdpi2+to51I85rvHyP4kcXAwHV9c5IEmRrfI5rvsGl44OEdc34YslaWONPxSk1t+G
         fbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705661095; x=1706265895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTQBMffA+Ev0iPUs1DXreK6e342XlwOWWnBNnYcfvWw=;
        b=iPc24fItMQ/gS97RsLNGjDu3QyYK/o0NVRT5iF2KmaBEpKHS1rr2RI1C7ijgdxbnpW
         e759RRgsjVlE8BsSO14uLdTDcMiERWW4O+KduLvKT+03SqOLUwwlcxk6XUeKoFjNRovN
         B7z56ff9kz4oNNLBGwrdQtvnOaenu4U95+qYPiNxmJxdYnwywEmhVWBEwii5INVj3G6W
         sVwBbH0+qhNMWWrcFZp0r5EwWp/nsGqriTYLCyp3dhSNuJIg/N2c5+r4mM9kJq2y2PBT
         C8BZVLeYrTNTUov+v38X8hT0wCQ95wDD68RHQxVWYxiZQTg8kdHXtlKifN2A1Bbm9s2r
         txyQ==
X-Gm-Message-State: AOJu0Yx5Nesx1Vj2sICb3KsEsF41saw5w5yAVRLgNOpRWn7V3LEG2Pri
	vGloEJLhUwYcRDpyF596nb7aid6YcHPAKBl2xoseDsEBdJsZhYrfHsfAYL9paFNXSUpJn+f3Oz9
	8FyRX13XcMJxai1mysEWbVDFj4yc=
X-Google-Smtp-Source: AGHT+IHKnfFyjQOjhznsydu96vN9vr3h3blADtv9vGVE8y8elWN+nUlvYHSSglqB/h17gwFJp1XMPUm0oVYTxEZkjgk=
X-Received: by 2002:a19:4f1b:0:b0:50e:9357:2ddf with SMTP id
 d27-20020a194f1b000000b0050e93572ddfmr555189lfb.17.1705661095117; Fri, 19 Jan
 2024 02:44:55 -0800 (PST)
MIME-Version: 1.0
References: <20240111131521.2305172-1-alex@linutronix.de> <51ee1c53-0687-22a5-ec9b-88c2ecd2bc66@windriver.com>
 <CANNYZj8Wqm1NNx0VuxOU7sxoxsKcKh+vG-3WrkKiDqQVGSDNsg@mail.gmail.com> <1fa0d9c93f89c4f486f5d7607b52bb55c18787e6.camel@linuxfoundation.org>
In-Reply-To: <1fa0d9c93f89c4f486f5d7607b52bb55c18787e6.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Jan 2024 11:44:43 +0100
Message-ID: <CANNYZj8aT3SjK3VxejDoQ-wnUXAbjJp2PtmBt-yX2S+niWy9qg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] shadow: update 4.13 -> 4.14.2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	Vishal Bhoj <vishal.bhoj@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 10:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194028

On Fri, 19 Jan 2024 at 11:24, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> There is another report about issues from the shadow static linking
> change.
>
> I'm worried that there are now accesses to files with are out of sight
> of pseudo so that some combinations of builds are breaking. I'd
> forgotten about pseudo in the push to fix the various sstate issues. It
> is worrying we don't have good test cases for these.
>
> I've also been thinking about how we could solve it. My proposal is
> that we go back to dyanmic linking, however we add copies of the libs
> we need into the shadow-native populate_sysroot sstate/sysroot output
> in a special directory and we add that directory to the shadow binaries
> as a RUNPATH/RPATH.

Sounds good. I'll make a patch for this.

Static linking in C world is something of an 'obsolete technology', it
isn't tested or supported by anyone really.

Alex

