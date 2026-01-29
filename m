Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B343ED6B094
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:38:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19137.1769704706440582418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=scwtZc8y;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbc305914so1131459f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 08:38:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769704705; cv=none;
        d=google.com; s=arc-20240605;
        b=D1BorJbIZuxNNGXrpBLEF14yK5xoODenxzNEAeXCnSzb1nUMIhxHOL+ZLJ34Ssz8cU
         k66PiW7oYCXY+b7QpjJ5e/wwM9LqMjmrjK+l21fwv2xAOjSv4y4ATTLBpsUxlabLyNO9
         rjHulSMfPPdamu8u6JQ+5ELI30gpT+sGhiz4/9zXC8HWWl4rvO4nw0JbiKZlNndV+p/u
         ovJHkkjUvlwzuZSERIUFmVNDnRZk5uBLXa+kBeQt0Fw/o3PPUrWW4ecopOlwWtCOe+K4
         CulDjp/fVQf34OMwjgC8M3hrwlh4XPH1ZTuKS4jfu0Z3dmBnbhcJPnY+SXDoijSjEi71
         Wjvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=az3eFqlgn97uO/L6Mxt18NJbSUX4kqNA5s/+9CuGOP0=;
        fh=kyrcx/wGdP1K8AcZ1t5dlAg43e9Kck6gc8gLfroTQbI=;
        b=SS/oXvH5nPluQsKiP3ZBjAGJWA2wD5wCZ1oZfIodYPsHXfutwL0acHjZWmaX+UrA5z
         q8MiQQAc+jZyvyu41fLtPTZjwoQ375yWwUORzPLvTDNN56EjWBysE9fOw6NQ8J7v+j98
         hvN8qrqy2YAxSc7MltlsqTCMTgHKhTIv0qKLr9zS39QQPkWaRkv7S6Kj5QiwDJyFgXZa
         coD3F6kAfb/8ymRgv2kn7lhLr5gFXOXsu20V+yy4UyGLEf7zR/L8A9hBMf1aFH0OZhMW
         5H4SbxTcgHc5OCZrKUATDFdyQA/0Rr/ggjUgh8F68kTpwhNIN44WvQ41kVxxO2Cnt37b
         +KFA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769704705; x=1770309505; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=az3eFqlgn97uO/L6Mxt18NJbSUX4kqNA5s/+9CuGOP0=;
        b=scwtZc8yqcgaAMGkEZdg5A2cksSPm2kR+LfwiKoYsVX/4sYKjXaQ+xD1/nIv1vPNOB
         OFHEsXFk4r/sIcZ46o9iW5FccuZyjd7SVZRGi87NFu4bYKDL+VLZvS4m3c4Yo7N7I8ET
         Iw3eyGov2HhLhS9DHHGUjzDQMUws5qBQR0lbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769704705; x=1770309505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=az3eFqlgn97uO/L6Mxt18NJbSUX4kqNA5s/+9CuGOP0=;
        b=BNX8iE1QIMoGO0MWwGz0QucHbh9Ty/iOle/YTq3/Dc35rmk7xl7gTxHJXUbSc0RbHO
         OqX9AGimlqNpng5gJMbEZ55HXxySVtiaeyzSkysmd7E7QtEWmUHhD3wmERJ/lBTriJx+
         mXkH9SYQrgWkclOeDfAJd0jg+LNvOyynIh0cTyXEhjmiqfbXrsHiACvdgzz0T2TyMHwq
         nOVQ/wxFUcRnJgIG/Oho3lJ76X9R1mUcxRbLmX/aQEAfbhbIJgBA6Vf11I1Jgy2pTpDk
         Z/JuTtmuqvUvYulvwmCG6w/oqeJ5708CHT0XqDG20hTvCQBF74aGFN2quiDC+G7jRNcM
         u79Q==
X-Gm-Message-State: AOJu0YwUWCvepwZtOmupwE58YRxR26n+DoholKL3cj+2ctbkH6DGfybT
	DrwZVaEjbEpw+0o+eKHmAIQsQcVALF9k6mVJjowOLR+e2nSNVi4wqnOeOoTTL1JvveQRQAW5o04
	krmMCYQH9saia60g3BlT1idQNLrLA5l7u+mZUlQJBSg==
