Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0080DC433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 17:20:14 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web09.79921.1638292812370958763
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 09:20:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cRHDpLCe;
 spf=pass (domain: gmail.com, ip: 209.85.221.177,
 mailfrom: joel.winarske@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id e27so14126308vkd.4
        for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 09:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=IJZOebzkLRSWda34VqMgzZk8jXYzlzY1ZSrJamt1Sws=;
        b=cRHDpLCeNmryKEf+as0Mp7Tp/lSRt4rNL3f/d+ONDw5RagisxkS3DusykpLgyJ28Da
         lce0k0PqfVwzHTf6ta6jVLvE8Hh+d0rmKQPeHE+D0UAJ2Qe+CEy6owegNwEHVKV53MEN
         LBYVGU7tbzwFfgA3qm3oV6tCggvYHsnIC+Q6JzD+KmX+l8pckQ0T1s0B97wOoBhbu4ks
         oizCoA8Js4FOZXIK3foebVO3SkQkIl4NbBr6yyaOgc+/YjHdki0WuaOMD0K3StuByKBT
         jJxwHXUhk1/Na49u+BMvzQI4WkhtoY1b1v58iMgeWbt407cIwgKDUAc84X9ju2Xl3e83
         IZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=IJZOebzkLRSWda34VqMgzZk8jXYzlzY1ZSrJamt1Sws=;
        b=t6e+Vc0b1pnFauUyUYDyZ0l9aPTu94Ua1WXgm6jtxD1UKH5J/TZv8ItagCG5quZAXf
         2ceZXP7oa6A7h5uY1eyqL0KIfHAlMBgdFiG+MKN7jTmNP1KgA5yTXzTlWkv4ndCdePII
         1/HxiixvegTFMyts/RvqBKqpkasMNRbDvlYCb/KQNoVU8Weg99Sn0YaKKtOXikz47yAY
         1Fla89cX9QuBWlGut5NxiuYwAQqTb2lHboeNHzOmAiBQzWqC95irqAAdQonJm0f3G2w9
         fgfmIkD4aZKtMokARZjeRkt6AeNLnVOm0GV3R+dBYMc9s92OPsPrZD0uBxwwDyjdngwD
         zrGQ==
X-Gm-Message-State: AOAM530G1pF7qbXveLFTvcfSOGuMlhJboESe8EJ9mhodMaA4uVTn+q0Y
	o/QdZ0h3fIxoUm572MQ3i5tR2ZSJ0efNKD/ZcA+PNRFw+TE=
X-Google-Smtp-Source: 
 ABdhPJysUuAhghZW4dBki0yAudaRvJn+yXRhiMurb+BJthWpUnGjTOnsrcbpUtc/Kk1Zgw0tMcOYDPZp2C8l5LIQs2c=
X-Received: by 2002:a05:6122:1796:: with SMTP id
 o22mr86121vkf.23.1638292811265;
 Tue, 30 Nov 2021 09:20:11 -0800 (PST)
MIME-Version: 1.0
From: Joel Winarske <joel.winarske@gmail.com>
Date: Tue, 30 Nov 2021 09:20:00 -0800
Message-ID: 
 <CABKMkPJoE74O2OnAe7WsLSu56Ww4ZfPfxksZ43-Np43otAhRWA@mail.gmail.com>
Subject: [RFC] meson needs a pkg-config wrapper script
To: Openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000dbb3c05d204c512"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 17:20:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158983

--0000000000000dbb3c05d204c512
Content-Type: text/plain; charset="UTF-8"

Meson does not expose PKG_CONFIG_SYSROOT_DIR to the pkg-config process.

Currently meson.cross as generated in meson.bbclass points directly to the
pkg-config executable (no wrapper script).

PKG_CONFIG_SYSROOT_DIR behaves like a simple string prepend to all package
config variable queries.  So if you want to determine the absolute path of
a variable in .pc you set PKG_CONFIG_SYSROOT_DIR and make your query.
Currently this is not possible with Yocto+Meson.

I think a simple wrapper script would resolve this.  This is from
https://autotools.io/pkgconfig/cross-compiling.html:

#!/bin/sh

SYSROOT=/build/root

export PKG_CONFIG_PATH=
export PKG_CONFIG_LIBDIR=${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/usr/share/pkgconfig
export PKG_CONFIG_SYSROOT_DIR=${SYSROOT}

exec pkg-config "$@"


The wrapper script would be generated per recipe via meson.bbclass,
meson.cross would then reference this wrapper instead of the pkg-config
executable.

Thoughts?


Joel

--0000000000000dbb3c05d204c512
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div></div><div><div>Meson does not expose PKG_CONFIG_SYSR=
OOT_DIR to the pkg-config process.</div></div><div><br></div><div>Currently=
 meson.cross as generated in meson.bbclass points directly to the pkg-confi=
g executable (no wrapper script).</div><div><br></div><div>PKG_CONFIG_SYSRO=
OT_DIR behaves like a simple string prepend to all package config variable =
queries.=C2=A0 So if you want to determine the absolute path of a variable =
in .pc you set PKG_CONFIG_SYSROOT_DIR and make your query.=C2=A0 Currently =
this is not possible with Yocto+Meson.<br></div><div><br></div>I think a si=
mple wrapper script would resolve this.=C2=A0 This is from <a href=3D"https=
://autotools.io/pkgconfig/cross-compiling.html">https://autotools.io/pkgcon=
fig/cross-compiling.html</a>:<br><div></div><div></div><div><pre class=3D"g=
mail-programlisting">#!/bin/sh

SYSROOT=3D/build/root

export PKG_CONFIG_PATH=3D
export PKG_CONFIG_LIBDIR=3D${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/usr/shar=
e/pkgconfig
export PKG_CONFIG_SYSROOT_DIR=3D${SYSROOT}

exec pkg-config &quot;$@&quot;</pre></div><div></div><div><br></div><div></=
div><div>The wrapper script would be generated per recipe via meson.bbclass=
, meson.cross would then reference this wrapper instead of the pkg-config e=
xecutable.<br></div><div></div><div><br></div><div>Thoughts?<br></div><div>=
</div><div><br></div><div><br></div><div>Joel<br></div></div>

--0000000000000dbb3c05d204c512--

