Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B05C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 07:18:40 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.7827.1681197515577685105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 00:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jEv5egXP;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id g16so12085753iom.11
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 00:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681197514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cx6CmtmjU1vfQ+2pWeaugkPqILCT7gBDuHB6pmKSvb4=;
        b=jEv5egXPE6jxPSOyWlq5/aDOSWh9dCOqW5b4c2L3NWfBy2mmp81Bu6aT2+m6OwoPAr
         1r/JkwjqlQAHjf/mWxrDZUre8tFbps9smYywxMlnUCJx3x9hqQg63fUHc4QMXH+p970X
         Zp29Up89IDfhTI8F7o8ABCX3DtCRNBc1ukBVLzhWTdFsR4MuX9jyEqOW9N/D4+Txg5jI
         i5VLDO11MMAHaxOssxRQsggujxv9vax6zwxn/86zXcYL2tjiOMi821nMZgWSsDgNAih/
         jaEnaj6oj5UzpfsXhvOTr4UEdAGU2DmtwcaBVgEwLmlTVnph1z88oTaGaT92mHU/ar4N
         UGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681197514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx6CmtmjU1vfQ+2pWeaugkPqILCT7gBDuHB6pmKSvb4=;
        b=dvV5hV+dQqqog89k6frChQ6GqXGUFLMlp2bJBqkGvyZ7Ugrjd9V/oS0oA9sO4JVift
         3Oi5XL8fKPy9H/sea15iIFpEiJEvVj+mgZStTe3zmxneh5ajOh/hvq27j/0kwbqsOeII
         9kQ/BinmLJ/TB3lP/dzJJFh+2e8HUDbuBBIVIEt6rYATnHjqL6IsgokgxHU3WpACYcab
         QrWyCC2ThzjClgSpnqRI8rhUdA7el1szm/FMt5pNw4sfJke7l+jwgpOMDU72XvDH9UmJ
         DDvA4nCP0yjxx1vO74hsJDYwjut49jqRQYsW5XHB2jIm2f84skBed41mAabaV4l8/J2N
         8WQQ==
X-Gm-Message-State: AAQBX9cYus5J+kqlMWQD+AoatEW0NyJmZNNzZ7MYUUEv+terCULIF6uV
	MxGtFGMVWZw93TfXjIAD0wta7WwB9slnOp3xKIQ=
X-Google-Smtp-Source: AKy350atMosZfl+mrQ2G/Ofmx8fxPcHZRywcTIUqKfkHJ0pzq7dgRgqRCvizSWEfDrgtD9c1j+k4KB3qyEsU8qN5m0g=
X-Received: by 2002:a05:6602:42c4:b0:758:3c0e:f331 with SMTP id
 ce4-20020a05660242c400b007583c0ef331mr3979547iob.4.1681197514547; Tue, 11 Apr
 2023 00:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230410094122.5865-1-alex.kiernan@gmail.com> <CAMKF1sq_jvEn5VYmAnRj8HKrXtGAWj8cmD+O6eRHiBqdsLf_EQ@mail.gmail.com>
 <2023041017305195b4c7aa@mail.local> <CAMKF1sp-r4THLG2xfSDiVf=gkaO3aH8SvM0s+keNgAR9mow0tQ@mail.gmail.com>
 <CAMKF1sqyY+MAk_JtE831a7h0SaARKmMtNDf4Vfznx0h4j1d8rA@mail.gmail.com>
In-Reply-To: <CAMKF1sqyY+MAk_JtE831a7h0SaARKmMtNDf4Vfznx0h4j1d8rA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 11 Apr 2023 08:18:23 +0100
Message-ID: <CAO5Uq5RRmUVzuC9tpo1ifPWwfjMJJV1K9i7hcF2adq-VuOCQ5g@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.68.1 -> 1.68.2
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a6e63405f90a4c3b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 07:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179910

--000000000000a6e63405f90a4c3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cool, was just picking up the pieces to check it, but I'll leave it now!

On Tue, 11 Apr 2023, 08:07 Khem Raj, <raj.khem@gmail.com> wrote:

> alright my builds for cargo on qemuriscv32/musl went ok so I guess its ok=
.
>
> On Mon, Apr 10, 2023 at 11:11=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
> >
> > Thanks, I'll also check it out. I think the checksums for the musl
> > patch would need updating I think as the versions of these crates
> > might have changed.
> >
> > On Mon, Apr 10, 2023 at 10:30=E2=80=AFAM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > My current a-full has this patch.
> > >
> > > On 10/04/2023 10:21:16-0700, Khem Raj wrote:
> > > > If possible, Can you test this on top of contrib/abelloni/master-ne=
xt
> > > > for musl target ?
> > > >
> > > > On Mon, Apr 10, 2023 at 2:42=E2=80=AFAM Alex Kiernan <alex.kiernan@=
gmail.com>
> wrote:
> > > > >
> > > > > Changes:
> > > > >
> > > > > * Update the GitHub RSA host key bundled within Cargo. The key wa=
s
> > > > >   rotated by GitHub on 2023-03-24 after the old one leaked.
> > > > > * Mark the old GitHub RSA host key as revoked. This will prevent
> Cargo
> > > > >   from accepting the leaked key even when trusted by the system.
> > > > > * Add support for @revoked and a better error message for
> > > > >   @cert-authority in Cargo=E2=80=99s SSH host key verification
> > > > >
> > > > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > > > ---
> > > > >
> > > > >  meta/recipes-devtools/rust/{cargo_1.68.1.bb =3D> cargo_1.68.2.bb=
}
> | 0
> > > > >  .../rust/{libstd-rs_1.68.1.bb =3D> libstd-rs_1.68.2.bb}
>  | 0
> > > > >  ...t-cross-canadian_1.68.1.bb =3D> rust-cross-canadian_1.68.2.bb=
}
> | 0
> > > > >  .../rust/{rust-llvm_1.68.1.bb =3D> rust-llvm_1.68.2.bb}
>  | 0
> > > > >  meta/recipes-devtools/rust/rust-source.inc                      =
|
> 2 +-
> > > > >  meta/recipes-devtools/rust/{rust_1.68.1.bb =3D> rust_1.68.2.bb}
>  | 0
> > > > >  6 files changed, 1 insertion(+), 1 deletion(-)
> > > > >  rename meta/recipes-devtools/rust/{cargo_1.68.1.bb =3D>
> cargo_1.68.2.bb} (100%)
> > > > >  rename meta/recipes-devtools/rust/{libstd-rs_1.68.1.bb =3D>
> libstd-rs_1.68.2.bb} (100%)
> > > > >  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.68.1.bb
> =3D> rust-cross-canadian_1.68.2.bb} (100%)
> > > > >  rename meta/recipes-devtools/rust/{rust-llvm_1.68.1.bb =3D>
> rust-llvm_1.68.2.bb} (100%)
> > > > >  rename meta/recipes-devtools/rust/{rust_1.68.1.bb =3D>
> rust_1.68.2.bb} (100%)
> > > > >
> > > > > diff --git a/meta/recipes-devtools/rust/cargo_1.68.1.bb
> b/meta/recipes-devtools/rust/cargo_1.68.2.bb
> > > > > similarity index 100%
> > > > > rename from meta/recipes-devtools/rust/cargo_1.68.1.bb
> > > > > rename to meta/recipes-devtools/rust/cargo_1.68.2.bb
> > > > > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.68.1.bb
> b/meta/recipes-devtools/rust/libstd-rs_1.68.2.bb
> > > > > similarity index 100%
> > > > > rename from meta/recipes-devtools/rust/libstd-rs_1.68.1.bb
> > > > > rename to meta/recipes-devtools/rust/libstd-rs_1.68.2.bb
> > > > > diff --git a/meta/recipes-devtools/rust/
> rust-cross-canadian_1.68.1.bb b/meta/recipes-devtools/rust/
> rust-cross-canadian_1.68.2.bb
> > > > > similarity index 100%
> > > > > rename from meta/recipes-devtools/rust/
> rust-cross-canadian_1.68.1.bb
> > > > > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.b=
b
> > > > > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.68.1.bb
> b/meta/recipes-devtools/rust/rust-llvm_1.68.2.bb
> > > > > similarity index 100%
> > > > > rename from meta/recipes-devtools/rust/rust-llvm_1.68.1.bb
> > > > > rename to meta/recipes-devtools/rust/rust-llvm_1.68.2.bb
> > > > > diff --git a/meta/recipes-devtools/rust/rust-source.inc
> b/meta/recipes-devtools/rust/rust-source.inc
> > > > > index c8f5a5a9c4c4..6d3a4b131e26 100644
> > > > > --- a/meta/recipes-devtools/rust/rust-source.inc
> > > > > +++ b/meta/recipes-devtools/rust/rust-source.inc
> > > > > @@ -7,7 +7,7 @@ SRC_URI +=3D "
> https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
> > > > >
> file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=3D${RUSTSR=
C} \
> > > > >              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
> > > > >  "
> > > > > -SRC_URI[rust.sha256sum] =3D
> "5b8ea94085b65e75c1fa6310e2f90bd706fa80bfcb3544fe26f4037b911d9fb2"
> > > > > +SRC_URI[rust.sha256sum] =3D
> "ce1a115f6aafa912b4622906a92b626354973afa9288e2c7750df4dcf3390fc0"
> > > > >
> > > > >  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> > > > >
> > > > > diff --git a/meta/recipes-devtools/rust/rust_1.68.1.bb
> b/meta/recipes-devtools/rust/rust_1.68.2.bb
> > > > > similarity index 100%
> > > > > rename from meta/recipes-devtools/rust/rust_1.68.1.bb
> > > > > rename to meta/recipes-devtools/rust/rust_1.68.2.bb
> > > > > --
> > > > > 2.39.0
> > > > >
> > > > >
> > > > >
> > > > >
> > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#179897):
> https://lists.openembedded.org/g/openembedded-core/message/179897
> > > > Mute This Topic: https://lists.openembedded.org/mt/98172309/3617179
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
> > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
>

