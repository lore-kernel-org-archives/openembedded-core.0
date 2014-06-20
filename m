Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 53F3F7019E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 14:46:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 20 Jun 2014 07:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,514,1400050800"; d="scan'208";a="550932978"
Received: from unknown (HELO [10.255.13.70]) ([10.255.13.70])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2014 07:46:02 -0700
Message-ID: <1403275562.4139.29.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Adrian Calianu <Adrian.Calianu@enea.com>
Date: Fri, 20 Jun 2014 09:46:02 -0500
In-Reply-To: <A1661D2DDD942248A02617DE63569A0125CBF373@SESTOEX04.enea.se>
References: <5399151E.3050306@linux.intel.com>
	<1402562639-60930-1-git-send-email-y>	<1402562639-60930-2-git-send-email-y>
	<1402690716.11584.62.camel@empanada>
	<A1661D2DDD942248A02617DE63569A0125CBF373@SESTOEX04.enea.se>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
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
X-List-Received-Date: Fri, 20 Jun 2014 14:46:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-06-16 at 13:18 +0000, Adrian Calianu wrote:
> Hi Tom,
> 
> 	First of all, thanks for your review comments! I'm glad that community has interest for this features.
> 	I will answer to your comments in-line below...
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of Tom Zanussi
> > Sent: Friday, June 13, 2014 11:19 PM
> > To: y@enea.se
> > Cc: openembedded-core@lists.openembedded.org; Otavio Salvador
> > Subject: Re: [OE-core] [PATCHv2 1/2] Add wic support to generate rootfs
> > image for uboot
> > 
> > Hi,
> > 
> > This looks like some nice new functionality, but I have some suggestions
> > regarding the implementation and the posting itself...
> > 
> > First, this seems to have been sent by a 'y' at enea, but they're
> > apparently written by adrian.calianu at enea - why can't adrian.calianu
> > send them himself? (makes me wonder about the authorship, etc).
> [Adrian Calianu] It was an issue with local git server since the patch was send directly from git but nothing to worry about, problem was fixed.
> 
> > 
> > Also, there seems to be just one big patch, but the subject says
> > '[PATCHv2 1/2] Add wic support to generate rootfs image for uboot' - am
> > I missing 2/2?
> [Adrian Calianu] Actually there were two versions of patch and for
> each patch a cover letter was also generated which lead to those
> numbers.
> 
> > 
> > As for the patch itself, it's huge and needs to be broken up into
> > smaller pieces.  In fact, it seems to be a combination of two completely
> > separate things at least - a new mechanism for creating a rootfs from
> > packages, and a new plugin for creating uboot partitions (which just
> > happens to use the output from the new packaging step.  So at minimum I
> > think you need to break it up along the lines of that functionality, and
> > it would be good to break it up even further e.g. 'Add a new do_pkg
> > interface hook', 'Add an implementation of do_pkg for ipk', 'Add a new
> > source plugin for uboot partitions', 'Add a new canned wks for a default
> > uboot image', etc.  The more you can break it up into logical chunks
> > without going overboard, the easier it is to review and apply/revert.
> [Adrian Calianu] I agree that there are two main features but the
> reason of not break it in small pieces now was to provide a fully
> functional patch for community to test it and be able to provide a
> feedback for this patch, since those features cannot be tested
> independently now.
> So, is it acceptable to provide patches that cannot be tested?
> 

Are you saying that the new packaging functionality is only useful for
uboot users and that uboot support can't be done without the new
packaging functionality?

In any case, the normal way to submit a large patchset is to break it up
into smaller reviewable pieces that hopefully build on each other.  If
the suggestions I mentioned above don't help, you should be able look in
the archives for more concrete examples.

> > 
> > Finally, something like this really needs to be documented in the tool -
> > please add the relevant interface documentation to the help system.
> [Adrian Calianu] Ok, I will investigate and add more info to help system. 
> I saw that the Yocto manual included wic doc only in 1.5.2
> version(http://www.yoctoproject.org/docs/1.5.2/dev-manual/dev-manual.html). Why that info is not found into the latest Yocto manual?
> It is anything planned about that?
> 

I'm not sure why the wic help was removed from post-1.5.2, cc'ing ScottR
for that.

> > 
> > For the 'packaging' part of this patch, the big problem I see is that
> > the package_manager seems to be basically a copy of the oe package
> > manager and more (which you mention in the comments) - I don't think it
> > makes much sense to do that - wouldn't it be better to patch the oe
> > package_manager code so that it could be reused by this tool?
> [Adrian Calianu] This is a subject of discussion I think. Yes, first
> time I just used the modules from bitbake and oe and worked perfectly
> but this means to link wic tool by bitbake and all his specific
> features like BB_variables, dataSmart,... Is this acceptable?
> Shouldn't wic tool be as independent as possible? What is the plan for
> wic tool in future?

Yeah, wic is meant to be a standalone tool and should be completely
independent of bitbake and oe.  But it also doesn't make sense to copy
bitbake and oe wholesale with minor changes into wic.  Ideally you'd
want a common library that both could make use of and layer the
application-specific things on top of - would this be too large a
project in this case?

> 
> I see that the wic tool came with backend plugins (yum package
> manager).  So depending on the plans for wic tool in future we may
> move this new package manager into backend plugin folder or use the
> one from bitbake also for rpm packages and remove existing one. I see
> it as an open subject.
> 

Right, wic is built on top of mic which was built on top of Fedora
livecd, etc, and instead of removing things like the yum package manager
from the code, I left it in as possibly useful for unforeseen
functionality like this.  So if it makes sense to use that or plug into
it or whatever, that's fine, but I'm guessing the oe-core stuff is more
tailored to the needs of image creation for this project.  Whatever
makes the most sense.

> > 
> > For the 'uboot' part, is the 'uboot' plugin implementing common
> > functionality that all uboot images need, or is it for a specific use
> > case (if so, it shouldn't be called 'uboot' but something more
> > specific)?  Otavio seemed to suggest that in general it would need to be
> > modified for specific cases.  I'm not sure about the best way to do that
> > - we don't have many good examples yet.  Can that sort of thing be
> > parameterized/subclassed, or would it require a per-image plugin, which
> > would be good to avoid.  Not something you have to solve now, if the
> > 'uboot' plugin is useful on its own and maybe subclassed/added onto by
> > future plugins.  It would be nice to have some specific and succinct
> > examples to help think through what might be needed here.
> [Adrian Calianu] I was thinking it as a general uboot plugin and in
> future parameterized it like other existing plugins. We have plans to
> extend it for SD/MMC cards.
> 

OK, so that's what I was asking about, some idea on your plans to extend
it.

> > 
> > Some more specific comments in-line below...
> > 
> > On Thu, 2014-06-12 at 10:43 +0200, y@enea.se wrote:
> > > From: Adrian Calianu <adrian.calianu@enea.com>
> > >
> > > Add support in wic to build ramdisk uboot images from list of packages or
> > > from an existing rootfs folder.
> > >
> > > Providing the list of packages starting with XXX-core-boot package(into wks
> > file)
> > > will generate an rootfs image for uboot out of bitbake.
> > 
> > 
> > > There is also possible to combine an existing/application rootfs with a list
> > > of packages that can be installed but the user must take care to provide
> > > a basic core boot rootfs or XXX-core-boot package and reporul(wic.conf).
> > >
> > 
> > Is this implemented in the current patch?
> [Adrian Calianu] Yes. This can be achieved by providing a valid basic
> core boot package(into wic.conf) and user rootfs(wic create -r
> "path_to_user_rootfs" -n "path_to_native_rootfs" ).
> 

Please describe this in documentation (see below) - it's still not clear
to me how this works.

> > 
> > > Some prerequisites are required for this new build setup:
> > > ../poky/scripts/lib/image/config/wic.conf
> > > [create]
> > > arch=target_arch (example: powerpc, arm, x86)
> > > pkgmgr=opkg
> > > repourl=http://example.distro/p2020rdb/ipk/all
> > http://example.distro/p2020rdb/ipk/p2020rdb
> > http://example.distro/p2020rdb/ipk/ppce500v2
> > >
> > >     1) Build an rootfs image from an existing bitbake build:
> > >        wic create ../poky/scripts/lib/image/canned-wks/uboot.wks -e core-
> > image-minimal -o .../output
> > >
> > >     2) Build an rootfs image from an existing rootfs and native_sysroot:
> > >        wic create ../poky/scripts/lib/image/canned-wks/uboot.wks -r
> > .../path_to_rootfs -n .../path_to_native_sysroot -o .../output
> > >
> > >     3) Build an rootfs image only from a package list (on wks file):
> > >
> > >        Add the package list to be installed as rootfs on
> > ../poky/scripts/lib/image/canned-wks/uboot.wks:
> > >        %packages
> > >        packagegroup-core-boot
> > >        pramfs-init
> > >        run-postinsts
> > >        packagegroup-core-ssh-dropbear
> > >        %end
> > >
> > >        Generate rootfs image:
> > >        wic create ../poky/scripts/lib/image/canned-wks/uboot.wks  -n
> > .../path_to_native_sysroot -o .../output
> > >
> > > Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
> > > ---
> > >  scripts/lib/image/canned-wks/uboot.wks             |   17 +
> > >  scripts/lib/image/config/wic.conf                  |    4 +
> > >  scripts/lib/mic/imager/direct.py                   |    4 +
> > >  .../lib/mic/kickstart/custom_commands/partition.py |  128 ++++
> > >  scripts/lib/mic/pluginbase.py                      |    9 +
> > >  scripts/lib/mic/plugins/source/uboot.py            |  173 +++++
> > >  scripts/lib/mic/utils/oe/package_manager.py        |  810
> > ++++++++++++++++++++
> > >  scripts/wic                                        |   88 ++-
> > >  10 files changed, 1219 insertions(+), 32 deletions(-)
> > >  create mode 100644 scripts/lib/image/canned-wks/uboot.wks
> > >  create mode 100644 scripts/lib/mic/plugins/source/uboot.py
> > >  create mode 100644 scripts/lib/mic/utils/oe/package_manager.py
> > >
> > > diff --git a/scripts/lib/image/canned-wks/uboot.wks
> > b/scripts/lib/image/canned-wks/uboot.wks
> > > new file mode 100644
> > > index 0000000..7de0572
> > > --- /dev/null
> > > +++ b/scripts/lib/image/canned-wks/uboot.wks
> > > @@ -0,0 +1,17 @@
> > > +# short-description: .       Create a ramdisk image for U-Boot
> > > +# long-description: Creates a ramdisk image for U-Boot that user
> > > +# can directly load it into ram through tftp
> > > +#
> > > +# part - is a wic command that drive the process of generating a valid file
> > system
> > > +#      - --source=uboot : wic plugin that generates a ramdisk image for U-
> > Boot
> > > +#      - --fstype=ext2  : file system type( ext2 / ext3 / ext 4)
> > > +#
> > > +# %packages %end - option to provide a list of packages that will be
> > installed
> > > +#                  into rootfs. All packages dependencies will be installed by
> > > +#                  package manager(default opkg).
> > > +
> > > +
> > > +part / --source=uboot --fstype=ext2 --label imageName  --align 1024
> > > +
> > > +%packages
> > > +%end
> > > diff --git a/scripts/lib/image/config/wic.conf
> > b/scripts/lib/image/config/wic.conf
> > > index e96d6ae..2a2750b 100644
> > > --- a/scripts/lib/image/config/wic.conf
> > > +++ b/scripts/lib/image/config/wic.conf
> > > @@ -4,4 +4,8 @@ distro_name = OpenEmbedded
> > >
> > >  [create]
> > >  ; settings for create subcommand
> > > +; repourl=http://linux.com/ipk/all http://linux.com/ipk/target
> > http://linux.com/ipk/arch
> > > +arch=powerpc
> > > +pkgmgr=opkg
> > >  runtime=native
> > > +install_pkgs=source
> > 
> > I don't think you want these settings as defaults in wic.conf.  Maybe in
> > the documentation?
> [Adrian Calianu] What documentation? Please can you shade some light here?

