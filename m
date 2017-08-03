Return-Path: <ovidiu.vancea@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id DC41471B50
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Aug 2017 16:18:44 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v73GGKrs021006; Thu, 3 Aug 2017 11:18:44 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2c39be4sdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 03 Aug 2017 11:18:44 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v73GIh6m019615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 3 Aug 2017 11:18:43 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 3 Aug 2017 11:18:43 -0500
Received: from ovidiu-ro-l0.emea.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 3 Aug 2017 11:18:41 -0500
Message-ID: <1501777120.62231.16.camel@ni.com>
From: Ovidiu-Adrian Vancea <ovidiu.vancea@ni.com>
To: "haris.okanovic@ni.com" <haris.okanovic@ni.com>
Date: Thu, 3 Aug 2017 19:18:40 +0300
In-Reply-To: <CAFW5wYYqeW1DDjJ2RXu-OfSuUgAWj=7qjOXLbCNA+Kq1z4gjkA@mail.gmail.com>
References: <20170705173334.25041-1-haris.okanovic@ni.com>
	<1500323515.27323.139.camel@intel.com>
	<0f5ef046-a46c-b24d-8572-775d1fa1b1cf@ni.com>
	<1500479806.27323.202.camel@intel.com>
	<CAFW5wYYqeW1DDjJ2RXu-OfSuUgAWj=7qjOXLbCNA+Kq1z4gjkA@mail.gmail.com>
X-Mailer: Evolution 3.24.4 
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-03_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1706020000 definitions=main-1708030250
Cc: "josh.hernstrom@ni.com" <josh.hernstrom@ni.com>, "Wold,
	Saul" <saul.wold@intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Thu, 03 Aug 2017 16:18:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-07-27 at 11:01 -0700, Rees, Kevron wrote:
> On Wed, Jul 19, 2017 at 8:56 AM, Wold, Saul <saul.wold@intel.com>
> wrote:
> > On Tue, 2017-07-18 at 08:34 -0500, Haris Okanovic wrote:
> > > 
> > > On 07/17/2017 03:31 PM, Wold, Saul wrote:
> > > > 
> > > > On Wed, 2017-07-05 at 12:33 -0500, Haris Okanovic wrote:
> > > > > 
> > > > > Some distros may want to provide alternate kernel "flavors"
> > > > > via
> > > > > feeds
> > > > > or
> > > > > within bootable images. For example, readily available builds
> > > > > which
> > > > > provide certain diagnostic features can enable developers and
> > > > > testers
> > > > > to
> > > > > more quickly resolve issues by avoiding lengthy kernel
> > > > > builds.
> > > > > 
> > > > > This change allows for building multiple flavors of the
> > > > > kernel
> > > > > and
> > > > > module packages by templatizing kernel package names via a
> > > > > new
> > > > > KERNEL_PACKAGE_NAME variable in kernel.bbclass. It defaults
> > > > > to
> > > > > the
> > > > > old
> > > > > name of "kernel", but can be overridden by certain recipes
> > > > > providing
> > > > > alternate kernel flavors.
> > > > > 
> > > > > To maintain compatibility, recipes providing alternate kernel
> > > > > flavors
> > > > > cannot be the "preferred provider" for virtual/kernel. This
> > > > > is
> > > > > because
> > > > > OE puts the preferred provider's build and source at
> > > > > "tmp-glibc/work-shared/$MACHINE/kernel-build-artifacts/" and
> > > > > "tmp-glibc/work-shared/$MACHINE/kernel-source/" instead of
> > > > > "tmp-glibc/work/*/$PN/" like other recipes. Therefore,
> > > > > recipes
> > > > > using
> > > > > the
> > > > > default KERNEL_PACKAGE_NAME="kernel" follows the old
> > > > > semantics --
> > > > > build
> > > > > in the old location and may be preferred provider -- while
> > > > > recipes
> > > > > using
> > > > > all other KERNEL_PACKAGE_NAME's build from the normal WORKDIR
> > > > > and
> > > > > don't
> > > > > provide "virtual/kernel".
> > > > > 
> > > > > Testing:
> > > > >   1. Prepended `KERNEL_PACKAGE_NAME = "tiny-linux"` to
> > > > >      linux-yocto-tiny_4.9.bb so that it may build alongside
> > > > >      the main kernel.
> > > > >   2. `bitbake linux-yocto linux-yocto-tiny` to build both
> > > > > kernel
> > > > > flavors.
> > > > >   3. Verified image and modules IPKs exist for both:
> > > > >      tmp-glibc/deploy/ipk/qemux86/kernel-* for linux-yocto
> > > > >      tmp-glibc/deploy/ipk/qemux86/tiny-linux* for linux-
> > > > > yocto-
> > > > > tiny
> > > > >   4. Verified linux-yocto is the "preferred provider", and
> > > > > was
> > > > > built
> > > > > in
> > > > >      shared directory: tmp-glibc/work-shared/qemux86/kernel-*
> > > > >   5. Appended `CORE_IMAGE_BASE_INSTALL += "tiny-linux"` to
> > > > >      core-image-base.bb to include both kernel flavors.
> > > > >   6. `bitbake core-image-base` to build an image.
> > > > >   7. Verified image contains two bzImage's under /boot/, with
> > > > >      "yocto-standard" selected to boot via symlink.
> > > > > 
> > > > > Discussion thread:
> > > > > https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.ope
> > > > > nembedded.org_pipermail_openembedded-2Dcore_2015-
> > > > > 2DDe&d=DwICAg&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r
> > > > > =35FLeGKBmrBGMHAhCV37-B4ddgcjLZXUChuxj5DD6Sk&m=-J-
> > > > > ERX3BXdjXgeeIE_ZNE7GozSVtUpP3Wt6FV_jtLtM&s=z_ITagkjX7-
> > > > > q9KHaytBdqTZeJYksmYYjciSiELDYIGE&e= 
> > > > > cemb
> > > > > er/thread.html#114122
> > > > > 
> > > > > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > > > > Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
> > > > > Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> > > > > Coauthored-by: Gratian Crisan <gratian.crisan@ni.com>
> > > > > Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
> > > > > Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
> > > > > ---
> > > > > [PATCH v2] Change STAGING_KERNEL_DIR and
> > > > > STAGING_KERNEL_BUILDDIR
> > > > > to
> > > > > the
> > > > > "work" directory in alternate kernel builds, instead of
> > > > > "work-
> > > > > shared",
> > > > > so
> > > > > that the two builds don't clobber each other.
> > > > > 
> > > > > [PATCH v3] An updated version of this change rebased onto the
> > > > > current
> > > > > OE-core master. Changes:
> > > > >   * Remove PREFERRED_PROVIDER check in linux-yocto.inc in
> > > > > alternate
> > > > >     kernel builds, since alternate kernels aren't the
> > > > >     PREFERRED_PROVIDER for virtual/kernel by definition.
> > > > >   * Remove "virtual/kernel" from PROVIDES in alternate kernel
> > > > > builds.
> > > > > 
> > > > > [PATCH v4] Another rebase onto master; no functional change.
> > > > > Improved description and testing steps.
> > > > 
> > > > So I finally had a chance to get back to this and test build
> > > > with
> > > > it, I
> > > > saw the following WARNING, which lead to the ERROR:
> > > > 
> > > > WARNING: Variable key FILES_${PN}-dev (${includedir}
> > > > ${FILES_SOLIBSDEV}
> > > > ${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig
> > > > ${datadir}/pkgconfig
> > > > ${datadir}/aclocal ${base_libdir}/*.o ${libdir}/${BPN}/*.la
> > > > ${base_libdir}/*.la) replaces original key FILES_linux-yocto-
> > > > dev
> > > > (/boot/System.map* /boot/Module.symvers* /boot/config*
> > > > ${KERNEL_SRC_PATH}
> > > > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build).
> > > > ERROR: linux-yocto-4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0
> > > > do_package: QA Issue: linux-yocto: Files/directories were
> > > > installed
> > > > but
> > > > not shipped in any package:
> > > >    /boot/System.map-4.10.17-yocto-standard
> > > >    /boot/Module.symvers-4.10.17-yocto-standard
> > > >    /boot/config-4.10.17-yocto-standard
> > > > Please set FILES such that these items are packaged.
> > > > Alternatively
> > > > if
> > > > they are unneeded, avoid installing them or delete them within
> > > > do_install.
> > > > linux-yocto: 3 installed and not shipped files. [installed-vs-
> > > > shipped]
> > > > ERROR: linux-yocto-4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0
> > > > do_package: Fatal QA errors found, failing task.
> > > > ERROR: linux-yocto-4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0
> > > > do_package: Function failed: do_package
> > > > 
> > > > Something seems to be causing the FILES_linux-yocto-dev info to
> > > > be
> > > > overridden, I have not tracked down the culprit yet.
> > > > 
> > > 
> > > `FILES_linux-yocto-dev` is set to the default value from OE's
> > > bitbake.conf. `FILES_kernel-dev` on the other hand is set by
> > > kernel.bbclass; when `KERNEL_PACKAGE_NAME` expands to `kernel`.
> > > 
> > > I think the real issue here is that QA checks care about
> > > `FILES_${PN}-dev` at all even though that particular package name
> > > isn't
> > > listed in `PACKAGES` variable. I.e. `FILES_${PN}-dev` should be
> > > disregarded since the `linux-yocto` recipe doesn't create package
> > > `${PN}-dev`.
> > > 
> > > Thoughts?
> > > 
> > 
> > It's hard to special case this. After you sent this, I realized
> > what I
> > did was set the KERNEL_PACKAGE_NAME to linux-yocto and because the
> > KERNEL_PACKAGE_NAME matched the actual recipe name we got the
> > strange
> > ${PN} interaction, we might be able to add a test to flag that as
> > an
> > error or warning in the kernel.bbclass.
> > 
> > I am also seeing an issue when I build a 4.9 kernel and then set-up 
> > a
> > 4.10 kernel with the kernel-abiversion getting mis-matched from the
> > depmodwrapper.  Have you tested with different versions?  I know it
> > should work with a old kernel/userspace -> new kernel, but not from
> > a
> > new kernel/userspace -> old kernel.
> > 
> 
> I've also hit this issue.  Here's the error message if that's helpful
> at all:
> 
> WARNING: core-image-base-1.0-r0 do_rootfs: [log_check]
> core-image-base: found 2 warning messages in the logfile:
> [log_check] warning:
> %post(tiny-linux-4.10.17-yocto-tiny-
> 4.10.17+git0+e92bd55409_6648a34e00-r0.qemux86)
> scriptlet failed, exit status 1
> [log_check] Warn: update-alternatives: bzImage has multiple providers
> with the same priority, please check
> /home/tripzero/Projects/poky-contrib/build/tmp/wo
> rk/qemux86-poky-linux/core-image-base/1.0-
> r0/rootfs/usr/lib/opkg/alternatives/bzImage
> for details
> 
> ERROR: core-image-base-1.0-r0 do_rootfs: [log_check] core-image-base:
> found 1 error message in the logfile:
> [log_check] Error: Kernel version 4.10.17-yocto-tiny does not match
> kernel-abiversion (4.10.17-yocto-standard)
> 
> 

When building multiple kernels (multiple recipes), because all inherit
kernel.bbclass, all of them end up in a crowded build/tmp-
glibc/deploy/images/<arch>/.
More problematic is that the symbolic links for the kernel images would
be overridden with the last run kernel build (only if they have the
same KERNEL_IMAGETYPE).
So if linux-yocto-tiny was built last, the kernel image symbolic link
would point to linux-yocto-tiny's kernel instead of the default one.
I suggest we only keep the default kernel's components in build/tmp-
glibc/deploy/images/<arch>/.

Any thoughts?

> 
> > Sau!
> > 
> > 
> > > > 
> > > > Sau!
> > > > 
> > > > > 
> > > > > ---
> > > > >   meta/classes/kernel-module-split.bbclass  |  9 ++--
> > > > >   meta/classes/kernel.bbclass               | 85
> > > > > ++++++++++++++++++---
> > > > > ----------
> > > > >   meta/conf/documentation.conf              |  1 +
> > > > >   meta/recipes-kernel/linux/linux-dtb.inc   |  2 +-
> > > > >   meta/recipes-kernel/linux/linux-yocto.inc |  2 +-
> > > > >   5 files changed, 59 insertions(+), 40 deletions(-)
> > > > > 
> > > > > diff --git a/meta/classes/kernel-module-split.bbclass
> > > > > b/meta/classes/kernel-module-split.bbclass
> > > > > index 1035525dac..9716c5937b 100644
> > > > > --- a/meta/classes/kernel-module-split.bbclass
> > > > > +++ b/meta/classes/kernel-module-split.bbclass
> > > > > @@ -30,7 +30,7 @@ do_install_append() {
> > > > > 
> > > > >   PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
> > > > > 
> > > > > -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
> > > > > +KERNEL_MODULES_META_PACKAGE ?= "${KERNEL_PACKAGE_NAME}-
> > > > > modules"
> > > > > 
> > > > >   KERNEL_MODULE_PACKAGE_PREFIX ?= ""
> > > > >   KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
> > > > > @@ -129,16 +129,19 @@ python split_kernel_module_packages ()
> > > > > {
> > > > >              postfix = format.split('%s')[1]
> > > > >              d.setVar('RPROVIDES_' + pkg,
> > > > > pkg.replace(postfix,
> > > > > ''))
> > > > > 
> > > > > +    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME",
> > > > > True)
> > > > > +    kernel_version = d.getVar("KERNEL_VERSION", True)
> > > > > +
> > > > >       module_regex = '^(.*)\.k?o$'
> > > > > 
> > > > >       module_pattern_prefix =
> > > > > d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
> > > > >       module_pattern_suffix =
> > > > > d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
> > > > > -    module_pattern = module_pattern_prefix + 'kernel-module-
> > > > > %s'
> > > > > +
> > > > > module_pattern_suffix
> > > > > +    module_pattern = module_pattern_prefix +
> > > > > kernel_package_name
> > > > > +
> > > > > '-module-%s' + module_pattern_suffix
> > > > > 
> > > > >       postinst = d.getVar('pkg_postinst_modules')
> > > > >       postrm = d.getVar('pkg_postrm_modules')
> > > > > 
> > > > > -    modules = do_split_packages(d,
> > > > > root='${nonarch_base_libdir}/modules',
> > > > > file_regex=module_regex,
> > > > > output_pattern=module_pattern, description='%s kernel
> > > > > module',
> > > > > postinst=postinst, postrm=postrm, recursive=True,
> > > > > hook=frob_metadata,
> > > > > extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
> > > > > +    modules = do_split_packages(d,
> > > > > root='${nonarch_base_libdir}/modules',
> > > > > file_regex=module_regex,
> > > > > output_pattern=module_pattern, description='%s kernel
> > > > > module',
> > > > > postinst=postinst, postrm=postrm, recursive=True,
> > > > > hook=frob_metadata,
> > > > > extra_depends='%s-%s' % (kernel_package_name,
> > > > > kernel_version))
> > > > >       if modules:
> > > > >           metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
> > > > >           d.appendVar('RDEPENDS_' + metapkg, ' '+'
> > > > > '.join(modules))
> > > > > diff --git a/meta/classes/kernel.bbclass
> > > > > b/meta/classes/kernel.bbclass
> > > > > index 7670c7107a..7fa4509961 100644
> > > > > --- a/meta/classes/kernel.bbclass
> > > > > +++ b/meta/classes/kernel.bbclass
> > > > > @@ -1,6 +1,8 @@
> > > > >   inherit linux-kernel-base kernel-module-split
> > > > > 
> > > > > -PROVIDES += "virtual/kernel"
> > > > > +KERNEL_PACKAGE_NAME ??= "kernel"
> > > > > +
> > > > > +PROVIDES += "${@ "virtual/kernel" if
> > > > > (d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel") else ""
> > > > > }"
> > > > >   DEPENDS += "virtual/${TARGET_PREFIX}binutils
> > > > > virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-
> > > > > native"
> > > > >   PACKAGE_WRITE_DEPS += "depmodwrapper-cross virtual/update-
> > > > > alternatives-native"
> > > > > 
> > > > > @@ -33,10 +35,23 @@ KERNEL_VERSION_PKG_NAME[vardepvalue] =
> > > > > "${LINUX_VERSION}"
> > > > > 
> > > > >   python __anonymous () {
> > > > > 
> > > > > +    # The default kernel recipe builds in a shared location
> > > > > defined
> > > > > by
> > > > > +    # bitbake/distro confs: STAGING_KERNEL_DIR and
> > > > > STAGING_KERNEL_BUILDDIR.
> > > > > +    # Set these variables to directories under ${WORKDIR} in
> > > > > alternate
> > > > > +    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME !=
> > > > > kernel)
> > > > > so
> > > > > that they
> > > > > +    # may build in parallel with the default kernel without
> > > > > clobbering.
> > > > > +    if d.getVar("KERNEL_PACKAGE_NAME", True) != "kernel":
> > > > > +        workdir = d.getVar("WORKDIR", True)
> > > > > +        sourceDir = os.path.join(workdir, 'kernel-source')
> > > > > +        artifactsDir = os.path.join(workdir, 'kernel-build-
> > > > > artifacts')
> > > > > +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
> > > > > +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
> > > > > +
> > > > >       # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
> > > > > KERNEL_IMAGETYPES
> > > > >       type = d.getVar('KERNEL_IMAGETYPE') or ""
> > > > >       alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
> > > > >       types = d.getVar('KERNEL_IMAGETYPES') or ""
> > > > > +    kname = d.getVar('KERNEL_PACKAGE_NAME', True) or
> > > > > "kernel"
> > > > >       if type not in types.split():
> > > > >           types = (type + ' ' + types).strip()
> > > > >       if alttype not in types.split():
> > > > > @@ -53,22 +68,22 @@ python __anonymous () {
> > > > >           typelower = type.lower()
> > > > >           imagedest = d.getVar('KERNEL_IMAGEDEST')
> > > > > 
> > > > > -        d.appendVar('PACKAGES', ' ' + 'kernel-image-' +
> > > > > typelower)
> > > > > +        d.appendVar('PACKAGES', ' %s-image-%s' % (kname,
> > > > > typelower))
> > > > > 
> > > > > -        d.setVar('FILES_kernel-image-' + typelower, '/' +
> > > > > imagedest
> > > > > + '/' + type + '-${KERNEL_VERSION_NAME}')
> > > > > +        d.setVar('FILES_' + kname + '-image-' + typelower,
> > > > > '/' +
> > > > > imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
> > > > > 
> > > > > -        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-
> > > > > image-' +
> > > > > typelower)
> > > > > +        d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-
> > > > > %s'
> > > > > %
> > > > > (kname, typelower))
> > > > > 
> > > > > -        d.setVar('PKG_kernel-image-' + typelower, 'kernel-
> > > > > image-
> > > > > ' +
> > > > > typelower + '-${KERNEL_VERSION_PKG_NAME}')
> > > > > +        d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-
> > > > > image-
> > > > > %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
> > > > > 
> > > > > -        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower,
> > > > > '1')
> > > > > +        d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname,
> > > > > typelower),
> > > > > '1')
> > > > > 
> > > > >           priority = d.getVar('KERNEL_PRIORITY')
> > > > >           postinst = '#!/bin/sh\n' + 'update-alternatives --
> > > > > install /'
> > > > > + imagedest + '/' + type + ' ' + type + ' ' + type + '-
> > > > > ${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
> > > > > -        d.setVar('pkg_postinst_kernel-image-' + typelower,
> > > > > postinst)
> > > > > +        d.setVar('pkg_postinst_' + kname + '-image-' +
> > > > > typelower,
> > > > > postinst)
> > > > > 
> > > > >           postrm = '#!/bin/sh\n' + 'update-alternatives --
> > > > > remove'
> > > > > + '
> > > > > ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' +
> > > > > '\n'
> > > > > -        d.setVar('pkg_postrm_kernel-image-' + typelower,
> > > > > postrm)
> > > > > +        d.setVar('pkg_postrm_%s-image-%s' % (kname,
> > > > > typelower),
> > > > > postrm)
> > > > > 
> > > > >       image = d.getVar('INITRAMFS_IMAGE')
> > > > >       if image:
> > > > > @@ -126,9 +141,9 @@ base_do_unpack_append () {
> > > > > 
> > > > >   inherit kernel-arch deploy
> > > > > 
> > > > > -PACKAGES_DYNAMIC += "^kernel-module-.*"
> > > > > -PACKAGES_DYNAMIC += "^kernel-image-.*"
> > > > > -PACKAGES_DYNAMIC += "^kernel-firmware-.*"
> > > > > +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
> > > > > +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
> > > > > +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
> > > > > 
> > > > >   export OS = "${TARGET_OS}"
> > > > >   export CROSS_COMPILE = "${TARGET_PREFIX}"
> > > > > @@ -371,9 +386,9 @@ do_shared_workdir_setscene () {
> > > > > 
> > > > >   emit_depmod_pkgdata() {
> > > > >           # Stash data for depmod
> > > > > - install -d ${PKGDESTWORK}/kernel-depmod/
> > > > > - echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-
> > > > > depmod/kernel-abiversion
> > > > > - cp ${B}/System.map ${PKGDESTWORK}/kernel-
> > > > > depmod/System.map-
> > > > > ${KERNEL_VERSION}
> > > > > + install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
> > > > > + echo "${KERNEL_VERSION}" >
> > > > > ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-
> > > > > depmod/${KERNEL_PACKAGE_NAME}-
> > > > > abiversion
> > > > > + cp ${B}/System.map
> > > > > ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-
> > > > > depmod/System.map-${KERNEL_VERSION}
> > > > >   }
> > > > > 
> > > > >   PACKAGEFUNCS += "emit_depmod_pkgdata"
> > > > > @@ -388,7 +403,7 @@ do_shared_workdir () {
> > > > >           # Store the kernel version in sysroots for module-
> > > > > base.bbclass
> > > > >           #
> > > > > 
> > > > > - echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
> > > > > + echo "${KERNEL_VERSION}" >
> > > > > $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
> > > > > 
> > > > >           # Copy files required for module builds
> > > > >           cp System.map $kerneldir/System.map-
> > > > > ${KERNEL_VERSION}
> > > > > @@ -486,28 +501,28 @@ EXPORT_FUNCTIONS do_compile do_install
> > > > > do_configure
> > > > > 
> > > > >   # kernel-base becomes kernel-${KERNEL_VERSION}
> > > > >   # kernel-image becomes kernel-image-${KERNEL_VERSION}
> > > > > -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image
> > > > > kernel-
> > > > > dev kernel-modules"
> > > > > +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-
> > > > > base
> > > > > ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> > > > > ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
> > > > >   FILES_${PN} = ""
> > > > > -FILES_kernel-base =
> > > > > "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.ord
> > > > > er
> > > > > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.buil
> > > > > tin"
> > > > > -FILES_kernel-image = ""
> > > > > -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
> > > > > /boot/config* ${KERNEL_SRC_PATH}
> > > > > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> > > > > -FILES_kernel-vmlinux = "/boot/vmlinux-
> > > > > ${KERNEL_VERSION_NAME}"
> > > > > -FILES_kernel-modules = ""
> > > > > -RDEPENDS_kernel = "kernel-base"
> > > > > +FILES_${KERNEL_PACKAGE_NAME}-base =
> > > > > "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.ord
> > > > > er
> > > > > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.buil
> > > > > tin"
> > > > > +FILES_${KERNEL_PACKAGE_NAME}-image = ""
> > > > > +FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map*
> > > > > /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}
> > > > > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> > > > > +FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-
> > > > > ${KERNEL_VERSION_NAME}"
> > > > > +FILES_${KERNEL_PACKAGE_NAME}-modules = ""
> > > > > +RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-
> > > > > base"
> > > > >   # Allow machines to override this dependency if kernel
> > > > > image
> > > > > files
> > > > > are
> > > > >   # not wanted in images as standard
> > > > > -RDEPENDS_kernel-base ?= "kernel-image"
> > > > > -PKG_kernel-image = "kernel-image-${@legitimize_package_name(
> > > > > '${K
> > > > > ERNE
> > > > > L_VERSION}')}"
> > > > > -RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGET
> > > > > YPE'
> > > > > ,
> > > > > 'vmlinux', 'kernel-vmlinux', '', d)}"
> > > > > -PKG_kernel-base = "kernel-${@legitimize_package_name('${KERN
> > > > > EL_V
> > > > > ERSI
> > > > > ON}')}"
> > > > > -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
> > > > > -ALLOW_EMPTY_kernel = "1"
> > > > > -ALLOW_EMPTY_kernel-base = "1"
> > > > > -ALLOW_EMPTY_kernel-image = "1"
> > > > > -ALLOW_EMPTY_kernel-modules = "1"
> > > > > -DESCRIPTION_kernel-modules = "Kernel modules meta package"
> > > > > -
> > > > > -pkg_postinst_kernel-base () {
> > > > > +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?=
> > > > > "${KERNEL_PACKAGE_NAME}-
> > > > > image"
> > > > > +PKG_${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-
> > > > > image-${@
> > > > > legitimize_package_name('${KERNEL_VERSION}')}"
> > > > > +RDEPENDS_${KERNEL_PACKAGE_NAME}-image += "${@base_conditiona
> > > > > l('K
> > > > > ERNE
> > > > > L_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux',
> > > > > '',
> > > > > d)}"
> > > > > +PKG_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${
> > > > > @leg
> > > > > itim
> > > > > ize_package_name('${KERNEL_VERSION}')}"
> > > > > +RPROVIDES_${KERNEL_PACKAGE_NAME}-base +=
> > > > > "${KERNEL_PACKAGE_NAME}-
> > > > > ${KERNEL_VERSION}"
> > > > > +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
> > > > > +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
> > > > > +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image = "1"
> > > > > +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules = "1"
> > > > > +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules = "Kernel modules
> > > > > meta
> > > > > package"
> > > > > +
> > > > > +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
> > > > >           if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ];
> > > > > then
> > > > >                   mkdir -p $D/lib/modules/${KERNEL_VERSION}
> > > > >           fi
> > > > > @@ -521,7 +536,7 @@ pkg_postinst_kernel-base () {
> > > > >   PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
> > > > > 
> > > > >   python split_kernel_packages () {
> > > > > -    do_split_packages(d,
> > > > > root='${nonarch_base_libdir}/firmware',
> > > > > file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$',
> > > > > output_pattern='kernel-
> > > > > firmware-%s', description='Firmware for %s', recursive=True,
> > > > > extra_depends='')
> > > > > +    do_split_packages(d,
> > > > > root='${nonarch_base_libdir}/firmware',
> > > > > file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$',
> > > > > output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s',
> > > > > description='Firmware for %s', recursive=True,
> > > > > extra_depends='')
> > > > >   }
> > > > > 
> > > > >   # Many scripts want to look in arch/$arch/boot for the
> > > > > bootable
> > > > > diff --git a/meta/conf/documentation.conf
> > > > > b/meta/conf/documentation.conf
> > > > > index 35b9103b4a..e061b98de3 100644
> > > > > --- a/meta/conf/documentation.conf
> > > > > +++ b/meta/conf/documentation.conf
> > > > > @@ -248,6 +248,7 @@ KERNEL_IMAGETYPE[doc] = "The type of
> > > > > kernel
> > > > > to
> > > > > build for a device, usually set b
> > > > >   KERNEL_IMAGETYPES[doc] = "The list of types of kernel to
> > > > > build
> > > > > for a
> > > > > device, usually set by the machine configuration files and
> > > > > defaults
> > > > > to KERNEL_IMAGETYPE."
> > > > >   KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that
> > > > > need
> > > > > to be
> > > > > auto-loaded during boot"
> > > > >   KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for
> > > > > which
> > > > > the
> > > > > build system expects to find module_conf_* values that
> > > > > specify
> > > > > configuration for each of the modules"
> > > > > +KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages.
> > > > > Defaults to 'kernel'."
> > > > >   KERNEL_PATH[doc] = "The location of the kernel sources.
> > > > > This
> > > > > variable is set to the value of the STAGING_KERNEL_DIR within
> > > > > the
> > > > > module class (module.bbclass)."
> > > > >   KERNEL_SRC[doc] = "The location of the kernel sources. This
> > > > > variable
> > > > > is set to the value of the STAGING_KERNEL_DIR within the
> > > > > module
> > > > > class
> > > > > (module.bbclass)."
> > > > >   KFEATURE_DESCRIPTION[doc] = "Provides a short description
> > > > > of a
> > > > > configuration fragment. You use this variable in the .scc
> > > > > file
> > > > > that
> > > > > describes a configuration fragment file."
> > > > > diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
> > > > > b/meta/recipes-
> > > > > kernel/linux/linux-dtb.inc
> > > > > index 0174c80d85..da6467bf9f 100644
> > > > > --- a/meta/recipes-kernel/linux/linux-dtb.inc
> > > > > +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> > > > > @@ -4,7 +4,7 @@ FILES_kernel-devicetree =
> > > > > "/${KERNEL_IMAGEDEST}/devicetree*"
> > > > >   PACKAGE_WRITE_DEPS += "virtual/update-alternatives-native"
> > > > > 
> > > > >   python __anonymous () {
> > > > > -    d.appendVar("PACKAGES", " kernel-devicetree")
> > > > > +    d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-
> > > > > devicetree")
> > > > >   }
> > > > > 
> > > > >   normalize_dtb () {
> > > > > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > b/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > index 637506a2a8..4e0ce029da 100644
> > > > > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > @@ -12,7 +12,7 @@ INC_PR = "r4"
> > > > >   # PREFERRED_PROVIDER for virtual/kernel. This avoids
> > > > > network
> > > > > access
> > > > > required
> > > > >   # by the use of AUTOREV SRCREVs, which are the default for
> > > > > this
> > > > > recipe.
> > > > >   python () {
> > > > > -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
> > > > > d.getVar("PN"):
> > > > > +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
> > > > > d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) !=
> > > > > d.getVar("PN",
> > > > > True):
> > > > >           d.delVar("BB_DONT_CACHE")
> > > > >           raise bb.parse.SkipPackage("Set
> > > > > PREFERRED_PROVIDER_virtual/kernel to %s to enable it" %
> > > > > (d.getVar("PN")))
> > > > >   }
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembed
> > ded.org_mailman_listinfo_openembedded-
> > 2Dcore&d=DwICAg&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=35F
> > LeGKBmrBGMHAhCV37-B4ddgcjLZXUChuxj5DD6Sk&m=-J-
> > ERX3BXdjXgeeIE_ZNE7GozSVtUpP3Wt6FV_jtLtM&s=GFRD2nih1U_Vspzl1T_lId_e
> > dVf6o45jiD4I-J1ptR4&e= 

