Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 484E9718E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 15:16:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Jan 2015 07:12:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,475,1418112000"; d="scan'208";a="676782583"
Received: from krogon-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.16.44])
	by orsmga002.jf.intel.com with ESMTP; 27 Jan 2015 07:16:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Walter Giroir <walt@giroir.com>
Date: Tue, 27 Jan 2015 15:16:08 +0000
Message-ID: <2979985.IVZ0R9uNM5@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <9E188571-903A-4F88-803D-D3A7CAF5BFC1@giroir.com>
References: <loom.20150124T182655-678@post.gmane.org>
	<3490468.1xbMJtenE6@peggleto-mobl5.ger.corp.intel.com>
	<9E188571-903A-4F88-803D-D3A7CAF5BFC1@giroir.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: create_image() fails with cannot concatenate 'str' and 'NoneType'error
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
X-List-Received-Date: Tue, 27 Jan 2015 15:16:11 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday 27 January 2015 07:55:56 Walter Giroir wrote:
> I am relatively new to the Yocto environment so I=E2=80=99m probably =
not defining
> something correctly here.
>=20
> The IMAGE_CLASSES appears to be configured properly.
>=20
> bitbake -e | grep ^IMAGE_CLASSES
> IMAGE_CLASSES=3D" sdcard_image-sunxi-wigwag"
>=20
>=20
>=20
> I added a few =E2=80=9Cdebug=E2=80=9D statements in image.py around l=
ine 300
>=20
>         for fstype_group in fstype_groups:
>             image_cmds =3D []
>             for type in fstype_group:
>                 cmds =3D []
>                 subimages =3D []
>=20
>                 localdata =3D bb.data.createCopy(self.d)
>                 localdata.setVar('OVERRIDES', '%s:%s' % (type,
> old_overrides)) bb.data.update_data(localdata)
>                 localdata.setVar('type', type)
>                 print "************************"
>                 print "************************"
>                 print fstype_group
>                 print type
>                 print localdata.getVar("IMAGE_CMD", True)
>                 print "************************"
>                 print "************************"
>                 cmds.append("\t" + localdata.getVar("IMAGE_CMD", True=
))
>                 cmds.append(localdata.expand("\tcd ${DEPLOY_DIR_IMAGE=
}"))
>=20
>=20
> And the end of the log.do_rootfs.pid shows the output of the print
> statements File:
> '/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image.py', lin=
eno:
> 305, function: _get_imagecmds 0301:                print type
>      0302:                print localdata.getVar("IMAGE_CMD", True)
>      0303:                print "************************"
>      0304:                print "************************"
>  *** 0305:                cmds.append("\t" + localdata.getVar("IMAGE_=
CMD",
> True)) 0306:                cmds.append(localdata.expand("\tcd
> ${DEPLOY_DIR_IMAGE}")) 0307:
>      0308:                if type in cimages:
>      0309:                    for ctype in cimages[type]:
> Exception: TypeError: cannot concatenate 'str' and 'NoneType' objects=

>=20
> DEBUG: Python function do_rootfs finished
> ERROR: Function failed: do_rootfs
> ************************
> ************************
> ['tar', 'ext3', 'sunxi-sdimg']
> tar
> tar -cvf
> /home/walt/workspace/wwrelay-rootfs/yocto/build/tmp/deploy/images/wig=
wagrel
> ay/wigwag-prod-lsb-wigwagrelay-20150127133345.rootfs.tar -C
> /home/walt/workspace/wwrelay-rootfs/yocto/build/tmp/work/wigwagrelay-=
poky-l
> inux-gnueabi/wigwag-prod-lsb/1.0-r0/rootfs . ************************=

> ************************
> ************************
> ************************
> ['tar', 'ext3', 'sunxi-sdimg']
> ext3
> oe_mkext234fs ext3 -i 4096
> ************************
> ************************
> ************************
> ************************
> ['tar', 'ext3', 'sunxi-sdimg']
> sunxi-sdimg
> None
> ************************
> ************************
>=20
>=20
> It looks like it=E2=80=99s not looking at the second group
>=20
> NOTE: The image creation groups are: [['tar', 'ext3', 'sunxi-sdimg'],=

> ['sunxi-wigwag-sdimg']]
>=20
>=20
>=20
>=20
> Here are my BBLAYERS
>=20
> > bitbake -e | grep ^BBLAYERS=3D
>=20
> BBLAYERS=3D"/home/walt/workspace/wwrelay-rootfs/yocto/meta
> /home/walt/workspace/wwrelay-rootfs/yocto/meta-yocto
> /home/walt/workspace/wwrelay-rootfs/yocto/meta-yocto-bsp
> /home/walt/workspace/wwrelay-rootfs/meta-sunxi
> /home/walt/workspace/wwrelay-rootfs/meta-wigwag-relay
> /home/walt/workspace/wwrelay-rootfs/yocto/meta-hob"
>=20
> Which does contain our layer:
> /home/walt/workspace/wwrelay-rootfs/meta-wigwag-relay
>=20
> The conf file for this layer contains:
> > cat /home/walt/workspace/wwrelay-rootfs/meta-wigwag-relay/conf/laye=
r.conf
>=20
> # We have a conf and classes directory, append to BBPATH
> BBPATH .=3D ":${LAYERDIR}"
>=20
> # We have a recipes directory, add to BBFILES
> BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bb=
append"
>=20
> BBFILE_COLLECTIONS +=3D "wigwagrelay"
> BBFILE_PATTERN_wigwagrelay :=3D "^${LAYERDIR}/"
> BBFILE_PRIORITY_wigwagrelay =3D "10"
>=20
>=20
>=20
> The machine conf;
>=20
> > cat
> > /home/walt/workspace/wwrelay-rootfs/meta-wigwag-relay/conf/machine/=
wigwag
> > relay.conf
> #@TYPE: Machine
> #@NAME: WigWag Relay
> #@DESCRIPTION: Machine configuration for the WigWag Relay, based on
> allwinner a10 CPU
>=20
> # Only has DVI connector for external screen
> GUI_MACHINE_CLASS =3D "bigscreen"
>=20
> require conf/machine/include/tune-cortexa7.inc
> require conf/machine/include/sunxi-wigwag.inc
> require conf/machine/include/sunxi-mali.inc
>=20
> UBOOT_MACHINE =3D "wigwag_controller_config"
> UBOOT_ENTRYPOINT =3D "0x40008000"
> UBOOT_LOADADDRESS =3D "0x40008000"
>=20
> #MACH=3Dsun4i
> #KERNEL_CONFIG=3Dsun4i_defconfig
>=20
>=20
> SERIAL_CONSOLE =3D "115200 ttyS0"
>=20
> MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat alsa wifi"
>=20
> And the contents of sunxi-wigwag.inc add the IMAGE_CLASSES:
>=20
>  cat
> /home/walt/workspace/wwrelay-rootfs/meta-wigwag-relay/conf/machine/in=
clude/
> sunxi-wigwag.inc PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg=
"
> XSERVER =3D "xserver-xorg \
>            xf86-video-fbturbo \
>            xf86-input-evdev \
>            xf86-input-mouse \
>            xf86-input-keyboard"
>=20
> PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> PREFERRED_VERSION_linux-libc-headers =3D "3.4.61"
>=20
> KERNEL_IMAGETYPE =3D "uImage"
>=20
> IMAGE_CLASSES +=3D "sdcard_image-sunxi-wigwag"
> IMAGE_FSTYPES +=3D "ext3 tar.gz sunxi-wigwag-sdimg"
>=20
> MACHINE_EXTRA_RRECOMMENDS =3D "kernel-modules"

OK, so from what I can see, no IMAGE_CMD is defined for sunxi-sdimg whi=
ch=20
apparently is in IMAGE_FSTYPES, that's what's actually triggering the e=
rror.=20
This error prevents the code from continuing on to the second group.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

