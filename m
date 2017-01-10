Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7C41A6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 03:50:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 09 Jan 2017 19:50:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="28337732"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by orsmga002.jf.intel.com with ESMTP; 09 Jan 2017 19:50:37 -0800
Message-ID: <1484020237.65791.26.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Mon, 09 Jan 2017 19:50:37 -0800
In-Reply-To: <1483523017.28169.27.camel@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<66377b2510edebf997b04812ff93c9ef0bb3c47f.1482324587.git.patrick.ohly@intel.com>
	<1482968017.106950.76.camel@ranerica-desktop>
	<1483523017.28169.27.camel@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/9] runqemu: support UEFI with OVMF firmware
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
X-List-Received-Date: Tue, 10 Jan 2017 03:50:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-01-04 at 10:43 +0100, Patrick Ohly wrote:
> On Wed, 2016-12-28 at 15:33 -0800, Ricardo Neri wrote:
> > On Wed, 2016-12-21 at 14:11 +0100, Patrick Ohly wrote:
> > > +        # File name of a OVMF BIOS file, to be added with -drive
> > > if=pflash.
> > > +        # Found in the same places as the rootfs, with or without one
> > > of
> > > +        # these suffices: qcow2, bin.
> > > +        # Setting one also adds "-vga std" because that is all that
> > > +        # OVMF supports.
> > > +        self.ovmf_bios = ''
> > 
> > runqemu has the options biosdir and biosfilename. Although the log for
> > these options was lost when the script was migrated to python,
> 
> You probably mean this:
> http://git.openembedded.org/openembedded-core/commit/?id=d302f5683dd736ac4cd4b601a046d22000d41e68
> http://git.openembedded.org/openembedded-core/commit/?id=29c9e6f44541b7f8731e21e9d1a0adca9da28e37
> 
> >  the
> > motivation of adding these options was to use OVMF. It uses the -L and
> > -bios options of qemu. To my knowledge, the only custom bios at the
> > moment is OVMF. Thus, you would ponder either removing or tweaking these
> > options with your approach; which makes more sense to me.
> 
> I have no personal opinion about the usefulness of the "biosdir" and
> "biosfilename" options. Just looking at what they do, they might have
> value also when not using OVMF (for example, the "VGA BIOS" that is
> mentioned in the first commit). But if no-one is actually using these
> options, then they should indeed be removed to simplify runqemu.
> 
> The problem just is to determine whether they are used :-/ As I don't
> know, I'd prefer to keep them for now and remove them separately.

This makes sense.
> 
> Regarding the approach that I proposed for the "ovmf" file(s): what's
> your opinion about that? I was a bit worried that too much "magic" is
> involved here (special keyword that expands to files and sets -vga), but
> it is convenient and quite naturally supports additional use cases
> (explicitly selecting files at non-standard locations, separate code and
> variable files).
> 
> Regarding that last argument: in the current patch series, only the
> combined ovmf.fd gets deployed and I argued that this is sufficient. 

It would be certainly enough for me :) as in most of my use cases I
always test brand new images without any variables in it. Also, you
kindly included facilitiesto lockdown the image. I can't speak for other
people but this is more than enough for me. If you pursue this path,
perhaps you can include a big warning in the recipe saying that people
will lose their variables if they rebuild OVMF. On the other hand...

> To
> test that supporting separate code and variables also works, I've
> implemented that locally so that ovmf.fd ovmf_secboot.fd, ovmf_code.fd,
> ovmf_secboot_code.fd and ovmf_vars.fd get deployed and runqemu supports
> more than one "ovmf" parameter - this worked nicely. Full change below.

... Now that you have took the time to prototype the solution, we could
put it to use.

