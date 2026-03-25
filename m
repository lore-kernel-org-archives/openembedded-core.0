Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8449FC72DF
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 00:33:16 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12242.1774398793713985152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 17:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sver/rtQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-797ab169454so48931967b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774398793; cv=none;
        d=google.com; s=arc-20240605;
        b=UtigG7+jZkZbW2Z1uQb+4FjONGIAXUyhz1fK/OMKXbyTNwI17iijzWkt1MNJcaCkIP
         Vy02Q5oPlL9cmwqgpNkYuDYlEQ8B6h7fbR4jRwQUhUMSObfDa9elrErrLyNGHKgEDQYc
         UyQrruo4BXvcI3FAqk1pbPLUNCyO71yLy11pdKALqdLJFX7NbaOgf4GMMx34TM0fxQXC
         8Nh+uphnTHYfRhLOLK20P6aadls+unrI6iIHYqvwYRk2boEFhZzQgmcvdHK2sxIy0Gyn
         aUEKNkO670ILB2JxXwzru6S4LkKDKXJa/TDz50axyi9hG5RSzp8/NCbGYY+YKvLuCRff
         p29g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EQ/kDP3q0fLnl+6wVvVo0suckDPHZBe4BO1e2Zg8MZo=;
        fh=V1K9jSFlcW0X/PgYtlrzJnrwS+bW0wAlWIcr6XQQa24=;
        b=GZ83T9MU991GAufrd2s2tpXEmNrg+rvFSsOZTHIP90C/Hiz44mh8eUNPcgTrMCrQ6C
         C6NkJB6cttm6VV286YBxmlNxC7SIwt810D9YLl9Mxy2+2OgHFEJ7RbvRuxeWVZ3EaGDN
         27zLWM/5/02s1Sy9g608rZIftq4NeqSulULXVibiD2d0bLxlzPjGx5AvTtGtaOtGU7Kh
         xaBPBPc5VEkTlCWbQLF9QkmF/jwbIDX13Ki3GtAdExosCSTFvQjlM8gBULve5W8PnwmT
         VPo3YQlIhGrKpSZCViGAr7bigKSWyythp6EjOo6TKcef0Xweft73b/EquAtpQz4hlZHC
         AlUw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398793; x=1775003593; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EQ/kDP3q0fLnl+6wVvVo0suckDPHZBe4BO1e2Zg8MZo=;
        b=sver/rtQNoNxvyJcAlb08OPhSMkH9q+kf6+yBzTfh9GYRYKTUfIAdLO+ufAskjD5d5
         Vp+cw7uPGqHiUrF1MnXM876wcFdoL/hYhdwdeeFrDLvaJ1l16nHga+MMLvDQiaGW9yqg
         YM4Y2MEtsSNIwjgGxXhCJCAroOTYZLs2YIy1g0Ul/Ss8EtMfVu3uknTttbec5O2Ibr4y
         hXPI2rqYJqlBtQxfzmg8j3UGeeGVyRUDwBTjrKIPJDtc6pEy+k964uIWR5655cRfzjOX
         JnPomHjeeVMU6cOhAv2q5+3aGS8Oi9sD9BVfOaRssGbD/iT7hE5VUuDObw1wowcfCYAV
         HhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398793; x=1775003593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQ/kDP3q0fLnl+6wVvVo0suckDPHZBe4BO1e2Zg8MZo=;
        b=SVimj2w5fHNdsR2U880/LSp2y74e0HkooTeI6yvfBVrrtTHg7RWCzK88EaYWHIVHLb
         GZbHl8TSS7UT6YJYvxu8zMCsHbpThMreMOoSlfAnLaWjicGWFFUZlK3Lhwu+CWaaDPZ+
         dnr9he1LK3VxalX5XKFve4g31hcscyVWIi8MReDQuTMFRm9SUwSMk8U8j9dqL2vi/mxN
         wFMfjbN0ZAv5JRVMZuYXBn9/BviA4ELe+6O1ftxbfIManeU46h8Wc22lWzG33mo7/NMJ
         75CsNPm1Z0gB33AW/TovI6ZF+GpdlA+xInSNmHpvMusqNYC2AXWY0Sk+/AiEeLz0pUlQ
         p9zw==
