Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F9DC4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 14:29:15 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.12849.1707834544738100210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 06:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DdLPJJJS;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5119cfaeb9bso639491e87.1;
        Tue, 13 Feb 2024 06:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707834543; x=1708439343; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TZxM+l1J9aW3KXgJ0p6VZHF5qd0JjDrRQ40KdYUyUkw=;
        b=DdLPJJJSj5Ub3VCNIUVzQfOLedRnC2w/YzNbpWfhaDDvr/+jl1SIpMjauYYRKmYqvH
         /dSo2kMohl5holExZouOssJf5rkz8172XF+yAukL/rTyf7C3YUziMK5YkFmdsus28wZC
         74jTXghPS+XLON4GWVDouSFIMShKfhMhqWQbnONTPHp8S80ZalWeoygQfmlrAYMN9rH+
         Avolre74CnUd9MHB/Gl6TfuSz+mxihxnu/A8ARQrcAWCV/YRzMK23ybA4zy2+juOkMnT
         lWlBgOMRJX9d50xN20C1T6x2xiC65hTn/56tF8bu4KYGC586nlQ4GXbeADsxNdDdSe6O
         0z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834543; x=1708439343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZxM+l1J9aW3KXgJ0p6VZHF5qd0JjDrRQ40KdYUyUkw=;
        b=UhmCrT0B7ZIENFuO+25tju/FgRvwQAPVLDghVOjBRlziLK4b5H7yUs+o4z/UVVtUbp
         W9dKLlGwVIaiNowFzy/7ZHciRoveEkoN7MA0n8VLuarbshYZbWdYKcF8Ig6A1A5iwQQJ
         ReUJ0rAtdQzbSrN2jmj+3z7L9+8QQ8BSJrT4Ik5coposXU/u/VfDPZ14AONUmZfVfzKi
         8gG2lOs1bnyhVM5E46BOB6GXHWQ3eWSmvdbyrgTmQoN1pgSloXPU/09+zKH0M9tsLX30
         VK1c1JquaOhiPIykw3HXsD3bq/foZgXYob8af/UZwqE1piZ/+KsearZCONJj2YV0MNUW
         9A/A==
X-Forwarded-Encrypted: i=1; AJvYcCVvpHHwiCjwTLGQanwqFsWmkelIKJDaZpfpbPd+xewsBPXdxlTbjjdg3mivWvQMUSm1F/lRrhOLfPNKi2W8VNr++6dSNN33KYqktrvQPyGaNXEYI7VT1lpew9tEeZPqIVmf6YoVz02tfVufM+kA8NAn8mPyCoFZglBKlv9FU0Vdv6RRGR5bLxK4stM=
X-Gm-Message-State: AOJu0YyC/xzMRiyuf2/59fdmnsex1lTzwEoFbjDqyjnzBfa9a7sUHFgb
	0FGE4sCedRRyVIfCyJC7xC1oPVuZIeiJUdhbuX2BbJO2BteMe6Ty4Qh3I04qXf5gMCm53PCloti
	PAc9hTjIxvBvnOny4rZgXkccNGNg=
X-Google-Smtp-Source: AGHT+IHw6XJQAbN8hwPNO+L47gbyiYLSWRKRiGQ8pfNNSQsaJGRnyFsX8KppenI38RTnVWWnV1HUF+PbkUOk85aBsCY=
X-Received: by 2002:ac2:464f:0:b0:511:81da:87d with SMTP id
 s15-20020ac2464f000000b0051181da087dmr6362236lfo.39.1707834542655; Tue, 13
 Feb 2024 06:29:02 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <17ACA59E7A7FD97B.16230@lists.openembedded.org> <CANNYZj9X5qRSup7i9S=rtRpwo5nCNHp8VJOZAuvu5JzqhLYD_g@mail.gmail.com>
 <f1c9d0f8cbf8ea1972aafac0c29690ca400178d7.camel@linuxfoundation.org>
 <CANNYZj8tyOy=z3L=uM9L_R8uP6eZSUkYXm9BwvsU+ERpE9QcZw@mail.gmail.com>
 <018185898b86e2fccabf68570a6aec6039a0c6d6.camel@linuxfoundation.org>
 <CANNYZj_UMqZe+hDs2RzOPaLZzRmyg=8X74+HCwytN5616jZgNg@mail.gmail.com>
 <e26e53be93a4f34b75e3e66becbaa4c6ac15133d.camel@linuxfoundation.org> <CANNYZj_GFnmvmYRNGBFkivTNY7Xi-Ok3GoDEJ7+wO3A=fW3JQg@mail.gmail.com>
In-Reply-To: <CANNYZj_GFnmvmYRNGBFkivTNY7Xi-Ok3GoDEJ7+wO3A=fW3JQg@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 13 Feb 2024 07:28:51 -0700
Message-ID: <CAJdd5Ga9nd+smcy2426QKTEF1nOPQhqOLpXrFmb0w9bb4Cov4g@mail.gmail.com>
Subject: Re: [OE-core] Core workflow: sstate for all, bblock/bbunlock, tools
 for why is sstate not being reused?
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000400b670611443760"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 14:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195405

--000000000000400b670611443760
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024, 7:05=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmail=
.com>
wrote:

> On Tue, 13 Feb 2024 at 14:44, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > In theory you can start a local hash server and then report all the
> > hashes to it?
>
> Yes, but I'd like to replicate what bitbake does: check configuration,
> start the local server if needed, and only then do the mass-import
> from the file.
>

Sorry for chiming in so late; I think you are on the right track though.
Exporting/importing bb_unihashes.dat is the think to do instead t of the
entire database (which you may not even have if it's remote). That should
at least let you reuse any sstate file that is in that file. Importing the
data as the new cache is (probably) fine and the easy first step, but be
aware it means you probably won't be able to find equivalent hashes that
are derived from the imported data, so you'll be looking at more rebuilding
than you might expect if you change something. Reporting the hashes to the
server might be an option also, but I don't know if the cache file has all
the information to do that correctly... Have to look



> Alex
>

--000000000000400b670611443760
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Feb 13, 2024, 7:05=E2=80=AFAM Alexander Kanavi=
n &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 13 Feb 2024 at 1=
4:44, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
 rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; In theory you can start a local hash server and then report all the<br=
>
&gt; hashes to it?<br>
<br>
Yes, but I&#39;d like to replicate what bitbake does: check configuration,<=
br>
start the local server if needed, and only then do the mass-import<br>
from the file.<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Sorry for chiming in so late; I think you are on the right tr=
ack though. Exporting/importing bb_unihashes.dat is the think to do instead=
 t of the entire database (which you may not even have if it&#39;s remote).=
 That should at least let you reuse any sstate file that is in that file. I=
mporting the data as the new cache is (probably) fine and the easy first st=
ep, but be aware it means you probably won&#39;t be able to find equivalent=
 hashes that are derived from the imported data, so you&#39;ll be looking a=
t more rebuilding than you might expect if you change something. Reporting =
the hashes to the server might be an option also, but I don&#39;t know if t=
he cache file has all the information to do that correctly... Have to look<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Alex<br>
</blockquote></div></div></div>

--000000000000400b670611443760--

