Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0A16AC69
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 08:19:38 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id l4so8868543lbv.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jul 2014 01:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=9K702Ld4jYiIOpjQ/y+f7YteLkpy68wmLE/xgEdq3hU=;
	b=bxIrCgkIS/NxgSVookxuL1TmeBvEQhcaTwUi5h4BU75pgPtBQyfqHzuQXOnARvxB6h
	8ztVek6ABeysgC68JEVGnxWmlE/Cb0whLssWQcqbRRyVVk3YYfbBNg1iSGkqgDjiwRiv
	WNnJMmcw4CQi2bp6gEbzvPqPIZN0zpfaPCpqM7GQvafMfTeOOdNVBYLCO9B7yyvyAYls
	0PDjdvA5NOquRRS9UVSK69wcZ/1nuzfLYcTKDSJyQvH9BZwpMYvTd3tZZc26/nvUoXvJ
	ndc0reHE3cNXqdghTJHGhYUHGBqTor/Ou7HOXTjEg3gx0iKxh8qn8eqbuGrseaNW9c2n
	jnLw==
X-Received: by 10.112.34.170 with SMTP id a10mr2307925lbj.11.1404375578572;
	Thu, 03 Jul 2014 01:19:38 -0700 (PDT)
Received: from [172.16.141.152] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id lb5sm6027758lab.20.2014.07.03.01.19.36
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 03 Jul 2014 01:19:37 -0700 (PDT)
Message-ID: <53B51215.7060605@gmail.com>
Date: Thu, 03 Jul 2014 10:19:33 +0200
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1404292676.git.liezhi.yang@windriver.com>
	<170029dfcde1cb5c69c5e8c82efa9f223deaf797.1404292676.git.liezhi.yang@windriver.com>
In-Reply-To: <170029dfcde1cb5c69c5e8c82efa9f223deaf797.1404292676.git.liezhi.yang@windriver.com>
Subject: Re: [RFC - WIP PATCH 1/1] image.bbclass: create binary pkg for image recipe
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
X-List-Received-Date: Thu, 03 Jul 2014 08:19:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-07-02 11:25, Robert Yang wrote:
> * Benefits
>    We can known the image's RDEPENDS outside the build environment, and
>    can use a third part installer such as anaconda to install the packages.
>    It's hard to get the ROOTFS_POSTPROCESS_COMMAND outside the build
>    environment, now the shell function can be added to postinst, and will
>    show a warning for the python function. We have two python functions
>    atm: write_package_manifest and write_image_manifest, we don't need them
>    in the binary pkg.
>
> * Brief design:
>    - Set the RDEPENDS and create the package as other regular recipes.
>
>    - Translate the ROOTFS_POSTPROCESS_COMMAND to postinst
>      do_install[postfuncs] += "get_rootfs_postprocess_command"
>
>      The get_rootfs_postprocess_command() will emit the shell script to
>      /usr/share/${PN}, and the pkg_postinst_${PN} will run it when do the
>      install.
>
> * Fixed:
>    RDEPENDS -> RDEPENDS_${PN}, the similar to RRECOMMENDS
>
> * Tested on rpm, dep and ipk
>
> * TODO:
>    - Create the binary pkg optionally rather than default ?
> [YOCTO #6463]

Interesting approach.

Image binaries were created before 
poky-commit:6706c7bdd2de6e0e447d90062e74a718a8d31778,
but this feature was removed.

A similiar approach has been rejected before:
http://lists.openembedded.org/pipermail/openembedded-core/2013-December/087474.html

I ended up with a fork of image.bbclass for images I needed available as
meta-packages.

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/image.bbclass                   |   91 +++++++++++++++++++++++---
>   meta/recipes-core/meta/buildtools-tarball.bb |    2 +-
>   2 files changed, 83 insertions(+), 10 deletions(-)

<SNIP>

> +
> +        bb.note('Fix build path in %s' % postinst)
> +        # Remove the IMAGE_ROOTFS prefix
> +        fix_cmd = "sed -i -e 's:%s::g'" % d.getVar('IMAGE_ROOTFS', True)
> +        # Remove the STAGING_DIR_TARGET prefix
> +        fix_cmd += " -e 's:%s::g'" % d.getVar('STAGING_DIR_TARGET', True)
> +        # Comment out the STAGING_DIR_NATIVE related lines
> +        fix_cmd += " -e 's:\(^.*%s\):#\\1:'" % d.getVar('STAGING_DIR_NATIVE', True)
> +        # Comment out the PSEUDO related lines
> +        fix_cmd += " -e 's:\(^export .*PSEUDO\):#\\1:'"
> +        # Comment out the username related lines
> +        fix_cmd += " -e 's:\(^export .*%s\):#\\1:'" % d.getVar('USER', True)
> +

Why are you commenting out these vars ?
Perhaps it would be better to fix the ROOTFS_POSTPROCESS_COMMANDs, and 
rely on a sane environment ?


> +        fix_cmd += " %s" % postinst
> +        subprocess.call(fix_cmd, shell=True)
> +
> +        os.chmod(postinst, 0755)
> +
> +        with open(postinst_list, 'a') as plist:
> +            plist.write("%s\n" % postinst.replace(d.getVar('D', True), ''))
> +}
> +
> +pkg_postinst_${PN} () {

You need to check if your running on target here.

> +    listfile = "${datadir}/${PN}/postinst_list"
> +    if [ -s $listfile ]; then
> +        for script in `cat $listfile`; do
> +            echo "Running $script..."
> +            /bin/sh $script
> +            if [ $? -ne 0 ]; then
> +                # Allow the failure rather than re-install the package
> +                # since the script can be manualy run
> +                echo "ERROR: failed to run $script" >&2
> +                echo "ERROR: please fix $script and manually run it" >&2

If the ROOTFS_POSTPROCESS_COMMANDs do follow the same rules as other 
postinstalls, you could potentially defer executing to first boot when 
errors occur. (run-postinst)

> +                true
> +            fi
> +        done
> +    fi
> +}
> +
>   do_fetch[noexec] = "1"
>   do_unpack[noexec] = "1"
>   do_patch[noexec] = "1"
>   do_configure[noexec] = "1"
>   do_compile[noexec] = "1"
> -do_install[noexec] = "1"
>   do_populate_sysroot[noexec] = "1"
> -do_package[noexec] = "1"
> -do_packagedata[noexec] = "1"
> -do_package_write_ipk[noexec] = "1"
> -do_package_write_deb[noexec] = "1"
> -do_package_write_rpm[noexec] = "1"
>
>   addtask rootfs before do_build
>   # Allow the kernel to be repacked with the initramfs and boot image file as a single file
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index 62e1e0b..7501525 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -45,7 +45,7 @@ TOOLCHAIN_HOST_TASK ?= "\
>
>   TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
>
> -RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
> +RDEPENDS_${PN} = "${TOOLCHAIN_HOST_TASK}"
>
>   EXCLUDE_FROM_WORLD = "1"
>
>