X-Forwarded-Encrypted: i=1; AJvYcCXpKKhtBExCOg6oYQ8ToA/WsxBwvY9q/bBoatpvDOePh+xrqHtAYnts4o+Sqjc1x2Jw+97tP4bIoLHuJFauLu4kIA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7B+6N7GZVr3giNRY3Ljkb0xAFglukeJNEcc0jHjjNF4SOEKvp
	Y4LGRKAjSU1lWtsphh0KqDlo6YSdj0ONwclCYSXSchywg5XM1eSvSK83KjPu5jLtp7TJuaoSVgH
	HaKLwlmyG9EDUwi7cGMRr9qbUKTQ7gNcNxWT9P/I=
X-Gm-Gg: ATEYQzx4BSKlg+MNK//fp9lJiFkt+jnvD+0MAJiWUCtJFWa44NpTwFhcYZG+EO8IH89
	9z9zkwhHEOvA6DMQA9sZpTm/bbHKShq938zPRxUk95H5yk51lzXisRRdo/gwrK0qA/v/IBr3gat
	LFLh3Kw49kjlUtZcq6dg1y3o8Wj7NJhcZHHsBlmPQyObiSX5cG7m/zLDpGaREun4tLhhFblUUyE
	ccP3zisGDJc+94bCbGJphSy25ic4EXNjDh+YNhlyhNj0wdeBI3eCHFOploatOJr46vpF/tealSn
	RyqzifCN2rK86J2Jr8Y42bgcA3hhCk/c8OE5S7bhr6fDXuo9z0uWmcR4e+bUCpvW/AfdBrjz6Ft
	0x9VDRZEdvFK3oDC+wXzolh19
X-Received: by 2002:a05:690e:150e:b0:64c:9a66:9a15 with SMTP id
 956f58d0204a3-64ee5fc5ad5mr1415752d50.0.1774398792631; Tue, 24 Mar 2026
 17:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260320122732.1630715-1-ross.burton@arm.com> <20260320122732.1630715-5-ross.burton@arm.com>
 <h5lrgbr42atenjzkrgdl3wwxn7af76lafptxew2twvyjyjfknf@tntp4vm3eev7>
In-Reply-To: <h5lrgbr42atenjzkrgdl3wwxn7af76lafptxew2twvyjyjfknf@tntp4vm3eev7>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Mar 2026 17:32:44 -0700
X-Gm-Features: AaiRm53ntb1utBinONF1uuQAIW2ndTJqHyR8GBQ_o69rGNumRIo8zwRY0FmyI3k
Message-ID: <CAMKF1sruK=LN57F_TiTVx9Zrw+0BJSv0AJo2M5kox9vhmyzA9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/7] class/pkgconfig: use pkgconf instead of pkgconfig
To: dmitry.baryshkov@oss.qualcomm.com
Cc: Ross Burton <ross.burton@arm.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b98bf0064dce69fd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 00:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233837

