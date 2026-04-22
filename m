Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41715F9B602
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 09:53:58 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.78630.1776851635096373761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 02:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dVDnQ/uL;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cb3bae8d3eso456512885a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 02:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776851634; cv=none;
        d=google.com; s=arc-20240605;
        b=l07AJTNVukD/dc3c0985kAKFBjggkEx4oHgR5N1kUjtTAtvwiV8e3ZY72JMoSYpcVg
         aMfcO9QC6jsvYo+MhJtZB5MNiZFZ0YEo7UfJJuG8KBpwKP63Bpp5vyv1xXv2PbT2uLk7
         kuwkbBwsrMWPKxPcDNgpAtTnCYaCq6E0ptIcyz2fwqLXJjVMHXq6JJ7lLDnSL/kzBvDr
         h6frELJTy9TStij5S47tnkegaJsCagme06diLUCkw4B/YyR3T/f2c5RGWdpkc/Lb1Srv
         zrbAZiDG0tBAV2u5c0GpxMW7nfbTKKPeaP2nQqnnRGgzeRZXCstXjJAH56bfhRcNQ1h4
         6ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+ah70vmwoP2B+4yK15Uyb3gb8jacSc/mDde9pmnDX6Y=;
        fh=IY1cTBAxAct7v9dbEJDiqbFt7sQ9+KsjKvYX6Of3i4I=;
        b=hrwJ3cGsqFi/IV5E+Q5QTiaBgaQF1bN4jkoZkQRMQP/kL3Ae6IwrOvxFvy/Lv7fLyy
         ITfie7FIkI8HPIXqTOWjSt4PnQ3juBUTQY+760TiUP/qq7jD78y40v6VlE7BNEzr6lNl
         2EkuyZ4vETuxH10RS6QrZjjFQ+s0/qUJe3PT0jHxrRO62PHSNFi4oXJptd6ZNR6wmMtv
         Q5D3cr0gTCkVWddrRgsMI5Q8O4g81XTmOxHODj16bZgCFOwkszXuFKRE8a/cyHhM9IsY
         b7dLNm1JDZA2L/+s/CU71Txf+G65dBPQyVnGP3FmKwHRXoW5bPHR+tYd183ezPkip6Z1
         zohA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776851634; x=1777456434; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ah70vmwoP2B+4yK15Uyb3gb8jacSc/mDde9pmnDX6Y=;
        b=dVDnQ/uLy2nUMW0F1gpcnQBcwUNZTAbyW7cvCkXTHOMyc8pltGJuqJalp0g639uuuG
         NkHaHvs9zzhVYE7MxCVsZyqlF5rW9ysVqN9T1TbcKZ0H2V0Ke1YeLh15tvUNvncRg+5F
         88uF51y/LV9QF0zfGNoHC0ZuEJcJ+ncwn+RwpNhcIyA3ZklBeF4Hb8sZluRVOo9lUoWx
         2M1+OYpPlZz4CCs3X7lcnJYLywFccjS9VYW3NdIAP8Vn8dC0WbH6J04Ribq0Q/p7I4UB
         42jf7Aze3LzBco+Ipgz7j71DOA3/BdUpVOhWhLsao/3+8Q8pG9dmGH+eo2IYdU1oehdD
         pMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776851634; x=1777456434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ah70vmwoP2B+4yK15Uyb3gb8jacSc/mDde9pmnDX6Y=;
        b=aSt+FY8KTj+6a/eqh+aH2zkwxsuyPmebO510Pc4KQ2QfM4FoJHpgG3T4nmMzpzPMVe
         xV+nU8uXUPERz1jw23eOpHNZWRl1z2Jfiw2nIddVkh65hFPE1zm5twr+o1sSOQPblwtu
         gzhwcEoh/3agUWqaza+Lp+0GBF+MDntCa+4pCm4A/I6eFSFbD55pbWi2B61zimnEHVRM
         2wGPGRcBKnUoStiAglVWUZyRBXvaJjM5uv/lEYxzAcstdZEPfbbOc9KZgTzSz+NG1O+0
         M0FOD6EEWB6BPvAlXvLCB893bHdAPlsfwOR1u+IXQe6SS/xfMqc1fgmlQYo5ano1K0Dv
         dUjA==
