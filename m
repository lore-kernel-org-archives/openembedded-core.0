Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F220BC54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 16:17:30 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.27499.1709828245001714058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 08:17:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=FwlSyPxq;
 spf=pass (domain: ossystems.com.br, ip: 209.85.128.177, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-607c5679842so11141127b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1709828244; x=1710433044; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YEFwAWTa77wFMAndmSwjx1o0en2PNVu8RxFPRdGkhjk=;
        b=FwlSyPxqP6A5iC/Ng3pLG0q/sbe8gbeqjTW4PZujv82D5uHEHLPlZ8U8WkmVMA96xg
         3YUty0+RrXtZDCvb5Pa8138saegLoc2FSh3ufR4iPhec9eNUutc1Jme7bmwvcFKvCYUz
         Qy0YPgETFiYgbanOYN4IAo7LsTTuZp3+Kz0MZkhVf+R9WynBm+WdwK4T8z74FV0tBbH0
         84SnNFT3KXD6H7I6dpjrAWpmPpQAnbZb6+0FZAP/PFiGEqzUw52BZm5HgI93clLIjyX8
         wRdBqZh29XuXJP1EwPwIRVZxlE0QtcoB5/YB4NVbIo/VY7U7Q9T+uile0XgdfWA45n4y
         EhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709828244; x=1710433044;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEFwAWTa77wFMAndmSwjx1o0en2PNVu8RxFPRdGkhjk=;
        b=omZjOeHnDZPbXvxgKtuCH8w3rDsZqT0d43CvPXUkBMg3gGG7dcfIRqq0oapU271lyT
         463G4w0/0L12kNyXO8sqpW/9znZLtvQ9VIpDxjDtpdJwdVrUSCi1ilaBlpLmdTa9KnQq
         nKCGgJnQoXWam8uQ7mWN+2HHHahtPMu+FG3SSWdFemb6zQ2BaycDy2MbR3tvGQ4VU4Rv
         YK+yF4IOe0GUQy/7+x4GeHJi6DYsT0H5FlGmy2R7uM/dwn1lDUuDEGaQSDU0OqP460G9
         ejph9n1UvVi56pEaQ40X4gJh/xYzMb+r8L6lYZFtyeZzdrX5A+JIEdXTq2QzWgNp6+U5
         TlEA==
X-Forwarded-Encrypted: i=1; AJvYcCX7q1rUFt1x3PDUlU86+H4lh+qJ0BTACb+hLhKhTli9OunZvlyDTyhCK8GIjKa0g8oiWJWoesz7OQZYxhONZmLuKcnA9sxKfhBQrThIT6UxbwCLX5zuaCua
X-Gm-Message-State: AOJu0Yzc8RQFD/Cs3iUuBRTSpVsilMJXovbO9be80rafFfOYGXsHG1Qn
	v7mu07PdfWtRnNqbdEM22biO2sXHLoR3U22GqkaKTnhvyJsonHjivEFD+TPNvEwkc283YupS2W2
	vjck=
X-Google-Smtp-Source: AGHT+IG+dCrxoWA5IT9zOD0TAV/PWfFBbNak4WOT5ksrVVf9VNVhO4y2ATgTmY8bw3KCSNStRkrNnw==
X-Received: by 2002:a81:c214:0:b0:609:37fe:fb97 with SMTP id z20-20020a81c214000000b0060937fefb97mr19568208ywc.4.1709828243496;
        Thu, 07 Mar 2024 08:17:23 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id k34-20020a81ac22000000b00604198c3cafsm3550198ywh.61.2024.03.07.08.17.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 08:17:23 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso1094393276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 08:17:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBAUXFfP/3Afov899xQRA0NkQBu+OMJjEiDr5tzqB7aXz+b0XTdGz6eXagBVX+KlgE6/2nCK/Kn1rskxnnYapqznaj5+Dbj3Sq5BQtFto+cIqAdRm/Wr6x
X-Received: by 2002:a05:6902:1204:b0:dd0:6f7:bc3b with SMTP id
 s4-20020a056902120400b00dd006f7bc3bmr15440894ybu.10.1709828242646; Thu, 07
 Mar 2024 08:17:22 -0800 (PST)
MIME-Version: 1.0
References: <20240307134316.3047342-1-tom.hochstein@nxp.com> <CANNYZj8G27VbzzQ8Ab7LK77YrEQsxR0roL8Ci2GbkgicdGiA=Q@mail.gmail.com>
In-Reply-To: <CANNYZj8G27VbzzQ8Ab7LK77YrEQsxR0roL8Ci2GbkgicdGiA=Q@mail.gmail.com>
Date: Thu, 7 Mar 2024 13:17:10 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp8fgFQTXODhPuD0PNcvi4aDOcCbSLz_fPNbR4BM=yKFQ@mail.gmail.com>
Message-ID: <CAP9ODKp8fgFQTXODhPuD0PNcvi4aDOcCbSLz_fPNbR4BM=yKFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bmaptool: Add bmap-tools runtime alias for compatibility
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Tom Hochstein <tom.hochstein@nxp.com>, openembedded-core@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: multipart/alternative; boundary="00000000000007b5440613146904"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 16:17:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196805

--00000000000007b5440613146904
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 7 de mar. de 2024 =C3=A0s 13:14, Alexander Kanavin <
alex.kanavin@gmail.com> escreveu:

> On Thu, 7 Mar 2024 at 14:43, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> > +# For compatibility with layers before scarthgap
> > +RPROVIDES:${PN} =3D "bmap-tools"
> > +RREPLACES:${PN} =3D "bmap-tools"
> > +RCONFLICTS:${PN} =3D "bmap-tools"
>
> Only RREPLACES/RCONFLICTS please. Do not add the obsolete RPROVIDES.
>

For package feed upgrade it is required.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--00000000000007b5440613146904
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qui., 7 de mar. de 2024 =C3=A0s 13=
:14, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.k=
anavin@gmail.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Thu, 7 Mar 2024 at 14:43, Tom Hochstein &lt;<a href=
=3D"mailto:tom.hochstein@nxp.com" target=3D"_blank">tom.hochstein@nxp.com</=
a>&gt; wrote:<br>
&gt; +# For compatibility with layers before scarthgap<br>
&gt; +RPROVIDES:${PN} =3D &quot;bmap-tools&quot;<br>
&gt; +RREPLACES:${PN} =3D &quot;bmap-tools&quot;<br>
&gt; +RCONFLICTS:${PN} =3D &quot;bmap-tools&quot;<br>
<br>
Only RREPLACES/RCONFLICTS please. Do not add the obsolete RPROVIDES.<br></b=
lockquote><div><br></div><div>For package feed upgrade it is required.</div=
><div>=C2=A0</div></div><span class=3D"gmail_signature_prefix">-- </span><b=
r><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=
=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a h=
ref=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystem=
s.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Mobile: +1 (347) 903-9750</div></div>

--00000000000007b5440613146904--

