Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89B0C28B25
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 23:37:49 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.778.1741390666373299923
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 15:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XvWBpF2K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39104c1cbbdso1210407f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 15:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741390664; x=1741995464; darn=lists.openembedded.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hPYY3X8Xjhd9dMrMpDmeIeI8O+YF0qF6H99ZnH5lXlQ=;
        b=XvWBpF2K7lgxG2G3dvakYzyDFsw6pYJSmrpdymEzoox1ly2yT1pI0Pp1AcY2eI7i3v
         +LU3RAY8UWY+bSv5xX9Bx0M7EpnUSYueFukkjmpOe5Y8YXzkyKvpegcGetqT2Ik/aQ5e
         IquGrAEo7DlB6G5ks/ifcdlmW8ycpcG1O++D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741390664; x=1741995464;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPYY3X8Xjhd9dMrMpDmeIeI8O+YF0qF6H99ZnH5lXlQ=;
        b=CuX7aMoVi1ICj7BH/5tIm13xnJWrN+Tvh511P/mLmP9DHMrHH6UUa38OeQCKzC4mDk
         Kn4ykgPu75JRvjFuOclWs7hIJxKVVZLximVkuxosJ4jv3+xPGfroZFb6XoADcYj45WTX
         qGOxAFEjxx11RVwlc9VDJjDGqmECo4kuPIzZkuC6tCxSjuDlTE3ndVq6baJfzJE9JP/A
         oXDk0ZpXm4PgEYEy9fD71FDgm5bzIDNsS/vj4aCwfJjqp2GAqs56hpCEidX3kmiw1+nG
         yx6/4O864othLuQ8EQeeqyHOJp0UlaR2GTg57xDCJCwXRmDuzoAMbs86Cd/JSUnipayJ
         NULg==
X-Forwarded-Encrypted: i=1; AJvYcCWkGbYG/U7lwaIjAzJakARgl5JlVxr8XFJwefNZ24Jt0YPEycko1uQ//4ubkUEWYKmYpaqQ2XZPw05SBzbVYU0++Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwUwM9Rjqt7No6MWwiQ+PeaAjrrUG1+YoCayAhQaD0PAVK0iWir
	9WmB5Pgii6h6tTrgcRYHBSa4EA45hm2wAbKORIT5b4Yd6El6dVvn63J9/rm/dUs=
X-Gm-Gg: ASbGncsjA+62610W48x7qz/2x4GhMbXulD6OwASql3Zpm0p6imX15cfMt3LqvIpLNPp
	qiE4PMYwehZCv1src+isqIt7cBO56YJF9zct7R4uI8GNvHHa2ZE3qdWP8QPUVqC65CA/VTXIyzZ
	P7ZC2cAODNL7B9n8OfMByBVT/1Kgq0K14t5I/umGYS85DTfWkZ9+fpZw9FjHOiF+MRN1nuYfmU6
	uuiNdy3t65FQLnMEl9R5+o01GcPhvzgKKqMC9wkNvBs+XbkCDdiKTW9Nf19L2Lphl7fTVOOeiw4
	3XIuExmSnzDY+P+Z8LaeYb69VFQdcDFWh1XaM1VN00jHie0+TgT5icxtGQxM2eWEbQr638cCDkQ
	RqIXXx+s9OlW5WD27D8JRvmuNVuHRBWQ=
X-Google-Smtp-Source: AGHT+IGmkceGqEmQfh66BDvZbOOr12rNIKtIwC5WQUWLdJ7+JPjmT88XFZuRKwkH5JAOaw0+pAEmPA==
X-Received: by 2002:a5d:64c2:0:b0:391:3c12:d0af with SMTP id ffacd0b85a97d-3913c12d254mr206806f8f.41.1741390664536;
        Fri, 07 Mar 2025 15:37:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e207:c497:9edd:1dc? ([2001:8b0:aba:5f3c:e207:c497:9edd:1dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c1031e3sm6711817f8f.82.2025.03.07.15.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 15:37:42 -0800 (PST)
Message-ID: <5d748ede629df75d0ed30df5418b42b936d5416b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V4 2/3] rust: Upgrade 1.82.0->1.83.0 --> bloat
 alert !!
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, 
	deepesh.varatharajan@windriver.com
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com, 
 Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 07 Mar 2025 23:37:41 +0000
In-Reply-To: <c411d58d-bd27-4107-9b98-e39de14204df@windriver.com>
References: <20250305134459.2275598-1-Deepesh.Varatharajan@windriver.com>
	 <20250305134459.2275598-2-Deepesh.Varatharajan@windriver.com>
	 <c411d58d-bd27-4107-9b98-e39de14204df@windriver.com>
Content-Type: multipart/alternative; boundary="=-HOL+k3nseYwGC/hi271V"
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 23:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212472

--=-HOL+k3nseYwGC/hi271V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-03-07 at 16:02 -0500, Randy MacLeod wrote:
> =20
> =E2=9D=AF for i in `ls -d *src`; do du -sh $i; done
> 3.5G=C2=A0=C2=A0=C2=A0 rustc-1.82.0-src
> 4.8G=C2=A0=C2=A0=C2=A0 rustc-1.83.0-src
> 4.9G=C2=A0=C2=A0=C2=A0 rustc-1.84.0-src
> 3.9G=C2=A0=C2=A0=C2=A0 rustc-1.85.0-src
> =20
> I didn't check for the other 4 GB yet...
> =20
>=20
> =20
rust, rust-native, nativesdk-rust, cargo and so on.

> Should we do that an host the tarball=C2=A0 on yoctoproject.org?
> Should we write a custom unpack rule to --exclude=3Drustc-1.83.0-
> src/src/gcc ?
Or just delete the directory in a do_unpack postfunc?

Or wait for 1.85?

This is annoying "bloat" which we at least need to identify and work
out a plan for.
>=20
>=20
> Next week, I'll also dig into the 'tmp' usage increase to understand
> where the 5 GB that Richard reported comes from.
See above, I'm guessing so it needs to be confirmed but...

Cheers,

Richard

> =20


--=-HOL+k3nseYwGC/hi271V
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>

  <style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head>
  <body><div>On Fri, 2025-03-07 at 16:02 -0500, Randy MacLeod wrote:</div><=
blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fc=
f solid;padding-left:1ex"><div> </div><div class=3D"moz-cite-prefix">=E2=9D=
=AF for i in `ls -d *src`; do du -sh $i; done</div><p> 3.5G&nbsp;&nbsp;&nbs=
p; rustc-1.82.0-src<br> 4.8G&nbsp;&nbsp;&nbsp; rustc-1.83.0-src<br> 4.9G&nb=
sp;&nbsp;&nbsp; rustc-1.84.0-src<br> 3.9G&nbsp;&nbsp;&nbsp; rustc-1.85.0-sr=
c<br> </p><div> </div><p>I didn't check for the other 4 GB yet...</p><div> =
</div><p><br> </p></blockquote><div>rust, rust-native, nativesdk-rust, carg=
o and so on.</div><div><br></div><blockquote type=3D"cite" style=3D"margin:=
0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><p>Should we do=
 that an host the tarball&nbsp; on yoctoproject.org?</p><p> Should we write=
 a custom unpack rule to --exclude=3Drustc-1.83.0-src/src/gcc ?<br> </p></b=
lockquote><div>Or just delete the directory in a do_unpack postfunc?</div><=
div><br></div><div>Or wait for 1.85?</div><div><br></div><div>This is annoy=
ing "bloat" which we at least need to identify and work out a plan for.</di=
v><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #72=
9fcf solid;padding-left:1ex"><p><br> <br> Next week, I'll also dig into the=
 'tmp' usage increase to understand where the 5 GB that Richard reported co=
mes from.<br> </p></blockquote><div>See above, I'm guessing so it needs to =
be confirmed but...</div><div><br></div><div>Cheers,</div><div><br></div><d=
iv>Richard</div><div><br></div><blockquote type=3D"cite" style=3D"margin:0 =
0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div> </div></blo=
ckquote><div><br></div><div><span></span></div></body></html>

--=-HOL+k3nseYwGC/hi271V--

