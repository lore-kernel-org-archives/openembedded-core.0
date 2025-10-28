Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799E6CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 12:22:38 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.9994.1761654157827950681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 05:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iEred2p/;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-33bbc4e81dfso6305803a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 05:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761654157; x=1762258957; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xhTjRKHHR/Wi2Wu9svRmdNTDMHlq2w//jsKkx8Lh+s8=;
        b=iEred2p/1cwxWT1S4nHvXg+CuCkzMjXMtVGV6mVm6+bbVZSRisYqZrtDg2pWJLTRMG
         a6DRc0w3Jjwmem31T9F5wDepkY+Xi9qzPsTqbGOLFredPvIZNqU42D7qDD8aZZN7tPmt
         xHPpjNSdIBqbm6cU1JoL3qO4KTiiPUl4mHGy4Gkq2oN5w13rbOgod54r3eFb+Q0tWx/I
         IbtNztUdQWNxTki/gnvpuWriC/0nwrCIPyZ+d92BN7y5YQhv0g8dq1G2BQJLH6Lp0tHM
         W9d6h73evB9VZan4pf1i07053qLNGAxPSUi4GoXZNjH3nLXqkIVqdpr98z0lbdQUFs5w
         WIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761654157; x=1762258957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhTjRKHHR/Wi2Wu9svRmdNTDMHlq2w//jsKkx8Lh+s8=;
        b=o6FCmapcfr0AZNr7/+0qAMAuI+aMdlAZdkI6uFVR/h1tUZiAWikcabSlTA4EGyUqre
         FGiXl38hy0ptNzIDYHEO9NEMBLgvh6rN0054le5G2qw9M45tznvcKTipZq6BFlWXHYKj
         NnsH5A9t358uGg6hWnywX38MgKmTodokDKjJoICrNF3F84D2+aDN9k77ZUsHESsHQENj
         A9IZKOcexRwB5Z/1gLZNNLioIoIVfwDiOMvOSaEigxdMZMhoO/PX4NFhrsJb2b5JNNgI
         pricxblwY1FK52gaPRR5c3LWGFjiji4GGtaUbBCpl/bl+xpQSpFYYTYBwW2fOGHkqpVT
         NqMw==
X-Gm-Message-State: AOJu0Yy1X+RjS1MbjHN+ZHl+cgAuekcJ0IKqMO1aHtyXXJZVgLc54Kat
	OzfYs7huthYET0J2y1c1BtGqGXMd59db5Gq1J9hltFkfWlq5/QwdWlLJY8yKgmSRDiAuR6rZIci
	+B46A3Q6otrJWrUWFHUcBjGHhrnWjx5E=
X-Gm-Gg: ASbGncs8RwLZfYyeYvpZdpvbHkxhOZmxBVZyyxTs6dbGbJk8Dwzbf68fJY6Yn29/VOV
	khonqJ5V+N1zDlgjLMFeDew9lh2z0aDPDt0Qkl4YZZy+s+dCH0nYT73gYL9jcUXVxRbxQjEhJtZ
	eSxP1YLicAuvyMYJZQYw6H3mDMxobLhTrFvwW76/m+Ix+LsvU0skkYEN/HJZGKQXlFWxWRg3FPr
	0C4TuC6EoFJqst0BR6Ik+x8kO3ASMIX3b3QeFnSYNlBjQUgl2w1LrUsBkeqsg==
X-Google-Smtp-Source: AGHT+IFBgrZYp7WGX/9NJPJTrYimXlk10Qt7NS4qXYhSwxy7oz1JGfx39ukpHPSBFmAqV7Vq8KOgdqW5OofIhqnjx8I=
X-Received: by 2002:a17:90b:350a:b0:32e:18f2:7a59 with SMTP id
 98e67ed59e1d1-340279ede46mr4064329a91.11.1761654156800; Tue, 28 Oct 2025
 05:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251028101807.2085945-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20251028101807.2085945-1-jiaying.song.cn@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Oct 2025 08:22:24 -0400
X-Gm-Features: AWmQ_bkA1GsKKQRJxVfVY6B8JEWLuvfhNDl8aYPZTDgLRfPlaeb8rlXwoaFqwnY
Message-ID: <CADkTA4O3TiRDXssVE_ULwTH9=ZaRTg4fSLrnyibJ7HQbFvuDzg@mail.gmail.com>
Subject: Re: [PATCH v2] kernel-devsrc: fix incorrect python shebang replacement
To: jiaying.song.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003bba2a0642371276"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 12:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225398

--0000000000003bba2a0642371276
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good to me!

Bruce

On Tue, Oct 28, 2025 at 6:18=E2=80=AFAM <jiaying.song.cn@windriver.com> wro=
te:

> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Update the sed replacement rule to strictly match '/usr/bin/python'
> (with no trailing characters)
>
> The previous sed rule was too broad and could incorrectly change Python
> shebangs such as in
> /lib/modules/6.16.11-yocto-standard/build/scripts/macro_checker.py from
> '#!/usr/bin/python3' to '#!/usr/bin/env python33'.
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 04dd683dde..411c99ba30 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -400,7 +400,7 @@ do_install() {
>      for ss in $(find $kerneldir/build/scripts -type f -name '*'); do
>          sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "$ss"
>          sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "$ss"
> -        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "$ss"
> +        sed -i 's,/usr/bin/python$,/usr/bin/env python3,' "$ss"
>      done
>
>      chown -R root:root ${D}
> --
> 2.34.1
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000003bba2a0642371276
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Loo=
ks good to me!</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div=
></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Oct 28, 2025 at 6:18=E2=80=AFAM &lt;<a href=
=3D"mailto:jiaying.song.cn@windriver.com">jiaying.song.cn@windriver.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From=
: Jiaying Song &lt;<a href=3D"mailto:jiaying.song.cn@windriver.com" target=
=3D"_blank">jiaying.song.cn@windriver.com</a>&gt;<br>
<br>
Update the sed replacement rule to strictly match &#39;/usr/bin/python&#39;=
<br>
(with no trailing characters)<br>
<br>
The previous sed rule was too broad and could incorrectly change Python<br>
shebangs such as in<br>
/lib/modules/6.16.11-yocto-standard/build/scripts/macro_checker.py from<br>
&#39;#!/usr/bin/python3&#39; to &#39;#!/usr/bin/env python33&#39;.<br>
<br>
Signed-off-by: Jiaying Song &lt;<a href=3D"mailto:jiaying.song.cn@windriver=
.com" target=3D"_blank">jiaying.song.cn@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" =
rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> b/meta/recipes-ke=
rnel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D=
"_blank">kernel-devsrc.bb</a><br>
index 04dd683dde..411c99ba30 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
@@ -400,7 +400,7 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0for ss in $(find $kerneldir/build/scripts -type f -name=
 &#39;*&#39;); do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,/usr/bin/python2,/usr/bin/e=
nv python3,&#39; &quot;$ss&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,/usr/bin/env python2,/usr/b=
in/env python3,&#39; &quot;$ss&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s,/usr/bin/python,/usr/bin/env pyt=
hon3,&#39; &quot;$ss&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s,/usr/bin/python$,/usr/bin/env py=
thon3,&#39; &quot;$ss&quot;<br>
=C2=A0 =C2=A0 =C2=A0done<br>
<br>
=C2=A0 =C2=A0 =C2=A0chown -R root:root ${D}<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--0000000000003bba2a0642371276--

