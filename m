Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B0AC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 14:04:51 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.8692.1742393089006029482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 07:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YdVbvewn;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso55643746d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 07:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742393088; x=1742997888; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MS1pTXYItgU7VhACDGhm05RnRLUialx+ZqLlzpQUAIU=;
        b=YdVbvewnlRgoyAUJPOIJQQ3RJj+oe4Fest97uC3Mv/3LYdEGzAb8J6Dk6xoDsiIgeE
         DjEqUT5WvMmsJeqPIfYXbHO58Ow0nYhHO2DGBovgYeANDbQ0GFXtLp80F9vQoDNZB2Dk
         q6XLNdEV29Zdw/6S6jigI61XK7weGeZs/4ddg7kduV0x584rYnxTLIWbOZdzjOEdgEyk
         /F5wS7oz81N24IL+X2J0770T73rYVWZ1mtvVSqGSHAqCecXC/MQx2QyGUWtvkzGYlsYl
         Cvj/nUFxoqjeTKLIJeksI/eTp8hhIC9ldEo50ZlJI/jPxSgwuLDPVqFKKrHVfzHWa9Vq
         fkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742393088; x=1742997888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MS1pTXYItgU7VhACDGhm05RnRLUialx+ZqLlzpQUAIU=;
        b=UwI4TIKlwOdDZr5R64VoelUTlvYc+81bDwuwc+TKZu8qlcbJijvU74SFDz5UnLYnvf
         vGeLsp477WwSgP+ZlHZh3x9PW4T9Mt1rrI/x0qTC8U+1yvMeFB2lB6G2UpjlGZJoaPjb
         UngL+wOLUsLn4HhiJj5buLnBfcWcKZQqSQVqB5izM2FLsvWof0wvl5T8Lwd+cWQdYYXY
         kTTeWL09dxhqt5dk1rZ3ZZEXl/otQUzgUQquf5mUc9vH2dAUEt9249dFFMOruhfvDaAo
         4zFzZrl/Njjtng0RihulByJd2rB6BuMifkt9+Y/TS4Pr8wxHTR7uekLSeiqf5HryonGi
         S3TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXigvQxDR/p08nWqTshoO1cuIIxWVI8fJ2Y7E5xat7DhtT00b+t99ISyaa2SvCbcA7XY65w/pHu4Hr8WU0aIv/BDA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/QLZfPTDS/EH7nplf8i3nYu/8YvQLZ1d0oMlgnhH3kTrzqpnI
	LYD65iW0cAEWovGFQGgQAyEbszQT9ddwXYn3SZeGJWQfOAj0yV8ziuCPhZ2Bvl7agi7GfP3haN0
	1sRo3TiuOmmv9q5Y/eDJhMEZ68hU=
X-Gm-Gg: ASbGncuUPxOOnvaPO29zUV/PEPP+E8iafr35sM2BCdFOA1DrSxBs3/hVYejvGa9ifwQ
	TThw1RNUyEirm2VbqsPbWtvXp0oZCs8wSgSXTG1aES/m7mROjSdUE5b1zvbVY1Rx/5LnSuDPNmv
	JFOpoiz1mpYlw/Aep7r8XnbH9y1bnUUpUQA9Y9VBgFD6j/uAcOoTBA/YVaMJPb
X-Google-Smtp-Source: AGHT+IF9AC1qta1uSOG2ugMIp7eFb7t54Z2IRWmg/lH6krDZRFv4ttaxT56YMmt1g+BmMTW16CDqdmUimyE7HJ/HPOs=
X-Received: by 2002:ad4:5c45:0:b0:6e8:fb44:5bda with SMTP id
 6a1803df08f44-6eb2939151cmr52087536d6.19.1742393088080; Wed, 19 Mar 2025
 07:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250319100959.4102512-1-alex.kanavin@gmail.com>
 <51cc8655a05cc6cfaef32ee550fe11175c23da9c.camel@linuxfoundation.org>
 <CANNYZj_9RmwiA4=PDE1BR-njjX0y0FrCto8H9DTSROJwUjpZCA@mail.gmail.com>
 <d5992c2c2013bf7ff5ce2d76b1b223f020764d03.camel@linuxfoundation.org> <182E2DB6117AAA9A.9767@lists.openembedded.org>
In-Reply-To: <182E2DB6117AAA9A.9767@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Mar 2025 15:04:37 +0100
X-Gm-Features: AQ5f1JrPmoCuWVmT8aGJCpxISkDa0m9Ap8poTi20deL_pL3sbGqUPLgfTOxySSw
Message-ID: <CANNYZj9E9-w-S+ELyuvutKoAQzy7gst=vJ9pmweORVE+v9c3Yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] mesa: correct download location
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213333

On Wed, 19 Mar 2025 at 11:32, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > I think we may need to wait for the dust to settle on the
> > freedesktop.org changes before we update urls...
>
> The new location is officially documented though:
> https://docs.mesa3d.org/download.html

And the new location was documented already two years ago:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/67b77d8adeb1132ff99b68f8719f8de341e38ee2

Existing freedesktop link has been a redirect to the new location, and
that link has now vanished.

Alex

