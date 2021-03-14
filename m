Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web09.602.1615758907802822457
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 14:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=juyczrsA;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id l132so29956935qke.7
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 14:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GBBcOGT7r1C9mEo9YrsdIvDcFM3E5MUP8NPapf4PRHM=;
        b=juyczrsA1CBZkVP5HG3fl3RTPr0iOnMO2QkMkoH4wPoo4kX2hToqQI+DLmhGPziaZg
         oMTPU47EJDj5aDxeBztxdSz6uInZgonGH0bMd98TbQfhk1gHc84R3BcUz9ZM5AKm7QiO
         YF86Glavvh9J9IYTbuWTwD28WzIFoVEGsJUhZ4FTI5oRBH5M17Cbh4D7TsnX2M8DpCUH
         +j+QfpG9riAEzTU5YXh5xB87nHqSPrghPXRoJ6sF4a0QzPRiktZX7+Z3+OokxSvWubNc
         Li0n44lC6NR7JkgnD9td6F2g+TPNxSf3HT8LKOnpG06EfvgRU7zKVFkc1hD+5FnQGKJd
         YTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GBBcOGT7r1C9mEo9YrsdIvDcFM3E5MUP8NPapf4PRHM=;
        b=sMz5sJtse5VfqEcJ89+7D7HkWVETLqlxmTIoGiV9klFQa1C5JsC1WDx5qnkWYd6Zn2
         VeEYC2zDFiP6wei6hFPPN7zT2+WfJqeBo9y6JM0lVYkPVBwQ6gN+zW6ehXWfuRfrhFPE
         dHW1COiOEfqCB0Y/IItHTKz1kqCjvvDO26aWQQQCThLlhh7sQRawe3J4CP2uSmvz502p
         VnYBou1VKfMI7gSMvkmsgkzuxZ7U/OoChDuHhXbfe+ghAHlPdHrm3mZ9zE8Rzoy83OPU
         qYBn9UKI+J3mF4LjYh0WZCB4KXhJDs4r+gs7ibW3x2Vp+y6ngQ7fXE4l42tHdhJpY6U4
         kQCw==
X-Gm-Message-State: AOAM533JhgFSktmoWQYCSxHaqd8sUUWKOnsLrAIa/hBbOUTnoV2LrxqU
	/SxC7RDlVyu5dMA5KMnB3HiVWiqEwkwWVkWp3I8=
X-Google-Smtp-Source: ABdhPJz3tVEennwQU5EV+Ll16fEOn2Flmkv235YvkAkzD4VzI2VtqGhye7qCRiwpVW5yUtinSDK14t8s6B+qXq+5dOs=
X-Received: by 2002:a05:620a:124f:: with SMTP id a15mr22206737qkl.125.1615758906838;
 Sun, 14 Mar 2021 14:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210310230533.30268-1-jdmason@kudzu.us> <20210310230533.30268-3-jdmason@kudzu.us>
In-Reply-To: <20210310230533.30268-3-jdmason@kudzu.us>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 14 Mar 2021 14:54:40 -0700
Message-ID: <CAMKF1srLw2zRGk11Q_3o0kfw7MCyCuJr75u92BsRvkL6UC-AmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] runqemu: modify novga to conform to documentation
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 3:05 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> Passing 'novga' only adds '-vga none' to the qemu commandline and does
> not prevent other vga devices from being added, contrary to the
> documentation/help.  Clean-up the vga logic and add the ability to
> prevent other vga devices from being added.
>

I traced a weston image failure in -ctestimage to this commit. after
this commit -vga none is passed when
runqemu nographic

is used. This means qemu won't be exporting any graphics devices and
as a result weston wont start since it needs some graphics emulation.
this use to work in past,

