Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E836C83F10
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 16:23:17 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.39724.1752337388293159512
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 09:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cBDsNB2z;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-708d90aa8f9so28501277b3.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752337387; x=1752942187; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TC2O4ApmPlH7xmwmmyAA1K5Tn3sXTZ4gu8Jp98CvVEY=;
        b=cBDsNB2zWubZEqAWF3N08UBLKGl/Jpl67Q9bJm/RB+niKEjQQJ/HdGN2b3oUsYnDF6
         90zT6DS03ri5REmEJ6v1ZCr+liq+KdgdrOybXykwWjH/4P8eHrQuG5hlopjDrMMR9YJw
         iq9zHAVlXbTqFvCTJeXj+AbC6BM9WnPwSViDgzASzqT2mhlLP+apZJkejzts/zIqGuNQ
         Vr4V4KfLyszaxyI1AIrT4McREqF9Dklr38pGeIVa/FQOsRTRl9GZPErBpbHsiT9iUg9O
         Lwog2IHY+uaMbWAaleY6N2fDyN0FhmOFgRRESf4pumQiKVqTlJf0gnGQ1vgMx2asRh8Q
         /qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752337387; x=1752942187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TC2O4ApmPlH7xmwmmyAA1K5Tn3sXTZ4gu8Jp98CvVEY=;
        b=Gls7xQ78dhGC9ORZ6rRDSqqdOrHNRhBg+xiTqoocRc8MB2emVybl7NIkS4RlqjOvQI
         VTbneqTEQOlCmRoew9zLf5BU1i6OhCNTIi38zKV/KcAxIKJpmy8WsY2LGJi8WvDh3MEO
         QGzbIz2Hvq8bMt5yPgTAiRgIRCUJ3/j3sojeMPvcrzA8kQ9RgwHnpoX9MjIOYprfB7qR
         UotF8BgLY7NNtlUc5f8i024Tb4So+cyXb1Oi9Yt0MKdZiCeTTDC4fmO6mr71ZbG2txo6
         8vVyFE7GCBqCUZuXTmrxECgR95rNhGhv9KBLFWhJM7GikE0d0dIcnn2/Uy6XL05Lg6IZ
         SNVg==
X-Forwarded-Encrypted: i=1; AJvYcCVhV1Hc5CgJk4ffRVo0CHz2bHIt60nj/UL+BZWMXQJORn4Nfg7pbtu9j7N7RT65L73LaFvcksgPcnw1J70vW4+59A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQqvAqqi85VYLbPw69NmmCUd3tRJAj2mHwOygvHC+A2PtZvB4I
	8Ldl0FWSyGycwlvLOIZa81YnD54bEWOhnE7di1lNpPEGf7I99ZD3Il1odt7GHmaQ/LxdRqnAn4y
	iPLRzvQbv1RvZacCNdHpYSr+fPXon2F8=
X-Gm-Gg: ASbGncvTvhHrcbNofkT20nMmUSVfcorMXILC+/LBkqSxL1MVsE5F6YgvBTifvOgJ9op
	5V5tqkMeseKzISn5RVNpfy5loFg5RD+zJN43Qo7z8rFMZv2uK3OHQ5xHwhseIqcuRBPtc4eTxlw
	Mw/oRHiANXoZg1eT5OqnbypO+cHz/8xLZjMSWEg8NnsEjK6M0wc4R+Esl8vU1Z7hQ/20WCbnXN+
	NZIz6o=
