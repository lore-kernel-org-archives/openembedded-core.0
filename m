Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C60C3DA6F
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 21:16:31 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.2212.1692825381207666405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 14:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=amZTjqkZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31c5327e5e8so153251f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692825379; x=1693430179;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GR7EtaZUKEU45djBuGPNAcfunzhYm23+W2J+jdkXBWM=;
        b=amZTjqkZOLzEL081/FcqMmBJ584LO3np/jMOHmYfW5s0sHcanMtVyZk/c+gZNwZdb3
         lcKjIlNs/sK9491D4j+L7/EGJvl1hh12i+iIh23Ka+zoa31fW0KSLptl7UE79IAsLkIs
         ubkpkbicj9hb0aBLpImE/ebJe8rvluOhC44Ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692825379; x=1693430179;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GR7EtaZUKEU45djBuGPNAcfunzhYm23+W2J+jdkXBWM=;
        b=SPqg90GcXBZ+IZ8xa4mDu9T5lkfReZtMVz7RbTWz2sgN4e1qB/sAfcRnR8e0anuih4
         e1tBwT0WEbcVhpkA2ifbTC58sJF7afh0oJtQHDwuYowPpb6/xrM5Z3mFqHRd3LRi88CV
         LqZN55hD38DFTj+48ODxuIQgwzPk92/4XRGYR7luRVArvQMr65MUMkpjjtkNZIctUhOW
         YOdm/3hkb3dX+foEQhRX8snw/Sf//B9lHs401FMOeHKvzAOKuo9VcEi1w2Fpyau0YuHk
         Oj1YVM8R/Ze/X+o3gNQQgu5T/68ovCGgVcixwXgHxfVEvLZUkVyNu0PMCkO/csLEmD0a
         6MRw==
X-Gm-Message-State: AOJu0YzHjWfKIgtWBJA4Nux0x9BCkNpLVCuSLV1cw42ptLKKcCWfKu2G
	OGSkAdXeH8/OVpa0gm88baFbVQ==
X-Google-Smtp-Source: AGHT+IGi25R/Slees2weSW1TGPhcQSgV5cOKM/uigBy6EI1HBMF1T8wO11uo0rWANx76Ibsz0JAVKQ==
X-Received: by 2002:a5d:4e89:0:b0:313:f3c0:62d8 with SMTP id e9-20020a5d4e89000000b00313f3c062d8mr13109557wru.21.1692825378966;
        Wed, 23 Aug 2023 14:16:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5461:c902:2158:9a5d? ([2001:8b0:aba:5f3c:5461:c902:2158:9a5d])
        by smtp.gmail.com with ESMTPSA id z13-20020adfec8d000000b0031c6e1ea4c7sm2426461wrn.90.2023.08.23.14.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 14:16:18 -0700 (PDT)
Message-ID: <7e5e221bc9352b2f7d7cb559ab95ad77a97001af.camel@linuxfoundation.org>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Date: Wed, 23 Aug 2023 22:16:17 +0100
In-Reply-To: <177DD39B5534099F.27837@lists.openembedded.org>
References: 
	<1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
	 <ZNt45UVb0Ps/kKLM@windriver.com>
	 <15f7e67b-afd7-7504-aa23-41a4c3cb62a1@prevas.dk>
	 <ZN7j425iXGBPbS5i@windriver.com>
	 <177DAAB2E4C3384A.4797@lists.openembedded.org>
	 <177DAFEBFB5EB0D2.24073@lists.openembedded.org>
	 <d7982e9549e8e8042dfdfdaa4f3173684aa726bb.camel@linuxfoundation.org>
	 <ZOSoIXLG7vH/GC1l@nuoska> <177DB4530EBE3FA3.24073@lists.openembedded.org>
	 <177DBC07E94591CC.4797@lists.openembedded.org>
	 <177DD0B30D8FEDF8.27837@lists.openembedded.org>
	 <177DD39B5534099F.27837@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 21:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186634

On Tue, 2023-08-22 at 23:01 +0100, Richard Purdie via
lists.openembedded.org wrote:
> so the commands are stopping mid flow for unknown reasons or the ssh
> connection fails. I can't tell if this coincides with an rcu stall or
> not. Both logs do have rcu stalls in.
>=20
> After these failures the system does continue to otherwise work
> normally and subsequent tests pass.
>=20
> I wonder if the slow emulation might be causing the networking to
> glitch and break the ssh connection.
>=20
> I'm at a bit of a loss on where from here.=20

I thought I'd update the thread with new information.

I went back to the start with this and looked again and what is going
on. Interestingly, I found one of the autobuilder workers would
consistently fail the qemuppc-alt configuration for core-image-sato-
sdk. I paused the worker and experimented.

I saw two different failures (included below). One shows systemd-udevd
timing out on it's watchdog after 3 minutes and resetting, including
taking out an ssh session running the cpio configure command. There was
no RCU stall reported.

The second failure shows systemd-logind as well as systemd-udevd with
the 3 minute time out, the kernel complaining about missed IRQs, an RCU
stall and lots of breakage following including cut ssh commands.

I could not get the cpio build test to complete.

Interestingly, I came back to the same image/worker later this evening
and now it all works fine. The difference is earlier there was a world
build running on the worker, which continued to wind down even after I
paused the worker. By the evening, that background load was no longer
present and the ppc image works in isolation. This tells us the issue
is system load dependent and only occurs on loaded systems.

I suspect I need to replicate the load and retry locally, see if I can
reliably reproduce the hang. The watchdog won't be present on sysvinit
systems which also show the issues but I'd guess there is still some
other starvation/timeout occurring.

Cheers,

Richard

Aug 23 13:23:01 qemuppc systemd[1]: sshd@4-192.168.7.4:22-192.168.7.3:59946=
.service: Deactivated successfully.
Aug 23 13:23:01 qemuppc systemd-logind[200]: Session c6 logged out. Waiting=
 for processes to exit.
Aug 23 13:23:01 qemuppc systemd[1]: Started OpenSSH Per-Connection Daemon (=
192.168.7.3:45940).
Aug 23 13:23:02 qemuppc systemd-logind[200]: Removed session c6.
Aug 23 13:23:03 qemuppc systemd-logind[200]: New session c7 of user root.
Aug 23 13:23:03 qemuppc systemd[1]: Started Session c7 of User root.
Aug 23 13:24:51 qemuppc systemd-journald[114]: Forwarding to syslog missed =
20 messages.
Aug 23 13:29:32 qemuppc systemd[1]: systemd-udevd.service: Watchdog timeout=
 (limit 3min)!
