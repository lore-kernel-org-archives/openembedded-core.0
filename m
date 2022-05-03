Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AC6C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 07:52:32 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.8336.1651564344136413815
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 00:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=YVq3dPzD;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651564344;
  x=1683100344;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Wbuh5nEYAlrdPDGSsBusdSGp/wjfqIze+4MfIKFGvYk=;
  b=YVq3dPzDbkUdHuXjQuk81N3B9F4etnjp3gr71vYqZXux1F3EX/eekBXw
   cnMSva8YifnHAsOpuc8AWI7TMJYCiNWhe3KA2RV5EiR7bWIAmjWBYXGfu
   1e67cjWh5a9hwCIYBqt0QBOFnyiim16XpzQgAl/E+bs/pszDee3Pectek
   vXa61WmPVMmeWBRoQKuT9CvUxfrKVB9WHbILrFtvkvJ9e2hUQEgKGwh14
   WZ6mTOl2kBNOwf8Ty13MnWPOXwqi9ZmHiEoSaD96kkg8Cjvz5V9VVRdbV
   zHXlK7/PWvnrs+KQTNn/sBoc7naXrl/fUatSlpcthMYEOuNS0QXeS9jw4
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Steve Sakoman <steve@sakoman.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][dunfell 3/9] devshell.bbclass: Allow devshell &
 pydevshell to use the network
Thread-Topic: [OE-core][dunfell 3/9] devshell.bbclass: Allow devshell &
 pydevshell to use the network
Thread-Index: AQHYXnjf04v8pYEYWUyChdfZA8HU560Mx90g
Date: Tue, 3 May 2022 07:52:21 +0000
Message-ID: <e1dfa49e3a2b44b8af449ff171dfba9e@axis.com>
References: <cover.1651531749.git.steve@sakoman.com>
 <214a2fe628801af3fde5b540c31f1c515f6c855f.1651531749.git.steve@sakoman.com>
In-Reply-To: 
 <214a2fe628801af3fde5b540c31f1c515f6c855f.1651531749.git.steve@sakoman.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 07:52:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165192

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Steve Sakoman
> Sent: den 3 maj 2022 01:03
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][dunfell 3/9] devshell.bbclass: Allow devshell &
> pydevshell to use the network
>=20
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>=20
> Otherwise it will fail if using OE_TERMINAL =3D "xterm" with the not so
> helpful error:
>=20
>   xterm: Xt error: Can't open display: localhost:0.0
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit ba53fc3bcecfe32401471dc1008c7ead96504150)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/devshell.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclas=
s
> index 76dd0b42ee..ad9f267848 100644
> --- a/meta/classes/devshell.bbclass
> +++ b/meta/classes/devshell.bbclass
> @@ -21,6 +21,7 @@ addtask devshell after do_patch
> do_prepare_recipe_sysroot
>  DEVSHELL_STARTDIR ?=3D "${S}"
>  do_devshell[dirs] =3D "${DEVSHELL_STARTDIR}"
>  do_devshell[nostamp] =3D "1"
> +do_devshell[network] =3D "1"
>=20
>  # devshell and fakeroot/pseudo need careful handling since only the fina=
l
>  # command should run under fakeroot emulation, any X connection should
> @@ -154,3 +155,4 @@ python do_devpyshell() {
>  addtask devpyshell after do_patch
>=20
>  do_devpyshell[nostamp] =3D "1"
> +do_devpyshell[network] =3D "1"
> --
> 2.25.1

This shouldn't be needed for Dunfell, should it? I would assume the support=
=20
for blocking network operations per task hasn't been backported.

//Peter


