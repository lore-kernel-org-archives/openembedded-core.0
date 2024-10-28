Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB53D13570
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 08:09:39 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.46477.1730102974373051040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 01:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hs4zntOy;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: liu.ming50@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2b549799eso2947137a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 01:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730102973; x=1730707773; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TAwbbvhsLxzzv/DjyGVmGa17bk3Lxai4PKL4kco52/M=;
        b=hs4zntOyCMUwf+OkO0ZT9wHIex4SWoJBdNceNWp2jYM8WFlZn/etlFpy0+8yWzPjb5
         l8qF56aU6Li9TsiCCr68haYCPw58LGhqOe1TvJ1MKMrgg8pXSeKTKbL+viYo+HnEMTS4
         DOqevhBRS3XHTyFIvSBHhtAj85phwy92Y/g1JHRpw73WHQvWrlVcLPFMuNopuFDxqyjK
         y2zgjFdJpxfe/DMG3nHaV3yutLP11k3/JUT4Uf2RtE1lhXaN/Zu/5NaHmkyXspvDXBkF
         wGyBJWVURolepE68gAIhdNgFazeISbMO7PStl0Mxl5gBESBApKsT8rh//96MbPda8Fix
         6BAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730102973; x=1730707773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TAwbbvhsLxzzv/DjyGVmGa17bk3Lxai4PKL4kco52/M=;
        b=NLuzd16epIVsUf6ONvzSiojmUk1TLUcgaPzbU5ksLW/HToMt4oVZaoCdklmsmJmjos
         rGagfkjhxtwOCgYFYTdJzES1Bm5zmxbDt6cyQs4WbQSevxaxE4jDIrHEMc9o96QSf4RN
         5swZ/2SthZKxl2FN7qNfebj3Tempi8FIVuAEdXcWBCzy3z9ETPIIfxdS9Owh+AHeOqe4
         APD6FzGyfpvhCUaroM4sI4cMUgi9TDMnHcpN5NB+ynCHZI2+gsMMK8euA9GBXHg2ZByI
         kdnnVAZ5YBykQ7y7O6rPU2MYjBmAsDLOTaHgr4Yf2KbEUj4MQn9q1qr4WUQW5RcauYqc
         CkHg==
X-Gm-Message-State: AOJu0YyGqYxZktkNFVPxHoqQwSBgdGLy+veaC9/TjEH5LegKkA6sT8r2
	/rG2qj6OyQ0o1Z2JhmBr0ParTmov8hhdep2R3FFyBZo+s4UaeccdcytChsDlrmEPpKGx8JUzem3
	ZYJJATPmPBWHlPru1nN8dwsmHELOU31lw
X-Google-Smtp-Source: AGHT+IEdmDIeny97WAGbO4XZnifNAkgErprimm4QL7a4wIk1L4hypj3dFzoSUowv+MeWCyIq5GEVr/g6JsS1zopo4jM=
X-Received: by 2002:a17:90a:6b0f:b0:2e2:de27:db08 with SMTP id
 98e67ed59e1d1-2e8f1082165mr9366734a91.23.1730102973323; Mon, 28 Oct 2024
 01:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241023111541.3437331-1-liu.ming50@gmail.com>
In-Reply-To: <20241023111541.3437331-1-liu.ming50@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Mon, 28 Oct 2024 09:09:21 +0100
Message-ID: <CALatG=5hxMtchf5wXdJZ3aBmkGouaHk3WstD=NgnCtbLaPN8JQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] [PATCH] nativesdk-intercept: Fix bad
 intercept chgrp/chown logic
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000266272062584fd4a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 08:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206424

--000000000000266272062584fd4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, maintainers:

Would you please cherry pick this to kirkstone, otherwise the SDK build on
kirkstone is broken.

//Ming Liu

