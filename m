Return-Path: <prvs=1851b47d9=Mikko.Rapeli@bmw.de>
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3A9B57CBDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 13:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1571234165; x=1602770165;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=clU/G88NbyoG53l2PqMihHrfedmD82jFN3ItFR0jdBA=;
	b=OzfwzaAOOCqbo/nsfobkGZyMTWg5yHLJs8Tho45z9yaA7rVPTEyjm+ef
	rNomhLIasLit5qtmxADr62ua2Hk8cll5CtXVvUzPSyuxczZOrQuD2e72x
	I/Uig2feSjFVIKVlAv4cuDYW9osSUFoeKvRx07yVvU0miazYXg6kKEQUG k=;
IronPort-SDR: 0UL6N5IwocbY3WRtd3wFgnt1XUqnHwt/cx/D/7Ypkn3KaGh/Z7DOPuA8N0+MzVCetMa/UZZ+XH
	MB0wkOBTvmWBE5fB+wm+9Z6elJeuDNDh6Spf0GVi/zh9WJN900e0es6GaT01bUeEkV2rJ9k3xf
	A/M6dABN5/ILh2vMmIkrXLsPnEP4TAzMIlbkvQ4snPBobZdSSmutlWaEerkSkl+I98NSbX5k1w
	Z6Yw8fhzHNoMWFOhhcX0uzFXRZ8HK8LNn56+KeBL55lyWyPMDsWNiiomWkK+sUBu2gKc7kg2Ot
	Njg=
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa5.bmw.c3s2.iphmx.com with ESMTP/TLS; 16 Oct 2019 15:56:03 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw4.muc with ESMTP/TLS;
	16 Oct 2019 15:56:03 +0200
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb3.muc with ESMTP/TLS; 16 Oct 2019 15:56:02 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Wed, 16 Oct 2019 15:56:02 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Wed, 16 Oct 2019 15:56:02 +0200
From: <Mikko.Rapeli@bmw.de>
To: <peter.kjellerstedt@axis.com>
Thread-Topic: [OE-core] [PATCH] systemd.bbclass: enable all services specified
	in ${SYSTEMD_SERVICE}
Thread-Index: AdWEH4iAGHkhI334Qo6RNxPQJHLzov//8kwA
Date: Wed, 16 Oct 2019 13:56:02 +0000
Message-ID: <20191016135602.GR11609@hiutale>
References: <d98547503ca345b68753531ef83704b2@XBOX03.axis.com>
In-Reply-To: <d98547503ca345b68753531ef83704b2@XBOX03.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd.bbclass: enable all services specified in ${SYSTEMD_SERVICE}
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
X-List-Received-Date: Wed, 16 Oct 2019 13:56:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <60C9AAF1A1353F4E894996FBD63C0857@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2019 at 12:45:20PM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of Mikko Rapeli
> > Sent: den 16 oktober 2019 14:32
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] systemd.bbclass: enable all services
> > specified in ${SYSTEMD_SERVICE}
> >=20
> > This has been the traditional way of enabling systemd services.
> > It may conflict with presets feature, but other layers, image classes
> > and recipes add services to be enabled using SYSTEMD_SERVICE
> > variable also with read-only rootfs, e.g. IMAGE_FEATURES has
> > stateless-rootfs and systemd_preset_all task is not executed.
> >=20
> > Fixes startup of custom services from our recipes using custom
> > image classes with various BSP layers. In the worst case even
> > serial console getty service wasn't starting due to dependency
> > no not enabled services.
> >=20
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  meta/classes/systemd.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes/systemd.bbclass
> > b/meta/classes/systemd.bbclass
> > index 1dca099..ae03c6f 100644
> > --- a/meta/classes/systemd.bbclass
> > +++ b/meta/classes/systemd.bbclass
> > @@ -33,7 +33,7 @@ if type systemctl >/dev/null 2>/dev/null; then
> >  	if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
> >  		for service in ${SYSTEMD_SERVICE_ESCAPED}; do
> >  			case "${service}" in
> > -			*@*)
> > +			*)
> >  				systemctl ${OPTS} enable "${service}"
> >  				;;
> >  			esac
>=20
> Not much point in leaving the case statement if it only has a=20
> capture all case. I.e., the above simplifies to:
>=20
> 	if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
> 		for service in ${SYSTEMD_SERVICE_ESCAPED}; do
> 			systemctl ${OPTS} enable "$service"
>=20
> (also note the change of "${service}" to "$service" to avoid using=20
> ${...} for shell variables where not necessary as this causes them=20
> to unnecessarily end up in the bitbake hash for the function.)

Thanks, I'll send a v2.

-Mikko=