Aug 23 13:29:32 qemuppc systemd-journald[114]: Forwarding to syslog missed =
1 messages.
Aug 23 13:29:32 qemuppc systemd[1]: systemd-udevd.service: Killing process =
149 (systemd-udevd) with signal SIGABRT.
Aug 23 13:29:32 qemuppc systemd[1]: systemd-udevd.service: Main process exi=
ted, code=3Ddumped, status=3D6/ABRT
Aug 23 13:29:32 qemuppc systemd[1]: systemd-udevd.service: Failed with resu=
lt 'watchdog'.
Aug 23 13:29:33 qemuppc systemd[1]: systemd-udevd.service: Scheduled restar=
t job, restart counter is at 1.
Aug 23 13:29:34 qemuppc systemd[1]: Starting Rule-based Manager for Device =
Events and Files...
Aug 23 13:29:36 qemuppc systemd[1]: sshd@5-192.168.7.4:22-192.168.7.3:45940=
.service: Deactivated successfully.
Aug 23 13:29:36 qemuppc systemd-logind[200]: Session c7 logged out. Waiting=
 for processes to exit.
Aug 23 13:29:37 qemuppc systemd-udevd[928]: Using default interface naming =
scheme 'v253'.


Aug 23 14:26:19 qemuppc systemd[1]: Started OpenSSH Per-Connection Daemon (=
192.168.7.3:56494).
Aug 23 14:26:19 qemuppc systemd-journald[114]: Forwarding to syslog missed =
23 messages.
Aug 23 14:26:26 qemuppc systemd-logind[200]: New session c8 of user root.
Aug 23 14:26:26 qemuppc systemd[1]: Started Session c8 of User root.
Aug 23 14:27:24 qemuppc systemd-journald[114]: Forwarding to syslog missed =
2 messages.
Aug 23 14:31:51 qemuppc kernel: rcu: INFO: rcu_preempt self-detected stall =
on CPU
Aug 23 14:31:51 qemuppc kernel: rcu:         0-...!: (1 ticks this GP) idle=
=3D1a5c/1/0x40000004 softirq=3D34160/34160 fqs=3D0
Aug 23 14:31:51 qemuppc kernel:         (t=3D32552 jiffies g=3D73185 q=3D1 =
ncpus=3D1)
Aug 23 14:31:52 qemuppc kernel: rcu: rcu_preempt kthread timer wakeup didn'=
t happen for 32551 jiffies! g73185 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402
Aug 23 14:31:52 qemuppc kernel: rcu:         Possible timer handling issue =
on cpu=3D0 timer-softirq=3D26141
Aug 23 14:31:52 qemuppc kernel: rcu: rcu_preempt kthread starved for 32552 =
jiffies! g73185 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D0
Aug 23 14:31:52 qemuppc kernel: rcu:         Unless rcu_preempt kthread get=
s sufficient CPU time, OOM is now expected behavior.
Aug 23 14:31:52 qemuppc kernel: rcu: RCU grace-period kthread stack dump:
Aug 23 14:31:52 qemuppc kernel: task:rcu_preempt     state:I stack:0     pi=
d:16    ppid:2      flags:0x00000800
Aug 23 14:31:52 qemuppc kernel: Call Trace:
Aug 23 14:31:52 qemuppc kernel: [f1051cd0] [67bf4a72] 0x67bf4a72 (unreliabl=
e)
Aug 23 14:31:52 qemuppc kernel: [f1051da0] [c0d84cc4] __schedule+0x378/0x89=
0
Aug 23 14:31:52 qemuppc kernel: [f1051df0] [c0d85244] schedule+0x68/0x118
Aug 23 14:31:52 qemuppc kernel: [f1051e10] [c0d8c678] schedule_timeout+0xb0=
/0x17c
Aug 23 14:31:52 qemuppc kernel: [f1051e50] [c00d4d84] rcu_gp_fqs_loop+0x4cc=
/0x6ac
Aug 23 14:31:52 qemuppc kernel: [f1051eb0] [c00d859c] rcu_gp_kthread+0x238/=
0x284
Aug 23 14:31:52 qemuppc kernel: [f1051f00] [c008a4d0] kthread+0xfc/0x114
Aug 23 14:31:52 qemuppc kernel: [f1051f30] [c001c338] ret_from_kernel_threa=
d+0x5c/0x64
Aug 23 14:31:52 qemuppc kernel: rcu: Stack dump where RCU GP kthread last r=
an:
Aug 23 14:31:52 qemuppc kernel: CPU: 0 PID: 792 Comm: as Not tainted 6.1.46=
-yocto-standard #1
Aug 23 14:31:52 qemuppc kernel: Hardware name: PowerMac3,1 7400 0xc0209 Pow=
erMac
Aug 23 14:31:52 qemuppc kernel: NIP:  c0d8d9b4 LR: c0d8d9a4 CTR: c003d7ec
Aug 23 14:31:52 qemuppc kernel: REGS: f1005ec0 TRAP: 0900   Not tainted  (6=
.1.46-yocto-standard)
Aug 23 14:31:52 qemuppc kernel: MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 48f74f=
32  XER: 20000000
Aug 23 14:31:52 qemuppc kernel:=20
                                GPR00: c0d8d95c f1005f80 c2e36c00 00000000 =
00000001 0000003f 000039ff 00000000=20
                                GPR08: 00000000 00009032 00000100 c15ecab8 =
28f75f32 101df7bc c157abf8 c16c0000=20
                                GPR16: 000039ff c105bd2c 00000000 0000000a =
c1575840 c105bd78 c0fe710c c1583570=20
                                GPR24: c16f70a0 a7e3fa28 00000000 c16adba0 =
a7e3fa60 00000008 00000000 f1005ff0=20
Aug 23 14:31:52 qemuppc kernel: NIP [c0d8d9b4] __do_softirq+0xfc/0x394
Aug 23 14:31:52 qemuppc kernel: LR [c0d8d9a4] __do_softirq+0xec/0x394
Aug 23 14:31:52 qemuppc kernel: Call Trace:
Aug 23 14:31:52 qemuppc kernel: [f1005f80] [c0d8d95c] __do_softirq+0xa4/0x3=
94 (unreliable)
Aug 23 14:31:52 qemuppc kernel: [f1005ff0] [c000ac2c] do_softirq_own_stack+=
0x3c/0x54
Aug 23 14:31:52 qemuppc kernel: [f2f75ef0] [a7e2e000] 0xa7e2e000
Aug 23 14:31:53 qemuppc kernel: [f2f75f10] [c00641b8] irq_exit+0xe4/0x144
Aug 23 14:31:53 qemuppc kernel: [f2f75f30] [c00045b4] HardwareInterrupt_vir=
t+0x108/0x10c
Aug 23 14:31:53 qemuppc kernel: --- interrupt: 500 at 0xa7e0d668
Aug 23 14:31:53 qemuppc kernel: NIP:  a7e0d668 LR: a7e0d580 CTR: 00000000
Aug 23 14:31:53 qemuppc kernel: REGS: f2f75f40 TRAP: 0500   Not tainted  (6=
.1.46-yocto-standard)
Aug 23 14:31:53 qemuppc kernel: MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 480=
00288  XER: 20000000
Aug 23 14:31:53 qemuppc kernel:=20
                                GPR00: a7e0d580 afe57610 00000000 fffffffc =
70000027 a7e32000 6fffffff a7e2e020=20
                                GPR08: fffffef5 6ffffef5 a7e33b44 40ef66fa =
40ef63c7 101df7bc a7e3dfe0 00000000=20
                                GPR16: a7e3f954 a7e3f008 a7e3dff0 afe5778c =
