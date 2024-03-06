Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C56C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 13:08:39 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.11314.1709730514213943573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 05:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=ke6TO8h9;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.182, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso699116276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 05:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1709730513; x=1710335313; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=27yOLaw5vnI2gjRsc+wW6NIA7muPTRrcwn7vvOLdSkQ=;
        b=ke6TO8h919xTt3Rqn/TKObBkvkPEQ6Chg6gjvFcGdd19jsa5WXyZ/9on2jW+dwwGK2
         +0lUy18q272pM+EvKIJ86VYUAflfbWFGIyIXzstL3vufqaC6c6yfnrDkAojxg3Jy251+
         JapZBfsndfVhcjgY1gQ6XS9exnleUZXebA3AmPNuROFfEDphuTSCc8T8QYvXesPGQoGc
         maUv9yAHk5cAR0JYmTF8uk5hoMGJew5KrNh1qzobwLYxFDbZ4hcY/J/zNvQy2Br4shs5
         NJcQ3xN09Wr/tUq6RBQx3v6nCpq8yJgggtf8Kio0AZJNf6CSKh8/gpQfWAJdqeMXiQKq
         4cqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709730513; x=1710335313;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27yOLaw5vnI2gjRsc+wW6NIA7muPTRrcwn7vvOLdSkQ=;
        b=OoHQvxUSAHc5/cIS1YOQ1fYp//9xzbyIY2JQIGH8gX/ujNCgDS3oUWwWkVZDOWGIU5
         1KNa+qAr8zEiduoWNz5F8Lw+pB6h4rDkNVFTqj8wXKAbJ9mESw1YtkL1oZP5vH0dwNYJ
         NIyKmocWgKd8dT5vyLYcQoFQ7NpTLeTqTJktcG0DP1ToWSvTL7XkoEt+GSz2eQ/sCnB6
         16N2NhsjvEcEwKEEgT7x5eCo3jtxid90YVT1RAdyhNCKty1kQft8uXho8Ff30GtqE3Lm
         9/eDdhaMaMNUMIQNuT4ukbogYy2wceUdyRNfrowHgcWAiggyHbGnVFbYdKLCQAFFcQw+
         RGWA==
X-Forwarded-Encrypted: i=1; AJvYcCWaezCfTSSrnmkHqKLQAFCpnJndqhTvps2YDdoQ7T0O28GrksiyoiIruu+UV4+1CzCg6jZtBxmbqU796/HPGjZEhbVrwdcDdqCEV4gZTUDRZXdXzgOpB8p+
X-Gm-Message-State: AOJu0YyxLgRajrroSxxYBLTL6MjN41WMb4xac3TnGpUOmUC0xx3gBhqA
	9MUFn5IAG00PvF89FjRS4ZfK5n3TSUYKud6hc9egDUxoNzSwCDdU8amp4PkUaDPQfibqkR7cBQz
	fNQW45g==
X-Google-Smtp-Source: AGHT+IGzf+T6fxROLtvInRJZLzb/NRZlzzWQAseM3sgLjI8WL7zwRz0ogSqSCBTmPIaNG8oGGi0fQg==
X-Received: by 2002:a25:ac49:0:b0:dcc:623e:1b5d with SMTP id r9-20020a25ac49000000b00dcc623e1b5dmr688ybd.31.1709730512679;
        Wed, 06 Mar 2024 05:08:32 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id b25-20020a25ae99000000b00dcdbe11c243sm3168073ybj.1.2024.03.06.05.08.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 05:08:32 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso699094276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 05:08:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeHfZrcwSnUQQdEZHq8bC1h8JnjHUBo1MRQ04Ny470JWnTY7WnZIo/qvGg2TlQtEShEK9HTWvQRNRazRlaNYl3gcZuIo29MNQRNi5S9f3MhEUWeDvcffjF
X-Received: by 2002:a25:a107:0:b0:dc6:ab85:ba89 with SMTP id
 z7-20020a25a107000000b00dc6ab85ba89mr4937ybh.25.1709730511562; Wed, 06 Mar
 2024 05:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20240305203608.3039688-1-tom.hochstein@nxp.com>
 <3b991e85a5ee7b24c728c3bf59906dc44c756385.camel@linuxfoundation.org>
 <CAP9ODKrUcNXcEQFAzPy77jS7uYPJ0Lx56pQzfVzTMescPnsYvw@mail.gmail.com>
 <0331b56aadffd139fca065008a38e7784a3e06df.camel@linuxfoundation.org>
 <CAP9ODKp1sK65kaejiHMm5TS4=e0bbCC2Da9HrBoN=c88wF6dbQ@mail.gmail.com> <ba338ad83d02efbaeac55e4f80d9560cab92a54d.camel@linuxfoundation.org>
In-Reply-To: <ba338ad83d02efbaeac55e4f80d9560cab92a54d.camel@linuxfoundation.org>
Date: Wed, 6 Mar 2024 10:08:19 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq7ONvW6Axw74zU65TqKT6v9QnqvV_BOB=rY4yRDh3SUg@mail.gmail.com>
Message-ID: <CAP9ODKq7ONvW6Axw74zU65TqKT6v9QnqvV_BOB=rY4yRDh3SUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bmaptool: Add bmap-tools alias for compatibility
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tom Hochstein <tom.hochstein@nxp.com>, openembedded-core@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: multipart/alternative; boundary="000000000000cdbc9d0612fda7ac"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 13:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196676

--000000000000cdbc9d0612fda7ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 6 de mar. de 2024 =C3=A0s 09:55, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> Put another way, if I were to merge the PROVIDES, when would it ever be
> acceptable to remove it?
>

I'd do it in next release; so it keeps a time for upgrade.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000cdbc9d0612fda7ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qua., 6 de mar. de 2024 =C3=A0s 09=
:55, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g">richard.purdie@linuxfoundation.org</a>&gt; escreveu:</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
Put another way, if I were to merge the PROVIDES, when would it ever be<br>
acceptable to remove it?<br></blockquote><div><br></div><div>I&#39;d do it =
in next release; so it keeps a time for upgrade.=C2=A0</div></div><br clear=
=3D"all"><div><br></div><span class=3D"gmail_signature_prefix">-- </span><b=
r><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=
=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a h=
ref=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystem=
s.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Mobile: +1 (347) 903-9750</div></div>

--000000000000cdbc9d0612fda7ac--

