Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA3965CB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 09:12:32 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 19 Sep 2016 02:12:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,361,1470726000"; d="scan'208";a="11212985"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.23.129])
	by orsmga004.jf.intel.com with ESMTP; 19 Sep 2016 02:12:31 -0700
Message-ID: <1474276350.2929.8.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 10:12:30 +0100
In-Reply-To: <6acbaf5e46bc050d3456476aad273270b8e26dc3.1474183984.git.liezhi.yang@windriver.com>
References: <cover.1474183984.git.liezhi.yang@windriver.com>
	<6acbaf5e46bc050d3456476aad273270b8e26dc3.1474183984.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH V2 8/8] runqemu: improve finding of rootfs, kernel and dtb
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
X-List-Received-Date: Mon, 19 Sep 2016 09:12:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2016-09-18 at 00:39 -0700, Robert Yang wrote:
> * Search rootfs in the following order:
>   - IMAGE_NAME*.FSTYPE
>   - IMAGE_LINK_NAME*.FSTYPE
> 
> * Search kernel in the following order:
>   - QB_DEFAULT_KERNEL
>   - KERNEL_IMAGETYPE
>   - KERNEL_IMAGETYPE*
> 
> * Search dtb in the following order:
>    - QB_DTB
>    - QB_DTB*
>    - *.dtb
> 
> * Fix DTB, it should only work with "-kernel" option.
> 
> [YOCTO #10265]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  scripts/runqemu | 68 ++++++++++++++++++++++++++++++++++-------------
> ----------
>  1 file changed, 41 insertions(+), 27 deletions(-)
> 
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 60e2093..1c4e69b 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -157,6 +157,7 @@ class BaseConfig(object):
>          self.kernel = ''
>          self.kernel_cmdline = ''
>          self.kernel_cmdline_script = ''
> +        self.dtb = ''
>          self.fstype = ''
>          self.kvm_enabled = False
>          self.vhost_enabled = False
> @@ -440,23 +441,23 @@ class BaseConfig(object):
>          if self.fstype == 'nfs':
>              return
>  
> +        cmd_name = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'),
> self.get('IMAGE_NAME'), self.fstype)
> +        cmd_link = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'),
> self.get('IMAGE_LINK_NAME'), self.fstype)
> +        cmds = (cmd_name, cmd_link)
>          if self.rootfs and not os.path.exists(self.rootfs):
>              # Lazy rootfs
>              self.rootfs = "%s/%s-%s.%s" %
> (self.get('DEPLOY_DIR_IMAGE'),
>                      self.rootfs, self.get('MACHINE'),
>                      self.fstype)
>          elif not self.rootfs:
> -            cmd = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'),
> self.get('IMAGE_NAME'), self.fstype)
> -            all_files = glob.glob(cmd)
> -            if all_files:
> -                self.rootfs = all_files[0]
> -            else:
> -                cmd = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'),
> self.get('IMAGE_LINK_NAME'), self.fstype)
> +            for cmd in cmds:
>                  all_files = glob.glob(cmd)
>                  if all_files:
>                      self.rootfs = all_files[0]
> -                else:
> -                    raise Exception("Failed to find rootfs: %s" %
> cmd)
> +                    break
> +
> +        if not self.rootfs:
> +            raise Exception("Failed to find rootfs: %s or %s" %
> cmds)
>  
>          if not os.path.exists(self.rootfs):
>              raise Exception("Can't find rootfs: %s" % self.rootfs)
> @@ -466,28 +467,37 @@ class BaseConfig(object):
>          # The vm image doesn't need a kernel
>          if self.fstype in self.vmtypes:
>              return
> -        kernel = self.kernel
> +
>          deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
> -        if not kernel:
> -            kernel = "%s/%s" % (deploy_dir_image,
> self.get('QB_DEFAULT_KERNEL'))
> +        if not self.kernel:
> +            kernel_match_name = "%s/%s" % (deploy_dir_image,
> self.get('QB_DEFAULT_KERNEL'))
> +            kernel_match_link = "%s/%s" % (deploy_dir_image,
> self.get('KERNEL_IMAGETYPE'))
> +            kernel_startswith = "%s/%s*" % (deploy_dir_image,
> self.get('KERNEL_IMAGETYPE'))

