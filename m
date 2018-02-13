Return-Path: <california.l.sullivan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 80BCB7827E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 01:29:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 17:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,505,1511856000"; d="scan'208";a="17644962"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga008.jf.intel.com with ESMTP; 12 Feb 2018 17:29:45 -0800
To: Kristian Amlie <kristian.amlie@northern.tech>,
	openembedded-core@lists.openembedded.org
References: <e4d7ba56-e92f-9322-6e37-be08bcab8ad8@linux.intel.com>
	<1516876416-13748-1-git-send-email-kristian.amlie@northern.tech>
	<1516876416-13748-2-git-send-email-kristian.amlie@northern.tech>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <3d9848f0-9432-0717-f4f0-0c37dba63b9f@intel.com>
Date: Mon, 12 Feb 2018 17:29:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1516876416-13748-2-git-send-email-kristian.amlie@northern.tech>
Subject: Re: [PATCH v7] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Tue, 13 Feb 2018 01:29:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 01/25/2018 02:33 AM, Kristian Amlie wrote:
> This is a direct followup from the earlier 6602392db3d39 commit in
> wic. It works more or less the same way: The variable specifies a list
> of directories relative to the root of the rootfs, and these
> directories will be excluded from the resulting rootfs image. If an
> entry ends with a slash, only the contents are omitted, not the
> directory itself.
>
> Since the intended use of the variable is to exclude certain
> directories from the rootfs, and then include said directories in
> other partitions, it is not natural for this variable to be respected
> for image creators that create multi partition images. These can turn
> the feature off locally by defining:
>
>    do_image_myfs[respect_exclude_path] = "0"
>
> Specifically, "wic" and "multiubi" come with the feature disabled.
>
> Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
> ---
>   meta/classes/image.bbclass           | 84 +++++++++++++++++++++++++++++++++++-
>   meta/classes/image_types.bbclass     |  1 +
>   meta/classes/image_types_wic.bbclass |  1 +
>   3 files changed, 84 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 4531aa2..849a19c 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -117,7 +117,8 @@ def rootfs_variables(d):
>                    'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
>                    'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
>                    'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
> -                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS']
> +                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS',
> +                 'IMAGE_ROOTFS_EXCLUDE_PATH']
>       variables.extend(rootfs_command_variables(d))
>       variables.extend(variable_depends(d))
>       return " ".join(variables)
> @@ -508,8 +509,9 @@ python () {
>           d.setVarFlag(task, 'func', '1')
>           d.setVarFlag(task, 'fakeroot', '1')
>   
> -        d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
> +        d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size prepare_excluded_directories')
>           d.prependVarFlag(task, 'postfuncs', ' create_symlinks')
> +        d.appendVarFlag(task, 'postfuncs', ' cleanup_excluded_directories')
>           d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
>           d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
>           d.appendVarFlag(task, 'vardepsexclude', 'DATETIME DATE ' + ' '.join(vardepsexclude))
> @@ -518,6 +520,84 @@ python () {
>           bb.build.addtask(task, 'do_image_complete', after, d)
>   }
>   
> +python prepare_excluded_directories() {
> +    exclude_var = d.getVar('IMAGE_ROOTFS_EXCLUDE_PATH')
> +    if not exclude_var:
> +        return
> +
> +    taskname = d.getVar("BB_CURRENTTASK")
> +
> +    if d.getVarFlag('do_%s' % taskname, 'respect_exclude_path') == '0':
> +        bb.debug(1, "'IMAGE_ROOTFS_EXCLUDE_PATH' is set but 'respect_exclude_path' variable flag is 0 for this image type, so ignoring it")
> +        return
> +
> +    import shutil
> +    from oe.path import copyhardlinktree
> +
> +    exclude_list = exclude_var.split()
> +
> +    rootfs_orig = d.getVar('IMAGE_ROOTFS')
> +    # We need a new rootfs directory we can delete files from. Copy to
> +    # workdir.
> +    new_rootfs = os.path.realpath(os.path.join(d.getVar("WORKDIR"), "rootfs.%s" % taskname))
> +
> +    if os.path.lexists(new_rootfs):
> +        shutil.rmtree(os.path.join(new_rootfs))
> +
> +    copyhardlinktree(rootfs_orig, new_rootfs)
> +
> +    for orig_path in exclude_list:
> +        path = orig_path
> +        if os.path.isabs(path):
> +            bb.fatal("IMAGE_ROOTFS_EXCLUDE_PATH: Must be relative: %s" % orig_path)
> +
> +        full_path = os.path.realpath(os.path.join(new_rootfs, path))
> +
> +        # Disallow climbing outside of parent directory using '..',
> +        # because doing so could be quite disastrous (we will delete the
> +        # directory).
> +        if not full_path.startswith(new_rootfs):
> +            bb.fatal("'%s' points to a path outside the rootfs" % orig_path)
> +
> +        if path.endswith(os.sep):
We need to check if full_path exists here, else it may try modifying 
things that don't exist. E.g., if I have IMAGE_ROOTFS_EXCLUDE_PATH = 
"boot" in local.conf and do 'bitbake core-image-minimal-initramfs' I get 
the following:

ERROR: core-image-minimal-initramfs-1.0-r0 do_image_cpio: Error 
executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
      0001:
  *** 0002:prepare_excluded_directories(d)
      0003:
File: '/home/clsulliv/yocto/poky/meta/classes/image.bbclass', lineno: 
572, function: prepare_excluded_directories
      0568:                else:
      0569:                    os.remove(full_entry)
      0570:        else:
      0571:            # Delete whole directory.
  *** 0572:            shutil.rmtree(full_path)
      0573:
      0574:    # Save old value for cleanup later.
      0575:    d.setVar('IMAGE_ROOTFS_ORIG', rootfs_orig)
      0576:    d.setVar('IMAGE_ROOTFS', new_rootfs)
File: '/usr/lib64/python3.6/shutil.py', lineno: 471, function: rmtree
      0467:        # lstat()/open()/fstat() trick.
      0468:        try:
      0469:            orig_st = os.lstat(path)
      0470:        except Exception:
  *** 0471:            onerror(os.lstat, path, sys.exc_info())
      0472:            return
      0473:        try:
      0474:            fd = os.open(path, os.O_RDONLY)
      0475:        except Exception:
File: '/usr/lib64/python3.6/shutil.py', lineno: 469, function: rmtree
      0465:            path = os.fsdecode(path)
      0466:        # Note: To guard against symlink races, we use the 
standard
      0467:        # lstat()/open()/fstat() trick.
      0468:        try:
  *** 0469:            orig_st = os.lstat(path)
      0470:        except Exception:
      0471:            onerror(os.lstat, path, sys.exc_info())
      0472:            return
      0473:        try:
Exception: FileNotFoundError: [Errno 2] No such file or directory: 
'/home/clsulliv/yocto/poky/build/tmp/work/intel_corei7_64-poky-linux/core-image-minimal-initramfs/1.0-r0/rootfs.image_cpio/boot'

ERROR: core-image-minimal-initramfs-1.0-r0 do_image_cpio: Function 
failed: prepare_excluded_directories
ERROR: Logfile of failure stored in: 
/home/clsulliv/yocto/poky/build/tmp/work/intel_corei7_64-poky-linux/core-image-minimal-initramfs/1.0-r0/temp/log.do_image_cpio.23514
ERROR: Task 
(/home/clsulliv/yocto/poky/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_image_cpio) 
failed with exit code '1'

Besides this, it works well. I'm using it here[1] as part of my attempt 
to improve EFI images.

[1]. 
https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=clsulliv/image-creation-exclude-path

Thanks,
Cal

> +            # Delete content only.
> +            for entry in os.listdir(full_path):
> +                full_entry = os.path.join(full_path, entry)
> +                if os.path.isdir(full_entry) and not os.path.islink(full_entry):
> +                    shutil.rmtree(full_entry)
> +                else:
> +                    os.remove(full_entry)
> +        else:
> +            # Delete whole directory.
> +            shutil.rmtree(full_path)
> +
> +    # Save old value for cleanup later.
> +    d.setVar('IMAGE_ROOTFS_ORIG', rootfs_orig)
> +    d.setVar('IMAGE_ROOTFS', new_rootfs)
> +}
> +
> +python cleanup_excluded_directories() {
> +    exclude_var = d.getVar('IMAGE_ROOTFS_EXCLUDE_PATH')
> +    if not exclude_var:
> +        return
> +
> +    taskname = d.getVar("BB_CURRENTTASK")
> +
> +    if d.getVarFlag('do_%s' % taskname, 'respect_exclude_path') == '0':
> +        return
> +
> +    import shutil
> +
> +    rootfs_dirs_excluded = d.getVar('IMAGE_ROOTFS')
> +    rootfs_orig = d.getVar('IMAGE_ROOTFS_ORIG')
> +    # This should never happen, since we should have set it to a different
> +    # directory in the prepare function.
> +    assert rootfs_dirs_excluded != rootfs_orig
> +
> +    shutil.rmtree(rootfs_dirs_excluded)
> +    d.setVar('IMAGE_ROOTFS', rootfs_orig)
> +}
> +
>   #
>   # Compute the rootfs size
>   #
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index c736f92..8cd8fd5 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -201,6 +201,7 @@ IMAGE_CMD_multiubi () {
>   		multiubi_mkfs "${mkubifs_args}" "${ubinize_args}" "${name}"
>   	done
>   }
> +do_image_multiubi[respect_exclude_path] = "0"
>   
>   IMAGE_CMD_ubi () {
>   	multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}"
> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
> index dcf620c..452d7f3 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -34,6 +34,7 @@ IMAGE_CMD_wic () {
>   	rm -rf "$out/"
>   }
>   IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
> +do_image_wic[respect_exclude_path] = "0"
>   
>   # Rebuild when the wks file or vars in WICVARS change
>   USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"