X-Forwarded-Encrypted: i=1; AFNElJ8eXIdVDXbz/quzhYOc9p/8mBe3VswTZe2czgrRpV8P5wx9vK15njL4RjYlVeIrvvR0/3iTm3uJFLm18lwn8j34og==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzk0pz4DhutQhSXAfQ9jewIy88XxaxXD6YHrzH0juEmt9yvwK1h
	u5AfuIxWDmcUAEWPRXYBgmlyJrMTbdoiu0JspLUMNKSle+DJEznA+FtI42nHT8hFaC1fjin9vbv
	DWwVC2ST2VoBZkiWg+eJ86MxU226kjpQhOA==
X-Gm-Gg: AeBDiespsU9FKLiaQ6uMkCFFrkStRR5K5PVK/GmSdnGoYd8OaeYIB82obFTENVhF0PU
	yrtGkb3fjWmuptyiK5oHBdlBNBrZ3rCyhTqPhzTmFFSgYlRybVkRLCOAvfeWisl6u5tucDMPpXi
	CQ36ACuIQiNeB5XGD+Okn1MRBmuOTAgbBr9IOiz5gQCheyvt9GdBx88Fif5bNipWbGVtmBcJWgy
	06E0rPWGjJyz+J7LNnJPVo8adGrtD71w+vq+gdS/tqQvpsl0+aBg6ztCQe3xsS5IwRhEjTq0NDr
	Z09A2zxC9OWCv/2NdWkXEs1t9H1DgVyKk5eQ0/Lw6jyriE0PyQo4
X-Received: by 2002:a05:6214:519d:b0:89c:4f67:8d17 with SMTP id
 6a1803df08f44-8b0280c9032mr332967196d6.8.1776851633946; Wed, 22 Apr 2026
 02:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <18973B8A1D1BE087.558139@lists.openembedded.org>
 <AS1PR10MB56978C6748852F61C4F7109BFD74A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <17678281463335733ecacbfc29bedd53164414d2.camel@est.tech> <c97339dc-7e9b-4e49-9df8-8df32d4fa5e3@windriver.com>
In-Reply-To: <c97339dc-7e9b-4e49-9df8-8df32d4fa5e3@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Apr 2026 11:53:44 +0200
X-Gm-Features: AQROBzB9aPtHNyTx_Exft-pO63ovLAlFtLgBUn0hzY3kaHRZxT1YdRNpEeM2bng
Message-ID: <CANNYZj9SGkKaQ0zxTjFPPjnvuzD0rXb9bV_ieHG0OY6tdjK7zQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] vim: upgrade 9.1.2144 -> 9.2.0
To: mingli.yu@eng.windriver.com
Cc: David Partain <david.partain@est.tech>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"peter.marko@siemens.com" <peter.marko@siemens.com>, "yoann.congal@smile.fr" <yoann.congal@smile.fr>, 
	Randy MacLeod <randy.macleod@windriver.com>, "Chen, Qi" <Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 09:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235707

Do those CVEs actually affect your product security, or is it just
something you'd like to do to improve CVE reports?

I have this uneasy feeling that people are optimizing statistics
instead of just adding vim to ignorelist and focusing on what actually
matters.

Alex

On Wed, 22 Apr 2026 at 08:37, Yu, Mingli via lists.openembedded.org
<mingli.yu=eng.windriver.com@lists.openembedded.org> wrote:
>
> The number of the vim CVEs in 2026 has reached 15 so far [1], and may
> still be growing. Could we keep upgrading vim to resolve the vim CVEs
> for LTS branch maintenance as we have done in the past?
>
> [1] https://github.com/vim/vim/security
>
> Thanks,
>
> On 3/3/26 18:23, David Partain wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and know the content is safe.
> >
> > On Tue, 2026-02-24 at 16:45 +0000, Peter Marko via lists.openembedded.org wrote:
> >> Alternatively, we could also continue updating vim in LTS like we did in the
> >> past.
> >> For now, there are two active CVEs in LTS releases.
> >> Please let me know if I need to backport patches now or if vim upgrade would
> >> be accepted.
> >
> > Greetings,
> >
> > I've found it quite useful in the past that vim simply gets updated to the
> > latest, even in the LTS branch we use.  Keeping up with vim CVEs is painful
> > otherwise. As such, I would prefer to keep doing things as they have been done
> > in the past.
> >
> > Cheers,
> >
> > David
> >
> >
> >
> >
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235695): https://lists.openembedded.org/g/openembedded-core/message/235695
> Mute This Topic: https://lists.openembedded.org/mt/117978611/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

