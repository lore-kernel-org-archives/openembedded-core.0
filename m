Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EAEE9731D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 17:25:43 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 30 Jan 2017 09:25:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,312,1477983600"; d="scan'208";a="59196990"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 30 Jan 2017 09:25:43 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 74CB06A4006;
	Mon, 30 Jan 2017 09:24:44 -0800 (PST)
Date: Mon, 30 Jan 2017 19:03:18 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Ola x Nilsson <ola.x.nilsson@axis.com>
Message-ID: <20170130170318.GA660@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1485547221.git.ed.bartosh@linux.intel.com>
	<257efe25e625e8aaa0f1d435716f0c5f61071700.1485547221.git.ed.bartosh@linux.intel.com>
	<043d99f6abaa415985974a81b31ea33c@XBOX04.axis.com>
MIME-Version: 1.0
In-Reply-To: <043d99f6abaa415985974a81b31ea33c@XBOX04.axis.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 01/11] image-wic: move wic code to image-wic.bbclass
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
X-List-Received-Date: Mon, 30 Jan 2017 17:25:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 30, 2017 at 10:25:12AM +0000, Ola x Nilsson wrote:
> Please name the class image_wic.bbclass instead.
> 
> As dashes are not allowed in function names, you cannot use 
> the image_wic_do_write_wks_template pattern of function 
> names if you use a class name with a dash in it.
> 

Thanks for pointing out to it. Will fix it in the next versison of this
patchset.

