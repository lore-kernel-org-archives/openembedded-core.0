Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.14590.1585929934936002883
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 09:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=NOoWHjoG;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1596; q=dns/txt; s=axis-central1;
  t=1585929935; x=1617465935;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=nKHGiQ99AP1DCdD6s+IMmBbXkICHdRH6hwLSUkIEN/I=;
  b=NOoWHjoGWv7dfJRqYe9VjrVpssr2ghUOX/Str7OhiQy3pHPNXoV35aIy
   Hvw9vFJncLDEK+/ZjsE2ZWNKanYfmp5GSJckM76GbxmcW/MTS4kp5BnJf
   QhnUEoyhotnKVw8MJbzFeZIZLbjPANisc4bwDUHYxeeXw2y3AcT/turPu
   i2WrbBUS9oWgkOZQUKRqR/puW95ie7nWpcSbOE0amOY9B3ncuKBuh6KTN
   fOuIzBpWY5vbZl6zLevhVzkbzMnXyT5Z3/0baUEotM3MrryNLH991k8XR
   4Vp8t2eQpvem8HfdNHcDS9/YTGZ4zBCma3HIAur9HgN7vfZBYhraMbr0r
   Q==;
IronPort-SDR: tCbqgT5OgUrB15BUIJenxTYus8er0aYwK1yoHXcAn74obcvOz8IfSdPFmlHijLqW9FlLfCycRG
 WVmIWdNrFcN6LYq3FxtONdgpK031EzPelEy4iVrikJiGiSFHpyclkt0c+sEGKCbuS+FoWosUDu
 fzILRCgHNckH8r65JPB30cv0xV5GNWqXMIodvRzMlsgCBE2H+SmxGVclJrvUu3xMrTpFK0eyJe
 iNuYvTXWpg8CW02NvgLgX+fVMtoyZumPjl7HL2ZsmhxeWAlSPwiwuqB9LLn7sJ6fSuHgPxA162
 paE=
X-IronPort-AV: E=Sophos;i="5.72,340,1580770800"; 
   d="scan'208";a="7295345"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Jan Luebbe <jlu@pengutronix.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 5/5] lib/oe/package_manager: don't try to rm /var/lib/opkg
Thread-Topic: [OE-core][PATCH 5/5] lib/oe/package_manager: don't try to rm
 /var/lib/opkg
Thread-Index: AQHWCDYBl8zpfgTU9ESdqsYWb3o1b6hnkiww
Date: Fri, 3 Apr 2020 16:05:28 +0000
Message-ID: <7e809c2614454c06b129484ce8c92e63@XBOX03.axis.com>
References: <20200401145805.6936-1-jlu@pengutronix.de>
 <20200401145805.6936-6-jlu@pengutronix.de>
In-Reply-To: <20200401145805.6936-6-jlu@pengutronix.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Jan Luebbe
> Sent: den 1 april 2020 16:58
> To: openembedded-core@lists.openembedded.org
> Cc: Jan Luebbe <jlu@pengutronix.de>
> Subject: [OE-core][PATCH 5/5] lib/oe/package_manager: don't try to rm
> /var/lib/opkg
>=20
> As opkglibdir starts with a /, os.path.join will ignore
> self.target_rootfs, leading to an attempt to remove /var/lib/opkg.
>=20
> This only fails if it exists on the host, explaining why this remained
> undiscovered for long.
>=20
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  meta/lib/oe/package_manager.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oe/package_manager.py
> b/meta/lib/oe/package_manager.py
> index 2a5d7ef539e6..b0660411eaf5 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -1796,8 +1796,7 @@ class DpkgPM(OpkgDpkgPM):
>              open(os.path.join(target_dpkg_dir, "available"), "w+").close=
()
>=20
>      def remove_packaging_data(self):
> -        bb.utils.remove(os.path.join(self.target_rootfs,
> -                                     self.d.getVar('opkglibdir')), True)
> +        bb.utils.remove(self.target_rootfs + self.d.getVar('opkglibdir')=
, True)

Or you could change it to use oe.path.join() instead:

        bb.utils.remove(oe.path.join(self.target_rootfs,
                                     self.d.getVar('opkglibdir')), True)


>          bb.utils.remove(self.target_rootfs + "/var/lib/dpkg/", True)
>=20
>      def fix_broken_dependencies(self):
> --
> 2.26.0.rc2

//Peter

