Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B78D10F9302
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 21:14:54 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1769.1774991685950335608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 14:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pGUKcEM7;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78fc4425b6bso28108967b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 14:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774991685; cv=none;
        d=google.com; s=arc-20240605;
        b=Ar06AlYFtS14XIa1OF68SignAPSXE4WwkBwnHBM6YjK3ImMGL0jinIVBNg4vwgpjvj
         3AbfUMOu8kp5WPqy15fI6FKGMtW/kOBF8pD2PCNAGWHZlNhTj/DngfR2eIo5UXTA40pS
         yhewEiy8AH4saMu2Sge075AtS9DLsNW4nZTqNHRf0gPZ1cucpvDh5ewOTQGjam4mrCoT
         s4BI3UWSy8ZfZ+IDKQUaaOynhAsILCrtZdGUvyjMnHx8qModDk7cHVt7TXX9PBpDOIrt
         cfV+L2le5TrC5zt45iOvB/pvJPZnKtxM0f2c+PMHusA8smo98H/FUX5l/F2HRzdms3qC
         64Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dhcxC8Sc5O+uXXCRPBjfaIYd6323kjmTdO94LTULlxA=;
        fh=qoYv191RENe7+aBHJb2FgjNGrkVEmdAiGQiwISUlUek=;
        b=fHLUe0SV4imTCro+ufZGRdoavDLsQQiozjP9dkt0i58h531b5NLm1HPJF2SuOXqy0y
         3WjWrFb7R8kTzBVPNw+rKGpZ2nnWHZ3J/wa4JNxG9oag9lAcQhsup4dmxRRUM1DtS67L
         3Q4gECjD/SAW2qQ3/jsEsDqYMVp7aoH2YydSdv1bPJSCXYWC79vEqfMMwgGWkptiCB5n
         XRL012Pe8A9F7VuLp5tC0Lu+heOInzz0i4f/W3sADwF8N8G/8tx2FvyFFChdvaSOh5SB
         xD2LK0b91OSNmNuJ+YLHiW2xisxYAeMWxdtmn6SfOY3nY+HOkZ2LsVitInOFYlLP76od
         OqaA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774991685; x=1775596485; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dhcxC8Sc5O+uXXCRPBjfaIYd6323kjmTdO94LTULlxA=;
        b=pGUKcEM78Kzq1uAkmryQZ3D6Ohi/oz6MFH4ow7WCUWp/vGBt5TjB0PU9x+5MgkUlRE
         UnZMz7PoQln5fNcwPoHAtqNzjlzxRzpKuA50dvfJuZ8fi0zNmdm4nO54y0Rvn1hb+sdv
         k5qwquadBp9AHgxBgqBaPedQXBFRJY8LLVr12aSa04auOWPho5hdD4sHJHnYzhAJJoaV
         pth1bl60TKdfIwR65r9u+/pvIOgjNuRa1zVz9r7cJTFYxHD2IKfeNOe8e75SfdhCtvAD
         F/nbOvE1+gFyduDrQeO4wZOkIOYgeNMxp3e6mK5DZDLCr33WxOoSTUJZEjClUsc2zTCP
         nFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991685; x=1775596485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhcxC8Sc5O+uXXCRPBjfaIYd6323kjmTdO94LTULlxA=;
        b=HX1d42jZZh+NF48wWrQCwEwAOK0Y6peRy489wWe2k+VKzN/CrP8ZyKWRTbTU7PlzvD
         +KWA9Qk2F8BoOYdLohNY8FnR9Q6K3eM3+06rihOori0PT82WEX0RT9grDckiIpKej3kG
         3ihc/+2a+NU8Nwfwwk8yc++eG4ZnuGcM9DBpANc9K6iYwR5fggSj6kHqlYpPSmnltk9+
         ILGTeHXeNFs9B3pCi+Uiv2sfaR0f286QFsZORHOEA831aOxib/p39ZDMvarLKeN2lPLl
         l1BJFfSVmRx6wecPisPhyqnc0bqkuPnjhw6m/8xHKs64aKqFVrN4SkzRdGCcPZ/ULtsT
         Hoew==
X-Gm-Message-State: AOJu0YwEyi3Rt0cmi9KT2J51GgPh/h1PuGo9R+TFRRWDf3GkW+ApmRKK
	tp96I7XCZHexNetJKP4s7E8YbV6GIBrlzb/IfjVwQjQY64Aj5y6jQnoDaS8zCfLgofAhd4Tkku4
	EljcLRbqg8FE8hUoOCh6qyE7OYhN9TZY=
X-Gm-Gg: ATEYQzzx9Me0wdEce6wL0QpbRPkYz3K0mYM41L8PNb6lsDxevJVkJfimOM7bM9v/3ZG
	WETUgXvtzar7OxR5eRuYCkYoCXo0QcMRhyg+gMnhfTpvws2LzaFaTLbRN87argMmSdmgOW98PQw
	1+o8hpnWpgEpGReQ43CeztwpIzoF4nJHDp3Z28WDHWc2Y519GGWlCrsMMohP0njhXKUnRTBK1iP
	kGJF0x9QPqoA5wWJ/Rqh0w42k5gcvaRLSiDS6/dWkC9YeZzewiru4FkB26IEX62JDuKlIoQxjdb
	Tumot1rMTeaOvsEacIzUoXTbzsWublKXUgm85GB8ywJsEN0aJAqh1yGkCdXg068OFwSC7ikj99Y
	uAWxVckAn0/FnbwL6g+3gseMkNCVe3db49BV7
