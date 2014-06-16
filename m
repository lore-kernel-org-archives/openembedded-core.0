Return-Path: <Adrian.Calianu@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id EA0996FE98
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 13:18:35 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0158.001; Mon, 16 Jun 2014 15:18:31 +0200
From: Adrian Calianu <Adrian.Calianu@enea.com>
To: Tom Zanussi <tom.zanussi@intel.com>, Adrian Calianu
	<Adrian.Calianu@enea.com>
Thread-Topic: [OE-core] [PATCHv2 1/2] Add wic support to generate rootfs
	image for uboot
Thread-Index: AQHPhhqSFULF4mbDZUiIihC7the0HptvW5MAgARHY8A=
Date: Mon, 16 Jun 2014 13:18:30 +0000
Message-ID: <A1661D2DDD942248A02617DE63569A0125CBF373@SESTOEX04.enea.se>
References: <5399151E.3050306@linux.intel.com>
	<1402562639-60930-1-git-send-email-y>	<1402562639-60930-2-git-send-email-y>
	<1402690716.11584.62.camel@empanada>
In-Reply-To: <1402690716.11584.62.camel@empanada>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.14.142]
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] Add wic support to generate rootfs image for uboot
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
X-List-Received-Date: Mon, 16 Jun 2014 13:18:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Tom,

	First of all, thanks for your review comments! I'm glad that community has=
 interest for this features.
	I will answer to your comments in-line below...

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Tom Zanussi
> Sent: Friday, June 13, 2014 11:19 PM
> To: y@enea.se
> Cc: openembedded-core@lists.openembedded.org; Otavio Salvador
> Subject: Re: [OE-core] [PATCHv2 1/2] Add wic support to generate rootfs
> image for uboot
>=20
> Hi,
>=20
> This looks like some nice new functionality, but I have some suggestions
> regarding the implementation and the posting itself...
>=20
> First, this seems to have been sent by a 'y' at enea, but they're
> apparently written by adrian.calianu at enea - why can't adrian.calianu
> send them himself? (makes me wonder about the authorship, etc).
[Adrian Calianu] It was an issue with local git server since the patch was =
send directly from git but nothing to worry about, problem was fixed.

>=20
> Also, there seems to be just one big patch, but the subject says
> '[PATCHv2 1/2] Add wic support to generate rootfs image for uboot' - am
> I missing 2/2?
[Adrian Calianu] Actually there were two versions of patch and for each pat=
ch a cover letter was also generated which lead to those numbers.

>=20
> As for the patch itself, it's huge and needs to be broken up into
> smaller pieces.  In fact, it seems to be a combination of two completely
> separate things at least - a new mechanism for creating a rootfs from
> packages, and a new plugin for creating uboot partitions (which just
> happens to use the output from the new packaging step.  So at minimum I
> think you need to break it up along the lines of that functionality, and
> it would be good to break it up even further e.g. 'Add a new do_pkg
> interface hook', 'Add an implementation of do_pkg for ipk', 'Add a new
> source plugin for uboot partitions', 'Add a new canned wks for a default
> uboot image', etc.  The more you can break it up into logical chunks
> without going overboard, the easier it is to review and apply/revert.
[Adrian Calianu] I agree that there are two main features but the reason of=
 not break it in small pieces now was to provide a fully functional patch f=
or community to test it and be able to provide a feedback for this patch, s=
ince those features cannot be tested independently now.
So, is it acceptable to provide patches that cannot be tested?

>=20
> Finally, something like this really needs to be documented in the tool -
> please add the relevant interface documentation to the help system.
[Adrian Calianu] Ok, I will investigate and add more info to help system.=20
I saw that the Yocto manual included wic doc only in 1.5.2 version(http://w=
ww.yoctoproject.org/docs/1.5.2/dev-manual/dev-manual.html). Why that info i=
s not found into the latest Yocto manual?
It is anything planned about that?

>=20
> For the 'packaging' part of this patch, the big problem I see is that
> the package_manager seems to be basically a copy of the oe package
> manager and more (which you mention in the comments) - I don't think it
> makes much sense to do that - wouldn't it be better to patch the oe
> package_manager code so that it could be reused by this tool?
[Adrian Calianu] This is a subject of discussion I think. Yes, first time I=
 just used the modules from bitbake and oe and worked perfectly but this me=
ans to link wic tool by bitbake and all his specific features like BB_varia=
bles, dataSmart,... Is this acceptable? Shouldn't wic tool be as independen=
t as possible? What is the plan for wic tool in future?

I see that the wic tool came with backend plugins (yum package manager).  S=
o depending on the plans for wic tool in future we may move this new packag=
e manager into backend plugin folder or use the one from bitbake also for r=
pm packages and remove existing one. I see it as an open subject.

>=20
> For the 'uboot' part, is the 'uboot' plugin implementing common
> functionality that all uboot images need, or is it for a specific use
> case (if so, it shouldn't be called 'uboot' but something more
> specific)?  Otavio seemed to suggest that in general it would need to be
> modified for specific cases.  I'm not sure about the best way to do that
> - we don't have many good examples yet.  Can that sort of thing be
> parameterized/subclassed, or would it require a per-image plugin, which
> would be good to avoid.  Not something you have to solve now, if the
> 'uboot' plugin is useful on its own and maybe subclassed/added onto by
> future plugins.  It would be nice to have some specific and succinct
> examples to help think through what might be needed here.
[Adrian Calianu] I was thinking it as a general uboot plugin and in future =
parameterized it like other existing plugins. We have plans to extend it fo=
r SD/MMC cards.

>=20
> Some more specific comments in-line below...
>=20
> On Thu, 2014-06-12 at 10:43 +0200, y@enea.se wrote:
> > From: Adrian Calianu <adrian.calianu@enea.com>
> >
> > Add support in wic to build ramdisk uboot images from list of packages =
or
> > from an existing rootfs folder.
> >
> > Providing the list of packages starting with XXX-core-boot package(into=
 wks
> file)
> > will generate an rootfs image for uboot out of bitbake.
>=20
>=20
> > There is also possible to combine an existing/application rootfs with a=
 list
> > of packages that can be installed but the user must take care to provid=
e
> > a basic core boot rootfs or XXX-core-boot package and reporul(wic.conf)=
.
> >
>=20
> Is this implemented in the current patch?
[Adrian Calianu] Yes. This can be achieved by providing a valid basic core =
boot package(into wic.conf) and user rootfs(wic create -r "path_to_user_roo=
tfs" -n "path_to_native_rootfs" ).

>=20
> > Some prerequisites are required for this new build setup:
> > ../poky/scripts/lib/image/config/wic.conf
> > [create]
> > arch=3Dtarget_arch (example: powerpc, arm, x86)
> > pkgmgr=3Dopkg
> > repourl=3Dhttp://example.distro/p2020rdb/ipk/all
> http://example.distro/p2020rdb/ipk/p2020rdb
> http://example.distro/p2020rdb/ipk/ppce500v2
> >
> >     1) Build an rootfs image from an existing bitbake build:
> >        wic create ../poky/scripts/lib/image/canned-wks/uboot.wks -e cor=
e-
> image-minimal -o .../output
> >
> >     2) Build an rootfs image from an existing rootfs and native_sysroot=
:
> >        wic create ../poky/scripts/lib/image/canned-wks/uboot.wks -r
> .../path_to_rootfs -n .../path_to_native_sysroot -o .../output
> >
> >     3) Build an rootfs image only from a package list (on wks file):
> >
> >        Add the package list to be installed as rootfs on
> ../poky/scripts/lib/image/canned-wks/uboot.wks:
> >        %packages
> >        packagegroup-core-boot
> >        pramfs-init
> >        run-postinsts
> >        packagegroup-core-ssh-dropbear
> >        %end
> >
> >        Generate rootfs image:
> >        wic create ../poky/scripts/lib/image/canned-wks/uboot.wks  -n
> .../path_to_native_sysroot -o .../output
> >
> > Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
> > ---
> >  scripts/lib/image/canned-wks/uboot.wks             |   17 +
> >  scripts/lib/image/config/wic.conf                  |    4 +
> >  scripts/lib/mic/imager/direct.py                   |    4 +
> >  .../lib/mic/kickstart/custom_commands/partition.py |  128 ++++
> >  scripts/lib/mic/pluginbase.py                      |    9 +
> >  scripts/lib/mic/plugins/source/uboot.py            |  173 +++++
> >  scripts/lib/mic/utils/oe/package_manager.py        |  810
> ++++++++++++++++++++
> >  scripts/wic                                        |   88 ++-
> >  10 files changed, 1219 insertions(+), 32 deletions(-)
> >  create mode 100644 scripts/lib/image/canned-wks/uboot.wks
> >  create mode 100644 scripts/lib/mic/plugins/source/uboot.py
> >  create mode 100644 scripts/lib/mic/utils/oe/package_manager.py
> >
> > diff --git a/scripts/lib/image/canned-wks/uboot.wks
> b/scripts/lib/image/canned-wks/uboot.wks
> > new file mode 100644
> > index 0000000..7de0572
> > --- /dev/null
> > +++ b/scripts/lib/image/canned-wks/uboot.wks
> > @@ -0,0 +1,17 @@
> > +# short-description: .       Create a ramdisk image for U-Boot
> > +# long-description: Creates a ramdisk image for U-Boot that user
> > +# can directly load it into ram through tftp
> > +#
> > +# part - is a wic command that drive the process of generating a valid=
 file