There are qemuboot.conf files in the wild which won't contain
KERNEL_IMAGETYPE, at which point we're just looking for matches to
DEPLOY_DIR_IMAGE or DEPLOY_DIR_IMAGE/*

I think we need to add some extra handling so that we don't end up
setting kernel to either DEPLOY_DIR_IMAGE or its first child?

Joshua

> +            cmds = (kernel_match_name, kernel_match_link,
> kernel_startswith)
> +            for cmd in cmds:
> +                all_files = glob.glob(cmd)
> +                if all_files:
> +                    self.kernel = all_files[0]
> +                    break
> +            if not self.kernel:
> +                raise Exception('KERNEL not found: %s, %s or %s' %
> cmds)
>  
> -        if os.path.exists(kernel):
> -            self.kernel = kernel
> -        else:
> -            kernel = "%s/%s" % (deploy_dir_image,
> self.get('KERNEL_IMAGETYPE'))
> -            if kernel != deploy_dir_image and
> os.path.exists(kernel):
> -                self.kernel = kernel
> -            else:
> -                raise Exception("KERNEL %s not found" % kernel)
> +        if not os.path.exists(self.kernel):
> +            raise Exception("KERNEL %s not found" % self.kernel)
>  
>          dtb = self.get('QB_DTB')
>          if dtb:
> -            dtb = "%s/%s" % (self.get('DEPLOY_DIR_IMAGE'), dtb)
> -            if os.path.exists(dtb):
> -                self.set('QB_DTB', '-dtb %s' % dtb)
> -            else:
> -                raise Exception("DTB %s not found" % dtb)
> -
> +            cmd_match = "%s/%s" % (deploy_dir_image, dtb)
> +            cmd_startswith = "%s/%s*" % (deploy_dir_image, dtb)
> +            cmd_wild = "%s/*.dtb" % deploy_dir_image
> +            cmds = (cmd_match, cmd_startswith, cmd_wild)
> +            for cmd in cmds:
> +                all_files = glob.glob(cmd)
> +                if all_files:
> +                    self.dtb = all_files[0]
> +                    break
> +            if not os.path.exists(self.dtb):
> +                raise Exception('DTB not found: %s, %s or %s' %
> cmds)
>  
>      def check_biosdir(self):
>          """Check custombiosdir"""
> @@ -643,6 +653,8 @@ class BaseConfig(object):
>          logger.info('Continuing with the following parameters:\n')
>          if not self.fstype in self.vmtypes:
>              print('KERNEL: [%s]' % self.kernel)
> +            if self.dtb:
> +                print('DTB: [%s]' % self.dtb)
>          print('MACHINE: [%s]' % self.get('MACHINE'))
>          print('FSTYPE: [%s]' % self.fstype)
>          if self.fstype  == 'nfs':
> @@ -687,7 +699,7 @@ class BaseConfig(object):
>                  elif os.path.exists(src2):
>                      src = src2
>                  if not src:
> -                    raise Exception("No NFS_DIR is set but can't
> find %s or %s to extract" % (src1, src2))
> +                    raise Exception("No NFS_DIR is set, and can't
> find %s or %s to extract" % (src1, src2))
>                  logger.info('NFS_DIR not found, extracting %s to %s'
> % (src, dest))
>                  cmd = 'runqemu-extract-sdk %s %s' % (src, dest)
>                  logger.info('Running %s...' % cmd)
> @@ -845,7 +857,7 @@ class BaseConfig(object):
>  
>          check_libgl(qemu_bin)
>  
> -        self.qemu_opt = "%s %s %s %s %s %s" % (qemu_bin,
> self.get('NETWORK_CMD'), self.qemu_opt_script,
> self.get('ROOTFS_OPTIONS'), self.get('QB_DTB'),
> self.get('QB_OPT_APPEND'))
> +        self.qemu_opt = "%s %s %s %s %s" % (qemu_bin,
> self.get('NETWORK_CMD'), self.qemu_opt_script,
> self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
>  
>          # Enable virtio RNG else we can run out of entropy in guests
>          self.qemu_opt += " -device virtio-rng-pci"
> @@ -877,6 +889,8 @@ class BaseConfig(object):
>      def start_qemu(self):
>          if self.kernel:
>              kernel_opts = "-kernel %s -append '%s %s %s'" %
> (self.kernel, self.kernel_cmdline, self.kernel_cmdline_script,
> self.get('QB_KERNEL_CMDLINE_APPEND'))
> +            if self.dtb:
> +                kernel_opts += " -dtb %s" % self.dtb
>          else:
>              kernel_opts = ""
>          cmd = "%s %s" % (self.qemu_opt, kernel_opts)
> -- 
> 2.9.0
> 