X-Received: by 2002:a05:690c:4424:b0:79a:cd66:d92 with SMTP id
 00721157ae682-7a2139e2451mr9541127b3.56.1774991684971; Tue, 31 Mar 2026
 14:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260331203154.674733-1-thomas.perrot@bootlin.com>
In-Reply-To: <20260331203154.674733-1-thomas.perrot@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Mar 2026 14:14:18 -0700
X-Gm-Features: AQROBzBQhZ8kBlqYflvq9_vN4ds6fz5PWbiQcqYQ77sGTYESg4xpw8Gj5S1SUn8
Message-ID: <CAMKF1soG5n-Lser8t0V_PMDXSacq+La4byrxbx4M-yY5oURWzA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] lto: disable expect to workaround GCC LTO
 debug_line_str bug
To: thomas.perrot@bootlin.com
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000dcaf6a064e58741b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 21:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234317

--000000000000dcaf6a064e58741b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 1:34=E2=80=AFPM Thomas Perrot via lists.openembedde=
d.org
<thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:

> From: Thomas Perrot <thomas.perrot@bootlin.com>
>
> When expect is built with LTO, GCC correctly passes -ffile-prefix-map
> to lto1 during link-time recompilation. However, when lto1 incorporates
> debug info from a linked dependency (tcl8), the directory entries in
> .debug_line_str from that dependency are not subject to prefix
> remapping, leaving a raw TMPDIR path in the split debug symbols of
> libexpect5.45.4.so:
>
>   .debug_line_str: /src/build/tmp/work/.../tcl8/8.6.17/build
>
> This is specific to packages linking against tcl8 with LTO and is not
> an incompatibility between LTO and expect itself.
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
>
> ---
> Changes in v2:
> - Fix commit message
> - Link to v1:
> https://lore.kernel.org/all/20260331081246.73406-1-thomas.perrot@bootlin.=
com/
> ---
>  meta/conf/distro/include/lto.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/distro/include/lto.inc
> b/meta/conf/distro/include/lto.inc
> index 54983412bc14..8c13601a4df6 100644
> --- a/meta/conf/distro/include/lto.inc
> +++ b/meta/conf/distro/include/lto.inc
> @@ -4,6 +4,7 @@
>  #
>
>  # Disable LTO for following packages
> +LTO:pn-expect =3D ""
>

I think, along with package name override, it should use toolchain-gcc
override as well.


>  LTO:pn-glibc =3D ""
>  LTO:pn-gcc-runtime =3D ""
>  LTO:pn-libgcc-initial =3D ""
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234315):
> https://lists.openembedded.org/g/openembedded-core/message/234315
> Mute This Topic: https://lists.openembedded.org/mt/118604439/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000dcaf6a064e58741b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 31,=
 2026 at 1:34=E2=80=AFPM Thomas Perrot via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;thomas.perrot=3D<a href=3D"mailto:=
bootlin.com@lists.openembedded.org">bootlin.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.com" target=3D"_=
blank">thomas.perrot@bootlin.com</a>&gt;<br>
<br>
When expect is built with LTO, GCC correctly passes -ffile-prefix-map<br>
to lto1 during link-time recompilation. However, when lto1 incorporates<br>
debug info from a linked dependency (tcl8), the directory entries in<br>
.debug_line_str from that dependency are not subject to prefix<br>
remapping, leaving a raw TMPDIR path in the split debug symbols of<br>
<a href=3D"http://libexpect5.45.4.so" rel=3D"noreferrer" target=3D"_blank">=
libexpect5.45.4.so</a>:<br>
<br>
=C2=A0 .debug_line_str: /src/build/tmp/work/.../tcl8/8.6.17/build<br>
<br>
This is specific to packages linking against tcl8 with LTO and is not<br>
an incompatibility between LTO and expect itself.<br>
<br>
Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.co=
m" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
<br>
---<br>
Changes in v2:<br>
- Fix commit message<br>
- Link to v1: <a href=3D"https://lore.kernel.org/all/20260331081246.73406-1=
-thomas.perrot@bootlin.com/" rel=3D"noreferrer" target=3D"_blank">https://l=
ore.kernel.org/all/20260331081246.73406-1-thomas.perrot@bootlin.com/</a><br=
>
---<br>
=C2=A0meta/conf/distro/include/lto.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lt=
o.inc<br>
index 54983412bc14..8c13601a4df6 100644<br>
--- a/meta/conf/distro/include/lto.inc<br>
+++ b/meta/conf/distro/include/lto.inc<br>
@@ -4,6 +4,7 @@<br>
=C2=A0#<br>
<br>
=C2=A0# Disable LTO for following packages<br>
+LTO:pn-expect =3D &quot;&quot;<br></blockquote><div><br></div><div>I think=
, along with package name override, it should use toolchain-gcc override as=
 well.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
=C2=A0LTO:pn-glibc =3D &quot;&quot;<br>
=C2=A0LTO:pn-gcc-runtime =3D &quot;&quot;<br>
=C2=A0LTO:pn-libgcc-initial =3D &quot;&quot;<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#234315): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/234315" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/234315</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118604439/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118604439/1997914</a><br>
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

--000000000000dcaf6a064e58741b--

