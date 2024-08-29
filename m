Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA7DC87FC9
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 17:16:26 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.25883.1724951781503596427
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 10:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fpc3SxaR;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-27018df4ff3so581418fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 10:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724951781; x=1725556581; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbVTtX97dlrGs0gvAZNEvvCQn3Zbi0pcuHteNrWADmo=;
        b=Fpc3SxaReAI55d8Ebkdnx79WyJ50FSwxy7OXci5EmTc/+5u7SyGmoNE29xXy6Y9A0b
         Ap6XHKRUYH/vUoL2BvOzrG011i7Ggn/dopPVXw1mbmZFvvBe7A0h+N+z7wfr+ILmJdQ/
         CY6eK7tRLvb+hvhPtNitMDVW+jJf1UwAbrJd5mCyx6jyBdPkJOqRFor2u4Bohw6elK6e
         wV+nBHSszB/SrXSwxUcHclTUeDUMDX+GnKMfvS5gBZlvqUNqNciuvpHWImuZoqosxxYv
         UriTexDCfhm+kou/1kD1PPEcgj7eBUze5EiviXhK5x2KUYxCwyIPL+ChG17NOVwSRJqH
         JDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724951781; x=1725556581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbVTtX97dlrGs0gvAZNEvvCQn3Zbi0pcuHteNrWADmo=;
        b=NQFuIbYhns2qS9mGRxBdCIVd0at34lxhYBDLZwVgwc8bQhYpwVFY4CgM/O9MaOggZr
         0+26DSuTvGpTs2BAOGa1jcY1lBls8wyvDJxpAf3Fi+oLafnK6HeP387RRhrMEBoQTvHY
         jyNMVLF0JrnvG6imxjHWHL7GGb/xo8sD5iInnXqK+L/pgaQGOTYs20U9vT01lh2XofH1
         9akXU7ZYef0hqIwkjBkHg7CQjmb8qCFYYmYkM2udxGRVq9YMEifem4YSxDIs15bScMoU
         5+0aAwraDNkWySipPqSBL7IC95R48R3Y71uhZD9XILQ8CjFvucTeh3lusSTiibrfjw5+
         f9rw==
X-Forwarded-Encrypted: i=1; AJvYcCXHHjR9H08pEiU+i5Zh11FS3y3uDfQedHw5lb9tGuRrMQ5MG4waSxVg1O9zSPM9ZBvhj73Y2iT7Ecj0a7/PUXGdww==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1plP4N4EjuECK2vhWADMbN4YdN0KqaUVwDYbhiM+X2qh45q3E
	TJIaxJFf+gnbk6QoKWANL4ATxGbxXkEmD92QYX8nKPhQMeCOuswdaQZj+uBJS1/KxaxXOZy5uyB
	how8UxQyTc7QFthyRFp0yKoLDu5E=
X-Google-Smtp-Source: AGHT+IGPN3pXqMG3gOLmasvgAnsO5p8lSbHJ70OzyM9Gi2p7f8/ZfQ4tc3ZdQo0zwo5esVEmdQXB7uZeg/FctQCWNvQ=
X-Received: by 2002:a05:6870:3906:b0:250:70bb:1a97 with SMTP id
 586e51a60fabf-2779014a9a2mr3921429fac.24.1724951780655; Thu, 29 Aug 2024
 10:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-D+XgSFDNWnJ9LNdRe=RgLq-c5v8AP48s4T18TJ2pDZQ@mail.gmail.com>
 <6670.1724698895497804544@lists.openembedded.org> <9f118764c6f9f2a5361356312b696b6eecad6c56.camel@linuxfoundation.org>
In-Reply-To: <9f118764c6f9f2a5361356312b696b6eecad6c56.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Aug 2024 10:15:54 -0700
Message-ID: <CAMKF1srySLdab0SR9map64pZ9nvGVzsE=K13hqUs_J-RqTi62g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sysvinit: upgrade 3.04 -> 3.10
To: richard.purdie@linuxfoundation.org
Cc: mr.name@web.de, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 17:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203940

On Thu, Aug 29, 2024 at 1:52=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> On Mon, 2024-08-26 at 12:01 -0700, Sven Reschke via
> lists.openembedded.org wrote:
> > Hi Alex and Alexandre,
> >
> > sorry for the delay.
> > I've created a PR on Github on top of your latest changes:
> > https://github.com/Nanowires/oe-core-clone/pull/1
>
> I did try this on our automated testing and there were some issues:
>
> musl build failures:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9440/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9456/st=
eps/11/logs/stdio
>

This can be fixed by using realpath(path, NULL) API instead of
canonicalize_file_name(path), we have done such changes
in few packages e.g. elfutils

https://sourceware.org/git/?p=3Delfutils.git;a=3Dcommitdiff;h=3D06263dda990=
be6778a4beb33481cfd39ce60c623;hp=3Dfd0cee63fb02455a5021ca298da8dadb4df63a9a

there is a meta-oe patch for ssiapi
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support=
/ssiapi/ssiapi/0003-replace-canonicalize_file_name-with-realpath.patch


>
> systemd+sysvinit build failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/9431/st=
eps/25/logs/stdio
>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203905): https://lists.openembedded.org/g/openembedde=
d-core/message/203905
> Mute This Topic: https://lists.openembedded.org/mt/107960881/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

