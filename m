Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C80ECA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 10:37:46 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.18382.1757068665913250743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 03:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=etS2tAFn;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-729c1074875so12503776d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 03:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757068665; x=1757673465; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XsRkoBm9X2tcChXtAhyAQMV8NYCBPrOXSU1ztp8s/QQ=;
        b=etS2tAFnQHeQ9BIGpxC9yHqxjmx/UP3WsFj/W7g+IZmorzhXWh23u4NWBSl5KXcNj4
         Y2NSz0zpDZYUP1uukn5fNIroPPsOxy/XuqMIFl7erzXv9VuCQAkqtleNVrBLNMLIYJ//
         7TgHNyMlAHIArfsg3MMsFJ/c0waoNO2t3vKRCVAbwvDRzHzfs9iN+A0dUwHuUNxHAQNK
         J9iz2Y+9HAex/7ADm/b7DU1oTR1qr65ze9aKYmlJdPDDX1zlgZvpTm+3bMF9Y+bhgQir
         lze7WRjhf4YzyeRbnmddlEDHzPZfkr/WYOL/2Cdpb6kBP2vS0DnbP8sYc1L0/csY/Hvx
         eS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068665; x=1757673465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsRkoBm9X2tcChXtAhyAQMV8NYCBPrOXSU1ztp8s/QQ=;
        b=mFcaQdKCEU932Kqr4Io3zNSOlAq8IZuluR8o3z8aeKoki+oFQH62naTYSDVBk3jr5a
         Mh9oWlnDOra0iTsHLr+UHE6KeH6ftnHvbXI8ePcR8xlKCtYKLZpavrkGNGqxW7O/EPEn
         b5dpuDHlrekc/PQjtrG+rzKgt0VU31nZ4v2K0dKUgyRIqVpbIfNx5vs5OZGdsBvg8kDJ
         VZKei2UhqjUPSp3NKhhT6xtwIXN3VNxpJEbpfMX/eKLiPd3YbYB4oJ9ovU9NcnDo4V47
         th/pT2BgePT68bC5Y0OfhJvUec6/aePmMXPQnrs8sqrIYve22n+xTGQxA6lxXUr+WSgt
         8Nkw==
X-Forwarded-Encrypted: i=1; AJvYcCWBC4IUM0iLkBgp9RXPD7CRvDaf2dnoKpaZq4J+YUf2OUy/KD610pxxmhxYuV9/wKOhAR5644Mtpx0agsccE1KLLA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwqN4KfRjBZ0P7UPt0AsglRLI7jXnTy5udbMHy7NZrSZ2ZZ+1Bd
	GeqbbQNPqJbSguSL4rER+GUNR/WHyAhBIlVGMCITrqTLA5pFgIKX8JLYwVc4xA9H2mKEoQSVmM5
	KQtCx6OLSgVPmYptb5x/KDuDVd9cDAEM=
X-Gm-Gg: ASbGncv3L2j/UxI9SDo3kMhB4B9i3b2lQehVLFKQ64jQQQfy3T9SD9aSHl3BDcDLLH0
	KGWZZeYO//c29A6YwBF9I9c19hgA0zLZ0ZnT0sIh1BECamtWotRFhz3/stdRUoy1j9qj6569twV
	iKrDHqnOcaLPDOUZEw/LP5pV967ZHvpz5QpP80LtpfMlvbeMVqG4cdCSMsJBYxGT5Ao5EhQFfJp
	hKQpuXTMAwgAt6jerWlvNWRfOgFpnNVEckHRUEr1StQgpb14fB9M00EsChoeDEk3K9RnHKQTVZI
	DGNHEawcmQhPEWa0QiVDPeTkGR7yO4J21As2fDanMa4jOM7gvxk=
X-Google-Smtp-Source: AGHT+IEYRNv2EaLOVE8qAZHgQQwur6wlaepMreHW1sFbIwsmAAgHDx8lvgorJWZcpTOAOrG1TikzDZ1LV1FxiY/KLII=
X-Received: by 2002:a05:6214:194b:b0:70f:a74a:58e6 with SMTP id
 6a1803df08f44-70fac9343f0mr252914596d6.62.1757068664787; Fri, 05 Sep 2025
 03:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250902022119.3497724-1-raj.khem@gmail.com> <31C35016-F8EA-4763-8274-4C229DF73079@arm.com>
 <CAMKF1spvoC1tT3Etmr7=8vxOhJhk9nszUa52nJw8YYur-8sGVg@mail.gmail.com>
In-Reply-To: <CAMKF1spvoC1tT3Etmr7=8vxOhJhk9nszUa52nJw8YYur-8sGVg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Sep 2025 12:37:33 +0200
X-Gm-Features: Ac12FXwrYquvyJfBRM0bXvRRlY6nwRrYGlaCM7upodtiZWyACOv4eLOinowkvBc
Message-ID: <CANNYZj9+Be9zYMM_zCpTOC-87WhVMiZgvnSL2kzL_9o4ON-OUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python: Correct the upstream status in NODEV patch
To: raj.khem@gmail.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 10:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222983

On Thu, 4 Sept 2025 at 19:35, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> right, I have already added to the issue which caused the problem,
> hopefully that is a better place to call it out.
>
> https://github.com/python/cpython/pull/31794#discussion_r2314773987

I disagree. That pull request is already merged, and so it's far too
easy to ignore or miss the report. This warrants its own ticket.

Alex