afe57ca4 00001000 00000010 00000000=20
                                GPR24: 10000034 a7e3fa28 00000000 00000001 =
a7e3fa60 a7e2e000 a7e3eff0 afe57610=20
Aug 23 14:31:53 qemuppc kernel: NIP [a7e0d668] 0xa7e0d668
Aug 23 14:31:53 qemuppc kernel: LR [a7e0d580] 0xa7e0d580
Aug 23 14:31:53 qemuppc kernel: --- interrupt: 500
Aug 23 14:31:53 qemuppc kernel: Instruction dump:
Aug 23 14:31:53 qemuppc kernel: 3b1870a0 3ad6710c 3af73570 3b7bdba0 3a60000=
a 3a400000 7e238b78 4bff6f11=20
Aug 23 14:31:53 qemuppc kernel: 92540000 7d2000a6 61298000 7d200124 <7ffd00=
d0> 7fbff838 7fff0034 23ff0020=20
Aug 23 14:31:53 qemuppc kernel: CPU: 0 PID: 792 Comm: as Not tainted 6.1.46=
-yocto-standard #1
Aug 23 14:31:53 qemuppc kernel: Hardware name: PowerMac3,1 7400 0xc0209 Pow=
erMac
Aug 23 14:31:53 qemuppc kernel: NIP:  c0d8d9b4 LR: c0d8d9a4 CTR: c003d7ec
Aug 23 14:31:53 qemuppc kernel: REGS: f1005ec0 TRAP: 0900   Not tainted  (6=
.1.46-yocto-standard)
Aug 23 14:31:53 qemuppc kernel: MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 48f74f=
32  XER: 20000000
Aug 23 14:31:53 qemuppc kernel:=20
                                GPR00: c0d8d95c f1005f80 c2e36c00 00000000 =
00000001 0000003f 000039ff 00000000=20
                                GPR08: 00000000 00009032 00000100 c15ecab8 =
28f75f32 101df7bc c157abf8 c16c0000=20
                                GPR16: 000039ff c105bd2c 00000000 0000000a =
c1575840 c105bd78 c0fe710c c1583570=20
                                GPR24: c16f70a0 a7e3fa28 00000000 c16adba0 =
a7e3fa60 00000008 00000000 f1005ff0=20
Aug 23 14:31:53 qemuppc kernel: NIP [c0d8d9b4] __do_softirq+0xfc/0x394
Aug 23 14:31:53 qemuppc kernel: LR [c0d8d9a4] __do_softirq+0xec/0x394
Aug 23 14:31:54 qemuppc kernel: Call Trace:
Aug 23 14:31:54 qemuppc kernel: [f1005f80] [c0d8d95c] __do_softirq+0xa4/0x3=
94 (unreliable)
Aug 23 14:31:54 qemuppc kernel: [f1005ff0] [c000ac2c] do_softirq_own_stack+=
0x3c/0x54
Aug 23 14:31:54 qemuppc kernel: [f2f75ef0] [a7e2e000] 0xa7e2e000
Aug 23 14:31:54 qemuppc kernel: [f2f75f10] [c00641b8] irq_exit+0xe4/0x144
Aug 23 14:31:54 qemuppc kernel: [f2f75f30] [c00045b4] HardwareInterrupt_vir=
t+0x108/0x10c
Aug 23 14:31:54 qemuppc kernel: --- interrupt: 500 at 0xa7e0d668
Aug 23 14:31:54 qemuppc kernel: NIP:  a7e0d668 LR: a7e0d580 CTR: 00000000
Aug 23 14:31:54 qemuppc kernel: REGS: f2f75f40 TRAP: 0500   Not tainted  (6=
.1.46-yocto-standard)
Aug 23 14:31:54 qemuppc kernel: MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 480=
00288  XER: 20000000
Aug 23 14:31:54 qemuppc kernel:=20
                                GPR00: a7e0d580 afe57610 00000000 fffffffc =
70000027 a7e32000 6fffffff a7e2e020=20
                                GPR08: fffffef5 6ffffef5 a7e33b44 40ef66fa =
40ef63c7 101df7bc a7e3dfe0 00000000=20
                                GPR16: a7e3f954 a7e3f008 a7e3dff0 afe5778c =
afe57ca4 00001000 00000010 00000000=20
                                GPR24: 10000034 a7e3fa28 00000000 00000001 =
a7e3fa60 a7e2e000 a7e3eff0 afe57610=20
Aug 23 14:31:54 qemuppc kernel: NIP [a7e0d668] 0xa7e0d668
Aug 23 14:31:54 qemuppc kernel: LR [a7e0d580] 0xa7e0d580
Aug 23 14:31:54 qemuppc kernel: --- interrupt: 500
Aug 23 14:31:54 qemuppc kernel: Instruction dump:
Aug 23 14:31:54 qemuppc kernel: 3b1870a0 3ad6710c 3af73570 3b7bdba0 3a60000=
a 3a400000 7e238b78 4bff6f11=20
Aug 23 14:31:54 qemuppc kernel: 92540000 7d2000a6 61298000 7d200124 <7ffd00=
d0> 7fbff838 7fff0034 23ff0020=20
Aug 23 14:31:54 qemuppc kernel: irq 37: nobody cared (try booting with the =
"irqpoll" option)
Aug 23 14:31:54 qemuppc kernel: CPU: 0 PID: 792 Comm: as Not tainted 6.1.46=
-yocto-standard #1
Aug 23 14:31:54 qemuppc kernel: Hardware name: PowerMac3,1 7400 0xc0209 Pow=
erMac
Aug 23 14:31:54 qemuppc kernel: Call Trace:
Aug 23 14:31:54 qemuppc kernel: [f1005d50] [c0d54a9c] dump_stack_lvl+0x34/0=
x50 (unreliable)
Aug 23 14:31:54 qemuppc kernel: [f1005d70] [c00c0e84] __report_bad_irq+0x50=
/0x138
Aug 23 14:31:54 qemuppc kernel: [f1005da0] [c00c0d9c] note_interrupt+0x344/=
0x398
Aug 23 14:31:54 qemuppc kernel: [f1005df0] [c00bcfc8] handle_irq_event+0xb4=
/0xfc
Aug 23 14:31:54 qemuppc kernel: [f1005e10] [c00c1e74] handle_fasteoi_irq+0x=
c0/0x29c
Aug 23 14:31:54 qemuppc kernel: [f1005e30] [c00bb554] generic_handle_irq+0x=
40/0x5c
Aug 23 14:31:54 qemuppc kernel: [f1005e40] [c000a660] __do_irq+0x48/0x140
Aug 23 14:31:54 qemuppc kernel: [f1005e60] [c000aaa8] __do_IRQ+0xe0/0x11c
Aug 23 14:31:54 qemuppc kernel: [f1005e90] [c000ab18] do_IRQ+0x34/0x10c
Aug 23 14:31:54 qemuppc kernel: [f1005eb0] [c00045b4] HardwareInterrupt_vir=
t+0x108/0x10c
Aug 23 14:31:54 qemuppc kernel: --- interrupt: 500 at __do_softirq+0xfc/0x3=
94
Aug 23 14:31:54 qemuppc kernel: NIP:  c0d8d9b4 LR: c0d8d9a4 CTR: c003d7ec
Aug 23 14:31:54 qemuppc kernel: REGS: f1005ec0 TRAP: 0500   Not tainted  (6=
.1.46-yocto-standard)
Aug 23 14:31:54 qemuppc kernel: MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 48f74f=
32  XER: 20000000
Aug 23 14:31:54 qemuppc kernel:=20
                                GPR00: c0d8d95c f1005f80 c2e36c00 00000000 =
