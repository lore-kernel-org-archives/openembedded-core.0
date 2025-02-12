Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7403DC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 09:51:45 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.11451.1739353897548920022
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 01:51:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FMBvkGRZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so3145612f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 01:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739353896; x=1739958696; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dCYLHmLCkji6e54aMFA7st/8vagQwzUNz5FZLWqiPQc=;
        b=FMBvkGRZ4GGVMpa5AnqeVSLGIiDI2C0F8CZiLafBCUwIN6Gax+11uw0DB1o0UtdMam
         rs5p0uUogokWXkWQ3WJF1kcDF3csiYEO+4zW9Sij8RKhP6jnz13kpfmvUoQW21q66oqT
         2pldZtdMYQCvoZWD6JK+8PscL50zCH4DQKi+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739353896; x=1739958696;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCYLHmLCkji6e54aMFA7st/8vagQwzUNz5FZLWqiPQc=;
        b=MUtv/yAjklNL/4foqkHiwe8jEKKCOjACGnFelxbnRj7F7P84sAgAvAMwNX5UikfUdR
         yrwfr/55ll3iVDc/Vftv/V20lOt1Q529tAbgsZYRxXG8YWLBj6oOB8O5GEEKziq46oku
         xtkcn45yZQhPTlqup2OhOzVtvf7LJlwmTcrUCfGU34cFkYrizvTpGKzXu+7a3/GCkMQ6
         oFU5Majo+Wy8aCNbO+e2m0EGIaP5x9TTVQh9iWGkjf9lrWfqPBZhfbjBfe8ntb92i5bG
         9KX0UB/pz2dO8y5MDtzhbB0araeztUIlwZDb5x+R9kmdi2yLGha/DxP7lV89yE7R5FLr
         moTg==
X-Forwarded-Encrypted: i=1; AJvYcCWrDGDPiy5nUWgVI7CTGX++vAthz9ow/nI6JQxuF4yPo+BQHysBYzSTaClt0QhekcvmpinRTn9y5vLTnWCoCpn7Ug==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxfuhQ2P+RdZGgSlIFwvxkSdkuIMt7VXVX8cihCPqkiUl6pWmSh
	8YwFDoOjf8uxK7lkgD+fiH5RfpI68LHWTgn2qq/s+riZ2cSssZpsZDDXzW8j6dj9Fu3kPs9qbLT
	w
X-Gm-Gg: ASbGncv6GZKDyyOmhu0LwMOccNhlkhd3sUGKHZi6jSLt7BruX03QsY66OYenc2EtpjI
	z5RwL78zqVl6QsH2940YVKvp0oHxEI2Vud4IEARirq95AD4u2IMQU/GPWibYF6TBA6cgsvLy3Ik
	PahHCGXd070WjRTkmTa/YTFkZL9J8OIhU0vRPw0Z6Azps9UbQ8Dq1IMevdDxm9nNqz72BEGOrlv
	Sshx2m0mkg0NODyg4cnGW+a09Mkc7WCFqZuBjI03qFAH7p7RqQHTy9F6FaaqIJeRxX0/VmNFfk0
	kI5IFE1pEr1EOVSnTAQV8CR4d8TE1MXYcdqkBA11dt1BRuWkGlq6Etm8y6NnsDkbjzOOt8B8ZL5
	Ppw==
X-Google-Smtp-Source: AGHT+IHdN3CHPsY60mIMQ0fLLlcizW4ANnWVw5TcTr0B+7a6I65wmDutouYXsXtSH5rdrBNNQexnQw==
X-Received: by 2002:a05:6000:1a8c:b0:38d:dd52:1b5d with SMTP id ffacd0b85a97d-38dea2517c9mr1603618f8f.4.1739353895907;
        Wed, 12 Feb 2025 01:51:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:af16:73ba:601:d9ae? ([2001:8b0:aba:5f3c:af16:73ba:601:d9ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcd21fe18sm13882995f8f.91.2025.02.12.01.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:51:35 -0800 (PST)
Message-ID: <4e883a56eb9b74a5663d7ad258194d16b1c79912.camel@linuxfoundation.org>
Subject: Re: [yocto] [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, yocto@lists.yoctoproject.org
Cc: alex.kanavin@gmail.com, ",openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Feb 2025 09:51:34 +0000
In-Reply-To: <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
References: 
	<CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
	 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
	 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
	 <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 09:51:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211219

On Wed, 2025-02-12 at 09:08 +0100, Yoann Congal wrote:
> Le=C2=A0mer. 12 f=C3=A9vr. 2025 =C3=A0=C2=A000:36, Richard Purdie via lis=
ts.yoctoproject.org <richard.purdie=3Dlinuxfoundation.org@lists.yoctoprojec=
t.org> a =C3=A9crit=C2=A0:
> > The repositories were added to try and share bandwidth costs, give
> > people easier mirrors and various other justifications. I warned
> > strongly about the pull request problems at the time, I was told it
> > would get handled and people would help and I was over reacting. Some
> > of the people who made those offers aren't active with the project any
> > more, other things just drifted with time. At one point I ended up
> > having to add those mirrors to my own push scripts and maintain them
> > because nobody else was willing and we had complaints they were not up
> > to date.
> >=20
> > You used to be able to disable pull requests for six month periods, it
> > looks like you can no longer do that and it was a pain having to try
> > and remember anyway.
> >=20
> > The bandwidth/mirror/backup benefits are valid and I'd be reluctant to
> > delete them as some people can only discover things through github too.
> > Google indexing doesn't work well with our own server.
> >=20
> > So I guess I made my own peace with their existence. I know touching
> > them will make it look more like a condoned submission method but I
> > really don't see many good options here. Removing them is a simple easy
> > option but life sometimes isn't easy/simple.
>=20
> We can try things to push users out of github :
> * Leaving a fake PR at the top of the list with a title along the
> line of "Please don't open a PR but instead go to <contributing guide
> link>"
> * using the PR template (the text pre-filled for the new PR
> description) to convey the same info
> * A bot that automatically answer the PRs with a comment with the
> same idea (the bot could also close the PR but that might be a bit
> harsh)

If anyone has experience of setting this up I'd welcome help. The
things I did learn briefly looking yesterday are that:

* the template requires putting .git* files in the repo which is a bit
annoying

* there is a way to do it in a separate repo but that would apply to
all repos, not just oe-core and bitbake, at least from what I read

* our type of account may or may not have some of the features needed
for bots and so on

So I'm not against any of these but it could do with someone with some
experience. I can probably learn what is needed but I have time
challenges like everyone else.

There will probably be a need to maintain any bot going forward too.

Cheers,

Richard




