Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4C5C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 20:56:14 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.1756.1646427373043857824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 12:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=Wjy/XO+K;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.176,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f176.google.com with SMTP id bm39so7466454qkb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 12:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=S4nXsNCZkeML8KgeL+lPx96ibqXvEAxZfu2NLo7zTK8=;
        b=Wjy/XO+KnrPhjWHMVspL0D1J+iJZFAWNr95JiAc9xsCzedDqRw/GZ/7dVB7ZyA4/ov
         w0avp8DA+skgq01Wjz1M/rp0/vLUjeg/QPF9cfAzPklxkvg/rs+pznr4Nt0I1lSRKDzW
         OiVpAdvdKWEWOnOMGRZRlzT8WpMnZLgVVx3P942laiLnEvXhurtGaZ+1WUuQ8pmfTdCR
         mUp6jsnfN0dqrHE+83xUAdZcg0SlYxiBknFc5vz5u37CQUmc8Y49eV4M6fyviGnvGOJd
         EcklPAiqB6lTU1nxWH4Ol7fp6Re5Z8+1VH0Jy+cyP/Yz0elIrObUymraBZtod8Z2+8U1
         MUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=S4nXsNCZkeML8KgeL+lPx96ibqXvEAxZfu2NLo7zTK8=;
        b=78+VANtgXQPC+bzPWIaWDC0+8lW56ujR0d2ZKZgybAUuQv0PnetfoKm3NZ3dBAcxGR
         iUnUwuT4qZdnAwxKNW/jcP92tsiMpF9f/E7pqOiy/gc0AeMAX4Qg/C6EhqK6upHundvF
         D83OjCDMJepMkE25oNnq6l4BPW8QnVikhssP7V0IblZXYhqqSWt+3ZdvThFCcUwZcUuP
         X4k6flOW2V+FQyeZOesvTKTPS8518DiGmGZkFKNpyCNvn1EjzkegUPJ89jdJUmKe5YCA
         tdD2Le5/Mr+yib3aNWsHJ/r8mNcPvocTyCkSG3nuq+a/3jTH5jjsLnxx8kzVwBCaJNxH
         LSig==
X-Gm-Message-State: AOAM532CjPtDCi6gQjoaszm5n+kP5y+4aevQGoYOTLhhY+fbA+2Pk+Ks
	hGeATe2V+0gfeqnyIGCOnm9mAeGVpRbYa+u6
X-Google-Smtp-Source: 
 ABdhPJz8k1cgONsmnmqXoSwKeWSNPKz+Q5QmQYuRI6RLLkObXtr6FVSc9O90wdCh1eNN/EAmhzexZQ==
X-Received: by 2002:a37:ab11:0:b0:62c:e6ca:462b with SMTP id
 u17-20020a37ab11000000b0062ce6ca462bmr345273qke.156.1646427371985;
        Fri, 04 Mar 2022 12:56:11 -0800 (PST)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com.
 [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id
 u12-20020ae9c00c000000b0047c98aa41casm2828654qkk.94.2022.03.04.12.56.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 12:56:11 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f169.google.com with SMTP id q4so7399470qki.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 12:56:11 -0800 (PST)
X-Received: by 2002:ae9:f311:0:b0:662:d08b:9f97 with SMTP id
 p17-20020ae9f311000000b00662d08b9f97mr303461qkg.705.1646427371424; Fri, 04
 Mar 2022 12:56:11 -0800 (PST)
MIME-Version: 1.0
References: 
 <0101017f50e03108-050c414c-790b-4c05-8b8d-daf41cff5a1b-000000@us-west-2.amazonses.com>
 <ee42785d-ef25-fcc8-1b2d-c1dffbc0cb6e@windriver.com>
 <CANNYZj9YmuQoMUgskuxqOqk=QRBpMWAGxj7soQtZvJ-uwtA1EQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9YmuQoMUgskuxqOqk=QRBpMWAGxj7soQtZvJ-uwtA1EQ@mail.gmail.com>
Date: Fri, 4 Mar 2022 17:56:00 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKoxHMbmLnS38f+9TO0edcwmpPJ+MFDmtgskZG3iAJiWtg@mail.gmail.com>
Message-ID: 
 <CAP9ODKoxHMbmLnS38f+9TO0edcwmpPJ+MFDmtgskZG3iAJiWtg@mail.gmail.com>
Subject: Re: [OE-core] [AUH] rust-llvm: upgrading to 1.59.0 FAILED
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>,
 Pgowda <pgowda.cve@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009f502005d96abed1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 20:56:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162757

--0000000000009f502005d96abed1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 4 de mar. de 2022 =C3=A0s 15:04, Alexander Kanavin <
alex.kanavin@gmail.com> escreveu:

> Rust is a low-risk item from feature freeze perspective, so I already
> queued a patch. If a-full is ok with it, there's no reason not to
> merge it in my opinion.
>

I agree; it makes sense to upgrade it (even during the LTS lifetime)
especially because Rust compiler isn't long term maintained so we should
consider it.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--0000000000009f502005d96abed1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em sex., 4 de mar. de 2022 =C3=A0s 15=
:04, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.k=
anavin@gmail.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Rust is a low-risk item from feature freeze perspective,=
 so I already<br>
queued a patch. If a-full is ok with it, there&#39;s no reason not to<br>
merge it in my opinion.<br></blockquote><div><br></div><div>I agree; it mak=
es sense to upgrade it (even during the LTS lifetime) especially because Ru=
st compiler isn&#39;t long term maintained so we should consider it.=C2=A0=
=C2=A0</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_sig=
nature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D=
"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br=
</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" ta=
rget=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981=
-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></di=
v>

--0000000000009f502005d96abed1--