--000000000000b98bf0064dce69fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 5:05=E2=80=AFPM Dmitry Baryshkov via lists.openembe=
dded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> On Fri, Mar 20, 2026 at 12:27:29PM +0000, Ross Burton wrote:
> > The last meaningful change to freedesktop.org pkgconfig was in 2019, bu=
t
> > pkgconf is actively maintained.
> >
> > Major distributions such as Fedora (and derivates), Debian (ditto), Arc=
h
> > Linux, Buildroot, and Alpine have all moved to pkgconf already.
> >
> > There's a subtle behaviour change between pkgconfig and pkgconf, wherea=
s
> > pkgconfig appends the sysroot to PKG_CONFIG_SYSTEM_INCLUDE_PATH pkgconf
> > does not, so we need to sysroot-prefix those variables.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/classes-recipe/pkgconfig.bbclass          | 6 +++---
> >  meta/conf/distro/include/default-providers.inc | 6 +++---
> >  2 files changed, 6 insertions(+), 6 deletions(-)
>
> FWIW pkgconfig -> pkgconf change also break gst-plugins-imsdk build in
> meta-qcom. Reverting this series makes the build succeed.
>
> | FAILED: [code=3D1]
> gst-plugin-mlaconverter/CMakeFiles/gstqtimlaconverter.dir/audio-converter=
-engine.cc.o
> | ccache
> /home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-lin=
ux/gst-plugins-imsdk/0.1.0/recipe-sysroot-native/usr/bin/aarch64-qcom-linux=
/aarch64-qcom-linux-g++
> --sysroot=3D/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8=
-2a-qcom-linux/gst-plugins-imsdk/0.1.0/recipe-sysroot
> -DHAVE_CONFIG_H -DHAVE_LINUX_DMA_BUF_H -Dgstqtimlaconverter_EXPORTS
> -I/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-l=
inux/gst-plugins-imsdk/0.1.0/build/gst-plugin-mlaconverter
> -I/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-l=
inux/gst-plugins-imsdk/0.1.0/sources/gst-plugins-imsdk-0.1.0/gst-plugin-mla=
converter
> -I/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-l=
inux/gst-plugins-imsdk/0.1.0/recipe-sysroot/usr/include/gstreamer-1.0
> -I/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-l=
inux/gst-plugins-imsdk/0.1.0/recipe-sysroot/usr/include/glib-2.0
> -I/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-l=
inux/gst-plugins-imsdk/0.1.0/recipe-sysroot/usr/lib/glib-2.0/include
> -I/usr/include/gstreamer-1.0
> -I/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-l=
inux/gst-plugins-imsdk/0.1.0/sources/gst-plugins-imsdk-0.1.0/gst-plugin-bas=
e
> -I/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-l=
inux/gst-plugins-imsdk/0.1.0/recipe-sysroot/usr/include/json-glib-1.0
> -I/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-l=
inux/gst-plugins-imsdk/0.1.0/recipe-sysroot/usr/include/libmount
> -I/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-l=
inux/gst-plugins-imsdk/0.1.0/recipe-sysroot/usr/include/blkid
> -march=3Darmv8.2-a+crypto -mbranch-protection=3Dstandard
> -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat
> -Wformat-security -Werror=3Dformat-security
> --sysroot=3D/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8=
-2a-qcom-linux/gst-plugins-imsdk/0.1.0/recipe-sysroot
> -O2 -g -fcanon-prefix-map
> -ffile-prefix-map=3D/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/wo=
rk/armv8-2a-qcom-linux/gst-plugins-imsdk/0.1.0/sources/gst-plugins-imsdk-0.=
1.0=3D/usr/src/debug/gst-plugins-imsdk/0.1.0
> -ffile-prefix-map=3D/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/wo=
rk/armv8-2a-qcom-linux/gst-plugins-imsdk/0.1.0/build=3D/usr/src/debug/gst-p=
lugins-imsdk/0.1.0
> -ffile-prefix-map=3D/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/wo=
rk/armv8-2a-qcom-linux/gst-plugins-imsdk/0.1.0/recipe-sysroot=3D
> -ffile-prefix-map=3D/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/wo=
rk/armv8-2a-qcom-linux/gst-plugins-imsdk/0.1.0/recipe-sysroot-native=3D
> -pipe -fvisibility-inlines-hidden -Wall -Wextra -Werror
> -Wno-unused-parameter -std=3Dgnu++17 -fPIC -MD -MT
> gst-plugin-mlaconverter/CMakeFiles/gstqtimlaconverter.dir/audio-converter=
-engine.cc.o
> -MF
> gst-plugin-mlaconverter/CMakeFiles/gstqtimlaconverter.dir/audio-converter=
-engine.cc.o.d
> -o
> gst-plugin-mlaconverter/CMakeFiles/gstqtimlaconverter.dir/audio-converter=
-engine.cc.o
> -c
> /home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-lin=
ux/gst-plugins-imsdk/0.1.0/sources/gst-plugins-imsdk-0.1.0/gst-plugin-mlaco=
nverter/audio-converter-engine.cc
> | cc1plus: error: include location "/usr/include/gstreamer-1.0" is unsafe
> for cross-compilation [-Werror=3Dpoison-system-directories]
> | cc1plus: all warnings being treated as errors
> | ninja: build stopped: subcommand failed.
> |
> | WARNING: exit code 1 from a shell command.
> ERROR: Task
> (/home/lumag/Projects/RPB/build-rpb/conf/../../layers/meta-qcom/recipes-m=
ultimedia/imsdk/gst-plugins-imsdk_0.1.0.bb:do_compile)
> failed with exit code '1'
>
>
I wonder if CMake is using unwrapper'ed version of pkgconf and not
filterning non sysrooted target paths. Try changing the CMakefiles.txt for
the concerned plugin to use
IMPORTED_TARGET and see if it helps