> Signed-off-by: Jon Mason <jon.mason@arm.com>
> Change-Id: I7ff8f9f3e419ce8bae3f3847d75f9275ca30406a
> ---
>  scripts/runqemu | 86 +++++++++++++++++++++++++++++++------------------
>  1 file changed, 55 insertions(+), 31 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 842509eb145f..df4ee21d5316 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -174,6 +174,13 @@ class BaseConfig(object):
>          self.nfs_running = False
>          self.serialconsole = False
>          self.serialstdio = False
> +        self.nographic = False
> +        self.sdl = False
> +        self.gtk = False
> +        self.gl = False
> +        self.gl_es = False
> +        self.egl_headless = False
> +        self.novga = False
>          self.cleantap = False
>          self.saved_stty = ''
>          self.audio_enabled = False
> @@ -460,38 +467,19 @@ class BaseConfig(object):
>              if arg in self.fstypes + self.vmtypes + self.wictypes:
>                  self.check_arg_fstype(arg)
>              elif arg == 'nographic':
> -                if ('sdl' in sys.argv):
> -                    raise RunQemuError('Option nographic makes no sense alongside the sdl option.' % (arg))
> -                if ('gtk' in sys.argv):
> -                    raise RunQemuError('Option nographic makes no sense alongside the gtk option.' % (arg))
> -                self.qemu_opt_script += ' -nographic'
> +                self.nographic = True
>              elif arg == 'sdl':
> -                if 'gl' in sys.argv[1:]:
> -                    self.set_dri_path()
> -                    self.qemu_opt_script += ' -vga virtio -display sdl,gl=on,show-cursor=on'
> -                elif 'gl-es' in sys.argv[1:]:
> -                    self.set_dri_path()
> -                    self.qemu_opt_script += ' -vga virtio -display sdl,gl=es,show-cursor=on'
> -                else:
> -                    self.qemu_opt_script += ' -display sdl,show-cursor=on'
> +                self.sdl = True
>              elif arg == 'gtk':
> -                if 'gl' in sys.argv[1:]:
> -                    self.set_dri_path()
> -                    self.qemu_opt_script += ' -vga virtio -display gtk,gl=on,show-cursor=on'
> -                elif 'gl-es' in sys.argv[1:]:
> -                    self.set_dri_path()
> -                    self.qemu_opt_script += ' -vga virtio -display gtk,gl=es,show-cursor=on'
> -                else:
> -                    self.qemu_opt_script += ' -display gtk,show-cursor=on'
> -            elif arg == 'gl' or arg == 'gl-es':
> -                # These args are handled inside sdl or gtk blocks above
> -                if ('gtk' not in sys.argv) and ('sdl' not in sys.argv):
> -                    raise RunQemuError('Option %s also needs gtk or sdl option.' % (arg))
> +                self.gtk = True
> +            elif arg == 'gl':
> +                self.gl = True
> +            elif 'gl-es' in sys.argv[1:]:
> +                self.gl_es = True
>              elif arg == 'egl-headless':
> -                self.set_dri_path()
> -                self.qemu_opt_script += ' -vga virtio -display egl-headless,show-cursor=on'
> +                self.egl_headless = True
>              elif arg == 'novga':
> -                self.qemu_opt_script += ' -vga none'
> +                self.novga = True
>              elif arg == 'serial':
>                  self.serialconsole = True
>              elif arg == "serialstdio":
> @@ -1319,13 +1307,48 @@ class BaseConfig(object):
>              raise RunQemuError("Failed to boot, QB_SYSTEM_NAME is NULL!")
>          self.qemu_system = qemu_system
>
> +    def setup_vga(self):
> +        if self.nographic == True:
> +            if self.sdl == True:
> +                raise RunQemuError('Option nographic makes no sense alongside the sdl option.')
> +            if self.gtk == True:
> +                raise RunQemuError('Option nographic makes no sense alongside the gtk option.')
> +            self.qemu_opt += ' -nographic'
> +            return
> +
> +        if self.novga == True:
> +            self.qemu_opt += ' -vga none'
> +            return
> +
> +        if (self.gl_es == True or self.gl == True) and (self.sdl == False and self.gtk == False):
> +            raise RunQemuError('Option gl/gl-es needs gtk or sdl option.')
> +
> +        if self.sdl == True or self.gtk == True or self.egl_headless == True:
> +            self.set_dri_path()
> +            self.qemu_opt += ' -vga virtio -display '
> +            if self.egl_headless == True:
> +                self.qemu_opt += 'egl-headless,'
> +            else:
> +                if self.sdl == True:
> +                    self.qemu_opt += 'sdl,'
> +                elif self.gtk == True:
> +                    self.qemu_opt += 'gtk,'
> +
> +                if self.gl == True:
> +                    self.qemu_opt += 'gl=on,'
> +                elif self.gl_es == True:
> +                    self.qemu_opt += 'gl=es,'
> +            self.qemu_opt += 'show-cursor=on'
> +
> +        self.qemu_opt += ' %s' %self.get('QB_GRAPHICS')
> +
>      def setup_serial(self):
>          # Setup correct kernel command line for serial
> -        if self.serialstdio == True or self.serialconsole == True or re.search("-nographic", self.qemu_opt) or self.tcpserial_portnum:
> +        if self.serialstdio == True or self.serialconsole == True or self.nographic == True or self.tcpserial_portnum:
>              for entry in self.get('SERIAL_CONSOLES').split(' '):
>                  self.kernel_cmdline_script += ' console=%s' %entry.split(';')[1]
>
> -        if self.serialstdio == True or re.search("-nographic", self.qemu_opt):
> +        if self.serialstdio == True or self.nographic == True:
>              self.qemu_opt += " -serial mon:stdio"
>          else:
>              self.qemu_opt += " -serial mon:vc"
> @@ -1364,7 +1387,7 @@ class BaseConfig(object):
>          if not os.access(qemu_bin, os.X_OK):
>              raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
>
> -        self.qemu_opt = "%s %s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('QB_RNG'), self.get('QB_GRAPHICS'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
> +        self.qemu_opt = "%s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('QB_RNG'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
>
>          for ovmf in self.ovmf_bios:
>              format = ovmf.rsplit('.', 1)[-1]
> @@ -1389,6 +1412,7 @@ class BaseConfig(object):
>              self.qemu_opt += " -snapshot"
>
>          self.setup_serial()
> +        self.setup_vga()
>
>      def start_qemu(self):
>          import shlex
> --
> 2.20.1
>
>
> 
>
