Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EF4F589CF
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 13:06:35 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19109.1776949591932953670
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 06:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kFnrmIsf;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so2430305a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 06:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776949591; cv=none;
        d=google.com; s=arc-20240605;
        b=OMFeCvG/Y9nsNt+0b5oIiiMFCGSc74GMWFxBuOiYZdDxFrEoRyGgyoAYcqVcJ5daVd
         rp/ZPn20b1Usfg/WpRwNQUgd2882v1BmkZmobIoksXValV3QgZbyjMqtnvgaN/1cS3J3
         Feyuax928EDgUiNMi/SK/OVRXBGAOqEz52nPLcIn5uOwUk+LKC0j6aaUMmIoCaIUkdNe
         xYlgNBjwKwqKXUTIh4vN16niOVVAujSruS66O6S5MmMRDqLu0XN37YxUKb5szWSaVuQ2
         k+GGQajuXbEQ7I7tux04IpikN6xuX6nit3S4vQ2JcPs+QLJ61LVtk9lly1W6MwxgcV+G
         ETww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6HjQdG395diwDzX7bTPbgVzafJso9+UH/PnFL2+xvkY=;
        fh=gKazuwcRV0C7JnWev6TTnuEmXTM0c/NrH11CDHYY4xc=;
        b=Pp/SL3jkZAQH70epb3rnB8rHNaxugfibIYmhLNKL9sIL/lfOZVfjD1NsZ4ZgLUKi7l
         IZ0BAw1GcZXG5kJi6z24JLOXQ+pwlUj1N283o8e0B5T4lbFWagwAmuQcpCOZzj5b13Hz
         8e5ZClX22ABWi1QwkslfZPFiG75B4F44K27Tb3c0YchvVGQ3TxlxsWjCcGVQrwEHHHlz
         85aBQTMWUFdJJsW2N8VctXkE9/W7UYlQsaHT4sX60ZgqeNEUpu2WVZ3Ai1fPpgq5RwkR
         qgmQxXiHS7KImbW2ZY4tVXNypuhu5iNJFLneqDIBI7FRzoC5pnKnowt8EuZVdgDAeLnz
         uvww==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949591; x=1777554391; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6HjQdG395diwDzX7bTPbgVzafJso9+UH/PnFL2+xvkY=;
        b=kFnrmIsfM4f6rHMfkRbYQfSycsSLzsYpMwu/Pv6KiQXtN5PARF+wg4SrI/1HpwYhdK
         wKLX7Cvuau6/VfKpuYQEoTtZKccSU1Dhe999fAGwHsIwvtvigV3B+6bIyG3qNnrUUXoN
         K07BdJkT6kgeJ9F5coz0GaKgIGyPK344Ki1VwlGChSB8F08wytSsguDY2hvJ86UjIEQ8
         +MOnDTnj7PmYZYhzhA050kI3gYiem1rMVGXdrYwnslECO/47mphNuwvXNrPcezIEHZT9
         tMGKYwO9A6VVlxChludTzCywqFF4Nveg/DKSdjEvYZRIH5LE56aeOZ95ua9b3h1JvW8T
         A2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949591; x=1777554391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HjQdG395diwDzX7bTPbgVzafJso9+UH/PnFL2+xvkY=;
        b=aKOqL/l0VrFm68DQ/3Qco9Uesd6k4lgNt+/dbcPDS7WMSLsRu43g2J0Sr6/WH9Xtpk
         vw2ddF/MZfvGDdaD/XkTgMMT/D8GOiFcdJYrQ6Zo38UNouop8Pdaz726qRQ4S2JMTjEi
         Q5nZOC65xIEs4H4Q/4KTlAWn1TDQTXuLiX8Cg9buwj8ItRf3OpS0pkhAaDFjssj7l1yU
         D13JhzUiJrwpeAeBNpz0MP9wd44e1vLubJKSNrE/GHy7cOgGlVaUMIZnzlw5QY6jqzQJ
         ho+d73jy9n2UVnxeOFjqH3Gr+eOfnRYr5WA4oZ5pbt1RU7FhW8PDPtupoVxNJsBY8+qe
         ti1A==