change
pkg_check_modules(GST
  REQUIRED gstreamer-1.0>=3D${GST_VERSION_REQUIRED})

to
pkg_check_modules(GST
  REQUIRED IMPORTED_TARGET gstreamer-1.0>=3D${GST_VERSION_REQUIRED})

in

https://github.com/qualcomm/gst-plugins-imsdk/blob/main/gst-plugin-mlaconve=
rter/CMakeLists.txt

It might help.

--=20
> With best wishes
> Dmitry
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233836):
> https://lists.openembedded.org/g/openembedded-core/message/233836
> Mute This Topic: https://lists.openembedded.org/mt/118416246/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b98bf0064dce69fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 24,=
 2026 at 5:05=E2=80=AFPM Dmitry Baryshkov via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;dmitry.baryshkov=3D<a href=3D"m=
ailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.opene=
mbedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Fri, Mar 20, 2026 at 12:27:29PM +0000, Ross Burton wrote:<br>
&gt; The last meaningful change to <a href=3D"http://freedesktop.org" rel=
=3D"noreferrer" target=3D"_blank">freedesktop.org</a> pkgconfig was in 2019=
, but<br>
&gt; pkgconf is actively maintained.<br>
&gt; <br>
&gt; Major distributions such as Fedora (and derivates), Debian (ditto), Ar=
ch<br>
&gt; Linux, Buildroot, and Alpine have all moved to pkgconf already.<br>
&gt; <br>
&gt; There&#39;s a subtle behaviour change between pkgconfig and pkgconf, w=
hereas<br>
&gt; pkgconfig appends the sysroot to PKG_CONFIG_SYSTEM_INCLUDE_PATH pkgcon=
f<br>
&gt; does not, so we need to sysroot-prefix those variables.<br>
&gt; <br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/pkgconfig.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 6 +++---<br>
&gt;=C2=A0 meta/conf/distro/include/default-providers.inc | 6 +++---<br>
&gt;=C2=A0 2 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
FWIW pkgconfig -&gt; pkgconf change also break gst-plugins-imsdk build in<b=
r>
meta-qcom. Reverting this series makes the build succeed.<br>
<br>
| FAILED: [code=3D1] gst-plugin-mlaconverter/CMakeFiles/gstqtimlaconverter.=
dir/audio-converter-engine.cc.o<br>
| ccache /home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-q=
com-linux/gst-plugins-imsdk/0.1.0/recipe-sysroot-native/usr/bin/aarch64-qco=
m-linux/aarch64-qcom-linux-g++ --sysroot=3D/home/lumag/Projects/RPB/build-r=
pb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins-imsdk/0.1.0/recipe-=
sysroot -DHAVE_CONFIG_H -DHAVE_LINUX_DMA_BUF_H -Dgstqtimlaconverter_EXPORTS=
 -I/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-li=