00000001 0000003f 000039ff 00000000=20
                                GPR08: 00000000 00009032 00000100 c15ecab8 =
28f75f32 101df7bc c157abf8 c16c0000=20
                                GPR16: 000039ff c105bd2c 00000000 0000000a =
c1575840 c105bd78 c0fe710c c1583570=20
                                GPR24: c16f70a0 a7e3fa28 00000000 c16adba0 =
a7e3fa60 00000008 00000000 f1005ff0=20
Aug 23 14:31:54 qemuppc kernel: NIP [c0d8d9b4] __do_softirq+0xfc/0x394
Aug 23 14:31:54 qemuppc kernel: LR [c0d8d9a4] __do_softirq+0xec/0x394
Aug 23 14:31:54 qemuppc kernel: --- interrupt: 500
Aug 23 14:31:54 qemuppc kernel: [f1005f80] [c0d8d95c] __do_softirq+0xa4/0x3=
94 (unreliable)
Aug 23 14:31:54 qemuppc kernel: [f1005ff0] [c000ac2c] do_softirq_own_stack+=
0x3c/0x54
Aug 23 14:31:54 qemuppc kernel: [f2f75ef0] [a7e2e000] 0xa7e2e000
Aug 23 14:31:54 qemuppc kernel: [f2f75f10] [c00641b8] irq_exit+0xe4/0x144
Aug 23 14:31:55 qemuppc kernel: [f2f75f30] [c00045b4] HardwareInterrupt_vir=
t+0x108/0x10c
Aug 23 14:31:55 qemuppc kernel: --- interrupt: 500 at 0xa7e0d668
Aug 23 14:31:55 qemuppc kernel: NIP:  a7e0d668 LR: a7e0d580 CTR: 00000000
Aug 23 14:31:55 qemuppc kernel: REGS: f2f75f40 TRAP: 0500   Not tainted  (6=
.1.46-yocto-standard)
Aug 23 14:31:55 qemuppc kernel: MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 480=
00288  XER: 20000000
Aug 23 14:31:55 qemuppc kernel:=20
                                GPR00: a7e0d580 afe57610 00000000 fffffffc =
70000027 a7e32000 6fffffff a7e2e020=20
                                GPR08: fffffef5 6ffffef5 a7e33b44 40ef66fa =
40ef63c7 101df7bc a7e3dfe0 00000000=20
                                GPR16: a7e3f954 a7e3f008 a7e3dff0 afe5778c =
afe57ca4 00001000 00000010 00000000=20
                                GPR24: 10000034 a7e3fa28 00000000 00000001 =
a7e3fa60 a7e2e000 a7e3eff0 afe57610=20
Aug 23 14:31:55 qemuppc kernel: NIP [a7e0d668] 0xa7e0d668
Aug 23 14:31:55 qemuppc kernel: LR [a7e0d580] 0xa7e0d580
Aug 23 14:31:55 qemuppc kernel: --- interrupt: 500
Aug 23 14:31:55 qemuppc kernel: handlers:
Aug 23 14:31:55 qemuppc kernel: [<9df35000>] pmz_interrupt
Aug 23 14:31:55 qemuppc kernel: Disabling IRQ #37
Aug 23 14:31:51 qemuppc systemd[1]: systemd-udevd.service: Watchdog timeout=
 (limit 3min)!
Aug 23 14:31:55 qemuppc systemd-journald[114]: Forwarding to syslog missed =
1 messages.
Aug 23 14:31:52 qemuppc kernel[193]: [  489.773137] rcu: INFO: rcu_preempt =
self-detected stall on CPU
Aug 23 14:31:51 qemuppc systemd[1]: systemd-udevd.service: Killing process =
148 (systemd-udevd) with signal SIGABRT.
Aug 23 14:31:52 qemuppc kernel[193]: [  489.922768] rcu:         0-...!: (1=
 ticks this GP) idle=3D1a5c/1/0x40000004 softirq=3D34160/34160 fqs=3D0
Aug 23 14:31:51 qemuppc systemd[1]: systemd-logind.service: Watchdog timeou=
t (limit 3min)!
Aug 23 14:31:52 qemuppc kernel[193]: [  489.941081]         (t=3D32552 jiff=
ies g=3D73185 q=3D1 ncpus=3D1)
Aug 23 14:31:51 qemuppc systemd[1]: systemd-logind.service: Killing process=
 200 (systemd-logind) with signal SIGABRT.
Aug 23 14:31:52 qemuppc kernel[193]: [  489.956856] rcu: rcu_preempt kthrea=
d timer wakeup didn't happen for 32551 jiffies! g73185 f0x0 RCU_GP_WAIT_FQS=
(5) ->state=3D0x402
Aug 23 14:31:51 qemuppc systemd[1]: systemd-networkd.service: Watchdog time=
out (limit 3min)!
Aug 23 14:31:52 qemuppc kernel[193]: [  489.965800] rcu:         Possible t=
imer handling issue on cpu=3D0 timer-softirq=3D26141
Aug 23 14:31:51 qemuppc systemd[1]: systemd-networkd.service: Killing proce=
ss 211 (systemd-network) with signal SIGABRT.
Aug 23 14:31:52 qemuppc kernel[193]: [  489.971042] rcu: rcu_preempt kthrea=
d starved for 32552 jiffies! g73185 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402=
 ->cpu=3D0
