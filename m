Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3A4FB5EA0
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:51:26 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66154.1773708681038985809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wj2THCJg;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79a535e7c00so14600557b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:51:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773708680; cv=none;
        d=google.com; s=arc-20240605;
        b=HRTx2MQaYqvxVurPYcDNWvbAdc4gL5d5D/Yv5idcQSxbMX4DH4KYwmmS0wsmXDHvD5
         NdG/3skAvcaTTs03Zpae+6nONqUdza8/CtBsui6lYkGci/h+R+aPUPF2WSBZYKbJCw0f
         GBritaMbLS3RjWp4NbOQKCpnoJNNfFVrafszt6Y9b2Jm8+hbzJCoo2j3uGUzlxUEOgcC
         NgAHtDQC2SEzp8bEkf0T6trlrnzkIqxOstjauF5SNJSd9IWxWAgEp54WXHjAJZuo15a0
         zc64wpYc5hD0Wr1O4CukfjbQTb03HYH1RqwuyDnch68hs+wY41xj+P9XpUUIuSYX0ltC
         C+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VketujdWSA/0Z0bYYJBdFl8RGU35GENHc9gY0iFA6+I=;
        fh=Bwcj6kAs3AYnqc6ZaGzuuA5GE2EyA/HuIyUMiAHm0WI=;
        b=XANBKywf62+aQiB2EqCRviKx25kuXPP75couD1heQol3nm2TMSnbqO1Fz6uWqAMpBE
         MnQI2th59rp/rT6nYgHkhLJuuz6F13kY8lOAlQT+LkZaJ6Iu0W0JYZgPrB559EwtdUv9
         Cnckxu+qXpnh2xapj5466GPuv/C1uttQhXdhWCHFV5arzrn0oX7uHVNn4bSvxmgi918N
         AK4Mg9T8OjU5Ru9SeydPvuG21kSV2ERlpIdc9QxQeZwzTNlLGvlIIvITgRRtIz8knGCn
         IPNVHqMR0mHaSsW4FYhndAVkhd65fWToImhpcxTXlb5e34lTc28Ya4TPgV11LlhLg+S2
         qtag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773708680; x=1774313480; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VketujdWSA/0Z0bYYJBdFl8RGU35GENHc9gY0iFA6+I=;
        b=Wj2THCJgedxf17PPHgw+bByyd9NRhbvbmgVR6dnbFF3mtBO+cdS08SzV4xrwm+ahYE
         vMklsruM4qJz1oJH2nRsjyQbh6xuBUuTNIaewRwSN+4UkEQM4M7wP9TcU5r3ONmuWC8o
         4H3m8bEvB8NgBm2NQRtdcPCfXAExWVO1p18OKwyNQoaSOaYfCphe4MVPfuUNd/6vBFpa
         OUCizNMk8//ZWUZBOCFNhqXATNYicsie+QhgSDITBImUo23DsDvtFdA+Sn50p5tOaLK8
         ouUlxU5IvmJl0gf9S369LmK+bDvXWD1Obl0WB4gpa5fGXhxyR6lrlmN7Q5tNM7OFmjJr
         OiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773708680; x=1774313480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VketujdWSA/0Z0bYYJBdFl8RGU35GENHc9gY0iFA6+I=;
        b=UsW1fHQzrI1VkTUirHZI1BQTouNopcgj61Gcsr61SXvHn51EQMhIur+d9M68S/MLwq
         gfZt7KVUVz/GJt5lhi+anjAJjIweCWDPeJ42lhtPuN390KSKE0rZR1AbUAjlcrPsbd3p
         z3aUcz2tvkF5p2+4nUBspt9jZhGN5njhNzsWku868rIW+0BkB8kEWXJhZyr/HKgN1Bgg
         AXAEaYZnymAYjOOq/EPL4IA+MT7YCftiqzhpjKPC37euA7XuGK3OV22TNBFWqaHaaF1l
         dQekymO91t/XnOf9i3a8pr9ADO2SEHfjCkoYtlrjs6JeCDttfixAh/kNgkQf3OxJzFDo
         bV9g==
