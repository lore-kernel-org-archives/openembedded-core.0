Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8C6C35FFF
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 10:32:50 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.4616.1742380365633705877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 03:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fGHmDIxt;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8ec399427so51485836d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 03:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742380365; x=1742985165; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wC7leXh61VHcMe46UQWf1Pg7LImbcve/SrwXK26p1+Q=;
        b=fGHmDIxtzqYo+9ZLOI7gPuiXGbyZ9WoN7K0Baw7GM/S/EV8sORKi2536S4zdNzP1M4
         kqMjXtKrFuLAUliDogp348DqohfSp/mS3vNiN24SSeXUPvKaOOoRyt7QxRaY08sxUKyx
         bkzndm+GCKXXuQPm846U5FsgbK2ylddayWUa0l0JJ+HI9jc3aJrFZKBW3Me6CwHjdsoX
         Xc87odfDXOi4zmCZY0PgbqhJb3AQ7j060H09h9Dw95g2t71874KNyacUvv/N2gZqna0X
         uVsWDSSO/VqF0YZ2EfSP7D7IjsnpApOvQ1O8BF3qQp2drpKl5TZL4q1BtAyVsRaFNleb
         ohBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742380365; x=1742985165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wC7leXh61VHcMe46UQWf1Pg7LImbcve/SrwXK26p1+Q=;
        b=GqkxoJqjnBjP2YykPHEOI8thB/XNJ0BWWmH1kCcZqs/4CTnRDs0edJCAhbXuS2X/z7
         smeld+F2GpzQd/BFoELAhEIp2y8pKhMdpwhx6mZqwfMS0TmGZqPx9VMKFVQmhURa/qMO
         k/uVTmAUGkiIHa+brnOxxBFpyNhISGPv5MGnvt/ChAGdTFGiUy+SuTyFJUVo4TNrwhv6
         AeWrqJ+LMX/K/TWa6n7zxTm1IA2T9Kgf0S9qQ7NkGddBL5hPOlVtft6Vfdxowzw5EEbv
         /MtmcppLKB11fGTH9W2NpogeJY4Kue3EXIQ+CYAEU/TlO71z/LV8Pn6Ztb7IlosAFNaA
         Umcg==
X-Gm-Message-State: AOJu0Yz8GX5XWb/fNopdXcM1vW6iCnp7FkdBtI7tgjDvtDMSH4Q9aMJ+
	Gmr31C3X+xD0CnIJQ/SMegHwDbhYIK29qn2ipWc/YDgNQUn0Pqq5OYeNKLX0tmdh52ohDrys4YF
	KodJ4a3IzjN4nYuCV1xyr2yxluWQ=
X-Gm-Gg: ASbGncsf72FWbZKMG2XsudBq03zS9Y+oYoM0diMFDskdJwVS4Pz90WikeZaUy2+28wO
	dI+iriuXBfgVkMNZ+yY7AaxlTDpQl9TLMjWtZ0YJII6fWiE8roOdew70BfDorE4QVs8HU+FPkPW
	77NLa3Kwka6Rsgtysq1TS8DAOzz8XSjBjRtCyarvE636tQbEM2UHMGcEaZTpuV
X-Google-Smtp-Source: AGHT+IFS7sr0BGVlAUupy85uXPfNT5QvmXH3r8aIifgdEtpqRPR+N/A4LTcl6qb26PhTfrIkY+2Gj92xUVe9G2DnXF4=
X-Received: by 2002:ad4:5c67:0:b0:6e4:4484:f35b with SMTP id
 6a1803df08f44-6eb29467a44mr37537286d6.30.1742380364683; Wed, 19 Mar 2025
 03:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250319100959.4102512-1-alex.kanavin@gmail.com>
 <51cc8655a05cc6cfaef32ee550fe11175c23da9c.camel@linuxfoundation.org>
 <CANNYZj_9RmwiA4=PDE1BR-njjX0y0FrCto8H9DTSROJwUjpZCA@mail.gmail.com> <d5992c2c2013bf7ff5ce2d76b1b223f020764d03.camel@linuxfoundation.org>
In-Reply-To: <d5992c2c2013bf7ff5ce2d76b1b223f020764d03.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Mar 2025 11:32:33 +0100
X-Gm-Features: AQ5f1JpnfmBTiIAboy1pG7s-tjrV2nLIEPtCumP9GSocqI-Udq3VVGgjycSyXrw
Message-ID: <CANNYZj9Y-vYzojfiPMdbhtBynfFvuhrrMaH5mbRn9ybvYxSFNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] mesa: correct download location
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 10:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213323

On Wed, 19 Mar 2025 at 11:29, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > > > -SRC_URI =
> > > > "https://mesa.freedesktop.org/archive/glu/glu-${PV}.tar.xz \
> > > > +SRC_URI = "https://archive.mesa3d.org/glu/glu-${PV}.tar.xz \
> > > >             "
> > >
> > > Doesn't this have issues with the "older-versions" directory that
> > > archives are moved off into?
> >
> > I suspect this is the same directory as the previous location, and
> > the issue was already present there? I can't check that anymore: it's
> > now 404.
>
> I think we may need to wait for the dust to settle on the
> freedesktop.org changes before we update urls...

The new location is officially documented though:
https://docs.mesa3d.org/download.html

Alex

