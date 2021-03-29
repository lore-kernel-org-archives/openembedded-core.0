Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.19118.1617008723391979200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 02:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=fgokMI59;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1617008723;
  x=1648544723;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=tfsy0SLFBnJUVSHs9sgeyZOn80PcynqtZTsnCoSTgR0=;
  b=fgokMI59G/QEsUJqxkvVyjTlSpwcnGBKQNldrlTdmSiJbAE6bQJU2KPi
   Rt8JmHK5JstQsYGpeIVqs+75i+QOlGITuZIO3cr5Ib/aE6gnwMP5s0u3f
   Rfw9BXTWgOj1j0DiwZiVl/OGc/K2/xr3xdKQr4P/qADZ8Or6MurH3qLsQ
   1LSWp+pnjwtAANI1h1hU8m9JcrR/setREMkYRPjnhtbxaJQ+NgBJkodSG
   oWo3k/tm51fXK6cWyI10VyMXwkpDDMif2+qFxjsIjy5YzOOwl+w0E4jf0
   xFlZlxsJushpvMVYGZShjbIVZt9B7EfrTH9sDOQ4nFDshDZgOnMlMqWtt
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: jan <jan.vermaete@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] Allow to overrule the URL in a bbappend.
Thread-Topic: [OE-core] [PATCH] Allow to overrule the URL in a bbappend.
Thread-Index: AQHXI/Ryeiww8xHMNkm3n6bHRZ6lE6qarQDw
Date: Mon, 29 Mar 2021 09:05:20 +0000
Message-ID: <bc009be5ebeb49cea1ab1e7ecae2cf4a@XBOX03.axis.com>
References: <20210328170108.2670-1-jan.vermaete@gmail.com>
In-Reply-To: <20210328170108.2670-1-jan.vermaete@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of jan
> Sent: den 28 mars 2021 19:01
> To: openembedded-core@lists.openembedded.org
> Cc: Jan Vermaete <jan.vermaete@gmail.com>
> Subject: [OE-core] [PATCH] Allow to overrule the URL in a bbappend.

Please make sure to prefix the commit subject with the recipe name.

//Peter

>=20
> With this small patch, it's possible to overrule the public
> URL with a local mirror for those without Internet access.
>=20
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  meta/recipes-core/meta/cve-update-db-native.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb
> b/meta/recipes-core/meta/cve-update-db-native.bb
> index b3dc33734d..25ec6bac71 100644
> --- a/meta/recipes-core/meta/cve-update-db-native.bb
> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> @@ -12,6 +12,8 @@ deltask do_compile
>  deltask do_install
>  deltask do_populate_sysroot
>=20
> +NVDCVE_URL ?=3D "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
> +
>  python () {
>      if not bb.data.inherits_class("cve-check", d):
>          raise bb.parse.SkipRecipe("Skip recipe when cve-check class is
> not loaded.")
> @@ -28,7 +30,6 @@ python do_fetch() {
>=20
>      bb.utils.export_proxies(d)
>=20
> -    BASE_URL =3D "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
>      YEAR_START =3D 2002
>=20
>      db_file =3D d.getVar("CVE_CHECK_DB_FILE")
> @@ -64,7 +65,7 @@ python do_fetch() {
>          for i, year in enumerate(range(YEAR_START, date.today().year +
> 1)):
>              bb.debug(2, "Updating %d" % year)
>              ph.update((float(i + 1) / total_years) * 100)
> -            year_url =3D BASE_URL + str(year)
> +            year_url =3D (d.getVar('NVDCVE_URL')) + str(year)
>              meta_url =3D year_url + ".meta"
>              json_url =3D year_url + ".json.gz"
>=20
> --
> 2.25.1

