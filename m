Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20505C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 18:15:02 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.1468.1678731297466982629
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 11:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YkAqoy6T;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id az3-20020a05600c600300b003ed2920d585so1646937wmb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 11:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678731296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tITpZ0eX4ZOgrTokiQ5GPjWZbZUZLfCZk+1VDczXlXE=;
        b=YkAqoy6TTsU51luk/fcw7c6mbNjNm8thuNgNqW2K8ZUn9knpxpxvf680NMv7NIezwH
         tcLfTmb1+LZJsAjzWq720yIrLrWjEcJHhhlpv4EXQhQ5Skqg1BV2XiDpxWmFgQQjHW5b
         si2q//fzfHbaE1UFNqrynl840XkgBJzONHVWtNs20BhuTvkbeahRMmI88WDAb63zujCv
         e2bjjm72y2uJNrs1H1ZzGYguCMU+KlLcpDl+lKWq1kEl6wZNVtkFuK+/2ymiKdPiPyut
         6lMkceny/RvKEKDu7A4fMkwwUy/w6J61+392cJ8+4Ucao7D9NbLV7vcUQIUDxfdmtUbY
         OuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678731296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tITpZ0eX4ZOgrTokiQ5GPjWZbZUZLfCZk+1VDczXlXE=;
        b=c+DpnRKiYQDrodY6R+lQEGEuZ7VRPH4PLQ9LvBnM0xxawo+06SafJaBSglei9hewyG
         mMQyJOwpzA3NEfII1J5kqO4ekdYUzhtK2QJHwQQP769d3Ro7cpZVCpwLYizRZ4Hrx7gW
         cOmuaDgy7lk4mxDIGJhHEHiGR0KCl/0suX+ODOWOlygxZSqrkIOVAK7Z/p5Npd1caCoF
         wD8qhhGsaWWrj/tRL+kiPCU/8PQb4TnvUquvK4i3qc3nAxtS0b7YYR3YWuPQ0ppv3pqb
         VchvrnE1gM9xTsA4JRh9qUP0rajxLMRwpUFqz5Ey19aD/+3i2MsFxxAgQZDfP6CsWhjA
         DDUw==
X-Gm-Message-State: AO0yUKWyQfhxRLvdt9FbMOQ972AK+UCIxde8TzyDD+7F2tKf4BCn0xXq
	B+LP+vhOU21xkwlQP/Jp1RqZigsaRW451bv+oYo=
X-Google-Smtp-Source: AK7set+YegpX4tyCE50BNyafLClucoh4U//g19vUKaomgvbVe5ohp1cchZJwz3n9B15rabLNLQ89Mu7BHF6lgYBrRUY=
X-Received: by 2002:a7b:c2b1:0:b0:3eb:5a1e:d524 with SMTP id
 c17-20020a7bc2b1000000b003eb5a1ed524mr3273713wmk.3.1678731295828; Mon, 13 Mar
 2023 11:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1678705654.git.Martin.Jansa@gmail.com> <CANNYZj_h7MMWxUpsiGre0Gn4_y_BB7qEfXNTotq-NjNYaB2OcQ@mail.gmail.com>
 <CA+chaQekyms-tvqDqAmMPqFcwHFqQFTTqYH+Vj=wmUdTR35gLQ@mail.gmail.com> <CANNYZj-7wgKRe1yNexHFM4xUTfSgA0Z79Fh4G5FURD638TsvvA@mail.gmail.com>
In-Reply-To: <CANNYZj-7wgKRe1yNexHFM4xUTfSgA0Z79Fh4G5FURD638TsvvA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Mar 2023 19:14:38 +0100
Message-ID: <CA+chaQe8G107NW64VHfKhsmKq68D_bOqjv9WiOqDqZsSH34Djg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/14] selftest improvements to respect IMAGE_LINK_NAME
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008fabf905f6cc16c8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 18:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178463

--0000000000008fabf905f6cc16c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 6:38=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Mon, 13 Mar 2023 at 18:28, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> >
> > On Mon, Mar 13, 2023 at 6:26=E2=80=AFPM Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> >>
> >> Tests in distrodata that contact upstream servers had to be disabled
> >> because it's not possible to tell what is a real failure, and what is
> >> a transient upstream issue (with expired certificates or other network
> >> issues). To ensure upstream version checks don't regress, I run them
> >> manually every now and then.
> >
> >
> > Thanks, can you confirm that git-submodule-test is currently failing fo=
r
> you (and probably was for long time) and
> > that binutils is often reporting failure?
>
> I run the check (basically 'devtool check-upgrade-status' with a
> manual review of what it prints) without meta-selftest included into
> the build,




> but I can try that if you want.
>

No need, "without meta-selftest included" explains why you haven't fixed it
already. I was reading "I run them
manually every now and then." as that you're triggering some special job on
AB manually, but with meta-selftest and
through OESelftestTestCase.test_checkpkg.

binutils is flaky, yes. The server is contaced mutliple times for
> various flavours of it, and some kind of silly rate limiting kicks in.
> If you run a standaline 'devtool check-upgrade-status binutils', it
> will work.
>

Yes, that's what I was seeing yesterday as well, but then it was failing
quite reliably in OESelftestTestCase.test_checkpkg until I've added some
debug into it.

Cheers,

--0000000000008fabf905f6cc16c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Mar 13, 2023 at 6:38=E2=80=AFPM A=
lexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_b=
lank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 13 Mar 2023 =
at 18:28, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=
=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Mar 13, 2023 at 6:26=E2=80=AFPM Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Tests in distrodata that contact upstream servers had to be disabl=
ed<br>
&gt;&gt; because it&#39;s not possible to tell what is a real failure, and =
what is<br>
&gt;&gt; a transient upstream issue (with expired certificates or other net=
work<br>
&gt;&gt; issues). To ensure upstream version checks don&#39;t regress, I ru=
n them<br>
&gt;&gt; manually every now and then.<br>
&gt;<br>
&gt;<br>
&gt; Thanks, can you confirm that git-submodule-test is currently failing f=
or you (and probably was for long time) and<br>
&gt; that binutils is often reporting failure?<br>
<br>
I run the check (basically &#39;devtool check-upgrade-status&#39; with a<br=
>
manual review of what it prints) without meta-selftest included into<br>
the build, </blockquote><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">but I can try that if you want.<br></block=
quote><div><br></div><div>No need, &quot;without meta-selftest included&quo=
t; explains why you haven&#39;t fixed it already. I was reading &quot;I run=
 them</div>manually every now and then.&quot; as that you&#39;re triggering=
 some special job on AB manually, but with meta-selftest and through=C2=A0O=
ESelftestTestCase.test_checkpkg.</div><div class=3D"gmail_quote"><br><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
binutils is flaky, yes. The server is contaced mutliple times for<br>
various flavours of it, and some kind of silly rate limiting kicks in.<br>
If you run a standaline &#39;devtool check-upgrade-status binutils&#39;, it=
<br>
will work.<br></blockquote><div><br></div><div>Yes, that&#39;s what I was s=
eeing yesterday as well, but then it was failing quite reliably in OESelfte=
stTestCase.test_checkpkg until I&#39;ve added some debug into it.</div><div=
><br></div><div>Cheers,</div></div></div>

--0000000000008fabf905f6cc16c8--

