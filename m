Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A01C27C43
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 14:26:50 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.15639.1716992806003623400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 May 2024 07:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WZaiuWhN;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.171, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-62a0849f8e5so20715577b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 07:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716992805; x=1717597605; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+abAyVLQqV2PM2CjLIbZW7CbrMSD4lrvaa2+qwjs8Y=;
        b=WZaiuWhNAkC7GpsrrjQugy0h7g9hrPVK9dsYL8Lvy96Mi0qXBmECY+lmamjN1PWr6q
         E15QmlJ7/h3L9MJZo04/EQrRRTR1owWusF7t5sPKLEJPOwd2OBD3rZOPICuAeF3bjYfE
         7V1WFKnV+b3SpnN1OX8Mh+yD/n7NX0CrrWgERYI8wBx3f9T4EDbWjtr1+tF0xvkGRdTB
         zzugeZIzHYdeQZ9aIQBTAaPUNaYj+hczMYe7ztPQdoziPjjygLKMXRd6MvyEnt/UW+uU
         VYBIle86NcKt3WNsZMyelvsVqbe+I0muE0RAU0jE46jZxpS2+qea+VZX/Qqh164CYM5t
         7O+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716992805; x=1717597605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+abAyVLQqV2PM2CjLIbZW7CbrMSD4lrvaa2+qwjs8Y=;
        b=YtrhzhadPX8qV1ngYLG6U2jEuCRRxHHtS4+R3rrAHaiSPEhDbUjd6qxdUMm1gg0l6J
         TVa+tPsSnI47978gTJf/MUmk2FCTUa3IpgRKhTyJnPMzZ8O3spaLVXenTpkEkUTDKgPG
         AQb2Mym34P+HHymACVvql7ikMrVGVeZfmaHBQb9XQORW5OabaPPqminNstlzyE5TA1Qv
         heF/9KIbYWhiQAriKr6Nagf5o4P4XirLslGDX2/9Fr83efwHmGq1zmzol9VwzO5OUDLX
         RMdwfUtB5kNPOfKnGhXWWujcBAZxkzlwAk00kthd0FDE+1GK7LZdNPgdkvAMIeBRtbgH
         JPCQ==
X-Gm-Message-State: AOJu0YzbgyZxXBFPSz2v7AQu6+p3sjWfi9nXAawkTZ61r388mTogWA7H
	/PJljqfMY2UmAcSuszuO9cOKJg/8tIPdYguWGMSHPEH9/EHRbLXBBokpAR/o82jqhSBuYuQIwvu
	e7BMJ5qXB92f2MZ2EusjsD6YAomPNTnn83DQz6yDr0I7yLtDY
X-Google-Smtp-Source: AGHT+IGWamyfU7272r8mUTFWcM/oWYxqqZtNuv1mw9IphgI4gXNxm+Vmvn1/nP35Z4FieNIMMd4UbJ8/6ZSz4kMfqFE=
X-Received: by 2002:a0d:d753:0:b0:60a:66c0:d5fe with SMTP id
 00721157ae682-62a08d86edbmr166021347b3.13.1716992804949; Wed, 29 May 2024
 07:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240524072345.921885-1-bin.lan.cn@eng.windriver.com>
In-Reply-To: <20240524072345.921885-1-bin.lan.cn@eng.windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 29 May 2024 07:26:33 -0700
Message-ID: <CAOSpxdbrjRQdnr11SqnNxUjb_1gHTOUpP9qD1ke2sN-feSug5A@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] iputils: splitting the ping6 as a package
To: bin.lan.cn@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, xiangyu.chen@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 14:26:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200005

I'm hesitant to take a packaging change in a stable branch.  If others
would like to weigh in on this please speak up!

Steve

On Fri, May 24, 2024 at 12:24=E2=80=AFAM Bin Lan via lists.openembedded.org
<bin.lan.cn=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> The iputils merged the ping4 and ping6 command into the ping since the
> commit ebad35fe[1], currently, iputils ping support being called using
> "ping -6" or "ping6" symlinks.
>
> In oe-core, there are two packages provide ipv6 ping, inetutils and iputi=
ls,
> the inetutils-ping6 doesn't support "-I" option to bind the interface, th=
at
> cause some of scripts(e.g. LTP test[2]) which was based on iputils-ping6 =
fails.
>
> If someone or a package needs iputils-ping6, they can enable it in local.=
conf
> or add it into rdepends directly.
>
> Ref:
> [1] https://github.com/iputils/iputils/commit/e3de851b809c7b72ccc654a72b6=
af61d
> [2] https://github.com/linux-test-project/ltp/blob/master/testcases/kerne=
l/ \
>     containers/netns/netns_comm.sh#L25
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> (cherry picked from commit 0b89bc2041f670af625829d061ce79e0840ac116)
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> ---
>  meta/recipes-extended/iputils/iputils_20240117.bb | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/iputils/iputils_20240117.bb b/meta/rec=
ipes-extended/iputils/iputils_20240117.bb
> index 5a5e15528e..3880689742 100644
> --- a/meta/recipes-extended/iputils/iputils_20240117.bb
> +++ b/meta/recipes-extended/iputils/iputils_20240117.bb
> @@ -35,7 +35,11 @@ ALTERNATIVE_PRIORITY =3D "100"
>  ALTERNATIVE:${PN}-ping =3D "ping"
>  ALTERNATIVE_LINK_NAME[ping] =3D "${base_bindir}/ping"
>
> -SPLITPKGS =3D "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff"
> +ALTERNATIVE:${PN}-ping6 =3D "ping6"
> +ALTERNATIVE_LINK_NAME[ping6] =3D "${base_bindir}/ping6"
> +
> +SPLITPKGS =3D "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff \
> +             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ping=
6', '', d)}"
>  PACKAGES +=3D "${SPLITPKGS}"
>
>  ALLOW_EMPTY:${PN} =3D "1"
> @@ -43,6 +47,13 @@ RDEPENDS:${PN} +=3D "${SPLITPKGS}"
>
>  FILES:${PN} =3D ""
>  FILES:${PN}-ping =3D "${base_bindir}/ping.${BPN}"
> +FILES:${PN}-ping6 =3D "${base_bindir}/ping6.${BPN}"
>  FILES:${PN}-arping =3D "${base_bindir}/arping"
>  FILES:${PN}-tracepath =3D "${base_bindir}/tracepath"
>  FILES:${PN}-clockdiff =3D "${base_bindir}/clockdiff"
> +
> +do_install:append() {
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false=
', d)}; then
> +               ln -sf ping ${D}/${base_bindir}/ping6
> +       fi
> +}
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199827): https://lists.openembedded.org/g/openembedde=
d-core/message/199827
> Mute This Topic: https://lists.openembedded.org/mt/106277573/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