> 
> Now that I've implemented it, I wonder whether it would be worth
> submitting that as part of rev2 of this patch series. Any opinions?
> 
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> index ef61b16..391274b 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -125,6 +125,8 @@ do_compile_class-target() {
>      rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
>      ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER}
>      ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/OVMF.fd
> +    ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/OVMF.code.fd
> +    ln ${build_dir}/FV/OVMF_VARS.fd ${WORKDIR}/ovmf/OVMF.vars.fd
>  
>      # See CryptoPkg/Library/OpensslLib/Patch-HOWTO.txt and
>      # https://src.fedoraproject.org/cgit/rpms/edk2.git/tree/ for
> @@ -137,6 +139,7 @@ do_compile_class-target() {
>      ( cd ${S}/CryptoPkg/Library/OpensslLib/ && ./Install.sh )
>      ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER} ${OVMF_SECURE_BOOT_FLAGS}
>      ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/OVMF.secboot.fd
> +    ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/OVMF.code.secboot.fd
>      for i in Shell.efi EnrollDefaultKeys.efi; do
>          ln ${build_dir}/${OVMF_ARCH}/$i ${WORKDIR}/ovmf/$i
>      done
> @@ -170,8 +173,9 @@ do_deploy() {
>  }
>  do_deploy_class-target() {
>      # For use with "runqemu ovmf".
> -    qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/OVMF.fd ${DEPLOYDIR}/ovmf.qcow2
> -    qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/OVMF.secboot.fd ${DEPLOYDIR}/ovmf.secboot.qcow2
> +    for i in OVMF OVMF.secboot OVMF.code OVMF.vars OVMF.code.secboot; do
> +        qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/$i.fd ${DEPLOYDIR}/`echo $i | tr A-Z a-z`.qcow2

Will this preserve any previous OVMF_vars.fd that might exist in the
directory.

> +    done
>  }
>  addtask do_deploy after do_compile before do_build
>  
> diff --git a/scripts/runqemu b/scripts/runqemu
> index c8b7c8a..c3fed89 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -163,12 +163,12 @@ class BaseConfig(object):
>          self.clean_nfs_dir = False
>          self.nfs_server = ''
>          self.rootfs = ''
> -        # File name of a OVMF BIOS file, to be added with -drive if=pflash.
> +        # File name(s) of a OVMF BIOS file or variable store, to be added with -drive if=pflash.
>          # Found in the same places as the rootfs, with or without one of
>          # these suffices: qcow2, bin.
>          # Setting one also adds "-vga std" because that is all that
>          # OVMF supports.
> -        self.ovmf_bios = ''
> +        self.ovmf_bios = []
>          self.qemuboot = ''
>          self.qbconfload = False
>          self.kernel = ''
> @@ -376,13 +376,13 @@ class BaseConfig(object):
>                  self.qemu_opt_script += ' %s' % arg[len('qemuparams='):]
>              elif arg.startswith('bootparams='):
>                  self.kernel_cmdline_script += ' %s' % arg[len('bootparams='):]
> -            elif os.path.basename(arg).startswith('ovmf'):
> -                self.ovmf_bios = arg
>              elif os.path.exists(arg) or (re.search(':', arg) and re.search('/', arg)):
>                  self.check_arg_path(os.path.abspath(arg))
> -            elif re.search('-image-', arg):
> +            elif re.search('-image-', arg) or arg.endswith('-image'):
>                  # Lazy rootfs
>                  self.rootfs = arg
> +            elif os.path.basename(arg).startswith('ovmf'):
> +                self.ovmf_bios.append(arg)
>              else:
>                  # At last, assume is it the MACHINE
>                  if (not unknown_arg) or unknown_arg == arg:
> @@ -482,18 +482,18 @@ class BaseConfig(object):
>              raise Exception("Can't find rootfs: %s" % self.rootfs)
>  
>      def check_ovmf(self):
> -        """Check and set full path for OVMF BIOS file."""
> +        """Check and set full path for OVMF BIOS file(s)."""
>  
> -        if self.ovmf_bios is None or os.path.exists(self.ovmf_bios):
> -            return
> -
> -        for suffix in ('qcow2', 'bin'):
> -            ovmf_bios = '%s/%s.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.ovmf_bios, suffix)
> -            if os.path.exists(ovmf_bios):
> -                self.ovmf_bios = ovmf_bios
> -                return
> -
> -        raise Exception("Can't find OVMF BIOS: %s" % self.ovmf_bios)
> +        for index, ovmf in enumerate(self.ovmf_bios):
> +            if os.path.exists(ovmf):
> +                continue
> +            for suffix in ('qcow2', 'bin'):
> +                path = '%s/%s.%s' % (self.get('DEPLOY_DIR_IMAGE'), ovmf, suffix)
> +                if os.path.exists(path):
> +                    self.ovmf_bios[index] = path
> +                    break
> +            else:
> +                raise Exception("Can't find OVMF BIOS: %s" % ovmf)
>  
>      def check_kernel(self):
>          """Check and set kernel, dtb"""
> @@ -695,7 +695,7 @@ class BaseConfig(object):
>          else:
>              print('ROOTFS: [%s]' % self.rootfs)
>          if self.ovmf_bios:
> -            print('OVMF: [%s]' % self.ovmf_bios)
> +            print('OVMF: %s' % self.ovmf_bios)

Is there a reason to remove the brackets here?
>          print('CONFFILE: [%s]' % self.qemuboot)
>          print('')
>  
> @@ -939,9 +939,10 @@ class BaseConfig(object):
>  
>          self.qemu_opt = "%s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
>  
> +        for ovmf in self.ovmf_bios:
> +            format = ovmf.rsplit('.', 1)[-1]
> +            self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, ovmf)
>          if self.ovmf_bios:
> -            format = self.ovmf_bios.rsplit('.', 1)[-1]
> -            self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, self.ovmf_bios)
>              # OVMF only supports normal VGA, i.e. we need to override a -vga vmware
>              # that gets added for example for normal qemux86.
>              self.qemu_opt += ' -vga std'
> 
> 
I think this solution looks good as having separate file does not pose
an extra hassle in the user: the recipe builds all that is needed and
runqemu takes all that it needs. If in the future people shows an
interest in having unified images, maybe that can be added as another
PACKAGECONFIG?

Also, the usage of runqemu needs to be updated as well. Perhaps the
usage can include a note stating that code and vars are are split but no
extra action is needed.

Thanks and BR,
Ricardo
> 