Aug 23 14:31:52 qemuppc systemd[1]: systemd-udevd.service: Main process exi=
ted, code=3Ddumped, status=3D6/ABRT
Aug 23 14:31:52 qemuppc kernel[193]: [  489.971295] rcu:         Unless rcu=
_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
Aug 23 14:31:52 qemuppc systemd[1]: systemd-udevd.service: Failed with resu=
lt 'watchdog'.
Aug 23 14:31:52 qemuppc kernel[193]: [  489.972612] rcu: RCU grace-period k=
thread stack dump:
Aug 23 14:31:52 qemuppc systemd[1]: systemd-udevd.service: Scheduled restar=
t job, restart counter is at 1.
Aug 23 14:31:52 qemuppc kernel[193]: [  489.984822] task:rcu_preempt     st=
ate:I stack:0     pid:16    ppid:2      flags:0x00000800
Aug 23 14:31:53 qemuppc systemd[1]: Starting Rule-based Manager for Device =
Events and Files...
Aug 23 14:31:52 qemuppc kernel[193]: [  490.027482] Call Trace:
Aug 23 14:31:53 qemuppc systemd[1]: systemd-logind.service: Main process ex=
ited, code=3Ddumped, status=3D6/ABRT
Aug 23 14:31:52 qemuppc kernel[193]: [  490.052736] [f1051cd0] [67bf4a72] 0=
x67bf4a72 (unreliable)
Aug 23 14:31:53 qemuppc systemd[1]: systemd-logind.service: Failed with res=
ult 'watchdog'.
Aug 23 14:31:52 qemuppc kernel[193]: [  490.070781] [f1051da0] [c0d84cc4] _=
_schedule+0x378/0x890
Aug 23 14:31:54 qemuppc systemd[1]: systemd-networkd.service: Main process =
exited, code=3Ddumped, status=3D6/ABRT
Aug 23 14:31:52 qemuppc kernel[193]: [  490.075515] [f1051df0] [c0d85244] s=
chedule+0x68/0x118
Aug 23 14:31:54 qemuppc systemd[1]: systemd-networkd.service: Failed with r=
esult 'watchdog'.
Aug 23 14:31:52 qemuppc kernel[193]: [  490.079545] [f1051e10] [c0d8c678] s=
chedule_timeout+0xb0/0x17c
Aug 23 14:31:54 qemuppc systemd[1]: systemd-logind.service: Scheduled resta=
rt job, restart counter is at 1.
Aug 23 14:31:52 qemuppc kernel[193]: [  490.083481] [f1051e50] [c00d4d84] r=
cu_gp_fqs_loop+0x4cc/0x6ac
Aug 23 14:31:54 qemuppc systemd[1]: systemd-networkd.service: Scheduled res=
tart job, restart counter is at 1.
Aug 23 14:31:52 qemuppc kernel[193]: [  490.083671] [f1051eb0] [c00d859c] r=
cu_gp_kthread+0x238/0x284
Aug 23 14:31:54 qemuppc systemd[1]: Starting Load Kernel Module drm...
Aug 23 14:31:52 qemuppc kernel[193]: [  490.083823] [f1051f00] [c008a4d0] k=
thread+0xfc/0x114
Aug 23 14:31:56 qemuppc systemd[1]: modprobe@drm.service: Deactivated succe=
ssfully.
Aug 23 14:31:52 qemuppc kernel[193]: [  490.083965] [f1051f30] [c001c338] r=
et_from_kernel_thread+0x5c/0x64
Aug 23 14:31:56 qemuppc systemd[1]: Finished Load Kernel Module drm.
Aug 23 14:31:52 qemuppc kernel[193]: [  490.084259] rcu: Stack dump where R=
CU GP kthread last ran:
Aug 23 14:31:56 qemuppc systemd[1]: Starting Load Kernel Module drm...
Aug 23 14:31:52 qemuppc kernel[193]: [  490.084685] CPU: 0 PID: 792 Comm: a=
s Not tainted 6.1.46-yocto-standard #1
Aug 23 14:31:52 qemuppc kernel[193]: [  490.085165] Hardware name: PowerMac=
3,1 7400 0xc0209 PowerMac
Aug 23 14:31:52 qemuppc kernel[193]: [  490.085346] NIP:  c0d8d9b4 LR: c0d8=
d9a4 CTR: c003d7ec
Aug 23 14:31:52 qemuppc kernel[193]: [  490.087556] REGS: f1005ec0 TRAP: 09=
00   Not tainted  (6.1.46-yocto-standard)
Aug 23 14:31:52 qemuppc kernel[193]: [  490.090899] MSR:  00009032 <EE,ME,I=
R,DR,RI>  CR: 48f74f32  XER: 20000000
Aug 23 14:31:52 qemuppc kernel[193]: [  490.091346]
Aug 23 14:31:52 qemuppc kernel[193]: [  490.091346] GPR00: c0d8d95c f1005f8=
0 c2e36c00 00000000 00000001 0000003f 000039ff 00000000
Aug 23 14:31:52 qemuppc kernel[193]: [  490.091346] GPR08: 00000000 0000903=
2 00000100 c15ecab8 28f75f32 101df7bc c157abf8 c16c0000
Aug 23 14:31:52 qemuppc kernel[193]: [  490.091346] GPR16: 000039ff c105bd2=
c 00000000 0000000a c1575840 c105bd78 c0fe710c c1583570
Aug 23 14:31:52 qemuppc kernel[193]: [  490.091346] GPR24: c16f70a0 a7e3fa2=
8 00000000 c16adba0 a7e3fa60 00000008 00000000 f1005ff0
Aug 23 14:31:52 qemuppc kernel[193]: [  490.096034] NIP [c0d8d9b4] __do_sof=
tirq+0xfc/0x394
Aug 23 14:31:52 qemuppc kernel[193]: [  490.096277] LR [c0d8d9a4] __do_soft=
irq+0xec/0x394
Aug 23 14:31:52 qemuppc kernel[193]: [  490.096565] Call Trace:
Aug 23 14:31:52 qemuppc kernel[193]: [  490.098486] [f1005f80] [c0d8d95c] _=
_do_softirq+0xa4/0x394 (unreliable)
Aug 23 14:31:52 qemuppc kernel[193]: [  490.098917] [f1005ff0] [c000ac2c] d=
o_softirq_own_stack+0x3c/0x54
Aug 23 14:31:52 qemuppc kernel[193]: [  490.099091] [f2f75ef0] [a7e2e000] 0=
xa7e2e000
Aug 23 14:31:52 qemuppc kernel[193]: [  490.099221] [f2f75f10] [c00641b8] i=
rq_exit+0xe4/0x144
Aug 23 14:31:52 qemuppc kernel[193]: [  490.099361] [f2f75f30] [c00045b4] H=
ardwareInterrupt_virt+0x108/0x10c
Aug 23 14:31:52 qemuppc kernel[193]: [  490.100981] --- interrupt: 500 at 0=
xa7e0d668
Aug 23 14:31:52 qemuppc kernel[193]: [  490.101119] NIP:  a7e0d668 LR: a7e0=
d580 CTR: 00000000
Aug 23 14:31:52 qemuppc kernel[193]: [  490.101237] REGS: f2f75f40 TRAP: 05=
00   Not tainted  (6.1.46-yocto-standard)
Aug 23 14:31:52 qemuppc kernel[193]: [  490.101562] MSR:  0000d032 <EE,PR,M=
E,IR,DR,RI>  CR: 48000288  XER: 20000000
Aug 23 14:31:52 qemuppc kernel[193]: [  490.103148]
Aug 23 14:31:52 qemuppc kernel[193]: [  490.103148] GPR00: a7e0d580 afe5761=
0 00000000 fffffffc 70000027 a7e32000 6fffffff a7e2e020
Aug 23 14:31:52 qemuppc kernel[193]: [  490.103148] GPR08: fffffef5 6ffffef=
5 a7e33b44 40ef66fa 40ef63c7 101df7bc a7e3dfe0 00000000
Aug 23 14:31:52 qemuppc kernel[193]: [  490.103148] GPR16: a7e3f954 a7e3f00=
8 a7e3dff0 afe5778c afe57ca4 00001000 00000010 00000000
Aug 23 14:31:52 qemuppc kernel[193]: [  490.103148] GPR24: 10000034 a7e3fa2=
8 00000000 00000001 a7e3fa60 a7e2e000 a7e3eff0 afe57610
Aug 23 14:31:52 qemuppc kernel[193]: [  490.106361] NIP [a7e0d668] 0xa7e0d6=
68
Aug 23 14:31:52 qemuppc kernel[193]: [  490.106836] LR [a7e0d580] 0xa7e0d58=
0
Aug 23 14:31:52 qemuppc kernel[193]: [  490.106981] --- interrupt: 500
Aug 23 14:31:52 qemuppc kernel[193]: [  490.107253] Instruction dump:
Aug 23 14:31:52 qemuppc kernel[193]: [  490.108681] 3b1870a0 3ad6710c 3af73=
570 3b7bdba0 3a60000a 3a400000 7e238b78 4bff6f11
Aug 23 14:31:52 qemuppc kernel[193]: [  490.109573] 92540000 7d2000a6 61298=
000 7d200124 <7ffd00d0> 7fbff838 7fff0034 23ff0020
Aug 23 14:31:52 qemuppc kernel[193]: [  490.110082] CPU: 0 PID: 792 Comm: a=
s Not tainted 6.1.46-yocto-standard #1
Aug 23 14:31:52 qemuppc kernel[193]: [  490.110249] Hardware name: PowerMac=
3,1 7400 0xc0209 PowerMac
Aug 23 14:31:52 qemuppc kernel[193]: [  490.110381] NIP:  c0d8d9b4 LR: c0d8=
d9a4 CTR: c003d7ec
Aug 23 14:31:52 qemuppc kernel[193]: [  490.112853] REGS: f1005ec0 TRAP: 09=
00   Not tainted  (6.1.46-yocto-standard)
Aug 23 14:31:52 qemuppc kernel[193]: [  490.113013] MSR:  00009032 <EE,ME,I=
R,DR,RI>  CR: 48f74f32  XER: 20000000
Aug 23 14:31:52 qemuppc kernel[193]: [  490.113248]
Aug 23 14:31:52 qemuppc kernel[193]: [  490.113248] GPR00: c0d8d95c f1005f8=
0 c2e36c00 00000000 00000001 0000003f 000039ff 00000000
Aug 23 14:31:52 qemuppc kernel[193]: [  490.113248] GPR08: 00000000 0000903=
2 00000100 c15ecab8 28f75f32 101df7bc c157abf8 c16c0000
Aug 23 14:31:52 qemuppc kernel[193]: [  490.113248] GPR16: 000039ff c105bd2=
c 00000000 0000000a c1575840 c105bd78 c0fe710c c1583570
Aug 23 14:31:52 qemuppc kernel[193]: [  490.113248] GPR24: c16f70a0 a7e3fa2=
8 00000000 c16adba0 a7e3fa60 00000008 00000000 f1005ff0
Aug 23 14:31:52 qemuppc kernel[193]: [  490.116244] NIP [c0d8d9b4] __do_sof=
tirq+0xfc/0x394
Aug 23 14:31:52 qemuppc kernel[193]: [  490.116396] LR [c0d8d9a4] __do_soft=
irq+0xec/0x394
Aug 23 14:31:52 qemuppc kernel[193]: [  490.118125] Call Trace:
Aug 23 14:31:52 qemuppc kernel[193]: [  490.118203] [f1005f80] [c0d8d95c] _=
_do_softirq+0xa4/0x394 (unreliable)
Aug 23 14:31:53 qemuppc kernel[193]: [  490.118522] [f1005ff0] [c000ac2c] d=
o_softirq_own_stack+0x3c/0x54
Aug 23 14:31:53 qemuppc kernel[193]: [  490.119250] [f2f75ef0] [a7e2e000] 0=
xa7e2e000
Aug 23 14:31:53 qemuppc kernel[193]: [  490.119388] [f2f75f10] [c00641b8] i=
rq_exit+0xe4/0x144
Aug 23 14:31:53 qemuppc kernel[193]: [  490.120203] [f2f75f30] [c00045b4] H=
ardwareInterrupt_virt+0x108/0x10c
Aug 23 14:31:53 qemuppc kernel[193]: [  490.120376] --- interrupt: 500 at 0=
xa7e0d668
Aug 23 14:31:53 qemuppc kernel[193]: [  490.121075] NIP:  a7e0d668 LR: a7e0=
d580 CTR: 00000000
Aug 23 14:31:53 qemuppc kernel[193]: [  490.121195] REGS: f2f75f40 TRAP: 05=
00   Not tainted  (6.1.46-yocto-standard)
Aug 23 14:31:53 qemuppc kernel[193]: [  490.121342] MSR:  0000d032 <EE,PR,M=
E,IR,DR,RI>  CR: 48000288  XER: 20000000
Aug 23 14:31:53 qemuppc kernel[193]: [  490.122702]
Aug 23 14:31:53 qemuppc kernel[193]: [  490.122702] GPR00: a7e0d580 afe5761=
0 00000000 fffffffc 70000027 a7e32000 6fffffff a7e2e020
Aug 23 14:31:53 qemuppc kernel[193]: [  490.122702] GPR08: fffffef5 6ffffef=
5 a7e33b44 40ef66fa 40ef63c7 101df7bc a7e3dfe0 00000000
Aug 23 14:31:53 qemuppc kernel[193]: [  490.122702] GPR16: a7e3f954 a7e3f00=
8 a7e3dff0 afe5778c afe57ca4 00001000 00000010 00000000
Aug 23 14:31:53 qemuppc kernel[193]: [  490.122702] GPR24: 10000034 a7e3fa2=
8 00000000 00000001 a7e3fa60 a7e2e000 a7e3eff0 afe57610
Aug 23 14:31:53 qemuppc kernel[193]: [  490.125554] NIP [a7e0d668] 0xa7e0d6=
68
Aug 23 14:31:53 qemuppc kernel[193]: [  490.125958] LR [a7e0d580] 0xa7e0d58=
0
Aug 23 14:31:53 qemuppc kernel[193]: [  490.126062] --- interrupt: 500
Aug 23 14:31:57 qemuppc systemd[1]: modprobe@drm.service: Deactivated succe=
ssfully.
Aug 23 14:31:53 qemuppc kernel[193]: [  490.126147] Instruction dump:
Aug 23 14:31:57 qemuppc systemd[1]: Finished Load Kernel Module drm.
Aug 23 14:31:53 qemuppc kernel[193]: [  490.126243] 3b1870a0 3ad6710c 3af73=
570 3b7bdba0 3a60000a 3a400000 7e238b78 4bff6f11
Aug 23 14:31:53 qemuppc kernel[193]: [  490.127761] 92540000 7d2000a6 61298=
000 7d200124 <7ffd00d0> 7fbff838 7fff0034 23ff0020
Aug 23 14:31:53 qemuppc kernel[193]: [  490.695839] irq 37: nobody cared (t=
ry booting with the "irqpoll" option)
Aug 23 14:31:53 qemuppc kernel[193]: [  490.701589] CPU: 0 PID: 792 Comm: a=
s Not tainted 6.1.46-yocto-standard #1
Aug 23 14:31:53 qemuppc kernel[193]: [  490.706880] Hardware name: PowerMac=
3,1 7400 0xc0209 PowerMac
Aug 23 14:31:53 qemuppc kernel[193]: [  490.711073] Call Trace:
Aug 23 14:31:53 qemuppc kernel[193]: [  490.711167] [f1005d50] [c0d54a9c] d=
ump_stack_lvl+0x34/0x50 (unreliable)
Aug 23 14:31:53 qemuppc kernel[193]: [  490.711386] [f1005d70] [c00c0e84] _=
_report_bad_irq+0x50/0x138
Aug 23 14:31:53 qemuppc kernel[193]: [  490.712536] [f1005da0] [c00c0d9c] n=
ote_interrupt+0x344/0x398
Aug 23 14:31:53 qemuppc kernel[193]: [  490.712930] [f1005df0] [c00bcfc8] h=
andle_irq_event+0xb4/0xfc
Aug 23 14:31:53 qemuppc kernel[193]: [  490.713088] [f1005e10] [c00c1e74] h=
andle_fasteoi_irq+0xc0/0x29c
Aug 23 14:31:53 qemuppc kernel[193]: [  490.713243] [f1005e30] [c00bb554] g=
eneric_handle_irq+0x40/0x5c
Aug 23 14:31:53 qemuppc kernel[193]: [  490.713393] [f1005e40] [c000a660] _=
_do_irq+0x48/0x140
Aug 23 14:31:53 qemuppc kernel[193]: [  490.715065] [f1005e60] [c000aaa8] _=
_do_IRQ+0xe0/0x11c
Aug 23 14:31:53 qemuppc kernel[193]: [  490.715221] [f1005e90] [c000ab18] d=
o_IRQ+0x34/0x10c
Aug 23 14:31:53 qemuppc kernel[193]: [  490.715362] [f1005eb0] [c00045b4] H=
ardwareInterrupt_virt+0x108/0x10c
Aug 23 14:31:53 qemuppc kernel[193]: [  490.716384] --- interrupt: 500 at _=
_do_softirq+0xfc/0x394
Aug 23 14:31:53 qemuppc kernel[193]: [  490.716876] NIP:  c0d8d9b4 LR: c0d8=
d9a4 CTR: c003d7ec
Aug 23 14:31:53 qemuppc kernel[193]: [  490.716995] REGS: f1005ec0 TRAP: 05=
00   Not tainted  (6.1.46-yocto-standard)
Aug 23 14:31:53 qemuppc kernel[193]: [  490.717369] MSR:  00009032 <EE,ME,I=
R,DR,RI>  CR: 48f74f32  XER: 20000000
Aug 23 14:31:53 qemuppc kernel[193]: [  490.719338]
Aug 23 14:31:53 qemuppc kernel[193]: [  490.719338] GPR00: c0d8d95c f1005f8=
0 c2e36c00 00000000 00000001 0000003f 000039ff 00000000
Aug 23 14:31:53 qemuppc kernel[193]: [  490.719338] GPR08: 00000000 0000903=
2 00000100 c15ecab8 28f75f32 101df7bc c157abf8 c16c0000
Aug 23 14:31:53 qemuppc kernel[193]: [  490.719338] GPR16: 000039ff c105bd2=
c 00000000 0000000a c1575840 c105bd78 c0fe710c c1583570
Aug 23 14:31:53 qemuppc kernel[193]: [  490.719338] GPR24: c16f70a0 a7e3fa2=
8 00000000 c16adba0 a7e3fa60 00000008 00000000 f1005ff0
Aug 23 14:31:57 qemuppc systemd[1]: Starting User Login Management...
Aug 23 14:31:53 qemuppc kernel[193]: [  490.721535] NIP [c0d8d9b4] __do_sof=
tirq+0xfc/0x394
Aug 23 14:31:53 qemuppc kernel[193]: [  490.722801] LR [c0d8d9a4] __do_soft=
irq+0xec/0x394
Aug 23 14:31:53 qemuppc kernel[193]: [  490.722934] --- interrupt: 500
Aug 23 14:31:53 qemuppc kernel[193]: [  490.723019] [f1005f80] [c0d8d95c] _=
_do_softirq+0xa4/0x394 (unreliable)
Aug 23 14:31:53 qemuppc kernel[193]: [  490.723197] [f1005ff0] [c000ac2c] d=
o_softirq_own_stack+0x3c/0x54
Aug 23 14:31:53 qemuppc kernel[193]: [  490.723362] [f2f75ef0] [a7e2e000] 0=
xa7e2e000
Aug 23 14:31:53 qemuppc kernel[193]: [  490.725049] [f2f75f10] [c00641b8] i=
rq_exit+0xe4/0x144
Aug 23 14:31:53 qemuppc kernel[193]: [  490.725201] [f2f75f30] [c00045b4] H=
ardwareInterrupt_virt+0x108/0x10c
Aug 23 14:31:53 qemuppc kernel[193]: [  490.725364] --- interrupt: 500 at 0=
xa7e0d668
Aug 23 14:31:53 qemuppc kernel[193]: [  490.726214] NIP:  a7e0d668 LR: a7e0=
d580 CTR: 00000000
Aug 23 14:31:53 qemuppc kernel[193]: [  490.726335] REGS: f2f75f40 TRAP: 05=
00   Not tainted  (6.1.46-yocto-standard)
Aug 23 14:31:53 qemuppc kernel[193]: [  490.726983] MSR:  0000d032 <EE,PR,M=
E,IR,DR,RI>  CR: 48000288  XER: 20000000
Aug 23 14:31:53 qemuppc kernel[193]: [  490.727233]
Aug 23 14:31:53 qemuppc kernel[193]: [  490.727233] GPR00: a7e0d580 afe5761=
0 00000000 fffffffc 70000027 a7e32000 6fffffff a7e2e020
Aug 23 14:31:53 qemuppc kernel[193]: [  490.727233] GPR08: fffffef5 6ffffef=
5 a7e33b44 40ef66fa 40ef63c7 101df7bc a7e3dfe0 00000000
Aug 23 14:31:53 qemuppc kernel[193]: [  490.727233] GPR16: a7e3f954 a7e3f00=
8 a7e3dff0 afe5778c afe57ca4 00001000 00000010 00000000
Aug 23 14:31:53 qemuppc kernel[193]: [  490.727233] GPR24: 10000034 a7e3fa2=
8 00000000 00000001 a7e3fa60 a7e2e000 a7e3eff0 afe57610
Aug 23 14:31:53 qemuppc kernel[193]: [  490.730076] NIP [a7e0d668] 0xa7e0d6=
68
Aug 23 14:31:53 qemuppc kernel[193]: [  490.731510] LR [a7e0d580] 0xa7e0d58=
0
Aug 23 14:31:53 qemuppc kernel[193]: [  490.731781] --- interrupt: 500
Aug 23 14:31:53 qemuppc kernel[193]: [  490.731930] handlers:
Aug 23 14:31:53 qemuppc kernel[193]: [  490.732058] [<9df35000>] pmz_interr=
upt
Aug 23 14:31:53 qemuppc kernel[193]: [  490.734774] Disabling IRQ #37
Aug 23 14:31:58 qemuppc systemd-udevd[801]: Using default interface naming =
scheme 'v253'.
Aug 23 14:32:00 qemuppc systemd[1]: Started Rule-based Manager for Device E=
vents and Files.
Aug 23 14:32:00 qemuppc systemd[1]: Starting Network Configuration...
Aug 23 14:32:02 qemuppc systemd-logind[835]: New seat seat0.
Aug 23 14:32:03 qemuppc systemd-logind[835]: Watching system buttons on /de=
v/input/event0 (ADB keyboard)
Aug 23 14:32:03 qemuppc systemd-logind[835]: New session c7 of user root.
Aug 23 14:32:03 qemuppc systemd-logind[835]: New session c1 of user root.
Aug 23 14:32:04 qemuppc systemd-logind[835]: New session c8 of user root.
Aug 23 14:32:04 qemuppc systemd[1]: Started User Login Management.
Aug 23 14:32:04 qemuppc systemd[1]: sshd@5-192.168.7.4:22-192.168.7.3:59072=
.service: Deactivated successfully.
Aug 23 14:32:04 qemuppc systemd-logind[835]: Session c7 logged out. Waiting=
 for processes to exit.
