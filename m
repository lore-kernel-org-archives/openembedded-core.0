Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8703CC3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 19:45:15 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.7241.1746819905698394402
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 12:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DIPrCmVa;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30a9cd61159so2509781a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 12:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746819905; x=1747424705; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rvKGu6+BJbC5VaZ91QPMJxkrd+kmvfJj0pHi9IgJMrw=;
        b=DIPrCmVawNIQ78E73dZNiYEwScpTkl4zDaJ+mkKBZkiH6sKbIdZWWP1aqlMI+rXeE0
         CdW8YTuk2pF2y+2bCyU0u+Cw+pfafejfIvQiJCvEvMeY1w9qs46r8s0mgEwhEbl0dsGv
         mqJtmVZ7CJTXerG6XolaIDqza/SABj5u3XVOfHkNwS7FdeoM4G+mm0pIRHIYdAD1xM22
         vQGlwSEBBMhzxDL2qe6LHEn098q7AQxL2lxBuzU17IMuvFhyQnilh7s2i1dV14GHxDeb
         V3TUSfYYe83Wm1bHiU8ZsA98nzRsiosCjXXOnshcqMDTKI/JKQzMmCc0H2C9gei0mqXf
         /AfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746819905; x=1747424705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvKGu6+BJbC5VaZ91QPMJxkrd+kmvfJj0pHi9IgJMrw=;
        b=iZAlttE684TLJuX6ndeh8vC06VcfVN1bx9rE2BVezmEu+ZBKPYzEdmQXh+Pe2evFKG
         zdhrUZs4hNah53K2dhG95PP9oDY47nsw0y31A0fYJTitocZ7GiC85gddYBT0Sb8iZIDI
         U0LwP9TpScNw6RTbXke+j0UmJ6fF0IlnHmjQQG6wyDJd1ML0fRTCQ8RnQh/DGHPacp7y
         B67l07G4WzlyeOElw7/qI7WNieGfwnSvNC2cAtph59HhQWXl7WkE2r48Fuxxr0MBhn1w
         n8WxACdHwcxQvw1D+YRTzpfwbq4CnDZsCssRClq0xCnhTnARK36fOe4AfT/pgKv8j31e
         9zJA==
X-Gm-Message-State: AOJu0Yw3XjVP9VUYpJHSulgJhWGFQrGYc65ZUKzVhnY2Qrc1A0CqKnyW
	2o0bfdSXOM7rdFZaWk8qy8krLgIAnpb1Fd1uudAYEnemI6upmDUercsDpkL1aA/p5/sfTiYl/2K
	3c7hl1ury3xLNoGgEDT8y0PlEOow=
X-Gm-Gg: ASbGncux8uL2vjuf34PzCTKzPvawR4dm/w848ZX2OyEUiOcBLu593gi+8wKgsSdhuPG
	WeOwS+iII98bP+MM4ZmMZhgg2nBA6QwllEqnPZhsJGUVcFoBtcsMFJ56XFGvvdaNie5AoIbxjxb
	0v7jtMEI/1nNc0FdpuGy6pvtOT0CqKEhMJyw==
X-Google-Smtp-Source: AGHT+IE5XpXVhZfJhlTr0M4Uzm+v5ut0qTk7++Zs2+iKx8CNfQAfatzNSX4u2C+19iW1Rh5TobPoJWSlL913pEUap3M=
X-Received: by 2002:a17:90b:3508:b0:30a:204e:fe47 with SMTP id
 98e67ed59e1d1-30c4011f790mr6732757a91.16.1746819904846; Fri, 09 May 2025
 12:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250509173816.1250479-1-erick.shepherd@ni.com>
In-Reply-To: <20250509173816.1250479-1-erick.shepherd@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 9 May 2025 15:44:53 -0400
X-Gm-Features: ATxdqUF-_G9SIWkyvEgVCFDWt9kMLCTkEGAqNOOwVVVEbBjWrup67lN-fNac-SI
Message-ID: <CADkTA4PmKz80MhEjPQTyCa1a+tL6-QejxsMmUNU8sN39h+3xcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC] kernel-devsrc.bb: Stop copying the
 System.map files
To: erick.shepherd@ni.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ea3f2c0634b93386"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 19:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216245

--000000000000ea3f2c0634b93386
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 1:38=E2=80=AFPM Erick Shepherd via lists.openembedde=
d.org
<erick.shepherd=3Dni.com@lists.openembedded.org> wrote:

> Currently there are two .map files being copied to $kerneldir/build.
> One file is System.map and the other is System.map-<kernel-version>.
> Each .map file takes up about 5MB and does not seem to be required for
> the compilation of driver software via dkms. This change stops copying
> both .map files to save disk space.
>

dkms isn't something that is relevant for why we copy the .map file

It is used for debug and in some scenarios linking.

kernel devsrc by definition is not trying to be small, but if the two .map
files are exactly the same then a symlink should suffice, or just a
single copy.



>
> Another solution could also be to only copy one .map file to
> $kerneldir/build or have one of the .map files by a symlink. If both
> .map files are required then this patch can be abandoned.
>
> Signed-off-by: Erick Shepherd <erick.shepherd@ni.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 1500aff2e2..298be27ac7 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -75,7 +75,7 @@ do_install() {
>          if [ -s Module.symvers ]; then
>              cp Module.symvers $kerneldir/build
>          fi
> -        cp System.map* $kerneldir/build
> +
>          if [ -s Module.markers ]; then
>              cp Module.markers $kerneldir/build
>          fi
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216244):
> https://lists.openembedded.org/g/openembedded-core/message/216244
> Mute This Topic: https://lists.openembedded.org/mt/112903585/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ea3f2c0634b93386
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 9, 2025 at 1:38=
=E2=80=AFPM Erick Shepherd via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;erick.shepherd=3D<a href=3D"mailto:ni.com@list=
s.openembedded.org">ni.com@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Currently there are two .m=
ap files being copied to $kerneldir/build.<br>
One file is System.map and the other is System.map-&lt;kernel-version&gt;.<=
br>
Each .map file takes up about 5MB and does not seem to be required for<br>
the compilation of driver software via dkms. This change stops copying<br>
both .map files to save disk space.<br></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">dkms isn&#39;t somethin=
g that is relevant for why we copy the .map file</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">It is used for debug and in some scenarios linking.=
<br><br></div><div class=3D"gmail_default" style=3D"font-size:small">kernel=
 devsrc by definition is not trying to be small, but if the two .map</div><=
div class=3D"gmail_default" style=3D"font-size:small">files are exactly the=
 same then a symlink should suffice, or just a=C2=A0</div><div class=3D"gma=
il_default" style=3D"font-size:small">single copy.</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Another solution could also be to only copy one .map file to<br>
$kerneldir/build or have one of the .map files by a symlink. If both<br>
.map files are required then this patch can be abandoned.<br>
<br>
Signed-off-by: Erick Shepherd &lt;<a href=3D"mailto:erick.shepherd@ni.com" =
target=3D"_blank">erick.shepherd@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" =
rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> b/meta/recipes-ke=
rnel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D=
"_blank">kernel-devsrc.bb</a><br>
index 1500aff2e2..298be27ac7 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
@@ -75,7 +75,7 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -s Module.symvers ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp Module.symvers $kerneldi=
r/build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp System.map* $kerneldir/build<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -s Module.markers ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp Module.markers $kerneldi=
r/build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#216244): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/216244" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/216244</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112903585/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112903585/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000ea3f2c0634b93386--

