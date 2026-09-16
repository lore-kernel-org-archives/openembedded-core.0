Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC871C88E7F
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 18:09:12 +0000 (UTC)
Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21534.1789582143137308943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 11:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jPlMWyCJ;
 spf=pass (domain: gmail.com, ip: 74.125.229.205, mailfrom: ticotimo@gmail.com)
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so1679479e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 11:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789582141; cv=none;
        d=google.com; s=arc-20260327;
        b=bsS8x2On4yfUkuVZpopIjhDHBd2IZhz56fHdZKF7vb/57EJBjcjnn4j9ZJx0rB6BJi
         YDs3gTT5X0pxuszjvV1UuPMoNfetlJYJDlWonNNWIE/1PpKqjYxflhr00up1eq+cbiOX
         5muZ1LSJUnko/TzuI8voaNqgeTQck0hUuH+EZqTHRL+lA8S6w6uvgtBDDv2/npDNVP/Y
         VXJkX276/vG3tbi+hFzTuai8QeqSRAg/u+DOFB2U8Oe3vB7jda/EA1lu+5+2ErUXtjjB
         32+QFccoUBqNUHH3HA6Ia2MhPocaLqiid5GWY2E7rJvzs91VAYoJMwss0zva60x9Ch1w
         MSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ts0a671NxtEhXyxJIDHsaiFyphsw5mmRf9N0qvYuvf0=;
        fh=RS8dmBK07ZAJfMcuEAlNzdqUwJ4W/22OuCC8z+WAqJk=;
        b=P0YfdwrNqAPgDUO4z5keq+IR4RAlYR4reWE/eM8JeESJP9agJuoGU9IQWitAz4Yn5q
         aAW7Sw48J6K36swXjW5icGP1rJ9BbPuZK18lgepG8WuX+yr5SKqmXiDt9dZIOyWgLoZd
         RW0A/JjBIcE9MktlW8TO8SyAmOTb1jE+fSFRG9fxw8IZv8XzEXGNOrBuclXvdYnIto4k
         pCFyXYTWqQ2PftYEc5oOAiLzKvBHDpzc6jwnwl20DINkh7A/fs90/cNFsXQndKpC0sjA
         Ce+7MNIv7lsb+iSCaNI45N/4AplgiDym0KRKwNg0ln2bfQ9trQ12iSyXhMJijy9LBvPT
         dlyw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789582141; x=1790186941; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ts0a671NxtEhXyxJIDHsaiFyphsw5mmRf9N0qvYuvf0=;
        b=jPlMWyCJAWfu4D9Ds/6upt2rdJTxYxtGKZcJfTjIcfl6DBY+rFTq5vdkAAiwY1an2l
         jBG6oPwazf+aJWDt3Q8yxHoy+0WsKyDcLZrmkSOrTSE+0wL/zmhu8v6yA0S30ZoChI2H
         jvAeJaUD5+hku+9qtSGsA5vwEqCAqllodQQmnH2mVuqbbEIjoXb6HG5LifSkKqjPfigm
         GieSCe53m1UpO/sUECdUkgJH7IdGE7Bw84QhPzMBFO5ep52nmPYRQD8KmSbMj9g4GNho
         bKu9BvNse5Ul+XVL6Oa+WToDsnp+RjZuZoOfO/HqzDaZ0n7iMiuLAxWabSx29/M0vici
         JuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789582141; x=1790186941;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ts0a671NxtEhXyxJIDHsaiFyphsw5mmRf9N0qvYuvf0=;
        b=vFKIZJqODMPGr6vFg+Cth1+EBPGVhT7FvKy10lH691ERBiXzzq1YLzoV702BtvnuY8
         TRo1z59Vzc7o7hVLhCsX/JzGScHTzI349t2HCcr8EW8DWFt9huuriOyeNn94bQu58BHd
         Q8QjvQRjSgJCCFJfyjNZNF27H8lx4xPa4mPDT2JSYLImMq/2hwcf7BQNJkMA5wYbCYoq
         LNMCVKUju+FbnpypLt+ruCDNytYVqAUge5KvbSczJ54muEHTwijRJ/l9BdG6Km56hhfd
         V1qD5YwKz5nkyYVGoIjZe/1+RjgArEVlD4li6Uw42c53OeNjXxS2w+GhHEEEB9Qjyopv
         v6hw==
X-Gm-Message-State: AFuF++lyGh4QdJITsLT6tKp4IrvSBWQ0Yh8D+Irbl8muTkrZST6KaLHC
	1yYRJtMRlNnsnLKZlj9r9iOvW1yVLhmQAPlyCz0Abz0qWyBRXvnRTwUwoUAguINOtB/+AH5558X
	lVqL+LM3s1P/9h41mqbSBbn9peGaNQH8=
X-Gm-Gg: AYBFou2CYQfo6SoRMGTJ1F2byymsCa332r0I19AUb99waTU0HmfSGco81+NKepxDyZL
	lsFXiezsVdayyQ34DD9Z1pLf2GRlt+lVnt6wHIewJwafJAA/QVeX4bWLGuHYlPwHNiwOZYBo/2L
	wlbPmUdbdQFxzfOCBkkucneBHTUrPiiGul6Db/bKOi+KSTefYXODhgWOy14c9tgE9zRznhlOecj
	ds5SK069riA5+21MCpgsU66swLquCd85GFF/BWX/ThwEMAUdWuiQXFxQKeLNckyAJGszWAjagmN
	nlG/ahRlB+JpJcS7utcPiV7YvUDjsNyJd4XbF2YVq689FP2KlcnS9k6L0uiStM0Q1zFcXeKA0IJ
	0KaQ8HIrIarNn
