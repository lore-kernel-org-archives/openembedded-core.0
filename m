Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAC5C4829C
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 13:35:37 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.17675.1707399328083481083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 05:35:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kfoXehRX;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cf5917f049so21456481fa.2;
        Thu, 08 Feb 2024 05:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707399326; x=1708004126; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1s1rNS01csEyUp76pxp9gN2lBuv5jw0sAnibnhbcLJk=;
        b=kfoXehRXUVN6KTcEbVIL10OXL3P9MHdDJAk6cx9qwd8hlBX4oP+sswrw9bLmBzNjky
         TcPqtGdpLxnSRQFce8KZ1LEUNsa7iJRmj8DcLKqw7omQ9M7mv0RLntr7y50TfnxfshZb
         dhdOlY5M3w3fhXQ8GGbuf1V+rqpIpnwyVPZlwF5Lr8gOTFs51JhueKIYQAj9Tb+RLdob
         g8L6nMYdfiwQtetAxP8KmFzIWHjdXgMD+vBCUtBnQ4oxlePLqD+3+CeF/ooK7fel30Bt
         UN0aK2oy5hA+pvZwWOWVgd/Y+WIOxG9Ekv6s7hH/SnWhwUoQdglP2Gu1cN1ATcCgdFCa
         uQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707399326; x=1708004126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1s1rNS01csEyUp76pxp9gN2lBuv5jw0sAnibnhbcLJk=;
        b=ZHSw0JkCc7KMtMftfEb0yjIo0ke/jfngMkcj8pgOvwa7woYEP/QdlvflWUHNC45eTj
         1sp1QW5SeVxPH4Jug91GmwEJLJW4YDxxWY+S1r9aJ6K8P2DGjFSqD6mAXJMV0jrncvaJ
         szmvUovr5OtSrm/wAkglu0QO0R0XGD1/JevKTSHQNDuzH48HTuge2eaDI8VOtRzlcrX3
         jiHNgUvQIYsY2bUPj4GQy9Pn4F0OTY+C/fxfgsuwbNJPSAjKR0SlYl8yps2M6q4bvuUa
         a/gSDzmH3ZcH+3ieY1TiyEjrGwwm7qjVfJnMp688tl5c5MKc3ND+3XlBv9CdDZ0MUexL
         G0Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWCbF74Tq9Q6n8tmOsnh5ZYG40kCrhEfvToJAWmIPE1yErLcdVTVGrxLFlx4C0WUDR1qcydJFGpAgaUWcHxCrHjxSL6JUOoAj76K+KGqnaIS8xye2OpJeK2
X-Gm-Message-State: AOJu0YxLn4x29Q3f+wiqTVE424rDdbXImUqFiKz6MCukIp1P9gef2aeC
	FTBmZO1Kj28REDS54iRl3LX2cWIAdMnj+q0a27V5NZHE0x+iDuYIDSUK13SUSpwDDojnHYun/Tu
	/89nLTnmQ1ITjRJ+kXwHtTP/Er1E=
X-Google-Smtp-Source: AGHT+IGKrkJXDODm3nVb9fzHwnKikXdqz4hvqt4v4yUu9RXq5uF3o86VrquzEWR78TSsKkFA0pvRsWwXCqcDiK/mXqM=
X-Received: by 2002:a2e:9ad4:0:b0:2d0:cb23:c719 with SMTP id
 p20-20020a2e9ad4000000b002d0cb23c719mr3539263ljj.13.1707399326073; Thu, 08
 Feb 2024 05:35:26 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <17ACA59E7A7FD97B.16230@lists.openembedded.org> <CANNYZj9X5qRSup7i9S=rtRpwo5nCNHp8VJOZAuvu5JzqhLYD_g@mail.gmail.com>
 <f1c9d0f8cbf8ea1972aafac0c29690ca400178d7.camel@linuxfoundation.org>
In-Reply-To: <f1c9d0f8cbf8ea1972aafac0c29690ca400178d7.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Feb 2024 14:35:14 +0100
Message-ID: <CANNYZj8tyOy=z3L=uM9L_R8uP6eZSUkYXm9BwvsU+ERpE9QcZw@mail.gmail.com>
Subject: Re: [OE-core] Core workflow: sstate for all, bblock/bbunlock, tools
 for why is sstate not being reused?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <jpewhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 13:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195151

On Mon, 5 Feb 2024 at 22:11, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > - export the hash equivalency database into something human readable,
> > and placed into the bundle, and then import it back when the bundle is
> > unpacked and set up. As far as I understand currently there's no code
> > for this. I'd find it useful in general, as effects of hash
> > equivalency can be tricky to grasp, and being able to look at the
> > database in a human readable format goes a long way towards
> > understanding how it all fits together. There may be other use cases
> > where you'd want to move the content of the database between build
> > machines. I'd like to get Joshua's take on this, did I misunderstand
> > this completely?
>
> You don't misunderstand, this is an issue.
>
> The good news is that the hashes needed will be in
> cache/bb_unihashes.dat. The eSDK code saves and restores that to ensure
> things all work out ok.
>
> It isn't human readable but could be translated easily enough.

Right, I didn't realize bb_unihashes.dat is simply a python pickle,
and can be dumped to stdout with a three-liner script.

What I don't understand is why for each task, that file seems to
contain only a single pair of equivalence, and only matching the last
build. The complete set seems to be in hashserv.db, but I didn't yet
look into the structure of that or whether it's portable to other
locations as a file copy.

So how do the two files interact? Shouldn't we copy over the full
database rather, and have bitbake re-create the cache on the other
side from that?

Alex

