Return-Path: <hans.beckerus@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 271246028B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 07:48:29 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id gq1so184333obb.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 00:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kEYmiyE317ANbtmTJrXscoM6mbN7Fxl3kAbbD7CDa4I=;
	b=uYlscGRs2liPtlH89FIaPknoICpVFPKqWDVxsNFKr0Mm6CJdAps5rOzx/lfjsWnTMp
	p/UboUWxxeR3Ij3sOy8PuFObJd0D++4cGCKZn/XTpoZmvHDdkv88B7FzBgAwqKIvwWmx
	w/+lKD6fJ/OB7J2EbUXT42rUF/VO2GDhyixe/pmq1mhrR1o+ilOE5+M/6SzNf8IBP875
	ynr+2zUT4Bo3wxh5lDTktsnZ4Fuv23F6Cs5fFKijlVziCC11hAfYZZZWFHBbZ87ENjq7
	XDd4MTZIaw7Hv9v16rV1A7ePVXjaoKAVDeamm41iNYWxEyvelLgYvzsWJ1sQvyECpZgw
	4H9g==
MIME-Version: 1.0
X-Received: by 10.182.44.167 with SMTP id f7mr5459542obm.3.1378972110492; Thu,
	12 Sep 2013 00:48:30 -0700 (PDT)
Received: by 10.182.44.8 with HTTP; Thu, 12 Sep 2013 00:48:30 -0700 (PDT)
In-Reply-To: <1378892564.3484.172.camel@ted>
References: <1378892564.3484.172.camel@ted>
Date: Thu, 12 Sep 2013 09:48:30 +0200
Message-ID: <CAFyqS9rx5ycOOzfxkCxr5N+wCKBTgqQYjzzmc3CA5u-MZNHA1g@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image/populate_sdk: Ensure symlinks in target sysroot are relative
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
X-List-Received-Date: Thu, 12 Sep 2013 07:48:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have a slight problem with this patch. The new
sysroot-relativelinks.py does not obtain the proper access protection
bits!?
Which results in the following error when packaging the SDK

/home/poky/build/tmp/work/zynq_zc706-poky-linux-gnueabi/rootfs-default/1.0-r0/temp/run.populate_sdk_image.20803:
line 496: /home/poky/scripts/sysroot-relativelinks.py: Permission
denied

[home/poky]: ls -l scripts/sysroot-relativelinks.py
-rw-rw-r-- 1  poky poky 959 Sep 12 09:38 scripts/sysroot-relativelinks.py

The execution bit is missing!?

I can of course apply the execution bit manually, but what may cause
the patch to not set the bits properly in my scripts folder for new
files? Please advise.

Thanks.
Hans


On Wed, Sep 11, 2013 at 11:42 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> In the target sysroot of an SDK we can have target system absolute links
> which don't make sense. This adds a script which fixes them up to become relative
> paths instead.
>
> [YOCTO #5020]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 4a0946c..f1e62f14 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -4,7 +4,7 @@ inherit populate_sdk_base
>
>  TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
>  TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"
> -POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_install_complementary populate_sdk; "
> +POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_install_complementary populate_sdk; rootfs_sysroot_relativelinks; "
>
>  inherit gzipnative
>
> @@ -617,6 +617,11 @@ rootfs_trim_schemas () {
>         done
>  }
>
> +# Make any absolute links in a sysroot relative
> +rootfs_sysroot_relativelinks () {
> +       sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
> +}
> +
>  EXPORT_FUNCTIONS zap_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup
>
>  do_fetch[noexec] = "1"
> diff --git a/scripts/sysroot-relativelinks.py b/scripts/sysroot-relativelinks.py
> new file mode 100755
> index 0000000..2e13744
> --- /dev/null
> +++ b/scripts/sysroot-relativelinks.py
> @@ -0,0 +1,31 @@
> +#!/usr/bin/env python
> +import sys
> +import os
> +
> +# Take a sysroot directory and turn all the abolute symlinks and turn them into
> +# relative ones such that the sysroot is usable within another system.
> +
> +if len(sys.argv) != 2:
> +    print("Usage is " + sys.argv[0] + "<directory>")
> +    sys.exit(1)
> +
> +topdir = sys.argv[1]
> +topdir = os.path.abspath(topdir)
> +
> +def handlelink(filep, subdir):
> +    link = os.readlink(filep)
> +    if link[0] != "/":
> +        return
> +    if link.startswith(topdir):
> +        return
> +    #print("Replacing %s with %s for %s" % (link, topdir+link, filep))
> +    print("Replacing %s with %s for %s" % (link, os.path.relpath(topdir+link, subdir), filep))
> +    os.unlink(filep)
> +    os.symlink(os.path.relpath(topdir+link, subdir), filep)
> +
> +for subdir, dirs, files in os.walk(topdir):
> +    for f in files:
> +        filep = os.path.join(subdir, f)
> +        if os.path.islink(filep):
> +            #print("Considering %s" % filep)
> +            handlelink(filep, subdir)
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