Aug 23 14:32:05 qemuppc systemd-networkd[838]: lo: Link UP
Aug 23 14:32:05 qemuppc systemd-networkd[838]: lo: Gained carrier
Aug 23 14:32:05 qemuppc systemd-networkd[838]: eth0: Link UP
Aug 23 14:32:05 qemuppc systemd-networkd[838]: eth0: Gained carrier
Aug 23 14:32:05 qemuppc systemd-networkd[838]: eth0: Gained IPv6LL
Aug 23 14:32:05 qemuppc systemd-networkd[838]: Enumeration completed
Aug 23 14:32:05 qemuppc systemd[1]: Started Network Configuration.
Aug 23 14:32:05 qemuppc systemd-networkd[838]: eth0: found matching network=
 '/run/systemd/network/90-eth0.network', based on potentially unpredictable=
 interface name.
Aug 23 14:32:05 qemuppc systemd-networkd[838]: eth0: Configuring with /run/=
systemd/network/90-eth0.network.
Aug 23 14:32:08 qemuppc systemd[1]: session-c7.scope: Deactivated successfu=
lly.
Aug 23 14:32:08 qemuppc systemd-logind[835]: Removed session c7.
Aug 23 14:32:18 qemuppc systemd[1]: Started OpenSSH Per-Connection Daemon (=
192.168.7.3:52348).
Aug 23 14:32:19 qemuppc systemd-logind[835]: New session c2 of user root.
Aug 23 14:32:19 qemuppc systemd[1]: Started Session c2 of User root.
Aug 23 14:32:21 qemuppc systemd[1]: sshd@7-192.168.7.4:22-192.168.7.3:52348=
.service: Deactivated successfully.
Aug 23 14:32:21 qemuppc systemd[1]: session-c2.scope: Deactivated successfu=
lly.
Aug 23 14:32:21 qemuppc systemd-logind[835]: Session c2 logged out. Waiting=
 for processes to exit.