X-Gm-Message-State: AOJu0YwoIkAfg7LpZg4zXTqh/l0rk4cOh+Y7jjsmrqzKHtexs8T+FXoD
	l9xpuokB6rYhoabOE6kpFWmfxTGKGmy9RTj+PWipCTeG1QWK9oiyGT8dkcY+P2kw4bdbQjKlxjs
	hM+pBBjIhE7iqDqepXSxyoZr78y71e4Y=
X-Gm-Gg: ATEYQzw6VFS/ErzP3sUvRu9QYKUhNO+heTLvd3NIl+t7ukrZAFqiN5GzZhBL5svpSom
	iSCn2/S24f7VHFNUl57+s1CpWwkpE0dEDBh7/0SefHMzWPEpAc4yQ3NfJVAp9SRqXx+XYhgOqNv
	fA6a7xzQOg30TDsN0DKTkst1U8Wp6Ih1oZhrOzewjd9KSaKZ0wgj0Qg3B1Twuu16uSevi5G+yXr
	31JV8wlVwZy2UEHK5cTDHQqXn9KrkbMtbELHzzTdc15NW2tCscLp273Tr7fex0Xoipt1QEGA1ZM
	RRcD1UlNFLOS7ygPUsbBP1hMRW3vLMJbmu8GnwMvYjKkiyrQkBfqXgmkSeIdtVnhlPJ7CpglOa2
	yWPO2LyKs+6ENhzo7e1OzLP+d
X-Received: by 2002:a05:690c:6:b0:79a:38a2:d8d6 with SMTP id
 00721157ae682-79a38a2e1fcmr87805607b3.21.1773708680094; Mon, 16 Mar 2026
 17:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Mar 2026 17:50:52 -0700
X-Gm-Features: AaiRm50Rh9xoGXlPTuniR5lWYHFea9CBB0OI1psiiqOx3PdQeW8aDJYekBR8K1g
Message-ID: <CAMKF1sqOx2zrXYmpakK5tYW-87s0RtbxHET2JNWe445sLc4L=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 00/12] Confusing and invalid conditional appends
To: michalwsieron@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cfeb1e064d2dbbbb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233290

--000000000000cfeb1e064d2dbbbb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you have scripted it then it would be great to see this run on
meta-openembedded repository as well and see if there are some
instances existing there too.

On Mon, Mar 16, 2026 at 5:03=E2=80=AFPM Michal Sieron via lists.openembedde=
d.org
<michalwsieron=3Dgmail.com@lists.openembedded.org> wrote:

