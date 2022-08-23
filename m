Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44347C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 21:33:08 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.3782.1661290386634544254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 14:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=w0WTaRkq;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.180,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f180.google.com with SMTP id r6so2353309qtx.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 14:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc;
        bh=Ofju2viwaFlkP98WzgwupKL/pJqQrQmbqGsBIZpvRnE=;
        b=w0WTaRkqUU5i4aP8yd/GQNJ4wYRy/+IazB5iaC/3noz+sxOlSstHImDu7v7NffYa5/
         UShS+S3EaZn+W5lTy9gXyzlD7K9/NsQl6nhU70Q/M4IFM430F3dv7NlU/qUrEngf+dTC
         m7Hu94LZuA5a+UW0DSQDtSNXQKHGAd3UICvKV2wGQlrvL7+4LNmijo/ZqvxyLpMgM2h7
         U3j3t4MFHyrmY1HW5nXVjoVsFQQxp/n8YiSRZ31HxUxPwmX4RQBS4h12ddPln9P5qcIt
         FYxBN4xlCki+vGGzpe1/DqtT1gNgwZ0WXHfINjFCSgnhfkDucmVS4jYE21HEQF6bOfyJ
         sRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc;
        bh=Ofju2viwaFlkP98WzgwupKL/pJqQrQmbqGsBIZpvRnE=;
        b=Ca6WOyueEmurmR0g7LzmFIJaBjBSZvzMIsPytKznuTNRXDsAZNftSiyx/Ta08tNG2v
         OL+R3Ci1L9OiUtM8Vd4l456LqTWd8pd18kUFZj8tKbubcb572gc/KjkzavBL39g2MJlc
         stNCS5Rh2QI1eZ3isbn0I4sKYjbLM4SVazg2MdxbQdVvOBY82paSHSRBw8dLvYZI7E1J
         VhUUqmsI6oVRayS8V/9/0V3A5YZjNMTc9TBhYlkgkKAnzrS9KAnD+wiKVwuBc5iNOs8y
         7QhIZOK5oLlJ3SQj8TERbVB4qZKr4n1DvWiOPL9zBLCeEgoTPkCN8NKL5x13fBE4JhKd
         blQg==
X-Gm-Message-State: ACgBeo1AFy82qZWYqoaw9T86FCeq/PO5Hu8MNOiXZoaHv7gSj/HRZzeg
	HG4NhsFqikVwwlEueZI4ohH7j7ehNbdE2p3+
X-Google-Smtp-Source: 
 AA6agR7k8ivIA0HW6yCqGruT16KjSp6FNoxJIqR0NdmpQ44UGJOWMQRcO4/ITb/an7NqGA07aBstdw==
X-Received: by 2002:ac8:590f:0:b0:343:61fc:e242 with SMTP id
 15-20020ac8590f000000b0034361fce242mr21222252qty.635.1661290385034;
        Tue, 23 Aug 2022 14:33:05 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com.
 [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id
 e14-20020a05622a110e00b0034456277e3asm12147135qty.89.2022.08.23.14.33.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 14:33:04 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f49.google.com with SMTP id b2so11541745qvp.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 14:33:04 -0700 (PDT)
X-Received: by 2002:ad4:5763:0:b0:474:7d55:7305 with SMTP id
 r3-20020ad45763000000b004747d557305mr21699470qvx.74.1661290384366; Tue, 23
 Aug 2022 14:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220823110227.68348-1-peter@berginkonsult.se>
 <CAP9ODKoRj+aqcdH6uFN0xZEeMJ2y=8e931vGTFFxgQsXh=pO6Q@mail.gmail.com>
 <3a0627d1-c3c5-aad6-cd3e-a6dc6e310f07@berginkonsult.se>
In-Reply-To: <3a0627d1-c3c5-aad6-cd3e-a6dc6e310f07@berginkonsult.se>
Date: Tue, 23 Aug 2022 18:32:53 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKqtMiNRs76aVqNuRQWr7xhCP-t=AR-f+civ-+G409ak_g@mail.gmail.com>
Message-ID: 
 <CAP9ODKqtMiNRs76aVqNuRQWr7xhCP-t=AR-f+civ-+G409ak_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust-cross-canadian: rename shell variables for
 easier appends
To: Peter Bergin <peter@berginkonsult.se>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003aa47105e6ef4f71"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 21:33:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169729

--0000000000003aa47105e6ef4f71
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 23 de ago. de 2022 =C3=A0s 17:38, Peter Bergin <peter@berginkonsul=
t.se>
escreveu:

> In my particular case the rust application I'm building against the SDK i=
s
> using the crate prost-build (https://crates.io/crates/prost-build) that
> is used to generate code from .proto files. It is using the tool protoc
> from protobuf and in order to get it working the variable PROTOC needs to
> be set. Then my solution was to add that variable to
> environment-setup.d/rust.sh in the SDK as I thought that was an easy
> solution and rust.sh is in some way connected to the variable setting. Th=
en
> looking in to do_install of rust-cross-canadian I saw that the variable
> ENV_SETUP_SH is first used for rust.sh then for cargo.sh so I could not u=
se
> it to point out rust.sh. Then I had the idea that it would be better to
> have one variable for rust.sh and one for cargo.sh.
>
The protoc could have this set in environment-setup.d so it doesn't need
change in rust and avoids rebuilds.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--0000000000003aa47105e6ef4f71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em ter., 23 de ago. de 2022 =C3=A0s 1=
7:38, Peter Bergin &lt;<a href=3D"mailto:peter@berginkonsult.se">peter@berg=
inkonsult.se</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>In my particular case the rust application I&#39;m building against
      the SDK is using the crate prost-build
      (<a href=3D"https://crates.io/crates/prost-build" target=3D"_blank">h=
ttps://crates.io/crates/prost-build</a>) that is used to generate
      code from .proto files. It is using the tool protoc from protobuf
      and in order to get it working the variable PROTOC needs to be
      set. Then my solution was to add that variable to
      environment-setup.d/rust.sh in the SDK as I thought that was an
      easy solution and rust.sh is in some way connected to the variable
      setting. Then looking in to do_install of rust-cross-canadian I
      saw that the variable ENV_SETUP_SH is first used for rust.sh then
      for cargo.sh so I could not use it to point out rust.sh. Then I
      had the idea that it would be better to have one variable for
      rust.sh and one for cargo.sh.<br></p></div></blockquote><div>The prot=
oc could have this set in environment-setup.d so it doesn&#39;t need change=
 in rust and avoids rebuilds.</div></div><div><br></div>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. =
Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http:/=
/www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code=
.ossystems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mo=
bile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (34=
7) 903-9750</div></div>

--0000000000003aa47105e6ef4f71--

