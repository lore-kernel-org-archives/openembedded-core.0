Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1UAnE4-0005qQ-Nc
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 21:03:41 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Feb 2013 11:45:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,750,1355126400"; d="scan'208";a="291429747"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by orsmga002.jf.intel.com with ESMTP; 27 Feb 2013 11:47:14 -0800
Received: from orsmsx108.amr.corp.intel.com (10.22.225.40) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 27 Feb 2013 11:47:14 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.248]) by
	ORSMSX108.amr.corp.intel.com ([169.254.9.196]) with mapi id
	14.01.0355.002; Wed, 27 Feb 2013 11:47:13 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Development list for the linux-yocto*.git Linux kernel	repositories"
	<linux-yocto@yoctoproject.org>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [linux-yocto] [PATCH 5/8] kern-tools: import configuration,
	controls and audit updates
Thread-Index: AQHOFKhju0xorTuOHUuDhEN38xGnHJiOHJGQ
Date: Wed, 27 Feb 2013 19:47:13 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C49DE08F5@ORSMSX106.amr.corp.intel.com>
References: <cover.1361940628.git.bruce.ashfield@windriver.com>
	<df28843b15183bb8f349f0d68085baac03e4af89.1361940628.git.bruce.ashfield@windriver.com>
In-Reply-To: <df28843b15183bb8f349f0d68085baac03e4af89.1361940628.git.bruce.ashfield@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [linux-yocto] [PATCH 5/8] kern-tools: import configuration, controls and audit updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 20:03:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Nitin A Kamble <nitin.a.kamble@intel.com>

This patch is getting the linux-yocto-dev kernel building for the emgd base=
d meta-intel BSPs.
Without it the do_patch of the dev kernel fails as noted in the bug #3948.

Nitin

> -----Original Message-----
> From: linux-yocto-bounces@yoctoproject.org [mailto:linux-yocto-
> bounces@yoctoproject.org] On Behalf Of Bruce Ashfield
> Sent: Tuesday, February 26, 2013 9:07 PM
> To: richard.purdie@linuxfoundation.org
> Cc: linux-yocto@yoctoproject.org; openembedded-
> core@lists.openembedded.org
> Subject: [linux-yocto] [PATCH 5/8] kern-tools: import configuration, cont=
rols
> and audit updates
>=20
> Updating the kern-tools SRCREV to import the following fixes:
>=20
>   commit 7f91d198d32fc90260e52724ef4aac0b997c1e8b
>=20
>     kconf_check: fix new Kconfig detection
>=20
>     One of the functions of the kernel configuration audit is to notify
>     the user if Kconfig* files have been removed from the kernel, and
>     also to notify of new Kconfig files.
>=20
>     New Kconfig files should be classified as hardware or non-hardware to
>     allow BSP audits to notify if boards are setting values that they
>     shouldn't, hence why notifying about new "buckets" is important.
>=20
>   commit c4f26a3296e0e1c3dbdd5ec8e2947d5443a9ffc2
>=20
>     updateme/scc: allow config fragment exclusion
>=20
>     It is common to need the features (patches, git operations) of a
>     branch, but not want the kernel configuration fragments of a given
>     branch. To allow this, we provide a new include flag "nocfg".
>=20
>     When this flag is used, all of the configuration fragments included
>     by the targetted feature will not be applied to the current build,
>     with one exception, a base/critical fragment can force it's config
>     values, since without them, the system would not be functional.
>=20
>     Example:
>=20
>        include ktypes/standard/standard.scc nocfg
>=20
>   commit c7ec19d55aca6c4b17073c5362fce5be61a89d82
>=20
>     scc: wrap git merge
>=20
>     To allow for parameter validation and sanity checking, wrap "git merg=
e"
>     as a dedicated "merge" command instead of using the raw git fallback.
>=20
>     This also makes it consistent with existing top level commands such
>     as  'tag', 'branch', 'patch', etc.
>=20
>     There are no changes to arguments, and existing 'git merge' commands
>     continue to work with this change.
>=20
> [YOCTO #3419]
> [YOCTO #3421]
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 98cd8b9..9f4438c 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D
> "file://git/tools/kgit;beginline=3D5;endline=3D9;md5=3Dd8d1d729a70c
>=20
>  DEPENDS =3D "git-native guilt-native"
>=20
> -SRCREV =3D "9284af9b968d40e441b10f5c09961cbe329ccb9b"
> +SRCREV =3D "7f91d198d32fc90260e52724ef4aac0b997c1e8b"
>  PR =3D "r12"
>  PV =3D "0.1+git${SRCPV}"
>=20
> --
> 1.7.10.4
>=20
> _______________________________________________
> linux-yocto mailing list
> linux-yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/linux-yocto


