Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98569D25040
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 07:30:11 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28654.1768203006807517362
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jan 2026 23:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YLs558on;
 spf=pass (domain: mvista.com, ip: 209.85.218.44, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so1279114966b.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jan 2026 23:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1768203005; x=1768807805; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rG9f7zJoXpmkwvCT3dsCVJNpG6hcCsuaxEPEWXw09jw=;
        b=YLs558onP5bhjwoeM2BHqxt9/UGTA6bkAi0K69pFkf5OtqkHGIqzqlIjEZVZIddbP5
         gCoanqXQXSY71tS0nefjerBwzM8c8V0vdSkD/oOsniu5G3CzKZGapL/OUYwJgOV6+CuZ
         1gB8sbtXeBFCbjgv4OdZzFBSYcxuk1ZuEc/+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203005; x=1768807805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG9f7zJoXpmkwvCT3dsCVJNpG6hcCsuaxEPEWXw09jw=;
        b=IztW6vridxR59kdRWbHqKl/eyJgu4fIZIEcUHxUF6aSj5CAp0+pjsMY6eonsuxJ5XO
         oEUs2ooKStNHbHcb0NHet4gsUZzYdFIqdHeJz75MVUV1z4HYtdKwrYRCzzM7gEEhVIXg
         jzoWyLgsJGErSqUt2Eji7qc9KhnREfYk95/T+CRGpfRHiO66Zafgdf5kKrSK5T501JdH
         WqfqfxDWdpzDhL1YWtuMWsDJRsAVLGPqIvt53UbNVz8vqYpQTbXZoxRl7bA3+sTyh+Jm
         qNVjm/gTKCqgzB0XBWrOQ71XE7/FO790JKVsZvHQNeL4mfDyV4OuA/Bdv9X2na5e2un3
         IBWg==
X-Gm-Message-State: AOJu0YwmlN3PtU7uYZP0co+KCFaASkEzzBHx2Dg3Wm9+Z6SqW59gYEDP
	qJReONVMxsX8RYBmZA09yUNfDZYSQcmOM00Mlqx4X6r8IdZVjBEZf3XCySZTjes55dTMpm3fVYQ
	pHZaJGV08yQV6exsqsmxj+a4v8LXUXUZ5JTsjrVvP5Q==
X-Gm-Gg: AY/fxX4Ny7Ijf2ysir4T8dOWu+ufmmm7DSPwAqNMmR1AFItG23Ye+carwSEBfrO9Rhn
	4Sa2km5vuR4RCZhoiQYoP6qX/hSfnxjN7rVMxRnFbalV3Gr1wjpd04OHD4uKq4emODYf5bEZF0W
	XFRc1YNtTqazkzpT65zdQ1yIAtb2hvR5QKJNTil0IRDnAMdkwYgTvmwous3YlBMOXrXEYTgEiUO
	yfBIboDDheu6/BWKOAdk1nAl2Pl5fGwr4S5CQGCUDwpdNbSkndUkWNDECylpH9SKgxAv62hI9AU
	q5wbP0q1fyKxXAEBSoJVHMH4I5Q=
X-Google-Smtp-Source: AGHT+IGI9BoPq0SJ5T283k9NsOPCvmM+/E1cCM8/Jjk3qzO9sDUAKpYHyw27kRq5RCKFHVC3WFvRYss5Lj9JMz/o4m0=
X-Received: by 2002:a17:907:9491:b0:b87:1e50:95c2 with SMTP id
 a640c23a62f3a-b871e50978cmr179422866b.3.1768203004566; Sun, 11 Jan 2026
 23:30:04 -0800 (PST)
MIME-Version: 1.0
References: <20260112071440.2411292-1-vanusuri@mvista.com> <AS1PR10MB56973C8003890BF9FDACAF5AFD81A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56973C8003890BF9FDACAF5AFD81A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 12 Jan 2026 12:59:51 +0530
X-Gm-Features: AZwV_Qimjzk69pfXlGNC26i7tBjKek5cecGor_FiNAKQ00k7NmOlCvBNtOM27To
Message-ID: <CANQUz18VXhLFmi0qaTfjjpkXE7+DkoBdVrr33GaxqdAq6fct2Q@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch] gnupg: upgrade 2.4.8 -> 2.4.9
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fa6af106482bd770"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 07:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229186

--000000000000fa6af106482bd770
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Thanks for letting me know. Sorry, I missed your earlier patch =E2=80=94 I =
see it
now.

Steve,

Please ignore my patch.

Thanks & Regards,
Vijay

On Mon, Jan 12, 2026 at 12:47=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.=
com>
wrote:

