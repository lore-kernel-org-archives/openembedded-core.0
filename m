Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 760056057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 21:23:26 +0000 (UTC)
Received: by wmww144 with SMTP id w144so196384055wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=di/tJQCZ1ckCqH7FGeSPGgXpBWjxXo/fMI9T/igZQaM=;
	b=jrx+/L9VPV5PoCeextuIk5j1BNC6+2o17XRb+R55FCYXEbvcOYdWJSUm6wGvSJFFIt
	gsC6PrpVfEiCLmpFcLtcEGwPnFeolCIUmu2A/v4VTl7kTJLqW2NKQt+4W1e+3UMymVuX
	5i+EB7EaUDV4oKzpUH2iTWbBT/d2koLU2/fWWrS17PAL3qNcBqunwdoOH7EZ59jT+Ss+
	B/bpAWZGbUyKNBCJopzrcbpv3/RY9c7/rAr13uFGoOFXijsAhG7p5sux6he2iZE9zF2z
	BG1aONO5hXpLIMHpU2zhemgjPoRMla5X4Y4P2l1zKZgkESRDwe3C51jfl8cTiGs1hIMN
	QSgg==
X-Received: by 10.28.153.130 with SMTP id b124mr7363002wme.12.1448486606604;
	Wed, 25 Nov 2015 13:23:26 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bg10sm24793677wjb.46.2015.11.25.13.23.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Nov 2015 13:23:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Nov 2015 22:23:59 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20151125212359.GS17303@jama>
References: <1448442523-4075-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1448442523-4075-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][master][jethro] package_manager.py: define info_dir and status_file when OPKGLIBDIR isn't the default
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
X-List-Received-Date: Wed, 25 Nov 2015 21:23:27 -0000
X-Groupsio-MsgNum: 73964
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+VeMz1SRxFChf6vr"
Content-Disposition: inline

--+VeMz1SRxFChf6vr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2015 at 10:08:43AM +0100, Martin Jansa wrote:
> * without this the do_rootfs task doesn't respect OPKGLIBDIR and
>   info, status are created in different directory than opkg on
>   target expects
> * people who modify OPKGLIBDIR need to make sure that opkg.conf included
>   in opkg package also sets info_dir and status_file options
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/lib/oe/package_manager.py | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager=
=2Epy
> index 964fddc..7b71174 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -1471,6 +1471,16 @@ class OpkgPM(PackageManager):
>                                          self.d.getVar('FEED_DEPLOYDIR_BA=
SE_URI', True),
>                                          arch))
> =20
> +            if self.opkg_dir !=3D '/var/lib/opkg':
> +                # There is no command line option for this anymore, we n=
eed to add
> +                # info_dir and status_file to config file, if OPKGLIBDIR=
 doesn't have
> +                # the default value of "/var/lib" as defined in opkg:
> +                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR=
      "/var/lib/opkg/info"
> +                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_F=
ILE   "/var/lib/opkg/status"
> +                cfg_file.write("option info_dir     %s\n" % os.path.join=
(self.opkg_dir, 'info'))
> +                cfg_file.write("option status_file  %s\n" % os.path.join=
(self.opkg_dir, 'status'))

This is older revision than what I was testing, v2 coming soon
(self.opkg_dir isn't good, because it is absolute path).

> +
> +
>      def _create_config(self):
>          with open(self.config_file, "w+") as config_file:
>              priority =3D 1
> @@ -1486,6 +1496,15 @@ class OpkgPM(PackageManager):
>                      config_file.write("src oe-%s file:%s\n" %
>                                        (arch, pkgs_dir))
> =20
> +            if self.opkg_dir !=3D '/var/lib/opkg':
> +                # There is no command line option for this anymore, we n=
eed to add
> +                # info_dir and status_file to config file, if OPKGLIBDIR=
 doesn't have
> +                # the default value of "/var/lib" as defined in opkg:
> +                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR=
      "/var/lib/opkg/info"
> +                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_F=
ILE   "/var/lib/opkg/status"
> +                config_file.write("option info_dir     %s\n" % os.path.j=
oin(self.opkg_dir, 'info'))
> +                config_file.write("option status_file  %s\n" % os.path.j=
oin(self.opkg_dir, 'status'))
> +
>      def insert_feeds_uris(self):
>          if self.feed_uris =3D=3D "":
>              return
> --=20
> 2.6.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+VeMz1SRxFChf6vr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZWJu4ACgkQN1Ujt2V2gBwwjgCeIBVIeCmFO+oK9LHHPmiTDc48
tpMAoKrRNmwznsIPnw5HNX5e9PHS026w
=3F5r
-----END PGP SIGNATURE-----

--+VeMz1SRxFChf6vr--
