Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD29C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 15:10:12 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.11442.1678806605684242064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 08:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L3snF4O1;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id a32so16352464ljr.9
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 08:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678806604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9BVGJR3y5ruISmnaIbpXCf+Tp5Dz1MNB8jSfrUacJIg=;
        b=L3snF4O1dbxDCrLgf+TEhKmTzpjXo/nRWG1i64mh+GX8+EXfPftMX01iHgd5mpkR8F
         bjnmxY4vMsP/STqAQu1tsDD8KQv/MN1vOyWmwl6kdUno5UMpARnbn7zkHEchoD7tEuHH
         qo1cCIfwwIQ8kT5jm6710jbp7nC5pHrbNcxTSS4WkF+nM9BN5Kai7Sf10DdgczlsRg2r
         2ehWlYOkv7iqREE/PI0iAtGRTJnJs2ih0cI3kBSV90D7w6Mh9RW/XU6lihX8E7z5NI0P
         W27Dqr6Pv5OUtbO44kZLEGYEJIp+dQLNnq6w0ye65biBga3+J+oZpIPiV7rQRhlyAPJE
         k8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678806604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BVGJR3y5ruISmnaIbpXCf+Tp5Dz1MNB8jSfrUacJIg=;
        b=UkJi9xZXVjYyYdysusU045JmAdraF2P6aMTQs0u+IPhlp1nYHvg37NlIoBhf/bTL4T
         sAlLGbP7EB7jnYhUrPCb85PqobTYdEZrNRcuUO98f7jcJMMTz4fd91DcRRs/MRDwPVh2
         7QtFDUuTVEnXog0Nay/gFRpFbJ9lLf+9T32GNSUc9kTVZ1kWsszJ9KVad5K9foYt37ZR
         NDz0BW8QxUpL/40XJiGJyBI0FPzMN2sHL0CK82/3kBAyKRZ9gIqDq/jUevd7E65zRVMy
         TPS3PjAo7Tg1fq85425PXlqx1rvWeVVGWAMKfXpZR9H8pdas5amH7enu0idMwDfuPL82
         BFsQ==
X-Gm-Message-State: AO0yUKWG//s8Z6Mdm0x6pRhMtPTXH65nFo/iHCEIDzVXppKIkAdtYEBK
	XELKtAF+P4qMFHorxs6FOKp7YPcssg259YPtG20=
X-Google-Smtp-Source: AK7set+ZUjoKv7TVEs6uAx+HPp17rPtApwWMSu+EdBug/7ixVG9Qr5/aq4GZk3dGm0eD+fY3ebqe/BmaksI6A/uNTt4=
X-Received: by 2002:a05:651c:a0b:b0:295:acea:5884 with SMTP id
 k11-20020a05651c0a0b00b00295acea5884mr5979853ljq.3.1678806603792; Tue, 14 Mar
 2023 08:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
 <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
 <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
 <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com>
 <CA+cAkeqLOVAT7bz+HXKyC7=vwyrRAfE76buQ7C9cog6WQ6k1gw@mail.gmail.com>
 <CAO5Uq5QnyWqi5_CaX7sHTrewVRhvT_SKdXTY7PvKe4dPryCQ6w@mail.gmail.com>
 <CA+cAkeowE7BUYie9rdFPpJ972DHK+d3WGXLKFPAKcYcVYy_AXA@mail.gmail.com>
 <CANNYZj_xAGD8x9=axLxDuEpaJF2K2yLUVH6VO1j0i5tKSvPi=g@mail.gmail.com>
 <CA+cAkeoP7ScYgbRG3eV1RR5R9bqEXm1b3cw7_gASG4uhJw=WfQ@mail.gmail.com>
 <CA+cAkerKf8yyHraJxWOyAQp91tVkgs08LSX4f3Navu1qJ+tV6w@mail.gmail.com>
 <CANNYZj9nxUwbJ6yQbnDZMtraM+Fv05LFkUQ8gKEkSbk1_70w+Q@mail.gmail.com>
 <CA+cAkerXmysSTdZyXzkQvURo9vpdtSxz1M5rBCcZBg5k7TV65g@mail.gmail.com> <CAO5Uq5SY6DQV7yMgaXraP3TR6=1f-2KbcDNSXdTYZJ6B359Tww@mail.gmail.com>