nux/gst-plugins-imsdk/0.1.0/build/gst-plugin-mlaconverter -I/home/lumag/Pro=
jects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins-im=
sdk/0.1.0/sources/gst-plugins-imsdk-0.1.0/gst-plugin-mlaconverter -I/home/l=
umag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-pl=
ugins-imsdk/0.1.0/recipe-sysroot/usr/include/gstreamer-1.0 -I/home/lumag/Pr=
ojects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins-i=
msdk/0.1.0/recipe-sysroot/usr/include/glib-2.0 -I/home/lumag/Projects/RPB/b=
uild-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins-imsdk/0.1.0/r=
ecipe-sysroot/usr/lib/glib-2.0/include -I/usr/include/gstreamer-1.0 -I/home=
/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-=
plugins-imsdk/0.1.0/sources/gst-plugins-imsdk-0.1.0/gst-plugin-base -I/home=
/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-=
plugins-imsdk/0.1.0/recipe-sysroot/usr/include/json-glib-1.0 -I/home/lumag/=
Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins=
-imsdk/0.1.0/recipe-sysroot/usr/include/libmount -I/home/lumag/Projects/RPB=
/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-plugins-imsdk/0.1.0=
/recipe-sysroot/usr/include/blkid -march=3Darmv8.2-a+crypto -mbranch-protec=
tion=3Dstandard -fstack-protector-strong=C2=A0 -O2 -D_FORTIFY_SOURCE=3D2 -W=
format -Wformat-security -Werror=3Dformat-security=C2=A0 --sysroot=3D/home/=
lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-p=
lugins-imsdk/0.1.0/recipe-sysroot=C2=A0 -O2 -g -fcanon-prefix-map=C2=A0 -ff=
ile-prefix-map=3D/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/ar=
mv8-2a-qcom-linux/gst-plugins-imsdk/0.1.0/sources/gst-plugins-imsdk-0.1.0=
=3D/usr/src/debug/gst-plugins-imsdk/0.1.0=C2=A0 -ffile-prefix-map=3D/home/l=
umag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-pl=
ugins-imsdk/0.1.0/build=3D/usr/src/debug/gst-plugins-imsdk/0.1.0=C2=A0 -ffi=
le-prefix-map=3D/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/arm=
v8-2a-qcom-linux/gst-plugins-imsdk/0.1.0/recipe-sysroot=3D=C2=A0 -ffile-pre=
fix-map=3D/home/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-=
qcom-linux/gst-plugins-imsdk/0.1.0/recipe-sysroot-native=3D=C2=A0 -pipe -fv=
isibility-inlines-hidden -Wall -Wextra -Werror -Wno-unused-parameter -std=
=3Dgnu++17 -fPIC -MD -MT gst-plugin-mlaconverter/CMakeFiles/gstqtimlaconver=
ter.dir/audio-converter-engine.cc.o -MF gst-plugin-mlaconverter/CMakeFiles/=
gstqtimlaconverter.dir/audio-converter-engine.cc.o.d -o gst-plugin-mlaconve=
rter/CMakeFiles/gstqtimlaconverter.dir/audio-converter-engine.cc.o -c /home=
/lumag/Projects/RPB/build-rpb/tmp-qcom-distro/work/armv8-2a-qcom-linux/gst-=
plugins-imsdk/0.1.0/sources/gst-plugins-imsdk-0.1.0/gst-plugin-mlaconverter=
/audio-converter-engine.cc<br>
| cc1plus: error: include location &quot;/usr/include/gstreamer-1.0&quot; i=
s unsafe for cross-compilation [-Werror=3Dpoison-system-directories]<br>
| cc1plus: all warnings being treated as errors<br>
| ninja: build stopped: subcommand failed.<br>
|<br>
| WARNING: exit code 1 from a shell command.<br>
ERROR: Task (/home/lumag/Projects/RPB/build-rpb/conf/../../layers/meta-qcom=
/recipes-multimedia/imsdk/gst-plugins-imsdk_0.1.0.bb:do_compile) failed wit=
h exit code &#39;1&#39;<br>
<br></blockquote><div><br></div><div>I wonder if CMake is using unwrapper&#=
39;ed=C2=A0version of pkgconf and not filterning=C2=A0non sysrooted=C2=A0ta=
rget paths. Try changing the CMakefiles.txt for the concerned plugin to use=
</div><div>IMPORTED_TARGET and see if it helps</div><div><br></div><div>cha=
nge</div><div>pkg_check_modules(GST<br>=C2=A0 REQUIRED gstreamer-1.0&gt;=3D=
${GST_VERSION_REQUIRED})</div><div><br></div><div>to</div><div>pkg_check_mo=
dules(GST<br>=C2=A0 REQUIRED IMPORTED_TARGET gstreamer-1.0&gt;=3D${GST_VERS=
ION_REQUIRED})</div><div>=C2=A0</div><div>in=C2=A0</div><div><br></div><div=
><a href=3D"https://github.com/qualcomm/gst-plugins-imsdk/blob/main/gst-plu=
gin-mlaconverter/CMakeLists.txt">https://github.com/qualcomm/gst-plugins-im=
sdk/blob/main/gst-plugin-mlaconverter/CMakeLists.txt</a></div><div><br></di=
v><div>It might help.</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
-- <br>
With best wishes<br>
Dmitry<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233836): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233836" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233836</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118416246/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118416246/1997914</a><br>
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

--000000000000b98bf0064dce69fd--

