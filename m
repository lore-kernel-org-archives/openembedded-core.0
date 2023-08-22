Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EE8EE4993
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 11:07:47 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.5555.1692702462471709908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 04:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X8RFEOvp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fef56f7223so11926595e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 04:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692702461; x=1693307261;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y+tc/Wf2ASsMinXPfgbeNxxo6VnVhWqdK470vuPC0MU=;
        b=X8RFEOvpy/d8csyMlSti8xUuldv7fJT+SVexdZsRLnWAgcE1nyNPhflP72IUnVfLgs
         noEp+wA1zAMmu0l9Tn4T5bTbbwG+T1paEnApRZU2X+5mMegjvl3u3VQNR0XrymRd/uBT
         uzDG6b67VU+KDh/MxN6J+Jv3UfXglrsoBxcYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692702461; x=1693307261;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+tc/Wf2ASsMinXPfgbeNxxo6VnVhWqdK470vuPC0MU=;
        b=aeuQeVo/9urjmDP1QrTctqMWh1pVjsKDMFjTER62cIslh8t/+JjArxZvux/3weqGR7
         SSM1u8uoTWqOlNbzCisM8gMbv8J0yTcWjdF7bzVY9NYtaYP8CbKmJ1f+4LnsNVC2RhLl
         BK34VVwzyEovCz1dFWJqpFy/pzasge1/w93eXZb5+Ci77f/Li5tVFmeKRdQEwsFWf1Tr
         60Kvcv03BNdWaijcVPmBh1+wcbsmGeuSj5Nuu+QwMXnaJ1k7npDGGNYdazgp2rJAFJvr
         B5Nz+Flvh03PblzcWEbJq5bdPH6IuNm8jZ7Y8LQYlle3UFPuevXGZt2RPl8UHKIJUcQx
         7zbw==
X-Gm-Message-State: AOJu0YxfvXbfImwNPcnwXn5U+z1AaQq/K0+f9ZSfniuV+mpRONrG16G3
	nhiNWiETIp0Rpb3sh8ez4ICU3w==
X-Google-Smtp-Source: AGHT+IGn55+ixbfzWYvdrN0M4ltho6TBd/Tde+GCeQAQt0+d3nwixFvXjXWWeZfVOdZFapERvt1ipw==
X-Received: by 2002:a5d:4683:0:b0:319:6f0e:fc0e with SMTP id u3-20020a5d4683000000b003196f0efc0emr7197235wrq.30.1692702460701;
        Tue, 22 Aug 2023 04:07:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb4c:c27c:35e6:14a1? ([2001:8b0:aba:5f3c:eb4c:c27c:35e6:14a1])
        by smtp.gmail.com with ESMTPSA id v6-20020a7bcb46000000b003fbb25da65bsm15683160wmj.30.2023.08.22.04.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 04:07:40 -0700 (PDT)
Message-ID: <9d7db958518678b98e3f8d3b437de9889770e379.camel@linuxfoundation.org>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
	Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 22 Aug 2023 12:07:39 +0100
In-Reply-To: <177DAAB2E4C3384A.4797@lists.openembedded.org>
References: 
	<1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
	 <ZNt45UVb0Ps/kKLM@windriver.com>
	 <15f7e67b-afd7-7504-aa23-41a4c3cb62a1@prevas.dk>
	 <ZN7j425iXGBPbS5i@windriver.com>
	 <177DAAB2E4C3384A.4797@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 11:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186503

On Tue, 2023-08-22 at 10:31 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2023-08-17 at 23:22 -0400, Paul Gortmaker wrote:
> > [Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)] O=
n 16/08/2023 (Wed 09:55) Rasmus Villemoes wrote:
> >=20
> > > On 15/08/2023 15.08, Paul Gortmaker via lists.openembedded.org wrote:
> > > > [Dilemma on changes - merge or not to merge (e.g. 6.4)] On 14/08/20=
23 (Mon 10:54) Richard Purdie wrote:
> > > >=20
> > > > > Remaining are:
> > > > >   * an error upon boot on preempt-rt on qemux86-64
> > > > >      (e.g. https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/72/builds/7616/steps/36/logs/stdio)
> > > > >      We'll probably just have to ignore it in parselogs as it has=
 been??
