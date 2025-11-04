Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456D3CCFA13
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 23:05:28 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.299.1762297527637865459
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 15:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LKhbce3j;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-63e330a1360so6289729d50.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 15:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762297527; x=1762902327; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OD4RyLwaxbOcm7WSU278AkbWcbT3apDafs2TDwofMWU=;
        b=LKhbce3jJy0u3QxlVk8LT3J8AAS7yycJarsbziZvZLJbNQTxWyqN48yDMKdVzmTlOj
         LbhIIjxfv2R2CWMc4MhmcaqQSsCWkc2bdn9+HSYvmerkMQq3pBcyGKjOVh16LMsYH+gr
         5qD+D3vSWrIDyvzfzVCOkNweDKLxIWRShNrcTRpVTLej+wI+bMYPsB7QpvYvXl3Q+28T
         dUgT52kzFDSPc5pBkoN94OESzQK9VDv94HD5a3HDNinpkWfpKvtPhWPkzzycBhQ5wXoQ
         fErKYZqEq+8hrgFvn+DukhxBcKWR/iOIf4Niag2b+IVVD2p7nS2JpC7+Lpirh1aCvP+U
         LPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297527; x=1762902327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OD4RyLwaxbOcm7WSU278AkbWcbT3apDafs2TDwofMWU=;
        b=KqPnSyDZ+k6mzLkU0/8uc0sFLwr0RAhtp28mx1YlidKib34pbYdRrOikbzvtgYluCo
         4CFX5jOhjjpp3O3kb4eIOkcVvfXRYBW4ThwXmzYgrebauAMVp8lXFa0kT9GXvVekgO0e
         68TfapJ6ilwWL/GsBs0HdQvYV+IhM1Ubjp3MVVSCF7aRCaj201ZCsw/Q+fbJ4TbVb3UO
         6lpkiubxMv8hv+KAe//lkp5UOdupbdyO/AbxqnDsn2TAjQdThbyJvEqqCjYub1gr1xAx
         YouyIspit7NtjE/5eLQLHIV4K9yvMC8yWyM0+pJRHengCc1d9JMluJsUk6rvQmQTuf77
         TFxA==
X-Gm-Message-State: AOJu0Yw/mwnMgK3cADKZFH2ZmN07VemJhzCy64jT5/0cklLsRKbujbH3
	U2JP4/LV5mx5IQ/UKom/j+iX+Wo9gypmRS3GSmvBcI8+jonc8lKcCDOJvHYkCMk4HefspQhj/1j
	F6QUAi0Mp0E3iw9E+46Aof3jihQGGaqk=
X-Gm-Gg: ASbGnct7dmaN+GuIukdtvYojyLe7zEuyHuhSgnNNiFIDdpAD3UylKUMoZLEPLRjXPdH
	1DRN+JP6N0mK5PXkFFyhEk4ar4x2eT2tff0KJ00On3oto7VPeuyEuj2YuFAUZX9a97TJEmrFZvI
	/8npz8jDufiZnj31jmamfSDTTHlIymoKBFdFskLzEw865TrkHO4Wv4hzD+ZjiJBLTUD/oTssTu/
	grnyXhZGM/543lbvn6eNnzMwpC0zu3BErP4DFxRQEVbMUhrxQQVbjAYH12Z18J655chbRvEissn
	KgXaNoiU0gUJI2ebDH85fOTu3kPueraPlEbsnaXUMtkieA==
X-Google-Smtp-Source: AGHT+IH+eQak5kzN6n3UChc2YKPAp380jgxkSEdri/ScTJnJwxKwjj7CYH8JAhZfchzITM01qt2gccWTaA1KeYPriMI=
X-Received: by 2002:a05:690e:4109:b0:63f:b9d1:b165 with SMTP id
 956f58d0204a3-63fd359be98mr806423d50.50.1762297526667; Tue, 04 Nov 2025
 15:05:26 -0800 (PST)
MIME-Version: 1.0
References: <tencent_5A2A52EA8E20CDC9A5F4546616BFFA67FC07@qq.com>
In-Reply-To: <tencent_5A2A52EA8E20CDC9A5F4546616BFFA67FC07@qq.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Nov 2025 15:04:59 -0800
X-Gm-Features: AWmQ_blyrrV1yW7wPcGP0I3uZVGDcVwWBLAgttkKO6keNx_dexG18tXUPhdmZ0s
Message-ID: <CAMKF1sq_njQuhUFmX=a+Z9whbrZ0+m36iyRe2qE5NNXXNcUt9Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nethogs: add recipe
To: wenyang.linux@foxmail.com
Cc: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 23:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225743

On Tue, Nov 4, 2025 at 2:56=E2=80=AFPM wenyang.linux via
lists.openembedded.org
<wenyang.linux=3Dfoxmail.com@lists.openembedded.org> wrote:
>
> From: Wen Yang <wenyang.linux@foxmail.com>
>
> NetHogs is a small 'net top' tool. Instead of breaking the traffic
> down per protocol or per subnet, like most tools do, it groups
> bandwidth by process.
>
> Signed-off-by: Wen Yang <wenyang.linux@foxmail.com>
> ---
>  .../recipes-connectivity/nethogs/nethogs.inc   | 18 ++++++++++++++++++
>  .../nethogs/nethogs_0.8.8.bb                   |  4 ++++
>  2 files changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/nethogs/nethogs.inc
>  create mode 100644 meta-oe/recipes-connectivity/nethogs/nethogs_0.8.8.bb
>
> diff --git a/meta-oe/recipes-connectivity/nethogs/nethogs.inc b/meta-oe/r=
ecipes-connectivity/nethogs/nethogs.inc
> new file mode 100644
> index 0000000000..78c92915c9
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/nethogs/nethogs.inc
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "NetHogs is a small 'net top' tool that can group bandwidth =
by process"
> +HOMEPAGE =3D "https://github.com/raboof/nethogs"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRC_URI =3D "git://github.com/raboof/nethogs.git;branch=3Dmain;protocol=
=3Dhttps"

Add tag=3Dv${PV} to SRC_URI

> +DEPENDS =3D "ncurses libpcap"
> +
> +do_compile() {
> +    oe_runmake nethogs
> +}
> +
> +do_install() {
> +    oe_runmake install PREFIX=3D${prefix} DESTDIR=3D${D}
> +}

Looking at the project it seems to support meson, why are we not using it ?

> +
> +FILES:${PN} =3D "${sbindir}/nethogs"
> diff --git a/meta-oe/recipes-connectivity/nethogs/nethogs_0.8.8.bb b/meta=
-oe/recipes-connectivity/nethogs/nethogs_0.8.8.bb
> new file mode 100644
> index 0000000000..cb0c4b68eb
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/nethogs/nethogs_0.8.8.bb
> @@ -0,0 +1,4 @@
> +require nethogs.inc
> +
> +# tag for v0.8.8
> +SRCREV =3D "632a78846eb3cc3259dc45c59a47fa9c293a2831"

Please merge .inc file in the bb file, there seem to be no other users of i=
t.

> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121311): https://lists.openembedded.org/g/openembedde=
d-devel/message/121311
> Mute This Topic: https://lists.openembedded.org/mt/116126344/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

