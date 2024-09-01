Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1ACC54FC6
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 19:21:23 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.22827.1725218478706670162
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 12:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jck/UuGM;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso6082973e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 12:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725218477; x=1725823277; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uYSQ54uxjrrBXITY0hqa9Cd82LinpKRXhRjqv9fA5Y=;
        b=jck/UuGMyCcMUI4R2w76Sd5e62wrrrzIlvcBbRQs5c7rjKjxPlZgqxfSATwLuF+FmJ
         5N8bMTdXwg9NWPwOgJGpSIZoR84JHGdHkrmchS5Ew1yw7XAO8owYChKELoCYDMhQAZTM
         ZcSm1d02/S3PDFP0OIvgUjqvOGeMwPs7Xplz0J2Ln9MWmeGZ+IlkVU1CB1J05B8c4b/E
         cRgfWJ16t7l1NC3SXOANn1GVh7jhcz6yeerR+Vt3Jd12MQve2yKB6/+xRTIIMWrSnswt
         YLGZ2v73dR+Kmc6O3mkO7djruWL5wyIDNQDo9FCRMUnszhdh7wSHRjQjivsls1d8XAZt
         bm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725218477; x=1725823277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uYSQ54uxjrrBXITY0hqa9Cd82LinpKRXhRjqv9fA5Y=;
        b=ItVPavaIpxx/9GiFs5lzSTjNGxL9+5sfiS1CCTi07rmVyRFpism6iYEMf/z6c089qV
         N/v/K2PkpvKkdOyqvydwoRDwuGNpp2JWqZp8w1IKVzXafpX2/IN314SyxH7uJHy43Cyf
         cu1MEq16dbnnlIE4fvuguagNJUwBBPMVz89djWbfFrhpW8vdUZSyVrz6bEkhy2j4vGiR
         brkiCbg4J/Na0DMapE6PQyUYKDdUpmhAaLp26P4JK1rI71El6U9giwQMse9tPkTjysv2
         J51aJ1c+gKNXBs2etXHDXgP+kB8k8A3MCpauM4kq3eSEw00Tycg1qJWemRvDAL5DE8Sc
         1hIQ==
X-Gm-Message-State: AOJu0YzRGzhS/FuzJIrONfu385GCFFuzLi3oBDttQRzcCfj91jfdlAq6
	XXw+ZJuDfsjQp6BAybTjuxWCgw+DTskLF6PvWaSfgXibVJ+29vIIz/e2p47RfcRt2jJ79/cZSxq
	cG3IMnoPyjKArTuj9defGfft2KNilOgT0
X-Google-Smtp-Source: AGHT+IFX8aeHxkMabY38cN4uF93K0MfzPq9qAGhixhZTsDMxU8FdWAafzcAelzopbjpHS+ijn9PwJOJe5xZsurIKLkU=
X-Received: by 2002:a05:6512:1589:b0:52e:f2a6:8e1a with SMTP id
 2adb3069b0e04-53546b32cacmr6605098e87.29.1725218475756; Sun, 01 Sep 2024
 12:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <01010191ac50ac04-b8216d99-c9be-45d6-b8fd-f550fd8a6a5f-000000@us-west-2.amazonses.com>
In-Reply-To: <01010191ac50ac04-b8216d99-c9be-45d6-b8fd-f550fd8a6a5f-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 1 Sep 2024 21:21:04 +0200
Message-ID: <CANNYZj9fAgYHeJd2bpbR0LEG2cRg-tRf9Sp9kpLXK_6rbZa2dw@mail.gmail.com>
Subject: Re: [OE-core] [AUH] Upgrade status: 2024-09-01
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 19:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204057

This AUH run was thwarted by a botched libtool update - it's one of
those notorious corner cases that AUH hits occasionally. First,
libtool update failed thusly:
https://lists.openembedded.org/g/openembedded-core/topic/auh/108206634

(if I'm reading this right, libtool-native got upgraded first, but the
outcome was a non-functional libtool-native for the purpose of tasks
that 'devtool upgrade' needs to run)

Then, this somehow damaged the build dir so that no further builds in
it could happen, but AUH cannot tell when that happens and carries on
with the list of things to update:
https://lists.openembedded.org/g/openembedded-core/topic/auh/108206638

libtool releases have historically been rare, and RP has issued an
update for this one already. If new libtool releases continue to
subvert AUH, we can probably mark it as needing manual updates.

Alex