> > > > >      around for a while and nobody seems interested in fixing it =
upstream.
> > > >=20
> > > > Just back from vacation and I see an internal report of 10-ish at b=
oot
> > >=20
> > > it seems to be rate-limited to 10 per boot, so it should never appear
> > > more than those 10ish times:
> > >=20
> > > static bool report_idle_softirq(void)
> > > {
> > > ...
> > >         if (ratelimit >=3D 10)
> > >                 return false;
> > > ...
> > >         ratelimit++;
> > > ...
> >=20
> > Amusingly enough - you were looking right at the problem.  Just a few
> > stable kernels ago, it was inadvertently ratelimited to zero.  :-P
> >=20
> > https://lists.openembedded.org/g/openembedded-core/message/186343
>=20
> Thanks for tracking this down and the subsequent fix. Sadly it didn't
> lead us to a magic fix everywhere but it is good to have it resolved
> and we can drop the "ignore the error" patch.
>=20
> I've been poking at this qemuppc issue which is now affecting both 6.1
> *and* 6.4 on the autobuilder. It seems pretty consistent that "bitbake
> core-image-sato-sdk -c testimage" for qemuppc generates rcu tracebacks
> and/or hangs when trying to configure/compile cpio in the image. It
> usually only gets as far as configure.
>=20
> I'd swear this is a new thing that just started happening so it is
> likely something that was backported to both 6.1 and 6.4 stable series.
> How likely is it the same bug would get backported to both at once? ;-)
>=20
> On the autobuilder, "qemuppc-altcfg" is building 6.1.46 and "qemuppc"
> is building 6.4.11 and both hang.
>=20
> I tried locally and was able to reproduce it first try. After 10 mins
> of testimage, I could ssh into the image and see the rcu stall:
>=20
>=20
>    16.638778] systemd-journald[113]: Received client request to flush run=
time journal.
> [  540.762141] rcu: INFO: rcu_preempt self-detected stall on CPU
> [  540.772535] rcu: 	0-...!: (1 ticks this GP) idle=3D71e4/1/0x40000002 s=
oftirq=3D73154/73154 fqs=3D0
> [  540.773036] 	(t=3D6104 jiffies g=3D177277 q=3D1 ncpus=3D1)
> [  540.773334] rcu: rcu_preempt kthread timer wakeup didn't happen for 61=
03 jiffies! g177277 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402
> [  540.773390] rcu: 	Possible timer handling issue on cpu=3D0 timer-softi=
rq=3D50723
> [  540.773480] rcu: rcu_preempt kthread starved for 6104 jiffies! g177277=
 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D0
> [  540.773529] rcu: 	Unless rcu_preempt kthread gets sufficient CPU time,=
 OOM is now expected behavior.
> [  540.773580] rcu: RCU grace-period kthread stack dump:
> [  540.773687] task:rcu_preempt     state:I stack:0     pid:16    ppid:2 =
     flags:0x00000800
