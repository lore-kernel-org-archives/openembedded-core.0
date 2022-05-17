Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85084C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 11:42:02 +0000 (UTC)
Received: from esa8.hc324-48.eu.iphmx.com (esa8.hc324-48.eu.iphmx.com
 [207.54.65.242])
 by mx.groups.io with SMTP id smtpd.web10.6042.1652787705547674579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 04:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=mNR4qDBZ;
 spf=pass (domain: bmw.de, ip: 207.54.65.242,
 mailfrom: prvs=1295772eb=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1652787705; x=1684323705;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GxmMZi8QRG1VS7V+FEefdGpbsNByn1Bjn5ycGDx0k5g=;
  b=mNR4qDBZMnfxGipD69q/W/kLYfAj6u0FztD7ADo1KbmJ/LrrOIQv/Q8V
   iDgU9PjdcZrkLHHYih5rjOtxfmtEASR7HuiM8wMa2mFjga1PeiBzdDW4m
   FA6kjLxcg9Z9hd1Nn6C/G0B1VtIHTTjJqnHJV8uEWmSKOaPKYo+fZITSP
   M=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa8.hc324-48.eu.iphmx.com with ESMTP/TLS; 17 May 2022 13:41:43 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw5.muc with ESMTP/TLS;
 17 May 2022 13:41:43 +0200
Received: from smucm08m.bmwgroup.net (HELO smucm08m.europe.bmw.corp)
 ([160.48.96.41])
 by esabb6.muc with ESMTP/TLS; 17 May 2022 13:41:43 +0200
Received: from SMUCMP08G.europe.bmw.corp (10.30.13.73) by
 smucm08m.europe.bmw.corp
 (160.48.96.41) with Microsoft SMTP Server (TLS;
 Tue, 17 May 2022 13:41:42 +0200
Received: from SMUCMP08E.europe.bmw.corp (2a03:1e80:a15:58f::1:24) by
 SMUCMP08G.europe.bmw.corp (2a03:1e80:a15:58f::2039) with Microsoft SMTP
 Server (version=TLS; Tue, 17 May 2022 13:41:42 +0200
Received: from SMUCMP08E.europe.bmw.corp ([10.30.13.71]) by
 SMUCMP08E.europe.bmw.corp ([10.30.13.71]) with mapi id 15.02.0922.027; Tue,
 17 May 2022 13:41:42 +0200
From: <Mikko.Rapeli@bmw.de>
To: <ranjitsinhrathod1991@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][dunfell][PATCH] git: Use CVE_CHECK_WHITELIST instead of
 CVE_CHECK_IGNORE
Thread-Topic: [OE-Core][dunfell][PATCH] git: Use CVE_CHECK_WHITELIST instead
 of CVE_CHECK_IGNORE
Thread-Index: AQHYad9sEaoNqhjOtEuA4UweCGOeSK0i0N8A
Date: Tue, 17 May 2022 11:41:42 +0000
Message-ID: <YoOJ9E7KS3A2O1NY@korppu>
References: <20220517111500.735-1-ranjitsinhrathod1991@gmail.com>
In-Reply-To: <20220517111500.735-1-ranjitsinhrathod1991@gmail.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-ID: <55494381A256F94C810F6A5EFD1B11CC@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 11:42:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165728

Hi,

On Tue, May 17, 2022 at 04:45:00PM +0530, Ranjitsinh Rathod wrote:
> Use CVE_CHECK_WHITELIST as CVE_CHECK_IGNORE is not valid on dunfell
> branch

Good finding, thanks. I think it makes sence to support both CVE_CHECK_WHIT=
ELIST
and CVE_CHECK_IGNORE variables in dunfell as patches will be cherry-picked =
and
this issue may creep in again silently.

Other opinions?

Cheers,

-Mikko

> Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
> ---
>  meta/recipes-devtools/git/git.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/gi=
t/git.inc
> index 879920d97e..b5d0004712 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -22,7 +22,7 @@ CVE_PRODUCT =3D "git-scm:git"
>  # This is about a manpage not mentioning --mirror may "leak" information
>  # in mirrored git repos. Most OE users wouldn't build the docs and
>  # we don't see this as a major issue for our general users/usecases.
> -CVE_CHECK_IGNORE +=3D "CVE-2022-24975"
> +CVE_CHECK_WHITELIST +=3D "CVE-2022-24975"
> =20
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[cvsserver] =3D ""
> --=20
> 2.17.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165727): https://lists.openembedded.org/g/openembedde=
d-core/message/165727
> Mute This Topic: https://lists.openembedded.org/mt/91160955/3616751
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mi=
kko.rapeli@bmw.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