X-Gm-Gg: AZuq6aLHsg2fum4xOsvL4mK4rlKSt4V1JhWelXJN0Jd0wiRdT3cZnt4sU46nBqOf87U
	w2fq2Sn90jVfLmhfvz5fdi7u47+7QQyC/lYL73LmIPSCq8pfnxqcKlavpQfOrBgmxjkXsbRCswS
	t9kiqfwaAkePf5Tih+8h2oRtF4yeyXf3PxhclfhmeawiYl7dvFDMRtJa5/pinVbfKY/YsOvtWVn
	Qdo8NbT3NiV+K3bvHhabG0j3k5rBh+vrnqKwW9PyU8pmXQovZLHbGqWMQw+9uIHWUCmm8j1NTZO
	oskv2YHA9N36z3LBa8KuRMstdVEdjO0W8p2u0S0=
X-Received: by 2002:a05:6000:1885:b0:435:e57a:9082 with SMTP id
 ffacd0b85a97d-435f3abc6a2mr273947f8f.46.1769704704456; Thu, 29 Jan 2026
 08:38:24 -0800 (PST)
MIME-Version: 1.0
References: <20260125183438.1579158-1-peter.marko@siemens.com>
 <20260125183438.1579158-3-peter.marko@siemens.com> <CAMSfU+5=9iLmbvM=1R=AHOvQhCjTOR0ovbqGShzV1s7p8YWVrw@mail.gmail.com>
 <AS1PR10MB5697F0B7E585E36EB93AC3EDFD9EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697F0B7E585E36EB93AC3EDFD9EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 29 Jan 2026 17:37:58 +0100
X-Gm-Features: AZwV_Qj4b-divS-CuUgG-JYBmTsJdN4gUuGucRi1w_P47S8RfBK7sH2aNLnxL7A
Message-ID: <CAMSfU+526VGVrQDAtcSOapHLWqtC+b1SRxSDKkG3eg2h0wo=Cg@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 3/3] libxml2: patch CVE-2026-0992
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004450340649897c49"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:38:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230140

--0000000000004450340649897c49
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 29 janv. 2026 =C3=A0 17:32, Marko, Peter <Peter.Marko@siemens.com> =
a
=C3=A9crit :

> Thanks for finding that issue.
>
> I=E2=80=99ll add pick additional commit during next days.
>
>
>
> Since on master this was already merged, should I keep it as two commits
> also for stable branches?
>

I'm fine taking a single commit on the stable branch as long as the
followup is merged on master.

Thanks!