> [  540.774731] Call Trace:
> [  540.774927] [f1051da0] [c0d84cc4] __schedule+0x378/0x890
> [  540.775876] [f1051df0] [c0d85244] schedule+0x68/0x118
> [  540.775964] [f1051e10] [c0d8c678] schedule_timeout+0xb0/0x17c
> [  540.776012] [f1051e50] [c00d4d84] rcu_gp_fqs_loop+0x4cc/0x6ac
> [  540.776057] [f1051eb0] [c00d859c] rcu_gp_kthread+0x238/0x284
> [  540.776100] [f1051f00] [c008a4d0] kthread+0xfc/0x114
> [  540.776144] [f1051f30] [c001c338] ret_from_kernel_thread+0x5c/0x64
> [  540.776248] rcu: Stack dump where RCU GP kthread last ran:
> [  540.776462] CPU: 0 PID: 3161 Comm: cc1 Not tainted 6.1.46-yocto-standa=
rd #1
> [  540.776797] Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
> [  540.776866] NIP:  a7a9f67c LR: a7a9f67c CTR: 00000040
> [  540.776914] REGS: f3a25f40 TRAP: 0900   Not tainted  (6.1.46-yocto-sta=
ndard)
> [  540.776987] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 28000284  XER: 200=
00000
> [  540.777230]=20
>                GPR00: a7aa7a9c af9a2660 00000000 00000000 00000002 000000=
70 00000060 00000000=20
>                GPR08: 00000008 00000700 a7ad9ff0 00000008 00000020 101df7=
bc a7ad9fe0 00000000=20
>                GPR16: a7adb5f8 a7adb008 a7ad9ff0 af9a282c a7adb944 000010=
00 00000010 00000000=20
>                GPR24: 10000034 a7adba28 00000000 00000000 00000000 000000=
41 a7adaff0 a7adb008=20
> [  540.777644] NIP [a7a9f67c] 0xa7a9f67c
> [  540.777970] LR [a7a9f67c] 0xa7a9f67c
> [  540.778015] Call Trace:
> [  540.778274] CPU: 0 PID: 3161 Comm: cc1 Not tainted 6.1.46-yocto-standa=
rd #1
> [  540.778316] Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
> [  540.778340] NIP:  a7a9f67c LR: a7a9f67c CTR: 00000040
> [  540.778365] REGS: f3a25f40 TRAP: 0900   Not tainted  (6.1.46-yocto-sta=
ndard)
> [  540.778392] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 28000284  XER: 200=
00000
> [  540.778502]=20
>                GPR00: a7aa7a9c af9a2660 00000000 00000000 00000002 000000=
70 00000060 00000000=20
>                GPR08: 00000008 00000700 a7ad9ff0 00000008 00000020 101df7=
bc a7ad9fe0 00000000=20
>                GPR16: a7adb5f8 a7adb008 a7ad9ff0 af9a282c a7adb944 000010=
00 00000010 00000000=20
>                GPR24: 10000034 a7adba28 00000000 00000000 00000000 000000=
41 a7adaff0 a7adb008=20
> [  540.778879] NIP [a7a9f67c] 0xa7a9f67c
> [  540.778913] LR [a7a9f67c] 0xa7a9f67c
> [  540.778943] Call Trace:
>=20
> (and yes, dmesg did truncate there)
>=20
> For fun, I applied this change alone:
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.1.bb
> index b4601f583e7..a26851a4620 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
> @@ -22,7 +22,8 @@ SRCREV_machine:qemuarm ?=3D "4e49d63e747e81aebad5ce6091=
ba6de09f09d46f"
>  SRCREV_machine:qemuarm64 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
>  SRCREV_machine:qemuloongarch64 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee0688=
39ad2"
>  SRCREV_machine:qemumips ?=3D "e527feb9cd8acbcbcd7115f51cf71166fdbce11a"
> -SRCREV_machine:qemuppc ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
> +#SRCREV_machine:qemuppc ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
> +SRCREV_machine:qemuppc ?=3D "b110cf9bbc395fe757956839d8110e72368699f4"
>  SRCREV_machine:qemuriscv64 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad=
2"
>  SRCREV_machine:qemuriscv32 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad=
2"
>  SRCREV_machine:qemux86 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
> @@ -46,6 +47,7 @@ SRC_URI +=3D "file://0001-perf-cpumap-Make-counter-as-u=
nsigned-ints.patch"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>  LINUX_VERSION ?=3D "6.1.46"
> +LINUX_VERSION:qemuppc ?=3D "6.1.38"
> =20
>  PV =3D "${LINUX_VERSION}+git"
> =20
> rebuilt core-image-sato-sdk and it is still going in testimage and past
> configure into compile so I have a feeling it will eventually complete
> with no rcu stall. The thing is slow.
>=20
> This suggests the problem we're looking for is between 6.1.38 and
> 6.1.46. I tried this with 6.1 as I figured there might be fewer commits
> than on 6.4 and once we find the issue, it is probably the same for
> 6.4.
>=20
> I'm hoping that if we can track down the bug on qemuppc, it might solve
> the x86 issue too which seems much more rare and hard to reproduce.
>=20
> At test runs taking 10mins to break and at least 30 mins to complete,
> this could take a while but I'll try and keep going and narrow it down.

[    0.000000] Linux version 6.1.41-yocto-standard (oe-user@oe-host) (power=
pc-poky-linux-gcc (GCC) 13.2.0, GNU ld (GNU Binutils) 2.41.0.20230731) #1 P=
REEMPT Wed Jul 26 18:34:20 UTC 2023
<cut>
[ 1028.817827] rcu: INFO: rcu_preempt self-detected stall on CPU
[ 1028.837241] rcu: 	0-...!: (1 ticks this GP) idle=3D879c/1/0x40000002 sof=
tirq=3D132839/132839 fqs=3D0
[ 1028.837511] 	(t=3D6588 jiffies g=3D329809 q=3D1 ncpus=3D1)
[ 1028.837813] rcu: rcu_preempt kthread timer wakeup didn't happen for 6587=
 jiffies! g329809 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402
[ 1028.837884] rcu: 	Possible timer handling issue on cpu=3D0 timer-softirq=
=3D92451
[ 1028.837974] rcu: rcu_preempt kthread starved for 6588 jiffies! g329809 f=
0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D0
[ 1028.838022] rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, O=
OM is now expected behavior.
[ 1028.838057] rcu: RCU grace-period kthread stack dump:
[ 1028.838166] task:rcu_preempt     state:I stack:0     pid:16    ppid:2   =
   flags:0x00000800
[ 1028.839004] Call Trace:
[ 1028.839078] [f1051cd0] [c0064274] irq_exit+0x20/0x144 (unreliable)
[ 1028.839814] [f1051da0] [c0d83b74] __schedule+0x378/0x890
[ 1028.839923] [f1051df0] [c0d840f4] schedule+0x68/0x118
[ 1028.839973] [f1051e10] [c0d8b538] schedule_timeout+0xb0/0x17c
[ 1028.840016] [f1051e50] [c00d4f08] rcu_gp_fqs_loop+0x4cc/0x6ac
[ 1028.840058] [f1051eb0] [c00d8720] rcu_gp_kthread+0x238/0x284
[ 1028.840099] [f1051f00] [c008a630] kthread+0xfc/0x114
[ 1028.840143] [f1051f30] [c001c338] ret_from_kernel_thread+0x5c/0x64
[ 1028.840253] rcu: Stack dump where RCU GP kthread last ran:
[ 1028.840518] CPU: 0 PID: 6055 Comm: gcc Not tainted 6.1.41-yocto-standard=
 #1
[ 1028.840672] Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
[ 1028.840744] NIP:  a7958e50 LR: a794c78c CTR: 00000000
[ 1028.840796] REGS: f40c9f40 TRAP: 0900   Not tainted  (6.1.41-yocto-stand=
ard)
[ 1028.840871] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24048289  XER: 20000=
000
[ 1028.841075]=20
               GPR00: a794c768 af8bc6c0 00000000 a792a000 a795dd60 00000014=
 00000000 00000001=20
               GPR08: a795dd60 00000000 a792a000 676c6962 00000005 1016c320=
 fffffffd 10000d44=20
               GPR16: a7985c68 af8bcc80 00000000 a79831fc a7983ff0 00000000=
 a7985c18 00000000=20
               GPR24: ffffffff 10001379 0000a9ff a7983ff0 a79859cc a792a000=
 a7984ff0 a795dd60=20
[ 1028.841520] NIP [a7958e50] 0xa7958e50
[ 1028.841880] LR [a794c78c] 0xa794c78c
[ 1028.841943] Call Trace:
[ 1028.842130] CPU: 0 PID: 6055 Comm: gcc Not tainted 6.1.41-yocto-standard=
 #1
[ 1028.842172] Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
[ 1028.842243] NIP:  a7958e50 LR: a794c78c CTR: 00000000
[ 1028.842324] REGS: f40c9f40 TRAP: 0900   Not tainted  (6.1.41-yocto-stand=
ard)
[ 1028.842355] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24048289  XER: 20000=
000
[ 1028.842445]=20
               GPR00: a794c768 af8bc6c0 00000000 a792a000 a795dd60 00000014=
 00000000 00000001=20
               GPR08: a795dd60 00000000 a792a000 676c6962 00000005 1016c320=
 fffffffd 10000d44=20
               GPR16: a7985c68 af8bcc80 00000000 a79831fc a7983ff0 00000000=
 a7985c18 00000000=20
               GPR24: ffffffff 10001379 0000a9ff a7983ff0 a79859cc a792a000=
 a7984ff0 a795dd60=20
[ 1028.842740] NIP [a7958e50] 0xa7958e50
[ 1028.842772] LR [a794c78c] 0xa794c78c
[ 1028.842799] Call Trace:
[ 1484.142243] rcu: INFO: rcu_preempt self-detected stall on CPU
[ 1484.162020] rcu: 	0-...!: (1 ticks this GP) idle=3D9ac4/1/0x40000004 sof=
tirq=3D191787/191787 fqs=3D0
[ 1484.162517] 	(t=3D5835 jiffies g=3D481021 q=3D5 ncpus=3D1)
[ 1484.162814] rcu: rcu_preempt kthread timer wakeup didn't happen for 5834=
 jiffies! g481021 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402
[ 1484.162881] rcu: 	Possible timer handling issue on cpu=3D0 timer-softirq=
=3D134035
[ 1484.162971] rcu: rcu_preempt kthread starved for 5835 jiffies! g481021 f=
0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D0
[ 1484.163019] rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, O=
OM is now expected behavior.
[ 1484.163052] rcu: RCU grace-period kthread stack dump:
[ 1484.163158] task:rcu_preempt     state:I stack:0     pid:16    ppid:2   =
   flags:0x00000800
[ 1484.164006] Call Trace:
[ 1484.164080] [f1051cd0] [c0064274] irq_exit+0x20/0x144 (unreliable)
[ 1484.164883] [f1051da0] [c0d83b74] __schedule+0x378/0x890
[ 1484.164988] [f1051df0] [c0d840f4] schedule+0x68/0x118
[ 1484.165038] [f1051e10] [c0d8b538] schedule_timeout+0xb0/0x17c
[ 1484.165082] [f1051e50] [c00d4f08] rcu_gp_fqs_loop+0x4cc/0x6ac
[ 1484.165128] [f1051eb0] [c00d8720] rcu_gp_kthread+0x238/0x284
[ 1484.165170] [f1051f00] [c008a630] kthread+0xfc/0x114
[ 1484.165213] [f1051f30] [c001c338] ret_from_kernel_thread+0x5c/0x64
[ 1484.165341] rcu: Stack dump where RCU GP kthread last ran:
[ 1484.165562] CPU: 0 PID: 10034 Comm: sed Not tainted 6.1.41-yocto-standar=
d #1
[ 1484.165748] Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
[ 1484.165815] NIP:  c0d8c874 LR: c0d8c864 CTR: c003d7dc
[ 1484.165863] REGS: f1001ec0 TRAP: 0900   Not tainted  (6.1.41-yocto-stand=
ard)
[ 1484.165935] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 44bb4f32  XER: 00000000
[ 1484.166135]=20
               GPR00: c0d8c81c f1001f80 c2836c00 00000000 00000001 55570190=
 00000000 00000000=20
               GPR08: 00000000 00009032 00000100 fff583a2 24bb5f32 1016c320=
 c157abf8 c16c0000=20
               GPR16: 00046d88 c100a5d4 00000000 0000000a c1575840 c100a620=
 c0f95bf8 c1583570=20
               GPR24: c16f70a0 afaa8ef8 00000000 c16adae0 00000002 00000008=
 00000000 f1001ff0=20
