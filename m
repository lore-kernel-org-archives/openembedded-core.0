Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8583D3B9B9
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 16:25:13 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.50477.1732638305299003256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 08:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aapSAkTe;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: danismostlikely@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-71d41932d32so1264173a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 08:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732638304; x=1733243104; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SyvMi4bBWFVD0xIs+/29NvSTRHVAJ+vWlqSFH8RKQN0=;
        b=aapSAkTeURk1ba6LFi+oMCUgcOAakzhXfOs20c9VkOduA6TD/5gXPkt9ImCNitSl2/
         H8eO5YXrAo7LwGk7qDLs40+Xtl8u83ldPzoAWC/pXXaM6l+fuDJDRrtwuv6A/MfxVBG9
         UEvt6pjfGZ975J7yqiFbTokYVzhMVFI2M7GHxNYsWlpMkEg3Sd98XY7fc8QpFzlgObiv
         MXUdPRYzPIlMHRGwaO6pS1UcXr8cltgDgz2Qs0M/nyzjAVwwYZh+a70xIlpEeHQYu8Ab
         HWv/5zkBSzLNuGqrCvhl8baR2w/YGV7Nb+z/VJRJNcpEtqQkU7OPMpcNTjhOY90aTz7l
         dqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638304; x=1733243104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SyvMi4bBWFVD0xIs+/29NvSTRHVAJ+vWlqSFH8RKQN0=;
        b=qvypQutFDIQKF7SKyUhwsGKbFOpRaGsct8FHIA6HwJ0T+E2LKHhFFatScly6wDU5Yu
         lDL8u7xZY6dfIn/Vo+bFoTLwir1r871cDo2TcqTXNhcXSbWDnDa/BJEnjCya1Wk7WIB/
         CbqZl5qt3CEIp+DSwHDHnQIRXb4/b2GWRXblC7wH6280Z8bfgecUMW9/toL5QeGJFy/i
         bcKZiaJls7uzP8u+h16TrmszQxUebJ/ilYAZbc84zUYZWng22DqPiaFlIbQoyybOFeIo
         hqF95N2Emd9x+wGWZye+spzWqvkfjpLa0pZGKHHMqbCwX3hJnuaIESrCz6Oc1xp+N8qm
         fZSQ==
X-Gm-Message-State: AOJu0YxpnDL4kSLI+RaF7Newt2iBr84MkT0J3GGsZ7hVNg6KazfTJZeG
	BiOwyueRef3CiARYCj/JDGFnM2TEwpq5QkPhsgzc+In8tI+O40gjcOFmVNzae/uz9dLetdRc+fS
	p7tBibWWFtrC8k1cDFvX+yl88YT0=
X-Gm-Gg: ASbGncuXHMBYI6V/WQ0YIEGphw4Q2LxuoB3mQg1ggBVpAieUeW0aiaZcN8hfaKF0kzy
	M35JOOKt+6xVEqyE2U9s/8+X9qUEjZX9u
X-Google-Smtp-Source: AGHT+IFZVvcmen+pEp1fo222Z19IE56UnJXhtccfRKlL9P+a1324F+YfXZu7+PHzPisPrWz9YZTb55drAT7GBj8p4JU=
X-Received: by 2002:a05:6358:50c8:b0:1c5:e320:fdb5 with SMTP id
 e5c5f4694b2df-1ca797bb117mr923165055d.21.1732638304458; Tue, 26 Nov 2024
 08:25:04 -0800 (PST)
MIME-Version: 1.0
References: <20241126015518.2463257-1-danismostlikely@gmail.com> <CANNYZj8ir0JV+0feFkn=+oRR9evOqOEWhgDaS28i3VcdHUAw=g@mail.gmail.com>
In-Reply-To: <CANNYZj8ir0JV+0feFkn=+oRR9evOqOEWhgDaS28i3VcdHUAw=g@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 26 Nov 2024 10:24:53 -0600
Message-ID: <CACS+7ZQQ9LrqiL6a_mCUi8OqVpKsSzYSE=-Rma9zn86L+Smvtg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: package tkinter's shared objects
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 16:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207864

Oh neat, that worked, thanks. There'll be a v2 to this patch. I copied
previous patches that fixed this issue by patching the manifest, like
this one:
https://git.openembedded.org/openembedded-core/commit/?id=163966765d57fe38e13d0b6659795a13bc702e2d

Updating the recipe itself is kind of gross considering the overall
plan for the manifest.json method, but this will prevent it getting
reverted every time Python gets updated.

On Tue, 26 Nov 2024 at 05:11, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> This is not correct and will be undone by the next manifest update
> again because that works from a default set of options. You need to
> add this to the python recipe.
>
> Alex
>
> On Tue, 26 Nov 2024 at 02:55, Dan McGregor via lists.openembedded.org
> <danismostlikely=gmail.com@lists.openembedded.org> wrote:
> >
> > From: Dan McGregor <dan.mcgregor@usask.ca>
> >
> > Seems every time python is updated this gets removed. That's likely
> > because the tk option can't be enabled in python3-native without
> > creating a dependency loop.
> >
> > For now, re-add the tkinter packaging info to the manifest.
> >
> > Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> > ---
> >  meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> > index 4b7f9cc7e33..3ed99b9012d 100644
> > --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> > +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> > @@ -1092,6 +1092,7 @@
> >              "core"
> >          ],
> >          "files": [
> > +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
> >              "${libdir}/python${PYTHON_MAJMIN}/tkinter"
> >          ],
> >          "cached": []
> > --
> > 2.47.0
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#207824): https://lists.openembedded.org/g/openembedded-core/message/207824
> > Mute This Topic: https://lists.openembedded.org/mt/109783729/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

