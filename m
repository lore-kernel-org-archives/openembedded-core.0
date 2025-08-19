Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633BACA0EED
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 22:41:46 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.6965.1755643301192453768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 15:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YTrxYWcY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.177, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-333f8d3be05so40619571fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 15:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1755643299; x=1756248099; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87m2YA+4c3f72IorOrM3xF7YBc77DKJTwvQi1BrAyoA=;
        b=YTrxYWcYIVnjj0XXf3MpUqcFN+DxLa0Y1K1/L4HQnxEz6bIft9l9rP1yvqVaqzpixi
         xa/Rk6T+lm0XYm8XeTVufcusvPDk2sMldw7oOCw4l8oOdTIiJbaKlnbj9JR4MyU9eBoo
         iRbQxsXozu4ciiyrUq8nlyAtOmOLSHSxRJxLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755643299; x=1756248099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87m2YA+4c3f72IorOrM3xF7YBc77DKJTwvQi1BrAyoA=;
        b=gVr+4Mjr8lvx14Cm9ndbhTKru3zMTLKbcRxH2Pif9ugwF2m257cof+yTPK9MjgGMRZ
         xzivioXZcb9ev25SIJiHW3uRVJKAnbgOlWLLC1K5Y1bsXnszldAPenrH7YyzSRE8QnF8
         7edwBZK6Sa3XTaRm/x1r3PTTk7Fk8G8j1QNwA5Myx8PNA8H4UjlcIk7j5Wsoa3Q4OzgV
         HZuytI6f5prQfzumbfZYjzp+bAmP5tBXgjzLPaRGlAAUgi6HWvTWkyk+QdjqnneUSnbw
         ezwZczmctbX7IB2RJfweSsbFRpn5lFJkAVNPHGNiqd/xatP4kxkTAB6b6tRldT0xuoRp
         sT1A==
X-Forwarded-Encrypted: i=1; AJvYcCXOjREsMnkI5sQH38xqLYwq+9UbdLoqPs32+xTzwnnMWVzBh01+xNPYrrz+LtfnR/0y/BqIJD2WbxKY76H0M1QEig==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxXDSRdnJFn++YE7SjnhZOG7/OK7ZCO6emlV03/xTTyf6ezQrHg
	rC84rLhKXPXCcf1WleFEPR4uefuhttxut9oK5UnhW1QBIGxaRm6r1/f9m6zLygA6BfrQ0EA3rqt
	HytWsKNdtQU3LGwmIgdeKLuvVr6e93o+MohqV3dus/Q==
X-Gm-Gg: ASbGncuIm4fgjbrePO9cxGHpKQ+RTEifZmMj8KNuV1n1li93E+T3oPW6bxYh++uqk2z
	UfVFARaQllbcNOqBOwe4hv3CErhcP27wq2pTyf8RBDnLJ6fdwbRzv34a78sHgN7wTVFDR7BF4TA
	sMn/Z+SyOvsfPgfWnL9fJAipdS4XA6LUAGrb5aDLGc2MJKFxh9gHFyvJm04wgL9b8tylAkgot6t
	4jRKsEUlQQ4UQk=
X-Google-Smtp-Source: AGHT+IHjXOh/HA2XgWg5gi6ixbY6nPfOfCSscGyRFQA2gru1c2i2BiofU5+pP8BDxZDMiStac5C7PdHuOuAPEZSQajg=
X-Received: by 2002:a05:651c:4015:b0:333:ad0c:a44e with SMTP id
 38308e7fff4ca-3353bc27687mr1379911fa.7.1755643298597; Tue, 19 Aug 2025
 15:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=TZnJGDvBN8LBEoVbRcTJ6k1fGdOXVzss3bQmjZH4WknA@mail.gmail.com>
 <63a28aea-58c9-453b-9b03-3df29118044b@ibeeto.com>
In-Reply-To: <63a28aea-58c9-453b-9b03-3df29118044b@ibeeto.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Tue, 19 Aug 2025 15:41:26 -0700
X-Gm-Features: Ac12FXxv2GRQBTiYVn0Y83l1OHx9vd9vvAj_g7kiu-BHl-CHJ0mQY1GKAbmuGPg
Message-ID: <CADfgfoZKuU2uMcPZFO3nMrXYJQMA66qL_b3O-1LJhWVdq13sQA@mail.gmail.com>
Subject: Re: [yocto] Renaming the yocto-security mailing list
To: rybczynska@gmail.com
Cc: yocto@lists.yoctoproject.org, rudolf.streif@ibeeto.com, 
	yocto-security@yoctoproject.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 22:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222151

I've updated yocto-security@lists.yoctoproject.org to require
moderator approval for new topics. This should prevent private
security reports from being posted publicly by mistake.
security@yoctoproject.org is not a private list but instead forwards
email received to members of the security team.

I believe this solves the issue without requiring changes to the list
name or documentation.

On Tue, Aug 19, 2025 at 2:50=E2=80=AFPM Rudolf J Streif via
lists.yoctoproject.org
<rudolf.streif=3Dibeeto.com@lists.yoctoproject.org> wrote:
>
> I don't any specifics about the incident. I suppose security-relevant
> information was submitted to a public mailing list. A private mailing
> list may help but in the end it's security-by-obfuscation. A mailing
> list for submitting CVEs is not the best choice imho. A secure web form
> should be better. We have a CVE Status page
> (https://wiki.yoctoproject.org/wiki/CVE_Status) that lists the current
> acknowledged CVEs but of course reported CVEs should go through an
> investigative filter and potentially sanitizing first before put on that
> page.
>
> :rjs
>
> On 8/19/25 8:08 AM, Marta Rybczynska via lists.yoctoproject.org wrote:
> > Hello all,
> > yesterday's incident confirms that yocto-security has a confusing name
> > that might cause confidential reports to arrive there.
> >
> > What about renaming the list to yocto-security-discussion or similar?
> > And eventually redirect yocto-security to the private security list.
> >
> > My reasoning: we shouldn't rename the private list as people might use
> > old versions of documentation and we want them to address the correct
> > private list when needed. It is less critical if a message expected
> > for the public list reaches the private one, than otherwise.
> >
> > What do you think? What is the process to do the change?
> >
> > Kind regards,
> > Marta
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#65771): https://lists.yoctoproject.org/g/yocto/messag=
e/65771
> Mute This Topic: https://lists.yoctoproject.org/mt/114782606/1003190
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [mhalstead@linu=
xfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