> system
> > +#      - --source=3Duboot : wic plugin that generates a ramdisk image =
for U-
> Boot
> > +#      - --fstype=3Dext2  : file system type( ext2 / ext3 / ext 4)
> > +#
> > +# %packages %end - option to provide a list of packages that will be
> installed
> > +#                  into rootfs. All packages dependencies will be inst=
alled by
> > +#                  package manager(default opkg).
> > +
> > +
> > +part / --source=3Duboot --fstype=3Dext2 --label imageName  --align 102=
4
> > +
> > +%packages
> > +%end
> > diff --git a/scripts/lib/image/config/wic.conf
> b/scripts/lib/image/config/wic.conf
> > index e96d6ae..2a2750b 100644
> > --- a/scripts/lib/image/config/wic.conf
> > +++ b/scripts/lib/image/config/wic.conf
> > @@ -4,4 +4,8 @@ distro_name =3D OpenEmbedded
> >
> >  [create]
> >  ; settings for create subcommand
> > +; repourl=3Dhttp://linux.com/ipk/all http://linux.com/ipk/target
> http://linux.com/ipk/arch
> > +arch=3Dpowerpc
> > +pkgmgr=3Dopkg
> >  runtime=3Dnative
> > +install_pkgs=3Dsource
>=20
> I don't think you want these settings as defaults in wic.conf.  Maybe in
> the documentation?
[Adrian Calianu] What documentation? Please can you shade some light here?
Sometimes from user perspective would be nice to have a fully functional fe=
atures without needed to read a manual to understand it but here is difficu=
lt since settings are distribution dependent.

