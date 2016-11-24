Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E46071AC5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 10:29:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAOATnr2008092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Nov 2016 02:29:49 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 24 Nov 2016 02:29:48 -0800
To: Todor Minchev <todor.minchev@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20161026170559.9444-1-todor.minchev@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <af42a388-f436-73cb-1cca-a2a04595ea2d@windriver.com>
Date: Thu, 24 Nov 2016 18:29:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20161026170559.9444-1-todor.minchev@linux.intel.com>
Subject: Re: [PATCH 1/1] runqemu: add user mode (SLIRP) support to x86 QEMU targets
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
X-List-Received-Date: Thu, 24 Nov 2016 10:29:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Todor,

On 10/27/2016 01:05 AM, Todor Minchev wrote:
> Using 'slirp' as a command line option to runqemu will start QEMU
> with user mode networking instead of creating tun/tap devices.
> SLIRP does not require root access. By default port 2222 on the
> host will be mapped to port 22 in the guest. The default port
> mapping can be overwritten with the QB_SLIRP_OPT variable e.g.
>
> QB_SLIRP_OPT = "-net nic,model=e1000 -net user,hostfwd=tcp::2222-:22"
>
> Signed-off-by: Todor Minchev <todor.minchev@linux.intel.com>
> ---
>  meta/conf/machine/include/qemuboot-x86.inc | 1 +
>  scripts/runqemu                            | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
> index 06ac983..0870294 100644
> --- a/meta/conf/machine/include/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/qemuboot-x86.inc
> @@ -13,3 +13,4 @@ QB_AUDIO_OPT = "-soundhw ac97,es1370"
>  QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1"
>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>  QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
> +QB_SLIRP_OPT = "-net nic,model=e1000 -net user,hostfwd=tcp::2222-:22"

It will causes errors when multiple qemus are running:

qemu-system-x86_64: -net user,hostfwd=tcp::2222-:22: could not set up host 
forwarding rule 'tcp::2222-:22'
qemu-system-x86_64: -net user,hostfwd=tcp::2222-:22: Device 'user' could not be 
initialized

This because the port are used by another qemu. I will move these
code into runqemu, and check whether the port is available, add 1 if not
until find a usable port. Default to forward 22, and user can add other
ports.

// Robert

> diff --git a/scripts/runqemu b/scripts/runqemu
> index dbe17ab..6952f32 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -542,7 +542,8 @@ class BaseConfig(object):
>      def check_and_set(self):
>          """Check configs sanity and set when needed"""
>          self.validate_paths()
> -        check_tun()
> +        if not self.slirp_enabled:
> +            check_tun()
>          # Check audio
>          if self.audio_enabled:
>              if not self.get('QB_AUDIO_DRV'):
>

