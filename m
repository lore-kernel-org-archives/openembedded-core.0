Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F184C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 10:03:20 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.7654.1739440995282207341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 02:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eB93kGOG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439585a067eso6916845e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 02:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739440994; x=1740045794; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hoRuUprfz2D1HHrtX9IhqBPe9nGWzjv8+jFKK8iR01M=;
        b=eB93kGOG3VoAK81gk0NpVGIV4SOWSBmeqoe1Pf4IFFMrw3fkyJB/l1XKYjCrtz/eL3
         yvrLbgazo97HXI8RUsqP/R/py0h96/YB4ASZ+Z+iKA9qNjA1ZCWyHc3jNMzzZbBeRDM6
         Zc7aBQlEmSFG5RhyKgPWRLTJLeebeEwoDgnHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739440994; x=1740045794;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hoRuUprfz2D1HHrtX9IhqBPe9nGWzjv8+jFKK8iR01M=;
        b=RNFe460D2IgJk3wN1wp5FYNmfSWJg49ifqYgP1WYA3NqJuODX7qBmNZPC8bXo3P5Zk
         fyeGc8FdWjN86bEGYV58xusER9p+Vx4uH9Kk57PZlqNJHBRnCyyYXCjpJXPgqTDp6TMr
         /NYPlM9a/2YkUoxJSi7CP4UUVSplYf0exRd7CaP2HTzun750UYfWdm+ZO2BqaFj8wjNC
         gsZg12j3+1pmFALZZrM3Xfo0b4XR6QY3Ig/+kklE87RnSAX8OLwax+ubjf7Ttcin39Oi
         RvYwA9deVhMUsp9qnlpY983khN6DXYgrNybb65SHCt6tXoWeaLkRoTOOVacqkmpHh9OT
         jr9g==
X-Forwarded-Encrypted: i=1; AJvYcCWB3yFEuW4uvP17BG5Z6Oy1EfoA0trz/w0T8NfoVumcaK1djnf4IUQZRYmu5FcSXA+YjeIr+svQT+TXsQxIUKrpIw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwUjLsZKKx5LYkr+iprEll+vu/0FZm/Hxr5tChyQPgbb9D0/9v2
	ow3ZLPWdwA69uMB6DLKDF28W5yDXvORytqipNY54XHU8475n6j5q/4C4yIytfkVAUeedxE5I7rO
	+
X-Gm-Gg: ASbGncugMgLLNluCC+za8uCxWDrU/xqc+sviQuTDTl+FG2mzHEdtyk2yTRDiYz933fb
	Ch5A/ChJB+hujqEg4RXOiBh8yG4APljCotVlwHEtN/u25ycrhNIO4WDmYHew1W+BTvqzzXmrSZD
	zvu67mSh+HqKqD6VIq1F6ejHHqPPQvrV53zj8Te6UU8TWEEmfRAzaptDeIhb8fl/TBCZg4lbS7S
	a/lno/jGe2nazlQ8oWy8ZyqyiOGvHe2yE/AP6yUb5E4u6GJUl/MU+ORj+Wlj5LYMDpJy4y2sbE4
	bFuKvVe9OfLOFidqGKgfAT0v5Taw6GikvPBGu+uA7EhysGaVLbkgj60YdTbQQYWt+SlnGRWvxOc
	8P72Z
X-Google-Smtp-Source: AGHT+IHqfseME10E4fKUPdXjXASUmImsRU4p6LFe/FKAQLpWn/6OOi2G5yl3kZJz0MKgx9794cMC2g==
X-Received: by 2002:a05:600c:1e19:b0:439:63de:3611 with SMTP id 5b1f17b1804b1-43963de3706mr9924515e9.24.1739440993650;
        Thu, 13 Feb 2025 02:03:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:62a1:585d:a736:8828? ([2001:8b0:aba:5f3c:62a1:585d:a736:8828])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b84bcsm45442175e9.40.2025.02.13.02.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 02:03:12 -0800 (PST)
Message-ID: <14a350e52c4e567fa995b08978b418fe1e43831e.camel@linuxfoundation.org>
Subject: Re: [yocto] [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Yoann Congal
	 <yoann.congal@smile.fr>
Cc: Yocto Mailing list <yocto@lists.yoctoproject.org>, 
 ",openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Feb 2025 10:03:12 +0000
In-Reply-To: <CANNYZj_8qPoOjhR=uR_7WRZu0V0YdhbcN43fA6mbnQBU5198fw@mail.gmail.com>
References: 
	<CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
	 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
	 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
	 <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
	 <4e883a56eb9b74a5663d7ad258194d16b1c79912.camel@linuxfoundation.org>
	 <CAMSfU+44qwScnoDP4As37TNHYvwx5mBmTdGEQgq_VVz7woh6sQ@mail.gmail.com>
	 <CAMSfU+4MY-JVmWPUixJYiUrtKd2CXHrJuQ0sMJJrrkLzrvAuvA@mail.gmail.com>
	 <CANNYZj_8o=SHOn-kRBxzwc8vp3omCL290SA-jKkL_En1m2SWEA@mail.gmail.com>
	 <2c1bcbb1d5b75b925d9af2bd300d376a973e314e.camel@linuxfoundation.org>
	 <CANNYZj88RSkyChK6NwJU2OVxmGXzD2W8UcGyYe92ii8v8hdFqQ@mail.gmail.com>
	 <CAMSfU+5Af0=w0N_kK1HLx4nNnQqGOv54C2qC-e7Q0Lm5NQ0Vrw@mail.gmail.com>
	 <CANNYZj_8qPoOjhR=uR_7WRZu0V0YdhbcN43fA6mbnQBU5198fw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 10:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211316

On Thu, 2025-02-13 at 10:54 +0100, Alexander Kanavin wrote:
> On Thu, 13 Feb 2025 at 10:53, Yoann Congal <yoann.congal@smile.fr> wrote:
> > > > I don't think the github repo is going to work for either YP or OE
> > > > since there are repositories in both that use pull requests and we
> > > > can't have a one size fits all message. I think that means we would
> > > > have to do this with a .github directory in the repos themselves.
>=20
> > That would mean to create a ".github/" directory in those. Are we ready=
=C2=A0
> > to do this?
>=20
> I think so. RP pretty much confirmed this just above?

I said that it was probably the only viable way we've seen so far. I'm
not happy at the idea. I've not said "yes we should" as yet.

I'm wondering if we should set up that default repo saying "no pull
requests" then ask repos that do accept them to override the message
with their own pull request file? The default repo is only used as a
fallback. Does an empty file do the right thing just to remove the
default message?

Cheers,

Richard





