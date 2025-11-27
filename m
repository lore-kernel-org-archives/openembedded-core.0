Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94751CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 17:17:58 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23414.1764263868219459892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 09:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ldG1k5Vw;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42bb288c219so993673f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 09:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764263866; x=1764868666; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DUKEtbvjWGWSm2tzBygrUfyYFHpxxCUw+WlQN/OEqfI=;
        b=ldG1k5Vwu577xpldXw5xqPPvPS/ugRF4gafIsQJIiVF7ky3wNII7AR2+1JIjvapo3O
         t74j1gHEytuij7cFovHosZGGCZwPXzbTMbMjtbjxv6RVbaYZZxZSZnyCbb/QxQ4wKwCX
         n6rvSVSDb2D5SjXNl6xGfCTWl2yQgL8Buh/ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764263866; x=1764868666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUKEtbvjWGWSm2tzBygrUfyYFHpxxCUw+WlQN/OEqfI=;
        b=IJb0t+/cYIYqfZeTXLoyQgOdsqgLGv0ZCNnATbP7hQaOacSpuSM+4mQALHI1+Uz/k6
         /h+mTYvqGrAz1ltteWQz9CUZGNKs6fldVsXSdc1R6DqewOPDM0pUag4O5BWHXYa4lAPu
         eI/zqwTOafu23kCVmVq7VHhxGa6RrK8k7MoTULCiS0bRfouetLCC6vdSHNXk5BHNsIpx
         PzYbqlxWKK4qwX8OR3KcRioOEuHq1Gkulu1OGz/UWkxY2iNxHU+RTrbWksKLiE0zkLM0
         Mm/RcSL8aYNSxmqm1Qb8n0vk08i5OizNUcCaqcacIi8vuS/FthCpNkCLm7EFjK8q+K/G
         mOBQ==
X-Gm-Message-State: AOJu0Yxp81rgbEBxhyuWe3ymzGgj0zx4aNa3Ov2HqYlRX4STjB+aVELx
	RfJ+BMpPbagXMOL0IqwIuqQcUblkBtgSwrJ9+vS7jm63c2S1kfxFbX3egNMm2/lMtAf4UI+poFi
	7DhnTmlyQ6zC35H8FmJ1zZ4ZNpSkyIVFkInqBtS4v4F6lFDTNC9MaFEU=
X-Gm-Gg: ASbGncsW7Jt239X36eqZRR6sfK6wYaNZ+j4PNXNq71aJoEaCT23pOtVIc6z7/hdgeyy
	IlBtk20a3QGlTTOdEcchr36WB++Rztwx07wXuCCTDZWYX/DiwOYAgXUZzwENn/7OPaM+BQoBtrf
	BLoMRu/CzEmvKJo13i2ySxKeLtF/O/qfc9PBWUmBZvx86MQtYb0YyhJfDQleC7B7crrd8576NRK
	d//AnU8kjdFCQzRvHkGaxGwEjk+2MJT/JwG4EhSLwzFrAFniMULD7MLsq6X1mImjTSJ4TGkzbOS
	Wbvonz29Ad3e8FXi8HzBuGGSgRqE
X-Google-Smtp-Source: AGHT+IHQpHtvpBxwxBBG3z3eFmp/CnXNkfVSITIci7GXGDK6n5wZm3l+oCJnr+mHoN8awHVQwL9C6cqKGaf75m1W5lI=
X-Received: by 2002:a05:6000:2013:b0:42b:3ccc:91d6 with SMTP id
 ffacd0b85a97d-42cc1ac9c98mr25414307f8f.7.1764263866454; Thu, 27 Nov 2025
 09:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20251127164443.2285753-1-raj.khem@gmail.com>
In-Reply-To: <20251127164443.2285753-1-raj.khem@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 27 Nov 2025 18:17:20 +0100
X-Gm-Features: AWmQ_bmxfckevMvYB7_Dc9GGJw_3NweNh8SLllyd50ov_etiq5rsTtGOwEjgTrA
Message-ID: <CAMSfU+4b=nNnhhLRfRAZQNCXCRmFwX-YefVegrQpzzPE7ujbaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] autoconf: Raise line length limit for sed/awk
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000cea38064496b14d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 17:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226853

--0000000000000cea38064496b14d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 27 nov. 2025 =C3=A0 17:44, Khem Raj via lists.openembedded.org <raj=
.khem=3D
gmail.com@lists.openembedded.org> a =C3=A9crit :

