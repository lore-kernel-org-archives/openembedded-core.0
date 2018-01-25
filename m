Return-Path: <prvs=55616b008=Martin.Hundeboll@prevas.dk>
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id E146F7826D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 10:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=8222; q=dns/txt;
	s=ironport2; t=1516877981; x=1548413981;
	h=from:subject:to:references:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=I7tYWL8NO2kEOK9Ndzsg9NZodd2cuEUG4DwJd4yxMLo=;
	b=sr0xmRmaeiHXGt3Uh7U0pcvfTXw0JUBXLMkDI7vD0YEo6wCBGe2gRYfQ
	4kw2c7aykHaLAvsz0XZcEK78r4ax0cNEMbggGCexdi6G5ncF24vftKZNV
	L5fyWqwaxcRBvvFRztvp+ZmVqkZU4vkXDNGWBxjeK22artjuGNmfoPYys 8=;
X-IronPort-AV: E=Sophos;i="5.46,411,1511823600"; 
   d="scan'208";a="2962624"
Received: from vmprevas4.prevas.se (HELO smtp.prevas.se) ([172.16.8.104])
	by ironport2.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jan 2018 11:58:56 +0100
Received: from [172.16.11.15] (172.16.8.31) by smtp.prevas.se (172.16.8.104)
	with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 25 Jan 2018 11:58:56 +0100
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
To: <openembedded-core@lists.openembedded.org>
References: <e4d7ba56-e92f-9322-6e37-be08bcab8ad8@linux.intel.com>
	<1516876416-13748-1-git-send-email-kristian.amlie@northern.tech>
	<1516876416-13748-2-git-send-email-kristian.amlie@northern.tech>
Message-ID: <457a079b-732b-73b2-3f07-d3d25a7c1d5c@prevas.dk>
Date: Thu, 25 Jan 2018 11:58:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1516876416-13748-2-git-send-email-kristian.amlie@northern.tech>
X-Originating-IP: [172.16.8.31]
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
X-List-Received-Date: Thu, 25 Jan 2018 10:59:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Kristian,

Thanks for your work on this!

On 2018-01-25 11:33, Kristian Amlie wrote:
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

If I understand this correctly, paths like "/data" aren't allowed in 
"IMAGE_ROOTFS_EXCLUDE_PATH". That seems counter-intuitive to me, as I 
would expect this feature to take absolute paths inside the target image 
to be excluded.

If the check is there to avoid "os.path.join()" returning the RHS only 
instead of the joined path, then please use "oe.path.join()" instead.

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

Wouldn't it be sufficient to add "new_rootfs" to "do_image[cleandirs]" ?

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

Are we sure the cleanup is needed? I can image cases where I would like 
to have a look in "rootfs_dirs_excluded" to see what how it differs from 
"rootfs_orig".

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
> 

-- 
MARTIN HUNDEBØLL, Prevas A/S
Software Developer

Hedeager 3, DK-8200 Aarhus N
Phone +45 87438070
Mobile +45 25562438
Martin.Hundeboll@prevas.dk
www.prevas.com

