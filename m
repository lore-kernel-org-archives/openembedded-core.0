Return-Path: <prvs=380cec95a=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 590 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 Aug 2017 07:51:24 UTC
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id D46EB780F3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 07:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1501660287; x=1533196287;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-id:content-transfer-encoding:mime-version;
	bh=CFTn8LsNUv2PJilTw/BEq08BlpnhyIF3fuNKucpXcqc=;
	b=Q77e7GZ8DBIfo3j0qPV16JEDz2V3d2m5o0Yjq6jFlWQHtd/hDrYasFH5
	kcii6x/MbuVquvq5I3ryQ7/b8LHoGj3Bye6TVWw+uqcNMXV4x/flPFp/r
	HLGVpf9q+KEudJFnWqzIeCAZP+vkuUCMjItJBogTVk5EeQTKuguD/wC84 E=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 02 Aug 2017 09:41:35 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw6.muc with ESMTP/TLS;
	02 Aug 2017 09:41:34 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb1.muc with ESMTP/TLS; 02 Aug 2017 09:41:34 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Wed, 2 Aug 2017 09:41:34 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1263.000;
	Wed, 2 Aug 2017 09:41:34 +0200
From: <Mikko.Rapeli@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 02/23] buildhistory.bbclass: add
	BUILDHISTORY_FORCE_UPDATE option
Thread-Index: AQHTAVtgJq4tfgjykUSk6dxuoXNELqJwoUiA
Date: Wed, 2 Aug 2017 07:41:34 +0000
Message-ID: <20170802074133.ioiarvxv2njzuu6c@hiutale>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
	<1500556991-11471-3-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1500556991-11471-3-git-send-email-mikko.rapeli@bmw.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Subject: Re: [PATCH 02/23] buildhistory.bbclass: add BUILDHISTORY_FORCE_UPDATE option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Aug 2017 07:51:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <64B7F48F00EE4049905D8F4AFEBE69DB@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2017 at 04:22:50PM +0300, Mikko Rapeli wrote:
> Setting BUILDHISTORY_FORCE_UPDATE =3D "1" in local.conf forces buildhisto=
ry
> updates and recipe rebuilds also when only buildhistory.bbclass changed.
>=20
> This is handy when using sstate cache and modifying buildhistory to inclu=
de
> new data like recipe and package LICENSE fields.
>=20
> By default new buildhistory data is updated when recipes are rebuild and
> new fields like LICENSE are not deployed immediately.

Are there some problems with this approach?

I did not find other ways to force updates of buildhistory data without
writing custom functions to update LICENSE and CVE_PRODUCT (which I care ab=
out
now) for every build. If there was a way to invalidate the full sstate
cache then that would work too, but I doubt a simple PE update somewhere wo=
uld
do it.

-Mikko

> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/classes/buildhistory.bbclass | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistor=
y.bbclass
> index cc3b144..bc3145e 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -42,10 +42,11 @@ BUILDHISTORY_COMMIT_AUTHOR ?=3D "buildhistory <buildh=
istory@${DISTRO}>"
>  BUILDHISTORY_PUSH_REPO ?=3D ""
> =20
>  SSTATEPOSTINSTFUNCS_append =3D " buildhistory_emit_pkghistory"
> -# We want to avoid influencing the signatures of sstate tasks - first th=
e function itself:
> -sstate_install[vardepsexclude] +=3D "buildhistory_emit_pkghistory"
> +# If BUILDHISTORY_FORCE_UPDATE is not set, we want to avoid influencing =
the
> +# signatures of sstate tasks - first the function itself:
> +sstate_install[vardepsexclude] +=3D "${@'' if d.getVar('BUILDHISTORY_FOR=
CE_UPDATE', True) =3D=3D '1' else 'buildhistory_emit_pkghistory'}"
>  # then the value added to SSTATEPOSTINSTFUNCS:
> -SSTATEPOSTINSTFUNCS[vardepvalueexclude] .=3D "| buildhistory_emit_pkghis=
tory"
> +SSTATEPOSTINSTFUNCS[vardepvalueexclude] .=3D "${@'' if d.getVar('BUILDHI=
STORY_FORCE_UPDATE', True) =3D=3D '1' else '| buildhistory_emit_pkghistory'=
"
> =20
>  # Similarly for our function that gets the output signatures
>  SSTATEPOSTUNPACKFUNCS_append =3D " buildhistory_emit_outputsigs"
> --=20
> 1.9.1=

