Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39EC1061B13
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 16:02:12 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55024.1774886529159442541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 09:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HaVTUAom;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8d0288d24f6so307168385a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 09:02:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774886528; cv=none;
        d=google.com; s=arc-20240605;
        b=XHrQktKyk9DsE+f2D0nBkacVLcZ1MazD4o6h9wpDJtUE6Kfn1l2XmQB/HQ9962u41f
         lb/JJxaS5hbPuS4I3iHQi3U06q5Z9favfUIagx9yKYdneRVldiJYpdiy4qYNh/hS36dx
         a9SEIAEPiam2ssS5Euk0zQ8gOajc0t7K5mzqnsjUzXfOBPXE3+vtb/RExEDw81psjaPJ
         dyDAAHUFW97DoASeSPvk1DZDTrGywQ4wYqYFLN4YKST53tgjVd3+jXXKwvxu7Lam2JDU
         K/NaQPYOF80OPmt28CJ8fFSznejX+ShKkRQr9gBUzj6gAsM/99LFsNyGe7AoXsTHHZit
         LvaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ce1tw3SaUjLtM9qCbKMth6+0J8hWk5Ux3YOWxw1+ECk=;
        fh=5ntFf6gZPcB4Q6L3Bht6xwlFTGPHia3QxxE2O+oHhI4=;
        b=IMFP3xIcFmwrt4dBTLZ/zBuCQJRTZeBkSjhmKoXrQMsvt6DObjlD02yOqDru7kcc4r
         U6IXM/nEt+OdTybkHpZJPfY+9ZKG3VqnwwjqTyNkIPYoUOcT1CYLfGRc5X95aiXfy+NM
         vtjE+q4h0dCHpr57gQxl77ZowqPxCbk4cRkNaY79kLpZYQp+V2iQ9b6MElpedu1UxVfO
         bXv6mvOx2NSu/uPtFYEmzoMDVjA5uQgwM+VUgkVxGcUau87WhjpWuNoXKhbxKLS93gRb
         R11AvnyDgsiLqPDQvmwG4m6363KaZSk5D/rCaQhB2v2AyNX/IoM29+hyynjF+S6CvyqO
         23yA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774886528; x=1775491328; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ce1tw3SaUjLtM9qCbKMth6+0J8hWk5Ux3YOWxw1+ECk=;
        b=HaVTUAomPkywBBbOfd6YtVHOa0plmdu1jacVGSmGOVi32ElqV0Y5djvroqwbhQ/kqv
         SdHnzRdCKtKbnNmBazfFaNKKvfgjVHleD5sWRp0xdcyNcJvH2BrXwgLRpbIO4hTIMaUN
         eRivsg0qJH27m98VqKMYvY0rUst3Wyqs3Nc59ML/k4ED+dgbnNlPPPx7+jGgs6aa7ISi
         C9YCn/5v8noxVaay5TzrbfdHX2PGa9Jn2g9dIN24qj5ZKODjubcZQcQS6QQtJUrqA1jb
         KDtxbmUF9R5k52Z5O0nIO6ugvj637FRcg1KfqKzr/tOGMz8Q24pGw7iswNGA80ecG4cH
         3HWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774886528; x=1775491328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ce1tw3SaUjLtM9qCbKMth6+0J8hWk5Ux3YOWxw1+ECk=;
        b=SogqM7iwbcy+5cK3zeIFRrls00MBcqTHWo4Lrs/TrNTvC+OmUdQUzkVcwtf/K/DYV4
         2boIGm/QZ52OXtZkegw/aACnhZZirU3iJgXz+3aUpUN+EQBM3MwIW7LJ7h/UWQ4AI8RB
         XkiE5f7HPzAN52SU1GKxb7X+VHsmsVMumjnkCwr+VM/nAal+I9rNp7oC7yNZGw+b+Nae
         XsDFTgADTFS3Fmlvtxho93qeAoC5HNV14Dnr+UsFHljonqbW+J5NbZ5rnk2dQuLxUc4Z
         yMbpu5KwNa/FMC2XFvQH8nlyj20xiYMRhh/byrZgLbChBF8VVc3eE2XXoBKzbys3SF3/
         NSGg==
X-Forwarded-Encrypted: i=1; AJvYcCUneP76sJKFHYlNDI5me/XMIUyG6j2Jy6wzt7l0hxOfZE+uwMoW+Xyi/om7KdIEdf0OlPU9w6cTnnKvYvTzGEYNIA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yza00pLpV7eAgtZnLulIG99W7U2L3oFAWjzPWQ1LzRtGdaBD2MX
	IUMBLgeSyQd1LGTLZ2GNED/IE2uxFC5QIbv7sk0o+raBDL6aYpsZFCBwp9nKrHCgT13WbfQ7ve/
	/IR3Xj4YA5QJNV6cqTIVj/FgcgEFgOAc=
