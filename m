Return-Path: <prvs=14556ee86=Mikko.Rapeli@bmw.de>
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id 18CC97F21A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1567756969; x=1599292969;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=TiLt/Pmp7rj7XRs7J6YTmA6QPWL7PL3ej/3HnwzCg3w=;
	b=PAuy+/PD157qWnSfzGmKzNS/uQHQV445m+8c4wK4wI7MELjDnLqCJXHN
	AVttgiRqR1ZGKQz55qc7iigUTOJG1A5cWOr6HZkJGBS23QK2fdoC+3GEr
	EIUVI2F4pUePyaQBfCWi/tqZbU6Dbw+I2On60b1nM4uurOAh0K9ACA6TY I=;
IronPort-SDR: UW0mzMoTYYfPuGH6YpGxHc/3EerLrgLNGk8GdHS9YHwn8i6pwIFKOG3uSTL9BiesXF38ZrQV5h
	nauu64Tid2eiTsiv+BTaxqoHvhmQfsrEX6te6rUseq7IQZ9XFc6qVBpwWPg9ptjcvz3evSPHpM
	DTkf+2hC3sodHp6ol7FWrS0tiIUQ9hv13uBJo2zAo4oJMThI5ZFjadbDL0xhvqO3W/3A+675+p
	AB+wVeHJCM7Gr1De3Zol97JYgVUCwmAxbCILjimsaMvkJcnxIANhi0l4vZuTCrzajHjhNGoKOh
	eno=
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa5.bmw.c3s2.iphmx.com with ESMTP/TLS; 06 Sep 2019 10:02:46 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw3.muc with ESMTP/TLS;
	06 Sep 2019 10:02:44 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb2.muc with ESMTP/TLS; 06 Sep 2019 10:02:44 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Fri, 6 Sep 2019 10:02:44 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Fri, 6 Sep 2019 10:02:44 +0200
From: <Mikko.Rapeli@bmw.de>
To: <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] systemd: ensure reproducible builds by clearly
	exposing the time epoch support
Thread-Index: AQHVZIl26Qp36vankES4uB2+wLaIJA==
Date: Fri, 6 Sep 2019 08:02:44 +0000
Message-ID: <20190906080244.GQ3040@hiutale>
References: <20190905230706.31765-1-ross.burton@intel.com>
In-Reply-To: <20190905230706.31765-1-ross.burton@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.41]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: ensure reproducible builds by clearly exposing the time epoch support
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
X-List-Received-Date: Fri, 06 Sep 2019 08:02:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4E7ADD74E852F248A1397355C3A3E029@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 06, 2019 at 12:07:06AM +0100, Ross Burton wrote:
> systemd has the ability to check the time on boot and if it's earlier tha=
n an
> epoch determined at build time, set the time to that epoch.  This is usef=
ul for
> systems where the system time is January 1st 1970 (because the unix times=
tamp
> was 0 at boot) as then at least the time is reset to something approximat=
ing the
> right year at least.
>=20
> By default systemd uses the mtime of the NEWS file, which is static for t=
arballs
> and corresponds to the time the release was made, but for git checkouts t=
his is
> simply the time do_unpack() was executed.  Thus, rebuilding systemd will =
cause
> this embedded timestamp to change.
>=20
> Remove the PACKAGECONFIG time-epoch which has the logic reversed: enablin=
g
> time-epoch will set the epoch to the unix timestamp 0).  Replace with
> set-time-epoch with the following semantics:
>=20
> - When disabled, the time epoch is set to 0 (1st January 1970), so there =
is no
>   time manipulation on boot.
>=20
> - When enabled, if reproducible builds are configured by setting
>   SOURCE_DATE_EPOCH then that timestamp is used for the time epoch.  If
>   reproducible builds are not configured then the timestamp of NEWS (thus=
 the
>   build time) is used.
>=20
> The set-time-epoch flag is enabled by default.
>=20
> [ YOCTO #13473 ]
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/systemd/systemd_242.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core=
/systemd/systemd_242.bb
> index 6bbe388b1f9..2c101cbbb4a 100644
> --- a/meta/recipes-core/systemd/systemd_242.bb
> +++ b/meta/recipes-core/systemd/systemd_242.bb
> @@ -83,6 +83,7 @@ PACKAGECONFIG ??=3D " \
>      quotacheck \
>      randomseed \
>      resolved \
> +    set-time-epoch \

Could this be enabled automatically when local.conf has INHERIT +=3D "repro=
ducible_build" ?

-Mikko

>      smack \
>      sysusers \
>      timedated \
> @@ -166,7 +167,12 @@ PACKAGECONFIG[seccomp] =3D "-Dseccomp=3Dtrue,-Dsecco=
mp=3Dfalse,libseccomp"
>  PACKAGECONFIG[selinux] =3D "-Dselinux=3Dtrue,-Dselinux=3Dfalse,libselinu=
x,initscripts-sushell"
>  PACKAGECONFIG[smack] =3D "-Dsmack=3Dtrue,-Dsmack=3Dfalse"
>  PACKAGECONFIG[sysusers] =3D "-Dsysusers=3Dtrue,-Dsysusers=3Dfalse"
> -PACKAGECONFIG[time-epoch] =3D "-Dtime-epoch=3D0,,"
> +# When enabled use reproducble build timestamp if set as time epoch,
> +# or build time if not. When disabled, time epoch is unset.
> +def build_epoch(d):
> +    epoch =3D d.getVar('SOURCE_DATE_EPOCH') or "-1"
> +    return '-Dtime-epoch=3D%d' % int(epoch)
> +PACKAGECONFIG[set-time-epoch] =3D "${@build_epoch(d)},-Dtime-epoch=3D0"
>  PACKAGECONFIG[timedated] =3D "-Dtimedated=3Dtrue,-Dtimedated=3Dfalse"
>  PACKAGECONFIG[timesyncd] =3D "-Dtimesyncd=3Dtrue,-Dtimesyncd=3Dfalse"
>  PACKAGECONFIG[usrmerge] =3D "-Dsplit-usr=3Dfalse,-Dsplit-usr=3Dtrue"
> --=20
> 2.20.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core=

