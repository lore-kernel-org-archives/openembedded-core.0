Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C22FC3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 23:17:48 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.42199.1704323862469433751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 15:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H1/Enf2I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d5336986cso108698845e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 15:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704323861; x=1704928661; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0wchKKnmflc7GNpccH26vxlOCkl0veApEt+++iAUVQ=;
        b=H1/Enf2ICRWhMZy1cIK6r1JHMWiAByfZG+Pm27BZQbbG90gjpy9edi/uGad+t08YkV
         u5uBPl3mBPxS09Ry+vdGzAsqOXWpnkgo9IL3t53ogsd8/0F11C/wVMnhbOxTzGd3ZJzl
         90u2BL9Pmo8jWwncwou/jjDYIwrU2bw6cxVpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704323861; x=1704928661;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+0wchKKnmflc7GNpccH26vxlOCkl0veApEt+++iAUVQ=;
        b=uDWO12jmtgPe67ybXka1BGGR7mEn5nKCUJCa6sEP2swIm3Uxs0Vd1t0XTdzheBV48s
         x5ljHC6D5flm8Yfuwv+ZYHAHxhgNnbhvwWx+9+ipyp7kCnYP2tSF2/ESoDQqo/XrDdUw
         5WvzboGvRycBRJk3XtXnOy20wzlm6KCsVBSW65Jh1DblUctQ19xPEDeVdL39coEsA9dB
         ceJc/jYrFKoh6xSvj3nCPNUWdLSLdUpyG6EAkEkVpTIpjqLiR5nPH4mzEVxd90zWNn/Y
         8KqRUlrkNwwHdnNdAfBQ0tyceIUd7BYWvT6LfO9mhKk1jCf8UvIi85ZoN9tRuw/ozk97
         XJAw==
X-Gm-Message-State: AOJu0YzxRrrCTOe3XzPto6f75C/z5Srt198w2w56+iQNY2mACmeX/jLv
	jlny0HSu/yoHNHx98PtOyjqqo+gmbCO5HA==
X-Google-Smtp-Source: AGHT+IFuUl27bXy6hkdb403V9vo3+C9P/KSHpAA4LrN2o5wF/iLbZGPirrQi4ctV8Hti4GywJIjRvw==
X-Received: by 2002:a05:600c:3f8b:b0:40d:88e8:6b7d with SMTP id fs11-20020a05600c3f8b00b0040d88e86b7dmr2312683wmb.194.1704323860584;
        Wed, 03 Jan 2024 15:17:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7c49:db55:5c5b:1a5b? ([2001:8b0:aba:5f3c:7c49:db55:5c5b:1a5b])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c359000b0040d5a5c523csm3775401wmq.1.2024.01.03.15.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 15:17:40 -0800 (PST)
Message-ID: <d711ae4178f5e1144e34f1f8157ea41c165a3500.camel@linuxfoundation.org>
Subject: Re: [OE-core] how to sneak a function into the *middle* of
 "prefuncs"?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 03 Jan 2024 23:17:39 +0000
In-Reply-To: <76b8b03d-dcaa-8dd7-6fe8-32c7bc9baf20@crashcourse.ca>
References: <76b8b03d-dcaa-8dd7-6fe8-32c7bc9baf20@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 23:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193294

On Wed, 2024-01-03 at 11:21 -0500, Robert P. J. Day wrote:
>   no, no, hear me out ... colleague has a vendor's YP build system and
> needs to -- in the middle of a bunch of a task's [prefuncs] -- sneak
> in a signing step. can't be at the beginning (what to be signed not
> created yet), and can't be at the end cuz by then it's too late as the
> artifact has been bundled.
>=20
>   first, as i read it, for a given task, all of the prefuncs are
> invoked in exact L-to-R order, then the task is run, then all of the
> postfuncs are done in L-to-R order. then (and only the) does the
> processing move on to the next task.
>=20
>   given limited freedom to change the vendor's recipes, my first
> thought was to define an "intermediate" task whose only purpose was to
> babysit the signing step, make the signing function either a prefunc
> or postfunc of that task (should not matter which), then redefine the
> preceding and subsequent tasks to split up all those functions
> properly so that the signing step sits in the middle where it belongs.
>=20
>   am i overthinking this? and even if the code processes a single
> task's prefuncs and postfuncs in order, that's not the thing i really
> want to count on.
>=20
>   thoughts?

append or prepend one of the prefunc functions?

Cheers,

Richard