>=20
> > diff --git a/scripts/lib/mic/imager/direct.py
> b/scripts/lib/mic/imager/direct.py
> > index 2cf4c8d..fef9d0e 100644
> > --- a/scripts/lib/mic/imager/direct.py
> > +++ b/scripts/lib/mic/imager/direct.py
> > @@ -262,6 +262,10 @@ class DirectImageCreator(BaseImageCreator):
> >              # when/if we need to actually do package selection we
> >              # should modify things to use those objects, but for now
> >              # we can avoid that.
> > +
> > +            p.install_pkgs(self, self.workdir, self.oe_builddir, self.=
rootfs_dir,
> > +                           self.bootimg_dir, self.kernel_dir, self.nat=
ive_sysroot)
> > +
> >              p.prepare(self, self.workdir, self.oe_builddir, self.rootf=
s_dir,
> >                        self.bootimg_dir, self.kernel_dir, self.native_s=
ysroot)
> >
> > diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py
> b/scripts/lib/mic/kickstart/custom_commands/partition.py
> > index 6b575c0..450d2d4 100644
> > --- a/scripts/lib/mic/kickstart/custom_commands/partition.py
> > +++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
> > @@ -31,7 +31,11 @@ from mic.utils.oe.misc import *
> >  from mic.kickstart.custom_commands import *
> >  from mic.plugin import pluginmgr
> >
> > +import os
> > +from mic.utils.oe.package_manager import *
> > +
> >  partition_methods =3D {
> > +    "do_install_pkgs":None,
> >      "do_stage_partition":None,
> >      "do_prepare_partition":None,
> >      "do_configure_partition":None,
> > @@ -115,6 +119,102 @@ class Wic_PartData(Mic_PartData):
> >          else:
> >              return 0
> >
> > +    def install_pkgs(self, creator, cr_workdir, oe_builddir, rootfs_di=
r,
> > +                     bootimg_dir, kernel_dir, native_sysroot):
> > +        """
> > +        Prepare content for individual partitions, installing packages=
.
> > +        """
> > +
> > +        if not self.source:
> > +            return
> > +
> > +        self._source_methods =3D
> pluginmgr.get_source_plugin_methods(self.source, partition_methods)
> > +        self._source_methods["do_install_pkgs"](self, creator,
> > +                                                      cr_workdir,
> > +                                                      oe_builddir,
> > +                                                      rootfs_dir,
> > +                                                      bootimg_dir,
> > +                                                      kernel_dir,
> > +                                                      native_sysroot)
> > +
> > +    def install_pkgs_ipk(self, cr_workdir, oe_builddir, rootfs_dir,
> > +                             native_sysroot, packages, repourl):
> > +        """
> > +        Install packages specified into wks file using opkg package ma=
nager.
> > +        This method is dependend on bb module.
> > +        """
> > +
> > +        gVar =3D {}
> > +        gVar["DEPLOY_DIR_IPK"] =3D os.path.join(oe_builddir,
> "tmp/deploy/ipk")
> > +
> > +        # Run postinstall scripts even in offline mode
> > +        # Use the arch priority package rather than higher version one=
 if more
> than one candidate is found.
> > +        #d.setVar("OPKG_ARGS", "--force_postinstall --prefer-arch-to-
> version")
> > +        gVar["OPKG_ARGS"] =3D "--force_postinstall"
> > +
> > +        # OPKG path relative to /output_path
> > +        gVar["OPKGLIBDIR"] =3D "var/lib"
> > +
> > +        source_url =3D repourl.split()
> > +
> > +        # Generate feed uri's names, it doesn't seem to matter what na=
me
> they have
> > +        feed_uris =3D ""
> > +        cnt =3D 0
> > +        archs =3D ""
> > +        for url in source_url:
> > +            feed_uris +=3D "cl_def_feed%d##%s\n" % (cnt, url)
> > +            cnt +=3D 1
> > +            head, tail =3D os.path.split(url)
> > +            archs +=3D " " + tail
> > +
> > +        # IPK_FEED_URIS with special formating defines the URI's used =
as
> source for packages
> > +        gVar['IPK_FEED_URIS'] =3D feed_uris
> > +
> > +        gVar['BUILD_IMAGES_FROM_FEEDS'] =3D "1"
> > +
> > +        # We need to provide sysroot for utilities
> > +        gVar['STAGING_DIR_NATIVE'] =3D native_sysroot
> > +
> > +        # Set WORKDIR for output
> > +        gVar['WORKDIR'] =3D cr_workdir
> > +
> > +        # Set TMPDIR for output
> > +        gVar['TMPDIR'] =3D os.path.join(cr_workdir, "tmp")
> > +
> > +        if 'ROOTFS_DIR' in rootfs_dir:
> > +            target_dir =3D rootfs_dir['ROOTFS_DIR']
> > +        elif os.path.isdir(rootfs_dir):
> > +            target_dir =3D rootfs_dir
> > +        else:
> > +            msg =3D "Couldn't find --rootfs-dir=3D%s connection"
> > +            msg +=3D " or it is not a valid path, exiting"
> > +            msger.error(msg % rootfs_dir)
> > +
> > +        # Need native sysroot /usr/bin/ for opkg-cl
> > +        # chnage PATH var to avoid issues with host tools
> > +        defpath =3D os.environ['PATH']
> > +        os.environ['PATH'] =3D native_sysroot + "/usr/bin/" + ":/bin:/=
usr/bin:"
> > +
> > +        pseudo =3D "export PSEUDO_PREFIX=3D%s/usr;" % native_sysroot
> > +        pseudo +=3D "export PSEUDO_LOCALSTATEDIR=3D%s/../pseudo;" %
> target_dir
> > +        pseudo +=3D "export PSEUDO_PASSWD=3D%s;" % target_dir
> > +        pseudo +=3D "export PSEUDO_NOSYMLINKEXP=3D1;"
> > +        pseudo +=3D "%s/usr/bin/pseudo " % native_sysroot
> > +
> > +        pm =3D WicOpkgPM(gVar,
> > +                    target_dir,
> > +                    'opkg.conf',
> > +                    archs,
> > +                    pseudo,
> > +                    native_sysroot)
> > +
> > +        pm.update()
> > +
> > +        pm.install(packages)
> > +
> > +        os.environ['PATH'] +=3D defpath + ":" + native_sysroot + "/usr=
/bin/"
> > +
> > +
> >      def prepare(self, cr, cr_workdir, oe_builddir, rootfs_dir, bootimg=
_dir,
> >                  kernel_dir, native_sysroot):
> >          """
> > @@ -225,6 +325,34 @@ class Wic_PartData(Mic_PartData):
> >
> >          return 0
> >
> > +    def prepare_for_uboot(self, arch, cr_workdir, oe_builddir, rootfs_=
dir,
> > +                             native_sysroot):
> > +        """
> > +        Generates u-boot image from source_file( ext2/3/4 )
> > +
> > +        """
> > +        pseudo =3D "export PSEUDO_PREFIX=3D%s/usr;" % native_sysroot
> > +        pseudo +=3D "export PSEUDO_LOCALSTATEDIR=3D%s/../pseudo;" %
> rootfs_dir
> > +        pseudo +=3D "export PSEUDO_PASSWD=3D%s;" % rootfs_dir
> > +        pseudo +=3D "export PSEUDO_NOSYMLINKEXP=3D1;"
> > +        pseudo +=3D "%s/usr/bin/pseudo " % native_sysroot
> > +
> > +        # 1) compress image
> > +        rootfs =3D self.source_file
> > +        rootfs_gzip =3D "%s.gz" % rootfs
> > +        gzip_cmd =3D "gzip -f -9 -c %s > %s" % (rootfs, rootfs_gzip)
> > +        rc, out =3D exec_native_cmd(pseudo + gzip_cmd, native_sysroot)
> > +
> > +        # 2) image for U-Boot
> > +        rootfs_uboot =3D "%s.u-boot" % rootfs_gzip
> > +        mkimage_cmd =3D "mkimage -A %s -O linux -T ramdisk -C gzip -n =
%s -d
> %s %s" % \
> > +               (arch, self.label, rootfs_gzip, rootfs_uboot)
> > +        rc, out =3D exec_native_cmd(pseudo + mkimage_cmd, native_sysro=
ot)
> > +
> > +        msger.info("\n\n\tThe new U-Boot ramdisk image can be found
> here:\n\t\t%s\n\n"  % rootfs_uboot)
> > +
> > +        return 0
> > +
> >      def prepare_rootfs_btrfs(self, cr_workdir, oe_builddir, rootfs_dir=
,
> >                               native_sysroot, pseudo):
> >          """
> > diff --git a/scripts/lib/mic/pluginbase.py b/scripts/lib/mic/pluginbase=
.py
> > index 9cf4c62..881d996 100644
> > --- a/scripts/lib/mic/pluginbase.py
> > +++ b/scripts/lib/mic/pluginbase.py
> > @@ -89,6 +89,15 @@ class SourcePlugin(_Plugin):
> >      """
> >
> >      @classmethod
> > +    def do_install_pkgs(self, part, creator, cr_workdir, oe_builddir,
> rootfs_dir,
> > +                        bootimg_dir, kernel_dir, native_sysroot):
> > +        """
> > +        Called before partitions have been prepared and assembled into=
 a
> > +        disk image. Install packages into rootfs
> > +        """
> > +        msger.debug("SourcePlugin: do_install_pkgs: part %s" % part)
> > +
> > +    @classmethod
> >      def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddi=
r,
> >                          bootimg_dir, kernel_dir, native_sysroot):
> >          """
> > diff --git a/scripts/lib/mic/plugins/source/uboot.py
> b/scripts/lib/mic/plugins/source/uboot.py
> > new file mode 100644
> > index 0000000..57cb3cf
> > --- /dev/null
> > +++ b/scripts/lib/mic/plugins/source/uboot.py
> > @@ -0,0 +1,173 @@
> > +# ex:ts=3D4:sw=3D4:sts=3D4:et
> > +# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
> > +#
> > +# Copyright (c) 2014, Enea AB.
> > +# All rights reserved.
> > +#
> > +# This program is free software; you can redistribute it and/or modify
> > +# it under the terms of the GNU General Public License version 2 as
> > +# published by the Free Software Foundation.
> > +#
> > +# This program is distributed in the hope that it will be useful,
> > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +# GNU General Public License for more details.
> > +#
> > +# You should have received a copy of the GNU General Public License
> along
> > +# with this program; if not, write to the Free Software Foundation, In=
c.,
> > +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> > +#
> > +# DESCRIPTION
> > +# This implements the 'uboot' source plugin class for 'wic'
> > +#
> > +# AUTHORS
> > +# Adrian Calianu <adrian.calianu (at] enea.com>
> > +#
> > +
> > +import os
> > +import shutil
> > +import re
> > +import tempfile
> > +
> > +from mic import kickstart, chroot, msger
> > +from mic.utils import misc, fs_related, errors, runner, cmdln
> > +from mic.conf import configmgr
> > +from mic.plugin import pluginmgr
> > +from mic.utils.partitionedfs import PartitionedMount
> > +import mic.imager.direct as direct
> > +from mic.pluginbase import SourcePlugin
> > +from mic.utils.oe.misc import *
> > +from mic.imager.direct import DirectImageCreator
> > +
> > +def create_local_rootfs(part, creator, cr_workdir, krootfs_dir,
> native_sysroot):
> > +    # In order to have a full control over rootfs we will make a local=
 copy
> under workdir
> > +    # and change rootfs_dir to new location.
> > +    # In this way we can install more than one ROOTFS_DIRs and/or use
> > +    # an empty rootfs to install packages, so a rootfs could be genera=
ted
> only from pkgs
> > +    # TBD: create workdir/rootfs ; copy rootfs-> workdir/rootfs; set
> rootfs=3Dworkdir/rootfs
> > +
>=20
> Is this something that would be needed by any image creating a rootfs
> from packages?  If so, it should be part of the packaging functionality,
> not the uboot implementation specifically.
[Adrian Calianu]=20
Yes, indeed it can be moved outside of uboot plugin.

>=20
> > +    cr_workdir =3D os.path.abspath(cr_workdir)
> > +    new_rootfs_dir =3D "%s/rootfs_%s" % (cr_workdir, creator.name)
> > +
> > +    rootfs_exists =3D 1
> > +    if part.rootfs is None:
> > +        if not 'ROOTFS_DIR' in krootfs_dir:
> > +            msg =3D "Couldn't find --rootfs-dir, exiting, "
> > +            msger.info(msg)
> > +            rootfs_exists =3D 0
> > +        rootfs_dir =3D krootfs_dir['ROOTFS_DIR']
> > +        creator.rootfs_dir['ROOTFS_DIR'] =3D new_rootfs_dir
> > +    else:
> > +        if part.rootfs in krootfs_dir:
> > +            rootfs_dir =3D krootfs_dir[part.rootfs]
> > +            creator.rootfs_dir[part.rootfs] =3D new_rootfs_dir
> > +        elif os.path.isdir(part.rootfs):
> > +            rootfs_dir =3D part.rootfs
> > +            part.rootfs =3D new_rootfs_dir
> > +        else:
> > +            msg =3D "Couldn't find --rootfs-dir=3D%s connection"
> > +            msg +=3D " or it is not a valid path, exiting"
> > +            msger.info(msg % part.rootfs)
> > +            rootfs_exists =3D 0
> > +            creator.rootfs_dir['ROOTFS_DIR'] =3D new_rootfs_dir
> > +
> > +    pseudox =3D "export PSEUDO_PREFIX=3D%s/usr;" % native_sysroot
> > +    pseudox +=3D "export PSEUDO_LOCALSTATEDIR=3D%s/../pseudo;" %
> new_rootfs_dir
> > +    pseudox +=3D "export PSEUDO_PASSWD=3D%s;" % new_rootfs_dir
> > +    pseudox +=3D "export PSEUDO_NOSYMLINKEXP=3D1;"
> > +    pseudox +=3D "%s/usr/bin/pseudo " % native_sysroot
> > +
> > +    mkdir_cmd =3D "mkdir %s" % (new_rootfs_dir)
> > +    # rc, out =3D exec_native_cmd(pseudox + mkdir_cmd, native_sysroot)
> > +    rc, out =3D exec_cmd(mkdir_cmd, True)
> > +
> > +    if rootfs_exists =3D=3D 1 and os.path.isdir(rootfs_dir):
> > +        defpath =3D os.environ['PATH']
> > +        os.environ['PATH'] =3D native_sysroot + "/usr/bin/" + ":/bin:/=
usr/bin:"
> > +
> > +        rootfs_dir =3D os.path.abspath(rootfs_dir)
> > +
> > +        pseudoc =3D "export PSEUDO_PREFIX=3D%s/usr;" % native_sysroot
> > +        pseudoc +=3D "export PSEUDO_LOCALSTATEDIR=3D%s/../pseudo;" %
> rootfs_dir
> > +        pseudoc +=3D "export PSEUDO_PASSWD=3D%s;" % rootfs_dir
> > +        pseudoc +=3D "export PSEUDO_NOSYMLINKEXP=3D1;"
> > +        pseudoc +=3D "%s/usr/bin/pseudo " % native_sysroot
> > +
> > +        tarc_cmd =3D "tar cvpf %s/rootfs.tar -C %s ." % (cr_workdir, r=
ootfs_dir)
> > +        rc, out =3D exec_native_cmd(pseudoc + tarc_cmd, native_sysroot=
)
> > +
> > +        tarx_cmd =3D "tar xpvf %s/rootfs.tar -C %s" % (cr_workdir,
> new_rootfs_dir)
> > +        rc, out =3D exec_native_cmd(pseudox + tarx_cmd, native_sysroot=
)
> > +
> > +        rm_cmd =3D "rm %s/rootfs.tar" % cr_workdir
> > +        rc, out =3D exec_cmd(rm_cmd, True)
> > +
> > +        os.environ['PATH'] +=3D defpath + ":" + native_sysroot + "/usr=
/bin/"
> > +
> > +    return new_rootfs_dir
> > +
> > +class UBootPlugin(SourcePlugin):
> > +    name =3D 'uboot'
> > +
> > +    @classmethod
> > +    def do_install_pkgs(self, part, creator, cr_workdir, oe_builddir,
> krootfs_dir,
> > +                        bootimg_dir, kernel_dir, native_sysroot):
> > +        """
> > +        Called before all partitions have been prepared and assembled =
into a
> > +        disk image. Intall packages based on wic configuration.
> > +        """
> > +
>=20
> Same here, this looks like general-purpose package installation code
> that shouldn't be part of a u-boot plugin.  Also, is that comment
> correct?
[Adrian Calianu] This method is part of a more generic pluginbase class and=
 each source plugin has the option to generate rootfs from packages or not.
It could happen to have more partitions and each partition with a specific =
rootfs. That specific rootfs can be generated (installing packages) or user=
 specified (--rootfs) and this is controlled by source plugin.

>=20
> > +        # set new rootfs_dir
> > +        rootfs_dir =3D create_local_rootfs(part, creator, cr_workdir, =
krootfs_dir,
> native_sysroot)
> > +
> > +        # wks file parsing
> > +        packages =3D kickstart.get_packages(creator.ks)
> > +
> > +        # wic.conf file parsing =3D found under 'creator'
> > +        local_pkgs_path =3D creator._local_pkgs_path
> > +        repourl =3D creator.repourl
> > +        pkgmgr =3D creator.pkgmgr_name
> > +
> > +        # install packages
> > +        if packages and pkgmgr in ["opkg"]:
> > +            if len(repourl) > 0 :
> > +                part.install_pkgs_ipk(cr_workdir, oe_builddir, rootfs_=
dir,
> native_sysroot,
> > +                                  packages, repourl)
> > +            else:
> > +                msger.error("No packages repository provided in wic.co=
nf")
> > +
> > +    @classmethod
> > +    def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir,
> bootimg_dir,
> > +                             kernel_dir, krootfs_dir, native_sysroot):
> > +        """
> > +        Called to do the actual content population for a partition i.e=
. it
> > +        'prepares' the partition to be incorporated into the image.
> > +        In this case, prepare content for legacy bios boot partition.
> > +        """
> > +        if part.rootfs is None:
> > +            if not 'ROOTFS_DIR' in krootfs_dir:
> > +                msg =3D "Couldn't find --rootfs-dir, exiting"
> > +                msger.error(msg)
> > +            rootfs_dir =3D krootfs_dir['ROOTFS_DIR']
> > +        else:
> > +            if part.rootfs in krootfs_dir:
> > +                rootfs_dir =3D krootfs_dir[part.rootfs]
> > +            elif os.path.isdir(part.rootfs):
> > +                rootfs_dir =3D part.rootfs
> > +            else:
> > +                msg =3D "Couldn't find --rootfs-dir=3D%s connection"
> > +                msg +=3D " or it is not a valid path, exiting"
> > +                msger.error(msg % part.rootfs)
> > +
> > +        part.set_rootfs(rootfs_dir)
> > +
> > +        # change partition label wich will reflect into the final root=
fs image
> name
> > +        part.label =3D "%s_%s" % (part.label, cr.name)
> > +
> > +        defpath =3D os.environ['PATH']
> > +        os.environ['PATH'] =3D native_sysroot + "/usr/bin/" + ":/bin:/=
usr/bin:"
> > +
> > +        part.prepare_rootfs(cr_workdir, oe_builddir, rootfs_dir,
> native_sysroot)
> > +        part.prepare_for_uboot(cr.target_arch,cr_workdir, oe_builddir,
> rootfs_dir, native_sysroot)
> > +
> > +        os.environ['PATH'] +=3D defpath + ":" + native_sysroot + "/usr=
/bin/"
> > diff --git a/scripts/lib/mic/utils/oe/package_manager.py
> b/scripts/lib/mic/utils/oe/package_manager.py
> > new file mode 100644
> > index 0000000..92ce98e
> > --- /dev/null
> > +++ b/scripts/lib/mic/utils/oe/package_manager.py
> > @@ -0,0 +1,810 @@
> > +# ex:ts=3D4:sw=3D4:sts=3D4:et
> > +# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
> > +#
> > +# Copyright (c) 2014, Enea AB.
> > +# All rights reserved.
> > +#
> > +# This program is free software; you can redistribute it and/or modify
> > +# it under the terms of the GNU General Public License version 2 as
> > +# published by the Free Software Foundation.
> > +#
> > +# This program is distributed in the hope that it will be useful,
> > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +# GNU General Public License for more details.
> > +#
> > +# You should have received a copy of the GNU General Public License
> along
> > +# with this program; if not, write to the Free Software Foundation, In=
c.,
> > +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> > +#
> > +# DESCRIPTION
> > +# This implements the opkg package manager wrapper as a combination
> of
> > +# meta/lib/oe/package_manager.py and bitbake/lib/bb/utils.py files and
> > +# adaptation of those files to 'wic'.
> > +#
> > +# AUTHORS
> > +# Adrian Calianu <adrian.calianu (at] enea.com>
> > +#
> > +# This file incorporates work covered by the following copyright and
> > +# permission notice:
> > +#
> > +#     meta/COPYING.GPLv2 (GPLv2)
> > +#     meta/COPYING.MIT (MIT)
> > +#
> > +#     Copyright (C) 2004 Michael Lauer
> > +#
> > +#     Permission to use, copy, modify, and/or distribute this software
> > +#     for any purpose with or without fee is hereby granted, provided
> > +#     that the above copyright notice and this permission notice appea=
r
> > +#     in all copies.
> > +#
> > +#     THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
> > +#     WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL
> IMPLIED
> > +#     WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT
> SHALL THE
> > +#     AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR
> > +#     CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER
> RESULTING FROM LOSS
> > +#     OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
> > +#     NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
> > +#     CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
> > +
> > +
> > +from abc import ABCMeta, abstractmethod
> > +import os
> > +import glob
> > +import subprocess
> > +import shutil
> > +import multiprocessing
> > +import re
> > +import errno
> > +import fcntl
> > +
> > +from mic.utils.oe.misc import *
> > +from mic import msger
> > +
> > +def mkdirhier(directory):
> > +    """Create a directory like 'mkdir -p', but does not complain if
> > +    directory already exists like os.makedirs
> > +    """
> > +
> > +    try:
> > +        os.makedirs(directory)
> > +    except OSError as e:
> > +        if e.errno !=3D errno.EEXIST:
> > +            raise e
> > +
> > +def remove(path, recurse=3DFalse):
> > +    """Equivalent to rm -f or rm -rf"""
> > +    if not path:
> > +        return
> > +    if recurse:
> > +        # shutil.rmtree(name) would be ideal but its too slow
> > +        subprocess.call(['rm', '-rf'] + glob.glob(path))
> > +        return
> > +    for name in glob.glob(path):
> > +        try:
> > +            os.unlink(name)
> > +        except OSError as exc:
> > +            if exc.errno !=3D errno.ENOENT:
> > +                raise
> > +
> > +def lockfile(name, shared=3DFalse, retry=3DTrue):
> > +    """
> > +    Use the file fn as a lock file, return when the lock has been acqu=
ired.
> > +    Returns a variable to pass to unlockfile().
> > +    """
> > +    dirname =3D os.path.dirname(name)
> > +    mkdirhier(dirname)
> > +
> > +    if not os.access(dirname, os.W_OK):
> > +        logger.error("Unable to acquire lock '%s', directory is not wr=
itable",
> > +                     name)
> > +        sys.exit(1)
> > +
> > +    op =3D fcntl.LOCK_EX
> > +    if shared:
> > +        op =3D fcntl.LOCK_SH
> > +    if not retry:
> > +        op =3D op | fcntl.LOCK_NB
> > +
> > +    while True:
> > +        # If we leave the lockfiles lying around there is no problem
> > +        # but we should clean up after ourselves. This gives potential
> > +        # for races though. To work around this, when we acquire the l=
ock
> > +        # we check the file we locked was still the lock file on disk.
> > +        # by comparing inode numbers. If they don't match or the lockf=
ile
> > +        # no longer exists, we start again.
> > +
> > +        # This implementation is unfair since the last person to reque=
st the
> > +        # lock is the most likely to win it.
> > +
> > +        try:
> > +            lf =3D open(name, 'a+')
> > +            fileno =3D lf.fileno()
> > +            fcntl.flock(fileno, op)
> > +            statinfo =3D os.fstat(fileno)
> > +            if os.path.exists(lf.name):
> > +                statinfo2 =3D os.stat(lf.name)
> > +                if statinfo.st_ino =3D=3D statinfo2.st_ino:
> > +                    return lf
> > +            lf.close()
> > +        except Exception:
> > +            try:
> > +                lf.close()
> > +            except Exception:
> > +                pass
> > +            pass
> > +        if not retry:
> > +            return None
> > +
> > +def unlockfile(lf):
> > +    """
> > +    Unlock a file locked using lockfile()
> > +    """
> > +    try:
> > +        # If we had a shared lock, we need to promote to exclusive bef=
ore
> > +        # removing the lockfile. Attempt this, ignore failures.
> > +        fcntl.flock(lf.fileno(), fcntl.LOCK_EX|fcntl.LOCK_NB)
> > +        os.unlink(lf.name)
> > +    except (IOError, OSError):
> > +        pass
> > +    fcntl.flock(lf.fileno(), fcntl.LOCK_UN)
> > +    lf.close()
> > +
> > +def which(path, item, direction =3D 0, history =3D False):
> > +    """
> > +    Locate a file in a PATH
> > +    """
> > +
> > +    hist =3D []
> > +    paths =3D (path or "").split(':')
> > +    if direction !=3D 0:
> > +        paths.reverse()
> > +
> > +    for p in paths:
> > +        next =3D os.path.join(p, item)
> > +        hist.append(next)
> > +        if os.path.exists(next):
> > +            if not os.path.isabs(next):
> > +                next =3D os.path.abspath(next)
> > +            if history:
> > +                return next, hist
> > +            return next
> > +
> > +    if history:
> > +        return "", hist
> > +    return ""
> > +
> > +
> > +
> > +# this can be used by all PM backends to create the index files in par=
allel
> > +def wic_create_index(arg):
> > +    index_cmd =3D arg
> > +
> > +    try:
> > +        msger.info("Executing '%s' ..." % index_cmd)
> > +        subprocess.check_output(index_cmd, stderr=3Dsubprocess.STDOUT,
> shell=3DTrue)
> > +    except subprocess.CalledProcessError as e:
> > +        return("Index creation command '%s' failed with return code
> %d:\n%s" %
> > +               (e.cmd, e.returncode, e.output))
> > +
> > +    return None
> > +
> > +
> > +class WicIndexer(object):
> > +    __metaclass__ =3D ABCMeta
> > +
> > +    def __init__(self, d, deploy_dir):
> > +        self.d =3D d
> > +        self.deploy_dir =3D deploy_dir
> > +
> > +    @abstractmethod
> > +    def write_index(self):
> > +        pass
> > +
> > +class WicOpkgIndexer(WicIndexer):
> > +    def write_index(self):
> > +        arch_vars =3D ["ALL_MULTILIB_PACKAGE_ARCHS",
> > +                     "SDK_PACKAGE_ARCHS",
> > +                     "MULTILIB_ARCHS"]
> > +
> > +        opkg_index_cmd =3D which(os.getenv('PATH'), "opkg-make-index")
> > +
> > +        if not os.path.exists(os.path.join(self.deploy_dir, "Packages"=
)):
> > +            open(os.path.join(self.deploy_dir, "Packages"), "w").close=
()
> > +
> > +        index_cmds =3D []
> > +        for arch_var in arch_vars:
> > +            if self.d.has_key(arch_var):
> > +                archs =3D self.d[arch_var]
> > +            else:
> > +                archs =3D None
> > +
> > +            if archs is None:
> > +                continue
> > +
> > +            for arch in archs.split():
> > +                pkgs_dir =3D os.path.join(self.deploy_dir, arch)
> > +                pkgs_file =3D os.path.join(pkgs_dir, "Packages")
> > +
> > +                if not os.path.isdir(pkgs_dir):
> > +                    continue
> > +
> > +                if not os.path.exists(pkgs_file):
> > +                    open(pkgs_file, "w").close()
> > +
> > +                index_cmds.append('%s -r %s -p %s -m %s' %
> > +                                  (opkg_index_cmd, pkgs_file, pkgs_fil=
e, pkgs_dir))
> > +
> > +        if len(index_cmds) =3D=3D 0:
> > +            msger.info("There are no packages in %s!" % self.deploy_di=
r)
> > +            return
> > +
> > +        nproc =3D multiprocessing.cpu_count()
> > +        pool =3D multiprocessing.Pool(nproc)
> > +        results =3D list(pool.imap(wic_create_index, index_cmds))
> > +        pool.close()
> > +        pool.join()
> > +
> > +        for result in results:
> > +            if result is not None:
> > +                return(result)
> > +
> > +class WicPkgsList(object):
> > +    __metaclass__ =3D ABCMeta
> > +
> > +    def __init__(self, d, rootfs_dir):
> > +        self.d =3D d
> > +        self.rootfs_dir =3D rootfs_dir
> > +
> > +    @abstractmethod
> > +    def list(self, format=3DNone):
> > +        pass
> > +
> > +
> > +class WicOpkgPkgsList(WicPkgsList):
> > +    def __init__(self, d, rootfs_dir, config_file):
> > +        super(WicOpkgPkgsList, self).__init__(d, rootfs_dir)
> > +
> > +        self.opkg_cmd =3D which(os.getenv('PATH'), "opkg-cl")
> > +        self.opkg_args =3D "-f %s -o %s " % (config_file, rootfs_dir)
> > +        if self.d.has_key("OPKG_ARGS"):
> > +            self.opkg_args +=3D self.d["OPKG_ARGS"]
> > +
> > +    def list(self, format=3DNone):
> > +        opkg_query_cmd =3D which(os.getenv('PATH'), "opkg-query-
> helper.py")
> > +
> > +        if format =3D=3D "arch":
> > +            cmd =3D "%s %s status | %s -a" % \
> > +                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
> > +        elif format =3D=3D "file":
> > +            cmd =3D "%s %s status | %s -f" % \
> > +                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
> > +        elif format =3D=3D "ver":
> > +            cmd =3D "%s %s status | %s -v" % \
> > +                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
> > +        elif format =3D=3D "deps":
> > +            cmd =3D "%s %s status | %s" % \
> > +                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
> > +        else:
> > +            cmd =3D "%s %s list_installed | cut -d' ' -f1" % \
> > +                (self.opkg_cmd, self.opkg_args)
> > +
> > +        try:
> > +            output =3D subprocess.check_output(cmd,
> stderr=3Dsubprocess.STDOUT, shell=3DTrue).strip()
> > +        except subprocess.CalledProcessError as e:
> > +            msger.error("Cannot get the installed packages list. Comma=
nd '%s' "
> > +                     "returned %d:\n%s" % (cmd, e.returncode, e.output=
))
> > +
> > +        if output and format =3D=3D "file":
> > +            tmp_output =3D ""
> > +            for line in output.split('\n'):
> > +                pkg, pkg_file, pkg_arch =3D line.split()
> > +                full_path =3D os.path.join(self.rootfs_dir, pkg_arch, =
pkg_file)
> > +                if os.path.exists(full_path):
> > +                    tmp_output +=3D "%s %s %s\n" % (pkg, full_path, pk=
g_arch)
> > +                else:
> > +                    tmp_output +=3D "%s %s %s\n" % (pkg, pkg_file, pkg=
_arch)
> > +
> > +            output =3D tmp_output
> > +
> > +        return output
> > +
> > +
> > +class WicPackageManager(object):
> > +    """
> > +    This is an abstract class. Do not instantiate this directly.
> > +    """
> > +    __metaclass__ =3D ABCMeta
> > +
> > +    def __init__(self, d, pseudo, native_sysroot):
> > +        self.d =3D d
> > +        self.deploy_dir =3D None
> > +        self.deploy_lock =3D None
> > +        if self.d.has_key('PACKAGE_FEED_URIS'):
> > +            self.feed_uris =3D self.d['PACKAGE_FEED_URIS']
> > +        else:
> > +            self.feed_uris =3D ""
> > +        self.pseudo =3D pseudo
> > +        self.native_sysroot =3D native_sysroot
> > +
> > +    """
> > +    Update the package manager package database.
> > +    """
> > +    @abstractmethod
> > +    def update(self):
> > +        pass
> > +
> > +    """
> > +    Install a list of packages. 'pkgs' is a list object. If 'attempt_o=
nly' is
> > +    True, installation failures are ignored.
> > +    """
> > +    @abstractmethod
> > +    def install(self, pkgs, attempt_only=3DFalse):
> > +        pass
> > +
> > +    """
> > +    Remove a list of packages. 'pkgs' is a list object. If 'with_depen=
dencies'
> > +    is False, the any dependencies are left in place.
> > +    """
> > +    @abstractmethod
> > +    def remove(self, pkgs, with_dependencies=3DTrue):
> > +        pass
> > +
> > +    """
> > +    This function creates the index files
> > +    """
> > +    @abstractmethod
> > +    def write_index(self):
> > +        pass
> > +
> > +    @abstractmethod
> > +    def remove_packaging_data(self):
> > +        pass
> > +
> > +    @abstractmethod
> > +    def list_installed(self, format=3DNone):
> > +        pass
> > +
> > +    @abstractmethod
> > +    def insert_feeds_uris(self):
> > +        pass
> > +
> > +    """
> > +    Install complementary packages based upon the list of currently
> installed
> > +    packages e.g. locales, *-dev, *-dbg, etc. This will only attempt t=
o install
> > +    these packages, if they don't exist then no error will occur.  Not=
e: every
> > +    backend needs to call this function explicitly after the normal pa=
ckage
> > +    installation
> > +    """
> > +    def install_complementary(self, globs=3DNone):
> > +        # we need to write the list of installed packages to a file be=
cause the
> > +        # oe-pkgdata-util reads it from a file
> > +        if self.d.has_key('WORKDIR'):
> > +            installed_pkgs_file =3D os.path.join(self.d['WORKDIR'],
> > +                                           "installed_pkgs.txt")
> > +        else:
> > +            msger.error("No WORKDIR provided!")
> > +
> > +        with open(installed_pkgs_file, "w+") as installed_pkgs:
> > +            installed_pkgs.write(self.list_installed("arch"))
> > +
> > +        if globs is None:
> > +            if self.d.has_key('IMAGE_INSTALL_COMPLEMENTARY'):
> > +                globs =3D self.d['IMAGE_INSTALL_COMPLEMENTARY']
> > +            split_linguas =3D set()
> > +
> > +            if self.d.has_key('IMAGE_LINGUAS'):
> > +                for translation in self.d['IMAGE_LINGUAS'].split():
> > +                    split_linguas.add(translation)
> > +                    split_linguas.add(translation.split('-')[0])
> > +
> > +            split_linguas =3D sorted(split_linguas)
> > +
> > +            for lang in split_linguas:
> > +                globs +=3D " *-locale-%s" % lang
> > +
> > +        if globs is None:
> > +            return
> > +
> > +        if not self.d.has_key('PKGDATA_DIR'):
> > +            msger.error("No PKGDATA_DIR provided!")
> > +
> > +        cmd =3D [which(os.getenv('PATH'), "oe-pkgdata-util"),
> > +               "glob", self.d['PKGDATA_DIR'], installed_pkgs_file,
> > +               globs]
> > +
> > +        rc, out =3D exec_native_cmd(self.pseudo + cmd, self.native_sys=
root)
> > +        if rc !=3D 0:
> > +            msger.error("Could not compute complementary packages list=
.
> Command "
> > +                     "'%s' returned %d" %
> > +                     (' '.join(cmd), rc))
> > +
> > +        self.install(out.split(), attempt_only=3DTrue)
> > +
> > +
> > +    def deploy_dir_lock(self):
> > +        if self.deploy_dir is None:
> > +            raise RuntimeError("deploy_dir is not set!")
> > +
> > +        lock_file_name =3D os.path.join(self.deploy_dir, "deploy.lock"=
)
> > +
> > +        self.deploy_lock =3D lockfile(lock_file_name)
> > +
> > +    def deploy_dir_unlock(self):
> > +        if self.deploy_lock is None:
> > +            return
> > +
> > +        unlockfile(self.deploy_lock)
> > +
> > +        self.deploy_lock =3D None
> > +
> > +
> > +class WicOpkgPM(WicPackageManager):
> > +    def __init__(self, d, target_rootfs, config_file, archs, pseudo,
> native_sysroot, task_name=3D'target'):
> > +        super(WicOpkgPM, self).__init__(d, pseudo, native_sysroot)
> > +
> > +        self.target_rootfs =3D target_rootfs
> > +        self.config_file =3D config_file
> > +        self.pkg_archs =3D archs
> > +        self.task_name =3D task_name
> > +
> > +        if self.d.has_key("DEPLOY_DIR_IPK"):
> > +            self.deploy_dir =3D self.d["DEPLOY_DIR_IPK"]
> > +
> > +        self.deploy_lock_file =3D os.path.join(self.deploy_dir, "deplo=
y.lock")
> > +        self.opkg_cmd =3D which(os.getenv('PATH'), "opkg-cl")
> > +        self.opkg_args =3D "-f %s -o %s " % (self.config_file, target_=
rootfs)
> > +        if self.d.has_key("OPKG_ARGS"):
> > +            self.opkg_args +=3D self.d["OPKG_ARGS"]
> > +
> > +        if self.d.has_key('OPKGLIBDIR'):
> > +            opkg_lib_dir =3D self.d['OPKGLIBDIR']
> > +        else:
> > +            opkg_lib_dir =3D ""
> > +
> > +        if opkg_lib_dir[0] =3D=3D "/":
> > +            opkg_lib_dir =3D opkg_lib_dir[1:]
> > +
> > +        self.opkg_dir =3D os.path.join(target_rootfs, opkg_lib_dir, "o=
pkg")
> > +
> > +        mkdirhier(self.opkg_dir)
> > +
> > +        if self.d.has_key("TMPDIR"):
> > +            tmp_dir =3D self.d["TMPDIR"]
> > +        else:
> > +            tmp_dir =3D ""
> > +
> > +        self.saved_opkg_dir =3D '%s/saved/%s' % (tmp_dir, self.task_na=
me)
> > +        if not os.path.exists('%s/saved' % tmp_dir):
> > +            mkdirhier('%s/saved' % tmp_dir)
> > +
> > +        if self.d.has_key('BUILD_IMAGES_FROM_FEEDS') and
> self.d['BUILD_IMAGES_FROM_FEEDS'] !=3D "1":
> > +            self._create_config()
> > +        else:
> > +            self._create_custom_config()
> > +
> > +        self.indexer =3D WicOpkgIndexer(self.d, self.deploy_dir)
> > +
> > +    """
> > +    This function will change a package's status in /var/lib/opkg/stat=
us file.
> > +    If 'packages' is None then the new_status will be applied to all
> > +    packages
> > +    """
> > +    def mark_packages(self, status_tag, packages=3DNone):
> > +        status_file =3D os.path.join(self.opkg_dir, "status")
> > +
> > +        with open(status_file, "r") as sf:
> > +            with open(status_file + ".tmp", "w+") as tmp_sf:
> > +                if packages is None:
> > +                    tmp_sf.write(re.sub(r"Package: (.*?)\n((?:[^\n]+\n=
)*?)Status:
> (.*)(?:unpacked|installed)",
> > +                                        r"Package: \1\n\2Status: \3%s"=
 % status_tag,
> > +                                        sf.read()))
> > +                else:
> > +                    if type(packages).__name__ !=3D "list":
> > +                        raise TypeError("'packages' should be a list o=
bject")
> > +
> > +                    status =3D sf.read()
> > +                    for pkg in packages:
> > +                        status =3D re.sub(r"Package: %s\n((?:[^\n]+\n)=
*?)Status:
> (.*)(?:unpacked|installed)" % pkg,
> > +                                        r"Package: %s\n\1Status: \2%s"=
 % (pkg, status_tag),
> > +                                        status)
> > +
> > +                    tmp_sf.write(status)
> > +
> > +        os.rename(status_file + ".tmp", status_file)
> > +
> > +    def _create_custom_config(self):
> > +        msger.info("Building from feeds activated!")
> > +
> > +        with open(self.config_file, "w+") as config_file:
> > +            priority =3D 1
> > +            for arch in self.pkg_archs.split():
> > +                config_file.write("arch %s %d\n" % (arch, priority))
> > +                priority +=3D 5
> > +
> > +            if self.d.has_key('IPK_FEED_URIS'):
> > +                ipk_feed_uris =3D self.d['IPK_FEED_URIS']
> > +            else:
> > +                ipk_feed_uris =3D ""
> > +
> > +            for line in ipk_feed_uris.split():
> > +                feed_match =3D re.match("^[ \t]*(.*)##([^ \t]*)[ \t]*$=
", line)
> > +
> > +                if feed_match is not None:
> > +                    feed_name =3D feed_match.group(1)
> > +                    feed_uri =3D feed_match.group(2)
> > +
> > +                    msger.info("Add %s feed with URL %s" % (feed_name,
> feed_uri))
> > +
> > +                    config_file.write("src/gz %s %s\n" % (feed_name, f=
eed_uri))
> > +
> > +            """
> > +            Allow to use package deploy directory contents as quick de=
vel-
> testing
> > +            feed. This creates individual feed configs for each arch s=
ubdir of
> those
> > +            specified as compatible for the current machine.
> > +            NOTE: Development-helper feature, NOT a full-fledged feed.
> > +            """
> > +            if self.d.has_key('FEED_DEPLOYDIR_BASE_URI'):
> > +                feed_deploydir_base_dir =3D self.d['FEED_DEPLOYDIR_BAS=
E_URI']
> > +            else:
> > +                feed_deploydir_base_dir =3D ""
> > +
> > +            if feed_deploydir_base_dir !=3D "":
> > +                for arch in self.pkg_archs.split():
> > +                    if self.d.has_key("sysconfdir"):
> > +                        sysconfdir =3D self.d["sysconfdir"]
> > +                    else:
> > +                        sysconfdir =3D None
> > +
> > +                    cfg_file_name =3D os.path.join(self.target_rootfs,
> > +                                                 sysconfdir,
> > +                                                 "opkg",
> > +                                                 "local-%s-feed.conf" =
% arch)
> > +
> > +                    with open(cfg_file_name, "w+") as cfg_file:
> > +                        cfg_file.write("src/gz local-%s %s/%s" %
> > +                                       arch,
> > +                                       feed_deploydir_base_dir,
> > +                                       arch)
> > +
> > +    def _create_config(self):
> > +        with open(self.config_file, "w+") as config_file:
> > +            priority =3D 1
> > +            for arch in self.pkg_archs.split():
> > +                config_file.write("arch %s %d\n" % (arch, priority))
> > +                priority +=3D 5
> > +
> > +            config_file.write("src oe file:%s\n" % self.deploy_dir)
> > +
> > +            for arch in self.pkg_archs.split():
> > +                pkgs_dir =3D os.path.join(self.deploy_dir, arch)
> > +                if os.path.isdir(pkgs_dir):
> > +                    config_file.write("src oe-%s file:%s\n" %
> > +                                      (arch, pkgs_dir))
> > +
> > +    def insert_feeds_uris(self):
> > +        if self.feed_uris =3D=3D "":
> > +            return
> > +
> > +        rootfs_config =3D os.path.join('%s/etc/opkg/base-feeds.conf'
> > +                                  % self.target_rootfs)
> > +
> > +        with open(rootfs_config, "w+") as config_file:
> > +            uri_iterator =3D 0
> > +            for uri in self.feed_uris.split():
> > +                config_file.write("src/gz url-%d %s/ipk\n" %
> > +                                  (uri_iterator, uri))
> > +
> > +                for arch in self.pkg_archs.split():
> > +                    if not os.path.exists(os.path.join(self.deploy_dir=
, arch)):
> > +                        continue
> > +                    msger.info('Note: adding opkg channel url-%s-%d (%=
s)' %
> > +                        (arch, uri_iterator, uri))
> > +
> > +                    config_file.write("src/gz uri-%s-%d %s/ipk/%s\n" %
> > +                                      (arch, uri_iterator, uri, arch))
> > +                uri_iterator +=3D 1
> > +
> > +    def update(self):
> > +        self.deploy_dir_lock()
> > +
> > +        cmd =3D "%s %s update" % (self.opkg_cmd, self.opkg_args)
> > +
> > +        rc, out =3D exec_native_cmd(self.pseudo + cmd, self.native_sys=
root)
> > +        if rc !=3D 0:
> > +            self.deploy_dir_unlock()
> > +            msger.error("Unable to update the package index files. Com=
mand
> '%s' "
> > +                     "returned %d" % (cmd, rc))
> > +
> > +        self.deploy_dir_unlock()
> > +
> > +    def install(self, pkgs, attempt_only=3DFalse):
> > +        if attempt_only and len(pkgs) =3D=3D 0:
> > +            return
> > +
> > +        cmd =3D "%s %s install %s" % (self.opkg_cmd, self.opkg_args, '
> '.join(pkgs))
> > +
> > +        os.environ['D'] =3D self.target_rootfs
> > +        os.environ['OFFLINE_ROOT'] =3D self.target_rootfs
> > +        os.environ['IPKG_OFFLINE_ROOT'] =3D self.target_rootfs
> > +        os.environ['OPKG_OFFLINE_ROOT'] =3D self.target_rootfs
> > +        if self.d.has_key('WORKDIR'):
> > +            os.environ['INTERCEPT_DIR'] =3D os.path.join(self.d['WORKD=
IR'],
> > +                                                   "intercept_scripts"=
)
> > +        else:
> > +            os.environ['INTERCEPT_DIR'] =3D "."
> > +            msger.warning("No WORKDIR provided!")
> > +
> > +        if self.d.has_key('STAGING_DIR_NATIVE'):
> > +            os.environ['NATIVE_ROOT'] =3D self.d['STAGING_DIR_NATIVE']
> > +        else:
> > +            msger.error("No STAGING_DIR_NATIVE provided!")
> > +
> > +        rc, out =3D exec_native_cmd(self.pseudo + cmd, self.native_sys=
root)
> > +        if rc !=3D 0:
> > +            msger.error("Unable to install packages. "
> > +                        "Command '%s' returned %d" % (cmd, rc))
> > +
> > +
> > +    def remove(self, pkgs, with_dependencies=3DTrue):
> > +        if with_dependencies:
> > +            cmd =3D "%s %s --force-depends --force-remove --force-remo=
val-of-
> dependent-packages remove %s" % \
> > +                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
> > +        else:
> > +            cmd =3D "%s %s --force-depends remove %s" % \
> > +                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
> > +
> > +        rc, out =3D exec_native_cmd(self.pseudo + cmd, self.native_sys=
root)
> > +        if rc !=3D 0:
> > +            msger.error("Unable to remove packages. Command '%s' "
> > +                     "returned %d" % (cmd, rc))
> > +
> > +
> > +    def write_index(self):
> > +        self.deploy_dir_lock()
> > +
> > +        result =3D self.indexer.write_index()
> > +
> > +        self.deploy_dir_unlock()
> > +
> > +        if result is not None:
> > +            msger.error(result)
> > +
> > +    def remove_packaging_data(self):
> > +        remove(self.opkg_dir, True)
> > +        # create the directory back, it's needed by PM lock
> > +        mkdirhier(self.opkg_dir)
> > +
> > +    def list_installed(self, format=3DNone):
> > +        return WicOpkgPkgsList(self.d, self.target_rootfs,
> self.config_file).list(format)
> > +
> > +    def handle_bad_recommendations(self):
> > +        if self.d.has_key("BAD_RECOMMENDATIONS"):
> > +            bad_recommendations =3D self.d["BAD_RECOMMENDATIONS"]
> > +        else:
> > +            bad_recommendations =3D ""
> > +
> > +        if bad_recommendations.strip() =3D=3D "":
> > +            return
> > +
> > +        status_file =3D os.path.join(self.opkg_dir, "status")
> > +
> > +        # If status file existed, it means the bad recommendations has=
 already
> > +        # been handled
> > +        if os.path.exists(status_file):
> > +            return
> > +
> > +        cmd =3D "%s %s info " % (self.opkg_cmd, self.opkg_args)
> > +
> > +        with open(status_file, "w+") as status:
> > +            for pkg in bad_recommendations.split():
> > +                pkg_info =3D cmd + pkg
> > +
> > +                try:
> > +                    output =3D subprocess.check_output(pkg_info.split(=
),
> stderr=3Dsubprocess.STDOUT).strip()
> > +                except subprocess.CalledProcessError as e:
> > +                    msger.error("Cannot get package info. Command '%s'=
 "
> > +                             "returned %d:\n%s" % (pkg_info, e.returnc=
ode, e.output))
> > +
> > +                if output =3D=3D "":
> > +                    msger.info("Ignored bad recommendation: '%s' is "
> > +                            "not a package" % pkg)
> > +                    continue
> > +
> > +                for line in output.split('\n'):
> > +                    if line.startswith("Status:"):
> > +                        status.write("Status: deinstall hold not-insta=
lled\n")
> > +                    else:
> > +                        status.write(line + "\n")
> > +
> > +    '''
> > +    The following function dummy installs pkgs and returns the log of
> output.
> > +    '''
> > +    def dummy_install(self, pkgs):
> > +        if len(pkgs) =3D=3D 0:
> > +            return
> > +
> > +        # Create an temp dir as opkg root for dummy installation
> > +        if self.d.has_key("TMPDIR"):
> > +            tmp_dir =3D self.d["TMPDIR"]
> > +        else:
> > +            tmp_dir =3D "."
> > +            msger.warning("No TMPDIR provided!")
> > +
> > +        temp_rootfs =3D '%s/opkg' % tmp_dir
> > +        temp_opkg_dir =3D os.path.join(temp_rootfs, 'var/lib/opkg')
> > +        mkdirhier(temp_opkg_dir)
> > +
> > +        opkg_args =3D "-f %s -o %s " % (self.config_file, temp_rootfs)
> > +        if self.d.has_key("OPKG_ARGS"):
> > +            opkg_args +=3D self.d["OPKG_ARGS"]
> > +
> > +        cmd =3D "%s %s update" % (self.opkg_cmd, opkg_args)
> > +        try:
> > +            subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT,
> shell=3DTrue)
> > +        except subprocess.CalledProcessError as e:
> > +            msger.error("Unable to update. Command '%s' "
> > +                     "returned %d:\n%s" % (cmd, e.returncode, e.output=
))
> > +
> > +        # Dummy installation
> > +        cmd =3D "%s %s --noaction install %s " % (self.opkg_cmd,
> > +                                                opkg_args,
> > +                                                ' '.join(pkgs))
> > +        try:
> > +            output =3D subprocess.check_output(cmd,
> stderr=3Dsubprocess.STDOUT, shell=3DTrue)
> > +        except subprocess.CalledProcessError as e:
> > +            msger.error("Unable to dummy install packages. Command '%s=
' "
> > +                     "returned %d:\n%s" % (cmd, e.returncode, e.output=
))
> > +
> > +        remove(temp_rootfs, True)
> > +
> > +        return output
> > +
> > +    def backup_packaging_data(self):
> > +        # Save the opkglib for increment ipk image generation
> > +        if os.path.exists(self.saved_opkg_dir):
> > +            remove(self.saved_opkg_dir, True)
> > +        shutil.copytree(self.opkg_dir,
> > +                        self.saved_opkg_dir,
> > +                        symlinks=3DTrue)
> > +
> > +    def recover_packaging_data(self):
> > +        # Move the opkglib back
> > +        if os.path.exists(self.saved_opkg_dir):
> > +            if os.path.exists(self.opkg_dir):
> > +                remove(self.opkg_dir, True)
> > +
> > +            msger.info('Recover packaging data')
> > +            shutil.copytree(self.saved_opkg_dir,
> > +                            self.opkg_dir,
> > +                            symlinks=3DTrue)
> > +
> > +
> > +def wic_generate_index_files(d):
> > +    if d.has_key('PACKAGE_CLASSES'):
> > +        classes =3D d['PACKAGE_CLASSES'].replace("package_", "").split=
()
> > +    else:
> > +        classes =3D ""
> > +        msger.warning("No PACKAGE_CLASSES provided!")
> > +
> > +    if d.has_key('DEPLOY_DIR_IPK'):
> > +        deploy_dir_ipk =3D d['DEPLOY_DIR_IPK']
> > +    else:
> > +        deploy_dir_ipk =3D None
> > +        msger.warning("No DEPLOY_DIR_IPK provided!")
> > +
> > +    indexer_map =3D {
> > +        "ipk": (WicOpkgIndexer, deploy_dir_ipk)
> > +    }
> > +
> > +    result =3D None
> > +
> > +    for pkg_class in classes:
> > +        if not pkg_class in indexer_map:
> > +            continue
> > +
> > +        if os.path.exists(indexer_map[pkg_class][1]):
> > +            result =3D indexer_map[pkg_class][0](d,
> indexer_map[pkg_class][1]).write_index()
> > +
> > +            if result is not None:
> > +                msger.error(result)
> > diff --git a/scripts/wic b/scripts/wic
> > index 2d3fd09..b9c8756 100755
> > --- a/scripts/wic
> > +++ b/scripts/wic
> > @@ -99,6 +99,10 @@ def wic_create_subcommand(args, usage_str):
> >
> >      (options, args) =3D parser.parse_args(args)
> >
> > +    if options.debug:
> > +        loglevel =3D logging.DEBUG
> > +        start_logging(loglevel)
> > +
> >      if len(args) !=3D 1:
> >          logging.error("Wrong number of arguments, exiting\n")
> >          parser.print_help()
> > @@ -107,9 +111,11 @@ def wic_create_subcommand(args, usage_str):
> >      if not options.image_name and not (options.rootfs_dir and
> >                                         options.bootimg_dir and
> >                                         options.kernel_dir and
> > +                                       options.native_sysroot or
> >                                         options.native_sysroot):
> >          print "Build artifacts not completely specified, exiting."
> > -        print "  (Use 'wic -e' or 'wic -r -b -k -n' to specify artifac=
ts)"
> > +        print "  (Use 'wic -e' or 'wic -r -b -k -n' or 'wic -r -n' to =
specify artifacts)"
> > +        print options
> >          sys.exit(1)
> >
> >      if not options.image_name:
> > @@ -125,13 +131,16 @@ def wic_create_subcommand(args, usage_str):
> >
> >      print "Creating image(s)...\n"
> >
> > -    bitbake_env_lines =3D find_bitbake_env_lines(options.image_name)
> > -    if not bitbake_env_lines:
> > -        print "Couldn't get bitbake environment, exiting."
> > -        sys.exit(1)
> > -    set_bitbake_env_lines(bitbake_env_lines)
> > +    # If '-e' option is used the values are extracted from bitbake env=
.
> > +    if options.image_name:
> > +        bitbake_env_lines =3D find_bitbake_env_lines(options.image_nam=
e)
> > +        if not bitbake_env_lines:
> > +            print "Couldn't get bitbake environment, exiting."
> > +            sys.exit(1)
> > +        set_bitbake_env_lines(bitbake_env_lines)
> >
> >      bootimg_dir =3D staging_data_dir =3D hdddir =3D ""
> > +    rootfs_dir =3D native_sysroot =3D kernel_dir =3D image_output_dir =
=3D ""
> >
> >      if options.image_name:
> >          (rootfs_dir, kernel_dir, hdddir, staging_data_dir, native_sysr=
oot) =3D \
> > @@ -140,34 +149,65 @@ def wic_create_subcommand(args, usage_str):
> >      wks_file =3D args[0]
> >
> >      if not wks_file.endswith(".wks"):
> > +        # Return full path of the .wks file
> >          wks_file =3D find_canned_image(scripts_path, wks_file)
> >          if not wks_file:
> > -            print "No image named %s found, exiting.  (Use 'wic list i=
mages' to
> list available images, or specify a fully-qualified OE kickstart (.wks)
> filename)\n" % wks_file
> > +            print "No image named %s found, exiting.\n" % wks_file
> > +            print "(Use 'wic list images' to list available images, or=
 specify a fully-
> qualified OE kickstart (.wks) filename)\n"
> >              sys.exit(1)
> >
> > -    image_output_dir =3D ""
> >      if options.outdir:
> >          image_output_dir =3D options.outdir
> >
> > -    if not options.image_name:
> > -        rootfs_dir =3D ''
> > -        if 'ROOTFS_DIR' in options.rootfs_dir:
> > -            rootfs_dir =3D options.rootfs_dir['ROOTFS_DIR']
> > -        bootimg_dir =3D options.bootimg_dir
> > -        kernel_dir =3D options.kernel_dir
> > +    if options.native_sysroot:
> >          native_sysroot =3D options.native_sysroot
> > -        if rootfs_dir and not os.path.isdir(rootfs_dir):
> > -            print "--roofs-dir (-r) not found, exiting\n"
> > -            sys.exit(1)
> > -        if not os.path.isdir(bootimg_dir):
> > -            print "--bootimg-dir (-b) not found, exiting\n"
> > -            sys.exit(1)
> > -        if not os.path.isdir(kernel_dir):
> > -            print "--kernel-dir (-k) not found, exiting\n"
> > -            sys.exit(1)
> > +        print "Using native_sysroot from user command: %s" %
> native_sysroot
> > +
> >          if not os.path.isdir(native_sysroot):
> > -            print "--native-sysroot (-n) not found, exiting\n"
> > +            print "--native-sysroot (-n) not found, exiting"
> >              sys.exit(1)
> > +
> > +        native_sysroot =3D os.path.abspath(native_sysroot)
> > +
> > +    if not options.image_name:
> > +        if (options.bootimg_dir and options.kernel_dir and
> > +             options.rootfs_dir and options.native_sysroot):
> > +            rootfs_dir =3D ''
> > +            if 'ROOTFS_DIR' in options.rootfs_dir:
> > +                rootfs_dir =3D options.rootfs_dir['ROOTFS_DIR']
> > +            bootimg_dir =3D options.bootimg_dir
> > +            kernel_dir =3D options.kernel_dir
> > +            native_sysroot =3D options.native_sysroot
> > +
> > +            if rootfs_dir and not os.path.isdir(rootfs_dir):
> > +                print "--roofs-dir (-r) not found, exiting\n"
> > +                sys.exit(1)
> > +            if not os.path.isdir(bootimg_dir):
> > +                print "--bootimg-dir (-b) not found, exiting\n"
> > +                sys.exit(1)
> > +            if not os.path.isdir(kernel_dir):
> > +                print "--kernel-dir (-k) not found, exiting\n"
> > +                sys.exit(1)
> > +            if not os.path.isdir(native_sysroot):
> > +                print "--native-sysroot (-n) not found, exiting\n"
> > +                sys.exit(1)
> > +        else:
> > +            print 'Build image from rootfs and a package list using na=
tive
> rootfs\n'
> > +            if options.rootfs_dir and 'ROOTFS_DIR' in options.rootfs_d=
ir:
> > +                rootfs_dir =3D options.rootfs_dir['ROOTFS_DIR']
> > +            elif options.rootfs_dir:
> > +                rootfs_dir =3D options.rootfs_dir
> > +            else:
> > +                rootfs_dir =3D ""
> > +
> > +            native_sysroot =3D options.native_sysroot
> > +
> > +            if rootfs_dir and not os.path.isdir(rootfs_dir):
> > +                print "--roofs-dir (-r) not found, exiting\n"
> > +                sys.exit(1)
> > +            if not os.path.isdir(native_sysroot):
> > +                print "--native-sysroot (-n) not found, exiting\n"
> > +                sys.exit(1)
> >      else:
> >          not_found =3D not_found_dir =3D ""
> >          if not os.path.isdir(rootfs_dir):
> > --
> > 1.7.10.4
> >
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