--000000000000a6e63405f90a4c3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Cool, was just picking up the pieces to check it, but I&#=
39;ll leave it now!</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, 11 Apr 2023, 08:07 Khem Raj, &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">alright my builds for cargo on qemuriscv32/musl went =
ok so I guess its ok.<br>
<br>
On Mon, Apr 10, 2023 at 11:11=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a=
>&gt; wrote:<br>
&gt;<br>
&gt; Thanks, I&#39;ll also check it out. I think the checksums for the musl=
<br>
&gt; patch would need updating I think as the versions of these crates<br>
&gt; might have changed.<br>
&gt;<br>
&gt; On Mon, Apr 10, 2023 at 10:30=E2=80=AFAM Alexandre Belloni<br>
&gt; &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blank"=
 rel=3D"noreferrer">alexandre.belloni@bootlin.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; My current a-full has this patch.<br>
&gt; &gt;<br>
&gt; &gt; On 10/04/2023 10:21:16-0700, Khem Raj wrote:<br>
&gt; &gt; &gt; If possible, Can you test this on top of contrib/abelloni/ma=
ster-next<br>
&gt; &gt; &gt; for musl target ?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Apr 10, 2023 at 2:42=E2=80=AFAM Alex Kiernan &lt;<a =
href=3D"mailto:alex.kiernan@gmail.com" target=3D"_blank" rel=3D"noreferrer"=
>alex.kiernan@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Changes:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; * Update the GitHub RSA host key bundled within Cargo. =
The key was<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0rotated by GitHub on 2023-03-24 after the o=
ld one leaked.<br>
&gt; &gt; &gt; &gt; * Mark the old GitHub RSA host key as revoked. This wil=
l prevent Cargo<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0from accepting the leaked key even when tru=
sted by the system.<br>
&gt; &gt; &gt; &gt; * Add support for @revoked and a better error message f=
or<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0@cert-authority in Cargo=E2=80=99s SSH host=
 key verification<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.=
