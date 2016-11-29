Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED2A771B09
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 10:12:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uATACQW8005339
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Nov 2016 02:12:26 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 29 Nov 2016 02:12:26 -0800
To: Nathan Rossi <nathan@nathanrossi.com>
References: <cover.1480404884.git.liezhi.yang@windriver.com>
	<bb8e7f0eeeecd6a1af5c28a716a5a0946b33e467.1480404884.git.liezhi.yang@windriver.com>
	<CA+aJhH3hRSCU_=gKCKxJaqCPm_V2ZbOvCeSkS1MwAxj0o7Z2DA@mail.gmail.com>
	<CA+aJhH02s7v86ax=SHX1w3xzwRt61tbzf7CLFtKjro=qacBJ0w@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <a66565c7-cb8d-a789-09d0-2fdfd9dbe6f7@windriver.com>
Date: Tue, 29 Nov 2016 18:12:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CA+aJhH02s7v86ax=SHX1w3xzwRt61tbzf7CLFtKjro=qacBJ0w@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2016 10:12:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/29/2016 05:54 PM, Nathan Rossi wrote:
> On 29 November 2016 at 19:38, Nathan Rossi <nathan@nathanrossi.com> wrote:
>> On 29 November 2016 at 17:35, Robert Yang <liezhi.yang@windriver.com> wrote:
>>> There is no network rather than lo whitout set device, so set it by
>>> default. And set hostfwd: 2222 -> 22, 2323 -> 23
>>>
>>> [YOCTO #7887]
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>  meta/conf/machine/include/qemuboot-x86.inc |  1 -
>>>  meta/conf/machine/qemuarm64.conf           |  1 -
>>>  scripts/runqemu                            | 34 ++++++++++++++++++++++++++++--
>>>  3 files changed, 32 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
>>> index 0870294..06ac983 100644
>>> --- a/meta/conf/machine/include/qemuboot-x86.inc
>>> +++ b/meta/conf/machine/include/qemuboot-x86.inc
>>> @@ -13,4 +13,3 @@ QB_AUDIO_OPT = "-soundhw ac97,es1370"
>>>  QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1"
>>>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>>>  QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
>>> -QB_SLIRP_OPT = "-net nic,model=e1000 -net user,hostfwd=tcp::2222-:22"
>>> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
>>> index df2010c..7a5570c 100644
>>> --- a/meta/conf/machine/qemuarm64.conf
>>> +++ b/meta/conf/machine/qemuarm64.conf
>>> @@ -18,7 +18,6 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,38400"
>>>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>>>  QB_OPT_APPEND = "-show-cursor -device virtio-rng-pci -monitor null"
>>>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-device,netdev=net0,mac=@MAC@"
>>> -QB_SLIRP_OPT = "-netdev user,id=net0 -device virtio-net-device,netdev=net0"
>>>  QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
>>>  QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
>>>  QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
>>> diff --git a/scripts/runqemu b/scripts/runqemu
>>> index a10270c..7123b8f 100755
>>> --- a/scripts/runqemu
>>> +++ b/scripts/runqemu
>>> @@ -147,6 +147,19 @@ def get_first_file(cmds):
>>>                      return f
>>>      return ''
>>>
>>> +def check_free_port(host, port):
>>> +    """ Check whether the port is free or not """
>>> +    import socket
>>> +    from contextlib import closing
>>> +
>>> +    with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as sock:
>>> +        if sock.connect_ex((host, port)) == 0:
>>> +            # Port is open, so not free
>>> +            return False
>>> +        else:
>>> +            # Port is not open, so free
>>> +            return True
>>> +
>>>  class BaseConfig(object):
>>>      def __init__(self):
>>>          # Vars can be merged with .qemuboot.conf, use a dict to manage them.
>>> @@ -751,14 +764,31 @@ class BaseConfig(object):
>>>
>>>          self.nfs_running = True
>>>
>>> -
>>>      def setup_slirp(self):
>>>          """Setup user networking"""
>>>
>>>          if self.fstype == 'nfs':
>>>              self.setup_nfs()
>>>          self.kernel_cmdline_script += ' ip=dhcp'
>>> -        self.set('NETWORK_CMD', self.get('QB_SLIRP_OPT'))
>>> +        # Port mapping
>>> +        hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
>>> +        qb_slirp_opt_default = "-netdev user,id=net0%s -device virtio-net-pci,netdev=net0" % hostfwd
>>> +        qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
>>> +        # Figure out the port
>>> +        ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
>>> +        ports = [int(i) for i in ports]
>>
>> Should runqemu not just always supply "-netdev user,id=net0..." itself
>> for slirp. And qemuboot should supply only the devices, e.g. the "-dev
>> virtio-net-pci,netdev=net0" or "-net nic,netdev=net0". This could even
>> allow for consolidation of the "QB_SLIRP_OPT" and "QB_TAP_OPT" into
>> "QB_NETWORK".
>
> Just saw this patch was an updated version of
> https://patchwork.openembedded.org/patch/134399/ which was doing
> similar to what I suggested above. (I read this patch before the other
> one linked)
>
> Maybe QB_SLIRP_OPT and QB_TAP_OPT should provide overrides for the
> -netdev user/tap, and if a BSP/etc needs to overwrite them it can. But
> the "-net"/"-device" is provided as a separate QB_NETWORK variable.
> This would allow for BSPs to take advantage of the default netdev
> user/tap args that runqemu provides without needing to specify any of
> the forwards/etc. And would also allow for backwards compatibility
> with current BSP QB_* setups.

Hi Nathan,

I have to go now, will reply later after more thinking.

// Robert

>
> Regards,
> Nathan
>
>>
>> This way runqemu would not need to do any searching/substitution and
>> could just build the user netdev arg itself. This would allow for easy
>> extension of custom forwards (e.g gdbserver, etc), and also even
>> setting up the in qemu user/slirp 'tftp=<dir>' server.
>>
>>> +        # Find a free port to avoid conflicts
>>> +        for p in ports[:]:
>>> +            p_new = p
>>> +            while not check_free_port('127.0.0.1', p_new):
>>
>> Should this be 'localhost', since 127.0.0.1 will only check for ipv4 listeners.
>>
>> Regards,
>> Nathan
>>
>>> +                p_new += 1
>>> +                while p_new in ports:
>>> +                        p_new += 1
>>> +            if p != p_new:
>>> +                ports.append(p_new)
>>> +                qb_slirp_opt = re.sub(':%s-' % p, ':%s-' % p_new, qb_slirp_opt)
>>> +                logger.info("Port forward changed: %s -> %s" % (p, p_new))
>>> +        self.set('NETWORK_CMD', qb_slirp_opt)
>>>
>>>      def setup_tap(self):
>>>          """Setup tap"""
>>> --
>>> 2.9.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

