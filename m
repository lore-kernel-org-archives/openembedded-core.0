Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77127C0218E
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 12:58:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.29494.1737896299509095509
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 04:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ieFyujx4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so22592305e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 04:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737896297; x=1738501097; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pVrxQ2dwOJUUvBSqaNQn0KG6WDGzm7d8T8l7T+v+OaQ=;
        b=ieFyujx4cwpEUXs+dajrlM1RZhPPP8e+cZ7XWbqhB2888U1eYfazEPbxmZV6+I9Hy4
         xEMe2PeD8rEJCNbxfTwTDf3qjy7l7YSbudr+j/uHyrp2T2A16SIDaduhgigWZ9Z9wTQR
         cWezC+UzJRyleWn8nIViCLDVs8ZWQhZNCNSeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737896297; x=1738501097;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pVrxQ2dwOJUUvBSqaNQn0KG6WDGzm7d8T8l7T+v+OaQ=;
        b=OdfbK6ldf5fS+harZB5ZtD6Zr4G6JJXGCdzyFyoPuVICPhishyZd9phNVfmaeS88Lv
         9qJcqHwPc8GLsn98yvN2X4y/upw/pl+e827c6AkaCAUfZNIfvWRJCyUC+esCj+JWkI46
         lOVzWxKVX0d3fTkIiaxryfKRdo2lJDN2+bSAaUx10xk+x1IwynZaudhuflrGJR/9kkiz
         uglsNy8IHvyhZo8/urExF5OoWVjROu8gjndF5lQUrxYzPYTss3iBIccVvOK0QifslEqs
         DDqF/9VORHMulzB2AvwWwizpcyv2M8aNF2/Hu9MGEVnQ2C8s64gufYYjHX72OKopSKwS
         0lUg==
X-Forwarded-Encrypted: i=1; AJvYcCVgM5Gbbmd/9wc0i8xDV47L5Wfz/olnNQf2ZGFpi/nxnQu6NR6/q56ruwUsI7CwGtOyDmzX+9MwCqSo4Wz1dWsFqA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyievGcZhgoFt1HztJH9Zo8n877vEuBLN3ooRNFxg/2om3pC0tX
	qOZrGd51XfEbAHxA0eArtAYpV8+1219WqDk2CVo8csnEKdG4ONTbk0SGB2vIVEs=
X-Gm-Gg: ASbGnctVM4X0YFp/mZU5bm2Tq8Ezx8qra7eu4jRC64w7ELNiRi4LDjbDyNCaFoWNrvb
	5QyYbLFKU2Xt/jY5RMxnO7S81SWwAvShsc6EkGuIpo0lsmaa4Xb1dPa+BqOr0wTUK1g613KIgLh
	xmsjSSnqaYF0jolPcclUaEPU0V8AyuFVW67ywVBHBCIs/EcUejkO21h0m2tVipIiThft4/VprWF
	YWtNG34MxHzzEQ5W6sAnZ5yKb/wvze7IzP2pHqEG7m4FnnW0jbAnw0zC804ij5Z1pr9qhFey7A9
	dVaw9eJuGuNUKz/+yCXcRpWt8pXcYo5nBJCXc5oIJHAPMCTBhY04IPZZGoYE998gV1o=
X-Google-Smtp-Source: AGHT+IHC3X4FQnamL1q1ds0tfRJATgrmV3/wwU80bCWysrtM7bplUt+aGkL46o2wDoS3ABXQghoR7w==
X-Received: by 2002:a05:6000:1f85:b0:385:fbb7:672d with SMTP id ffacd0b85a97d-38bf57b6438mr29230091f8f.52.1737896297360;
        Sun, 26 Jan 2025 04:58:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6905:4568:b67b:291? ([2001:8b0:aba:5f3c:6905:4568:b67b:291])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188fe8sm8155410f8f.56.2025.01.26.04.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 04:58:16 -0800 (PST)
Message-ID: <f62ca5e64bb174608d33f2f88c45da1c70830c93.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] busybox: drop net-tools from defconfig
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ejo@pengutronix.de, openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Andrej Valek <andrej.v@skyrain.eu>
Date: Sun, 26 Jan 2025 12:58:15 +0000
In-Reply-To: <20250126115104.1148761-1-ejo@pengutronix.de>
References: <20250126115104.1148761-1-ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 12:58:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210287

On Sun, 2025-01-26 at 12:51 +0100, Enrico J=C3=B6rns via
lists.openembedded.org wrote:
> The 'net-tools' have been deprecated 15 years ago! [1]
> Let's remove their busybox pendants from the defconfig to prevent
> people
> from accidentally starting projects with ancient technology.
>=20
> [1] https://lists.debian.org/debian-devel/2009/03/msg00780.html
>=20
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
> =C2=A0meta/recipes-core/busybox/busybox/defconfig | 10 +++++-----
> =C2=A01 file changed, 5 insertions(+), 5 deletions(-)

I did a quick grep of OE-Core and we still have a handful of sites
using this on target, particularly but not limited to our QA, the ones
that caught my eye:

meta/recipes-core/udev/udev-extraconf/network.sh:    	ifconfig | grep -q "^=
$INTERFACE" || ifup $INTERFACE
meta/recipes-core/images/build-appliance-image/README_VirtualBox_Toaster.tx=
t:    $ ifconfig
meta/recipes-core/images/build-appliance-image/README_VirtualBox_Toaster.tx=
t:    $ ifconfig
meta/recipes-core/busybox/files/simple.script:                             =
   /SBIN_DIR/ifconfig $interface 0.0.0.0
meta/recipes-core/busybox/files/simple.script:                        /SBIN=
_DIR/ifconfig $interface $ip $BROADCAST $NETMASK
meta/lib/oeqa/selftest/cases/devtool.py:            result =3D runCmd('PATH=
=3D"$PATH:/sbin:/usr/sbin" ifconfig -a', ignore_status=3DTrue)
meta/lib/oeqa/selftest/cases/devtool.py:                self.skipTest('Fail=
ed to determine if tap devices exist with ifconfig or ip: %s' % result.outp=
ut)
meta/lib/oeqa/utils/qemurunner.py:                    cmd =3D "ifconfig eth=
0 %s netmask %s up\n" % (self.ip, self.netmask)
meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py:        (status, output)=
 =3D self.target.run("ifconfig eth0 | grep 'inet ' | awk '{print $2}'")
meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py:        (status, output)=
 =3D self.target.run("ifconfig eth0:1 %s netmask 255.255.255.0 && sleep 2 &=
& ping -c 5 %s && ifconfig eth0:1 down" % (virtual_ip,virtual_ip))

but there are others too. We probably need to finish resolving these to
other commands before we can turn this off.

If you aren't able to help with that, we should at least have an open
bug to sort it out.

Cheers,

Richard

