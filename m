Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D00CD98C2
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 20:53:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.1229.1696971204982610661
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 13:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K4KwoTP8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4066241289bso57810625e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696971203; x=1697576003; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d0xskZ+gSdEYc4YSzXMyMWbmBcOcZ+sxC6qpJbldO6w=;
        b=K4KwoTP80lT4WUpVbpYi47BgWwyGPA41VT5tfbkR82s+IhedXjSlS3hGnU3+UNoECX
         plHKj7o8NI7tOKig0OFJCVreuQWAOm7v3huaqAhKMNIq0250fzjO6RkACZd2iyO605Tq
         Y3L8PMD7OaHTu20Mo55rnncnxYwhSryzQUlio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696971203; x=1697576003;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0xskZ+gSdEYc4YSzXMyMWbmBcOcZ+sxC6qpJbldO6w=;
        b=iojaWZEeosdSXncXP+ghm+VcUlya0AS22D1zNER9vWgIrX1fXIAbGpKMtuOjYaF/m0
         tkOKqUnOA+qSE8SBiYVdAJGej95ZfzDSbLZOpESD7eRKTnGtz4yJCrSXa6y6f3JX0GzF
         ffMWdf0mgtKb2mMFSC6a83MDVXVbr0r8/gHF8FKI/IrIc7dJ3SUIvAqAQkIyD+OQ8WH3
         gcqMA+gme4zSuayBy6NfNvQLa7P1fzizSY/VRfYVoOgRNZz5zgKffKNi0tvg0nAufbWZ
         1uenaiGlGcdinfXUfdbQ39NHcHoDK4EVJsMTgYJvqGkI8GCRtq4YtJ6ZHFA+1DbaZ/v7
         1PlQ==
X-Gm-Message-State: AOJu0YzSTIT2AnzFZHlD7dAfIbCKDKy94UGDLUBJoOEKO/fUuMsP26Vd
	RpAAIQM4JDP7AUA9KDV11+K4cUlh0zB3HTiXax0=
X-Google-Smtp-Source: AGHT+IHNnA1jJLpoG99Qf4MtqrXL7pSGn84JaLFCSEuXNrv2Y1tFrtVBswcjE4WuHMy1rnLXdFVd2Q==
X-Received: by 2002:a05:600c:c8b:b0:401:b2c7:34aa with SMTP id fj11-20020a05600c0c8b00b00401b2c734aamr17068586wmb.33.1696971203282;
        Tue, 10 Oct 2023 13:53:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90? ([2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90])
        by smtp.gmail.com with ESMTPSA id b6-20020adfee86000000b0031f300a4c26sm13505587wro.93.2023.10.10.13.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 13:53:22 -0700 (PDT)
Message-ID: <8943ba03ec46c2c6d115a4fcdb8412571f56543d.camel@linuxfoundation.org>
Subject: Re: [OE-core] Summary of the remaining 6.5 kernel serial issue (and
 6.5 summary)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Paul Gortmaker <p_gortmaker@yahoo.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, Mikko Rapeli <mikko.rapeli@linaro.org>, Randy
	MacLeod <randy.macleod@windriver.com>
Date: Tue, 10 Oct 2023 21:53:22 +0100
In-Reply-To: <178CD9772ED4DEB5.9719@lists.openembedded.org>
References: <178BF2895FF685E6.5378@lists.openembedded.org>
	 <178C1443D3C8D91F.5378@lists.openembedded.org>
	 <178C704E48D36FAB.24994@lists.openembedded.org>
	 <178CD9772ED4DEB5.9719@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 20:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188915

On Tue, 2023-10-10 at 21:37 +0100, Richard Purdie via
lists.openembedded.org wrote:
> I've been asked how to reproduce this setup more easily outside of
> OEQA. I hacked this up:
>=20
> https://www.rpsys.net/wp/rp/simpleqemu.tgz
>=20
> extract it, hack the paths in commands.py to point at a qemux86-64
> build of core-image-minimal and then "./commands" should boot an qemu
> image using the system's qemu binary as it would during the QA tests,
> setting up the two serial ports as it would during tests.
>=20
> Obviously I've just brutally hacked this out of the QA code so there
> are plenty of sharp edges. It should allow the serial setup to be
> replicated and experimented with more easily though without bitbake
> involved. It could be cut down a lot more too.

and set runqemuparams =3D 'nographic' in commands.py if you can't cope
with graphics :).

Cheers,

Richard

