Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B2FCD3424
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 09:01:47 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14260.1778058097793925151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 02:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=flz46rvW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b941762394aso881523166b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 02:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778058096; x=1778662896; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+oC1YegyJXWe7u5Ux+R5/DhuLrclOzKpeAaFdgTfQBk=;
        b=flz46rvWCn9on35gB4fxqQo99gx9FUXermY61B8SuoshQ2Agu0ZCJDGjz0GKQEH3s1
         s/+nF2YUM2eVCxOn+r3osSXnm/kK7ppkwBnVAYRs5b/HxdOaCMbmjefZGFIOM4pU2QgO
         +VO+NQniKV7LnUpC6a1fpjFdoX3sTlghf7FF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778058096; x=1778662896;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+oC1YegyJXWe7u5Ux+R5/DhuLrclOzKpeAaFdgTfQBk=;
        b=Af0S5OEQxhJLRkUPq2U4oEUs1bnrnId25mCTZd74A6JgUBXLr1eHs2D5sJVnj9kCBL
         xDbj0y6EmsPDW+kuF/EytBbmHQzkKLrfHF9nTwlNhCulxOF5LFuph6y+oioRGgVZ5ydk
         eXgMHtO9Zfd+4kB5Wwepmiswf2DAX7l5oz/74ZOPy9w2/9hEG7E2D6OtBLtiIQtaQGhK
         cKUtVQBlDK++WmP8IYNPrGYtQNgtoRGA03FIzLHKKpV0VrfWdIPEsVnt4e2Zxt79q6wI
         87dv1tSoh0UCZH6P57Ami9o/Yq9xhkP6a/x8AEmvLv7MRDb0swBgeDO86RMod9hZwy7K
         OaPA==
X-Gm-Message-State: AOJu0Yw9NIoAnDmzhClyoOuTbBlj68QT8tnSyEj1OtkGOIzTRuaLFjoD
	K4QC3nP0w1TkhEdRsLl44xUQxJOGC4sWez1Oeyj7eany/d/wYomCfsJ/m2DmfbYU6Gw=
X-Gm-Gg: AeBDiesudXPRXsJia78lOvZ6ro5tIABjICpjaJI+isA74REhAC8vG9Sr0gnON595HxR
	WAHmBI4Lw/iqqQNduWcX6NDoe/IRT3UYihTqtaEo7asB8Hh1tkAwjCvKClveNjUxTd1T7x3rXAk
	oijx3jyQbCaJy0+a7q50XgGFAbSRMRGy0P1RBkHQxuswOwYa7O/jUSZuS5sje4RDBkR+r9OJzIa
	e+gfIAhb6qhZACGsneg1DWCskem4+0xbpcmIvwUMAm/EfejI02IbRl7/Wow+hyHigo9Y4CT8Re9
	SxcmiI+w8DJGcncwjymeYmIaortWIxdYVeLzCVWQ8Y30I7e/KzPdtSgthMjUlQ7W5yo8W0T5M2P
	L5WUrKd+xbRMhR6byLuvctFk3gMpvYFwUR7rfByrr7/Cg6hbnrMZsIMmd+AeNtM/mkEoJvb1On+
	drPWzFzo/OV0dCR0DhCD3/3cw1injv+5QkUVZ+ZJOQnyc9PhcKeAbQc7bZZTlo12i/xPTQ0A/yp
	lnLEl0Q+rIbq+uNhIvG25M1NIA=
X-Received: by 2002:a17:907:60cd:b0:ba7:a1cb:eae4 with SMTP id a640c23a62f3a-bc56cc2e0demr109334266b.23.1778058095925;
        Wed, 06 May 2026 02:01:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5409:94a2:bd3e:6c21? ([2001:8b0:aba:5f3c:5409:94a2:bd3e:6c21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55b17a95csm58389966b.8.2026.05.06.02.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 02:01:35 -0700 (PDT)
Message-ID: <36dd61868df6807b884bd0e1c0c3d7d2bf6d500e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 46/62] python3-requests: upgrade 2.32.5 ->
 2.33.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, paul@pbarker.dev
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 06 May 2026 10:01:34 +0100
In-Reply-To: <CANNYZj_uuzRz8sK9i15a4Gjx_=R0LrvXL1KEZM_tF7SRoiS89g@mail.gmail.com>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
	 <20260502162929.1377831-46-richard.purdie@linuxfoundation.org>
	 <5e34a6274b6062a0e1b2b05524e48589501f0c6f.camel@pbarker.dev>
	 <CANNYZj_uuzRz8sK9i15a4Gjx_=R0LrvXL1KEZM_tF7SRoiS89g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 09:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236537

On Wed, 2026-05-06 at 10:59 +0200, Alexander Kanavin wrote:
> On Wed, 6 May 2026 at 10:33, Paul Barker via lists.openembedded.org
> <paul=3Dpbarker.dev@lists.openembedded.org> wrote:
> > > -SRC_URI +=3D "file://CVE-2026-25645.patch"
> > > -SRC_URI:append:class-nativesdk =3D " file://environment.d-python3-re=
quests.sh"
> > > +SRC_URI +=3D "file://environment.d-python3-requests.sh"
> >=20
> > I assume this change is intended, environment.d-python3-requests.sh is
> > only installed for nativesdk anyway. It's worth a quick mention in the
> > commit message.
>=20
> This change might've come from devtool/auh, but in any case
> eliminating conditional appends to SRC_URI is a good idea. Especially
> conditional patches.

It wasn't intentional and did come from devtool/auh, somehow I missed
it, much as I'd love to pretend otherwise! It is probably worth
considering but clearly needs proper testing and a commit message
explaining it.

Cheers,

Richard

