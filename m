Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 612727318A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 08:21:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7J8L3uS021045
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 19 Aug 2016 01:21:06 -0700
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 19 Aug 2016 01:21:00 -0700
To: Nathan Rossi <nathan@nathanrossi.com>
References: <cover.1471589537.git.liezhi.yang@windriver.com>
	<0aabeafcf0db424445e40bc8bb1d91cde03e0cb7.1471589537.git.liezhi.yang@windriver.com>
	<CA+aJhH3tmZqz-Re4m20eo=nQAA6MU1bOtc4LJbfCXR1hWceE_Q@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <b12c5727-4592-dda5-dee4-2660d81c172b@windriver.com>
Date: Fri, 19 Aug 2016 16:20:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CA+aJhH3tmZqz-Re4m20eo=nQAA6MU1bOtc4LJbfCXR1hWceE_Q@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 8/8] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Fri, 19 Aug 2016 08:21:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/19/2016 03:52 PM, Nathan Rossi wrote:
> On Fri, Aug 19, 2016 at 4:55 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Previously, runqemu had hard coded machine knowledge, which limited its
>> usage, for example, qemu can boot genericx86, but runqemu can't, we need
>> edit runqemu/runqemu-internal a lot if we want to boot genericx86.
>>
>> Now bsp conf files can set vars to make it can be boot by runqemu, and
>> qemuboot.bbclass will save these info to DEPLOY_DIR_IMAGE/qemuboot.py.
>> Please see qemuboot.bbclass' comments on how to set the vars.
>>
>
> -- snip --
>
>> +
>> +
>> +    def setup_slirp(self):
>> +        if self.fstype == 'nfs':
>> +            self.setup_nfs()
>> +        if self.get('TUNE_ARCH') == 'aarch64':
>> +            raise Exception("aarch64 doesn't support slirp mode")
>
> This doesn't seem quite right? because slirp works fine with the
> qemuzynqmp machine which is aarch64 (based on the patch you provided
> for meta-xilinx). This looks to be specific to the qemuarm64 machine?

Yes, thanks for the testing.

When I first tested run qemuzynqmp, the following patch didn't get merged,
so it didn't work with slirp:

commit e5c6a78db46192800669f1b392351f6b52f3e20c
Author:     Alistair Francis <alistair.francis@xilinx.com>
AuthorDate: Wed Jun 15 13:43:23 2016 -0700
Commit:     Richard Purdie <richard.purdie@linuxfoundation.org>
CommitDate: Wed Aug 10 10:45:32 2016 +0100

     runqemu: qemuzynqmp: Add Linux boot support

     Add support to direct boot Linux instead of just booting u-boot.


And for qemuarm64, the old code:
QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no 
-device virtio-net-device,netdev=net0 "

It hardcoded TAP, and didn't work with slirp when I tested it, so I
added the checking to avoid unexpected errors. Does anyone know how
to boot qemuarm64 by slirp, please ?

I tested "runqemu qemuzynqmp slirp" just now, it works, so I will remove
this checking in the repo.

For further work, if there are more bsps which can not be boot by slirp,
maybe we can add a var like QB_SLIRP_SUPPORTED = "0" or "1", and default
to 1, if the bsp sets '0' then error out.

Removed the checking, and updated in the repo:

         if self.get('TUNE_ARCH') == 'aarch64':
             raise Exception("aarch64 doesn't support slirp mode")

// Robert