[ 1484.166591] NIP [c0d8c874] __do_softirq+0xfc/0x394
[ 1484.166686] LR [c0d8c864] __do_softirq+0xec/0x394
[ 1484.166731] Call Trace:
[ 1484.166756] [f1001f80] [c0d8c81c] __do_softirq+0xa4/0x394 (unreliable)
[ 1484.166810] [f1001ff0] [c000ac2c] do_softirq_own_stack+0x3c/0x54
[ 1484.166861] [f4bb5ef0] [a7c06380] 0xa7c06380
[ 1484.167183] [f4bb5f10] [c0064338] irq_exit+0xe4/0x144
[ 1484.167229] [f4bb5f30] [c00045b4] HardwareInterrupt_virt+0x108/0x10c
[ 1484.167347] --- interrupt: 500 at 0xa7bc44e4
[ 1484.167391] NIP:  a7bc44e4 LR: a7bc4b3c CTR: 00000000
[ 1484.167420] REGS: f4bb5f40 TRAP: 0500   Not tainted  (6.1.41-yocto-stand=
ard)
[ 1484.167448] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 84042280  XER: 00000=
000
[ 1484.167541]=20
               GPR00: 00000000 afaa8dc0 00000000 00000003 fffffffc 70000027=
 6fffffff a7c063a0=20
               GPR08: 0fdc0000 6ffffffc 0ffed394 40ad88ea 40ad85b7 1016c320=
 00000003 00000003=20
               GPR16: 00000000 afaa8d08 00000006 a7c08ff0 afaa8f30 0023a550=
 a7c06360 10000fdd=20
               GPR24: 00000003 afaa8ef8 00000000 afaa8cd0 00000002 a7c06380=
 a7c09ff0 afaa8dc0=20
[ 1484.167856] NIP [a7bc44e4] 0xa7bc44e4
[ 1484.167887] LR [a7bc4b3c] 0xa7bc4b3c
[ 1484.167924] --- interrupt: 500
[ 1484.167976] Instruction dump:
[ 1484.168126] 3b1870a0 3ad65bf8 3af73570 3b7bdae0 3a60000a 3a400000 7e238b=
78 4bff6f01=20
[ 1484.168249] 92540000 7d2000a6 61298000 7d200124 <7ffd00d0> 7fbff838 7fff=
0034 23ff0020=20
[ 1484.168576] CPU: 0 PID: 10034 Comm: sed Not tainted 6.1.41-yocto-standar=
d #1
[ 1484.168619] Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
[ 1484.168644] NIP:  c0d8c874 LR: c0d8c864 CTR: c003d7dc
[ 1484.168669] REGS: f1001ec0 TRAP: 0900   Not tainted  (6.1.41-yocto-stand=
ard)
[ 1484.168698] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 44bb4f32  XER: 00000000
[ 1484.168815]=20
               GPR00: c0d8c81c f1001f80 c2836c00 00000000 00000001 55570190=
 00000000 00000000=20
               GPR08: 00000000 00009032 00000100 fff583a2 24bb5f32 1016c320=
 c157abf8 c16c0000=20
               GPR16: 00046d88 c100a5d4 00000000 0000000a c1575840 c100a620=
 c0f95bf8 c1583570=20
               GPR24: c16f70a0 afaa8ef8 00000000 c16adae0 00000002 00000008=
 00000000 f1001ff0=20
