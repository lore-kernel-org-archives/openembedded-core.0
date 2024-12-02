Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6867D7833E
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 18:04:40 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.180787.1733162671313005219
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 10:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gEAN+7kO;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.182, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ef7a0b65f4so15561617b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 10:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733162670; x=1733767470; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I6ZEeeUZa4ykg5/sVaA5ZvSgvK7k8KZyAlgOp0UuWyQ=;
        b=gEAN+7kOIa7Blk4uZ+ZWKLx7ynyr47IMaicmae1txjqDmjQsA8m3dnh3oYMNEFxsiM
         NU9OkuElxHXyknZ/xARGOtwlfHZnE8DPyFh6k++C3j5LZqiSd8OHCn9x8t84piKa8/03
         DOpWWASGqlF3pSUVZNjji2UouCojVtw0HiLAAYykwmV2u2w9sF4xYjcaQemiF51GK2za
         I/2TIIrN5GephYleRhskOpRD85hLdG106V3oN9l9K5wvNM/Cpgi5KgVGgQUE1R6YPYbI
         Oiv5/lNZGiAAYOUIokkRTX4XNBt9Fgp26zREISrFJImypD0j/vaKMDVpYx7V+5iwjqp4
         ecIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733162670; x=1733767470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6ZEeeUZa4ykg5/sVaA5ZvSgvK7k8KZyAlgOp0UuWyQ=;
        b=mIBsf6qk3H120Udi4gAUUJxs1IKuY4xMfwYYJ7MruwPhcILPQ51bnUG1ZtHtumzsO4
         BEjaZvhvzz/PDmfOEY+qz8ue4Zj6o15dZ6eTu7MfV3W6TkctaN3FKX528XZWAaNGHLEJ
         aPGpq9c9m4NJKMpsyWq+11udubSn4cNMHNg5mv3urlP+cWZAj59raPz8//MZHMQm1B9L
         j6YqYGMHkoIVLQUCuAo+kyd33TdZ3WQyQi1Zs8Wy2slKs8cjnKT4VllYFXsJBs+y2rTU
         N7WnSkc2bs5FrPsa8oXl8u3X9QAz7qsm7XVJSRWLB4aSPgo9ja3RPT5byAFh3XMwT/AE
         Uonw==
X-Gm-Message-State: AOJu0YwlIM4dcG6pu4hxHLz3Idn+aaA+AQnzPiPUfCQOQ9aoWdXoQ0oM
	RCzvHmWBcNHD6/8mQL+nBrZbb72q7wYSdVkOegaPs+yLyu/sIjOuRChMGTXDsNCD47lNj5ZH4VY
	0R6m2skn6mfVRfzIvI0qjJIwPRSbN1LtrJErlmMt9lxEoinBt
X-Gm-Gg: ASbGncumfe0+R84rEPPKKXJvKYoyh4l9zrvW/nCthCjpODBuFaWikgLmFKAaLaq2+S3
	WfvKZbhgDFl505S8JI/A7RsCDB0cDcWE=
X-Google-Smtp-Source: AGHT+IGNyP54RKbR74vQyhME9bRctOSJBACibBvUxOFdPARkMJ1ddYSrYmk+pNbxmxzOUF+JR20QccfE5CE/JryB64c=
X-Received: by 2002:a05:6902:2b85:b0:e38:fbd:48db with SMTP id
 3f1490d57ef6-e395b8d7f66mr20844171276.29.1733162670271; Mon, 02 Dec 2024
 10:04:30 -0800 (PST)
MIME-Version: 1.0
References: <CADcMJG_mX3pXOexbA_Gk_VMY4qVaJTna5Gc5ZW-9_R-LncSBpQ@mail.gmail.com>
In-Reply-To: <CADcMJG_mX3pXOexbA_Gk_VMY4qVaJTna5Gc5ZW-9_R-LncSBpQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 2 Dec 2024 10:04:19 -0800
Message-ID: <CAOSpxdaHk817fp+vXNieUV4XiZp4d9Qhb4BPK7YDv-+u+r3Wmg@mail.gmail.com>
Subject: Re: [BACKPORT] rootfs: Ensure run-postinsts is not uninstalled for read-only-rootfs-delayed-postinsts
To: Nicolas Gillen <nicolas.gillen@agregio-solutions.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004cc9cc06284d61fb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 18:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208152

--0000000000004cc9cc06284d61fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 4:27=E2=80=AFAM Nicolas Gillen <
nicolas.gillen@agregio-solutions.com> wrote:

> Hello,
>
> I need to have postinstall scripts working on a read-only file system on
> Scarthcap.
> That's why I would like to have the commit
> 60f587475dda99eaa07848880058b69286b8900e
> <https://git.openembedded.org/openembedded-core/commit/meta/lib/oe/rootfs=
.py?id=3D60f587475dda99eaa07848880058b69286b8900e>
> from master backported to Scarthgap.
>
> Please let me know if there is a better format to request this.
>

This is fine.  I've added the patch to my scarthgap test queue.

Thanks,

Steve

--0000000000004cc9cc06284d61fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 28, 2024 at 4:27=E2=80=AF=
AM Nicolas Gillen &lt;<a href=3D"mailto:nicolas.gillen@agregio-solutions.co=
m">nicolas.gillen@agregio-solutions.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello,<br><br>=
</div><div>I need to have postinstall scripts=C2=A0working on a read-only f=
ile system on Scarthcap.</div><div>That&#39;s why I would like to have the =
commit=C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/commi=
t/meta/lib/oe/rootfs.py?id=3D60f587475dda99eaa07848880058b69286b8900e" targ=
et=3D"_blank">60f587475dda99eaa07848880058b69286b8900e</a> from master back=
ported to Scarthgap.</div><div><br></div><div>Please let me know if there i=
s a better format to request this.</div></div></blockquote><div><br></div><=
div>This is fine.=C2=A0 I&#39;ve added the patch to my scarthgap test queue=
.</div><div><br></div><div>Thanks,</div><div><br></div><div>Steve=C2=A0</di=
v></div></div>

--0000000000004cc9cc06284d61fb--

