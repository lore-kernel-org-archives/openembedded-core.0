Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07948CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 14:42:51 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.65.1757428965523252632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 07:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Tx/YhGJO;
 spf=pass (domain: smile.fr, ip: 209.85.208.178, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-336b908cbaaso48760831fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1757428964; x=1758033764; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bl3VntnCKBnN11ajoHyCq2uaLKUor91A2TSP1aYP4Ng=;
        b=Tx/YhGJOWhDXw2k2cK1JfV9X/1No57MyIBPfZLQzb1C6dklV4PNLetlRA1XuRCrZ1S
         GSnIPQWTxZiPcnjVYA88eBfScbMORF1+hS3WGI3rE5b5gGbpEnOktH1EjmYK8eCF52jG
         tc+OT/wHbrlx3EJcrlFI+YNqqa3czrXsgOwqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757428964; x=1758033764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bl3VntnCKBnN11ajoHyCq2uaLKUor91A2TSP1aYP4Ng=;
        b=ayOZE77c4l3b1wWAeb6JtxZ3JpCsBJmoPXahFNrhsfXY/Cd7dG12wb4zsVR1xbGiPO
         HMmsHYZAm1uZsYThv294ELhYYQg3qu3CrdpqC762R6cqK4fTw+okjMV9uSotqX43wciM
         GO7xOLJfqllJSMQ9A1U8SXgcehAM4IXoRacRCYap552IR39IjNZ72RZfslxbwX4GHjBE
         fV3Uii5uESRgNcd5+SuNQNVv6Sz6RVmQu0e3K6iQMJbLKMORQKOuhM4zlPLWSTBG5BDw
         7P5opzRzWxh2uOllHbSL1VmjoRL5CxTagqSZNrdYY+WmbwfU+3eTxl+X+CGI40sDourA
         y1Iw==
X-Gm-Message-State: AOJu0YwFHpbx0mGZSow4/58Y8RSbRPw/UkpIuUx8BasQ8dNxyz1q3VMm
	0aENy9MBSCkrudQaw0DXJwig5zDUInNRK2/VOMPLsB55VYyslp+LB667l4csuWK7IGLEE+jpOjE
	OsoEVMswhaZNAjB3FAw4lc53/9C9v4IOPfwQz9isZZw==
X-Gm-Gg: ASbGncuv2LA5WvfVc3Z2XQ70nYx2F5OU5vD2KnDv+8jkv+Tsm7miaKtLJZhPqpih2hV
	hcmb1ja22eEFhk1RIwzweSmeCiw2/RFqUZDmlMTUxuf+O5Tscul2mIC38dxzTrAlF2MUVAeDbgi
	2FTredwHiIMqtKJC2NY4Awl54S6s7m7Dv0bZineZAVTw4Qo+k/BkTnjEwORW/FElhaLYk4WNZQZ
	zFXQbDBY08tQjkfLA==
X-Google-Smtp-Source: AGHT+IHXYIpRv00ckKeq+pDl6QhHL42glOoadz3Uodn9AizdF6VJlJFyYb2TnFK/n4eUwVE4deXeP6QIfY6SJR84YEM=
X-Received: by 2002:a05:651c:19a3:b0:332:2235:911c with SMTP id
 38308e7fff4ca-33b5f9597c7mr29621291fa.37.1757428963365; Tue, 09 Sep 2025
 07:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250903144528.2248743-1-pierre-loup.gosse@smile.fr>
 <20250903144528.2248743-2-pierre-loup.gosse@smile.fr> <05BB27FE-2DF8-4C80-9229-E9038E6E5D8A@arm.com>
In-Reply-To: <05BB27FE-2DF8-4C80-9229-E9038E6E5D8A@arm.com>
From: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Date: Tue, 9 Sep 2025 16:42:32 +0200
X-Gm-Features: Ac12FXwe8JcBNc4m7mGT_Q1qGEa3iwblGHf25hfy2AD-J00CObsEvWEYa5tstOQ
Message-ID: <CAHT-cZuP=FpST_hXip+3ibgLp4JYLQaa=nfkVk9m7ZqRUDOc6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 2/2] wic: rename wks flag --extra-space to --extra-filesystem-space
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Antonin Godard <antonin.godard@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000001465da063e5f51b3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 14:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223117