>
>
> Peter
>
>
>
> *From:* Yoann Congal <yoann.congal@smile.fr>
> *Sent:* Thursday, January 29, 2026 10:39
> *To:* Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core][whinlatter][PATCH 3/3] libxml2: patch
> CVE-2026-0992
>
>
>
>
>
>
>
> Le dim. 25 janv. 2026 =C3=A0 19:41, Peter Marko via lists.openembedded.or=
g
> <peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick patch which closed [1].
>
> [1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
>
>
>
> Hello,
>
>
>
> Did you see
>
> Fix for CVE-2026-0992 is incomplete (#1040) =C2=B7 Issue =C2=B7 GNOME/lib=
xml2
> https://gitlab.gnome.org/GNOME/libxml2/-/issues/1040
>
> ... and the fixing commit:
>
> catalog: Do not check value for duplication nextCatalog (deed3b78) =C2=B7
> Commits =C2=B7 GNOME / libxml2 =C2=B7 GitLab
>
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/deed3b7873dff30b7f87f7f33=
154c9932a772522
>
> ?
>
>
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../libxml/libxml2/CVE-2026-0992.patch        | 49 +++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.14.6.bb    |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
> b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
> new file mode 100644
> index 0000000000..ad23498a4c
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
> @@ -0,0 +1,49 @@
> +From f75abfcaa419a740a3191e56c60400f3ff18988d Mon Sep 17 00:00:00 2001
> +From: Daniel Garcia Moreno <daniel.garcia@suse.com>
> +Date: Fri, 19 Dec 2025 11:02:18 +0100
> +Subject: [PATCH] catalog: Ignore repeated nextCatalog entries
> +
> +This patch makes the catalog parsing to ignore repeated entries of
> +nextCatalog with the same value.
> +
> +Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
> +
> +CVE: CVE-2026-0992
> +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/f75abfcaa419a740a3191e56c=
60400f3ff18988d
> ]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + catalog.c | 18 ++++++++++++++++++
> + 1 file changed, 18 insertions(+)
> +
> +diff --git a/catalog.c b/catalog.c
> +index 46b877e6..fa6d77ca 100644
> +--- a/catalog.c
> ++++ b/catalog.c
> +@@ -1227,9 +1227,27 @@ xmlParseXMLCatalogNode(xmlNodePtr cur,
> xmlCatalogPrefer prefer,
> +               BAD_CAST "delegateURI", BAD_CAST "uriStartString",
> +               BAD_CAST "catalog", prefer, cgroup);
> +     } else if (xmlStrEqual(cur->name, BAD_CAST "nextCatalog")) {
> ++      xmlCatalogEntryPtr prev =3D parent->children;
> ++
> +       entry =3D xmlParseXMLCatalogOneNode(cur, XML_CATA_NEXT_CATALOG,
> +               BAD_CAST "nextCatalog", NULL,
> +               BAD_CAST "catalog", prefer, cgroup);
> ++      /* Avoid duplication of nextCatalog */
> ++      while (prev !=3D NULL) {
> ++          if ((prev->type =3D=3D XML_CATA_NEXT_CATALOG) &&
> ++              (xmlStrEqual (prev->URL, entry->URL)) &&
> ++              (xmlStrEqual (prev->value, entry->value)) &&
> ++              (prev->prefer =3D=3D entry->prefer) &&
> ++              (prev->group =3D=3D entry->group)) {
> ++                  if (xmlDebugCatalogs)
> ++                      xmlCatalogPrintDebug(
> ++                          "Ignoring repeated nextCatalog %s\n",
> entry->URL);
> ++                  xmlFreeCatalogEntry(entry, NULL);
> ++                  entry =3D NULL;
> ++                  break;
> ++          }
> ++          prev =3D prev->next;
> ++      }
> +     }
> +     if (entry !=3D NULL) {
> +         if (parent !=3D NULL) {
> diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb
> b/meta/recipes-core/libxml/libxml2_2.14.6.bb
> index 7b47f823f9..b881a89a5f 100644
> --- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.14.6.bb
> @@ -21,6 +21,7 @@ SRC_URI +=3D "
> http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=3D${BP};name=3Dtestt
>             file://CVE-2025-6021.patch \
>             file://CVE-2026-0989.patch \
>             file://CVE-2026-0990.patch \
> +           file://CVE-2026-0992.patch \
>             "
>
>  SRC_URI[archive.sha256sum] =3D
> "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229943):
> https://lists.openembedded.org/g/openembedded-core/message/229943
> Mute This Topic: https://lists.openembedded.org/mt/117455086/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --
>
> Yoann Congal
>
> Smile ECS
>


--=20
Yoann Congal
Smile ECS

--0000000000004450340649897c49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 29=
 janv. 2026 =C3=A0=C2=A017:32, Marko, Peter &lt;<a href=3D"mailto:Peter.Mar=
ko@siemens.com">Peter.Marko@siemens.com</a>&gt; a =C3=A9crit=C2=A0:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg491099=
9913463741156">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_4910999913463741156WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">Thanks for finding that issue.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">I=E2=80=99ll add pick additional commit during next day=
s.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">Since on master this was already merged, should I keep =
it as two commits also for stable branches?</span></p></div></div></div></b=
lockquote><div><br></div><div>I&#39;m fine taking a single commit on the st=
able branch as long as the followup is merged on master.</div><div><br></di=
v><div>Thanks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div class=3D"msg4910999913463741156"><div lang=3D"EN-US" style=
=3D"overflow-wrap: break-word;"><div class=3D"m_4910999913463741156WordSect=
ion1"><p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quo=
t;Arial&quot;,sans-serif"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-width:medium medium medium 1.5pt;border-style:none non=
e none solid;border-color:currentcolor currentcolor currentcolor blue;paddi=
ng:0in 0in 0in 4pt">
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;b=
order-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0in 0in"=
>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:&quot;C=
alibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11pt;font=
-family:&quot;Calibri&quot;,sans-serif"> Yoann Congal &lt;<a href=3D"mailto=
:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;
<br>
<b>Sent:</b> Thursday, January 29, 2026 10:39<br>
<b>To:</b> Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko=
@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core][whinlatter][PATCH 3/3] libxml2: patch CVE-202=
6-0992<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Le=C2=A0dim. 25 janv. 2026 =C3=A0=C2=A019:41, Peter =
Marko via <a href=3D"http://lists.openembedded.org" target=3D"_blank">
lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@=
lists.openembedded.org" target=3D"_blank">siemens.com@lists.openembedded.or=
g</a>&gt; a =C3=A9crit=C2=A0:<u></u><u></u></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal">From: Peter Marko &lt;<a href=3D"mailto:peter.marko@=
siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
<br>
Pick patch which closed [1].<br>
<br>
[1] <a href=3D"https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019" target=
=3D"_blank">
https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019</a><u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Hello,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Did you see<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Fix for CVE-2026-0992 is incomplete (#1040) =C2=B7 I=
ssue =C2=B7 GNOME/libxml2<br>
<a href=3D"https://gitlab.gnome.org/GNOME/libxml2/-/issues/1040" target=3D"=
_blank">https://gitlab.gnome.org/GNOME/libxml2/-/issues/1040</a><u></u><u><=
/u></p>
</div>
<div>
<p class=3D"MsoNormal">... and the fixing commit:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">catalog: Do not check value for duplication nextCata=
log (deed3b78) =C2=B7 Commits =C2=B7 GNOME / libxml2 =C2=B7 GitLab<br>
<a href=3D"https://gitlab.gnome.org/GNOME/libxml2/-/commit/deed3b7873dff30b=
7f87f7f33154c9932a772522" target=3D"_blank">https://gitlab.gnome.org/GNOME/=
libxml2/-/commit/deed3b7873dff30b7f87f7f33154c9932a772522</a><u></u><u></u>=
</p>
</div>
<div>
<p class=3D"MsoNormal">?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Signed-off-by: Peter Ma=
rko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=3D"_blank">peter.=
marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../libxml/libxml2/CVE-2026-0992.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4=
9 +++++++++++++++++++<br>
=C2=A0meta/recipes-core/libxml/<a href=3D"http://libxml2_2.14.6.bb" target=
=3D"_blank">libxml2_2.14.6.bb</a>=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 50 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992.pat=
ch<br>
<br>
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch b/meta/re=
cipes-core/libxml/libxml2/CVE-2026-0992.patch<br>
new file mode 100644<br>
index 0000000000..ad23498a4c<br>
--- /dev/null<br>
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch<br>
@@ -0,0 +1,49 @@<br>
+From f75abfcaa419a740a3191e56c60400f3ff18988d Mon Sep 17 00:00:00 2001<br>
+From: Daniel Garcia Moreno &lt;<a href=3D"mailto:daniel.garcia@suse.com" t=
arget=3D"_blank">daniel.garcia@suse.com</a>&gt;<br>
+Date: Fri, 19 Dec 2025 11:02:18 +0100<br>
+Subject: [PATCH] catalog: Ignore repeated nextCatalog entries<br>
+<br>
+This patch makes the catalog parsing to ignore repeated entries of<br>
+nextCatalog with the same value.<br>
+<br>
+Fix <a href=3D"https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019" targe=
t=3D"_blank">
https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019</a><br>
+<br>
+CVE: CVE-2026-0992<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/libxm=
l2/-/commit/f75abfcaa419a740a3191e56c60400f3ff18988d" target=3D"_blank">htt=
ps://gitlab.gnome.org/GNOME/libxml2/-/commit/f75abfcaa419a740a3191e56c60400=
f3ff18988d</a>]<br>
+Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
+---<br>
+ catalog.c | 18 ++++++++++++++++++<br>
+ 1 file changed, 18 insertions(+)<br>
+<br>
+diff --git a/catalog.c b/catalog.c<br>
+index 46b877e6..fa6d77ca 100644<br>
+--- a/catalog.c<br>
++++ b/catalog.c<br>
+@@ -1227,9 +1227,27 @@ xmlParseXMLCatalogNode(xmlNodePtr cur, xmlCatalogPr=
efer prefer,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BAD_CAST &quot;dele=
gateURI&quot;, BAD_CAST &quot;uriStartString&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BAD_CAST &quot;cata=
log&quot;, prefer, cgroup);<br>
+=C2=A0 =C2=A0 =C2=A0} else if (xmlStrEqual(cur-&gt;name, BAD_CAST &quot;ne=
xtCatalog&quot;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 xmlCatalogEntryPtr prev =3D parent-&gt;children;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0entry =3D xmlParseXMLCatalogOneNode(cur, XML_CA=
TA_NEXT_CATALOG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BAD_CAST &quot;next=
Catalog&quot;, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BAD_CAST &quot;cata=
log&quot;, prefer, cgroup);<br>
++=C2=A0 =C2=A0 =C2=A0 /* Avoid duplication of nextCatalog */<br>
++=C2=A0 =C2=A0 =C2=A0 while (prev !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((prev-&gt;type =3D=3D XML_CATA_NEX=
T_CATALOG) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (xmlStrEqual (prev-&gt;U=
RL, entry-&gt;URL)) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (xmlStrEqual (prev-&gt;v=
alue, entry-&gt;value)) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (prev-&gt;prefer =3D=3D =
entry-&gt;prefer) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (prev-&gt;group =3D=3D e=
ntry-&gt;group)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (xmlDeb=
ugCatalogs)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xmlCatalogPrintDebug(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Ignoring repeated nextCatalog %s\n&quot;, entry-&gt=
;URL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlFreeCat=
alogEntry(entry, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry =3D =
NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev =3D prev-&gt;next;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0if (entry !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (parent !=3D NULL) {<br>
diff --git a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.14.6.bb" =
target=3D"_blank">libxml2_2.14.6.bb</a> b/meta/recipes-core/libxml/<a href=
=3D"http://libxml2_2.14.6.bb" target=3D"_blank">libxml2_2.14.6.bb</a><br>
index 7b47f823f9..b881a89a5f 100644<br>
--- a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.14.6.bb" target=
=3D"_blank">libxml2_2.14.6.bb</a><br>
+++ b/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.14.6.bb" target=
=3D"_blank">libxml2_2.14.6.bb</a><br>
@@ -21,6 +21,7 @@ SRC_URI +=3D &quot;<a href=3D"http://www.w3.org/XML/Test/=
xmlts20130923.tar;subdir=3D$%7BBP%7D;name=3Dtestt" target=3D"_blank">http:/=
/www.w3.org/XML/Test/xmlts20130923.tar;subdir=3D${BP};name=3Dtestt</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-6021.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-0989.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-0990.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-0992.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;7ce458a0affeb83f0b55f1f4f9e0e557=
35dbfc1a9de124ee86fb4a66b597203a&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229943): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229943" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/229943</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117455086/431=
6185" target=3D"_blank">
https://lists.openembedded.org/mt/117455086/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>]<br=
>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></p>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><br>
<span class=3D"m_4910999913463741156gmailsignatureprefix">-- </span><u></u>=
<u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Raleway">Yoann Congal</sp=
an><u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Raleway">Smile ECS</span>=
<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><di=
v><font face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000004450340649897c49--