X-Gm-Message-State: AOJu0Yx8IkzshiqlfWrFFv8GjaITCHPCNYIyRYMStM+Q+zvHaZMS/xom
	oR8dlFx3QIDa0v03i4PLFPgMhdnx8AcaUJr8Z4KW9M3B0V9uWxv+nFC/jw/Z6fc8+1ACC/ur9Sp
	v2PvOGaB0HtMRNCybfy1DX/Uq1V/rkjg=
X-Gm-Gg: AeBDiesEKhiEWF7VVKEwPuHID8p+nvXoMBjtcdqQPO/CiCXe9kJOjkxRm98ziRgLd+/
	9OxPqP8vyZT8502lX2ojwSEy7HL1evjxbuko1rYVZsq5soKs/RgGkbNNd5FUfyVuYPu05hSN3CC
	xc/pTMfba+1A99e2wQf6rc94/9sgMsMeo2XOEGJNQLD2hHOQw46nZf6Zfc5XaaT1d8ta92/6yhm
	lt8UaMJLmGwbFE6Flz9y+dMSHfxGk0ObhwyGVNE+MArVOBZ7mj9zH1cYmKuxxL3p8GOMoH7LjpZ
	6EYMV8fDuRfP7dxjjhRbTfz6/wGR70TouL0LTlGhKefsmYYk4KFy
X-Received: by 2002:a17:903:3d47:b0:2b4:5b82:a8e3 with SMTP id
 d9443c01a7336-2b5f9f51e09mr189858775ad.24.1776949590734; Thu, 23 Apr 2026
 06:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260423092242.324644-1-jonas.gorski@bisdn.de>
In-Reply-To: <20260423092242.324644-1-jonas.gorski@bisdn.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Apr 2026 09:06:19 -0400
X-Gm-Features: AQROBzD_0tEiKhVQYbfPjFkDoGVnc61GaLVUFpOgbjMkMxzzMmwMOhRc_2IHZ_o
Message-ID: <CADkTA4NxNp0bJa=hCRqhGacETU1tzJW00Qrd6xE1_5yBx4MNZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: copy scripts/mod/modpost to STAGING_KERNEL_BUILDDIR
To: jonas.gorski@bisdn.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000023b98b06502051bd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 13:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235769

--00000000000023b98b06502051bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 5:22=E2=80=AFAM Jonas Gorski via lists.openembedded=
.org
<jonas.gorski=3Dbisdn.de@lists.openembedded.org> wrote:

> Copy the scripts/mod/modpost binary required for creating Module.symvers
> as well to STAGING_KERNEL_BUILDDIR.
>
> Without this, external modules will fail with the following error:
>
> | make -C .../kernel-source M=3D.../selftest-kmodule/1.0/sources
> | make[1]: Entering directory '.../kernel-source'
> | make[2]: Entering directory '.../kernel-build-artifacts'
> |   CC [M]  .../selftest-kmodule/1.0/sources/selftest-kmodule.o
> | make[4]: *** No rule to make target 'scripts/mod/modpost', needed by
> '.../selftest-kmodule/1.0/sources/Module.symvers'.  Stop.
> | make[3]: *** [.../kernel-source/Makefile:1906: modpost] Error 2
> | make[2]: *** [.../kernel-source/Makefile:224: __sub-make] Error 2
> | make[2]: Leaving directory '.../kernel-build-artifacts'
>
> Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
> ---
> I encountered this on master with a custom kernel (at 6.12), for
> context, which is mostly vanilla except for some additional platform
> support.
>

We need a better reproducer than this.

because obviously, this is working fine for external modules over quite
some time.

Which means we really need to understand what timing issue, or something
else, that
was triggered.

Bruce