--0000000000001465da063e5f51b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have already sent patches for documentation to the yocto-docs mailing
list.

Pierre-Loup,

On Tue, Sep 9, 2025 at 4:31=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> wr=
ote:

> These changes need to be documented, so would you be able to send a patch
> for the documentation (yocto-docs repository)?
>
> CCing Antonin so he=E2=80=99s aware.
>
> Ross
>
> > On 3 Sep 2025, at 15:45, pierre-loup.gosse via lists.openembedded.org
> <pierre-loup.gosse=3Dsmile.fr@lists.openembedded.org> wrote:
> >
> > From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> >
> > Makes a clear distinction with --extra-partition-space flag.
> >
> > Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> >
> > CC: Alexander Kanavin <alex.kanavin@gmail.com>
> > CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> > ---
> > changes in v3:
> > - adding this patch
> >
> > changes in v4:
> > - no change
> >
> > changes in v5:
> > - fix extra_filesystem_space check
> > ---
> > meta/lib/oeqa/selftest/cases/wic.py |  4 ++--
> > scripts/lib/wic/help.py             | 12 ++++++------
> > scripts/lib/wic/ksparser.py         | 25 +++++++++++++------------
> > scripts/lib/wic/partition.py        |  6 +++---
> > 4 files changed, 24 insertions(+), 23 deletions(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/wic.py
> b/meta/lib/oeqa/selftest/cases/wic.py
> > index c244c9f188..b1c318bd4e 100644
> > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > @@ -1311,12 +1311,12 @@ run_wic_cmd() {
> >             p, _ =3D self._get_wic_partitions(tempf.name,
> ignore_status=3DTrue)
> >             self.assertNotEqual(p.status, 0, "wic exited successfully
> when an error was expected:\n%s" % p.output)
> >
> > -    def test_extra_space(self):
> > +    def test_extra_filesystem_space(self):
> >         native_sysroot =3D get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-too=
ls")
> >
> >         with NamedTemporaryFile("w", suffix=3D".wks") as tempf:
> >             tempf.write("bootloader --ptable gpt\n" \
> > -                        "part /     --source rootfs --ondisk hda
> --extra-space 200M --fstype=3Dext4\n")
> > +                        "part /     --source rootfs --ondisk hda
> --extra-filesystem-space 200M --fstype=3Dext4\n")
> >             tempf.flush()
> >
> >             _, partlns =3D self._get_wic_partitions(tempf.name,
> native_sysroot)
> > diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> > index 800c0abf0f..6b49a67de9 100644
> > --- a/scripts/lib/wic/help.py
> > +++ b/scripts/lib/wic/help.py
> > @@ -1013,12 +1013,12 @@ DESCRIPTION
> >          --no-fstab-update: This option is specific to wic. It does not
> update the
> >                             '/etc/fstab' stock file for the given
> partition.
> >
> > -         --extra-space: This option is specific to wic. It adds extra
> > -                        space after the space filled by the content
> > -                        of the partition. The final size can go
> > -                        beyond the size specified by --size.
> > -                        By default, 10MB. This option cannot be used
> > -                        with --fixed-size option.
> > +         --extra-filesystem-space: This option is specific to wic. It
> adds extra
> > +                                   space after the space filled by the
> content
> > +                                   of the partition. The final size ca=
n
> go
> > +                                   beyond the size specified by --size=
.
> > +                                   By default, 10MB. This option canno=
t
> be used
> > +                                   with --fixed-size option.
> >
> >          --extra-partition-space: This option is specific to wic. It
> adds extra
> >                                   empty space after the space filled by
> the
> > diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> > index a1aaf1b4b3..705f989750 100644
> > --- a/scripts/lib/wic/ksparser.py
> > +++ b/scripts/lib/wic/ksparser.py
> > @@ -132,7 +132,7 @@ def systemidtype(arg):
> > class KickStart():
> >     """Kickstart parser implementation."""
> >
> > -    DEFAULT_EXTRA_SPACE =3D 10*1024
> > +    DEFAULT_EXTRA_FILESYSTEM_SPACE =3D 10*1024
> >     DEFAULT_OVERHEAD_FACTOR =3D 1.3
> >
> >     def __init__(self, confpath):
> > @@ -153,7 +153,7 @@ class KickStart():
> >         part.add_argument('--exclude-path', nargs=3D'+')
> >         part.add_argument('--include-path', nargs=3D'+', action=3D'appe=
nd')
> >         part.add_argument('--change-directory')
> > -        part.add_argument("--extra-space", type=3Dsizetype("M"))
> > +        part.add_argument('--extra-filesystem-space',
> type=3Dsizetype("M"))
> >         part.add_argument('--extra-partition-space', type=3Dsizetype("M=
"))
> >         part.add_argument('--fsoptions', dest=3D'fsopts')
> >         part.add_argument('--fspassno', dest=3D'fspassno')
> > @@ -175,9 +175,9 @@ class KickStart():
> >         part.add_argument('--hidden', action=3D'store_true')
> >
> >         # --size and --fixed-size cannot be specified together; options
> > -        # ----extra-space and --overhead-factor should also raise a
> parser
> > -        # --error, but since nesting mutually exclusive groups does no=
t
> work,
> > -        # ----extra-space/--overhead-factor are handled later
> > +        # ----extra-filesystem-space and --overhead-factor should also
> raise a
> > +        # parser error, but since nesting mutually exclusive groups
> does not work,
> > +        # ----extra-filesystem-space/--overhead-factor are handled lat=
er
> >         sizeexcl =3D part.add_mutually_exclusive_group()
> >         sizeexcl.add_argument('--size', type=3Dsizetype("M"), default=
=3D0)
> >         sizeexcl.add_argument('--fixed-size', type=3Dsizetype("M"),
> default=3D0)
> > @@ -264,12 +264,13 @@ class KickStart():
> >                             parsed.extra_partition_space =3D 0
> >                         # using ArgumentParser one cannot easily tell i=
f
> option
> >                         # was passed as argument, if said option has a
> default
> > -                        # value; --overhead-factor/--extra-space canno=
t
> be used
> > -                        # with --fixed-size, so at least detect when
> these were
> > -                        # passed with non-0 values ...
> > +                        # value;
> --overhead-factor/--extra-filesystem-space
> > +                        # cannot be used with --fixed-size, so at leas=
t
> detect
> > +                        # when these were passed with non-0 values ...
> >                         if parsed.fixed_size:
> > -                            if parsed.overhead_factor or
> parsed.extra_space:
> > -                                err =3D "%s:%d: arguments
> --overhead-factor and --extra-space not "\
> > +                            if parsed.overhead_factor or
> parsed.extra_filesystem_space:
> > +                                err =3D "%s:%d: arguments
> --overhead-factor and "\
> > +                                      "--extra-filesystem-space not "\
> >                                       "allowed with argument
> --fixed-size" \
> >                                       % (confpath, lineno)
> >                                 raise KickStartError(err)
> > @@ -280,8 +281,8 @@ class KickStart():
> >                             # with value equal to 0)
> >                             if not parsed.overhead_factor:
> >                                 parsed.overhead_factor =3D
> self.DEFAULT_OVERHEAD_FACTOR
> > -                            if not parsed.extra_space:
> > -                                parsed.extra_space =3D
> self.DEFAULT_EXTRA_SPACE
> > +                            if not parsed.extra_filesystem_space:
> > +                                parsed.extra_filesystem_space =3D
> self.DEFAULT_EXTRA_FILESYSTEM_SPACE
> >
> >                         self.partnum +=3D 1
> >                         self.partitions.append(Partition(parsed,
> self.partnum))
> > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.p=
y
> > index d358aabbd6..0c9b1a5b96 100644
> > --- a/scripts/lib/wic/partition.py
> > +++ b/scripts/lib/wic/partition.py
> > @@ -28,7 +28,7 @@ class Partition():
> >         self.align =3D args.align
> >         self.disk =3D args.disk
> >         self.device =3D None
> > -        self.extra_space =3D args.extra_space
> > +        self.extra_filesystem_space =3D args.extra_filesystem_space
> >         self.extra_partition_space =3D args.extra_partition_space
> >         self.exclude_path =3D args.exclude_path
> >         self.include_path =3D args.include_path
> > @@ -104,8 +104,8 @@ class Partition():
> >                                (actual_rootfs_size, rootfs_size))
> >         else:
> >             extra_blocks =3D self.get_extra_block_count(actual_rootfs_s=
ize)
> > -            if extra_blocks < self.extra_space:
> > -                extra_blocks =3D self.extra_space
> > +            if extra_blocks < self.extra_filesystem_space:
> > +                extra_blocks =3D self.extra_filesystem_space
> >
> >             rootfs_size =3D actual_rootfs_size + extra_blocks
> >             rootfs_size =3D int(rootfs_size * self.overhead_factor)
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#222864):
> https://lists.openembedded.org/g/openembedded-core/message/222864
> > Mute This Topic: https://lists.openembedded.org/mt/115046316/6875888
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--0000000000001465da063e5f51b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div></div><div>I have already sent patches for documentat=
ion to the yocto-docs mailing list.</div><div><br></div><div>Pierre-Loup,</=
div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Sep 9, 2025 at 4:31=E2=80=AFPM Ross Burto=
n &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">These chang=
es need to be documented, so would you be able to send a patch for the docu=
mentation (yocto-docs repository)?<br>
<br>
CCing Antonin so he=E2=80=99s aware.<br>
<br>
Ross<br>
<br>
&gt; On 3 Sep 2025, at 15:45, pierre-loup.gosse via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a> &lt;pierre-loup.gosse=3D<a href=3D"mailto:smile.fr@lists.openembedd=
ed.org" target=3D"_blank">smile.fr@lists.openembedded.org</a>&gt; wrote:<br=
>
&gt; <br>
&gt; From: Pierre-Loup GOSSE &lt;<a href=3D"mailto:pierre-loup.gosse@smile.=
fr" target=3D"_blank">pierre-loup.gosse@smile.fr</a>&gt;<br>
&gt; <br>
&gt; Makes a clear distinction with --extra-partition-space flag.<br>
&gt; <br>
&gt; Signed-off-by: Pierre-Loup GOSSE &lt;<a href=3D"mailto:pierre-loup.gos=
se@smile.fr" target=3D"_blank">pierre-loup.gosse@smile.fr</a>&gt;<br>
&gt; <br>
&gt; CC: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; CC: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@=
bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&gt;<br=
>
&gt; ---<br>
&gt; changes in v3:<br>
&gt; - adding this patch<br>
&gt; <br>
&gt; changes in v4:<br>
&gt; - no change<br>
&gt; <br>
&gt; changes in v5:<br>
&gt; - fix extra_filesystem_space check<br>
&gt; ---<br>
&gt; meta/lib/oeqa/selftest/cases/wic.py |=C2=A0 4 ++--<br>
&gt; scripts/lib/wic/help.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 12 ++++++------<br>
&gt; scripts/lib/wic/ksparser.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 25 ++++=
+++++++++------------<br>
&gt; scripts/lib/wic/partition.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++-=
--<br>
&gt; 4 files changed, 24 insertions(+), 23 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selft=
est/cases/wic.py<br>
&gt; index c244c9f188..b1c318bd4e 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/wic.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/wic.py<br>
&gt; @@ -1311,12 +1311,12 @@ run_wic_cmd() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p, _ =3D self._get_wic_=
partitions(<a href=3D"http://tempf.name" rel=3D"noreferrer" target=3D"_blan=
k">tempf.name</a>, ignore_status=3DTrue)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertNotEqual(p.s=
tatus, 0, &quot;wic exited successfully when an error was expected:\n%s&quo=
t; % p.output)<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 def test_extra_space(self):<br>
&gt; +=C2=A0 =C2=A0 def test_extra_filesystem_space(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0native_sysroot =3D get_bb_var(&quot;R=
ECIPE_SYSROOT_NATIVE&quot;, &quot;wic-tools&quot;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with NamedTemporaryFile(&quot;w&quot;=
, suffix=3D&quot;.wks&quot;) as tempf:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tempf.write(&quot;bootl=
oader --ptable gpt\n&quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;part /=C2=A0 =C2=A0 =C2=A0--source rootfs --ondisk hda=
 --extra-space 200M --fstype=3Dext4\n&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;part /=C2=A0 =C2=A0 =C2=A0--source rootfs --ondisk hda=
 --extra-filesystem-space 200M --fstype=3Dext4\n&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tempf.flush()<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_, partlns =3D self._ge=
t_wic_partitions(<a href=3D"http://tempf.name" rel=3D"noreferrer" target=3D=
"_blank">tempf.name</a>, native_sysroot)<br>
&gt; diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py<br>
&gt; index 800c0abf0f..6b49a67de9 100644<br>
&gt; --- a/scripts/lib/wic/help.py<br>
&gt; +++ b/scripts/lib/wic/help.py<br>
&gt; @@ -1013,12 +1013,12 @@ DESCRIPTION<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --no-fstab-update: This option is sp=
ecific to wic. It does not update the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/etc/fstab&#39; stock file for the g=
iven partition.<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--extra-space: This option is speci=
fic to wic. It adds extra<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 space after the space filled by the content<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 of the partition. The final size can go<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 beyond the size specified by --size.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 By default, 10MB. This option cannot be used<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 with --fixed-size option.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--extra-filesystem-space: This opti=
on is specific to wic. It adds extra<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0space after the spa=
ce filled by the content<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of the partition. T=
he final size can go<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0beyond the size spe=
cified by --size.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0By default, 10MB. T=
his option cannot be used<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with --fixed-size o=
ption.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --extra-partition-space: This option=
 is specific to wic. It adds extra<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0empty space after th=
e space filled by the<br>
&gt; diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py=
<br>
&gt; index a1aaf1b4b3..705f989750 100644<br>
&gt; --- a/scripts/lib/wic/ksparser.py<br>
&gt; +++ b/scripts/lib/wic/ksparser.py<br>
&gt; @@ -132,7 +132,7 @@ def systemidtype(arg):<br>
&gt; class KickStart():<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Kickstart parser implementation.&=
quot;&quot;&quot;<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 DEFAULT_EXTRA_SPACE =3D 10*1024<br>
&gt; +=C2=A0 =C2=A0 DEFAULT_EXTRA_FILESYSTEM_SPACE =3D 10*1024<br>
&gt;=C2=A0 =C2=A0 =C2=A0DEFAULT_OVERHEAD_FACTOR =3D 1.3<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0def __init__(self, confpath):<br>
&gt; @@ -153,7 +153,7 @@ class KickStart():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.add_argument(&#39;--exclude-path=
&#39;, nargs=3D&#39;+&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.add_argument(&#39;--include-path=
&#39;, nargs=3D&#39;+&#39;, action=3D&#39;append&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.add_argument(&#39;--change-direc=
tory&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 part.add_argument(&quot;--extra-space&quo=
t;, type=3Dsizetype(&quot;M&quot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 part.add_argument(&#39;--extra-filesystem=
-space&#39;, type=3Dsizetype(&quot;M&quot;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.add_argument(&#39;--extra-partit=
ion-space&#39;, type=3Dsizetype(&quot;M&quot;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.add_argument(&#39;--fsoptions&#3=
9;, dest=3D&#39;fsopts&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.add_argument(&#39;--fspassno&#39=
;, dest=3D&#39;fspassno&#39;)<br>
&gt; @@ -175,9 +175,9 @@ class KickStart():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.add_argument(&#39;--hidden&#39;,=
 action=3D&#39;store_true&#39;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# --size and --fixed-size cannot be s=
pecified together; options<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # ----extra-space and --overhead-factor s=
hould also raise a parser<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # --error, but since nesting mutually exc=
lusive groups does not work,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # ----extra-space/--overhead-factor are h=
andled later<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # ----extra-filesystem-space and --overhe=
ad-factor should also raise a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # parser error, but since nesting mutuall=
y exclusive groups does not work,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # ----extra-filesystem-space/--overhead-f=
actor are handled later<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeexcl =3D part.add_mutually_exclus=
ive_group()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeexcl.add_argument(&#39;--size&#39=
;, type=3Dsizetype(&quot;M&quot;), default=3D0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeexcl.add_argument(&#39;--fixed-si=
ze&#39;, type=3Dsizetype(&quot;M&quot;), default=3D0)<br>
&gt; @@ -264,12 +264,13 @@ class KickStart():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parsed.extra_partition_space =3D 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0# using ArgumentParser one cannot easily tell if option=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0# was passed as argument, if said option has a default<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 # value; --overhead-factor/--extra-space cannot be used<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 # with --fixed-size, so at least detect when these were<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 # passed with non-0 values ...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 # value; --overhead-factor/--extra-filesystem-space<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 # cannot be used with --fixed-size, so at least detect<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 # when these were passed with non-0 values ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if parsed.fixed_size:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if parsed.overhead_factor or parsed.extra_spac=
e:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D &quot;%s:%d: arguments -=
-overhead-factor and --extra-space not &quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if parsed.overhead_factor or parsed.extra_file=
system_space:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D &quot;%s:%d: arguments -=
-overhead-factor and &quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;--ext=
ra-filesystem-space not &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
allowed with argument --fixed-size&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% (con=
fpath, lineno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise KickStartError(err)<b=
r>
&gt; @@ -280,8 +281,8 @@ class KickStart():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# with value equal to 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not parsed.overhead_factor:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parsed.overhead_factor =3D =
self.DEFAULT_OVERHEAD_FACTOR<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not parsed.extra_space:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parsed.extra_space =3D self.DEFA=
ULT_EXTRA_SPACE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not parsed.extra_filesystem_space:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parsed.extra_filesystem_space =
=3D self.DEFAULT_EXTRA_FILESYSTEM_SPACE<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0self.partnum +=3D 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0self.partitions.append(Partition(parsed, self.partnum))=
<br>
&gt; diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.=
py<br>
&gt; index d358aabbd6..0c9b1a5b96 100644<br>
&gt; --- a/scripts/lib/wic/partition.py<br>
&gt; +++ b/scripts/lib/wic/partition.py<br>
&gt; @@ -28,7 +28,7 @@ class Partition():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.align =3D args.align<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.disk =3D args.disk<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.device =3D None<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.extra_space =3D args.extra_space<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.extra_filesystem_space =3D args.extr=
a_filesystem_space<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.extra_partition_space =3D args.e=
xtra_partition_space<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.exclude_path =3D args.exclude_pa=
th<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.include_path =3D args.include_pa=
th<br>
&gt; @@ -104,8 +104,8 @@ class Partition():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (actual_rootfs_size, rootfs_size)=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extra_blocks =3D self.g=
et_extra_block_count(actual_rootfs_size)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if extra_blocks &lt; self.e=
xtra_space:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_blocks =
=3D self.extra_space<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if extra_blocks &lt; self.e=
xtra_filesystem_space:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_blocks =
=3D self.extra_filesystem_space<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootfs_size =3D actual_=
rootfs_size + extra_blocks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootfs_size =3D int(roo=
tfs_size * self.overhead_factor)<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#222864): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/222864" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/222864</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11504631=
6/6875888" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/115046316/6875888</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div>

--0000000000001465da063e5f51b3--

