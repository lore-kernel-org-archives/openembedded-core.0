Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D050C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 10:26:03 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.4316.1705055160608971784
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 02:26:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m8exRDeu;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50e72e3d435so6184691e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 02:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705055159; x=1705659959; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xGaQ8ouMXUy80rJw1jjsLmLa80mifFnSopAQRTuiTBg=;
        b=m8exRDeuG2UuGoPLqr71eMMAghB5zdWx0R+1IKVcJSvpJuzij+muJL8LwU/S/UCQgt
         rWo8dnk/RjlOs53FWGMNmPzHnoZh0mft5goBA1MRsg9/4HliWFk3ZHG82PaId3LwqKgD
         +rzwKykd3KFWHszwPWy8dHy5+LEEaVkq06hXmLRivQ0646Tmyj66ZZ2bJN+MOmGqA9XA
         HgYeYjirJU7RYjDcaMQBADJdbRiDRuPWRrcKE+iYYmiY7Z+WghPt5hiAGaTA2/oCEg7S
         WMs0KeBtIysGS67u7Rz3APUsydKDS4vKC9dGXzXgXBziGLp+SU4asJ6sQ1izhQ7snwqI
         tEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705055159; x=1705659959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGaQ8ouMXUy80rJw1jjsLmLa80mifFnSopAQRTuiTBg=;
        b=IzgeK5ayAqj/Y68AwCsO4raqh7D5tkb6njy3Hd04kJe4g265KqS4HMUAsehw6ZYZ5G
         MRWae2Uqj69yfE9BrInUgs0EoyAF4sHt06UrXXVJBmQmsx4YH4HFtrcc+IJ3sl/rz2UE
         kY+VGBxIp5hKP9R7qhlyvYQ3OoLpQbo1dwA8n+LD9PJya2wB5U21rJ2H7aODKnYJVFY7
         9FoG5VTlu2GDGyrSfs0lZdf5G9D677i41HLuf/9wMxT393kTcO5q5Xi98zpGlw+7WKmo
         zm9S4ib5g5EHkzFF+WcYhKAcRyh3ZD+Y2brQB1D+qIi/hGJAfyfG2z3MPicJccPqC6F8
         LlPQ==
X-Gm-Message-State: AOJu0YwxuvYqXSO8Lr/l/i1/sUcX5MlDcglh4B000HauEJPp2TGK8Drx
	TRxf4Q6JmpopfyAUIT9wfgPRY+63+Sv94Ual9Gc=
X-Google-Smtp-Source: AGHT+IHvcgz7aHXXbSNVcFhVr1V83BcYyMNN4QewNCtOSSGLSWqpV9oxc3hBIBjrOccMjSAhkf64I8BSSKl/zpohSnU=
X-Received: by 2002:a05:6512:318e:b0:50e:e2e1:9cc8 with SMTP id
 i14-20020a056512318e00b0050ee2e19cc8mr393155lfe.117.1705055158504; Fri, 12
 Jan 2024 02:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20240109170941.3422308-1-f_l_k@t-online.de> <CANNYZj-tsx5S-PTikmO43sY-0-QEEiLnqs-1QAmTGpPFRfOabw@mail.gmail.com>
 <96e2b562-424b-473a-8610-a2d31f4cc64e@gmail.com>
In-Reply-To: <96e2b562-424b-473a-8610-a2d31f4cc64e@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Jan 2024 11:25:47 +0100
Message-ID: <CANNYZj9O6k3+RMo2N0_t9aY9fRTBSyU_VY+M9eNYq+8fAobv0w@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCHv2] webp: switch recipe to cmake buildsystem
To: Markus Volk <mrksvolk@googlemail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 10:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193575

On Fri, 12 Jan 2024 at 09:56, Markus Volk <mrksvolk@googlemail.com> wrote:
> > Why is the patch marked inappropriate?
> >
> > Please send upstream first, and only after upstream has expressed
> > their approval/disaporoval/request for changes we can take some form
> > of it in oe-core. Maybe they would simply want to turn these into hard
> > dependencies instead of adding even more options.
> I guess upstream simply wants to leave everything as it is, because the
> disadvantage of options would definitely be that everybody would have to
> adapt their build systems. And that for a problem that is rather
> yocto-specific. I'm not sure I wanted to suggest such a change upstream.
> Aside from the fact that I can't send suggestions to upstream at google
> anyway, because I'm not willing to accept their requirement for a google
> account with a gmail address.

In that case, please abstain from making patches that you are unable
to send upstream. It's a basic expectation in oe-core. Also please
don't make assumptions about what upstream wants; floating
dependencies is a real problem that they might be interested in
solving, and if not, we would still have a reference to their
position. It comes across as you trying to find reasons to avoid
interacting with them.

For this specific recipe, you can still rewrite it to use cmake,
without adding patches, if you follow my suggestion elsewhere (drop
the existing packageconfigs, and make a new set that strictly follows
the options that upstream offers right now, pulling in all the
optional libraries for each of them). It doesn't solve the floating
dependencies problem completely (it could silently regress to that on
version updates), but it would avoid it at this moment.

Alex

