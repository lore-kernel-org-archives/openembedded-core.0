Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UF8z0-0002A5-KC
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 21:06:08 +0100
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2BJnSlb022487
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 14:49:28 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BJnS94013913
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 14:49:28 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 11 Mar 2013 14:49:28 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [RFC] kernel bbclass: return to original directory in do_deploy
Thread-Index: AQHOG4ClNJ6iEa4Thk6xLzyQRGjwUZig6/ew
Date: Mon, 11 Mar 2013 19:49:27 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594544FB@DLEE12.ent.ti.com>
References: <1362694248-15573-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1362694248-15573-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [RFC] kernel bbclass: return to original directory in do_deploy
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
X-List-Received-Date: Mon, 11 Mar 2013 20:06:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Maupin, Chase
> Sent: Thursday, March 07, 2013 4:11 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: [RFC] kernel bbclass: return to original directory in
> do_deploy

Just a quick ping on this.  Is anyone else seeing this issue?

>=20
> All,
>=20
> The below patch is just one way to fix the issue of dtb files
> not being copied into the deploy directory by the linux-dtb.inc
> file.  The details below show why this failed.  The reason I am
> marking this as an RFC is because I'm not sure this is the *best*
> way to fix the issue.  What I'm concerned about is whether others
> have already adapted their do_deploy_append functions to work
> around the directory location that the script is in after running
> the kernel_do_deploy step.  For example in the meta-ti layer
> the multi-kernel.inc file first changes directory to ${S} in
> the do_deploy_append function.
>=20
> It seems likely that if anyone has adapted to this then they are
> probably just doing a cd into ${S} but I wanted to get feedback
> on whether to fix the generic kernel_do_deploy function or just
> fix the do_deploy_append function in linux-dtb.inc.
>=20
> * During the base kernel_do_deploy function the directory is
>   changed to DEPLOYDIR in order to do some cleanup and
> symlinking.
>   However, the directory is not changed back to the original
>   starting directory ${S} at the end.  For append functions this
>   means that the starting directory is not ${S} as expected but
>   instead ${DEPLOYDIR}.
>=20
>   For functions like the do_deploy_append in
>   recipes-kernel/linux/linux-dtb.inc there is an assumption that
>   you are still in the source directory and not the DEPLOYDIR.
>   Without this change the .dtb files are not copied because the
>   check for the existence of ${DTS_FILE} which is a relative
>   path from the ${S} directory fails.  This means that the .dtb
>   files are not copied into the deploy directory and subsequently
>   the deploy/images directory.
>=20
>   In the log.do_deploy file you will see lines like:
>=20
>     Warning: arch/arm/boot/dts/xxxxx.dts is not available!
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  meta/classes/kernel.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass
> b/meta/classes/kernel.bbclass
> index 0a0430e..d57d1f5 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -352,6 +352,7 @@ kernel_do_deploy() {
>  	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
>=20
>  	cp ${COREBASE}/meta/files/deploydir_readme.txt
> ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> +	cd -
>  }
>  do_deploy[dirs] =3D "${DEPLOYDIR} ${B}"
>=20
> --
> 1.7.0.4



