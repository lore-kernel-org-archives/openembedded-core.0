Return-Path: <prvs=75617a962=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 576 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 13 Aug 2018 09:22:14 UTC
Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com
	[68.232.133.109])
	by mail.openembedded.org (Postfix) with ESMTP id 671E778F29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 09:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1534152136; x=1565688136;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=RztvJIeeo8sOmAjYylrKmh9MOsx/9MYTDJhDK6yt3Nk=;
	b=od6Jxi3/CtLkn0UJkWc4nHiIDKykDPwDZ7ENRpKYZzeJkpc/LDb5TlO5
	K4p/tebyjGJPBDRiAxjuYhaw2JH6coPpdI2oc0HZHp7qJG2XK80a4IFUE
	kSrw4YgK3HHSGiNdw/CoVXsl3nF5bSHWzmrlyeBfgdBZM12CgdnDH3IeS A=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 13 Aug 2018 11:12:39 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw6.muc with ESMTP/TLS;
	13 Aug 2018 11:12:38 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb1.muc with ESMTP/TLS; 13 Aug 2018 11:12:38 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Mon, 13 Aug 2018 11:12:38 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Mon, 13 Aug 2018 11:12:38 +0200
From: <Mikko.Rapeli@bmw.de>
To: <konstantin.shemyak@ge.com>
Thread-Topic: [OE-core] [PATCH] cve-check.bbclass: do not download the CVE DB
	in package-specific tasks
Thread-Index: AQHUMuXHU+gCWXDy+kSN5ubybb2wnQ==
Date: Mon, 13 Aug 2018 09:12:37 +0000
Message-ID: <20180813091233.GZ8291@hiutale>
References: <20180813072328.107451-1-konstantin.shemyak@ge.com>
In-Reply-To: <20180813072328.107451-1-konstantin.shemyak@ge.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.38]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cve-check.bbclass: do not download the CVE DB in package-specific tasks
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
X-List-Received-Date: Mon, 13 Aug 2018 09:22:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E7C5499D720F1149B76E1E5F2C60C650@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 13, 2018 at 10:23:28AM +0300, Konstantin Shemyak wrote:
> Disable downloading of the vulnerability DB in do_check_cves() task.
>=20
> When invoked in this task, cve-check-tool attempts re-download of the CVE=
 DB
> if the latter is older than certain threshold. While reasonable for a
> stand-alone CVE checker, this behavior can cause errors in parallel build=
s
> if the build time is longer than this threshold:=20
> * Other tasks might be using the DB.
> * Several packages can start the download of the same file at the same ti=
me.
>=20
> This check is not really needed, as the DB has been downloaded by
> cve_check_tool:do_populate_cve_db() which is a prerequisite of any do_bui=
ld().
> The DB will be at most (threshold + build_time) old.
>=20
> Signed-off-by: Konstantin Shemyak <konstantin.shemyak@ge.com>
> ---
>  meta/classes/cve-check.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index 4d99838..12ad3e5 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -179,7 +179,7 @@ def check_cves(d, patched_cves):
>      cve_db_dir =3D d.getVar("CVE_CHECK_DB_DIR")
>      cve_whitelist =3D ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST=
"))
>      cve_cmd =3D "cve-check-tool"
> -    cmd =3D [cve_cmd, "--no-html", "--csv", "--not-affected", "-t", "fau=
x", "-d", cve_db_dir]
> +    cmd =3D [cve_cmd, "--no-html", "--skip-update", "--csv", "--not-affe=
cted", "-t", "faux", "-d", cve_db_dir]
> =20
>      # If the recipe has been whitlisted we return empty lists
>      if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
> --=20

ACK.

Reviewed-by: Mikko Rapeli <mikko.rapeli@bmw.de>=