Aug 23 14:32:21 qemuppc systemd[1]: Started OpenSSH Per-Connection Daemon (=
192.168.7.3:53128).
Aug 23 14:32:21 qemuppc systemd-logind[835]: Removed session c2.
Aug 23 14:32:23 qemuppc systemd-logind[835]: New session c3 of user root.
Aug 23 14:32:23 qemuppc systemd[1]: Started Session c3 of User root.
Aug 23 14:32:24 qemuppc systemd[1]: session-c3.scope: Deactivated successfu=
lly.
Aug 23 14:32:24 qemuppc systemd[1]: sshd@8-192.168.7.4:22-192.168.7.3:53128=
.service: Deactivated successfully.
Aug 23 14:32:24 qemuppc systemd-logind[835]: Session c3 logged out. Waiting=
 for processes to exit.
Aug 23 14:32:24 qemuppc systemd-logind[835]: Removed session c3.
Aug 23 14:32:24 qemuppc systemd[1]: Started OpenSSH Per-Connection Daemon (=
192.168.7.3:53142).
Aug 23 14:32:26 qemuppc systemd-logind[835]: New session c4 of user root.
Aug 23 14:32:26 qemuppc systemd-journald[114]: Forwarding to syslog missed =
191 messages.
Aug 23 14:32:26 qemuppc systemd[1]: Started Session c4 of User root.
Aug 23 14:32:27 qemuppc systemd[1]: sshd@9-192.168.7.4:22-192.168.7.3:53142=
.service: Deactivated successfully.
Aug 23 14:32:27 qemuppc systemd[1]: session-c4.scope: Deactivated successfu=
lly.
Aug 23 14:32:27 qemuppc systemd-logind[835]: Session c4 logged out. Waiting=
 for processes to exit.
