Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UdHye-0003Up-QC
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 12:33:33 +0200
Received: by mail-ea0-f174.google.com with SMTP id z7so2427027eaf.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 03:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=PZOU5huWEZ3AT9+XU6l3SmB7j3us6xHhdyOIDeoUKpA=;
	b=rGtflHn2d5AMR+BGb73IkwV/b2nd6WBz6ejpsOrKq5GX1i5Y/EdlNH+cp0fw9zT+ie
	1a1+c8kFcAqBJdQ2fTbdOy62rKW1adsGCAUOGVFBqeYO6Ll4us5Q98c5CZqJ55WL31i+
	zrB+PE30+H2UsvgSaN4PlPs4EP1SNaPfJNtXV2fNPxhyszpAoFMU136sanMzjNWpOXpF
	y/+7/WoXwWSP1E4Zm6IVaG8kE2cszIK1qt/cq3dg/NJCCLVX1tUfnqZYEnOPhPA/QVcN
	ZB+Qj/Oi0NPT2NqzoEYsghts8lHjC/R58gJO26TtaUotfV12pvOIdEbblxWZCL5f3L8K
	bxYQ==
X-Received: by 10.14.38.198 with SMTP id a46mr128092211eeb.11.1368785717075;
	Fri, 17 May 2013 03:15:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n7sm17656564eeo.0.2013.05.17.03.15.15 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 17 May 2013 03:15:16 -0700 (PDT)
Date: Fri, 17 May 2013 12:15:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20130517101526.GI24809@jama.dyndns-home.com>
References: <1368689187-4714-1-git-send-email-xiao.zhang@windriver.com>
	<1368689187-4714-2-git-send-email-xiao.zhang@windriver.com>
	<5194AE0D.8030508@windriver.com> <5195D693.9090003@linux.intel.com>
	<5195FBBA.6030309@topic.nl>
MIME-Version: 1.0
In-Reply-To: <5195FBBA.6030309@topic.nl>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: package_write_ipk somehow looks into the wrong path
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
X-List-Received-Date: Fri, 17 May 2013 10:33:34 -0000
X-Groupsio-MsgNum: 39379
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l0l+eSofNeLXHSnY"
Content-Disposition: inline

--l0l+eSofNeLXHSnY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2013 at 11:43:22AM +0200, Mike Looijmans wrote:
>=20
> I got this very weird build failure. It builds fine for one machine=20
> (zedboard), but it craps out in a really weird way on the "zynq-zc702"=20
> machine.
>=20
> Somehow the "package_write_ipk" task wants to find files in a directory=
=20
> with "1-r0" (a version that has once existed a long long time ago) in=20
> the version part, instead of the proper git hashed name.
>=20
> I've tried a "cleansstate" but that did not help. The "compile" step in=
=20
> this recipe takes about 1,5 hour on my i7 system, so debugging this=20
> recipe is painfully slow...
>=20
> I've attached the recipes, pasted the log below.

try it with 2/2 patch from
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4102