> -- 
> Ola x Nilsson
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of Ed Bartosh
> > Sent: den 27 januari 2017 21:20
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH v3 01/11] image-wic: move wic code to image-
> > wic.bbclass
> > 
> > There is a lot of wic code in image.bbclass and image_types.bbclass Having all
> > code separated in one file should make it more readable and easier to
> > maintain.
> > 
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> >  meta/classes/image-wic.bbclass   | 120
> > +++++++++++++++++++++++++++++++++++++++
> >  meta/classes/image.bbclass       |  25 +-------
> >  meta/classes/image_types.bbclass |  95 -------------------------------
> >  3 files changed, 122 insertions(+), 118 deletions(-)  create mode 100644
> > meta/classes/image-wic.bbclass
> > 
> > diff --git a/meta/classes/image-wic.bbclass b/meta/classes/image-
> > wic.bbclass new file mode 100644 index 0000000..2acfd65
> > --- /dev/null
> > +++ b/meta/classes/image-wic.bbclass
> > @@ -0,0 +1,120 @@
> > +# The WICVARS variable is used to define list of bitbake variables used
> > +in wic code # variables from this list is written to <image>.env file
> > +WICVARS ?= "\
> > +           BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD
> > HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES \
> > +           IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD
> > ISODIR MACHINE_ARCH RECIPE_SYSROOT_NATIVE \
> > +           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR
> > TARGET_SYS"
> > +
> > +WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
> > +WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
> > +WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p for p in
> > '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in
> > '${BBPATH}:${COREBASE}'.split(':'))}"
> > +WKS_FULL_PATH = "${@wks_search('${WKS_FILES}'.split(),
> > '${WKS_SEARCH_PATH}') or ''}"
> > +
> > +def wks_search(files, search_path):
> > +    for f in files:
> > +        if os.path.isabs(f):
> > +            if os.path.exists(f):
> > +                return f
> > +        else:
> > +            searched = bb.utils.which(search_path, f)
> > +            if searched:
> > +                return searched
> > +
> > +WIC_CREATE_EXTRA_ARGS ?= ""
> > +
> > +IMAGE_CMD_wic () {
> > +	out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
> > +	wks="${WKS_FULL_PATH}"
> > +	if [ -z "$wks" ]; then
> > +		bbfatal "No kickstart files from WKS_FILES were
> > found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
> > +	fi
> > +
> > +	BUILDDIR="${TOPDIR}" wic create "$wks" --vars
> > "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o
> > "$out/" ${WIC_CREATE_EXTRA_ARGS}
> > +	mv "$out/$(basename "${wks%.wks}")"*.direct
> > "$out${IMAGE_NAME_SUFFIX}.wic"
> > +	rm -rf "$out/"
> > +}
> > +IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
> > +
> > +# Rebuild when the wks file or vars in WICVARS change USING_WIC =
> > +"${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for
> > c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
> > +WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
> > os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
> > +do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
> > +do_image_wic[depends] += "wic-tools:do_build"
> > +
> > +python () {
> > +    if d.getVar('USING_WIC') and 'do_bootimg' in d:
> > +        bb.build.addtask('do_image_wic', '', 'do_bootimg', d) }
> > +
> > +python do_write_wks_template () {
> > +    """Write out expanded template contents to WKS_FULL_PATH."""
> > +    import re
> > +
> > +    template_body = d.getVar('_WKS_TEMPLATE')
> > +
> > +    # Remove any remnant variable references left behind by the expansion
> > +    # due to undefined variables
> > +    expand_var_regexp = re.compile(r"\${[^{}@\n\t :]+}")
> > +    while True:
> > +        new_body = re.sub(expand_var_regexp, '', template_body)
> > +        if new_body == template_body:
> > +            break
> > +        else:
> > +            template_body = new_body
> > +
> > +    wks_file = d.getVar('WKS_FULL_PATH')
> > +    with open(wks_file, 'w') as f:
> > +        f.write(template_body)
> > +}
> > +
> > +python () {
> > +    if d.getVar('USING_WIC'):
> > +        wks_file_u = d.getVar('WKS_FULL_PATH', False)
> > +        wks_file = d.expand(wks_file_u)
> > +        base, ext = os.path.splitext(wks_file)
> > +        if ext == '.in' and os.path.exists(wks_file):
> > +            wks_out_file = os.path.join(d.getVar('WORKDIR'),
> > os.path.basename(base))
> > +            d.setVar('WKS_FULL_PATH', wks_out_file)
> > +            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
> > +            d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
> > +
> > +            # We need to re-parse each time the file changes, and bitbake
> > +            # needs to be told about that explicitly.
> > +            bb.parse.mark_dependency(d, wks_file)
> > +
> > +            try:
> > +                with open(wks_file, 'r') as f:
> > +                    body = f.read()
> > +            except (IOError, OSError) as exc:
> > +                pass
> > +            else:
> > +                # Previously, I used expandWithRefs to get the dependency list
> > +                # and add it to WICVARS, but there's no point re-parsing the
> > +                # file in process_wks_template as well, so just put it in
> > +                # a variable and let the metadata deal with the deps.
> > +                d.setVar('_WKS_TEMPLATE', body)
> > +                bb.build.addtask('do_write_wks_template',
> > +'do_image_wic', None, d) }
> > +
> > +#
> > +# Write environment variables used by wic # to
> > +tmp/sysroots/<machine>/imgdata/<image>.env
> > +#
> > +python do_rootfs_wicenv () {
> > +    wicvars = d.getVar('WICVARS')
> > +    if not wicvars:
> > +        return
> > +
> > +    stdir = d.getVar('STAGING_DIR')
> > +    outdir = os.path.join(stdir, d.getVar('MACHINE'), 'imgdata')
> > +    bb.utils.mkdirhier(outdir)
> > +    basename = d.getVar('IMAGE_BASENAME')
> > +    with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
> > +        for var in wicvars.split():
> > +            value = d.getVar(var)
> > +            if value:
> > +                envf.write('%s="%s"\n' % (var, value.strip())) }
> > +addtask do_rootfs_wicenv after do_image before do_image_wic
> > +do_rootfs_wicenv[vardeps] += "${WICVARS}"
> > +do_rootfs_wicenv[prefuncs] = 'set_image_size'
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass index
> > 13fd996..1a549e9 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -192,6 +192,8 @@ python () {
> >  IMAGE_CLASSES += "image_types"
> >  inherit ${IMAGE_CLASSES}
> > 
> > +inherit image-wic
> > +
> >  IMAGE_POSTPROCESS_COMMAND ?= ""
> > 
> >  # some default locales
> > @@ -332,29 +334,6 @@ fakeroot python do_image_qa () {  }  addtask
> > do_image_qa after do_image_complete before do_build
> > 
> > -#
> > -# Write environment variables used by wic -# to
> > tmp/sysroots/<machine>/imgdata/<image>.env
> > -#
> > -python do_rootfs_wicenv () {
> > -    wicvars = d.getVar('WICVARS')
> > -    if not wicvars:
> > -        return
> > -
> > -    stdir = d.getVar('STAGING_DIR')
> > -    outdir = os.path.join(stdir, d.getVar('MACHINE'), 'imgdata')
> > -    bb.utils.mkdirhier(outdir)
> > -    basename = d.getVar('IMAGE_BASENAME')
> > -    with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
> > -        for var in wicvars.split():
> > -            value = d.getVar(var)
> > -            if value:
> > -                envf.write('%s="%s"\n' % (var, value.strip()))
> > -}
> > -addtask do_rootfs_wicenv after do_image before do_image_wic -
> > do_rootfs_wicenv[vardeps] += "${WICVARS}"
> > -do_rootfs_wicenv[prefuncs] = 'set_image_size'
> > -
> >  def setup_debugfs_variables(d):
> >      d.appendVar('IMAGE_ROOTFS', '-dbg')
> >      d.appendVar('IMAGE_LINK_NAME', '-dbg') diff --git
> > a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> > index ad95dc6..e2ecf93 100644
> > --- a/meta/classes/image_types.bbclass
> > +++ b/meta/classes/image_types.bbclass
> > @@ -192,97 +192,6 @@ IMAGE_CMD_ubi () {
> > 
> >  IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o
> > ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs
> > ${MKUBIFS_ARGS}"
> > 
> > -WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
> > -WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
> > -WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p for p in
> > '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in
> > '${BBPATH}:${COREBASE}'.split(':'))}"
> > -WKS_FULL_PATH = "${@wks_search('${WKS_FILES}'.split(),
> > '${WKS_SEARCH_PATH}') or ''}"
> > -
> > -def wks_search(files, search_path):
> > -    for f in files:
> > -        if os.path.isabs(f):
> > -            if os.path.exists(f):
> > -                return f
> > -        else:
> > -            searched = bb.utils.which(search_path, f)
> > -            if searched:
> > -                return searched
> > -
> > -WIC_CREATE_EXTRA_ARGS ?= ""
> > -
> > -IMAGE_CMD_wic () {
> > -	out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
> > -	wks="${WKS_FULL_PATH}"
> > -	if [ -z "$wks" ]; then
> > -		bbfatal "No kickstart files from WKS_FILES were
> > found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
> > -	fi
> > -
> > -	BUILDDIR="${TOPDIR}" wic create "$wks" --vars
> > "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o
> > "$out/" ${WIC_CREATE_EXTRA_ARGS}
> > -	mv "$out/$(basename "${wks%.wks}")"*.direct
> > "$out${IMAGE_NAME_SUFFIX}.wic"
> > -	rm -rf "$out/"
> > -}
> > -IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
> > -
> > -# Rebuild when the wks file or vars in WICVARS change -USING_WIC =
> > "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c
> > in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
> > -WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
> > os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
> > -do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
> > -do_image_wic[depends] += "wic-tools:do_build"
> > -
> > -python () {
> > -    if d.getVar('USING_WIC') and 'do_bootimg' in d:
> > -        bb.build.addtask('do_image_wic', '', 'do_bootimg', d)
> > -}
> > -
> > -python do_write_wks_template () {
> > -    """Write out expanded template contents to WKS_FULL_PATH."""
> > -    import re
> > -
> > -    template_body = d.getVar('_WKS_TEMPLATE')
> > -
> > -    # Remove any remnant variable references left behind by the expansion
> > -    # due to undefined variables
> > -    expand_var_regexp = re.compile(r"\${[^{}@\n\t :]+}")
> > -    while True:
> > -        new_body = re.sub(expand_var_regexp, '', template_body)
> > -        if new_body == template_body:
> > -            break
> > -        else:
> > -            template_body = new_body
> > -
> > -    wks_file = d.getVar('WKS_FULL_PATH')
> > -    with open(wks_file, 'w') as f:
> > -        f.write(template_body)
> > -}
> > -
> > -python () {
> > -    if d.getVar('USING_WIC'):
> > -        wks_file_u = d.getVar('WKS_FULL_PATH', False)
> > -        wks_file = d.expand(wks_file_u)
> > -        base, ext = os.path.splitext(wks_file)
> > -        if ext == '.in' and os.path.exists(wks_file):
> > -            wks_out_file = os.path.join(d.getVar('WORKDIR'),
> > os.path.basename(base))
> > -            d.setVar('WKS_FULL_PATH', wks_out_file)
> > -            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
> > -            d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
> > -
> > -            # We need to re-parse each time the file changes, and bitbake
> > -            # needs to be told about that explicitly.
> > -            bb.parse.mark_dependency(d, wks_file)
> > -
> > -            try:
> > -                with open(wks_file, 'r') as f:
> > -                    body = f.read()
> > -            except (IOError, OSError) as exc:
> > -                pass
> > -            else:
> > -                # Previously, I used expandWithRefs to get the dependency list
> > -                # and add it to WICVARS, but there's no point re-parsing the
> > -                # file in process_wks_template as well, so just put it in
> > -                # a variable and let the metadata deal with the deps.
> > -                d.setVar('_WKS_TEMPLATE', body)
> > -                bb.build.addtask('do_write_wks_template', 'do_image_wic', None,
> > d)
> > -}
> > -
> >  EXTRA_IMAGECMD = ""
> > 
> >  inherit siteinfo
> > @@ -380,7 +289,3 @@ IMAGE_EXTENSION_live = "hddimg iso"
> >  # The IMAGE_TYPES_MASKED variable will be used to mask out from the
> > IMAGE_FSTYPES,  # images that will not be built at do_rootfs time: vmdk, vdi,
> > qcow2, hdddirect, hddimg, iso, etc.
> >  IMAGE_TYPES_MASKED ?= ""
> > -
> > -# The WICVARS variable is used to define list of bitbake variables used in wic
> > code -# variables from this list is written to <image>.env file -WICVARS ?=
> > "BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD HDDDIR
> > IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME
> > IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH
> > RECIPE_SYSROOT_NATIVE ROOTFS_SIZE STAGING_DATADIR STAGING_DIR
> > STAGING_LIBDIR TARGET_SYS"
> > --
> > 2.1.4
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed

