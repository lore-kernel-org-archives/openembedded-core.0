Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05B6C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 10:37:29 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.7728.1721126240808572154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 03:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dbF7WmMo;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eedea0fd88so34374051fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 03:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721126239; x=1721731039; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=crwo7nqDaMFGeBL14gNjq5zTDS5wl2UNZFSa5cvOp5Y=;
        b=dbF7WmMo5nW9XJrzxiJ6ZwsKvO0OHDL/BOzusI6mRx+EZnoxGY24DjTSX8KhzwkaTb
         YENJBhs1G8oU32usLUGwwJLNCc2ZkUxb7wyYE32IpcbWCVBOkiTEK/vdkvh10mlihkpa
         pj8J+xP2RDZcFrKLlLk1ApcwxZPYktN3NlfNVSuL1bJ8xsWfbN0xKlVT/oqW9aFYJiAS
         suYtPGMEQpEFy0jlChkp+rfcXN2Ik9/82v7iPfWnK1s4+Lu/fUVYZKEMaAqs1SeXWVrx
         2VgG4s62RS+LTrKVSbfw6fJT0eBvUwDfTtp0MdCFUgMTLaDYnpFtes+fPftI+/4S9L8I
         edeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721126239; x=1721731039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crwo7nqDaMFGeBL14gNjq5zTDS5wl2UNZFSa5cvOp5Y=;
        b=Ab+rwhPzPLLRTXPdiNLd5hQ5lwK4gU+7IkguEwAYYbTpUO325t9kgc5T6AO76OhwEP
         f7lrChC4ZtfeYcR7zKRzijVKuwS3puHHt2RTtnDBZGVmdFSmKkuakGOV6Ku+jyzhT/yH
         BYw9uCrwFQJ2Zz1p9BogoxD7X5vPFgJunJ/E6pzi/ejeFjJyc0qehlG3At1vwcFDBRGy
         TmYyQH5Pocub2O+ibbHqpnunDyCZkta3gbFFa2jO82nVoRGbXcpz7DEMX519sfd8nPWn
         WthWyGf0m+PHKUvqWwOmiYhBcVlWboxElomuNXWwdK2gv3JiitXiSqfv+88rLvviKjwk
         oDzA==
X-Forwarded-Encrypted: i=1; AJvYcCUxdOu3rX6dmzHYuNHMoNggPrpXgydmLV9NRXvSIgkIv/pbw9yvH+381++lU682GXFF5yiThD0HMgQl/HMulks19QW3XFE8oY5khr44niBzYlC0rHk95hS+
X-Gm-Message-State: AOJu0YxQDzy2ppq2tpdocNU3059IuTvnCvt34q4PmmyJeKZfVD2oyCDs
	ZMdKpJ2j4Hztnz5aoP7IIC/pJ9fv6t09uDJ5lr2VI3Uft8d5jAp98fQiqqnTt/dtLjuuTJePSbB
	xynOLKane7nrKlz/hDL4lwG+diHI=
X-Google-Smtp-Source: AGHT+IFT+l2S2LNu4Canc+lRfN2wkBWZFdwiXgTGjCfQEJ7nd5OY9AHMMkrK9dOYCCyBUCXdC0+j8QgRHl8kbRNHu0k=
X-Received: by 2002:a2e:9b1a:0:b0:2ee:84af:dfc4 with SMTP id
 38308e7fff4ca-2eef41ea1d5mr12000451fa.43.1721126238489; Tue, 16 Jul 2024
 03:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240716092955.2463-1-jose.quaresma@foundries.io>
 <20240716092955.2463-2-jose.quaresma@foundries.io> <0fcd691268dbbb1e3d8c3dc4c4714b64de53094c.camel@linuxfoundation.org>
 <8EFB65D9-7969-4570-9053-5649B9229241@arm.com>
In-Reply-To: <8EFB65D9-7969-4570-9053-5649B9229241@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jul 2024 12:37:06 +0200
Message-ID: <CANNYZj9geo=_5qunxr5tYg_gX8xebAEjythXG0SHKKZDzZ4LaQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4 2/3] openssh: systemd sd-notify patch was
 rejected upstream
To: ross.burton@arm.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Jose Quaresma <quaresma.jose@gmail.com>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 10:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202104

On Tue, 16 Jul 2024 at 12:31, Ross Burton via lists.openembedded.org
<ross.burton=arm.com@lists.openembedded.org> wrote:
> > I was reading about this in your previous patch and was planning to
> > make a comment about it. Thanks for splitting it out!
> >
> > I remember when I was asked to originally merge this patch to OE-Core
> > and I had reservations at the time. I tried to push back and was told
> > all the other distros were doing it and it was essential we did as well
> > :/.
> >
> > This does raise the question of whether we should be carrying it. Did
> > the other distros do anything with it after the XZ issue?
>
> Red Hat have already rewritten the systemd integration piece to write directly to the pipe instead of using libsystemd:
>
> https://src.fedoraproject.org/rpms/openssh/blob/rawhide/f/openssh-9.8p1-systemd.patch

So does Debian:
https://salsa.debian.org/ssh-team/openssh/-/commit/cc5f37cb8405cba624a133f4b8f464fbe381c5c8

Alex

