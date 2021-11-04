Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A491C433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 14:35:47 +0000 (UTC)
Received: from esa12.hc324-48.eu.iphmx.com (esa12.hc324-48.eu.iphmx.com
 [207.54.72.34])
 by mx.groups.io with SMTP id smtpd.web08.12522.1636036536180439762
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=ecjgyzpV;
 spf=pass (domain: bmw.de, ip: 207.54.72.34,
 mailfrom: prvs=935a4eeab=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1636036536; x=1667572536;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rZI0LKORv0/ZPlEc/xbvg3voA4Mfo/2HzL4p+Epkqpg=;
  b=ecjgyzpVYl7ad5CwPwhDNMTSJ1YZ0BOoTOSVR5x0UCfQWCgR3cfnPsby
   aaf9YKYHF6RsKPMjpIeDmAjkhfo0BK/mrIynmgQbSlA3QdxZXNJg+WlKU
   0KbU1+IV4ZfvlY5PaqxJKk+pQ+AAwgt6quaL7V/BZhtu/fR94GV0EY0W1
   s=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa12.hc324-48.eu.iphmx.com with ESMTP/TLS; 04 Nov 2021 15:35:33 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw1.muc with ESMTP/TLS;
 04 Nov 2021 15:35:32 +0100
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp)
 ([160.46.167.66])
 by esabb3.muc with ESMTP/TLS; 04 Nov 2021 15:35:32 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Thu, 4 Nov 2021 15:35:32 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.024; Thu,
 4 Nov 2021 15:35:32 +0100
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] opkg: Fix poor operator combination choice
Thread-Topic: [OE-core] [PATCH] opkg: Fix poor operator combination choice
Thread-Index: AQHX0YTFd4idNGCFcE+quOaC5dBzI6vzXqEA
Date: Thu, 4 Nov 2021 14:35:32 +0000
Message-ID: <YYPvsoYTwoCH3PRT@korppu>
References: <20211104140257.3622680-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211104140257.3622680-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6FC496264A1B3246AAAFB73FB2E1374C@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 14:35:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157849

On Thu, Nov 04, 2021 at 02:02:57PM +0000, Richard Purdie wrote:
> Combining :append with +=3D rarely makes sense. Improve it to use the sta=
ndard
> format (and tweak the implied spacing).

Maybe I'm silly but I find :append with +=3D safer to do than manually reme=
mbring
to add the space character.

-Mikko

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/opkg/opkg_0.4.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/opkg/opkg_0.4.5.bb b/meta/recipes-devt=
ools/opkg/opkg_0.4.5.bb
> index 2760fc58786..8af047a51ff 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.4.5.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.4.5.bb
> @@ -60,7 +60,7 @@ do_install_ptest () {
>  	sed -i -e '/@PYTHONPATH=3D. $(PYTHON) $^/a\\t@if [ "$$?" !=3D "0" ];the=
n echo "FAIL:"$^;else echo "PASS:"$^;fi' ${D}${PTEST_PATH}/tests/Makefile
>  }
> =20
> -WARN_QA:append +=3D "openssl-deprecation"
> +WARN_QA:append =3D " openssl-deprecation"
>  QAPKGTEST[openssl-deprecation] =3D "package_qa_check_openssl_deprecation=
"
>  def package_qa_check_openssl_deprecation (package, d, messages):
>      sane =3D True
> --=20
> 2.32.0
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157844): https://lists.openembedded.org/g/openembedde=
d-core/message/157844
> Mute This Topic: https://lists.openembedded.org/mt/86816265/3616751
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mi=
kko.rapeli@bmw.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

