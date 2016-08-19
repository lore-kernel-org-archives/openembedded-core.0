Return-Path: <nathan@nathanrossi.com>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9263777060
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 07:52:28 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id z8so8559764ywa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 00:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EWHEiUmX3cmBAL1z313DQEQP6/IsKMSi5+r4FL7PPpE=;
	b=GEhfp3olz0cRB3MeqtBH4lgw1HnIsDxlaawgGboNT/obFD97gImaGfWgawiIZiI4bf
	yjfUkZNd/awUeEaIe66qfLdE3oBImKZjjnDGSObkmFHtVriqcE3N+IqbUxRURqWcG7Gy
	Btld/yuElZHzHskT1+oBo3NazTXhneEU0IY8eln5jWJCF0xsB4TAIFsT1HPpzri0LeK5
	Ugty492QcJWylwD7hP4XjzrA1FgJ3pHdo0MC+o0Fqof3+iJGSl37MB3DooAeY0ts/Wzo
	GvB0FiV4/2+btupJAofe+dDee0crlF6tM+Fgga8RUhGCK6kw2F5eocXkI7M5h4/QrZN5
	0j3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EWHEiUmX3cmBAL1z313DQEQP6/IsKMSi5+r4FL7PPpE=;
	b=OXFIWQ9nCN52fDs2gX56/jxUHnpyGh9MmX4Xr2SUH66wdSaLbxHvSQQh9BtuYqrvHS
	uvq7NYjB6b0hQE4Y3ZD9hFOc3tMEYaVcBAilC6CzWCgjdkUNHpCtdpRBDhwfIga7SeDW
	GpIiOsQi/347e2swoK8MQuVgcl48gQvskQRL8Q2CiXwZYsHbVq9uuZHnvtbCdnhy63tx
	7l/jLY5e5zGrHrpVX/nCE4C2iPnT7xodMwG/QcMfv+zC+uckavt/7MgBMci74JNjZbaG
	O5IhPazMiVqdX2BHpDMMyJt/rAkPc9mDA6I+EGPpaXSL9zFTGKOG90Ojde4MuykpV0+L
	79xA==
X-Gm-Message-State: AEkoouuYDo1n33cmDGJRfSpEDvVXxeNjnc0ULHyZvuSg1Tl4xJVRJ/bC/0T44etZoQ7LxQRkDY+AB9nYkK7qww==
X-Received: by 10.13.206.3 with SMTP id q3mr5190316ywd.139.1471593148660; Fri,
	19 Aug 2016 00:52:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.168.73 with HTTP; Fri, 19 Aug 2016 00:52:28 -0700 (PDT)
In-Reply-To: <0aabeafcf0db424445e40bc8bb1d91cde03e0cb7.1471589537.git.liezhi.yang@windriver.com>
References: <cover.1471589537.git.liezhi.yang@windriver.com>
	<0aabeafcf0db424445e40bc8bb1d91cde03e0cb7.1471589537.git.liezhi.yang@windriver.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Fri, 19 Aug 2016 17:52:28 +1000
Message-ID: <CA+aJhH3tmZqz-Re4m20eo=nQAA6MU1bOtc4LJbfCXR1hWceE_Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
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
X-List-Received-Date: Fri, 19 Aug 2016 07:52:29 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 19, 2016 at 4:55 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Previously, runqemu had hard coded machine knowledge, which limited its
> usage, for example, qemu can boot genericx86, but runqemu can't, we need
> edit runqemu/runqemu-internal a lot if we want to boot genericx86.
>
> Now bsp conf files can set vars to make it can be boot by runqemu, and
> qemuboot.bbclass will save these info to DEPLOY_DIR_IMAGE/qemuboot.py.
> Please see qemuboot.bbclass' comments on how to set the vars.
>

-- snip --

> +
> +
> +    def setup_slirp(self):
> +        if self.fstype == 'nfs':
> +            self.setup_nfs()
> +        if self.get('TUNE_ARCH') == 'aarch64':
> +            raise Exception("aarch64 doesn't support slirp mode")

This doesn't seem quite right? because slirp works fine with the
qemuzynqmp machine which is aarch64 (based on the patch you provided
for meta-xilinx). This looks to be specific to the qemuarm64 machine?

Regards,
Nathan