X-Received: by 2002:a05:6512:a91:b0:5b5:e8af:a5f2 with SMTP id
 2adb3069b0e04-5b8b660c24bmr1077002e87.20.1789582140468; Wed, 16 Sep 2026
 11:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260916164630.2563205-2-alex.kiernan@gmail.com>
In-Reply-To: <20260916164630.2563205-2-alex.kiernan@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 16 Sep 2026 11:08:48 -0700
X-Gm-Features: AcwNN1WArMa5H-AH3_5CL9-e2Q8bHI9SweNBTKAC70W0or1bcoR5Xuh-cfIxyuI
Message-ID: <CANx9H-D4bUmDPgQzWjP4vVd8oZATFLNaNavn3B=YLSu4EQipQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-requests: Add PACKAGECONFIG for chardet/charset-normalizer
To: alex.kiernan@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="000000000000c7756b065b9d8ff0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 18:09:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245992

--000000000000c7756b065b9d8ff0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 9:47=E2=80=AFAM Alex Kiernan via lists.openembedded=
.org
<alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:

> Requests 2.26 added charset-normalizer as an alternative to chardet,
> since 2.28 it is the default and chardet is the option. 2.32 makes both
> of them optional to minimise footprint, falling back to UTF-8.
>
> python3-charset-normalizer is a fraction of the size of python3-chardet,
> but only exists in meta-python, not oe-core, so is not selected here.
>

This is reason enough to move python3-chardet-normalizer to or-core IMHO.
But that could wait for 6.2=E2=80=A6

>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  meta/recipes-devtools/python/python3-requests_2.34.2.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-requests_2.34.2.bb
> b/meta/recipes-devtools/python/python3-requests_2.34.2.bb
> index 8230e8ce43b2..9e7dc14f6a84 100644
> --- a/meta/recipes-devtools/python/python3-requests_2.34.2.bb
> +++ b/meta/recipes-devtools/python/python3-requests_2.34.2.bb
> @@ -17,7 +17,6 @@ do_install:append:class-nativesdk() {
>
>  RDEPENDS:${PN} +=3D "\
>      python3-certifi \
> -    python3-chardet \
>      python3-compression \
>      python3-email \
>      python3-idna \
> @@ -27,6 +26,13 @@ RDEPENDS:${PN} +=3D "\
>      python3-urllib3 \
>  "
>
> +# Requests 2.26 added charset-normalizer as an alternative to chardet,
> since
> +# 2.28 it is the default and chardet is the option. 2.32 makes both of
> them
> +# optional to minimise footprint, falling back to UTF-8.
> +PACKAGECONFIG ?=3D "chardet"
> +PACKAGECONFIG[chardet] =3D ",,,python3-chardet"
> +PACKAGECONFIG[charset-normalizer] =3D ",,,python3-charset-normalizer"
> +
>  FILES:${PN}:append:class-nativesdk =3D "
> ${SDKPATHNATIVE}/environment-setup.d/python3-requests.sh"
>
>  CVE_PRODUCT =3D "requests"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245991):
> https://lists.openembedded.org/g/openembedded-core/message/245991
> Mute This Topic: https://lists.openembedded.org/mt/121281983/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c7756b065b9d8ff0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 16, 2026 at 9:47=E2=80=AFAM=
 Alex Kiernan via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;alex.kiernan=3D<a href=3D"mailto:gmail.com@lists.openembedd=
ed.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Requests 2.26 added charset-normali=
zer as an alternative to chardet,<br>
since 2.28 it is the default and chardet is the option. 2.32 makes both<br>
of them optional to minimise footprint, falling back to UTF-8.<br>
<br>
python3-charset-normalizer is a fraction of the size of python3-chardet,<br=
>
but only exists in meta-python, not oe-core, so is not selected here.<br>
</blockquote><div dir=3D"auto"><br>This is reason enough to move python3-ch=
ardet-normalizer to or-core IMHO. But that could wait for 6.2=E2=80=A6</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" t=
arget=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-requests_2.34.=
2.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests_2.34.2.bb</a> |=
 8 +++++++-<br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-request=
s_2.34.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests_2.34.2.b=
b</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-requests_2.3=
4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests_2.34.2.bb</a>=
<br>
index 8230e8ce43b2..9e7dc14f6a84 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-requests_2.34.=
2.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests_2.34.2.bb</a><b=
r>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-requests_2.34.=
2.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests_2.34.2.bb</a><b=
r>
@@ -17,7 +17,6 @@ do_install:append:class-nativesdk() {<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-certifi \<br>
-=C2=A0 =C2=A0 python3-chardet \<br>
=C2=A0 =C2=A0 =C2=A0python3-compression \<br>
=C2=A0 =C2=A0 =C2=A0python3-email \<br>
=C2=A0 =C2=A0 =C2=A0python3-idna \<br>
@@ -27,6 +26,13 @@ RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-urllib3 \<br>
=C2=A0&quot;<br>
<br>
+# Requests 2.26 added charset-normalizer as an alternative to chardet, sin=
ce<br>
+# 2.28 it is the default and chardet is the option. 2.32 makes both of the=
m<br>
+# optional to minimise footprint, falling back to UTF-8.<br>
+PACKAGECONFIG ?=3D &quot;chardet&quot;<br>
+PACKAGECONFIG[chardet] =3D &quot;,,,python3-chardet&quot;<br>
+PACKAGECONFIG[charset-normalizer] =3D &quot;,,,python3-charset-normalizer&=
quot;<br>
+<br>
=C2=A0FILES:${PN}:append:class-nativesdk =3D &quot; ${SDKPATHNATIVE}/enviro=
nment-setup.d/python3-requests.sh&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;requests&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#245991): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/245991" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/245991</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121281983/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/121281983/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000c7756b065b9d8ff0--