> This patchset fixes several findings for variable assignments of form:
>     A:someoverride +=3D "foo"
> and transforms them into:
>     A:append:someoverride =3D " foo"
>
> In most of those cases I assume the original intent was to have a
> conditional append, but what was actually happening was append to
> a conditional override.
>
> I first noticed such problem in our internal recipes and bbappends, but
> then I decided to check if similar issue exists upstream and turns out
> it does.
>
> In most places the override that was happening was harmless as there was
> no value that was being overriden, but that wasn't the case for libffi.
> Before patch:
>     $ grep EXTRA_OECONF
> /path/to/layers/openembedded-core/meta/recipes-support/libffi/
> libffi_3.5.2.bb
>     EXTRA_OECONF +=3D "--disable-builddir --disable-exec-static-tramp"
>     EXTRA_OECONF:class-native +=3D "--with-gcc-arch=3Dgeneric"
>     $ bitbake-getvar -r libffi-native EXTRA_OECONF
>     #
>     # $EXTRA_OECONF [6 operations]
>     #   set /path/to/layers/openembedded-core/meta/conf/bitbake.conf:590
>     #     ""
>     #   :append
> /path/to/layers/openembedded-core/meta/conf/distro/include/no-static-libs=
.inc:24
>     #     "${DISABLE_STATIC}"
>     #   set
> /path/to/layers/openembedded-core/meta/conf/documentation.conf:164
>     #     [doc] "Additional configure script options."
>     #   append
> /path/to/layers/openembedded-core/meta/recipes-support/libffi/
> libffi_3.5.2.bb:18
>     #     "--disable-builddir --disable-exec-static-tramp"
>     #   :append
> /path/to/layers/openembedded-core/meta/classes-recipe/autotools.bbclass:1=
34
>     #     " ${PACKAGECONFIG_CONFARGS}"
>     #   override[class-native]:append
> /path/to/layers/openembedded-core/meta/recipes-support/libffi/
> libffi_3.5.2.bb:19
>     #     "--with-gcc-arch=3Dgeneric"
>     # pre-expansion value:
>     #   " --with-gcc-arch=3Dgeneric${DISABLE_STATIC}
> ${PACKAGECONFIG_CONFARGS}"
>     EXTRA_OECONF=3D" --with-gcc-arch=3Dgeneric --disable-static "
>
> After patch:
>     $ grep EXTRA_OECONF
> /path/to/layers/openembedded-core/meta/recipes-support/libffi/
> libffi_3.5.2.bb
>     EXTRA_OECONF +=3D "--disable-builddir --disable-exec-static-tramp"
>     EXTRA_OECONF:append:class-native =3D " --with-gcc-arch=3Dgeneric"
>     $ bitbake-getvar -r libffi-native EXTRA_OECONF#
>     # $EXTRA_OECONF [6 operations]
>     #   set /path/to/layers/openembedded-core/meta/conf/bitbake.conf:590
>     #     ""
>     #   :append
> /path/to/layers/openembedded-core/meta/conf/distro/include/no-static-libs=
.inc:24
>     #     "${DISABLE_STATIC}"
>     #   set
> /path/to/layers/openembedded-core/meta/conf/documentation.conf:164
>     #     [doc] "Additional configure script options."
>     #   append
> /path/to/layers/openembedded-core/meta/recipes-support/libffi/
> libffi_3.5.2.bb:18
>     #     "--disable-builddir --disable-exec-static-tramp"
>     #   :append[class-native]
> /path/to/layers/openembedded-core/meta/recipes-support/libffi/
> libffi_3.5.2.bb:19
>     #     " --with-gcc-arch=3Dgeneric"
>     #   :append
> /path/to/layers/openembedded-core/meta/classes-recipe/autotools.bbclass:1=
34
>     #     " ${PACKAGECONFIG_CONFARGS}"
>     # pre-expansion value:
>     #   " --disable-builddir --disable-exec-static-tramp${DISABLE_STATIC}
> --with-gcc-arch=3Dgeneric ${PACKAGECONFIG_CONFARGS}"
>     EXTRA_OECONF=3D" --disable-builddir --disable-exec-static-tramp
> --disable-static --with-gcc-arch=3Dgeneric "
>
> ---
> Changes in v2:
> - Split initial single commit into smaller ones
> - Described actual impact on the overriden variables
> - Added some recipes that I missed last time
> - Link to v1:
> https://lore.kernel.org/r/20260314-fix-invalid-appends-v1-1-03ec0bff6942@=
gmail.com
>
> ---
> Michal Sieron (12):
>       libffi: Fix invalid conditional append
>       coreutils: Convert confusing append to override syntax
>       expat: Convert confusing append to override syntax
>       tune-power[567]: Remove confusing overrides
>       no-gplv3.inc: Convert confusing appends to override syntax
>       bootchart2: Convert confusing appends to override syntax
>       pigz: Convert confusing append to override syntax
>       systemtap: Convert confusing append to override syntax
>       ovmf: Convert confusing append to override syntax
>       dnf: Convert confusing append to override syntax
>       qemu: Convert confusing append to override syntax
>       recipes-devtools/python: Convert confusing appends to override synt=
ax
>
>  meta/conf/distro/include/no-gplv3.inc                    |  4 ++--
>  meta/conf/machine/include/powerpc/tune-power5.inc        |  3 +--
>  meta/conf/machine/include/powerpc/tune-power6.inc        |  3 +--
>  meta/conf/machine/include/powerpc/tune-power7.inc        |  3 +--
>  meta/recipes-core/coreutils/coreutils_9.10.bb            |  4 ++--
>  meta/recipes-core/expat/expat_2.7.4.bb                   |  2 +-
>  meta/recipes-core/ovmf/ovmf_git.bb                       |  2 +-
>  meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb    | 10 +++++-----
>  meta/recipes-devtools/dnf/dnf_4.24.0.bb                  |  2 +-
>  meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb |  2 +-
>  meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb     |  2 +-
>  meta/recipes-devtools/python/python3-chardet_5.2.0.bb    |  2 +-
>  meta/recipes-devtools/python/python3-cython_3.2.4.bb     |  4 ++--
>  meta/recipes-devtools/python/python3-ply_3.11.bb         |  2 +-
>  meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb     |  2 +-
>  meta/recipes-devtools/python/python3-pycparser_3.0.bb    |  4 ++--
>  meta/recipes-devtools/python/python3-pysocks_1.7.1.bb    |  2 +-
>  meta/recipes-devtools/python/python3-pytz_2025.2.bb      |  2 +-
>  meta/recipes-devtools/qemu/qemu_10.2.0.bb                |  2 +-
>  meta/recipes-extended/pigz/pigz_2.8.bb                   |  2 +-
>  meta/recipes-kernel/systemtap/systemtap_5.4.bb           |  2 +-
>  meta/recipes-support/libffi/libffi_3.5.2.bb              |  2 +-
>  22 files changed, 30 insertions(+), 33 deletions(-)
> ---
> base-commit: f5e62a13cbe17947baa387c723422bc8ca766d34
> change-id: 20260314-fix-invalid-appends-cf5197ef2f07
>
> Best regards,
> --
> Michal Sieron <michalwsieron@gmail.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233273):
> https://lists.openembedded.org/g/openembedded-core/message/233273
> Mute This Topic: https://lists.openembedded.org/mt/118356432/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cfeb1e064d2dbbbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If you have scripted it then it would be great to see this=
 run on meta-openembedded repository as well and see if there are some<div>=