X-Google-Smtp-Source: AGHT+IEYVkJfjqbUjmYp6XoF01eKIDdXH0R5g0FzF72PwQNrIbV3tnLM/YUaLajQYrHsDA/qAjQOUYK1aCMREORAz4E=
X-Received: by 2002:a05:690c:350f:b0:710:f2a1:fa6 with SMTP id
 00721157ae682-717d5df0fdfmr115266387b3.29.1752337387305; Sat, 12 Jul 2025
 09:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <8340.1751980391085408362@lists.openembedded.org> <DB3PR09MB6202D15953E63F9683D3A14EEA48A@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <CAMKF1spsAzE8MKQeemmi2Gs5PTSB4-KfdkRNo8P7KAUhbF1Znw@mail.gmail.com>
 <CAGpma=4Kr8D_R7Sn3mQNc5Eg-06DwK2fAmuunXZyESemFx1+VQ@mail.gmail.com>
 <CAMKF1sqm+88C1s0M7p4YQAFzFfY_6SZPjh+CvpvD87JkHb4bGg@mail.gmail.com> <DB3PR09MB620227B14CC05C925B253B93EA4BA@DB3PR09MB6202.eurprd09.prod.outlook.com>
In-Reply-To: <DB3PR09MB620227B14CC05C925B253B93EA4BA@DB3PR09MB6202.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Jul 2025 09:22:41 -0700
X-Gm-Features: Ac12FXzgAvmCH-a2GVwjTV5PA6uIQ74LSdTPpoyUyu4jhjcpesoWbO6_XKNCyhU
Message-ID: <CAMKF1soMZMsFrKyW5TYNY1Eu+0XUHmRDyPQyTWjGEncpUxXs+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
To: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
Cc: Alper Ak <alperyasinak1@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, "f_l_k@t-online.de" <f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 16:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220195

Somehow errors.yp.org is not responsing so my latest build errors are
not being reported, we are left with 28 failures

Summary: 26 tasks failed:
  meta-openembedded/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb:do_configur=
e
  meta-openembedded/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb:do_=
configure
  meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.1.bb:do_config=
ure
  meta-openembedded/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.=
14.bb:do_configure
  meta-openembedded/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb:d=
o_configure
  meta-openembedded/meta-oe/recipes-devtools/libubox/libubox_git.bb:do_conf=
igure
  meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb:do_co=
nfigure
  meta-openembedded/meta-oe/recipes-dbs/soci/soci_4.0.3.bb:do_configure
  meta-openembedded/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb:do_conf=
igure
  meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whisk=
ermenu-plugin_2.7.1.bb:do_configure
  meta-openembedded/meta-multimedia/recipes-multimedia/musicbrainz/libmusic=
brainz_git.bb:do_compile
  virtual:native:meta-openembedded/meta-oe/recipes-connectivity/obex/openob=
ex_1.7.2.bb:do_configure
  meta-openembedded/meta-xfce/recipes-apps/catfish/catfish_4.18.0.bb:do_con=
figure
  virtual:native:meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3=
.1.bb:do_configure
  meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_=
1.16.bb:do_configure
  meta-openembedded/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb:do_co=
nfigure
  virtual:native:meta-openembedded/meta-oe/recipes-extended/wxwidgets/wxwid=
gets_3.2.6.bb:do_configure
  meta-openembedded/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.b=
b:do_configure
  meta-openembedded/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb:d=
o_configure
  meta-openembedded/meta-networking/recipes-connectivity/openthread/ot-br-p=
osix_git.bb:do_configure
  meta-openembedded/meta-networking/recipes-connectivity/openthread/ot-daem=
on_git.bb:do_configure
  meta-openembedded/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12=
.0.bb:do_configure
  meta-openembedded/meta-networking/recipes-connectivity/nanomsg/nngpp_git.=
bb:do_configure
  meta-openembedded/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb:do_=
configure
  meta-openembedded/meta-oe/recipes-connectivity/transmission/transmission_=
4.0.6.bb:do_compile
  meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.11.0.bb:do_comp=
ile

On Fri, Jul 11, 2025 at 3:25=E2=80=AFAM Haase Moritz, JD-62 <Moritz.Haase@b=
mw.de> wrote:
>
> Hi,
>
> awesome, we are closing the gap :) I just sent another 10 patches to the =
mailing
> list via [0]. Hope to get some more done today, will keep the shared spre=
adsheet
> (very good idea BTW) updated.
>
> [0]: https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_pa=
tch_00_10/114097827
>
> Moritz

