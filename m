Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F1CF860248
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 09:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4O9DwHE008569; Tue, 24 May 2016 10:13:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ORuQXSuk3rLp; Tue, 24 May 2016 10:13:58 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4O9Dt65008564
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 May 2016 10:13:57 +0100
Message-ID: <1464081235.9570.51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 10:13:55 +0100
In-Reply-To: <c1371045c7b7740a468f44db12ff20a2c881902c.1463769811.git.chris_larson@mentor.com>
References: <0b22f46a6e565f757c0fc11aeab27e9f336c5b37.1463769811.git.chris_larson@mentor.com>
	<c1371045c7b7740a468f44db12ff20a2c881902c.1463769811.git.chris_larson@mentor.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 3/3] image_types.bbclass: support template .wks.in files for wic
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
X-List-Received-Date: Tue, 24 May 2016 09:14:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-05-23 at 13:34 -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> These files are treated as the contents of a bitbake variable, so
> usual
> bitbake variable references are supported. I considered using another
> templating mechanism, for example the one used by yocto-layer, but
> then we'd
> end up largely mapping metadata variables to template fields anyway,
> which is
> a pointless indirection. Let bitbake expand the variables directly
> instead.
> 
> This feature lets us, for example, reference ${APPEND} in --append,
> and avoid
> hardcoding the serial console tty in the wks file, and let the user's
> changes
> to APPEND affect wic the way they do the other image construction
> mechanisms.
> 
> The template is read in and set in a variable at parse time, so
> changes to the
> variables referenced by the template will result in rebuilding the
> image.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/classes/image_types.bbclass | 35
> +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> index dc681ae..caf8757 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -206,6 +206,16 @@ IMAGE_CMD_wic () {
>  }
>  IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
>  
> +python process_wks_template () {
> +    """Write out expanded template contents to WKS_FULL_PATH."""
> +    template_body = d.getVar('_WKS_TEMPLATE', True)
> +    if template_body:
> +        wks_file = d.getVar('WKS_FULL_PATH', True)
> +        with open(wks_file, 'w') as f:
> +            f.write(template_body)
> +}
> +do_image_wic[prefuncs] += 'process_wks_template'
> +
>  # Rebuild when the wks file or vars in WICVARS change
>  USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + '
> '.join('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '',
> d)}"
>  WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
> os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
> @@ -302,3 +312,28 @@ IMAGE_TYPES_MASKED ?= ""
>  # The WICVARS variable is used to define list of bitbake variables
> used in wic code
>  # variables from this list is written to <image>.env file
>  WICVARS ?= "BBLAYERS DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENAME
> IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES
> INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR
> STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS"
> +
> +python () {
> +    """Read in and set up wks file template for wic."""
> +    if d.getVar('USING_WIC', True):
> +        wks_file_u = d.getVar('WKS_FULL_PATH', False)
> +        wks_file = d.expand(wks_file_u)
> +        base, ext = os.path.splitext(wks_file)
> +        if ext == '.in' and os.path.exists(wks_file):
> +            wks_out_file = os.path.join(d.getVar('WORKDIR', True),
> os.path.basename(base))
> +            d.setVar('WKS_FULL_PATH', wks_out_file)
> +            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
> +            d.setVar('WKS_FILE_CHECKSUM',
> '${WKS_TEMPLATE_PATH}:True')
> +
> +            try:
> +                with open(wks_file, 'r') as f:
> +                    body = f.read()
> +            except (IOError, OSError) as exc:
> +                pass

I'm a little nervous about determinism here. Shouldn't it either find
the referenced file or error?

Cheers,

Richard



