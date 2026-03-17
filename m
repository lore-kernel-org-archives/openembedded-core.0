Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7561BFB5E9B
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:45:26 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66137.1773708314436653859
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M1f1XxGG;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64c31ca77b4so5453108d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773708313; cv=none;
        d=google.com; s=arc-20240605;
        b=LKMMjTNO8q3B8Yxeuv7qLpC/DueTCXaQn+aWY8iRSqWRgeT3A3Wz4XITJniTKHD/s1
         LTuUh+XntzPlAcMDKzoXY0U2jxp6/8rN2sAuKtTmkln9yj7WGCMwjtdpxbbzj1LU6u9x
         yu29vO3vZ4jqDULfV6POszupCP/SZVfpf0aVtbJ2/nyVIlLdgMKIL6ZdfCWWfkK8Vf0j
         VBlPUiSkzVwo8AMcHW0FySMkbLRS883SnNyey0eNP3bQBlqhMk57FUE6gp7Lstlw5l6H
         Mjd2raISsa8UKs7e/PuLsUk9AIu6hvmGTe0MCQmep9A2mt1fnjSecIdnBFkDY7cxosB0
         ruwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cnRElu68pgvr3qL7cq9pGS9eLocN2lUnI/s2b/bFVSg=;
        fh=Bwcj6kAs3AYnqc6ZaGzuuA5GE2EyA/HuIyUMiAHm0WI=;
        b=VwONc2TSRFD4c3PsaYj6L+5PSgw52G2fbVS8zopSzj2zO5Z0udp8xhyucxPFAG/AVV
         8JsxcH5tmBF8zRifm3VzPAfni97osyNTmb7+ZBsI0B8h11HuD/D6PZZLFFDyWmEJkvKa
         CJ3w5/onM9V072qs1XKP7Tz5PJn4vvzYW3/+bxgavrpNn9kc3BYqmAwP7oXlP1F9J6dj
         jOFC0+w5gwcv2zYvsDlXjr46872kf1MxK0PX+RG/WsfYvMTShAS3Y03K9KwIfvj4yWn2
         0AvO+ixZO6fEh/CsnvOLwt/3CKaHfyAUW1AN2y9PYUb9A2NFr6xgSCMo2Wzny/jwEhkx
         hV8g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773708313; x=1774313113; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cnRElu68pgvr3qL7cq9pGS9eLocN2lUnI/s2b/bFVSg=;
        b=M1f1XxGGTYuI9paHVlX+TsNYMJEOFRmL98iLRvJ1+CqGqBkpG3uCGq1rLd4RmLgV0/
         V4NBNAp5mf8vrYwddIG7ccw/YlQQcNyXk9MPB4OxtGbyWEfpJabwmuGozZDc8vDsBEQf
         UpLW0cI16VlUGR9WiAqbjn8clLopu0kn6ZnykeO6XcZtMunqysDhMkh0R943t+ogYvTh
         BWCOoxoGUrn4F7cP+e6Gg8xy3+4yZdbytbKk9rMujxViagNAfLtAZNbGhWl0/ewk0OPR
         KjqqnJT20ITqi0oJx2TaFA2roAhT11ozyrZ/j6EcY4FKW8F42lRYLZFXWwbJmVjYr/RB
         70/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773708313; x=1774313113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnRElu68pgvr3qL7cq9pGS9eLocN2lUnI/s2b/bFVSg=;
        b=h/YRLbg1yA4dZEZEXJ9Qsdo2rMwXtl4gtRvosSgzlhxh1quf17UBKtfRyk7TCkgxRD
         bor0OsS/2NLgTaCvuBA9kqbj/hpP1vx+FQOYyfv6uESBGdRgcun5U1KwWJ0lEuhpAIlA
         kfdIxVS36sHzQNx2+JuZDbmbbBa5EQiCURqfgSONDQJCN+VUs15gPjsV2aF14bRoB3JP
         G440Hykgw+G+6nwmNHfjlT2Y087BjeCdy7ulo2HIsOOLG3zFiw7sK6mmmyT8yKsecqee
         YOHJIoaBup5I0lZ1o2kDdVIon7vtE06+2wb3Q2YSH7R2j7G11WhpcTvG54pVFK4xQhl0
         OaEQ==
X-Gm-Message-State: AOJu0Yxad+xm7Y7F4M5RwcmqLwF7AjNaNj3mKNSOSDAoGmNEusVPjtV2
	7Z/3t2HioR/y6SCWBVPE3lJX+Ley3E+exPcgCpsEMJ5tEr20xjex9frU8tuJLQYdzg3hV6YXXdS
	BaBfosXMH9bleZQasQYTlqk8XFuI+F38=
X-Gm-Gg: ATEYQzyxcQ/a9R0CZAEejKbwbMdCMOLPT0D/+CpU2dqyqtKKxGSYct8Tm2oKNOF2tKO
	fSGNahDMZ1wkTzG4RDEfAI3nkujhiCZWevnV5hiiEkmxz1x2m0PTn1a9VQGWP2X85huGmtrjs6s
	0NiqFCoyY3SHKZeg3b9cxLv7CGFCmVqchsRbqFWtPmO5/Ind+HDE4zVGpayxGMMYX/nDs9xg437
	Tgqn3Piqxg2Y3FTJhgrAUZXpMDLrbqZdMPf4CmwdOGIDoT+UWr0Bhs2xsXb1l7dhXuf738weaJK
	edBuomojRo0Uy2Hslub62JyuNeD8FBN6qzZW+FQ2SuG8o1XQOr6V0FsNOdaLoykDqfzAQlVBgwU
	PyhSm0SlFhLPooJtAECFrSclG