kiernan@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kiernan@gmail.=
com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/recipes-devtools/rust/{<a href=3D"http://car=
go_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo_1.68.1.=
bb</a> =3D&gt; <a href=3D"http://cargo_1.68.2.bb" rel=3D"noreferrer norefer=
rer" target=3D"_blank">cargo_1.68.2.bb</a>} | 0<br>
&gt; &gt; &gt; &gt;=C2=A0 .../rust/{<a href=3D"http://libstd-rs_1.68.1.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">libstd-rs_1.68.1.bb</a> =3D=
&gt; <a href=3D"http://libstd-rs_1.68.2.bb" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">libstd-rs_1.68.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 0<br>
&gt; &gt; &gt; &gt;=C2=A0 ...<a href=3D"http://t-cross-canadian_1.68.1.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">t-cross-canadian_1.68.1.bb<=
/a> =3D&gt; <a href=3D"http://rust-cross-canadian_1.68.2.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">rust-cross-canadian_1.68.2.bb</a>} | 0<br=
>
&gt; &gt; &gt; &gt;=C2=A0 .../rust/{<a href=3D"http://rust-llvm_1.68.1.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">rust-llvm_1.68.1.bb</a> =3D=
&gt; <a href=3D"http://rust-llvm_1.68.2.bb" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">rust-llvm_1.68.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 0<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/recipes-devtools/rust/rust-source.inc=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +=
-<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/recipes-devtools/rust/{<a href=3D"http://rus=
t_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rust_1.68.1.bb=
</a> =3D&gt; <a href=3D"http://rust_1.68.2.bb" rel=3D"noreferrer noreferrer=
" target=3D"_blank">rust_1.68.2.bb</a>}=C2=A0 =C2=A0| 0<br>
&gt; &gt; &gt; &gt;=C2=A0 6 files changed, 1 insertion(+), 1 deletion(-)<br=
>
&gt; &gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"htt=
p://cargo_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo_=
1.68.1.bb</a> =3D&gt; <a href=3D"http://cargo_1.68.2.bb" rel=3D"noreferrer =
noreferrer" target=3D"_blank">cargo_1.68.2.bb</a>} (100%)<br>
&gt; &gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"htt=
p://libstd-rs_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">li=
bstd-rs_1.68.1.bb</a> =3D&gt; <a href=3D"http://libstd-rs_1.68.2.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">libstd-rs_1.68.2.bb</a>} (100%)<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"htt=
p://rust-cross-canadian_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"=
_blank">rust-cross-canadian_1.68.1.bb</a> =3D&gt; <a href=3D"http://rust-cr=
oss-canadian_1.68.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rus=
t-cross-canadian_1.68.2.bb</a>} (100%)<br>
&gt; &gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"htt=
p://rust-llvm_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">ru=
st-llvm_1.68.1.bb</a> =3D&gt; <a href=3D"http://rust-llvm_1.68.2.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">rust-llvm_1.68.2.bb</a>} (100%)<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"htt=
p://rust_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rust_1.=
68.1.bb</a> =3D&gt; <a href=3D"http://rust_1.68.2.bb" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">rust_1.68.2.bb</a>} (100%)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http=
://cargo_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo_1=
.68.1.bb</a> b/meta/recipes-devtools/rust/<a href=3D"http://cargo_1.68.2.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo_1.68.2.bb</a><br>
&gt; &gt; &gt; &gt; similarity index 100%<br>
&gt; &gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http:=
//cargo_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo_1.=
68.1.bb</a><br>
&gt; &gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://=
cargo_1.68.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo_1.68=
.2.bb</a><br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http=
://libstd-rs_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">lib=
std-rs_1.68.1.bb</a> b/meta/recipes-devtools/rust/<a href=3D"http://libstd-=
rs_1.68.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libstd-rs_1.6=
8.2.bb</a><br>
&gt; &gt; &gt; &gt; similarity index 100%<br>
&gt; &gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http:=
//libstd-rs_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libs=
td-rs_1.68.1.bb</a><br>
&gt; &gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://=
libstd-rs_1.68.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libstd=
-rs_1.68.2.bb</a><br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http=
://rust-cross-canadian_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_=
blank">rust-cross-canadian_1.68.1.bb</a> b/meta/recipes-devtools/rust/<a hr=
ef=3D"http://rust-cross-canadian_1.68.2.bb" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">rust-cross-canadian_1.68.2.bb</a><br>
&gt; &gt; &gt; &gt; similarity index 100%<br>
&gt; &gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http:=
//rust-cross-canadian_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">rust-cross-canadian_1.68.1.bb</a><br>
&gt; &gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://=
rust-cross-canadian_1.68.2.bb" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">rust-cross-canadian_1.68.2.bb</a><br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http=
://rust-llvm_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rus=
t-llvm_1.68.1.bb</a> b/meta/recipes-devtools/rust/<a href=3D"http://rust-ll=
vm_1.68.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rust-llvm_1.6=
8.2.bb</a><br>
&gt; &gt; &gt; &gt; similarity index 100%<br>
&gt; &gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http:=
//rust-llvm_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rust=
-llvm_1.68.1.bb</a><br>
&gt; &gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://=
rust-llvm_1.68.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rust-l=
lvm_1.68.2.bb</a><br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/rust-source.inc=
 b/meta/recipes-devtools/rust/rust-source.inc<br>