Aug 23 14:32:27 qemuppc systemd[1]: Started OpenSSH Per-Connection Daemon (=
192.168.7.3:53152).
Aug 23 14:32:27 qemuppc systemd-logind[835]: Removed session c4.
Aug 23 14:32:29 qemuppc systemd-logind[835]: New session c5 of user root.
Aug 23 14:32:29 qemuppc systemd[1]: Started Session c5 of User root.
Aug 23 14:32:30 qemuppc systemd[1]: session-c5.scope: Deactivated successfu=
lly.
Aug 23 14:32:30 qemuppc systemd[1]: sshd@10-192.168.7.4:22-192.168.7.3:5315=
2.service: Deactivated successfully.
Aug 23 14:32:30 qemuppc systemd-logind[835]: Session c5 logged out. Waiting=
 for processes to exit.
Aug 23 14:32:30 qemuppc systemd[1]: Started OpenSSH Per-Connection Daemon (=
192.168.7.3:56798).
Aug 23 14:32:30 qemuppc systemd-logind[835]: Removed session c5.
Aug 23 14:32:33 qemuppc systemd-logind[835]: New session c6 of user root.
Aug 23 14:32:33 qemuppc systemd[1]: Started Session c6 of User root.
Aug 23 14:32:40 qemuppc systemd[1]: Started OpenSSH Per-Connection Daemon (=
192.168.7.3:36882).
Aug 23 14:32:40 qemuppc systemd[1]: session-c6.scope: Deactivated successfu=
lly.
Aug 23 14:32:40 qemuppc systemd[1]: sshd@11-192.168.7.4:22-192.168.7.3:5679=
8.service: Deactivated successfully.
Aug 23 14:32:40 qemuppc systemd-logind[835]: Session c6 logged out. Waiting=
 for processes to exit.
Aug 23 14:32:41 qemuppc systemd-logind[835]: Removed session c6.
Aug 23 14:32:46 qemuppc systemd-logind[835]: New session c7 of user root.




