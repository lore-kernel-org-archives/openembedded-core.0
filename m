Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 415937866B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 05:03:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b76so10759509wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 21:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3v1/1cILMNOf+hXRhq/UtioYa2Tmbtw97o5+YWO2Kbw=;
	b=DVOUKFXn8SXEo3JAKYLvTQmLYtZhNZCoJRqH6DQ9rPbvBcKB3N8IQULINcO4b1M5hR
	vTipsM9X/YYZnSPP2vd/z2rF2QvlNroqWMu94Cw+aZ84XJ9DOOHuGOmL3I1QrtFZauAM
	yID3NPiMpMA9upmDWdkRaPuf5TEMjxrJyptmcLRBqhZBkXWe1vJ7a/OdDb29d9n/ZRWt
	1OpQeMoZZmffxysq6h/20lOLKCrnLhnkarsO3TWGh5TknONPkihUav78fXQcR5E+5egP
	pQ4ODMAW/U928q6H9Jp5mWuWtYo6d7I4CAZH0v0IRyRuOSOFi2++56BjKRKNcwq5wexr
	8Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3v1/1cILMNOf+hXRhq/UtioYa2Tmbtw97o5+YWO2Kbw=;
	b=dm9/qbgG8hzd5swCwS/GwmFaMiVklJTYmdkirfTbu4qvUGdFIYBLRVNHIx38JjQupS
	BF+MoijF3fIngUI/f+E9w9he0vSGVo1AtZVbK1jNfBB/0MG5OfzyMYSrYg+HD2n2CxYh
	wxCcdO0G4hti+TSM/79fC4MtAfwDdarsWjq5FqmnrDd0gHk5SGMpBRShVrsNIfNJni8U
	et9tdRdrDNXRIiuaMrGldCx6qBtZxTS54HhXw09al2MaBCex9rC0gKxIK/0tq35xFcCw
	TMv4y6xSp86Px494oPr4qOakAwfb+YLdI3H+43VrEnGFqEMu8AvudcN4L5qi7Gex8XJu
	FwZg==
X-Gm-Message-State: AKGB3mJIUH1+oOAO0BL7AomJf2w2XzIQ97TXsDqgARCGTOMl9VVYn13n
	uJLIoyk007zRL5LKcEbDgC1O6Y/08KzTO8i6kug=
X-Google-Smtp-Source: AGs4zMZq28X8yAxKxGdKfkYP9gwo5wzpx39/6Q+BUvHaauaEogOwI4dGtbW6FnCnTcMhvGnoCqtFyLNHzbXi9VAk1Kw=
X-Received: by 10.28.199.75 with SMTP id x72mr13144158wmf.87.1512623014844;
	Wed, 06 Dec 2017 21:03:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Wed, 6 Dec 2017 21:03:34 -0800 (PST)
In-Reply-To: <20171207042834.12487-1-sgw@linux.intel.com>
References: <20171207042834.12487-1-sgw@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 6 Dec 2017 21:03:34 -0800
Message-ID: <CAJ86T=X6Mi-yDdUJpUtZqDh3rnD9-QVdqgfFQboaGdZprMripg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: Add additional bb.debug to help track 12304
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
X-List-Received-Date: Thu, 07 Dec 2017 05:03:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 6, 2017 at 8:28 PM, Saul Wold <sgw@linux.intel.com> wrote:
> We actually caught the ext4 size issue in the wild with the debug
> output in the oe_mkext234fs() code, but it did not help.  What that
> showed was that the get_rootfs_size was returning a default size of
> 8192, where as the actual rootfs was more like 10572, thus too large
> to fit in the created sparse file.
>
> This additional temporary debug code should help us determine where
> the failure might be.

It might also be useful to save away the output of "ls -lR" for the
rootfs dir as seen by both get_rootfs_size() and oe_mkext234fs(), so
that it the apparent size is changing between the times these two
functions run we'll get some clues as to why.

> More debug for
> [YOCTO #12304]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/image.bbclass | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index d93de02b759..9964393e211 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -519,7 +519,7 @@ python () {
>  #
>  # Compute the rootfs size
>  #
> -def get_rootfs_size(d):
> +def get_rootfs_size(d, force_size=0):
>      import subprocess
>
>      rootfs_alignment = int(d.getVar('IMAGE_ROOTFS_ALIGNMENT'))
> @@ -531,24 +531,35 @@ def get_rootfs_size(d):
>      initramfs_fstypes = d.getVar('INITRAMFS_FSTYPES') or ''
>      initramfs_maxsize = d.getVar('INITRAMFS_MAXSIZE')
>
> -    output = subprocess.check_output(['du', '-ks',
> +    if (force_size != 0):
> +        size_kb = force_size
> +    else:
> +        output = subprocess.check_output(['du', '-ks',
>                                        d.getVar('IMAGE_ROOTFS')])
> -    size_kb = int(output.split()[0])
> +        size_kb = int(output.split()[0])
> +
>      base_size = size_kb * overhead_factor
> -    base_size = max(base_size, rootfs_req_size) + rootfs_extra_space
> +    bb.debug(1, '%f = %d * %f' % (base_size, size_kb, overhead_factor))
> +    base_size2 = max(base_size, rootfs_req_size) + rootfs_extra_space
> +    bb.debug(1, '%f = max(%f, %d)[%f] + %d' % (base_size2, base_size, rootfs_req_size, max(base_size, rootfs_req_size), overhead_factor))
>
> +    base_size = base_size2
>      if base_size != int(base_size):
>          base_size = int(base_size + 1)
>      else:
>          base_size = int(base_size)
> +    bb.debug(1, '%f = int(%f)' % (base_size, base_size2))
>
> +    base_size_saved = base_size
>      base_size += rootfs_alignment - 1
>      base_size -= base_size % rootfs_alignment
> +    bb.debug(1, '%d = aligned(%d)' % (base_size, base_size_saved))
>
>      # Do not check image size of the debugfs image. This is not supposed
>      # to be deployed, etc. so it doesn't make sense to limit the size
>      # of the debug.
>      if (d.getVar('IMAGE_BUILDING_DEBUGFS') or "") == "true":
> +        bb.debug(1, 'returning debugfs size %d' % (base_size))
>          return base_size
>
>      # Check the rootfs size against IMAGE_ROOTFS_MAXSIZE (if set)
> @@ -566,6 +577,8 @@ def get_rootfs_size(d):
>                  (base_size, initramfs_maxsize_int))
>              bb.error("You can set INITRAMFS_MAXSIZE a larger value. Usually, it should")
>              bb.fatal("be less than 1/2 of ram size, or you may fail to boot it.\n")
> +
> +    bb.debug(1, 'returning %d' % (base_size))
>      return base_size
>
>  python set_image_size () {
> @@ -574,6 +587,13 @@ python set_image_size () {
>          d.setVarFlag('ROOTFS_SIZE', 'export', '1')
>  }
>
> +do_testsize[nostamp] = "1"
> +python do_testsize() {
> +    sz = get_rootfs_size(d, 10572)
> +    bb.warn('size is %d' % sz)
> +}
> +addtask do_testsize
> +
>  #
>  # Create symlinks to the newly created image
>  #
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