>=20
>=20
>=20
>=20
> mike@paradigit:~/zynq/build$ nice -n 15 bitbake my-image
> Loading cache: 100% |###########################################| ETA:=20
> 00:00:00
> Loaded 1907 entries from dependency cache.
> Parsing recipes: 100% |#########################################| Time:=
=20
> 00:00:00
> Parsing of 1517 .bb files complete (1514 cached, 3 parsed). 1909=20
> targets, 115 skipped, 0 masked, 0 errors.
>=20
> Build Configuration:
> BB_VERSION        =3D "1.17.1"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "Ubuntu-11.10"
> TARGET_SYS        =3D "arm-oe-linux-gnueabi"
> MACHINE           =3D "zynq-zc702"
> DISTRO            =3D "tiny"
> DISTRO_VERSION    =3D "oe-core.0"
> TUNE_FEATURES     =3D "armv7a vfp neon"
> TARGET_FPU        =3D "vfp-neon"
> meta              =3D "master:a3c1e0f4e519921a692a5f4d1268a4eb249b1b03"
> meta-oe
> toolchain-layer
> meta-efl
> meta-gpe
> meta-gnome
> meta-xfce
> meta-multimedia   =3D "master:3dcea929763e6a3233dbe620920f02682b28bb8d"
> meta-zynq         =3D "master:7458ae3d3007c8159152a930a7f40991c1725240"
> meta-topic        =3D "master:860265ec025e9c7f05acd0778591cc9390a39e6c"
>=20
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Error executing a python function in=20
> /home/mike/zynq/meta-zynq/recipes-bsp/fpga/fpga-image.bb:
> OSError: [Errno 2] No such file or directory:=20
> '/home/mike/zynq/build/tmp-eglibc/work/zynq-zc702-oe-linux-gnueabi/fpga-i=
mage/1-r0/packages-split/fpga-image'
>=20
> ERROR: The stack trace of python calls that resulted in this=20
> exception/failure was:
> ERROR:   File "do_package_ipk", line 194, in <module>
> ERROR:
> ERROR:   File "do_package_ipk", line 45, in do_package_ipk
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0190:        bb.utils.unlockfile(lf)
> ERROR:      0191:
> ERROR:      0192:
> ERROR:      0193:
> ERROR:  *** 0194:do_package_ipk(d)
> ERROR:      0195:
> ERROR: [From file: 'do_package_ipk', lineno: 194, function: <module>]
> ERROR:      0041:        basedir =3D os.path.join(os.path.dirname(root))
> ERROR:      0042:        arch =3D localdata.getVar('PACKAGE_ARCH', True)
> ERROR:      0043:        pkgoutdir =3D "%s/%s" % (outdir, arch)
> ERROR:      0044:        bb.mkdirhier(pkgoutdir)
> ERROR:  *** 0045:        os.chdir(root)
> ERROR:      0046:        from glob import glob
> ERROR:      0047:        g =3D glob('*')
> ERROR:      0048:        try:
> ERROR:      0049:            del g[g.index('CONTROL')]
> ERROR: [From file: 'do_package_ipk', lineno: 45, function: do_package_ipk]
> ERROR: Function failed: do_package_ipk
> ERROR: Execution of event handler 'run_buildstats' failed
> Traceback (most recent call last):
>    File "run_buildstats(e)", line 103, in=20
> run_buildstats(e=3D<bb.build.TaskFailed object at 0x1575ca90>)
>    File "buildstats.bbclass", line 5, in=20
> write_task_data(status=3D'failed',=20
> logfile=3D'/home/mike/zynq/build/tmp-eglibc/buildstats/my-image-zynq-zc70=
2/201305171106/fpga-image-1-r0/do_package_write_ipk',=20
> dev=3D'sda5', e=3D<bb.build.TaskFailed object at 0x1575ca90>)
> IOError: [Errno 2] No such file or directory:=20
> '/home/mike/zynq/build/tmp-eglibc/buildstats/my-image-zynq-zc702/20130517=
1106/fpga-image-1-r0/do_package_write_ipk'
>=20
> ERROR: Logfile of failure stored in:=20
> /home/mike/zynq/build/tmp-eglibc/work/zynq-zc702-oe-linux-gnueabi/fpga-im=
age/2.AUTOINC-8095d780aab8d110298d655852f8f31053f5f124-r0/temp/log.do_packa=
ge_write_ipk.5262
> ERROR: Task 335=20
> (/home/mike/zynq/meta-zynq/recipes-bsp/fpga/fpga-image.bb,=20
> do_package_write_ipk) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1836 tasks of which 1799 didn't need to=20
> be rerun and 1 failed.
> No currently running tasks (1836 of 1840)
>=20
> Summary: 1 task failed:
>    /home/mike/zynq/meta-zynq/recipes-bsp/fpga/fpga-image.bb,=20
> do_package_write_ipk
> Summary: There were 26 ERROR messages shown, returning a non-zero exit co=
de.
>=20

> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285=
ec7b81fdeb3b58"
> # Package is machine specific
> PACKAGE_ARCH =3D "${MACHINE}"
>=20
> # Workaround: XPS fails to build when there's a "+" in the path.
> SRCPV_NOPLUS =3D "${@d.getVar('SRCPV',True).replace('+','-')}"
>=20
> S=3D"${WORKDIR}/git"
>=20
> BOARD_DESIGN_URI ?=3D ""
>=20
> BOARD_DESIGN_URI_zedboard =3D "git://github.com/milosoftware/zynq-zedboar=
d-logic.git"
> SRCREV_board-zedboard =3D "63e317164357bf87bba7dd0adc429d4c91a78cff"
>=20
> BOARD_DESIGN_URI_zynq-zc702 =3D "git://github.com/milosoftware/zynq-zc702=
-logic.git"
> SRCREV_board-zynq-zc702 =3D "8095d780aab8d110298d655852f8f31053f5f124"
>=20
> SRC_URI =3D "\
> 	${BOARD_DESIGN_URI};name=3Dboard-${MACHINE} \
> 	http://wiki.analog.com/_media/resources/fpga/xilinx/kc705/cf_adv7511_zed=
_edk_14_4_2013_02_05.tar.gz;name=3Dvhdl \
> 	"
>=20
> SRC_URI[vhdl.md5sum] =3D "7bfa99f576e0f4a40d6fc30c2e111470"
> SRC_URI[vhdl.sha256sum] =3D "4dea2dc0c32da8556c88e299350964816b67593d23eb=
590fb62393ce62229f09"
>=20

> DESCRIPTION =3D "FPGA bit image loader from userspace and tools"
> DEPENDS =3D "python-native"
>=20
> require fpga-design.inc
>=20
> PV =3D "2.${SRCPV_NOPLUS}"
> PR =3D "r0"
>=20
> PACKAGES =3D "${PN}"
>=20
> S=3D"${WORKDIR}/git"
>=20
> SRC_URI +=3D "\
> 	file://fpga-bit-to-bin.py \
> 	file://init \
> 	"
>=20
> inherit update-rc.d
>=20
> # Set to start at 03, which is before modutils
> # so you can autoload modules which use FPGA logic.
> INITSCRIPT_NAME =3D "${PN}.sh"
> INITSCRIPT_PARAMS =3D "start 03 S ."
>=20
> do_compile() {
> 	export LM_LICENSE_FILE=3D"${XILINX_LM_LICENSE_FILE}"
> 	source ${XILINX_TOOL_PATH}/ISE_DS/settings${XILINX_TOOL_ARCH}.sh
> 	xps -nw system.xmp << EOF
> run bits
> run exporttosdk
> EOF
> 	python ${WORKDIR}/fpga-bit-to-bin.py --flip ${S}/implementation/system.b=
it ${WORKDIR}/fpga.bin
> }
>=20
> FILES_${PN} =3D "${sysconfdir} ${datadir}"
> do_install() {
> 	install -d ${D}${sysconfdir}
> 	install -d ${D}${sysconfdir}/init.d
> 	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/${PN}.sh
> 	install -d ${D}${datadir}
> 	install -m 644 ${WORKDIR}/fpga.bin ${D}${datadir}/fpga.bin
> }
>=20
> # Store the SDK files into the sysroot for other packages
> SYSROOT_PREPROCESS_FUNCS +=3D "fpga_sysroot_preprocess"
> fpga_sysroot_preprocess() {
> 	install -d ${SYSROOT_DESTDIR}${datadir}/xilinx_sdk
> 	cp -r ${S}/SDK/SDK_Export/hw/* ${SYSROOT_DESTDIR}${datadir}/xilinx_sdk/
> }

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--l0l+eSofNeLXHSnY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGWAz4ACgkQN1Ujt2V2gBy7JgCfYuu6cAv4tqcngO6wOSFeThqz
AFEAoIc4wFodqOmc7F392y574+68pBjc
=tKq1
-----END PGP SIGNATURE-----

--l0l+eSofNeLXHSnY--