The documentation I'm referring to is the wic command-line
documentation:

$ wic help
$ wic help create

It's not very complete right now, and I have plans to expand it quite a
bit - basically users should be able to get everything they need from
that - but for now it would be ok to just add your content wherever it
makes most sense and we can move it around later.  The important thing
is that it's there somewhere.

> Sometimes from user perspective would be nice to have a fully
> functional features without needed to read a manual to understand it
> but here is difficult since settings are distribution dependent.
> 
> > 
> > > diff --git a/scripts/lib/mic/imager/direct.py
> > b/scripts/lib/mic/imager/direct.py
> > > index 2cf4c8d..fef9d0e 100644
> > > --- a/scripts/lib/mic/imager/direct.py
> > > +++ b/scripts/lib/mic/imager/direct.py
> > > @@ -262,6 +262,10 @@ class DirectImageCreator(BaseImageCreator):
> > >              # when/if we need to actually do package selection we
> > >              # should modify things to use those objects, but for now
> > >              # we can avoid that.
> > > +
> > > +            p.install_pkgs(self, self.workdir, self.oe_builddir, self.rootfs_dir,
> > > +                           self.bootimg_dir, self.kernel_dir, self.native_sysroot)
> > > +
> > >              p.prepare(self, self.workdir, self.oe_builddir, self.rootfs_dir,
> > >                        self.bootimg_dir, self.kernel_dir, self.native_sysroot)
> > >
> > > diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py
> > b/scripts/lib/mic/kickstart/custom_commands/partition.py
> > > index 6b575c0..450d2d4 100644
> > > --- a/scripts/lib/mic/kickstart/custom_commands/partition.py
> > > +++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
> > > @@ -31,7 +31,11 @@ from mic.utils.oe.misc import *
> > >  from mic.kickstart.custom_commands import *
> > >  from mic.plugin import pluginmgr
> > >
> > > +import os
> > > +from mic.utils.oe.package_manager import *
> > > +
> > >  partition_methods = {
> > > +    "do_install_pkgs":None,
> > >      "do_stage_partition":None,
> > >      "do_prepare_partition":None,
> > >      "do_configure_partition":None,
> > > @@ -115,6 +119,102 @@ class Wic_PartData(Mic_PartData):
> > >          else:
> > >              return 0
> > >
> > > +    def install_pkgs(self, creator, cr_workdir, oe_builddir, rootfs_dir,
> > > +                     bootimg_dir, kernel_dir, native_sysroot):
> > > +        """
> > > +        Prepare content for individual partitions, installing packages.
> > > +        """
> > > +
> > > +        if not self.source:
> > > +            return
> > > +
> > > +        self._source_methods =
> > pluginmgr.get_source_plugin_methods(self.source, partition_methods)
> > > +        self._source_methods["do_install_pkgs"](self, creator,
> > > +                                                      cr_workdir,
> > > +                                                      oe_builddir,
> > > +                                                      rootfs_dir,
> > > +                                                      bootimg_dir,
> > > +                                                      kernel_dir,
> > > +                                                      native_sysroot)
> > > +
> > > +    def install_pkgs_ipk(self, cr_workdir, oe_builddir, rootfs_dir,
> > > +                             native_sysroot, packages, repourl):
> > > +        """
> > > +        Install packages specified into wks file using opkg package manager.
> > > +        This method is dependend on bb module.
> > > +        """
> > > +
> > > +        gVar = {}
> > > +        gVar["DEPLOY_DIR_IPK"] = os.path.join(oe_builddir,
> > "tmp/deploy/ipk")
> > > +
> > > +        # Run postinstall scripts even in offline mode
> > > +        # Use the arch priority package rather than higher version one if more
> > than one candidate is found.
> > > +        #d.setVar("OPKG_ARGS", "--force_postinstall --prefer-arch-to-
> > version")
> > > +        gVar["OPKG_ARGS"] = "--force_postinstall"
> > > +
> > > +        # OPKG path relative to /output_path
> > > +        gVar["OPKGLIBDIR"] = "var/lib"
> > > +
> > > +        source_url = repourl.split()
> > > +
> > > +        # Generate feed uri's names, it doesn't seem to matter what name
> > they have
> > > +        feed_uris = ""
> > > +        cnt = 0
> > > +        archs = ""
> > > +        for url in source_url:
> > > +            feed_uris += "cl_def_feed%d##%s\n" % (cnt, url)
> > > +            cnt += 1
> > > +            head, tail = os.path.split(url)
> > > +            archs += " " + tail
> > > +
> > > +        # IPK_FEED_URIS with special formating defines the URI's used as
> > source for packages
> > > +        gVar['IPK_FEED_URIS'] = feed_uris
> > > +
> > > +        gVar['BUILD_IMAGES_FROM_FEEDS'] = "1"
> > > +
> > > +        # We need to provide sysroot for utilities
> > > +        gVar['STAGING_DIR_NATIVE'] = native_sysroot
> > > +
> > > +        # Set WORKDIR for output
> > > +        gVar['WORKDIR'] = cr_workdir
> > > +
> > > +        # Set TMPDIR for output
> > > +        gVar['TMPDIR'] = os.path.join(cr_workdir, "tmp")
> > > +
> > > +        if 'ROOTFS_DIR' in rootfs_dir:
> > > +            target_dir = rootfs_dir['ROOTFS_DIR']
> > > +        elif os.path.isdir(rootfs_dir):
> > > +            target_dir = rootfs_dir
> > > +        else:
> > > +            msg = "Couldn't find --rootfs-dir=%s connection"
> > > +            msg += " or it is not a valid path, exiting"
> > > +            msger.error(msg % rootfs_dir)
> > > +
> > > +        # Need native sysroot /usr/bin/ for opkg-cl
> > > +        # chnage PATH var to avoid issues with host tools
> > > +        defpath = os.environ['PATH']
> > > +        os.environ['PATH'] = native_sysroot + "/usr/bin/" + ":/bin:/usr/bin:"
> > > +
> > > +        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> > > +        pseudo += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" %
> > target_dir
> > > +        pseudo += "export PSEUDO_PASSWD=%s;" % target_dir
> > > +        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
> > > +        pseudo += "%s/usr/bin/pseudo " % native_sysroot
> > > +
> > > +        pm = WicOpkgPM(gVar,
> > > +                    target_dir,
> > > +                    'opkg.conf',
> > > +                    archs,
> > > +                    pseudo,
> > > +                    native_sysroot)
> > > +
> > > +        pm.update()
> > > +
> > > +        pm.install(packages)
> > > +
> > > +        os.environ['PATH'] += defpath + ":" + native_sysroot + "/usr/bin/"
> > > +
> > > +
> > >      def prepare(self, cr, cr_workdir, oe_builddir, rootfs_dir, bootimg_dir,
> > >                  kernel_dir, native_sysroot):
> > >          """
> > > @@ -225,6 +325,34 @@ class Wic_PartData(Mic_PartData):
> > >
> > >          return 0
> > >
> > > +    def prepare_for_uboot(self, arch, cr_workdir, oe_builddir, rootfs_dir,
> > > +                             native_sysroot):
> > > +        """
> > > +        Generates u-boot image from source_file( ext2/3/4 )
> > > +
> > > +        """
> > > +        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> > > +        pseudo += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" %
> > rootfs_dir
> > > +        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
> > > +        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
> > > +        pseudo += "%s/usr/bin/pseudo " % native_sysroot
> > > +
> > > +        # 1) compress image
> > > +        rootfs = self.source_file
> > > +        rootfs_gzip = "%s.gz" % rootfs
> > > +        gzip_cmd = "gzip -f -9 -c %s > %s" % (rootfs, rootfs_gzip)
> > > +        rc, out = exec_native_cmd(pseudo + gzip_cmd, native_sysroot)
> > > +
> > > +        # 2) image for U-Boot
> > > +        rootfs_uboot = "%s.u-boot" % rootfs_gzip
> > > +        mkimage_cmd = "mkimage -A %s -O linux -T ramdisk -C gzip -n %s -d
> > %s %s" % \
> > > +               (arch, self.label, rootfs_gzip, rootfs_uboot)
> > > +        rc, out = exec_native_cmd(pseudo + mkimage_cmd, native_sysroot)
> > > +
> > > +        msger.info("\n\n\tThe new U-Boot ramdisk image can be found
> > here:\n\t\t%s\n\n"  % rootfs_uboot)
> > > +
> > > +        return 0
> > > +
> > >      def prepare_rootfs_btrfs(self, cr_workdir, oe_builddir, rootfs_dir,
> > >                               native_sysroot, pseudo):
> > >          """
> > > diff --git a/scripts/lib/mic/pluginbase.py b/scripts/lib/mic/pluginbase.py
> > > index 9cf4c62..881d996 100644
> > > --- a/scripts/lib/mic/pluginbase.py
> > > +++ b/scripts/lib/mic/pluginbase.py
> > > @@ -89,6 +89,15 @@ class SourcePlugin(_Plugin):
> > >      """
> > >
> > >      @classmethod
> > > +    def do_install_pkgs(self, part, creator, cr_workdir, oe_builddir,
> > rootfs_dir,
> > > +                        bootimg_dir, kernel_dir, native_sysroot):
> > > +        """
> > > +        Called before partitions have been prepared and assembled into a
> > > +        disk image. Install packages into rootfs
> > > +        """
> > > +        msger.debug("SourcePlugin: do_install_pkgs: part %s" % part)
> > > +
> > > +    @classmethod
> > >      def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
> > >                          bootimg_dir, kernel_dir, native_sysroot):
> > >          """
> > > diff --git a/scripts/lib/mic/plugins/source/uboot.py
> > b/scripts/lib/mic/plugins/source/uboot.py
> > > new file mode 100644
> > > index 0000000..57cb3cf
> > > --- /dev/null
> > > +++ b/scripts/lib/mic/plugins/source/uboot.py
> > > @@ -0,0 +1,173 @@
> > > +# ex:ts=4:sw=4:sts=4:et
> > > +# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
> > > +#
> > > +# Copyright (c) 2014, Enea AB.
> > > +# All rights reserved.
> > > +#
> > > +# This program is free software; you can redistribute it and/or modify
> > > +# it under the terms of the GNU General Public License version 2 as
> > > +# published by the Free Software Foundation.
> > > +#
> > > +# This program is distributed in the hope that it will be useful,
> > > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > +# GNU General Public License for more details.
> > > +#
> > > +# You should have received a copy of the GNU General Public License
> > along
> > > +# with this program; if not, write to the Free Software Foundation, Inc.,
> > > +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> > > +#
> > > +# DESCRIPTION
> > > +# This implements the 'uboot' source plugin class for 'wic'
> > > +#
> > > +# AUTHORS
> > > +# Adrian Calianu <adrian.calianu (at] enea.com>
> > > +#
> > > +
> > > +import os
> > > +import shutil
> > > +import re
> > > +import tempfile
> > > +
> > > +from mic import kickstart, chroot, msger
> > > +from mic.utils import misc, fs_related, errors, runner, cmdln
> > > +from mic.conf import configmgr
> > > +from mic.plugin import pluginmgr
> > > +from mic.utils.partitionedfs import PartitionedMount
> > > +import mic.imager.direct as direct
> > > +from mic.pluginbase import SourcePlugin
> > > +from mic.utils.oe.misc import *
> > > +from mic.imager.direct import DirectImageCreator
> > > +
> > > +def create_local_rootfs(part, creator, cr_workdir, krootfs_dir,
> > native_sysroot):
> > > +    # In order to have a full control over rootfs we will make a local copy
> > under workdir
> > > +    # and change rootfs_dir to new location.
> > > +    # In this way we can install more than one ROOTFS_DIRs and/or use
> > > +    # an empty rootfs to install packages, so a rootfs could be generated
> > only from pkgs
> > > +    # TBD: create workdir/rootfs ; copy rootfs-> workdir/rootfs; set
> > rootfs=workdir/rootfs
> > > +
> > 
> > Is this something that would be needed by any image creating a rootfs
> > from packages?  If so, it should be part of the packaging functionality,
> > not the uboot implementation specifically.
> [Adrian Calianu] 
> Yes, indeed it can be moved outside of uboot plugin.
> 
> > 
> > > +    cr_workdir = os.path.abspath(cr_workdir)
> > > +    new_rootfs_dir = "%s/rootfs_%s" % (cr_workdir, creator.name)
> > > +
> > > +    rootfs_exists = 1
> > > +    if part.rootfs is None:
> > > +        if not 'ROOTFS_DIR' in krootfs_dir:
> > > +            msg = "Couldn't find --rootfs-dir, exiting, "
> > > +            msger.info(msg)
> > > +            rootfs_exists = 0
> > > +        rootfs_dir = krootfs_dir['ROOTFS_DIR']
> > > +        creator.rootfs_dir['ROOTFS_DIR'] = new_rootfs_dir
> > > +    else:
> > > +        if part.rootfs in krootfs_dir:
> > > +            rootfs_dir = krootfs_dir[part.rootfs]
> > > +            creator.rootfs_dir[part.rootfs] = new_rootfs_dir
> > > +        elif os.path.isdir(part.rootfs):
> > > +            rootfs_dir = part.rootfs
> > > +            part.rootfs = new_rootfs_dir
> > > +        else:
> > > +            msg = "Couldn't find --rootfs-dir=%s connection"
> > > +            msg += " or it is not a valid path, exiting"
> > > +            msger.info(msg % part.rootfs)
> > > +            rootfs_exists = 0
> > > +            creator.rootfs_dir['ROOTFS_DIR'] = new_rootfs_dir
> > > +
> > > +    pseudox = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> > > +    pseudox += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" %
> > new_rootfs_dir
> > > +    pseudox += "export PSEUDO_PASSWD=%s;" % new_rootfs_dir
> > > +    pseudox += "export PSEUDO_NOSYMLINKEXP=1;"
> > > +    pseudox += "%s/usr/bin/pseudo " % native_sysroot
> > > +
> > > +    mkdir_cmd = "mkdir %s" % (new_rootfs_dir)
> > > +    # rc, out = exec_native_cmd(pseudox + mkdir_cmd, native_sysroot)
> > > +    rc, out = exec_cmd(mkdir_cmd, True)
> > > +
> > > +    if rootfs_exists == 1 and os.path.isdir(rootfs_dir):
> > > +        defpath = os.environ['PATH']
> > > +        os.environ['PATH'] = native_sysroot + "/usr/bin/" + ":/bin:/usr/bin:"
> > > +
> > > +        rootfs_dir = os.path.abspath(rootfs_dir)
> > > +
> > > +        pseudoc = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> > > +        pseudoc += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" %
> > rootfs_dir
> > > +        pseudoc += "export PSEUDO_PASSWD=%s;" % rootfs_dir
> > > +        pseudoc += "export PSEUDO_NOSYMLINKEXP=1;"
> > > +        pseudoc += "%s/usr/bin/pseudo " % native_sysroot
> > > +
> > > +        tarc_cmd = "tar cvpf %s/rootfs.tar -C %s ." % (cr_workdir, rootfs_dir)
> > > +        rc, out = exec_native_cmd(pseudoc + tarc_cmd, native_sysroot)
> > > +
> > > +        tarx_cmd = "tar xpvf %s/rootfs.tar -C %s" % (cr_workdir,
> > new_rootfs_dir)
> > > +        rc, out = exec_native_cmd(pseudox + tarx_cmd, native_sysroot)
> > > +
> > > +        rm_cmd = "rm %s/rootfs.tar" % cr_workdir
> > > +        rc, out = exec_cmd(rm_cmd, True)
> > > +
> > > +        os.environ['PATH'] += defpath + ":" + native_sysroot + "/usr/bin/"
> > > +
> > > +    return new_rootfs_dir
> > > +
> > > +class UBootPlugin(SourcePlugin):
> > > +    name = 'uboot'
> > > +
> > > +    @classmethod
> > > +    def do_install_pkgs(self, part, creator, cr_workdir, oe_builddir,
> > krootfs_dir,
> > > +                        bootimg_dir, kernel_dir, native_sysroot):
> > > +        """
> > > +        Called before all partitions have been prepared and assembled into a
> > > +        disk image. Intall packages based on wic configuration.
> > > +        """
> > > +
> > 
> > Same here, this looks like general-purpose package installation code
> > that shouldn't be part of a u-boot plugin.  Also, is that comment
> > correct?
> [Adrian Calianu] This method is part of a more generic pluginbase
> class and each source plugin has the option to generate rootfs from
> packages or not.
> It could happen to have more partitions and each partition with a
> specific rootfs. That specific rootfs can be generated (installing
> packages) or user specified (--rootfs) and this is controlled by
> source plugin.
> 

Right, so this code could be moved into a more generic plugin - it isn't
uboot-specific, right?

Tom

[snip]