X-Received: by 2002:a05:690e:24d4:b0:64c:97bc:52bf with SMTP id
 956f58d0204a3-64e63074c58mr11214847d50.43.1773708313523; Mon, 16 Mar 2026
 17:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com> <20260317-fix-invalid-appends-v2-5-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-5-5c65ae5787d9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Mar 2026 17:44:46 -0700
X-Gm-Features: AaiRm53H-EathlgqB4xLRKv0fmuTdU5GGMudMS48LtWky-cZRhxoYpCn-bDY1hU
Message-ID: <CAMKF1spbt7evovSp1rYT+XxCi_y9JALseR-3EqRw9UA=6b_M3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 05/12] no-gplv3.inc: Convert confusing
 appends to override syntax
To: michalwsieron@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f677eb064d2da56a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233289

--000000000000f677eb064d2da56a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 5:03=E2=80=AFPM Michal Sieron via lists.openembedde=
d.org
<michalwsieron=3Dgmail.com@lists.openembedded.org> wrote:

> While in this case `CORE_IMAGE_EXTRA_INSTALL::pn-* +=3D` wouldn't result
> in any unwanted override, there is no guarantee there won't be a change,
> which would be hidden by this override. To avoid any surprises in the
> future let's use `:append:pn-* =3D` syntax here.
>
> Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
> ---
>  meta/conf/distro/include/no-gplv3.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/distro/include/no-gplv3.inc
> b/meta/conf/distro/include/no-gplv3.inc
> index 705e05319a..2034204035 100644
> --- a/meta/conf/distro/include/no-gplv3.inc
> +++ b/meta/conf/distro/include/no-gplv3.inc
> @@ -18,9 +18,9 @@ PACKAGECONFIG:remove:pn-bluez5 =3D "readline"
>  # dnf pulls in gpg which is gpl3; it also pulls in python3-rpm which
> pulls in rpm-build which pulls in bash
>  # so install rpm but not dnf
>  IMAGE_FEATURES:remove:pn-core-image-weston =3D "package-management"
> -CORE_IMAGE_EXTRA_INSTALL:pn-core-image-weston +=3D "rpm"
> +CORE_IMAGE_EXTRA_INSTALL:append:pn-core-image-weston =3D " rpm"
>  IMAGE_FEATURES:remove:pn-core-image-full-cmdline =3D "package-management=
"
> -CORE_IMAGE_EXTRA_INSTALL:pn-core-image-full-cmdline +=3D "rpm"
> +CORE_IMAGE_EXTRA_INSTALL:append:pn-core-image-full-cmdline =3D " rpm"
>

while this patch is ok, I wonder if hardcoding rpm is the right thing here
as it might be not right
for distros not using rpm backend e.g. ipk or deb backends instead.


>
>  # matchbox-terminal depends on vte, which is gpl3
>  CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston =3D "matchbox-termin=
al"
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233278):
> https://lists.openembedded.org/g/openembedded-core/message/233278
> Mute This Topic: https://lists.openembedded.org/mt/118356437/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f677eb064d2da56a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 16,=
 2026 at 5:03=E2=80=AFPM Michal Sieron via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;michalwsieron=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">While in =
this case `CORE_IMAGE_EXTRA_INSTALL::pn-* +=3D` wouldn&#39;t result<br>
in any unwanted override, there is no guarantee there won&#39;t be a change=
,<br>
which would be hidden by this override. To avoid any surprises in the<br>
future let&#39;s use `:append:pn-* =3D` syntax here.<br>
<br>
Signed-off-by: Michal Sieron &lt;<a href=3D"mailto:michalwsieron@gmail.com"=
 target=3D"_blank">michalwsieron@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/no-gplv3.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/no-gplv3.inc b/meta/conf/distro/inclu=
de/no-gplv3.inc<br>
index 705e05319a..2034204035 100644<br>
--- a/meta/conf/distro/include/no-gplv3.inc<br>
+++ b/meta/conf/distro/include/no-gplv3.inc<br>
@@ -18,9 +18,9 @@ PACKAGECONFIG:remove:pn-bluez5 =3D &quot;readline&quot;<b=
r>
=C2=A0# dnf pulls in gpg which is gpl3; it also pulls in python3-rpm which =
pulls in rpm-build which pulls in bash<br>
=C2=A0# so install rpm but not dnf<br>
=C2=A0IMAGE_FEATURES:remove:pn-core-image-weston =3D &quot;package-manageme=
nt&quot;<br>
-CORE_IMAGE_EXTRA_INSTALL:pn-core-image-weston +=3D &quot;rpm&quot;<br>
+CORE_IMAGE_EXTRA_INSTALL:append:pn-core-image-weston =3D &quot; rpm&quot;<=
br>
=C2=A0IMAGE_FEATURES:remove:pn-core-image-full-cmdline =3D &quot;package-ma=
nagement&quot;<br>
-CORE_IMAGE_EXTRA_INSTALL:pn-core-image-full-cmdline +=3D &quot;rpm&quot;<b=
r>
+CORE_IMAGE_EXTRA_INSTALL:append:pn-core-image-full-cmdline =3D &quot; rpm&=
quot;<br></blockquote><div><br></div><div>while this patch is ok, I wonder =
if hardcoding rpm is the right thing here as it might be not right</div><di=
v>for distros not using rpm backend e.g. ipk or deb backends instead.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0# matchbox-terminal depends on vte, which is gpl3<br>
=C2=A0CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston =3D &quot;matchbo=
x-terminal&quot;<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233278): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233278" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233278</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118356437/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118356437/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f677eb064d2da56a--