> Latest autoconf is splitting long cmd lines in config.status
> it generates using sed/awk to have compatibility with
> platform like HPUX,Solaris,AIX which is understandable given
> autotools try to achieve wider portability, however, this does
> mean that in OE builds we might get these newlines added in
> places dividing commands including buildpaths in them and the
> methods deployed to scrub them from output artifacts will fail
> since the string is now on two lines resulting in build QA to
> pass but the strings do sneak in affecting reproducibility
> one such example is e2tools recipe in meta-filesystems and there
> perhaps are more
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

For the impact on e2tools:
Tested-by: Yoann Congal <yoann.congal@smile.fr>
=3D> It does indeed make it reproducible by letting the sed replacing non
reproducible paths work.


> ---
>  ...-command-limit-to-prevent-line-wrapp.patch | 41 +++++++++++++++++++
>  .../autoconf/autoconf_2.72.bb                 |  3 +-
>  2 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-lim=
it-to-prevent-line-wrapp.patch
>
> diff --git
> a/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-l=
imit-to-prevent-line-wrapp.patch
> b/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-l=
imit-to-prevent-line-wrapp.patch
> new file mode 100644
> index 00000000000..41468ba316c
> --- /dev/null
> +++
> b/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-l=
imit-to-prevent-line-wrapp.patch
> @@ -0,0 +1,41 @@
> +From 139f757a6244d3b1e07f7fddc6d07d9c17f45313 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 25 Nov 2025 21:03:38 -0800
> +Subject: [PATCH] Increase awk/sed command limit to prevent line wrapping
> +
> +Autoconf 2.70+ wraps long variable assignments in config.status
> +using backslash-newline continuations. This breaks when LDFLAGS
> +or other variables contain special characters.
> +
> +Increase _AC_SED_CMD_LIMIT from 99 and _AC_AWK_LITERAL_LIMIT
> +from 148 to 4000 to prevent wrapping.
> +
> +Upstream-Status: Inappropriate [OE-Specific]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + lib/autoconf/status.m4 | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/autoconf/status.m4 b/lib/autoconf/status.m4
> +index 2bfaf32..be444b2 100644
> +--- a/lib/autoconf/status.m4
> ++++ b/lib/autoconf/status.m4
> +@@ -297,7 +297,7 @@ AC_DEFUN([AC_CONFIG_FILES], [_AC_CONFIG_FOOS([FILES]=
,
> $@)])
> + # Some seds have small command number limits, like on Digital OSF/1 and
> HP-UX.
> + m4_define([_AC_SED_CMD_LIMIT],
> + dnl One cannot portably go further than 99 commands because of HP-UX.
> +-[99])
> ++[4000])
> +
> +
> + # _AC_AWK_LITERAL_LIMIT
> +@@ -307,7 +307,7 @@ dnl One cannot portably go further than 99 commands
> because of HP-UX.
> + #
> + # Some awk's have small limits, such as Solaris and AIX awk.
> + m4_define([_AC_AWK_LITERAL_LIMIT],
> +-[148])
> ++[4000])
> +
> +
> + # _AC_OUTPUT_FILES_PREPARE
> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
> b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
> index b599f270c79..20197d6f793 100644
> --- a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
> +++ b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "A GNU tool that produce shell scripts to automatically
> configure software"
> -DESCRIPTION =3D "Autoconf is an extensible package of M4 macros that
> produce shell scripts to automatically \
> +DESCRIPTION =3D "Autoconf is an extensible package of M4 macros that
> produce shell scripts to automatically \
>  configure software source code packages. Autoconf creates a configuratio=
n
> script for a package from a template \
>  file that lists the operating system features that the package can use,
> in the form of M4 macro calls."
>  LICENSE =3D "GPL-3.0-or-later"
> @@ -19,6 +19,7 @@ SRC_URI =3D " \
>             file://preferbash.patch \
>             file://autotest-automake-result-format.patch \
>             file://man-host-perl.patch \
> +
> file://0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch \
>  "
>  SRC_URI:append:class-native =3D " file://no-man.patch"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226850):
> https://lists.openembedded.org/g/openembedded-core/message/226850
> Mute This Topic: https://lists.openembedded.org/mt/116503258/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000000cea38064496b14d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 27=
 nov. 2025 =C3=A0=C2=A017:44, Khem Raj via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail=
.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">L=
atest autoconf is splitting long cmd lines in config.status<br>
it generates using sed/awk to have compatibility with<br>
platform like HPUX,Solaris,AIX which is understandable given<br>
autotools try to achieve wider portability, however, this does<br>
mean that in OE builds we might get these newlines added in<br>
places dividing commands including buildpaths in them and the<br>
methods deployed to scrub them from output artifacts will fail<br>
since the string is now on two lines resulting in build QA to<br>
pass but the strings do sneak in affecting reproducibility<br>
one such example is e2tools recipe in meta-filesystems and there<br>
perhaps are more<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br></blockquote><div><br></div><div>For=
 the impact on e2tools:</div><div>Tested-by: Yoann Congal &lt;<a href=3D"ma=
