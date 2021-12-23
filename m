Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2EEC433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 10:49:42 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.31154.1640256580366622713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 02:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OI1ZS7m9;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1640256581;
  x=1671792581;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=TRzIZpaL1Vo15lsculaK2JjgA93c8IX7uZvuJl4oDZE=;
  b=OI1ZS7m9Nx20WOsy5VGHeUisQ6UJR3nN0Ol9AR36zGkBOxAtCNbO5MkO
   2gXp+k+1WvGyPo/R+d2wknl1gBR+TuN1AFx8rIX9yc+e+F4CmNr1gjsmY
   asoT4bULrlSXKogrE9zPnU42DS6i2WELfEndv+k7j5wNdeN/cFdUKzHyF
   3fvxaoxwLyVIcvrpaCe4AGz5lcTt3RIHMTaV2Z2SMHKQ/k4dlfPYYV58R
   g3BJv2cKrt8ke9FoHnTVOpsa8xvmdbmEGy3oFG8lMIU9yL7HXkbCDS3xY
   0e9P+7FxLsraKs0T4gnVd+o8xCcN8k5nwCpvCTvqj20FWrbaPYNGADCpu
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
Thread-Topic: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
Thread-Index: AQHX94qJDMgCEcw7aUejrp7rTZC0R6w/5QEg
Date: Thu, 23 Dec 2021 10:49:37 +0000
Message-ID: <baa4d9a18f054cc9a9064f9ca415d829@axis.com>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 10:49:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159975

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 23 december 2021 00:21
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] base/patch: Disable network for unpack/patch/c=
onfigure/compile/install
>=20
> Use the newly added nonetwork task flag to disable network access where
> possible in unpack/patch/configure/compile/install tasks.
>=20
> We can't disable networking in sstate tasks due to sstate downloads and
> also so we can report hash equivalence to the server.

Since no tasks except fetch (and apparently the sstate tasks) are expected=
=20
to use the network, wouldn't it make more sense to reverse this flag? I.e.,=
=20
add do_fetch[network] =3D "1" instead. That way you don't get away with=20
adding some random task and using the network from it unless you explicitly=
=20
state that you will.

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/base.bbclass  | 4 ++++
>  meta/classes/patch.bbclass | 1 +
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index b709777f243..e4c6c983b59 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -214,6 +214,7 @@ python create_source_date_epoch_stamp() {
>      oe.reproducible.epochfile_write(source_date_epoch, d.getVar('SDE_FIL=
E'), d)
>  }
>  do_unpack[postfuncs] +=3D "create_source_date_epoch_stamp"
> +do_unpack[nonetwork] =3D "1"
>=20
>  def get_source_date_epoch_value(d):
>      return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
> @@ -358,6 +359,7 @@ base_do_configure() {
>  		echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
>  	fi
>  }
> +do_configure[nonetwork] =3D "1"
>=20
>  addtask compile after do_configure
>  do_compile[dirs] =3D "${B}"
> @@ -368,11 +370,13 @@ base_do_compile() {
>  		bbnote "nothing to compile"
>  	fi
>  }
> +do_compile[nonetwork] =3D "1"
>=20
>  addtask install after do_compile
>  do_install[dirs] =3D "${B}"
>  # Remove and re-create ${D} so that is it guaranteed to be empty
>  do_install[cleandirs] =3D "${D}"
> +do_install[nonetwork] =3D "1"
>=20
>  base_do_install() {
>  	:
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index 8de70254919..57aaf7c31d1 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -164,6 +164,7 @@ patch_do_patch[vardepsexclude] =3D "PATCHRESOLVE"
>=20
>  addtask patch after do_unpack
>  do_patch[dirs] =3D "${WORKDIR}"
> +do_patch[nonetwork] =3D "1"
>  do_patch[depends] =3D "${PATCHDEPENDENCY}"
>=20
>  EXPORT_FUNCTIONS do_patch
> --
> 2.32.0

//Peter