&gt; &gt; &gt; &gt; index c8f5a5a9c4c4..6d3a4b131e26 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/recipes-devtools/rust/rust-source.inc<br>
&gt; &gt; &gt; &gt; +++ b/meta/recipes-devtools/rust/rust-source.inc<br>
&gt; &gt; &gt; &gt; @@ -7,7 +7,7 @@ SRC_URI +=3D &quot;<a href=3D"https://s=
tatic.rust-lang.org/dist/rustc-$%7BRUST_VERSION%7D-src.tar.xz;n" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">https://static.rust-lang.org/dist/rus=
tc-${RUST_VERSION}-src.tar.xz;n</a><br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://=
0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=3D${RUSTSRC} \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://=
zlib-off64_t.patch;patchdir=3D${RUSTSRC} \<br>
&gt; &gt; &gt; &gt;=C2=A0 &quot;<br>
&gt; &gt; &gt; &gt; -SRC_URI[rust.sha256sum] =3D &quot;5b8ea94085b65e75c1fa=
6310e2f90bd706fa80bfcb3544fe26f4037b911d9fb2&quot;<br>
&gt; &gt; &gt; &gt; +SRC_URI[rust.sha256sum] =3D &quot;ce1a115f6aafa912b462=
2906a92b626354973afa9288e2c7750df4dcf3390fc0&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 RUSTSRC =3D &quot;${WORKDIR}/rustc-${RUST_VERSION=
}-src&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http=
://rust_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rust_1.6=
8.1.bb</a> b/meta/recipes-devtools/rust/<a href=3D"http://rust_1.68.2.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">rust_1.68.2.bb</a><br>
&gt; &gt; &gt; &gt; similarity index 100%<br>
&gt; &gt; &gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http:=
//rust_1.68.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rust_1.68=
.1.bb</a><br>
&gt; &gt; &gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://=
rust_1.68.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rust_1.68.2=
.bb</a><br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; 2.39.0<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; &gt; View/Reply Online (#179897): <a href=3D"https://lists.openem=
bedded.org/g/openembedded-core/message/179897" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/mess=
age/179897</a><br>
&gt; &gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/m=
t/98172309/3617179" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/mt/98172309/3617179</a><br>
&gt; &gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lis=
ts.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core=
+owner@lists.openembedded.org</a><br>
&gt; &gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:=
alexandre.belloni@bootlin.com" target=3D"_blank" rel=3D"noreferrer">alexand=
re.belloni@bootlin.com</a>]<br>
&gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; &gt; Embedded Linux and Kernel engineering<br>
&gt; &gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://bootlin.com</a><br>
</blockquote></div>

--000000000000a6e63405f90a4c3b--

