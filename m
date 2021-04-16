Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.464.1618596460195789935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Apr 2021 11:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=URU7gbl2;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id u17so43423833ejk.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Apr 2021 11:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j3KUpRWr7YghrQtXxtWU8Ju5oGJhAfIzivvr+Q8vxIw=;
        b=URU7gbl2AeHBIHCbLjBFM4x6oYbWiQ/rfqU7m9F6xaHBqgQarGfbs1ymxnzlUq5U9q
         C9iugjgNhurznlgHeTfCUPzzUol2kOyyl1CydgNUWbOCeGCrzUBEPcqPNdTwoxVtxJYf
         rpaGLzFwb6NXnIdT+EH9xo0NbdviRhk8xQF76rpif/oFDm8AQhmHFb/damIz5+2T+Q0V
         vxdwAtpHwLQf3Bhxbqv2+qBH3BAC6ytz73hiD/2mxL3mIDozwBzxa/cZ0ANAVFJtOv5F
         yy8kEr/i42ctTfj4NgsesHd90rEngxU3d8WgilzxaEmn82nsQ+hkQMnhQHtHBMjIvDJs
         /dUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j3KUpRWr7YghrQtXxtWU8Ju5oGJhAfIzivvr+Q8vxIw=;
        b=t9nJwzNvmBZ32s8xo7JUsUlVVJEiP0ljuSCMDLsPN1JuG6rlD+4PhDfRWGdSOY1/kq
         eM3LngRJi5oHpk+9U0kpSAA0C0nb4PtB7IFhCbN+qRmRzqY+xYQ3jUUsd1QPy2jBiVHt
         ujDjSzzZ/nH9a3HVPW4c9K4P0HEVABwpLHn05EI05NLbS7PuGASTiymlcISS8BE+QT7U
         Y5t6jApSS5oDd73vJB4ASbLNEnjosxfvl3rHo/uevSa3v8CkQju+6Pq2Fouh+dKkj2IR
         wwzKhaIS0hlELdJZhyPrPHjdNuXH7rWm4Uc+AG/Oo9f6bma1HEXLo6TyK0w8kq/+fcGl
         Y7lQ==
X-Gm-Message-State: AOAM531F6+y0bU0lJ4+R6zLzun29VAddAFK5dGqRorbETi+UnuqwR+ah
	hK7XiWUPGQfVM3eIUpWy754PxupzZG1jEZgAzPU=
X-Google-Smtp-Source: ABdhPJzXsVC4GBleptF/y6/gFknQ+Zp8IlXd4oE6ZitlmzS6pKuUj/d0R9YO6nWocljKqLZAl/Yxn+xaIeVBSzjg79Q=
X-Received: by 2002:a17:906:f210:: with SMTP id gt16mr9555358ejb.22.1618596398750;
 Fri, 16 Apr 2021 11:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210416164310.275973-1-adrian.freihofer@siemens.com>
In-Reply-To: <20210416164310.275973-1-adrian.freihofer@siemens.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 16 Apr 2021 14:06:27 -0400
Message-ID: <CADkTA4O9o1-ivXKjUiidMh+b7qTegDnDwV0Y_dViwCBOz7aCEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: support uImage kernel
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 16, 2021 at 12:43 PM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> u-boot's uImage kernel format is not supported by Qemu. Extract the
> kernel from the uImage to a temporary directory.
>

I'd suggest that we should document in the commit log why someone
wouldn't just build a kernel image format that is already supported by
runqemu (which is what I typically do). I'm guessing it is some sort
of h/w boot being re-purposed to qemu emulation, and this is to avoid
building a second kernel image ?

Additionally, this should have some sort of test, or the code is going
to bitrot due to not being run by anything in core.

> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  scripts/runqemu | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index ba0b701aff..fa630fc7a4 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -163,6 +163,7 @@ class BaseConfig(object):
>          self.bios = ''
>          self.kernel_cmdline = ''
>          self.kernel_cmdline_script = ''
> +        self.temp_kernel_dir = None
>          self.bootparams = ''
>          self.dtb = ''
>          self.fstype = ''
> @@ -1422,10 +1423,26 @@ class BaseConfig(object):
>          self.setup_serial()
>          self.setup_vga()
>
> +    def dump_uimage(self):
> +        if self.kernel and self.get('KERNEL_IMAGETYPE') == 'uImage':
> +            import tempfile
> +            self.temp_kernel_dir = tempfile.mkdtemp()
> +            kernel = os.path.join(self.temp_kernel_dir, 'image')
> +            dumpimage_bin = os.path.join(self.bindir_native, 'dumpimage')
> +            image_link_name = self.get('IMAGE_LINK_NAME')
> +            logger.info('Running: %s' % str([dumpimage_bin, "-o ", kernel, self.kernel]))
> +            staging_bindir_native = '%s/usr/bin' % self.get('STAGING_DIR_NATIVE')
> +            dumpimage_bin = os.path.join(staging_bindir_native, 'dumpimage')
> +            subprocess.run([dumpimage_bin, "-p", "0", "-o", kernel, self.kernel])
> +            return kernel
> +        return self.kernel
> +
>      def start_qemu(self):
>          import shlex
> -        if self.kernel:
> -            kernel_opts = "-kernel %s -append '%s %s %s %s'" % (self.kernel, self.kernel_cmdline,
> +
> +        kernel = self.dump_uimage()
> +        if kernel:
> +            kernel_opts = "-kernel %s -append '%s %s %s %s'" % (kernel, self.kernel_cmdline,
>                                                                  self.kernel_cmdline_script, self.get('QB_KERNEL_CMDLINE_APPEND'),
>                                                                  self.bootparams)

If the kernel never fails from the dup_uimage() command, why test for
it ? I don't see how the routine could return something that doesn't
pass the test. If so, aren't we going to run into more cryptic errors
(or traceback) later if there was some sort of failure.

The existing code doesn't look like it is completely error proofed
either, that just came to mind when looking at the patch.

Bruce

>              if self.bios:
> @@ -1481,6 +1498,9 @@ class BaseConfig(object):
>              shutil.rmtree(self.rootfs)
>              shutil.rmtree('%s.pseudo_state' % self.rootfs)
>
> +        if self.temp_kernel_dir:
> +            shutil.rmtree(self.temp_kernel_dir)
> +
>          self.cleaned = True
>
>      def run_bitbake_env(self, mach=None):
> --
> 2.26.3
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