instances existing there too.</div></div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 16, 20=
26 at 5:03=E2=80=AFPM Michal Sieron via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;michalwsieron=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This patchse=
t fixes several findings for variable assignments of form:<br>
=C2=A0 =C2=A0 A:someoverride +=3D &quot;foo&quot;<br>
and transforms them into:<br>
=C2=A0 =C2=A0 A:append:someoverride =3D &quot; foo&quot;<br>
<br>
In most of those cases I assume the original intent was to have a<br>
conditional append, but what was actually happening was append to<br>
a conditional override.<br>
<br>
I first noticed such problem in our internal recipes and bbappends, but<br>
then I decided to check if similar issue exists upstream and turns out<br>
it does.<br>
<br>
In most places the override that was happening was harmless as there was<br=
>
no value that was being overriden, but that wasn&#39;t the case for libffi.=
<br>
Before patch:<br>
=C2=A0 =C2=A0 $ grep EXTRA_OECONF /path/to/layers/openembedded-core/meta/re=
cipes-support/libffi/<a href=3D"http://libffi_3.5.2.bb" rel=3D"noreferrer" =
target=3D"_blank">libffi_3.5.2.bb</a><br>
=C2=A0 =C2=A0 EXTRA_OECONF +=3D &quot;--disable-builddir --disable-exec-sta=
tic-tramp&quot;<br>
=C2=A0 =C2=A0 EXTRA_OECONF:class-native +=3D &quot;--with-gcc-arch=3Dgeneri=
c&quot;<br>
=C2=A0 =C2=A0 $ bitbake-getvar -r libffi-native EXTRA_OECONF<br>
=C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 # $EXTRA_OECONF [6 operations]<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0set /path/to/layers/openembedded-core/meta/conf=
/bitbake.conf:590<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;&quot;<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0:append /path/to/layers/openembedded-core/meta/=
conf/distro/include/no-static-libs.inc:24<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;${DISABLE_STATIC}&quot;<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0set /path/to/layers/openembedded-core/meta/conf=
/documentation.conf:164<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0[doc] &quot;Additional configure script =
options.&quot;<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0append /path/to/layers/openembedded-core/meta/r=
ecipes-support/libffi/<a href=3D"http://libffi_3.5.2.bb:18" rel=3D"noreferr=
er" target=3D"_blank">libffi_3.5.2.bb:18</a><br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;--disable-builddir --disable-exec-=
static-tramp&quot;<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0:append /path/to/layers/openembedded-core/meta/=
classes-recipe/autotools.bbclass:134<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot; ${PACKAGECONFIG_CONFARGS}&quot;<b=
r>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0override[class-native]:append /path/to/layers/o=
penembedded-core/meta/recipes-support/libffi/<a href=3D"http://libffi_3.5.2=
.bb:19" rel=3D"noreferrer" target=3D"_blank">libffi_3.5.2.bb:19</a><br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;--with-gcc-arch=3Dgeneric&quot;<br=
>
=C2=A0 =C2=A0 # pre-expansion value:<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0&quot; --with-gcc-arch=3Dgeneric${DISABLE_STATI=
C} ${PACKAGECONFIG_CONFARGS}&quot;<br>
=C2=A0 =C2=A0 EXTRA_OECONF=3D&quot; --with-gcc-arch=3Dgeneric --disable-sta=
tic &quot;<br>
<br>
After patch:<br>
=C2=A0 =C2=A0 $ grep EXTRA_OECONF /path/to/layers/openembedded-core/meta/re=
cipes-support/libffi/<a href=3D"http://libffi_3.5.2.bb" rel=3D"noreferrer" =
target=3D"_blank">libffi_3.5.2.bb</a><br>
=C2=A0 =C2=A0 EXTRA_OECONF +=3D &quot;--disable-builddir --disable-exec-sta=
tic-tramp&quot;<br>
=C2=A0 =C2=A0 EXTRA_OECONF:append:class-native =3D &quot; --with-gcc-arch=
=3Dgeneric&quot;<br>
=C2=A0 =C2=A0 $ bitbake-getvar -r libffi-native EXTRA_OECONF#<br>
=C2=A0 =C2=A0 # $EXTRA_OECONF [6 operations]<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0set /path/to/layers/openembedded-core/meta/conf=
/bitbake.conf:590<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;&quot;<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0:append /path/to/layers/openembedded-core/meta/=
conf/distro/include/no-static-libs.inc:24<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;${DISABLE_STATIC}&quot;<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0set /path/to/layers/openembedded-core/meta/conf=
/documentation.conf:164<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0[doc] &quot;Additional configure script =
options.&quot;<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0append /path/to/layers/openembedded-core/meta/r=
ecipes-support/libffi/<a href=3D"http://libffi_3.5.2.bb:18" rel=3D"noreferr=
er" target=3D"_blank">libffi_3.5.2.bb:18</a><br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;--disable-builddir --disable-exec-=
static-tramp&quot;<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0:append[class-native] /path/to/layers/openembed=
ded-core/meta/recipes-support/libffi/<a href=3D"http://libffi_3.5.2.bb:19" =
rel=3D"noreferrer" target=3D"_blank">libffi_3.5.2.bb:19</a><br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot; --with-gcc-arch=3Dgeneric&quot;<b=
r>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0:append /path/to/layers/openembedded-core/meta/=
classes-recipe/autotools.bbclass:134<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot; ${PACKAGECONFIG_CONFARGS}&quot;<b=
r>
=C2=A0 =C2=A0 # pre-expansion value:<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0&quot; --disable-builddir --disable-exec-static=
-tramp${DISABLE_STATIC} --with-gcc-arch=3Dgeneric ${PACKAGECONFIG_CONFARGS}=
&quot;<br>
=C2=A0 =C2=A0 EXTRA_OECONF=3D&quot; --disable-builddir --disable-exec-stati=
c-tramp --disable-static --with-gcc-arch=3Dgeneric &quot;<br>
<br>
---<br>
Changes in v2:<br>
- Split initial single commit into smaller ones<br>
- Described actual impact on the overriden variables<br>
- Added some recipes that I missed last time<br>
- Link to v1: <a href=3D"https://lore.kernel.org/r/20260314-fix-invalid-app=
ends-v1-1-03ec0bff6942@gmail.com" rel=3D"noreferrer" target=3D"_blank">http=
s://lore.kernel.org/r/20260314-fix-invalid-appends-v1-1-03ec0bff6942@gmail.=
com</a><br>
<br>
---<br>
Michal Sieron (12):<br>
=C2=A0 =C2=A0 =C2=A0 libffi: Fix invalid conditional append<br>
=C2=A0 =C2=A0 =C2=A0 coreutils: Convert confusing append to override syntax=
<br>
=C2=A0 =C2=A0 =C2=A0 expat: Convert confusing append to override syntax<br>
=C2=A0 =C2=A0 =C2=A0 tune-power[567]: Remove confusing overrides<br>
=C2=A0 =C2=A0 =C2=A0 no-gplv3.inc: Convert confusing appends to override sy=
ntax<br>
=C2=A0 =C2=A0 =C2=A0 bootchart2: Convert confusing appends to override synt=
ax<br>
=C2=A0 =C2=A0 =C2=A0 pigz: Convert confusing append to override syntax<br>
=C2=A0 =C2=A0 =C2=A0 systemtap: Convert confusing append to override syntax=
<br>
=C2=A0 =C2=A0 =C2=A0 ovmf: Convert confusing append to override syntax<br>
=C2=A0 =C2=A0 =C2=A0 dnf: Convert confusing append to override syntax<br>
=C2=A0 =C2=A0 =C2=A0 qemu: Convert confusing append to override syntax<br>
=C2=A0 =C2=A0 =C2=A0 recipes-devtools/python: Convert confusing appends to =
override syntax<br>
<br>
=C2=A0meta/conf/distro/include/no-gplv3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0meta/conf/machine/include/powerpc/tune-power5.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 3 +--<br>
=C2=A0meta/conf/machine/include/powerpc/tune-power6.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 3 +--<br>
=C2=A0meta/conf/machine/include/powerpc/tune-power7.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 3 +--<br>
=C2=A0meta/recipes-core/coreutils/<a href=3D"http://coreutils_9.10.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_9.10.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0meta/recipes-core/expat/<a href=3D"http://expat_2.7.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">expat_2.7.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"noreferr=
er" target=3D"_blank">ovmf_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/bootchart2/<a href=3D"http://bootchart2_0.14.9.=
bb" rel=3D"noreferrer" target=3D"_blank">bootchart2_0.14.9.bb</a>=C2=A0 =C2=
=A0 | 10 +++++-----<br>
=C2=A0meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.24.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">dnf_4.24.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-asn1crypto_1.5=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-asn1crypto_1.5.1.bb</a>=
 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-bcrypt_5.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-bcrypt_5.0.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-chardet_5.2.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-chardet_5.2.0.bb</a>=C2=A0=
 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-cython_3.2.4.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.2.4.bb</a>=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-ply_3.11.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-ply_3.11.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pyasn1_0.6.2.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-pyasn1_0.6.2.bb</a>=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pycparser_3.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-pycparser_3.0.bb</a>=C2=A0=
 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pysocks_1.7.1.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-pysocks_1.7.1.bb</a>=C2=A0=
 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pytz_2025.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-pytz_2025.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/qemu/<a href=3D"http://qemu_10.2.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">qemu_10.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-extended/pigz/<a href=3D"http://pigz_2.8.bb" rel=3D"nore=
ferrer" target=3D"_blank">pigz_2.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-kernel/systemtap/<a href=3D"http://systemtap_5.4.bb" rel=
=3D"noreferrer" target=3D"_blank">systemtap_5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-support/libffi/<a href=3D"http://libffi_3.5.2.bb" rel=3D=
"noreferrer" target=3D"_blank">libffi_3.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A022 files changed, 30 insertions(+), 33 deletions(-)<br>
---<br>
base-commit: f5e62a13cbe17947baa387c723422bc8ca766d34<br>
change-id: 20260314-fix-invalid-appends-cf5197ef2f07<br>
<br>
Best regards,<br>
-- <br>
Michal Sieron &lt;<a href=3D"mailto:michalwsieron@gmail.com" target=3D"_bla=
nk">michalwsieron@gmail.com</a>&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233273): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233273" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233273</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118356432/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118356432/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cfeb1e064d2dbbbb--