On Sun, 1 Sept 2024 at 08:42, Auto Upgrade Helper via
lists.openembedded.org <auh=3Dyoctoproject.org@lists.openembedded.org>
wrote:
>
> AUH finished upgrade batch the result patches/logs can be found at:
> https://autobuilder.yocto.io/pub/auh/20240901050051, next are the statist=
ics:
>
> Recipe upgrade statistics:
>
>     * Failed (devtool error): 12
>         glib-2.0, 2.82.0, Anuj Mittal <anuj.mittal@intel.com>
>         glib-2.0-initial, 2.82.0, Anuj Mittal <anuj.mittal@intel.com>
>         go-crosssdk-x86_64-pokysdk-linux, 1.23.0, Khem Raj <raj.khem@gmai=
l.com>
>         go-cross-canadian-x86-64, 1.23.0, Khem Raj <raj.khem@gmail.com>
>         go, 1.23.0, Khem Raj <raj.khem@gmail.com>
>         go-cross-core2-64, 1.23.0, Khem Raj <raj.khem@gmail.com>
>         go-runtime, 1.23.0, Khem Raj <raj.khem@gmail.com>
>         libtool-native, 2.5.2, Robert Yang <liezhi.yang@windriver.com>
>         libtool, 2.5.2, Robert Yang <liezhi.yang@windriver.com>
>         nativesdk-libtool, 2.5.2, Richard Purdie <richard.purdie@linuxfou=
ndation.org>
>         libtool-cross, 2.5.2, Robert Yang <liezhi.yang@windriver.com>
>         wayland-protocols, 1.37, Denys Dmytriyenko <denis@denix.org>
>     * Succeeded: 3
>         cmake, 3.30.3, Unassigned <unassigned@yoctoproject.org>
>         cmake-native, 3.30.3, Unassigned <unassigned@yoctoproject.org>
>         go-binary-native, 1.23.0, Khem Raj <raj.khem@gmail.com>
>     * Failed(other errors): 58
>         rust-llvm, 1.80.1, Randy MacLeod <Randy.MacLeod@windriver.com>
>         rust, 1.80.1, Randy MacLeod <Randy.MacLeod@windriver.com>
>         libstd-rs, 1.80.1, Randy MacLeod <Randy.MacLeod@windriver.com>
>         cargo, 1.80.1, Randy MacLeod <Randy.MacLeod@windriver.com>
>         lttng-tools, 2.13.14, Richard Purdie <richard.purdie@linuxfoundat=
ion.org>
>         gstreamer1.0-plugins-ugly, 1.24.7, Anuj Mittal <anuj.mittal@intel=
.com>
>         gstreamer1.0-plugins-bad, 1.24.7, Anuj Mittal <anuj.mittal@intel.=
com>
>         gstreamer1.0-rtsp-server, 1.24.7, Anuj Mittal <anuj.mittal@intel.=
com>
>         gstreamer1.0-plugins-base, 1.24.7, Anuj Mittal <anuj.mittal@intel=
.com>
>         gstreamer1.0-plugins-good, 1.24.7, Anuj Mittal <anuj.mittal@intel=
.com>
>         dhcpcd, 10.0.10, Unassigned <unassigned@yoctoproject.org>
>         libpcap, 1.10.5, Anuj Mittal <anuj.mittal@intel.com>
>         nfs-utils, 2.7.1, Robert Yang <liezhi.yang@windriver.com>
>         ofono, 2.10, Ross Burton <ross.burton@arm.com>
>         socat, 1.8.0.1, Hongxu Jia <hongxu.jia@windriver.com>
>         ell, 0.68, Zang Ruochen <zangruochen@loongson.cn>
>         ovmf, edk2-stable202408, Unassigned <unassigned@yoctoproject.org>
>         sysvinit, 3.10, Ross Burton <ross.burton@arm.com>
>         libtry-tiny-perl, 0.32, Tim Orling <tim.orling@konsulko.com>
>         python3-certifi, 2024.8.30, Tim Orling <tim.orling@konsulko.com>
>         python3-cryptography, 43.0.0, Tim Orling <tim.orling@konsulko.com=
>
>         python3-idna, 3.8, Bruce Ashfield <bruce.ashfield@gmail.com>
>         python3-markdown, 3.7, Alexander Kanavin <alex.kanavin@gmail.com>
>         python3-maturin, 1.7.1, Tim Orling <tim.orling@konsulko.com>
>         python3-numpy, 2.1.0, Trevor Gamblin <tgamblin@baylibre.com>
>         python3-pbr, 6.1.0, Zang Ruochen <zangruochen@loongson.cn>
>         python3-pyproject-hooks, 1.1.0, Ross Burton <ross.burton@arm.com>
>         python3-setuptools, 74.0.0, Trevor Gamblin <tgamblin@baylibre.com=
>
>         python3-websockets, 13.0.1, Tim Orling <tim.orling@konsulko.com>
>         python3-zipp, 3.20.1, Tim Orling <tim.orling@konsulko.com>
>         acpica, 20240827, Ross Burton <ross.burton@arm.com>
>         go-helloworld, 0.1-new-commits-available, Khem Raj <raj.khem@gmai=
l.com>
>         libpipeline, 1.5.8, Wang Mingyu <wangmy@fujitsu.com>
>         man-db, 2.13.0, Hongxu Jia <hongxu.jia@windriver.com>
>         mc, 4.8.32, Ross Burton <ross.burton@arm.com>
>         screen, 5.0.0, Anuj Mittal <anuj.mittal@intel.com>
>         gtk4, 4.14.5, Markus Volk <f_l_k@t-online.de>
>         json-glib, 1.10.0, Yi Zhao <yi.zhao@windriver.com>
>         librsvg, 2.58.3, Anuj Mittal <anuj.mittal@intel.com>
>         libdrm, 2.4.123, Otavio Salvador <otavio.salvador@ossystems.com.b=
r>
>         mesa, 24.2.1, Otavio Salvador <otavio.salvador@ossystems.com.br>
>         piglit, 1.0-new-commits-available, Ross Burton <ross.burton@arm.c=
om>
>         vulkan-samples, git-new-commits-available, Ross Burton <ross.burt=
on@arm.com>
>         libinput, 1.26.2, Ross Burton <ross.burton@arm.com>
>         wayland, 1.23.1, Denys Dmytriyenko <denis@denix.org>
>         gst-devtools, 1.24.7, Anuj Mittal <anuj.mittal@intel.com>
>         gstreamer1.0-libav, 1.24.7, Anuj Mittal <anuj.mittal@intel.com>
>         gstreamer1.0-python, 1.24.7, Anuj Mittal <anuj.mittal@intel.com>
>         gstreamer1.0-vaapi, 1.24.7, Anuj Mittal <anuj.mittal@intel.com>
>         gstreamer1.0, 1.24.7, Anuj Mittal <anuj.mittal@intel.com>
>         puzzles, 0.0-new-commits-available, Anuj Mittal <anuj.mittal@inte=
l.com>
>         apr, 1.7.5, Hongxu Jia <hongxu.jia@windriver.com>
>         diffoscope, 277, Joshua Watt <JPEWhacker@gmail.com>
>         gnutls, 3.8.7.1, Simone Wei=C3=9F <simone.p.weiss@posteo.net>
>         libsoup, 3.6.0, Anuj Mittal <anuj.mittal@intel.com>
>         liburcu, 0.14.1, Wang Mingyu <wangmy@fujitsu.com>
>         nghttp2, 1.63.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         taglib, 2.0.2, Anuj Mittal <anuj.mittal@intel.com>
>
>     TOTAL: attempted=3D73 succeeded=3D3(4.11%) failed=3D70(95.89%)
>
> Recipe upgrade statistics per Maintainer:
>
>     Robert Yang <liezhi.yang: attempted=3D4 succeeded=3D0(0.00%) failed=
=3D4(100.00%)
>     Joshua Watt <JPEWhacker: attempted=3D1 succeeded=3D0(0.00%) failed=3D=
1(100.00%)
>     Zang Ruochen <zangruochen: attempted=3D2 succeeded=3D0(0.00%) failed=
=3D2(100.00%)
>     Khem Raj <raj.khem: attempted=3D7 succeeded=3D1(14.29%) failed=3D6(85=
.71%)
>     Simone Wei=C3=9F <simone.p.weiss: attempted=3D1 succeeded=3D0(0.00%) =
failed=3D1(100.00%)
>     Denys Dmytriyenko <denis: attempted=3D2 succeeded=3D0(0.00%) failed=
=3D2(100.00%)
>     Otavio Salvador <otavio.salvador: attempted=3D2 succeeded=3D0(0.00%) =
failed=3D2(100.00%)
>     Bruce Ashfield <bruce.ashfield: attempted=3D1 succeeded=3D0(0.00%) fa=
iled=3D1(100.00%)
>     Yi Zhao <yi.zhao: attempted=3D1 succeeded=3D0(0.00%) failed=3D1(100.0=
0%)
>     Richard Purdie <richard.purdie: attempted=3D2 succeeded=3D0(0.00%) fa=
iled=3D2(100.00%)
>     Trevor Gamblin <tgamblin: attempted=3D2 succeeded=3D0(0.00%) failed=
=3D2(100.00%)
>     Unassigned <unassigned: attempted=3D4 succeeded=3D2(50.00%) failed=3D=
2(50.00%)
>     Alexander Kanavin <alex.kanavin: attempted=3D2 succeeded=3D0(0.00%) f=
ailed=3D2(100.00%)
>     Randy MacLeod <Randy.MacLeod: attempted=3D4 succeeded=3D0(0.00%) fail=
ed=3D4(100.00%)
>     Tim Orling <tim.orling: attempted=3D6 succeeded=3D0(0.00%) failed=3D6=
(100.00%)
>     Hongxu Jia <hongxu.jia: attempted=3D3 succeeded=3D0(0.00%) failed=3D3=
(100.00%)
>     Ross Burton <ross.burton: attempted=3D8 succeeded=3D0(0.00%) failed=
=3D8(100.00%)
>     Anuj Mittal <anuj.mittal: attempted=3D18 succeeded=3D0(0.00%) failed=
=3D18(100.00%)
>     Wang Mingyu <wangmy: attempted=3D2 succeeded=3D0(0.00%) failed=3D2(10=
0.00%)
>     Markus Volk <f_l_k: attempted=3D1 succeeded=3D0(0.00%) failed=3D1(100=
.00%)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204035): https://lists.openembedded.org/g/openembedde=
d-core/message/204035
> Mute This Topic: https://lists.openembedded.org/mt/108206687/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

