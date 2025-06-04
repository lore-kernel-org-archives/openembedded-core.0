Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90E3C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 17:55:54 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.23429.1749059742777522589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 10:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RTQ64ewN;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: rwmacleod@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so82174a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 10:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749059742; x=1749664542; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XkubYasbLmaYT8PUG5hAu3Onw4aWKLsznsqtrTY63Fg=;
        b=RTQ64ewNHxyNEqpehrQLtfoC2iTz+Jg2oJ0WWZ2YN0hd8vMkJkRQ4YYi1clrXTuOtx
         k6Fa/ERd08BAvai3byima8R8MHpqwlVv//63al6RdTVlnTBP1eArJALAAu0LbRyAv5ZE
         E47L27uArjm7kGbx0GZp6B8jt07AcwFboa9e1GArxbfkCvcAFl8Enfva325OiHY4qhwn
         L0V9DrGmETTDgxh18rFIp6huJ2A8kacWvY9laJTH/I7QrOtJXgikQqRUZ5TltE4Ze4eS
         nJeqxZaZni4Zm+mAq6Y+pD7Yf7ZTI7cH4yRng4iWVNZWprsqRjXyTvP82786YhGcClCP
         lUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749059742; x=1749664542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkubYasbLmaYT8PUG5hAu3Onw4aWKLsznsqtrTY63Fg=;
        b=JHJOJBXaomalUwgcHeuDjSo5mqbejM/76SF/b4eLJq/DTMCck6dx7iRYLrPxKvHOI2
         1Jx+B74RlTbG6rGw4bP8qo+ItaxwAeS0iMjabpceACqz2RL0FPrK7D6l1UySVA2sgc0E
         B7xid6ecX19SW70X2OXhQIXnGEdOY7W7/eSZ5BG+XknzmTzsLDoq2tDtLTl9w722tQ0E
         zmMmGjN0jfGA6Az9pKJch4k1y4yBiSRtZlv8wHUdfyxxoQyBQFLRe+nmhYRgLJxjvfKw
         Aaba+0Vffv2Nsvtj8sGcnOlI7BqmebOy5Cuo6oO78SZV4f3R7HHq+V9srV8ucbTx7EFk
         ixtQ==
X-Gm-Message-State: AOJu0YzsiQBf3RMkuz0kUagNWM9S00JCL/z9MLSOL/IcDQWl4s0TIMai
	kMSSl4pczqLLFCZXx5DIJVnvYIrWr6oT12RBtvKtpgp0Jm0xdocLuWi/q6ccauVwbtxrVylGssq
	y4M5/f3D/Zb8jeLyMwGqYXhGFXxkd0Is=
X-Gm-Gg: ASbGnctT6H/lH+M2wYhL60KGXQDA2cGKwGJ9oqBZieLfUK37oKOFs9NqE+zK+9WhQaX
	23hxn4gxPob+tnzhQsXaY4V6Sz6hG1aeV84f9HifwSFEblJrn8FAd8CjQOd+F7kMn4iiG5XBDtZ
	ONtkDyDv2z5DKvnv4r7hmV4+mUrr1psyVO/w==
X-Google-Smtp-Source: AGHT+IF85Q2dvVqG2imhbph388exARM25hi/tK85aClbbwlfTiTldIegTPzGO74sDwv0L6aY27+BIrg0ETqi4gHaPVQ=
X-Received: by 2002:a17:90b:3fd0:b0:311:c1ec:7d12 with SMTP id
 98e67ed59e1d1-3130cdad249mr4807704a91.23.1749059741742; Wed, 04 Jun 2025
 10:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <4832019c-26dc-4f50-ad31-3145fda752a2@gmail.com> <791.1749053399502629005@lists.openembedded.org>
In-Reply-To: <791.1749053399502629005@lists.openembedded.org>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Wed, 4 Jun 2025 13:55:31 -0400
X-Gm-Features: AX0GCFuNfTCCjO9bQYpntmWHakNACoWE38GOl_C_u79vIQlo0nqgij4mumWYZCg
Message-ID: <CAK6=ix7d03GwenpObG4kYYYyZOzAF=DeSaat--J3FkXkL+pWYA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: pthreads NPTL: lost wakeup fix
To: SunilKumar.Dora@windriver.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000098fc520636c2b4f6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 17:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217962

--00000000000098fc520636c2b4f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025, 12:10 Dora, Sunil Kumar via lists.openembedded.org
<SunilKumar.Dora=3Dwindriver.com@lists.openembedded.org> wrote:

> Certainly, I=E2=80=99ll split the changes and send a revised version (V2)=
 with
> individual patches corresponding to each relevant commit. Thanks for the
> feedback.
>


Thanks Sunil.

Since these commits are merged on other branches in glibc upstream, please
point out and explain, in the next version, any changes you had to make in
doing the back port, if you think that makes sense.


Randy




> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217957):
> https://lists.openembedded.org/g/openembedded-core/message/217957
> Mute This Topic: https://lists.openembedded.org/mt/113467561/953399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rwmacleod@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000098fc520636c2b4f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"><br></div><br><div class=3D"gmail_quote=
 gmail_quote_container" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Jun 4, 2025, 12:10 Dora, Sunil Kumar via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;SunilKumar.Dora=3D<a href=3D=
"mailto:windriver.com@lists.openembedded.org">windriver.com@lists.openembed=
ded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Certain=
ly, I=E2=80=99ll split the changes and send a revised version (V2) with ind=
ividual patches corresponding to each relevant commit. Thanks for the feedb=
ack.</div></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Thanks Sunil.=C2=A0</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Since these commits are merged on other branches in=
 glibc upstream, please point out and explain, in the next version, any cha=
nges you had to make in doing the back port, if you think that makes sense.=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Randy</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><br></div><div class=3D"gmail_quote gmail_quote_contai=
ner" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#217957): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/217957" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/217957</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113467561/953=
399" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/113467561/953399</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000098fc520636c2b4f6--