X-Gm-Gg: ATEYQzx9NDbz9U62vnKCA9mvgmWPU7eu9WUk/TdT8s9yw6CQtDZiI9yRRUxOt+wgaTF
	82KUQdhg4jKL8XxRjR3y5PtNDKXB5tVGbGrC1Shytf71CW2Ek356OtNRbjv+yUYOBvnE7VHT5tr
	v1O13RrW7w6UEoYKhtnagQ5eSqD3jGB4NVfgccUytUhXPJXeykc9z3Jvhd652W1zLRAaDYyHt3H
	rQ9MFUvlrFnquNIOebXahY1xU1SEf0iJeL3j5knqASgQI2pAwtMMqMx1eqwq3rjf4X5/VBcb5kW
	94RzDctIoZm55+/sgxbz3Q==
X-Received: by 2002:a05:690c:698a:b0:79e:b3aa:b329 with SMTP id
 00721157ae682-7a0a2d5ef75mr997017b3.26.1774886526317; Mon, 30 Mar 2026
 09:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
 <2cae9e645c767894e77f718113f4f4d689f9121e.camel@linuxfoundation.org> <8619f67e-d274-4d99-9290-ad36ba61c054@mind.be>
In-Reply-To: <8619f67e-d274-4d99-9290-ad36ba61c054@mind.be>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 30 Mar 2026 10:01:55 -0600
X-Gm-Features: AQROBzBQKxycrka2CG3XiElMDyAlJd7Q_p9Q1-R-RAhcp7MRUIqQdGV2I8LHV9I
Message-ID: <CAJdd5GbTvj==_77VaLLNkU69Ti06tw2-8X5jLmzEESZNN6D_Xg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5 v4] image_types: use IMAGE_FILE_MAXSIZE
 variable to create fixed partition size
To: charles-antoine.couret@mind.be
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 16:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234250

On Sun, Mar 29, 2026 at 11:12=E2=80=AFAM Charles-Antoine Couret via
lists.openembedded.org
<charles-antoine.couret=3Dmind.be@lists.openembedded.org> wrote:
>
> Le 29/03/26 =C3=A0 18:15, Richard Purdie a =C3=A9crit :
> > For context, these previous versions were in 2023. I think the general
> > concern is we already have a lot of rootfs size related variables and
> > adding more of them complicates the user interface. It isn't clear
> > which ones "win" when multiple conflicting settings are made.
> >
> > In this case the max size "wins" above any of the others.
>
> IMHO this makes sense because it's more specific and related to the real
> filesystem size.
>
> But indeed if you want to change the design behind, I'm open to it.
>
> > It does
> > appear that it isn't just a max size but a fixed size in that it will
> > pad the filesystems to this size? That makes the name a bit
> > confusing/misleading and was one of the concerns last time.
>
> In fact I realize that I've not read your previous answer last time, too
> focus on the CI error. Sorry, my mistake. That's why I've not taken this
> into account for my recent changes.
>
> Yes, this variable is doing both (fixed + max size of the filesystem),
> due to how filesystem tools are working. Maybe by having a more
> "intrusive" change, we can improve it.
>
>
> What I can suggest is:
>
> * IMAGE_ROOTFS_MAXSIZE would be used against filesystem sizes, and not
> against precomputed rootfs sizes as done today, it's likely not really
> relevant to keep current behavior as it. I don't know if we would be
> able to customize the value per filesystem type as done in my proposal
> or if a global setting is good enough.
>
> * if IMAGE_ROOTFS_EXTRA_SPACE is set to 0 and IMAGE_OVERHEAD_FACTOR set
> to 1.0, don't provide size parameter to mkfs to create a dynamic and
> minimal filesystem, to avoid the need to always provide manually extra
> margin just for filesystem overhead
>
> * Then introduce a new variable like IMAGE_ROOTFS_FIXED_SIZE which can
> be provided (if set) to mkfs tool to have a fixed partition size
> whatever are the other settings related to rootfs size. If unset (by
> default), previous logic can be used instead.


Perhaps a better option would be some sort of
"IMAGE_ROOTFS_ALLOW_GROW" variable that controls if an image can
actually grow beyond the IMAGE_ROOTFS_SIZE + overhead amount? The
current code basically takes the max of IMAGE_ROOTFS_SIZE & the actual
install size to determine the size, but this variable could supress
that to make it only look at IMAGE_ROOTFS_SIZE. It could also set
IMAGE_ROOTFS_MAXSIZE to the sum for additional checks?

I think this would fit into the current model of how these size
variables work without needing to introduce a completely new variable
that does different math?


>
>
> I'm not an expert of all filesystems so maybe this suggestion can
> introduce problems. I don't see potential regressions for current users
> as well.
>
> What do you think? Another ideas?
>
>
> Thank you for your feedback.
>
> Regards,
>
> --
>
> Charles-Antoine Couret
>
> Embedded Software Developer
>
> +32 488 27 56 40
> Website <https://mind.be> =E2=80=A2 LinkedIn
> <https://www.linkedin.com/company/mind_essensium/> =E2=80=A2 Newsletter
> <http://eepurl.com/h-gy7v>
>
> <https://mind.be> logo
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234153): https://lists.openembedded.org/g/openembedde=
d-core/message/234153
> Mute This Topic: https://lists.openembedded.org/mt/118563509/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

