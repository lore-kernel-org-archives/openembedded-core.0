Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 28D7760557
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 10:53:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8JArpA8012576
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Sep 2016 03:53:51 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 03:53:51 -0700
To: Joshua Lock <joshua.g.lock@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1474183984.git.liezhi.yang@windriver.com>
	<6acbaf5e46bc050d3456476aad273270b8e26dc3.1474183984.git.liezhi.yang@windriver.com>
	<1474276350.2929.8.camel@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <792eca3f-b5ff-4c96-8450-e3db32dbc7b2@windriver.com>
Date: Mon, 19 Sep 2016 18:53:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474276350.2929.8.camel@linux.intel.com>
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
X-List-Received-Date: Mon, 19 Sep 2016 10:53:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/19/2016 05:12 PM, Joshua Lock wrote:
> On Sun, 2016-09-18 at 00:39 -0700, Robert Yang wrote:
>> * Search rootfs in the following order:
>>   - IMAGE_NAME*.FSTYPE
>>   - IMAGE_LINK_NAME*.FSTYPE
>>
>> * Search kernel in the following order:
>>   - QB_DEFAULT_KERNEL
>>   - KERNEL_IMAGETYPE
>>   - KERNEL_IMAGETYPE*
>>
>> * Search dtb in the following order:
>>    - QB_DTB
>>    - QB_DTB*
>>    - *.dtb
>>
>> * Fix DTB, it should only work with "-kernel" option.
>>
>> [YOCTO #10265]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  scripts/runqemu | 68 ++++++++++++++++++++++++++++++++++-------------
>> ----------
>>  1 file changed, 41 insertions(+), 27 deletions(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 60e2093..1c4e69b 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -157,6 +157,7 @@ class BaseConfig(object):
>>          self.kernel = ''
>>          self.kernel_cmdline = ''
>>          self.kernel_cmdline_script = ''
>> +        self.dtb = ''
>>          self.fstype = ''
>>          self.kvm_enabled = False
>>          self.vhost_enabled = False
>> @@ -440,23 +441,23 @@ class BaseConfig(object):
>>          if self.fstype == 'nfs':
>>              return
>>
>> +        cmd_name = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'),
>> self.get('IMAGE_NAME'), self.fstype)
>> +        cmd_link = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'),
>> self.get('IMAGE_LINK_NAME'), self.fstype)
>> +        cmds = (cmd_name, cmd_link)
>>          if self.rootfs and not os.path.exists(self.rootfs):
>>              # Lazy rootfs
>>              self.rootfs = "%s/%s-%s.%s" %
>> (self.get('DEPLOY_DIR_IMAGE'),
>>                      self.rootfs, self.get('MACHINE'),
>>                      self.fstype)
>>          elif not self.rootfs:
>> -            cmd = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'),
>> self.get('IMAGE_NAME'), self.fstype)
>> -            all_files = glob.glob(cmd)
>> -            if all_files:
>> -                self.rootfs = all_files[0]
>> -            else:
>> -                cmd = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'),
>> self.get('IMAGE_LINK_NAME'), self.fstype)
>> +            for cmd in cmds:
>>                  all_files = glob.glob(cmd)
>>                  if all_files:
>>                      self.rootfs = all_files[0]
>> -                else:
>> -                    raise Exception("Failed to find rootfs: %s" %
>> cmd)
>> +                    break
>> +
>> +        if not self.rootfs:
>> +            raise Exception("Failed to find rootfs: %s or %s" %
>> cmds)
>>
>>          if not os.path.exists(self.rootfs):
>>              raise Exception("Can't find rootfs: %s" % self.rootfs)
>> @@ -466,28 +467,37 @@ class BaseConfig(object):
>>          # The vm image doesn't need a kernel
>>          if self.fstype in self.vmtypes:
>>              return
>> -        kernel = self.kernel
>> +
>>          deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
>> -        if not kernel:
>> -            kernel = "%s/%s" % (deploy_dir_image,
>> self.get('QB_DEFAULT_KERNEL'))
>> +        if not self.kernel:
>> +            kernel_match_name = "%s/%s" % (deploy_dir_image,
>> self.get('QB_DEFAULT_KERNEL'))
>> +            kernel_match_link = "%s/%s" % (deploy_dir_image,
>> self.get('KERNEL_IMAGETYPE'))
>> +            kernel_startswith = "%s/%s*" % (deploy_dir_image,
>> self.get('KERNEL_IMAGETYPE'))
>
> There are qemuboot.conf files in the wild which won't contain
> KERNEL_IMAGETYPE, at which point we're just looking for matches to
> DEPLOY_DIR_IMAGE or DEPLOY_DIR_IMAGE/*
>
> I think we need to add some extra handling so that we don't end up
> setting kernel to either DEPLOY_DIR_IMAGE or its first child?

Thanks, updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/rq
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rq

Joshua Lock (6):
   runqemu: add guidance to resolve issues with missing files
   qemuboot: write the full kernel filename, not the link name
   runqemu: clarify an INFO message
   qemuboot: also write the kernel link name to the conf file
   runqemu: try symlinks when kernel or rootfs can't be found
   runqemu: work even if a *.qemuboot.conf isn't found

Robert Yang (2):
   runqemu: use OECORE_NATIVE_SYSROOT from sdk
   runqemu: improve finding of rootfs, kernel and dtb

// Robert

>
> Joshua
>
>> +            cmds = (kernel_match_name, kernel_match_link,
>> kernel_startswith)
>> +            for cmd in cmds:
>> +                all_files = glob.glob(cmd)
>> +                if all_files:
>> +                    self.kernel = all_files[0]
>> +                    break
>> +            if not self.kernel:
>> +                raise Exception('KERNEL not found: %s, %s or %s' %
>> cmds)
>>
>> -        if os.path.exists(kernel):
>> -            self.kernel = kernel
>> -        else:
>> -            kernel = "%s/%s" % (deploy_dir_image,
>> self.get('KERNEL_IMAGETYPE'))
>> -            if kernel != deploy_dir_image and
>> os.path.exists(kernel):
>> -                self.kernel = kernel
>> -            else:
>> -                raise Exception("KERNEL %s not found" % kernel)
>> +        if not os.path.exists(self.kernel):
>> +            raise Exception("KERNEL %s not found" % self.kernel)
>>
>>          dtb = self.get('QB_DTB')
>>          if dtb:
>> -            dtb = "%s/%s" % (self.get('DEPLOY_DIR_IMAGE'), dtb)
>> -            if os.path.exists(dtb):
>> -                self.set('QB_DTB', '-dtb %s' % dtb)
>> -            else:
>> -                raise Exception("DTB %s not found" % dtb)
>> -
>> +            cmd_match = "%s/%s" % (deploy_dir_image, dtb)
>> +            cmd_startswith = "%s/%s*" % (deploy_dir_image, dtb)
>> +            cmd_wild = "%s/*.dtb" % deploy_dir_image
>> +            cmds = (cmd_match, cmd_startswith, cmd_wild)
>> +            for cmd in cmds:
>> +                all_files = glob.glob(cmd)
>> +                if all_files:
>> +                    self.dtb = all_files[0]
>> +                    break
>> +            if not os.path.exists(self.dtb):
>> +                raise Exception('DTB not found: %s, %s or %s' %
>> cmds)
>>
>>      def check_biosdir(self):
>>          """Check custombiosdir"""
>> @@ -643,6 +653,8 @@ class BaseConfig(object):
>>          logger.info('Continuing with the following parameters:\n')
>>          if not self.fstype in self.vmtypes:
>>              print('KERNEL: [%s]' % self.kernel)
>> +            if self.dtb:
>> +                print('DTB: [%s]' % self.dtb)
>>          print('MACHINE: [%s]' % self.get('MACHINE'))
>>          print('FSTYPE: [%s]' % self.fstype)
>>          if self.fstype  == 'nfs':
>> @@ -687,7 +699,7 @@ class BaseConfig(object):
>>                  elif os.path.exists(src2):
>>                      src = src2
>>                  if not src:
>> -                    raise Exception("No NFS_DIR is set but can't
>> find %s or %s to extract" % (src1, src2))
>> +                    raise Exception("No NFS_DIR is set, and can't
>> find %s or %s to extract" % (src1, src2))
>>                  logger.info('NFS_DIR not found, extracting %s to %s'
>> % (src, dest))
>>                  cmd = 'runqemu-extract-sdk %s %s' % (src, dest)
>>                  logger.info('Running %s...' % cmd)
>> @@ -845,7 +857,7 @@ class BaseConfig(object):
>>
>>          check_libgl(qemu_bin)
>>
>> -        self.qemu_opt = "%s %s %s %s %s %s" % (qemu_bin,
>> self.get('NETWORK_CMD'), self.qemu_opt_script,
>> self.get('ROOTFS_OPTIONS'), self.get('QB_DTB'),
>> self.get('QB_OPT_APPEND'))
>> +        self.qemu_opt = "%s %s %s %s %s" % (qemu_bin,
>> self.get('NETWORK_CMD'), self.qemu_opt_script,
>> self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
>>
>>          # Enable virtio RNG else we can run out of entropy in guests
>>          self.qemu_opt += " -device virtio-rng-pci"
>> @@ -877,6 +889,8 @@ class BaseConfig(object):
>>      def start_qemu(self):
>>          if self.kernel:
>>              kernel_opts = "-kernel %s -append '%s %s %s'" %
>> (self.kernel, self.kernel_cmdline, self.kernel_cmdline_script,
>> self.get('QB_KERNEL_CMDLINE_APPEND'))
>> +            if self.dtb:
>> +                kernel_opts += " -dtb %s" % self.dtb
>>          else:
>>              kernel_opts = ""
>>          cmd = "%s %s" % (self.qemu_opt, kernel_opts)
>> --
>> 2.9.0
>>
>