[ 1484.169112] NIP [c0d8c874] __do_softirq+0xfc/0x394
[ 1484.169148] LR [c0d8c864] __do_softirq+0xec/0x394
[ 1484.169178] Call Trace:
[ 1484.169199] [f1001f80] [c0d8c81c] __do_softirq+0xa4/0x394 (unreliable)
[ 1484.169246] [f1001ff0] [c000ac2c] do_softirq_own_stack+0x3c/0x54
[ 1484.169346] [f4bb5ef0] [a7c06380] 0xa7c06380
[ 1484.169386] [f4bb5f10] [c0064338] irq_exit+0xe4/0x144
[ 1484.169425] [f4bb5f30] [c00045b4] HardwareInterrupt_virt+0x108/0x10c
[ 1484.169464] --- interrupt: 500 at 0xa7bc44e4
[ 1484.169492] NIP:  a7bc44e4 LR: a7bc4b3c CTR: 00000000
[ 1484.169516] REGS: f4bb5f40 TRAP: 0500   Not tainted  (6.1.41-yocto-stand=
ard)
[ 1484.169541] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 84042280  XER: 00000=
000
[ 1484.169650]=20
               GPR00: 00000000 afaa8dc0 00000000 00000003 fffffffc 70000027=
 6fffffff a7c063a0=20
               GPR08: 0fdc0000 6ffffffc 0ffed394 40ad88ea 40ad85b7 1016c320=
 00000003 00000003=20
               GPR16: 00000000 afaa8d08 00000006 a7c08ff0 afaa8f30 0023a550=
 a7c06360 10000fdd=20
               GPR24: 00000003 afaa8ef8 00000000 afaa8cd0 00000002 a7c06380=
 a7c09ff0 afaa8dc0=20
[ 1484.169943] NIP [a7bc44e4] 0xa7bc44e4
[ 1484.169973] LR [a7bc4b3c] 0xa7bc4b3c
[ 1484.169998] --- interrupt: 500
[ 1484.170020] Instruction dump:
[ 1484.170047] 3b1870a0 3ad65bf8 3af73570 3b7bdae0 3a60000a 3a400000 7e238b=
78 4bff6f01=20
[ 1484.170130] 92540000 7d2000a6 61298000 7d200124 <7ffd00d0> 7fbff838 7fff=
0034 23ff0020=20
[ 2151.331458] systemd-journald[113]: Time jumped backwards, rotating.
[ 3642.773250] hellomod: loading out-of-tree module taints kernel.
[ 3642.930969] Hello world!
[ 3657.747385] Cleaning up hellomod.

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-ke=
rnel/linux/linux-yocto_6.1.bb
index a26851a4620..c8e67560a85 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -22,8 +22,10 @@ SRCREV_machine:qemuarm ?=3D "4e49d63e747e81aebad5ce6091b=
a6de09f09d46f"
 SRCREV_machine:qemuarm64 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
 SRCREV_machine:qemuloongarch64 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839=
ad2"
 SRCREV_machine:qemumips ?=3D "e527feb9cd8acbcbcd7115f51cf71166fdbce11a"
-#SRCREV_machine:qemuppc ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
-SRCREV_machine:qemuppc ?=3D "b110cf9bbc395fe757956839d8110e72368699f4"
+#SRCREV_machine:qemuppc ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2" 6.=
1.46
+SRCREV_machine:qemuppc ?=3D "e6b254abfbb16492998e6bd355302b47d0080b76"
+# 6.1.41
+#SRCREV_machine:qemuppc ?=3D "b110cf9bbc395fe757956839d8110e72368699f4" 6.=
1.38
 SRCREV_machine:qemuriscv64 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
 SRCREV_machine:qemuriscv32 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
 SRCREV_machine:qemux86 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
@@ -47,7 +49,7 @@ SRC_URI +=3D "file://0001-perf-cpumap-Make-counter-as-uns=
igned-ints.patch"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e4=
6"
 LINUX_VERSION ?=3D "6.1.46"
-LINUX_VERSION:qemuppc ?=3D "6.1.38"
+LINUX_VERSION:qemuppc ?=3D "6.1.41"
=20
 PV =3D "${LINUX_VERSION}+git"
=20

so between 6.1.38 and 6.1.41 ?

Cheers,

Richard