ilto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt;</div><div>=3D&gt;=
 It does indeed make it reproducible by letting the sed replacing=C2=A0non =
reproducible=C2=A0paths work.</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
---<br>
=C2=A0...-command-limit-to-prevent-line-wrapp.patch | 41 ++++++++++++++++++=
+<br>
=C2=A0.../autoconf/<a href=3D"http://autoconf_2.72.bb" rel=3D"noreferrer" t=
arget=3D"_blank">autoconf_2.72.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +-<br>
=C2=A02 files changed, 43 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-Incre=
ase-awk-sed-command-limit-to-prevent-line-wrapp.patch<br>
<br>
diff --git a/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-=
command-limit-to-prevent-line-wrapp.patch b/meta/recipes-devtools/autoconf/=
autoconf/0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch<br=
>
new file mode 100644<br>
index 00000000000..41468ba316c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command=
-limit-to-prevent-line-wrapp.patch<br>
@@ -0,0 +1,41 @@<br>
+From 139f757a6244d3b1e07f7fddc6d07d9c17f45313 Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Tue, 25 Nov 2025 21:03:38 -0800<br>
+Subject: [PATCH] Increase awk/sed command limit to prevent line wrapping<b=
r>
+<br>
+Autoconf 2.70+ wraps long variable assignments in config.status<br>
+using backslash-newline continuations. This breaks when LDFLAGS<br>
+or other variables contain special characters.<br>
+<br>
+Increase _AC_SED_CMD_LIMIT from 99 and _AC_AWK_LITERAL_LIMIT<br>
+from 148 to 4000 to prevent wrapping.<br>
+<br>
+Upstream-Status: Inappropriate [OE-Specific]<br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ lib/autoconf/status.m4 | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/lib/autoconf/status.m4 b/lib/autoconf/status.m4<br>
+index 2bfaf32..be444b2 100644<br>
+--- a/lib/autoconf/status.m4<br>
++++ b/lib/autoconf/status.m4<br>
+@@ -297,7 +297,7 @@ AC_DEFUN([AC_CONFIG_FILES], [_AC_CONFIG_FOOS([FILES], =
$@)])<br>
+ # Some seds have small command number limits, like on Digital OSF/1 and H=
P-UX.<br>
+ m4_define([_AC_SED_CMD_LIMIT],<br>
+ dnl One cannot portably go further than 99 commands because of HP-UX.<br>
+-[99])<br>
++[4000])<br>
+ <br>
+ <br>
+ # _AC_AWK_LITERAL_LIMIT<br>
+@@ -307,7 +307,7 @@ dnl One cannot portably go further than 99 commands be=
cause of HP-UX.<br>
+ #<br>
+ # Some awk&#39;s have small limits, such as Solaris and AIX awk.<br>
+ m4_define([_AC_AWK_LITERAL_LIMIT],<br>
+-[148])<br>
++[4000])<br>
+ <br>
+ <br>
+ # _AC_OUTPUT_FILES_PREPARE<br>
diff --git a/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.72=
.bb" rel=3D"noreferrer" target=3D"_blank">autoconf_2.72.bb</a> b/meta/recip=
es-devtools/autoconf/<a href=3D"http://autoconf_2.72.bb" rel=3D"noreferrer"=
 target=3D"_blank">autoconf_2.72.bb</a><br>
index b599f270c79..20197d6f793 100644<br>
--- a/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.72.bb" re=
l=3D"noreferrer" target=3D"_blank">autoconf_2.72.bb</a><br>
+++ b/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.72.bb" re=
l=3D"noreferrer" target=3D"_blank">autoconf_2.72.bb</a><br>
@@ -1,5 +1,5 @@<br>
=C2=A0SUMMARY =3D &quot;A GNU tool that produce shell scripts to automatica=
lly configure software&quot;<br>
-DESCRIPTION =3D &quot;Autoconf is an extensible package of M4 macros that =
produce shell scripts to automatically \ <br>
+DESCRIPTION =3D &quot;Autoconf is an extensible package of M4 macros that =
produce shell scripts to automatically \<br>
=C2=A0configure software source code packages. Autoconf creates a configura=
tion script for a package from a template \<br>
=C2=A0file that lists the operating system features that the package can us=
e, in the form of M4 macro calls.&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-3.0-or-later&quot;<br>
@@ -19,6 +19,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://preferbash.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://autotest-automake-result-f=
ormat.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://man-host-perl.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001=
-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI:append:class-native =3D &quot; file://no-man.patch&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226850): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226850" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226850</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116503258/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116503258/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000000cea38064496b14d--

