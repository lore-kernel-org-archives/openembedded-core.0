Return-Path: <nathan@nathanrossi.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1F75171ADB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:38:30 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id j92so28313008ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 01:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BuHJqfW5jNHy4xPXacKH1imkB4f3jkBaGFSe/SzowxE=;
	b=K5+f6puIVxd7yRpSK2Itdom92fc4jh5MbDJW5RHOVS5DmcXk9/lVvpHi56/loPOTTM
	9dO0V/Vg7akYKPJRFXxqupgvI9JyzYaC3FpgbhjI0ZZlS7KvPPqypQ18yUpiv/l1YH5B
	fOJrk/n3lYp1mb3BLLlc7y51H15LqpM8NLiriPOuhNdvYdgck0Qtco+8d14FwGFnRa7p
	lGKJRVccJJgWpoituTsYIQeLfwfxSQEFlvkFMp9O+cweZ7SkgXBQ1cjqXsaLFjuROV4M
	18JcQN28FKtNEcHPAk+aUSk9bcW6uaQ+qFcPw9cF7ixex6DGT/CAMMHRUpr1oXZ2oo8b
	C/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BuHJqfW5jNHy4xPXacKH1imkB4f3jkBaGFSe/SzowxE=;
	b=WR80Iszf+n1ThcA1GlNc+0Ja2nTZCf2YIBBoxZFQX8h4NWmNo0UVPAmAz4IB2eXw1Z
	s2lpqo27QiZTDPKCxMM8RUaMUAwGyvOiv63ztG1nluAl0Tr8jA9DM4jMiw2YwNt24Zvj
	FOx9uHve8T7nS6x53zwScqqO1PAwVq9Nz0INz8Qv92IpvJ2xOwPXZIAQjo6Oo9woqdrB
	mWuUBDtxGf7wY0dwM9LP4HFJkF58XEsPmbGaEZIhZ1l/HfAtfQIltslDqnKTfpHPZLMM
	bSJ8N7hoG8XIYMKoljKq0H6NXU8WOaRShho6cdim8FV5IJVJCf5yTxf33vzT1zk2JDZ8
	TBkg==
X-Gm-Message-State: AKaTC00tSgqGA8bbrtFFGgoZO83OhIjFdiY6WT8+hJpnpnVdavrN+X+mIVaqPbYrFr4ztAq3ZgERdJ/2JgQuGg==
X-Received: by 10.36.78.196 with SMTP id r187mr5087542ita.1.1480412311813;
	Tue, 29 Nov 2016 01:38:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.30.106 with HTTP; Tue, 29 Nov 2016 01:38:30 -0800 (PST)
In-Reply-To: <bb8e7f0eeeecd6a1af5c28a716a5a0946b33e467.1480404884.git.liezhi.yang@windriver.com>
References: <cover.1480404884.git.liezhi.yang@windriver.com>
	<bb8e7f0eeeecd6a1af5c28a716a5a0946b33e467.1480404884.git.liezhi.yang@windriver.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 29 Nov 2016 19:38:30 +1000
Message-ID: <CA+aJhH3hRSCU_=gKCKxJaqCPm_V2ZbOvCeSkS1MwAxj0o7Z2DA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] runqemu: set default device and hostfwd for slirp
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
X-List-Received-Date: Tue, 29 Nov 2016 09:38:32 -0000
Content-Type: text/plain; charset=UTF-8

On 29 November 2016 at 17:35, Robert Yang <liezhi.yang@windriver.com> wrote:
> There is no network rather than lo whitout set device, so set it by
> default. And set hostfwd: 2222 -> 22, 2323 -> 23
>
> [YOCTO #7887]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/conf/machine/include/qemuboot-x86.inc |  1 -
>  meta/conf/machine/qemuarm64.conf           |  1 -
>  scripts/runqemu                            | 34 ++++++++++++++++++++++++++++--
>  3 files changed, 32 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
> index 0870294..06ac983 100644
> --- a/meta/conf/machine/include/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/qemuboot-x86.inc
> @@ -13,4 +13,3 @@ QB_AUDIO_OPT = "-soundhw ac97,es1370"
>  QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1"
>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>  QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
> -QB_SLIRP_OPT = "-net nic,model=e1000 -net user,hostfwd=tcp::2222-:22"
> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
> index df2010c..7a5570c 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -18,7 +18,6 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,38400"
>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>  QB_OPT_APPEND = "-show-cursor -device virtio-rng-pci -monitor null"
>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-device,netdev=net0,mac=@MAC@"
> -QB_SLIRP_OPT = "-netdev user,id=net0 -device virtio-net-device,netdev=net0"
>  QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
>  QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
>  QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
> diff --git a/scripts/runqemu b/scripts/runqemu
> index a10270c..7123b8f 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -147,6 +147,19 @@ def get_first_file(cmds):
>                      return f
>      return ''
>
> +def check_free_port(host, port):
> +    """ Check whether the port is free or not """
> +    import socket
> +    from contextlib import closing
> +
> +    with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as sock:
> +        if sock.connect_ex((host, port)) == 0:
> +            # Port is open, so not free
> +            return False
> +        else:
> +            # Port is not open, so free
> +            return True
> +
>  class BaseConfig(object):
>      def __init__(self):
>          # Vars can be merged with .qemuboot.conf, use a dict to manage them.
> @@ -751,14 +764,31 @@ class BaseConfig(object):
>
>          self.nfs_running = True
>
> -
>      def setup_slirp(self):
>          """Setup user networking"""
>
>          if self.fstype == 'nfs':
>              self.setup_nfs()
>          self.kernel_cmdline_script += ' ip=dhcp'
> -        self.set('NETWORK_CMD', self.get('QB_SLIRP_OPT'))
> +        # Port mapping
> +        hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
> +        qb_slirp_opt_default = "-netdev user,id=net0%s -device virtio-net-pci,netdev=net0" % hostfwd
> +        qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
> +        # Figure out the port
> +        ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
> +        ports = [int(i) for i in ports]

Should runqemu not just always supply "-netdev user,id=net0..." itself
for slirp. And qemuboot should supply only the devices, e.g. the "-dev
virtio-net-pci,netdev=net0" or "-net nic,netdev=net0". This could even
allow for consolidation of the "QB_SLIRP_OPT" and "QB_TAP_OPT" into
"QB_NETWORK".

This way runqemu would not need to do any searching/substitution and
could just build the user netdev arg itself. This would allow for easy
extension of custom forwards (e.g gdbserver, etc), and also even
setting up the in qemu user/slirp 'tftp=<dir>' server.

> +        # Find a free port to avoid conflicts
> +        for p in ports[:]:
> +            p_new = p
> +            while not check_free_port('127.0.0.1', p_new):

Should this be 'localhost', since 127.0.0.1 will only check for ipv4 listeners.

Regards,
Nathan

> +                p_new += 1
> +                while p_new in ports:
> +                        p_new += 1
> +            if p != p_new:
> +                ports.append(p_new)
> +                qb_slirp_opt = re.sub(':%s-' % p, ':%s-' % p_new, qb_slirp_opt)
> +                logger.info("Port forward changed: %s -> %s" % (p, p_new))
> +        self.set('NETWORK_CMD', qb_slirp_opt)
>
>      def setup_tap(self):
>          """Setup tap"""
> --
> 2.9.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

