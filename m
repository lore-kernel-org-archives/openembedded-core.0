Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 083A260557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 15:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 7F49D2E356;
	Tue, 11 Apr 2017 17:32:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Xpn0-D9DpPKj; Tue, 11 Apr 2017 17:32:41 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 0CF662E122;
	Tue, 11 Apr 2017 17:32:40 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C74AB1E06A;
	Tue, 11 Apr 2017 17:32:40 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC1771E066;
	Tue, 11 Apr 2017 17:32:40 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 11 Apr 2017 17:32:40 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id ABD4E2FB6;
	Tue, 11 Apr 2017 17:32:40 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 11 Apr 2017 17:32:40 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Tue, 11 Apr 2017 17:32:40 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv3 1/1] native/nativesdk: Use fixed
	DISTRO_FEATURES
Thread-Index: AQHSstD04kxreEE7AEyS6n9ZZbq4iKHAS65g
Date: Tue, 11 Apr 2017 15:32:40 +0000
Message-ID: <8f6fdae166cb44babe9c975f584df839@XBOX02.axis.com>
References: <cover.1491920909.git.jussi.kukkonen@intel.com>
	<ea482eb749a7dbeb22743bf6ce3f31c447b970bf.1491920909.git.jussi.kukkonen@intel.com>
In-Reply-To: <ea482eb749a7dbeb22743bf6ce3f31c447b970bf.1491920909.git.jussi.kukkonen@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCHv3 1/1] native/nativesdk: Use fixed DISTRO_FEATURES
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
X-List-Received-Date: Tue, 11 Apr 2017 15:32:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Jussi Kukkonen
> Sent: den 11 april 2017 16:36
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCHv3 1/1] native/nativesdk: Use fixed
> DISTRO_FEATURES
>=20
> There seems to be little advantage to letting distro features affect
> native builds. There is a significant disadvantage: a change to
> DISTRO_FEATURES will trigger a lot of unnecessary native tasks. In a
> test like this:
>   $ bitbake core-image-minimal
>   # append " systemd" to DISTRO_FEATURES
>   $ bitbake core-image-minimal
> The latter build takes 44 minutes (28%) of cpu-time less with this
> patch (skipping 135 native tasks). Sadly wall clock time was not
> affected as glibc remains the bottleneck.
>=20
> Set native distro features to DISTRO_FEATURES_NATIVE appended with
> an intersection of DISTRO_FEATURES and DISTRO_FEATURES_FILTER_NATIVE.
> Current default values (baitbake.conf) are
> * DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation" (as gtk-doc-
> native
> has much less dependencies when built without it)
> * DISTRO_FEATURES_NATIVE ?=3D "x11" (to enable native UIs even if target
> does not containe them)
>=20
> Do the variable setting in native_virtclass_handler() because otherwise
> it could still be overridden by appends and the feature backfilling.
> Shuffle the early returns so DISTRO_FEATURES gets set as long as
> the packagename ends with "-native".
>=20
> Add similar variables for nativesdk.
>=20
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/classes/native.bbclass    | 14 ++++++++++----
>  meta/classes/nativesdk.bbclass |  6 ++++++
>  meta/conf/bitbake.conf         |  9 +++++++++
>  3 files changed, 25 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> index 1919fbc..aec1087 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -121,14 +121,20 @@ PATH_prepend =3D "${COREBASE}/scripts/native-
> intercept:"
>  SSTATE_SCAN_CMD ?=3D "${SSTATE_SCAN_CMD_NATIVE}"
>=20
>  python native_virtclass_handler () {
> -    classextend =3D e.data.getVar('BBCLASSEXTEND') or ""
> -    if "native" not in classextend:
> -        return
> -
>      pn =3D e.data.getVar("PN")
>      if not pn.endswith("-native"):
>          return
>=20
> +    # Set features here to prevent appends and distro features
> backfill
> +    # from modifying native distro features
> +    features =3D set(d.getVar("DISTRO_FEATURES_NATIVE").split())
> +    filtered =3D set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO=
_FEATURES_FILTER_NATIVE"), d).split())
> +    d.setVar("DISTRO_FEATURES", " ".join(features | filtered))

You should sort the list of features to make it deterministic.

> +
> +    classextend =3D e.data.getVar('BBCLASSEXTEND') or ""
> +    if "native" not in classextend:
> +        return
> +
>      def map_dependencies(varname, d, suffix =3D ""):
>          if suffix:
>              varname =3D varname + "_" + suffix
> diff --git a/meta/classes/nativesdk.bbclass
> b/meta/classes/nativesdk.bbclass
> index ebcfb2d..655b456 100644
> --- a/meta/classes/nativesdk.bbclass
> +++ b/meta/classes/nativesdk.bbclass
> @@ -70,6 +70,12 @@ python nativesdk_virtclass_handler () {
>      if not (pn.endswith("-nativesdk") or pn.startswith("nativesdk-")):
>          return
>=20
> +    # Set features here to prevent appends and distro features
> backfill
> +    # from modifying nativesdk distro features
> +    features =3D set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
> +    filtered =3D set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO=
_FEATURES_FILTER_NATIVESDK"), d).split())
> +    d.setVar("DISTRO_FEATURES", " ".join(features | filtered))

Sort this one as well.

> +
>      e.data.setVar("MLPREFIX", "nativesdk-")
>      e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN").replace("-
> nativesdk", "").replace("nativesdk-", ""))
>      e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) +
> ":virtclass-nativesdk")
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5e98d45..dca6bd4 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -789,6 +789,15 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?=3D ""
>  EXTRA_IMAGE_FEATURES ??=3D ""
>  IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
>=20
> +# Native distro features (will always be used for -native, even if
> they
> +# are not enabled for target)
> +DISTRO_FEATURES_NATIVE ?=3D "x11"
> +DISTRO_FEATURES_NATIVESDK ?=3D "x11"
> +# Normally target distro features will not be applied to native
> builds:
> +# Native distro features on this list will use the target feature
> value
> +DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation"
> +DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation"
> +
>  DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit bluez5 gobject-
> introspection-data ldconfig"
>  MACHINE_FEATURES_BACKFILL =3D "rtc qemu-usermode"
>=20
> --
> 2.1.4

//Peter


