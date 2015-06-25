Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5E04605D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 09:41:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5P9fAcq020603
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 02:41:10 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Jun 2015 02:41:10 -0700
Message-ID: <558BCCB5.2050607@windriver.com>
Date: Thu, 25 Jun 2015 17:41:09 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1435224137.git.liezhi.yang@windriver.com>
	<86e000cec70be79f0bb6054bc3a8684fac87faa6.1435224137.git.liezhi.yang@windriver.com>
In-Reply-To: <86e000cec70be79f0bb6054bc3a8684fac87faa6.1435224137.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 2/2] runqemu: enable kvm when use tap under sudo
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
X-List-Received-Date: Thu, 25 Jun 2015 09:41:10 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/25/2015 05:24 PM, Robert Yang wrote:
> Enable kvm support automatically when use tap interface under sudo, the
> thought is, if sudo works well, and qemu-native has been built with kvm
> support, and kvm can be enabled, then enable it, it can be disabled by
> nokvm option.
>
> The previous command:
> $ runqemu qemux86 kvm
> may not work since it checks the current user's read/write permission on
> /dev/kvm and /dev/vhost-net but failed without sudo, it can't use sudo
> to check them since sudo is not a must, sudo is only required when need
> create tap interface, this patch can enable it automatically.
>
> Enable kvm can improve qemu's performance a lot, when test perl-5.22's
> lib/warnings.t on qemux86-64, 70 times improved.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   scripts/runqemu          |    9 +++++++--
>   scripts/runqemu-internal |   15 +++++++++++++++
>   2 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index d9e91af..926d76e 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -33,6 +33,7 @@ usage() {
>       echo "    nographic - disables video console"
>       echo "    serial - enables a serial console on /dev/ttyS0"
>       echo "    kvm - enables KVM when running qemux86/qemux86-64 (VT-capable CPU required)"
> +    echo "    nokvm - disables KVM"
>       echo "    publicvnc - enable a VNC server open to all hosts"
>       echo "  qemuparams=\"xyz\" - specify custom parameters to QEMU"
>       echo "  bootparams=\"xyz\" - specify custom kernel parameters during boot"
> @@ -68,8 +69,10 @@ SCRIPT_QEMU_OPT=""
>   SCRIPT_QEMU_EXTRA_OPT=""
>   SCRIPT_KERNEL_OPT=""
>   SERIALSTDIO=""
> -KVM_ENABLED="no"
> +KVM_ENABLED="maybe"
> +KVM_CAPABLE="`grep -q 'vmx\|svm' /proc/cpuinfo && echo 1`"
>   KVM_ACTIVE="no"
> +KVM_SUDO=""
>   GRAPHIC="yes"
>
>   # Determine whether the file is a kernel or QEMU image, and set the
> @@ -180,7 +183,9 @@ while true; do
>               ;;
>           "kvm")
>               KVM_ENABLED="yes"
> -            KVM_CAPABLE=`grep -q 'vmx\|svm' /proc/cpuinfo && echo 1`
> +            ;;
> +        "nokvm")
> +            KVM_ENABLED="no"
>               ;;
>           "slirp")
>               SLIRP_ENABLED="yes"
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index 694815f..91385ba 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -217,6 +217,19 @@ else
>                   sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT
>                   return 1
>               fi
> +
> +            # Enale kvm when possible since sudo works well, if
> +            # /usr/include/linux/kvm.h exists, qemu-native is built with kvm
> +            # support.
> +            if [ "$KVM_ENABLED" = "maybe" -a -n "$KVM_CAPABLE" -a \
> +                -e /dev/kvm -a -e /dev/vhost-net -a -f /usr/include/linux/kvm.h ] && \
> +               [ "$MACHINE" = "qemux86" -o "$MACHINE" = "qemux86-64" ]; then
> +                    echo "Enabling KVM automatically, can be disabled by nokvm option"
> +                    SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm"
> +                    KVM_ACTIVE="yes"
> +                    KVM_SUDO="sudo"
> +            fi
> +
>               LOCKFILE="$LOCKDIR/$tap"
>               echo "Acquiring lockfile for $tap..."
>               acquire_lock $LOCKFILE
> @@ -237,6 +250,7 @@ else
>               echo "Releasing lockfile of preconfigured tap device '$TAP'"
>               release_lock $LOCKFILE
>
> +

Sorry, I removed this blank line in the repo.

// Robert

>               if [ "$NFSRUNNING" = "true" ]; then
>                   echo "Shutting down the userspace NFS server..."
>                   echo "runqemu-export-rootfs stop $ROOTFS"
> @@ -685,6 +699,7 @@ if [ "x$SERIALSTDIO" = "x1" ]; then
>   fi
>
>   echo "Running $QEMU..."
> +[ -n "$KVM_SUDO" ] && QEMUBIN="$KVM_SUDO $QEMUBIN"
>   # -no-reboot is a mandatory option - see bug #100
>   if [ "$FSTYPE" = "vmdk" ]; then
>       echo $QEMUBIN $VM $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
>