> +        self.append('KERNEL_CMDLINE_SCRIPT', ' ip=dhcp')
> +        self.rootfs_options = '-drive file=%s,if=virtio,format=raw' % self.rootfs
> +        self.set('QB_NETWORK_CMD', '')
> +
> +    def setup_tap(self):
> +        """Setup tap"""
> +
> +        # This file is created when runqemu-gen-tapdevs creates a bank of tap
> +        # devices, indicating that the user should not bring up new ones using
> +        # sudo.
> +        nosudo_flag = '/etc/runqemu-nosudo'
> +        self.qemuifup = shutil.which('runqemu-ifup')
> +        self.qemuifdown = shutil.which('runqemu-ifdown')
> +        ip = shutil.which('ip')
> +        lockdir = "/tmp/qemu-tap-locks"
> +
> +        if not (self.qemuifup and self.qemuifdown and ip):
> +            raise Exception("runqemu-ifup, runqemu-ifdown or ip not found")
> +
> +        if not os.path.exists(lockdir):
> +            os.mkdir(lockdir)
> +
> +        cmd = '%s link' % ip
> +        logger.info('Running %s...' % cmd)
> +        ip_link = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
> +        # Matches line like: 6: tap0: <foo>
> +        possibles = re.findall('^[1-9]+: +(tap[0-9]+): <.*', ip_link, re.M)
> +        tap = ""
> +        use_preconf_tap = False
> +        for p in possibles:
> +            lockfile = os.path.join(lockdir, p)
> +            if os.path.exists('%s.skip' % lockfile):
> +                logger.info('Found %s.skip, skipping %s' % (lockfile, p))
> +                continue
> +            if acquire_lock(lockfile):
> +                self.lockfile = lockfile
> +                tap = p
> +                logger.info("Using preconfigured tap device %s" % tap)
> +                logger.info("If this is not intended, touch %s.skip to make runqemu skip %s." %(lockfile, tap))
> +                use_preconf_tap = True
> +                break
> +
> +        if not tap:
> +            if os.path.exists(nosudo_flag):
> +                logger.error("Error: There are no available tap devices to use for networking,")
> +                logger.error("and I see %s exists, so I am not going to try creating" % nosudo_flag)
> +                raise Exception("a new one with sudo.")
> +
> +            gid = os.getgid()
> +            uid = os.getuid()
> +            logger.info("Setting up tap interface under sudo")
> +            cmd = 'sudo %s %s %s %s' % (self.qemuifup, uid, gid, self.get('STAGING_DIR_NATIVE'))
> +            tap = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
> +            self.cleantap = True
> +            logger.info('Created tap: %s' % tap)
> +
> +        self.tap = tap
> +        n0 = tap[3:]
> +        n1 = int(n0) * 2 + 1
> +        n2 = n1 + 1
> +        self.nfs_instance = n0
> +        if self.fstype == 'nfs':
> +            self.setup_nfs()
> +        self.append("KERNEL_CMDLINE_SCRIPT", " ip=192.168.7.%s::192.168.7.%s:255.255.255.0" % (n2, n1))
> +        qemu_tap_cmd = "-net tap,vlan=0,ifname=%s,script=no,downscript=no" % self.tap
> +        self.rootfs_options = '-drive file=%s,if=virtio,format=raw' % self.rootfs
> +        if self.get('TUNE_ARCH') == 'aarch64':
> +            qemu_network_cmd = '-netdev tap,id=net0,ifname=%s,script=no,downscript=no -device virtio-net-device,netdev=net0' % self.tap
> +            self.rootfs_options = '-drive id=disk0,file=%s,if=none,format=raw -device virtio-blk-device,drive=disk0' % self.rootfs
> +        elif self.get('TUNE_ARCH') == 'powerpc':
> +            qemu_network_cmd = '%s ' % qemu_tap_cmd
> +        else:
> +            qemu_network_cmd = "-net nic,model=virtio %s " % qemu_tap_cmd
> +        if self.vhost_enabled:
> +            qemu_network_cmd += ',vhost=on'
> +        self.weak_assign('QB_NETWORK_CMD', qemu_network_cmd)
> +
> +    def setup_network(self):
> +        cmd = "stty -g"
> +        self.saved_stty = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
> +        if self.slirp_enabled:
> +            self.setup_slirp()
> +        else:
> +            self.setup_tap()
> +
> +        if self.fstype in ('cpio.gz', 'cpio'):
> +            self.set('QB_NETWORK_CMD', '')
> +            self.kernel_cmdline = 'root=/dev/ram0 rw debugshell'
> +            self.rootfs_options = '-initrd %s' % self.rootfs
> +        else:
> +            if self.fstype in self.vmtypes:
> +                if self.fstype == 'iso':
> +                    vm_drive = '-cdrom %s' % self.rootfs
> +                else:
> +                    cmd1 = "grep -q 'root=/dev/sd' %s" % self.rootfs
> +                    cmd2 = "grep -q 'root=/dev/hd' %s" % self.rootfs
> +                    if subprocess.call(cmd1, shell=True) == 0:
> +                        logger.info('Using scsi drive')
> +                        vm_drive = '-drive if=none,id=hd,file=%s -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd' % self.rootfs
> +                    elif subprocess.call(cmd2, shell=True) == 0:
> +                        logger.info('Using scsi drive')
> +                        vm_drive = self.rootfs
> +                    else:
> +                        logger.warn("Can't detect drive type %s" % self.rootfs)
> +                        logger.warn('Tring to use virtio block drive')
> +                        vm_drive = '-drive if=virtio,file=%s' % self.rootfs
> +                self.rootfs_options = '%s -no-reboot' % vm_drive
> +            self.kernel_cmdline = 'root=%s rw highres=off' % (self.get('KERNEL_ROOT'))
> +
> +        if self.fstype == 'nfs':
> +            self.rootfs_options = ''
> +            k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server, self.nfs_dir, self.unfs_opts)
> +            self.kernel_cmdline = 'root=%s rw highres=off' % k_root
> +
> +        self.weak_assign('QB_ROOTFS_OPTIONS', self.rootfs_options)
> +
> +    def setup_final(self):
> +        qemu_system = self.get('QB_SYSTEM_NAME')
> +        if not qemu_system:
> +            raise Exception("Failed to boot, QB_SYSTEM_NAME is NULL!")
> +
> +        qemu_bin = '%s/%s' % (self.get('STAGING_BINDIR_NATIVE'), qemu_system)
> +        if not os.access(qemu_bin, os.X_OK):
> +            raise Exception("No QEMU binary '%s' could be found" % qemu_bin)
> +
> +        self.qemu_opt = "%s %s %s %s %s %s" % (qemu_bin, self.get('QB_NETWORK_CMD'), self.get('QEMU_OPT_SCRIPT'), self.get('QB_ROOTFS_OPTIONS'), self.get('QB_DTB'), self.get('QB_OPT_APPEND'))
> +
> +        if self.serialstdio:
> +            logger.info("Interrupt character is '^]'")
> +            cmd = "stty intr ^]"
> +            subprocess.call(cmd, shell=True)
> +
> +        first_serial = ""
> +        if not re.search("-nographic", self.qemu_opt):
> +            first_serial = "-serial mon:vc"
> +        # We always want a ttyS1. Since qemu by default adds a serial
> +        # port when nodefaults is not specified, it seems that all that
> +        # would be needed is to make sure a "-serial" is there. However,
> +        # it appears that when "-serial" is specified, it ignores the
> +        # default serial port that is normally added.  So here we make
> +        # sure to add two -serial if there are none. And only one if
> +        # there is one -serial already.
> +        serial_num = len(re.findall("-serial", self.qemu_opt))
> +        if serial_num == 0:
> +            self.qemu_opt += " %s %s" % (first_serial, self.get("QB_SERIAL_OPT"))
> +        elif serial_num == 1:
> +            self.qemu_opt += " %s" % self.get("QB_SERIAL_OPT")
> +
> +    def start_qemu(self):
> +        if self.kernel:
> +            kernel_opts = "-kernel %s -append '%s %s %s'" % (self.kernel, self.kernel_cmdline, self.get('KERNEL_CMDLINE_SCRIPT'), self.get('QB_KERNEL_CMDLINE_APPEND'))
> +        else:
> +            kernel_opts = ""
> +        cmd = "%s %s" % (self.qemu_opt, kernel_opts)
> +        logger.info('Running %s' % cmd)
> +        if subprocess.call(cmd, shell=True) != 0:
> +            raise Exception('Failed to run %s' % cmd)
> +
> +    def cleanup(self):
> +        if self.cleantap:
> +            cmd = 'sudo %s %s %s' % (self.qemuifdown, self.tap, self.get('STAGING_DIR_NATIVE'))
> +            logger.info('Running %s' % cmd)
> +            subprocess.call(cmd, shell=True)
> +        if self.lockfile:
> +            logger.info("Releasing lockfile of preconfigured tap device '%s'" % self.tap)
> +            release_lock(self.lockfile)
> +
> +        if self.nfs_running:
> +            logger.info("Shutting down the userspace NFS server...")
> +            cmd = "runqemu-export-rootfs stop %s" % self.nfs_dir
> +            logger.info('Running %s' % cmd)
> +            subprocess.call(cmd, shell=True)
> +
> +        if self.saved_stty:
> +            cmd = "stty %s" % self.saved_stty
> +            subprocess.call(cmd, shell=True)
> +
> +        if self.clean_nfs_dir:
> +            logger.info('Removing %s' % self.nfs_dir)
> +            shutil.rmtree(self.nfs_dir)
> +            shutil.rmtree('%s.pseudo_state' % self.nfs_dir)
> +
> +def main():
> +    if len(sys.argv) == 1 or "help" in sys.argv:
> +        print_usage()
> +        return 0
> +    config = BaseConfig()
> +    config.check_args()

When it fails to parse the args instead of showing the python
exception info (with call stack, etc), it should show the exception
message and the runqemu usage.

Regards,
Nathan

