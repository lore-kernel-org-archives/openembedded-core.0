Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SCv3P-0000vX-GI
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 17:44:55 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Mar 2012 08:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="124354043"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 28 Mar 2012 08:35:52 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 28 Mar 2012 08:35:51 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.142]) with mapi id
	14.01.0355.002; Wed, 28 Mar 2012 23:35:49 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Saul Wold <sgw@linux.intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/6] self-hosted-image: pre-populate the builder user
	with poky source
Thread-Index: AQHNC9x9tQfWfHCZDE+TsYaNASK1gZZ/2JZQ
Date: Wed, 28 Mar 2012 15:35:49 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCE9C6F@SHSMSX102.ccr.corp.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
	<5e91d5cc67fa356f9ed065aad28f978da7d29452.1332826876.git.sgw@linux.intel.com>
In-Reply-To: <5e91d5cc67fa356f9ed065aad28f978da7d29452.1332826876.git.sgw@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] self-hosted-image: pre-populate the builder user with poky source
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
X-List-Received-Date: Wed, 28 Mar 2012 15:44:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Saul,
Did you test "bitbake core-image-minimal" inside the vmware guest?
I got the following ERROR immediately:

------------------------
ERROR:  OE-core's config sanity checker detected a potential misconfigurati=
on.
    Either fix the cause of this error or at your own risk disable the chec=
ker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Pseudo is not functioning correctly, which will cause failures during p=
ackage installation. Please check your configuration.

ERROR: Execution of event handler 'check_sanity_eventhandler' failed
------------------------

I suspect in the guest, pseudo is not setup properly?

Thanks,
-- Dexuan

> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Tuesday, March 27, 2012 1:43 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Cui, Dexuan
> Subject: [PATCH 1/6] self-hosted-image: pre-populate the builder user wit=
h
> poky source
>=20
> From: Dexuan Cui <dexuan.cui@intel.com>
>=20
> This patch installs the poky source into the /home/builder/poky/ of the
> self-hosted-image.
> This makes the user of self-hosted-image easier to start a build.
>=20
> I think the recent poky master is stable enough, so I specify a commit nu=
mber
> by SRCREV -- we may want to update this number before releasing 1.2.
>=20
> This patch fixes [YOCTO #2065]
>=20
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
>=20
> Added code for supporting target based pseudo fixed indentation
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-core/images/self-hosted-image.bb |   41
> +++++++++++++++++++++++-
>  1 files changed, 39 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/images/self-hosted-image.bb
> b/meta/recipes-core/images/self-hosted-image.bb
> index d56c2cb..5aa670d 100644
> --- a/meta/recipes-core/images/self-hosted-image.bb
> +++ b/meta/recipes-core/images/self-hosted-image.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
>=20
> file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de
> 20420"
>=20
> -PR =3D "r5"
> +PR =3D "r6"
>=20
>  CORE_IMAGE_EXTRA_INSTALL =3D "\
>      task-self-hosted \
> @@ -13,7 +13,10 @@ CORE_IMAGE_EXTRA_INSTALL =3D "\  IMAGE_FEATURES
> +=3D "x11-mini package-management"
>=20
>  # Ensure there's enough space to do a core-image-minimal build, with
> rm_work enabled -IMAGE_ROOTFS_EXTRA_SPACE =3D "2621440"
> +IMAGE_ROOTFS_EXTRA_SPACE =3D "1048576"
> +#IMAGE_ROOTFS_EXTRA_SPACE =3D "2621440"
> +#IMAGE_ROOTFS_EXTRA_SPACE =3D "20971520"
> +#IMAGE_ROOTFS_EXTRA_SPACE =3D "5242880"
>=20
>  # Do a quiet boot with limited console messages  APPEND +=3D "quiet"
> @@ -21,3 +24,37 @@ APPEND +=3D "quiet"
>  IMAGE_FSTYPES =3D "vmdk"
>=20
>  inherit core-image
> +
> +SRCREV =3D "26a46938d3ea1821e7bec4fa6cc8379babad238b"
> +SRC_URI =3D "git://git.yoctoproject.org/poky;protocol=3Dgit"
> +
> +fakeroot do_populate_poky_src () {
> +	# Because fetch2's git's unpack uses -s cloneflag, the unpacked git rep=
o
> +	# will become invalid in the target.
> +	rm -rf ${WORKDIR}/git/.git
> +	rm -f ${WORKDIR}/git/.gitignore
> +
> +	cp -Rp ${WORKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
> +
> +	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/conf
> +	cp -Rp ${DL_DIR} ${IMAGE_ROOTFS}/home/builder/poky/build
> +	echo "/usr/bin" >
> ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
> +	echo "BB_NO_NETWORK =3D \"1\"" >
> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
> +	echo "INHERIT +=3D \"rm_work\"" >>
> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
> +        mkdir -p ${IMAGE_ROOTFS}/home/builder/pseudo
> +        echo "export PSEUDO_PREFIX=3D/usr" >>
> ${IMAGE_ROOTFS}/home/builder/.bashrc
> +        echo "export PSEUDO_LOCALSTATEDIR=3D/home/builder/pseudo" >>
> ${IMAGE_ROOTFS}/home/builder/.bashrc
> +        echo "export PSEUDO_LIBDIR=3D/usr/lib/pseudo/lib64" >>
> +${IMAGE_ROOTFS}/home/builder/.bashrc
> +
> +        chown builder.builder ${IMAGE_ROOTFS}/home/builder/pseudo
> +
> +	chown -R builder.builder  ${IMAGE_ROOTFS}/home/builder/poky }
> +
> +IMAGE_PREPROCESS_COMMAND +=3D "do_populate_poky_src; "
> +
> +python do_get_poky_src () {
> +    bb.build.exec_func('base_do_fetch', d)
> +    bb.build.exec_func('base_do_unpack', d) } addtask do_get_poky_src
> +before do_rootfs
> --
> 1.7.7.6



