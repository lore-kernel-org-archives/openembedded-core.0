Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5BBC67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 17:00:43 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.112723.1712595634281557934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Apr 2024 10:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P7BcbHMR;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6151e2d037dso53128067b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 10:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712595633; x=1713200433; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xap3hlEo6oHLbN4NUO/721bN8+yfbl3uR9fmvJK3XHE=;
        b=P7BcbHMRmZ8qWu7E94qIDS5e11odEzb2ufkp0nQr3P2KvUecxTTmEwMVEi4ECz/x9f
         d2uuFD7iPul1rvi2/S1KT3FvJuMHODT7I4HROwiX2JPwt06z2Am5nJI3EWRNsw/pQAxR
         cUFtddkh/Qx8ZXuZaW/a7m3u3Q/QlQmph1NnNWLZX8m0rdKIqYRIHpMPksbVYEXUHrpS
         yA33wOuxWmsNvYOARjg41ZJjJLIM4B/2dlMdVPtkB++7CE03NBZhyvjhZgArOuzYVjPT
         VxaQH2pjJADHfBZCi/5bVAjiIBalvggCmAjJExmR/klD8R543crOL5UNX5v/UYWCdTCE
         4UJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712595633; x=1713200433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xap3hlEo6oHLbN4NUO/721bN8+yfbl3uR9fmvJK3XHE=;
        b=TQWXbDLYA6/kd0o5srE2BfBpcxBVDHDjTNNns4jzzNwJ7PitYbcq+yC2huVmnvcOEd
         +Fwm2zkMfenm+gqB4S/PaeW+hRCE0pQ9ZUAxBLZlxrLVgHdS5O8DhZu7Odzqbx00+ooT
         rqr/l0xqFv4+jSJytX3Cw7V7IVYUmCmdXSHWqv7tC+rKXBM/co98Up6C7QwBLncd17K9
         oFXILmB0HulQpLlYMjYHpMXunycm72St8JueWmip9piZsm6T6p3bDoGuSizue90OELGx
         6xK+AnelHYECuaqQj1tTWDpZ9z7CIZvYoMuEVLG7nuJ07Pvdl9ovh2yQ1JBYg2S+r+np
         /lEw==
X-Gm-Message-State: AOJu0YyEB2VVZnyfc9vc/Ql9xRccLzrwfFUR92+fF0tWRBM99YSFH9t4
	bXq7+UMpP+nT1t60h33gIfFGDeNjQTdeoO/jdGE2SHJVy//crZes7shqyIVXLerQlVz/M/ksb5W
	uX94ZbwsiAaumHuJdlXyxdx0148Y=
X-Google-Smtp-Source: AGHT+IHuPdy6EBJmjlKB4AU+yX6CW2SkWH0NnRKU9wA+1Dh4A6K5/mceOP7nSIrOYpBJfmNLz2iCduuA+YLyTB2NID8=
X-Received: by 2002:a81:c251:0:b0:60a:2c16:da3f with SMTP id
 t17-20020a81c251000000b0060a2c16da3fmr8485379ywg.28.1712595633200; Mon, 08
 Apr 2024 10:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240402002058.3910908-1-danismostlikely@gmail.com>
 <20240402002058.3910908-3-danismostlikely@gmail.com> <lybk6krpa7.fsf@ensc-pc.intern.sigma-chemnitz.de>
In-Reply-To: <lybk6krpa7.fsf@ensc-pc.intern.sigma-chemnitz.de>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Mon, 8 Apr 2024 11:00:22 -0600
Message-ID: <CACS+7ZRUag4XhRHi+mjW2Bn-9Dns_oGoNoZVSy1CyhSD9DHySg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 3/3] nfs-utils: Configure nfsv4 ID mapping & Kerberos
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org, 
	Daniel McGregor <daniel.mcgregor@vecima.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 17:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198016

On Mon, 8 Apr 2024 at 06:51, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
>
> "Dan McGregor" <danismostlikely@gmail.com> writes:
>
> > Add support for the nfsv4 user ID mapping daemon, configured with
> > a sensible default, and add a packageconfig for Kerberos support.
> >
> > This is reasonably tested in production in our environment, but only
> > systemd support. There'll be some more work to do to get GSSAPI and
> > NFS idmapd support integreated into that.
>
> Just for interest: how do you solve GSSAPI?  I made it work for me, put
> it requires ugly changes (e.g. see [1])
>
> There is an early dependency loop in libtirpc -> python -> kerberos ->
> openssl -> python.  I solved it by

That's interesting; my setup didn't enable openssl for krb5, so I
avoided the dependency loop.

But you're right, looks like a bit more work'll be needed to make that
loop go away.

>
> - creating a throw-away krb5-initial package [2]; installs libraries in
>   /opt/krb5 and is used only at a few places.
>
> - splitting libtirpc; this required to touch only a few other packages
>   some weeks/months ago.  But now, [file-rdeps] error is triggered and
>   every
>
> Both is ugly....
>
Yep they are. I think one potential way to deal with this is have a
local build of tirpc for nfs-utils. Or splitting tirpc up into two
related recipes that somehow don't stomp on each other, like a
tirpc-initial and tirpc like we do with libgcc.

>
>
> Enrico
>
> Footnotes:
> [1]  https://gitlab.com/ensc-groups/bpi-router/de.ensc.bpi-router/-/tree/nanbield-next/meta-core/recipes-extended/libtirpc?ref_type=heads
>
>      (there exists a newer version but I do have not pushed it yet...)
>
> [2]  https://gitlab.com/ensc-groups/bpi-router/de.ensc.bpi-router/-/tree/nanbield-next/meta-core/recipes-connectivity/krb5?ref_type=heads
>

