Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QJnqe-0006SY-TF
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:23:41 +0200
Received: by wye20 with SMTP id 20so5279986wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 07:20:55 -0700 (PDT)
Received: by 10.216.156.70 with SMTP id l48mr1636011wek.5.1305037255143;
	Tue, 10 May 2011 07:20:55 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	g32sm3564123wej.27.2011.05.10.07.20.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 07:20:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6a6f3589dba7aff0cb89f233807e5d051d8d3e08.1305035617.git.richard.purdie@linuxfoundation.org>
Date: Tue, 10 May 2011 16:20:50 +0200
Message-Id: <CD6AE1D1-3C36-4269-B773-14C648F63736@dominion.thruhere.net>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<6a6f3589dba7aff0cb89f233807e5d051d8d3e08.1305035617.git.richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/6] bitbake.conf: Include the new default-providers.inc and default-versions.inc files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 14:23:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 mei 2011, om 16:00 heeft Richard Purdie het volgende geschreven:

> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> These are the minimal defaults to allow OE-Core to function standalone =
with
> no distro set and are constucted such that the distro can either =
override values,
> or totally replace the include file entirely as needed.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> meta/conf/bitbake.conf                            |    3 +
> meta/conf/distro/include/default-providers.inc    |   34 ++++++++++++
> meta/conf/distro/include/default-versions.inc     |   18 ++++++
> meta/conf/distro/include/poky-fixed-revisions.inc |   27 ---------
> meta/conf/distro/poky.conf                        |   59 =
+--------------------
> 5 files changed, 56 insertions(+), 85 deletions(-)
> create mode 100644 meta/conf/distro/include/default-providers.inc
> create mode 100644 meta/conf/distro/include/default-versions.inc
> delete mode 100644 meta/conf/distro/include/poky-fixed-revisions.inc
>=20

> diff --git a/meta/conf/distro/include/default-providers.inc =
b/meta/conf/distro/include/default-providers.inc
> new file mode 100644
> index 0000000..d51ac64
> --- /dev/null
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -0,0 +1,34 @@
>=20
> +PREFERRED_PROVIDER_gconf ?=3D "gconf-dbus"

the dbus port has long been merged upstream, so proper gconf would be a =
better choice. We could ignore it and just use dconf in meta-gnome, =
though ;)


> +PREFERRED_PROVIDER_opkg ?=3D "opkg"

We should sync with OE and drop the ssl/gpg stuff noone seems to be =
using.

> diff --git a/meta/conf/distro/include/default-versions.inc =
b/meta/conf/distro/include/default-versions.inc
> new file mode 100644
> index 0000000..0abbd8f
> --- /dev/null
> +++ b/meta/conf/distro/include/default-versions.inc
> @@ -0,0 +1,18 @@
> +#
> +# Default preferred versions
> +#
> +PULSEAUDIOVERSION ?=3D "0.9.22"
> +PULSEAUDIOVERSION_arm ?=3D "0.9.15"
> +PREFERRED_VERSION_pulseaudio ?=3D "${PULSEAUDIOVERSION}

AIUI 0.9.15 is the last version that doesn't need atomic ops. In OE we =
backported the necessary bits to gcc 4.3.x, gcc 4.5.x already has them. =
So lets drop the _arm override or atleast document why.

> +# Force the python versions in one place
> +PYTHON_BASEVERSION ?=3D "2.6"
> +PREFERRED_VERSION_python ?=3D "2.6.6"
> +PREFERRED_VERSION_python-native ?=3D "2.6.6"

Not really related, but update to 2.7.x?

regards,

Koen=