>
> Regards,
> Nathan
>
>> +        self.append('KERNEL_CMDLINE_SCRIPT', ' ip=dhcp')
>> +        self.rootfs_options = '-drive file=%s,if=virtio,format=raw' % self.rootfs
>> +        self.set('QB_NETWORK_CMD', '')
>> +
>> +    def setup_tap(self):
>> +        """Setup tap"""
>> +
>> +        # This file is created when runqemu-gen-tapdevs creates a bank of tap
>> +        # devices, indicating that the user should not bring up new ones using
>> +        # sudo.
>> +        nosudo_flag = '/etc/runqemu-nosudo'
>> +        self.qemuifup = shutil.which('runqemu-ifup')
>> +        self.qemuifdown = shutil.which('runqemu-ifdown')
>> +        ip = shutil.which('ip')
>> +        lockdir = "/tmp/qemu-tap-locks"
>> +
>> +        if not (self.qemuifup and self.qemuifdown and ip):
>> +            raise Exception("runqemu-ifup, runqemu-ifdown or ip not found")
>> +
>> +        if not os.path.exists(lockdir):
>> +            os.mkdir(lockdir)
>> +
>> +        cmd = '%s link' % ip
>> +        logger.info('Running %s...' % cmd)
>> +        ip_link = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
>> +        # Matches line like: 6: tap0: <foo>
>> +        possibles = re.findall('^[1-9]+: +(tap[0-9]+): <.*', ip_link, re.M)
>> +        tap = ""
>> +        use_preconf_tap = False
>> +        for p in possibles:
>> +            lockfile = os.path.join(lockdir, p)
>> +            if os.path.exists('%s.skip' % lockfile):
>> +                logger.info('Found %s.skip, skipping %s' % (lockfile, p))
>> +                continue
>> +            if acquire_lock(lockfile):
>> +                self.lockfile = lockfile
>> +                tap = p
>> +                logger.info("Using preconfigured tap device %s" % tap)
>> +                logger.info("If this is not intended, touch %s.skip to make runqemu skip %s." %(lockfile, tap))
>> +                use_preconf_tap = True
>> +                break
>> +
>> +        if not tap:
>> +            if os.path.exists(nosudo_flag):
>> +                logger.error("Error: There are no available tap devices to use for networking,")
>> +                logger.error("and I see %s exists, so I am not going to try creating" % nosudo_flag)
>> +                raise Exception("a new one with sudo.")
>> +
>> +            gid = os.getgid()
>> +            uid = os.getuid()
>> +            logger.info("Setting up tap interface under sudo")
>> +            cmd = 'sudo %s %s %s %s' % (self.qemuifup, uid, gid, self.get('STAGING_DIR_NATIVE'))
>> +            tap = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
>> +            self.cleantap = True
>> +            logger.info('Created tap: %s' % tap)
>> +
>> +        self.tap = tap
>> +        n0 = tap[3:]
>> +        n1 = int(n0) * 2 + 1
>> +        n2 = n1 + 1
>> +        self.nfs_instance = n0
>> +        if self.fstype == 'nfs':
>> +            self.setup_nfs()
>> +        self.append("KERNEL_CMDLINE_SCRIPT", " ip=192.168.7.%s::192.168.7.%s:255.255.255.0" % (n2, n1))
>> +        qemu_tap_cmd = "-net tap,vlan=0,ifname=%s,script=no,downscript=no" % self.tap
>> +        self.rootfs_options = '-drive file=%s,if=virtio,format=raw' % self.rootfs
>> +        if self.get('TUNE_ARCH') == 'aarch64':
>> +            qemu_network_cmd = '-netdev tap,id=net0,ifname=%s,script=no,downscript=no -device virtio-net-device,netdev=net0' % self.tap
>> +            self.rootfs_options = '-drive id=disk0,file=%s,if=none,format=raw -device virtio-blk-device,drive=disk0' % self.rootfs
>> +        elif self.get('TUNE_ARCH') == 'powerpc':
>> +            qemu_network_cmd = '%s ' % qemu_tap_cmd
>> +        else:
>> +            qemu_network_cmd = "-net nic,model=virtio %s " % qemu_tap_cmd
>> +        if self.vhost_enabled:
>> +            qemu_network_cmd += ',vhost=on'
>> +        self.weak_assign('QB_NETWORK_CMD', qemu_network_cmd)
>> +
>> +    def setup_network(self):
>> +        cmd = "stty -g"
>> +        self.saved_stty = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
>> +        if self.slirp_enabled:
>> +            self.setup_slirp()
>> +        else:
>> +            self.setup_tap()
>> +
>> +        if self.fstype in ('cpio.gz', 'cpio'):
>> +            self.set('QB_NETWORK_CMD', '')
>> +            self.kernel_cmdline = 'root=/dev/ram0 rw debugshell'
>> +            self.rootfs_options = '-initrd %s' % self.rootfs
>> +        else:
>> +            if self.fstype in self.vmtypes:
>> +                if self.fstype == 'iso':
>> +                    vm_drive = '-cdrom %s' % self.rootfs
>> +                else:
>> +                    cmd1 = "grep -q 'root=/dev/sd' %s" % self.rootfs
>> +                    cmd2 = "grep -q 'root=/dev/hd' %s" % self.rootfs
>> +                    if subprocess.call(cmd1, shell=True) == 0:
>> +                        logger.info('Using scsi drive')
>> +                        vm_drive = '-drive if=none,id=hd,file=%s -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd' % self.rootfs
>> +                    elif subprocess.call(cmd2, shell=True) == 0:
>> +                        logger.info('Using scsi drive')
>> +                        vm_drive = self.rootfs
>> +                    else:
>> +                        logger.warn("Can't detect drive type %s" % self.rootfs)
>> +                        logger.warn('Tring to use virtio block drive')
>> +                        vm_drive = '-drive if=virtio,file=%s' % self.rootfs
>> +                self.rootfs_options = '%s -no-reboot' % vm_drive
>> +            self.kernel_cmdline = 'root=%s rw highres=off' % (self.get('KERNEL_ROOT'))
>> +
>> +        if self.fstype == 'nfs':
>> +            self.rootfs_options = ''
>> +            k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server, self.nfs_dir, self.unfs_opts)
>> +            self.kernel_cmdline = 'root=%s rw highres=off' % k_root
>> +
>> +        self.weak_assign('QB_ROOTFS_OPTIONS', self.rootfs_options)
>> +
>> +    def setup_final(self):
>> +        qemu_system = self.get('QB_SYSTEM_NAME')
>> +        if not qemu_system:
>> +            raise Exception("Failed to boot, QB_SYSTEM_NAME is NULL!")
>> +
>> +        qemu_bin = '%s/%s' % (self.get('STAGING_BINDIR_NATIVE'), qemu_system)
>> +        if not os.access(qemu_bin, os.X_OK):
>> +            raise Exception("No QEMU binary '%s' could be found" % qemu_bin)
>> +
>> +        self.qemu_opt = "%s %s %s %s %s %s" % (qemu_bin, self.get('QB_NETWORK_CMD'), self.get('QEMU_OPT_SCRIPT'), self.get('QB_ROOTFS_OPTIONS'), self.get('QB_DTB'), self.get('QB_OPT_APPEND'))
>> +
>> +        if self.serialstdio:
>> +            logger.info("Interrupt character is '^]'")
>> +            cmd = "stty intr ^]"
>> +            subprocess.call(cmd, shell=True)
>> +
>> +        first_serial = ""
>> +        if not re.search("-nographic", self.qemu_opt):
>> +            first_serial = "-serial mon:vc"
>> +        # We always want a ttyS1. Since qemu by default adds a serial
>> +        # port when nodefaults is not specified, it seems that all that
>> +        # would be needed is to make sure a "-serial" is there. However,
>> +        # it appears that when "-serial" is specified, it ignores the
>> +        # default serial port that is normally added.  So here we make
>> +        # sure to add two -serial if there are none. And only one if
>> +        # there is one -serial already.
>> +        serial_num = len(re.findall("-serial", self.qemu_opt))
>> +        if serial_num == 0:
>> +            self.qemu_opt += " %s %s" % (first_serial, self.get("QB_SERIAL_OPT"))
>> +        elif serial_num == 1:
>> +            self.qemu_opt += " %s" % self.get("QB_SERIAL_OPT")
>> +
>> +    def start_qemu(self):
>> +        if self.kernel:
>> +            kernel_opts = "-kernel %s -append '%s %s %s'" % (self.kernel, self.kernel_cmdline, self.get('KERNEL_CMDLINE_SCRIPT'), self.get('QB_KERNEL_CMDLINE_APPEND'))
>> +        else:
>> +            kernel_opts = ""
>> +        cmd = "%s %s" % (self.qemu_opt, kernel_opts)
>> +        logger.info('Running %s' % cmd)
>> +        if subprocess.call(cmd, shell=True) != 0:
>> +            raise Exception('Failed to run %s' % cmd)
>> +
>> +    def cleanup(self):
>> +        if self.cleantap:
>> +            cmd = 'sudo %s %s %s' % (self.qemuifdown, self.tap, self.get('STAGING_DIR_NATIVE'))
>> +            logger.info('Running %s' % cmd)
>> +            subprocess.call(cmd, shell=True)
>> +        if self.lockfile:
>> +            logger.info("Releasing lockfile of preconfigured tap device '%s'" % self.tap)
>> +            release_lock(self.lockfile)
>> +
>> +        if self.nfs_running:
>> +            logger.info("Shutting down the userspace NFS server...")
>> +            cmd = "runqemu-export-rootfs stop %s" % self.nfs_dir
>> +            logger.info('Running %s' % cmd)
>> +            subprocess.call(cmd, shell=True)
>> +
>> +        if self.saved_stty:
>> +            cmd = "stty %s" % self.saved_stty
>> +            subprocess.call(cmd, shell=True)
>> +
>> +        if self.clean_nfs_dir:
>> +            logger.info('Removing %s' % self.nfs_dir)
>> +            shutil.rmtree(self.nfs_dir)
>> +            shutil.rmtree('%s.pseudo_state' % self.nfs_dir)
>> +
>> +def main():
>> +    if len(sys.argv) == 1 or "help" in sys.argv:
>> +        print_usage()
>> +        return 0
>> +    config = BaseConfig()
>> +    config.check_args()
>
> When it fails to parse the args instead of showing the python
> exception info (with call stack, etc), it should show the exception
> message and the runqemu usage.
>
> Regards,
> Nathan
>