In-Reply-To: <CAO5Uq5SY6DQV7yMgaXraP3TR6=1f-2KbcDNSXdTYZJ6B359Tww@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 14 Mar 2023 16:09:52 +0100
Message-ID: <CA+cAkerdO8P=2DTL+qGj=ZF71LO-aWxn+qN+EMkT2TemokAhxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004405d505f6dd9feb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 15:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178500

--0000000000004405d505f6dd9feb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood, I searched how to add checksum support in crate fetcher but I
don't know enough of bitbake to be effective.

I'll check in the Cargo.lock in my project, backport your patch and
continue my exploration of the wonderful rust world on embedded device ^^

Thank you very much for the help on the subject guys and like I said
earlier, if you need me to do some more tests to help the patch being
merged in the master, I'm available.



Le mar. 14 mars 2023, 15:59, Alex Kiernan <alex.kiernan@gmail.com> a =C3=A9=
crit :

> On Tue, Mar 14, 2023 at 12:58=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > On Tue, 14 Mar 2023 at 11:35, Alexander Kanavin <alex.kanavin@gmail.com=
>
> wrote:
> > >
> > > --offline seems like the right thing to add, if it produces better
> errors.
> > >
> > > Generating Cargo.lock on the other hand is not right. We rely on rust
> > > checking the source tree against the checksums in Cargo.lock (to
> > > prevent supply chain attacks), and this would completely subvert that=
.
> > > There could be better diagnostics around missing Cargo.lock, and step=
s
> > > to address the issue, but such steps must be manually taken (even
> > > though they could be codified in a special task, similar to how
> > > generating list of crates in SRC_URI is a task).
> > >
> > > Alex
> > >
> >
> > Ok I see what you mean, generating the Cargo.lock in a dedicated task
> > inside  meta/classes-recipe/cargo-update-recipe-crates.bbclass
> > or maybe a dedicated meta/classes-recipe/cargo-generate-lockfile.bbclas=
s
> ?
>
> I'm really not sure we want Cargo.lock generation as part of the OE
> workflow - Cargo.lock should be part of your checked in sources for
> non-library projects.
>
>
> --
> Alex Kiernan
>

--0000000000004405d505f6dd9feb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Understood, I searched how to add checksum support i=
n crate fetcher but I don&#39;t know enough of bitbake to be effective.<div=
 dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll check in the Cargo.lock =
in my project, backport your patch and continue my exploration of the wonde=
rful rust world on embedded device ^^</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Thank you very much for the help on the subject guys and like=
 I said earlier, if you need me to do some more tests to help the patch bei=
ng merged in the master, I&#39;m available.=C2=A0</div><div dir=3D"auto"><b=
r></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">Le mar. 14 mars 2023, 15:59, Alex Kiernan &lt;<a href=3D"mailto:alex.=
kiernan@gmail.com">alex.kiernan@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On Tue, Mar 14, 2023 at 12:58=E2=80=AFPM=
 Fr=C3=A9d=C3=A9ric Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 14 Mar 2023 at 11:35, Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@g=
mail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; --offline seems like the right thing to add, if it produces bette=
r errors.<br>
&gt; &gt;<br>
&gt; &gt; Generating Cargo.lock on the other hand is not right. We rely on =
rust<br>
&gt; &gt; checking the source tree against the checksums in Cargo.lock (to<=
br>
&gt; &gt; prevent supply chain attacks), and this would completely subvert =
that.<br>
&gt; &gt; There could be better diagnostics around missing Cargo.lock, and =
steps<br>
&gt; &gt; to address the issue, but such steps must be manually taken (even=
<br>
&gt; &gt; though they could be codified in a special task, similar to how<b=
r>
&gt; &gt; generating list of crates in SRC_URI is a task).<br>
&gt; &gt;<br>
&gt; &gt; Alex<br>
&gt; &gt;<br>
&gt;<br>
&gt; Ok I see what you mean, generating the Cargo.lock in a dedicated task<=
br>
&gt; inside=C2=A0 meta/classes-recipe/cargo-update-recipe-crates.bbclass<br=
>
&gt; or maybe a dedicated meta/classes-recipe/cargo-generate-lockfile.bbcla=
ss ?<br>
<br>
I&#39;m really not sure we want Cargo.lock generation as part of the OE<br>
workflow - Cargo.lock should be part of your checked in sources for<br>
non-library projects.<br>
<br>
<br>
--<br>
Alex Kiernan<br>
</blockquote></div></div></div>

--0000000000004405d505f6dd9feb--

