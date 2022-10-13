Return-Path: <leon@sidebranch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C705C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 08:44:21 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.5252.1665650650145437372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 01:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20210112.gappssmtp.com header.s=20210112 header.b=a4JCEWzE;
 spf=softfail (domain: sidebranch.com, ip: 209.85.208.44, mailfrom: leon@sidebranch.com)
Received: by mail-ed1-f44.google.com with SMTP id r14so1616077edc.7
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 01:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+zNcmlagz0QZDGq+zolqBjFZMECoF8zuHNB/6Z9ggQE=;
        b=a4JCEWzEqZoYEwgSbDuE6LHN2XPKRf9IdyYKCXYh5LsDRaWzyDa0nti42n9TtLY+1C
         pDUk9NH5pO4BxaybYEjN9+LCzz0ahP3w3D5cZWiFtdCkUicZVVLI708setZB/sOkZ1AS
         D/UqcXWVzgAX5295vbUEYcpdLUwVw4/b9nn7sD+QfEfoY6X1mZoMhUHLAt3rSla8DiHL
         RNkt0LocMH4fphpYSu/sbqkrttMKDu5+qOof6PsL2GkkQqh6i/NYG5so5b5R7lKROWqU
         CnAbqi/yr0CklcWSVqPpHLNmjz2GifHJC89Jc5+xOajLKXfNLa9O+Cg3vO/xV1FZd12/
         LTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zNcmlagz0QZDGq+zolqBjFZMECoF8zuHNB/6Z9ggQE=;
        b=5HS9x19+/XgbFhGHh51VCmp8YsC0Ovf1Bn0j/8wLm5F3cn4fwXBpFuGTrNNnV0+LXz
         ImHyggoCvmWP6G4yieuYwQAaJRnu3vwX9eYbv9fFRH38pbb6O00XZ8DxSEeS8DAmbEH+
         RFu2raNWQ0B2yFRDOb+MzAdOngFCagkAYfIwreG5DKWITebfTaXFGwGJyd5L0VPFFpwg
         bsHpw27YpqxErHEsZUoo/1WM3m/Tv52+cXPNOYZassJqnbpXObXZgqAjorMxO1/HTbCr
         LdRhsMBk9DrFmFrpxDAz1Yt2VrQEdcOxYHnOCSZ/vmnnqu3GAvXqs6+s3RLwTy7pXZwi
         j71w==
X-Gm-Message-State: ACrzQf3N2mguzuAcNrZg8VwqyTB9MYgkOqNh8LGRmy+8amGRx1YdgADt
	mJtJbdjH9ctzYyfGNw2CG6GpI0/n5KGtKnHx1+0BQg==
X-Google-Smtp-Source: AMsMyM5jfrYghr0Otdk4ZEQRZ5bC2oE4ZFeJPxKCvWjPYZ6OfiDP//eFMlCqB0kPMwteL255nrZr4XqiroCHCg+/iF8=
X-Received: by 2002:a05:6402:298d:b0:451:5fc5:d423 with SMTP id
 eq13-20020a056402298d00b004515fc5d423mr30782330edb.102.1665650648090; Thu, 13
 Oct 2022 01:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220622103312.1098389-1-alex@linutronix.de>
In-Reply-To: <20220622103312.1098389-1-alex@linutronix.de>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Thu, 13 Oct 2022 10:43:57 +0200
Message-ID: <CAMjhiJjWasCMS5G2JyjQrES5SwSQA17zYp2g5VfpaoLvN=L6Yg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/6] (e)SDK workflow directly in a Yocto build
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 08:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171692

Hello Alexander,

On Wed, Jun 22, 2022 at 12:33 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> There's been a recent discussion about how we can make the Yocto SDK
> experience better [1]. One of the ideas was to eliminate the SDK
> as a separate artefact altogether and simply provide everything
> that the SDK and eSDKs do directly in a yocto build.
>
> So without further ado, here's how you get a 'SDK' with this set of patches:
>
Thanks for this work!  I like this approach.

Regards,

Leon.

