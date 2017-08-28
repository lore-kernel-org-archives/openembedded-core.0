Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F31478223
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 12:54:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7SCstD6014883
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Aug 2017 05:54:55 -0700 (PDT)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 28 Aug 2017 05:54:54 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1503787990.32591.247.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <157d0b98-436d-f536-b27e-d295f0ce0c90@windriver.com>
Date: Mon, 28 Aug 2017 08:54:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503787990.32591.247.camel@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Couple of kernel tracebacks
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
X-List-Received-Date: Mon, 28 Aug 2017 12:54:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/26/2017 06:53 PM, Richard Purdie wrote:
> Hi Bruce,
> 
> We are seeing a few teething issues which seem kernel related on the
> autobuilder. The x86 lsb build saw this traceback in the logs:

I'll start running some stress tests and see if I can get anything
to happen.

> 
> Aug 24 15:49:10 qemux86 kernel: [    8.965015]  [<c114998b>] do_wp_page+0x10b/0x670
> Aug 24 15:49:10 qemux86 kernel: [    8.965015]  [<c104ee0c>] ? kmap_atomic_prot+0x3c/0xd0
> Aug 24 15:49:10 qemux86 kernel: [    8.965015]  [<c114c2da>] handle_mm_fault+0x56a/0xb70
> Aug 24 15:49:10 qemux86 kernel: [    8.965015]  [<c11526a2>] ? mprotect_fixup+0x122/0x230
> Aug 24 15:49:10 qemux86 kernel: [    8.965015]  [<c10481d8>] __do_page_fault+0x238/0x4f0
> Aug 24 15:49:10 qemux86 kernel: [    8.965015]  [<c115286e>] ? do_mprotect_pkey+0xbe/0x240
> Aug 24 15:49:10 qemux86 kernel: [    8.965015]  [<c10484e4>] trace_do_page_fault+0x34/0x100
> Aug 24 15:49:10 qemux86 kernel: [    8.965015]  [<c100196c>] ? do_int80_syscall_32+0x5c/0xc0
> Aug 24 15:49:10 qemux86 kernel: [    8.965015]  [<c1044870>] ? kvm_pv_reboot_notify+0x30/0x30
> Aug 24 15:49:10 qemux86 kernel: [    8.965015]  [<c10448c5>] do_async_page_fault+0x55/0x70
> Aug 24 15:49:10 qemux86 kernel: [    8.965015]  [<c18bffc6>] error_code+0x5a/0x60
> Aug 24 15:49:10 qemux86 kernel: [    8.965015]  [<c1044870>] ? kvm_pv_reboot_notify+0x30/0x30
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/1200/steps/Running%20Sanity%20Tests/logs/stdio
> 
> Sadly the logs were lost before I could get a full trace out of it.
> 
> I've also seen this locally on qemuppc:
> 
>           Starting Update UTMP about System Runlevel Changes...
> [   25.580686] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery directory
> [   25.602107] NFSD: starting 90-second grace period (net c0b04278)
> [   26.388555] irq 36: nobody cared (try booting with the "irqpoll" option)
> [   26.389018] CPU: 0 PID: 287 Comm: (agetty) Not tainted 4.12.7-yocto-standard #1
> [   26.389339] Call Trace:
> [   26.389845] [cff75f20] [c00873b0] __report_bad_irq.isra.0+0x40/0x14c (unreliable)
> [   26.390319] [cff75f40] [c0087860] note_interrupt+0x320/0x374
> [   26.390548] [cff75f70] [c0084650] handle_irq_event_percpu+0x60/0x7c
> [   26.390783] [cff75f90] [c00846cc] handle_irq_event+0x60/0xac
> [   26.391012] [cff75fa0] [c0088634] handle_fasteoi_irq+0xb8/0x274
> [   26.391270] [cff75fc0] [c00831e8] generic_handle_irq+0x3c/0x58
> [   26.391498] [cff75fd0] [c0007540] __do_irq+0x58/0x188
> [   26.391698] [cff75ff0] [c0011298] call_do_irq+0x24/0x3c
> [   26.391897] [c98c1b80] [c0007720] do_IRQ+0xb0/0x164
> [   26.392135] [c98c1bb0] [c00142cc] ret_from_except+0x0/0x14
> [   26.392407] --- interrupt: 501 at pmz_set_termios+0x140/0x6fc
> [   26.392407]     LR = pmz_set_termios+0x100/0x6fc
> [   26.392751] [c98c1ca0] [c053c95c] uart_change_speed.isra.2+0x58/0x19c
> [   26.392991] [c98c1cc0] [c053d344] uart_startup.part.8+0xc0/0x1fc
> [   26.393282] [c98c1ce0] [c0521ef8] tty_port_open+0xd8/0x174
> [   26.393498] [c98c1d00] [c053b8e8] uart_open+0x44/0x60
> [   26.393703] [c98c1d10] [c05199b0] tty_open+0x140/0x500
> [   26.393910] [c98c1d60] [c01bd034] chrdev_open+0x104/0x244
> [   26.394129] [c98c1d90] [c01b2548] do_dentry_open+0x26c/0x3bc
> [   26.394365] [c98c1dc0] [c01ca03c] path_openat+0x588/0x11ec
> [   26.394583] [c98c1e50] [c01cc134] do_filp_open+0x74/0xfc
> [   26.394787] [c98c1f00] [c01b43f0] do_sys_open+0x1c0/0x270
> [   26.395006] [c98c1f40] [c0013bb4] ret_from_syscall+0x0/0x38
> [   26.395268] --- interrupt: c01 at 0xb77bf244
> [   26.395268]     LR = 0xb77bf1f0
> [   26.395524] handlers:
> [   26.395671] [<c054075c>] pmz_interrupt
> [   26.395865] Disabling IRQ #36
> 
> irq 36 is ttyS1. Not sure how to trigger this again :/.
> 
> We're also seeing qemuppc occasionally hang:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/1215/steps/Running%20Sanity%20Tests/logs/stdio
> https://autobuilder.yocto.io/builders/nightly-ppc/builds/456
> https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds/435/steps/Running%20Sanity%20Tests/logs/stdio
> 
> This has happened on multiple builders and on multiple images (sato,
> sato-sdk and I think minimal). Could be the new kernel, could be qemu
> :/. If has occurred on lsb and non-lsb ppc which makes it less kernel
> version specific I guess. For some reason I keep wanting to blame the
> IDE drivers but it is using virtio. We never get any backtrace for
> this, the log just stop dead and then we hit timeouts, it never boots
> fully in these cases. It stops after:

It could be the virtio back end interacting in ways that we've
never hit before.

I'll take another look at that IDE mess in 4.12 and see if the
driver is fixable.

Is there anyway that we could do a few runs with only virtio on
the 4.12 kernel and confirm that the hang goes away with the
lsb configuration ? That would definitely point the finger at some
sort of virtio interaction and force us into that IDE driver for
a fix.

FYI: that IDE issue is already logged in kernel.org bugzilla (by
someone else) and was reported to the mailing list. Neither the
bug or the post got any attention at all. I also tried to fix the
code and it is really detailed stuff that is going to take a few
days of study to actually understand and fix.

Bruce

> 
> [    7.131438] udevd[105]: starting version 3.2.2
> [    7.234086] udevd[106]: starting eudev-3.2.2
> 
> Mentioning this just in case you have any ideas...
> 
> Cheers,
> 
> Richard
> 


