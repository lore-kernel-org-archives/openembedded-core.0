Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451B6C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 15:58:30 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.9058.1639151908562474581
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:58:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=V3SSgQNJ;
 spf=pass (domain: burtonini.com, ip: 209.85.221.50,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f50.google.com with SMTP id q3so15668022wru.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kM9QOk4lKIqXuCHUTuAXJlJYHOdcut0qDuRHxPHnyLg=;
        b=V3SSgQNJpMbsA6UbrQKepvbcqB8UASSCsNEEeg4wdxLeJ8nnaUfKDTY+hl6CCFd5Cu
         pAMA+seJVU2Yhmju4EnJ1U/vyF9n73L9dT6ihlur0y8YOc/JC8QizpH4FYZ/mRt6cP/5
         zJ+65vFyasmv2zxPGer8xmq3RRkNCC+FBLxcPK+uMaS/LkEV3Xw/BfGsuSeXeK8VG3M5
         NA28GRJXby0i4qOyomqlfMeoSA0nQEgFD3sbzjg1g/oo900t+J0/LnCncS7gLyTUMuXr
         MIGGsT38+BfSKhg/NJHw2YiuKMzXdhIzenhPwZZt07UjshBUVmYqT8rd61m42O2AdSGe
         wy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kM9QOk4lKIqXuCHUTuAXJlJYHOdcut0qDuRHxPHnyLg=;
        b=qF4RhoaKbTqRqxVuKKzp1foW7VYJsvbcVMmVwPBl/HCvu6C3cZblgIHCMjcb2q0G1y
         8ysIpmgym8KYFR0f48ph0+E+xmKQAZJolHQ2DcQ5GLVtZWGnTeOSypkhaKsIi79UOj+3
         4c2azAXZ/utY0MwBLJ+6ZvDONK/7DKFXAKV1aL/Fhxt9bB0KX4adsbMxgmTe/rZIiOJR
         glqRya4yVCZRn/3rEa2OQXkWYkZxXp4PsoBaT5M1CfVoM8IqHEeCugBpY4ttQgiMj5du
         CRGlKGtL5rL3s+VNd3pguZu1sSQVDsR8tQOEkllmtiXw/yfGXgtjfHeht7HLpMjZ35eW
         dsoQ==
X-Gm-Message-State: AOAM532QSgUhVpHmZlbUnGfram1gPl8WKdMG0Bsh3ELL+lgmhN46BNbh
	Ylb54iq+A5+ccyDv73JXnY5IEyQAA/9ZJaJVWY76hQ==
X-Google-Smtp-Source: 
 ABdhPJyIReUS8YY3PQZ+1ABm6XybrxREY7dgIk3qV1tODy3d0PUcnAG3VttH9/X+XuI9rkoWY6Q7R9GtJrMbwjPfERY=
X-Received: by 2002:adf:8b0e:: with SMTP id
 n14mr13710299wra.281.1639151907006;
 Fri, 10 Dec 2021 07:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20211210142242.2698587-1-ross.burton@arm.com>
 <CAMKF1sq5CJqTmkQS6dZcqHaxsGO5OgD0vUFRci13hnvb-aQmfA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq5CJqTmkQS6dZcqHaxsGO5OgD0vUFRci13hnvb-aQmfA@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 10 Dec 2021 15:58:15 +0000
Message-ID: 
 <CAAnfSTuYiyeRdTwJYU7t5XhUe5eX542U_Muw-vcMS5mZwkhyvg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 01/10] libtool: don't prefix the installed
 binary
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 15:58:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159551

On Fri, 10 Dec 2021 at 15:17, Khem Raj <raj.khem@gmail.com> wrote:
> Does it mean that it can now run original libtool script accidentally which is pregenerated part of package which may be not what we want

Not really, if we run libtoolize then we replace any existing libtool
binary.  If we don't run libtoolize then there isn't our binary in the
first place.  Also, libtool-cross/libtool-native provide our libtool
binary on $PATH.

Ross