>
>  meta/classes-recipe/kernel.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 2d8565bd5541..4714206aad59 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -612,6 +612,8 @@ do_shared_workdir () {
>                 cp -r scripts/gcc-plugins ${kerneldir}/scripts
>         fi
>
> +       mkdir -p ${kerneldir}/scripts/mod
> +       cp scripts/mod/modpost ${kerneldir}/scripts/mod
>  }
>
>  # We don't need to stage anything, not the modules/firmware since those
> would clash with linux-firmware
> --
> 2.53.0
>
>
> --
> BISDN GmbH
> K=C3=B6rnerstra=C3=9Fe 7-10
> 10785 Berlin
> Germany
> Phone: +49 30 610 816 100
> Managing Directors: Dr.-Ing. Hagen Woesner, Andreas K=C3=B6psel
>
>
> Commercial
> register:
> Amtsgericht Berlin-Charlottenburg HRB 141569 B
> VAT ID No:
> DE283257294 <http://goog_1008408251>
>
> <https://angacom.de/en/visitors/tickets>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235752):
> https://lists.openembedded.org/g/openembedded-core/message/235752
> Mute This Topic: https://lists.openembedded.org/mt/118968874/1050810
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

--00000000000023b98b06502051bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 23, 2026 at 5:22=
=E2=80=AFAM Jonas Gorski via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;jonas.gorski=3D<a href=3D"mailto:bisdn.de@lists.=
openembedded.org">bisdn.de@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Copy the scripts/mod/modpo=
st binary required for creating Module.symvers<br>
as well to STAGING_KERNEL_BUILDDIR.<br>
<br>
Without this, external modules will fail with the following error:<br>
<br>
| make -C .../kernel-source M=3D.../selftest-kmodule/1.0/sources<br>
| make[1]: Entering directory &#39;.../kernel-source&#39;<br>
| make[2]: Entering directory &#39;.../kernel-build-artifacts&#39;<br>
|=C2=A0 =C2=A0CC [M]=C2=A0 .../selftest-kmodule/1.0/sources/selftest-kmodul=
e.o<br>
| make[4]: *** No rule to make target &#39;scripts/mod/modpost&#39;, needed=
 by &#39;.../selftest-kmodule/1.0/sources/Module.symvers&#39;.=C2=A0 Stop.<=
br>
| make[3]: *** [.../kernel-source/Makefile:1906: modpost] Error 2<br>
| make[2]: *** [.../kernel-source/Makefile:224: __sub-make] Error 2<br>
| make[2]: Leaving directory &#39;.../kernel-build-artifacts&#39;<br>
<br>
Signed-off-by: Jonas Gorski &lt;<a href=3D"mailto:jonas.gorski@bisdn.de" ta=
rget=3D"_blank">jonas.gorski@bisdn.de</a>&gt;<br>
---<br>
I encountered this on master with a custom kernel (at 6.12), for<br>
context, which is mostly vanilla except for some additional platform<br>
support.<br></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">We need a better reproducer than this.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">because obviously, this is working f=
ine for external modules over quite some time.</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Which means we really need to understand what timing =
issue, or something else, that</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">was triggered.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 2d8565bd5541..4714206aad59 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -612,6 +612,8 @@ do_shared_workdir () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -r scripts/gcc-p=
lugins ${kerneldir}/scripts<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${kerneldir}/scripts/mod<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp scripts/mod/modpost ${kerneldir}/scripts/mod=
<br>
=C2=A0}<br>
<br>
=C2=A0# We don&#39;t need to stage anything, not the modules/firmware since=
 those would clash with linux-firmware<br>
-- <br>
2.53.0<br>
<br>
<br>
-- <br>
BISDN GmbH<br>
K=C3=B6rnerstra=C3=9Fe 7-10<br>
10785 Berlin<br>
Germany<br>
Phone: +49 30 610 816 100<br>
Managing Directors:=C2=A0Dr.-Ing. Hagen Woesner, Andreas K=C3=B6psel<br>
<br>
<br>
Commercial <br>
register:=C2=A0<br>
Amtsgericht Berlin-Charlottenburg HRB 141569 B<br>
VAT ID No:=C2=A0<br>
DE283257294 &lt;<a href=3D"http://goog_1008408251" rel=3D"noreferrer" targe=
t=3D"_blank">http://goog_1008408251</a>&gt;<br>
<br>
&lt;<a href=3D"https://angacom.de/en/visitors/tickets" rel=3D"noreferrer" t=
arget=3D"_blank">https://angacom.de/en/visitors/tickets</a>&gt;<br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#235752): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/235752" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/235752</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118968874/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118968874/1050810</a><br>
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

--00000000000023b98b06502051bd--

