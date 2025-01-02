Return-Path: <Anders.Montonen@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1928E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 08:56:56 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.24])
 by mx.groups.io with SMTP id smtpd.web11.4828.1735808213882049800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 00:56:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kapsi.fi header.s=20161220 header.b=QG80qaF6;
 spf=pass (domain: kapsi.fi, ip: 91.232.154.24, mailfrom: antime@kapsi.fi)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=sUpU/0dV7k0LIDbIpYT7xC3SIs75/8UueLVrxFwQcvw=; b=QG80qaF6DQl6c2BXFMJV+nD60M
	VrRryIRyVQZj0P1NfSQEMhTJAn6FDEKQhNO1WKEuuBLsYuAYTynStWLMSAreL+3cJqKp/WgdQnzWb
	34JbgCJYAFpHQUfaUjyWrvQ0xggYmOP6d4DbUQDfmZ+7B7obJdX3Sc9yT/lX2mjFq0F1ycigKoPwd
	i+MvFkQCFRlRHidnw+kIZPLYfDzodfUvaK3x6zltqYChR3jnsvxkDrq6oPzevdQ45j+JQzFaZrAad
	nw8smimgXZwFvf06tYMO0tBc4VE5l5yo5mAYENwcReqgWfIY+o++VM2Rm1jwefmr2lVjcWeVpMvCQ
	lGo4D2gQ==;
Received: from 87-92-53-190.bb.dnainternet.fi ([87.92.53.190] helo=[192.168.1.137])
	by mail.kapsi.fi with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Anders.Montonen@iki.fi>)
	id 1tTH0c-0004Qv-2K;
	Thu, 02 Jan 2025 10:56:50 +0200
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [OE-core] [PATCH] boost: fix do_fetch error
From: Anders Montonen <Anders.Montonen@iki.fi>
In-Reply-To: <20250102084152.2042864-1-jiaying.song.cn@windriver.com>
Date: Thu, 2 Jan 2025 10:56:49 +0200
Cc: openembedded-core@lists.openembedded.org,
 changqing.li@windriver.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <5DE4A0FF-283D-4673-82C4-BF59DE5399DE@iki.fi>
References: <20250102084152.2042864-1-jiaying.song.cn@windriver.com>
To: Jiaying.Song.CN@windriver.com
X-Mailer: Apple Mail (2.3445.104.21)
X-SA-Exim-Connect-IP: 87.92.53.190
X-SA-Exim-Mail-From: Anders.Montonen@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 08:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209258

Hi,

> On 2 Jan 2025, at 10:41, Song, Jiaying (CN) via lists.openembedded.org =
<Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>=20
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>=20
> Change the sha256sum to the correct value due to the following error:
> WARNING: boost-native-1.86.0-r0 do_fetch: Checksum failure encountered =
with download of =
https://boostorg.jfrog.io/artifactory/main/release/1.86.0/source/boost_1_8=
6_0.tar.bz2 - will attempt other sources if available
>=20
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
> meta/recipes-support/boost/boost-1.86.0.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/boost/boost-1.86.0.inc =
b/meta/recipes-support/boost/boost-1.86.0.inc
> index 2378b27575..6d6064fc7b 100644
> --- a/meta/recipes-support/boost/boost-1.86.0.inc
> +++ b/meta/recipes-support/boost/boost-1.86.0.inc
> @@ -12,7 +12,7 @@ BOOST_MAJ =3D =
"${@"_".join(d.getVar("PV").split(".")[0:2])}"
> BOOST_P =3D "boost_${BOOST_VER}"
>=20
> SRC_URI =3D =
"https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P=
}.tar.bz2"
> -SRC_URI[sha256sum] =3D =
"1bed88e40401b2cb7a1f76d4bab499e352fa4d0c5f31c0dbae64e24d34d7513b"
> +SRC_URI[sha256sum] =3D =
"79e6d3f986444e5a80afbeccdaf2d1c1cf964baa8d766d20859d653a16c39848"
>=20
> UPSTREAM_CHECK_URI =3D "http://www.boost.org/users/download/"
> UPSTREAM_CHECK_REGEX =3D "release/(?P<pver>.*)/source/"
> --=20
> 2.34.1

The url =
https://boostorg.jfrog.io/artifactory/main/release/1.86.0/source/boost_1_8=
6_0.tar.bz2 points to an error page. Also, in both this update and the =
Scarthgap 1.84.0 update you posted, you=E2=80=99re updating the recipes =
to the same sha256sum. I=E2=80=99m guessing these patches were not =
tested at all? I would also have expected the reason for the changed =
checksum in the commit message.

Is there a reason the Boost recipes are not using archives.boost.io?

-a=

