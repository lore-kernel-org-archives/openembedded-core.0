Return-Path: <dadleyy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF78EE3F38
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 21:42:37 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.2903.1694554954999685601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 14:42:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IunlxW27;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: dadleyy@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso42328845ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 14:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694554954; x=1695159754; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0c2fRXFe1iq4+zJezYhsEqZwDJR2rWXhEavbwUdqv+c=;
        b=IunlxW27wlxmZbJy3Zif6OcxIA/dFU3tEfZWmWwMSD5EC7dTrJnxWlGkE5QojuEUkh
         MgdKQjcMc7OPCVdh71xNjbxAPstwDnHeIGpjH/ntcmAx5hLJErHRZJLQjB7z2Q9+b+zp
         8a27uOubEKZ9wS2+kOMcs5EHF5JGgl/CelsVjqcve4dILwbC+X/C9n+XyF4K56LKTLu7
         5lSbBxpsuNBGBvXqwaO0R8tHbPoTlQ7+HqYS96HYkM2v9/lo80QJsvJBtIOyZYPv68JW
         DGAVqMFeNmu7b1uTzfCkXt+2XtveWK7W9rKTxdz6QC95+GXlfMRdbLFCdU9I/58bZMKH
         r/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694554954; x=1695159754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0c2fRXFe1iq4+zJezYhsEqZwDJR2rWXhEavbwUdqv+c=;
        b=L8yOvKmc2aBa/UtC/SVB15K/TKfA3uiYiYNzcSDwD5a+alJifM/rShMOpI7/On69hb
         ++00j+p3NzCLFJkdyvdmnJCoBk2VBPD5BdYUcNhKeyM9bdCOA7o/9nNK4rXn9LsuxX9G
         YDdQD9sFU0hRgpmDHb4JCBVz5gsb2LOQvkgPwRQOwrQngZlH5res1NsH27ikLNCPJzj9
         XJ0ESkl2S1ZIMBW8F3SNzS0Q2v40ZP6FutGAjT7Dgca+0Ckaem0xhs2RQoAvmnPEhduc
         BTkQbpbwZ0TeYTt++cfj/rqdUHRMVsrl6wIYCHIV1coweH8KXMF1gfueNt/8QYbWR6+p
         CLbA==
X-Gm-Message-State: AOJu0YwA7prbaIv99FuRYLfaGNXFfGM/kH/OUhAs7qLfw7C+iPSZvlC6
	7f76rN8TVX5MaTiVAoy+wA7FAV5UzsKErixJ2TM=
X-Google-Smtp-Source: AGHT+IFvkQ19svshB/+MrNTf6wSr3cq00Wjm/NQDXDgLWv5j9X7afs2WlbS9GmQa9P+KUP3JTBhA3Uag4ehcnW42gIU=
X-Received: by 2002:a17:90a:d918:b0:26b:13b7:22f9 with SMTP id
 c24-20020a17090ad91800b0026b13b722f9mr477382pjv.22.1694554954222; Tue, 12 Sep
 2023 14:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <CADEQF5GFW16EDaPdyiOTouH8nTeMG+TTdZerTHyStgAiKy+_Vw@mail.gmail.com>
 <CANNYZj9XFxJvN6UjbRfBgRVsMi-oASar_neY5cDn-XcnQVK8bw@mail.gmail.com>
In-Reply-To: <CANNYZj9XFxJvN6UjbRfBgRVsMi-oASar_neY5cDn-XcnQVK8bw@mail.gmail.com>
From: Danny <dadleyy@gmail.com>
Date: Tue, 12 Sep 2023 17:42:24 -0400
Message-ID: <CADEQF5FGORKTYsNxR5aw+H1Uy-Wh_BbMyOs_SExbqb6+Ttg8Aw@mail.gmail.com>
Subject: Re: [OE-core] mickledore - adding rust tooling to sdk seems to create
 problematic rustc/cargo executable configurations
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001953ab06053052d0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 21:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187548

--0000000000001953ab06053052d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex! Thanks for the quick response. I tried removing my
`TOOLCHAIN_HOST_TASK` assignment and adding the `SDK_TOOLCHAIN_LANGS` entry
but I'm still seeing the error.