> Sent already 2 days ago...
> https://lists.openembedded.org/g/openembedded-core/message/229168
>
> Peter
>
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Vijay Anusuri via
> lists.openembedded.org
> Sent: Monday, January 12, 2026 8:15
> To: openembedded-core@lists.openembedded.org
> Cc: Vijay Anusuri <vanusuri@mvista.com>
> Subject: [OE-core][scarthgap][patch] gnupg: upgrade 2.4.8 -> 2.4.9
>
> This release includes fix for CVE-2025-68973
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * gpg: Fix possible memory corruption in the armor parser.  [T7906]
>
> * gpg: Avoid potential downgrade to SHA1 in 3rd party key
>   signatures.  [rGddb012be7f]
>
> * gpg: Error out on unverified output for non-detached signatures.
>   [rG9d302f978b]
>
> * gpg: Do not allow compressed key packets on import.  [T7014]
>
> * scd: Fix a harmless read buffer over-read in a function used by
>   PKCS#15 cards.  [T7662]
>
> * dirmngr: Do not require a keyserver for "gpg --fetch-key".
>   [T7693]
>
> * agent: Fix ssh-agent's request_identities for skipped Brainpool
>   keys.  [rG6bf5696c85]
>
> Release-info: https://dev.gnupg.org/T8001
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  meta/recipes-support/gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb}
> (97%)
>
> diff --git a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
> b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
> similarity index 97%
> rename from meta/recipes-support/gnupg/gnupg_2.4.8.bb
> rename to meta/recipes-support/gnupg/gnupg_2.4.9.bb
> index a6e777abf8..4f60a4e7b2 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
> @@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D "
> file://0001-configure.ac-use-a-custom-value-for-
>                                  file://relocate.patch"
>  SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
>
> -SRC_URI[sha256sum] =3D
> "b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616"
> +SRC_URI[sha256sum] =3D
> "dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964"
>
>  EXTRA_OECONF =3D "--disable-ldap \
>                 --disable-ccid-driver \
> --
> 2.43.0
>
>

--000000000000fa6af106482bd770
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,<br><br>Thanks for letting me know. Sorry, I=
 missed your earlier patch =E2=80=94 I see it now.<br><br></div><div>Steve,=
 <br></div><div><br></div><div>Please ignore my patch.<br><br></div><div>Th=
anks &amp; Regards,<br></div><div>Vijay</div></div><br><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, =
Jan 12, 2026 at 12:47=E2=80=AFPM Marko, Peter &lt;<a href=3D"mailto:Peter.M=
arko@siemens.com">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Sent already 2 days ago...<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/22916=
8" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/229168</a><br>
<br>
Peter<br>
<br>
-----Original Message-----<br>
From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D=
"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto=
:openembedded-core@lists.openembedded.org" target=3D"_blank">openembedded-c=
ore@lists.openembedded.org</a>&gt; On Behalf Of Vijay Anusuri via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a><br>
Sent: Monday, January 12, 2026 8:15<br>
To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_=
blank">openembedded-core@lists.openembedded.org</a><br>
Cc: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=3D"_bla=
nk">vanusuri@mvista.com</a>&gt;<br>
Subject: [OE-core][scarthgap][patch] gnupg: upgrade 2.4.8 -&gt; 2.4.9<br>
<br>
This release includes fix for CVE-2025-68973<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
* gpg: Fix possible memory corruption in the armor parser.=C2=A0 [T7906]<br=
>
<br>
* gpg: Avoid potential downgrade to SHA1 in 3rd party key<br>
=C2=A0 signatures.=C2=A0 [rGddb012be7f]<br>
<br>
* gpg: Error out on unverified output for non-detached signatures.<br>
=C2=A0 [rG9d302f978b]<br>
<br>
* gpg: Do not allow compressed key packets on import.=C2=A0 [T7014]<br>
<br>
* scd: Fix a harmless read buffer over-read in a function used by<br>
=C2=A0 PKCS#15 cards.=C2=A0 [T7662]<br>
<br>
* dirmngr: Do not require a keyserver for &quot;gpg --fetch-key&quot;.<br>
=C2=A0 [T7693]<br>
<br>
* agent: Fix ssh-agent&#39;s request_identities for skipped Brainpool<br>
=C2=A0 keys.=C2=A0 [rG6bf5696c85]<br>
<br>
Release-info: <a href=3D"https://dev.gnupg.org/T8001" rel=3D"noreferrer" ta=
rget=3D"_blank">https://dev.gnupg.org/T8001</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/gnupg/{<a href=3D"http://gnupg_2.4.8.bb" rel=3D"=
noreferrer" target=3D"_blank">gnupg_2.4.8.bb</a> =3D&gt; <a href=3D"http://=
gnupg_2.4.9.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.4.9.bb</a>} | =
2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-support/gnupg/{<a href=3D"http://gnupg_2.4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">gnupg_2.4.8.bb</a> =3D&gt; <a href=3D"=
http://gnupg_2.4.9.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.4.9.bb<=
/a>} (97%)<br>
<br>
diff --git a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.8.bb" r=
el=3D"noreferrer" target=3D"_blank">gnupg_2.4.8.bb</a> b/meta/recipes-suppo=
rt/gnupg/<a href=3D"http://gnupg_2.4.9.bb" rel=3D"noreferrer" target=3D"_bl=
ank">gnupg_2.4.9.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">gnupg_2.4.8.bb</a><br>
rename to meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.9.bb" rel=
=3D"noreferrer" target=3D"_blank">gnupg_2.4.9.bb</a><br>
index a6e777abf8..4f60a4e7b2 100644<br>
--- a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">gnupg_2.4.8.bb</a><br>
+++ b/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.9.bb" rel=3D"n=
oreferrer" target=3D"_blank">gnupg_2.4.9.bb</a><br>
@@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D &quot; file://0001-config=
ure.ac-use-a-custom-value-for-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://relocate.patch&quot;<br=
>
=C2=A0SRC_URI:append:class-nativesdk =3D &quot; file://relocate.patch&quot;=
<br>
<br>
-SRC_URI[sha256sum] =3D &quot;b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689=
563bcdd060595318616&quot;<br>
+SRC_URI[sha256sum] =3D &quot;dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a=
4ddeb4176fd8b302964&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-ldap \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-ccid-driv=
er \<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--000000000000fa6af106482bd770--

