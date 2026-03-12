Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04739105A59B
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 13:21:41 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21139.1773321691670757357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 06:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RV9hTqzj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so982466f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 06:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773321690; x=1773926490; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jPs6Gbbcc+jXUNnY9gWRv7d7dC+x/Ro2r76CXwidfY8=;
        b=RV9hTqzjor3vvUpCKxcdMvSl0aZVe+nBRUekw6jM08VjYEqmBLYA7pyVMJAUmoDNRD
         nlV27omgoyAJczzF3zpusWDkqFNhaLDj5EOIfnn1PUm7EOE4iD30ljb4uvDC+zXxYthT
         pcY46Bl9dX2icPKRNEc4lkVppEkYASUhHBVD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773321690; x=1773926490;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPs6Gbbcc+jXUNnY9gWRv7d7dC+x/Ro2r76CXwidfY8=;
        b=sERhVft6kbbpAASO3ZKY0YzqS2KtrDVSpshj7yJhVsoGgYQIV7lnOwcrN0+HSa80qT
         gR9qhm6gDGTYDYARZoDC93AtY0LlLc7DY4Bx4eyfwzOBZJZyPWBCNwxRc9mxvwNZHKud
         sSPj9GO8MpKAtphGZc8TdCaw212jALWpd4Mf/c8Ho/cgTW1IQCHEx+FJ6SQGiOOc91Zy
         rTNYjnr3fXI4OZb7LclqMcH4ttpexltS0QvqAfy1qEDrCXENWRq7vD0Jhyh4xrByGicR
         8TFIwOyDMjVP8XapuoakKhaFhkKeEP+SBOYkUBUJ7Czlxxz7fzKd2Fp2nc+BlOdkCSxD
         XO/Q==
X-Gm-Message-State: AOJu0YwdbejBmqVfIqkkk4eMh4QaJ30gJN+LZKzg37vr8gTNNYfAIyJu
	QQfrSFPffzbC7GazU3BDBFzVEkC19AyHWUuqKDnhTgCwoPmnyGn5ibBtbwT5XvfJITQ=
X-Gm-Gg: ATEYQzxqvvRk5ZYgHvYYjW4vfjPxTSSKqEw9Ui6RpRKJt7u7QXKpZwhzqDLpED1mpE8
	0SXK1Un2dgF1giig5YnMMQC3sKX33vKxleG84nQqx9lBY+ldtYYPb7N50MNAibm0riBq+o6Q3EB
	mJLf39b9UU5DzplsIyXW0gb6zEIg1dksI5ZUrCJ6FqVPe+fNIoiMalPrCP6/J2ucREun96vzVO8
	i5WxWs3whfOpm7nmmo3EZVh9oGB2+udd1tiUJWE3YauGa9+s96477bKXkOU4u5ZERHWULrnHNPg
	pshqmlaqGTft6Utcvxlu/2LRlPP5L93c1xiq3ysPLEmQGjJMqhXUCrCvfc2jU5vetYrJvOM2JGH
	iLqaN+lRQ6HzKg+gLIuYkB6iVqzSyuOfc6CNA3M5Lrz5VgeNOU3eybKygXFCiixwowo2pcWhye7
	J3qwCBb+L5IxzxA2P1kM2UEboZlAmS1KK08ML0t2uMWNMA6bRhX5gLEY653ztrerk7OPfh6pNKj
	kykxs4tC2rE
X-Received: by 2002:a5d:588e:0:b0:439:5c75:dc08 with SMTP id ffacd0b85a97d-439f81bc54dmr11864253f8f.10.1773321689930;
        Thu, 12 Mar 2026 06:21:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:215f:5162:d0b:8f1d? ([2001:8b0:aba:5f3c:215f:5162:d0b:8f1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm6399143f8f.13.2026.03.12.06.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:21:29 -0700 (PDT)
Message-ID: <40e36e02008319799f4d32b9d08df585f4ec70b7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: Enable parallel-frontend-threads
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Date: Thu, 12 Mar 2026 13:21:28 +0000
In-Reply-To: <8a0c93d3-d8ce-4ee0-bb08-fbda7e5f1883@windriver.com>
References: <20260312040703.1487119-1-sundeep.kokkonda@windriver.com>
	 <CANNYZj_D=9z-ZjjP2D+RqVUAF2Kq0a8cd62dqE5doHzSYdPQnA@mail.gmail.com>
	 <8a0c93d3-d8ce-4ee0-bb08-fbda7e5f1883@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 13:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232951

On Thu, 2026-03-12 at 18:41 +0530, Sundeep KOKKONDA wrote:
> >=20
> > I'd suggest we don't hardcode a number, but rather set to
> > oe.utils.cpu_count()
> > (grep oe-core for examples).
> > =C2=A0=C2=A0
> I choose 8 here as there is no noticeable difference between 8/16.
> Also, the rust blog says
> (https://blog.rust-lang.org/2023/11/09/parallel-rustc/) -=20
>=20
> We recommend eight threads because this is the configuration we have
> tested the most and it is known to give good results. Values lower
> than eight will see smaller benefits, but are appropriate if your
> hardware has fewer than eight cores. Values greater than eight will
> give diminishing returns and may even give worse performance.

That sounds like min(oe.utils.parallel_make(), 8) then?

Cheers,

Richard

