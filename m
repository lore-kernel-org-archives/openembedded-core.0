Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5AAD11189
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 16:53:27 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18279.1764176006261608555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 08:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hj5X4T9B;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8804f1bd6a7so63518836d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 08:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764176005; x=1764780805; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HIb3hqPVFGi6aUn+mP8FVHVffN/T1TPigskv7UKsY4I=;
        b=Hj5X4T9BYoxN939Tqev8z3VDB5/6HqMGrd9gKfzzHiOi+U8uD0HN9NcorTPFKWaZOt
         mz6OIqkvk7tkEuHF4ONjZ0jgM/gqwETK596JyZE9A+RgMgqMvYM6d4+foVAQoIi+1x+Q
         CoEsS59LJHEKTM8KJ1R2ck7JwpYr+zEDzhliQEZTkHhEWjoPYxnFfy/Jn/MpSZlnFBDN
         P43L6taVRUaw26jBC7Pph2G5f6a8JC/HG9QwderuIoFzstilr1XJkMSHEUkSwDX0eqUR
         ry8gvilqSfnLQitkHIUg1FuSW4dY0885DMvTrsPtfFlpFGd9y/WXcuY8fM0CtB1od/1P
         UbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176005; x=1764780805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIb3hqPVFGi6aUn+mP8FVHVffN/T1TPigskv7UKsY4I=;
        b=JAZgM+FR3KlO9yF7wTwukMq+VNzIMebkMdHiBsL0ZcLIcMBgvH3Aq+ZQh1oiORX5po
         xe1tijVmGHPbn7yy6P32EIYrOXuxo/Nt0/u3seJApVK9zOppQxDEENEjap1dO22SOT4m
         4KtLquvXRlRZZU80o/Kkqw5219DU4LwGn80cJ8znvUG1nXssnyWVLU5tePyle23yNpJD
         tmMyVvkGVExF4/nrzxoVohaAR1Jf8l+1L1mk/JoEBHFKX7nOLfWlHIaJnOscXZKpBbcI
         u9A6eCfmPARuXBUKk2nHklKJL0Gxy69WWMkiiyN9Okl94UmuFQT1zqcRPLiqsgTxRKu2
         w7jw==
X-Forwarded-Encrypted: i=1; AJvYcCUf7MupIjvliIfnxwWb5k5YHAA/Y3acpo1b+fDo1Sawr69Ygpd9ME4qp/Mvcg4QvjURnIaS3XUAfZiExwCe4SwoRg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzMyL2KK7pl2zIjqkfU2tvCBJ2hY2yKqIhtMwDExmacGbtNh5PP
	bir81YaBDY5Cd/UsuXGixEjIBg2mSlThamKSEtVidTxb9xyYTJBfetPlZ6+gFb0Z3I6aEaNxhOh
	SDhTVM1xbfhhL+H9X8YZwJqAcP545Xcs=
X-Gm-Gg: ASbGncthVklFq3AO7d0mAqBTj1+YKoNCnX4ZL383xGE+pMYQpI2/9i38WtjUQHw60uz
	gJOHP8bRo3p0r2OskZ3jht9brpPqMW1epxWJoISYpqc10Tqnmi7HiwO6Y3gsbUtR7PaX7L5uCaz
	K1MhBPlfSHDFQ+xHbfZAziGWTN1hrmL+Rp7RVgwpGLuv6Zj6rz79jvfetPA/Z17LVjJdxyhu5Vv
	VbblammpAmFi9DF51wUEr5a4hTqxqHgfWDTFInV1Ez4PKJSNpwhXRQmWPwuRZ9HaZjX8lo6Ouyk
	bpN2bB0VVYOZsbGaJnfbKhpoDa/oJomgeg==
X-Google-Smtp-Source: AGHT+IGvtKflfBzz9XoUk41uQ/m7zO2gBScO8xdQwLdsFa1+Zhd03oObmcQqUk3L7mcfsMzvNMXa/HmYnyCfvYNQkPo=
X-Received: by 2002:a05:6214:5090:b0:880:56f6:92ae with SMTP id
 6a1803df08f44-8863b04bd3bmr110260816d6.57.1764176005231; Wed, 26 Nov 2025
 08:53:25 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb8SJ79GDs5aGpz0MGuNNdKf26Z7nw81yNtAsUr9VNq01A@mail.gmail.com>
 <187B446507D0D6B0.100836@lists.yoctoproject.org> <CANNYZj_QRWSTZMne1B0PO8rdo19Ltb=QqQGVmSRk7ZpnaY2MAQ@mail.gmail.com>
 <7cefc9025cec54cc835cd3b065aa653f95a38634.camel@linuxfoundation.org>
In-Reply-To: <7cefc9025cec54cc835cd3b065aa653f95a38634.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Nov 2025 17:53:13 +0100
X-Gm-Features: AWmQ_bmEIwE5jgsk8K5K3wSzbD175cj9epx_WsPnmiruF22yUufYSYuRA0-4Kfc
Message-ID: <CANNYZj8bbNnMYWsJb0oz0a3F_gr=zTYkbj8YLKoRYGdF+XbmBQ@mail.gmail.com>
Subject: Re: sharing sstate in bitbake-setup
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <jpewhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 16:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226806

On Wed, 26 Nov 2025 at 17:41, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
linked into every build.
> >
> > I quickly hacked bitbake's cooker.py to try this out:
> >
> > -                dbfile = (self.data.getVar("PERSISTENT_DIR") or
> > self.data.getVar("CACHE")) + "/hashserv.db"
> > +                dbfile = "/home/alex" + "/hashserv.db"
> >
> >
> > And then made two build directories with shared SSTATE_DIR.
> >
> > TL;DR: everything ran smoothly and as expected.
> >
> > I ran overlapping builds, added no-ops to gnu-config recipe to 'force'
> > hash equivalency, and there were no errors or crashes, and sstate was
> > reused as expected.
> >
> > So I think we should do it like this, subject to 'shared-sstate'
> > setting in bitbake-setup, on by default.
>
> PERSISTENT_DIR is *not* designed to be shared between builds. it might
> happen to work but is a really bad idea. Personally, I think those
> cache directory variables and cache layout need redesigning so we
> should probably take the opportunity to do that.

I am not sharing PERSISTENT_DIR. Only the hash equivalency database in
hashserv.db, which I believe is fine because sqlite has locking
mechanisms and is explicitly designed for it.

Alex