Ming Liu <liu.ming50@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=8823=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=881:15=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibre.com>
>
> Running either of these ends up corrupting the os.execv args.
>
> If we run:
> ./scripts/nativesdk-intercept/chown -R foo:foo bar
>
> The loop here ends up missing the conversion of foo:foo to root:root
> because
> it sees sys.argv[0] and assumes that it's the user:group argument and tha=
t
> we
> should convert that. We end up a os.execv(path, args) that have the
> following
> args:
>
> ['root:root', '-R', 'foo:foo', 'bar']
>
> As os.execv ignores args[0], we can just populate it with sys.argv[0] and
> then
> loop through sys.argv[1:]. As both chgrp and chown would have either flag=
s
> and
> USER[:GROUP] next, this fixes the issue.
>
> (Backported from OE-Core rev: 2a75f647ec7696d353f4b09099d777ba53f34d36)
>
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibr=
e.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  scripts/nativesdk-intercept/chgrp | 5 ++++-
>  scripts/nativesdk-intercept/chown | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/nativesdk-intercept/chgrp
> b/scripts/nativesdk-intercept/chgrp
> index 30cc417d3a..f8ae84b8b3 100755
> --- a/scripts/nativesdk-intercept/chgrp
> +++ b/scripts/nativesdk-intercept/chgrp
> @@ -14,7 +14,10 @@ real_chgrp =3D shutil.which('chgrp', path=3Dpath)
>  args =3D list()
>
>  found =3D False
> -for i in sys.argv:
> +
> +args.append(real_chgrp)
> +
> +for i in sys.argv[1:]:
>      if i.startswith("-"):
>          args.append(i)
>          continue
> diff --git a/scripts/nativesdk-intercept/chown
> b/scripts/nativesdk-intercept/chown
> index 3914b3e384..0805ceb70a 100755
> --- a/scripts/nativesdk-intercept/chown
> +++ b/scripts/nativesdk-intercept/chown
> @@ -14,7 +14,10 @@ real_chown =3D shutil.which('chown', path=3Dpath)
>  args =3D list()
>
>  found =3D False
> -for i in sys.argv:
> +
> +args.append(real_chown)
> +
> +for i in sys.argv[1:]:
>      if i.startswith("-"):
>          args.append(i)
>          continue
> --
> 2.43.0
>
>

--000000000000266272062584fd4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, maintainers:<div><br></div><div>Would you please cherr=
y pick this to kirkstone, otherwise the SDK build on kirkstone is broken.</=
div><div><br></div><div>//Ming Liu</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">Ming Liu &lt;<a href=3D"mailto:liu.=
ming50@gmail.com">liu.ming50@gmail.com</a>&gt; =E6=96=BC 2024=E5=B9=B410=E6=
=9C=8823=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=881:15=E5=AF=AB=E9=81=
=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: Eil=C3=ADs &#39;pidge&#39; N=C3=AD Fhlannag=C3=A1in &lt;<a href=3D"mailt=
o:pidge@baylibre.com" target=3D"_blank">pidge@baylibre.com</a>&gt;<br>
<br>
Running either of these ends up corrupting the os.execv args.<br>
<br>
If we run:<br>
./scripts/nativesdk-intercept/chown -R foo:foo bar<br>
<br>
The loop here ends up missing the conversion of foo:foo to root:root becaus=
e<br>
it sees sys.argv[0] and assumes that it&#39;s the user:group argument and t=
hat we<br>
should convert that. We end up a os.execv(path, args) that have the followi=
ng<br>
args:<br>
<br>
[&#39;root:root&#39;, &#39;-R&#39;, &#39;foo:foo&#39;, &#39;bar&#39;]<br>
<br>
As os.execv ignores args[0], we can just populate it with sys.argv[0] and t=
hen<br>
loop through sys.argv[1:]. As both chgrp and chown would have either flags =
and<br>
USER[:GROUP] next, this fixes the issue.<br>
<br>
(Backported from OE-Core rev: 2a75f647ec7696d353f4b09099d777ba53f34d36)<br>
<br>
Signed-off-by: Eil=C3=ADs &#39;pidge&#39; N=C3=AD Fhlannag=C3=A1in &lt;<a h=
ref=3D"mailto:pidge@baylibre.com" target=3D"_blank">pidge@baylibre.com</a>&=
gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0scripts/nativesdk-intercept/chgrp | 5 ++++-<br>
=C2=A0scripts/nativesdk-intercept/chown | 5 ++++-<br>
=C2=A02 files changed, 8 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/nativesdk-intercept/chgrp b/scripts/nativesdk-intercep=
t/chgrp<br>
index 30cc417d3a..f8ae84b8b3 100755<br>
--- a/scripts/nativesdk-intercept/chgrp<br>
+++ b/scripts/nativesdk-intercept/chgrp<br>
@@ -14,7 +14,10 @@ real_chgrp =3D shutil.which(&#39;chgrp&#39;, path=3Dpath=
)<br>
=C2=A0args =3D list()<br>
<br>
=C2=A0found =3D False<br>
-for i in sys.argv:<br>
+<br>
+args.append(real_chgrp)<br>
+<br>
+for i in sys.argv[1:]:<br>
=C2=A0 =C2=A0 =C2=A0if i.startswith(&quot;-&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
diff --git a/scripts/nativesdk-intercept/chown b/scripts/nativesdk-intercep=
t/chown<br>
index 3914b3e384..0805ceb70a 100755<br>
--- a/scripts/nativesdk-intercept/chown<br>
+++ b/scripts/nativesdk-intercept/chown<br>
@@ -14,7 +14,10 @@ real_chown =3D shutil.which(&#39;chown&#39;, path=3Dpath=
)<br>
=C2=A0args =3D list()<br>
<br>
=C2=A0found =3D False<br>
-for i in sys.argv:<br>
+<br>
+args.append(real_chown)<br>
+<br>
+for i in sys.argv[1:]:<br>
=C2=A0 =C2=A0 =C2=A0if i.startswith(&quot;-&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--000000000000266272062584fd4a--