fwiw the output from `cargo build --verbose` shows me the `rustc` calls:

```
rustc --crate-name omg --edition=3D2021 src/main.rs --error-format=3Djson
--json=3Ddiagnostic-rendered-ansi,artifacts,future-incompat
--diagnostic-width=3D157 --crate-type bin --emit=3Ddep-info,link -C
embed-bitcode=3Dno -C debuginfo=3D2 -C metadata=3D62f339e5c64d61ff -C
extra-filename=3D-62f339e5c64d61ff --out-dir
<omitted>/target/armv7-unknown-linux-gnueabihf/debug/deps --target
armv7-unknown-linux-gnueabihf -C linker=3Dtarget-rust-ccld -C
incremental=3D<omitted>/target/armv7-unknown-linux-gnueabihf/debug/incremen=
tal
-L dependency=3D<omitted>/target/armv7-unknown-linux-gnueabihf/debug/deps -=
L
dependency=3D<omitted>/target/debug/deps
--sysroot=3D<omitted>/sysroots/cortexa7t2hf-neon-vfpv4-linux-gnueabi/usr -C
link-arg=3D--sysroot=3D<omitted>/sysroots/cortexa7t2hf-neon-vfpv4-linux-gnu=
eabi
```
should I be double checking something is available to me in those sysroot
paths?


On Tue, Sep 12, 2023 at 1:48=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Tue, 12 Sept 2023 at 19:26, Danny Hadley <dadleyy@gmail.com> wrote:
>
> > I can provide as much additional information as needed!
>
> I think you need to set
> SDK_TOOLCHAIN_LANGS =3D "rust"
> and then things should just work.
>
> Alex
>

--0000000000001953ab06053052d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alex! Thanks for the quick response. I tried removing m=
y `TOOLCHAIN_HOST_TASK` assignment and adding the `SDK_TOOLCHAIN_LANGS` ent=
ry but I&#39;m still seeing the error.<br><div><br></div><div>fwiw the outp=
ut from `cargo build --verbose` shows me the `rustc` calls:</div><div><br><=
/div><div>```</div><div>rustc --crate-name omg --edition=3D2021 src/<a href=
=3D"http://main.rs">main.rs</a> --error-format=3Djson --json=3Ddiagnostic-r=
endered-ansi,artifacts,future-incompat --diagnostic-width=3D157 --crate-typ=
e bin --emit=3Ddep-info,link -C embed-bitcode=3Dno -C debuginfo=3D2 -C meta=
data=3D62f339e5c64d61ff -C extra-filename=3D-62f339e5c64d61ff --out-dir &lt=
;omitted&gt;/target/armv7-unknown-linux-gnueabihf/debug/deps --target armv7=
-unknown-linux-gnueabihf -C linker=3Dtarget-rust-ccld -C incremental=3D&lt;=
omitted&gt;/target/armv7-unknown-linux-gnueabihf/debug/incremental -L depen=
dency=3D&lt;omitted&gt;/target/armv7-unknown-linux-gnueabihf/debug/deps -L =
dependency=3D&lt;omitted&gt;/target/debug/deps --sysroot=3D&lt;omitted&gt;/=
sysroots/cortexa7t2hf-neon-vfpv4-linux-gnueabi/usr -C link-arg=3D--sysroot=
=3D&lt;omitted&gt;/sysroots/cortexa7t2hf-neon-vfpv4-linux-gnueabi<br></div>=
<div>```</div><div>should I be double checking something is available to me=
 in those sysroot paths?</div><div><br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 12, 2023 at 1:48=
=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Tue, 12 Sept 2023 at 19:26, Danny Hadley &lt;<a h=
ref=3D"mailto:dadleyy@gmail.com" target=3D"_blank">dadleyy@gmail.com</a>&gt=
; wrote:<br>
<br>
&gt; I can provide as much additional information as needed!<br>
<br>
I think you need to set<br>
SDK_TOOLCHAIN_LANGS =3D &quot;rust&quot;<br>
and then things should just work.<br>
<br>
Alex<br>
</blockquote></div>

--0000000000001953ab06053052d0--

