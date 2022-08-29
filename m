Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B111EECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 11:51:55 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.69477.1661773908683588549
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 04:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=oHicXHbU;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1661773909;
  x=1693309909;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XNbhz0llGBnqmj2XEScqQsyZfNFfkanqXW5WSOF4DqE=;
  b=oHicXHbU/6l2aJtb1aYZMN/ZidsiuJ9SVViWlgk91JWO1fTFhy5ScBp4
   IQuQQaMZXfh2wMO7qn9tboeql2Ne0a/Ae2D4I1ZCc6pANrq9K5kg8yLzs
   V6SCSBev2ZpDgbaIoc2mGGnau95SBst2SDGRkuPGVXBse8ubpVk/e9sl/
   mQJ6twbpRVpFIirqDb158LDihAHl/BNvP0I9QqwxvAzjCrw9LBnYDUu66
   BpV/SyNForzDu9e0BsoachI9ukORwsjYt1MNX3UV76kSUZ0ttJXxxPTeO
   oqnfQvNbbJAsBiat4XICiS0D9Ddwr91lu0xFvhX3ZBY0rdAyv6H2etHNQ
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Markus Volk <f_l_k@t-online.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [oe-core][PATCHv2] packagegroup-base.bb: remove wpa_supplicant
 preset from packagegroup-base-wifi
Thread-Topic: [oe-core][PATCHv2] packagegroup-base.bb: remove wpa_supplicant
 preset from packagegroup-base-wifi
Thread-Index: AQHYuv9xPV8Ds77K/EmEy8FtY6Crmq3FxFRg
Date: Mon, 29 Aug 2022 11:51:45 +0000
Message-ID: <d104e8ed664d4e7e9503b7125fe29975@axis.com>
References: <20220828165830.12594-1-f_l_k@t-online.de>
In-Reply-To: <20220828165830.12594-1-f_l_k@t-online.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 11:51:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170012

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Markus Volk
> Sent: den 28 augusti 2022 18:59
> To: openembedded-core@lists.openembedded.org
> Cc: Markus Volk <f_l_k@t-online.de>
> Subject: [oe-core][PATCHv2] packagegroup-base.bb: remove wpa_supplicant p=
reset from packagegroup-base-wifi
>=20
> This removes wpa_supplicant from packagegroup-base-wifi so that the
> decision of which wireless daemon to use can be made within the recipes.
> Possible choices would be wpa_supplicant or iwd.
>=20
> iwd is a wireless daemon written by intel and supported by all major netw=
ork managers.
> It can be run in standalone mode and configured with 'iwctl' from the ter=
minal, and
> with 'iwgtk' or 'iwdgui' from the gui. It can also work as a wpa_supplica=
nt drop-in
> replacement for network-manager, connman or systemd-networkd.
>=20
> iwd makes heavy use of the kernel api, so it is not portable but does not=
 need
> additional external libraries like openssl.
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-core/packagegroups/packagegroup-base.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb
> index 7489ef61b0..a70a107dac 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -271,7 +271,7 @@ SUMMARY:packagegroup-base-wifi =3D "WiFi support"
>  RDEPENDS:packagegroup-base-wifi =3D "\
>      iw \
>      wireless-regdb-static \
> -    wpa-supplicant"
> +"

Rather than removing wpa-supplicant, which breaks backwards=20
compatibility and expectations, wouldn't it make more sense to
introduce a variable for the wireless service, and default it=20
to wpa-supplicant. Then there is no breakage for those who=20
expect packagegroup-base-wifi to pull in wpa-supplicant, but=20
those who want to use iwd can easily change the configuration=20
in their distros.=20

>=20
>  RRECOMMENDS:packagegroup-base-wifi =3D "\
>      ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-=
zd1211rw', '',d)} \
> --
> 2.34.1

//Peter

