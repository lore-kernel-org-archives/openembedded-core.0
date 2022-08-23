Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53464C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 11:49:41 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web08.30788.1661255378071729607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 04:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=J1FaB4Yy;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.41,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f41.google.com with SMTP id j1so10289065qvv.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 04:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc;
        bh=IC3+6Av8Tto/KO6bvqsJegoaKWL18K7y245r9lgkWoI=;
        b=J1FaB4YySr52JVhxNY2M1FtXK3ttoiPk2uMp50PKOx6NTztbpjSUZaCtyNosBh2JoP
         XErvBESJQHtpW6nYVXk+AE6q976cOSqusndyxuGw/MFuYz7XlTfIYOL6C7c3TSST3zUh
         MYm+5NI3P3ikpUpyfleTgmPrImxrz6uHRmraXbT6CHiQfhCMRAlNU8Kc+4hdrbRKgcx+
         cxnUC4SMDjN1RcZH/kqnDLgekfePFBoOq1O6kbUuqLQJeVavnjceno2ooYlEdfXJ3uto
         hc/I2CNfizcLP+ETewNixLLaJ+O2wonMy30Y1G6xMmK7lvaWNU3kNwYwEObuDTZDIfEQ
         Dshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc;
        bh=IC3+6Av8Tto/KO6bvqsJegoaKWL18K7y245r9lgkWoI=;
        b=TQtaMFuA9205yWKNm1mKIZ1TOYyzyvlcNe3NNIvlbjVOLY7x5ZYXMr4gfJXcC0SSFX
         rS6e2jraC/SSrOZIqcAL3wCvOOvyJED5Ry6Cb2NAfkhF92SuwzwDVhfXc+5Z7piY9efQ
         qdeb2XyFWUAZ3qysPgnY3l5wcCbeV+OgTS7NOFXkldI+29rXpJVbnUaNK5lw2G948cOB
         R/65EcA8gB6KniMGBPtr1cDMx/TswGAZMlwfHdE7H2aP287GxOL3NQ99xLyC8KdvZuYO
         w+55Rjz3yMIDEcVseEtATzOOqgT4Zju5BzTDo90S5OHCUo1OHL+mUAluU2UYf0s8f6h0
         W6FA==
X-Gm-Message-State: ACgBeo0RwDlUof+HsnyFMkFsNZ7QAhur83OM7Trdvs5N5tWnC1IpXUuE
	NZaevRQ9hgpPOjYkKHlAPFiz0vwycr/4Dg==
X-Google-Smtp-Source: 
 AA6agR56UQE9h9gxuTwF3h+wZopU+ljQ+fsXcEXD2bA+o3FQLa2KSxRi02QQGKKvsrb1KWC/njqv0Q==
X-Received: by 2002:a05:6214:2a48:b0:496:c068:d995 with SMTP id
 jf8-20020a0562142a4800b00496c068d995mr17740482qvb.41.1661255376595;
        Tue, 23 Aug 2022 04:49:36 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id
 l8-20020a05620a28c800b006b928ba8989sm13004032qkp.23.2022.08.23.04.49.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 04:49:36 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f182.google.com with SMTP id h22so10115459qtu.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 04:49:36 -0700 (PDT)
X-Received: by 2002:a05:622a:608:b0:344:a856:c24 with SMTP id
 z8-20020a05622a060800b00344a8560c24mr13549207qta.678.1661255375849; Tue, 23
 Aug 2022 04:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220823085636.30868-1-peter@berginkonsult.se>
In-Reply-To: <20220823085636.30868-1-peter@berginkonsult.se>
Date: Tue, 23 Aug 2022 08:49:24 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKqkFOETEPD4At-O8Ss3cx9pO4Sz8F8qc946jWsoisJsVg@mail.gmail.com>
Message-ID: 
 <CAP9ODKqkFOETEPD4At-O8Ss3cx9pO4Sz8F8qc946jWsoisJsVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] packagegroup-rust-cross-canadian: add
 native compiler environment
To: Peter Bergin <peter@berginkonsult.se>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008f11f705e6e728c3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 11:49:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169704

--0000000000008f11f705e6e728c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 23 de ago. de 2022 =C3=A0s 05:57, Peter Bergin <peter@berginkonsul=
t.se>
escreveu:

> When building rust crates it is quite common to have a build script [1]
> that is compiled for the host machine and then used during build for
> target.
> Currently when adding packagegroup-rust-cross-canadian this does not work
> without having the native compiler and linker added to the SDK.
> Add those packages to the packagegroup to make it easier to handle.
>
> The reason for having glibc-dev and libgcc-dev is to have version match
> with the used tools. Otherwise it will work on hosts that have compatible
> gcc and glibc versions but not on all.
>

This should be in a comment inside the packagegroup.


> [1] https://doc.rust-lang.org/cargo/reference/build-scripts.html
>
> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--0000000000008f11f705e6e728c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em ter., 23 de ago. de 2022 =C3=A0s 0=
5:57, Peter Bergin &lt;<a href=3D"mailto:peter@berginkonsult.se">peter@berg=
inkonsult.se</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">When building rust crates it is quite common to have a build=
 script [1]<br>
that is compiled for the host machine and then used during build for target=
.<br>
Currently when adding packagegroup-rust-cross-canadian this does not work<b=
r>
without having the native compiler and linker added to the SDK.<br>
Add those packages to the packagegroup to make it easier to handle.<br>
<br>
The reason for having glibc-dev and libgcc-dev is to have version match<br>
with the used tools. Otherwise it will work on hosts that have compatible<b=
r>
gcc and glibc versions but not on all.<br></blockquote><div><br></div><div>=
This should be in a comment inside the packagegroup.</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">[1] <a href=3D"https://do=
c.rust-lang.org/cargo/reference/build-scripts.html" rel=3D"noreferrer" targ=
et=3D"_blank">https://doc.rust-lang.org/cargo/reference/build-scripts.html<=
/a><br>
<br>
Signed-off-by: Peter Bergin &lt;<a href=3D"mailto:peter@berginkonsult.se" t=
arget=3D"_blank">peter@berginkonsult.se</a>&gt;<br></blockquote></div><div>=
<br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=3D"_blank">http:/=
/code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--0000000000008f11f705e6e728c3--

