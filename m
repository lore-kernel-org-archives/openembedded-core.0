Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5887FEE4993
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 09:32:07 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.4313.1692696719825463927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 02:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QZYDR0tt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fef56f7223so11151405e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 02:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692696718; x=1693301518;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X68FOKuKZtNxsbjc1WiyKWS+LkgWxPGtFzool1niGUA=;
        b=QZYDR0ttfPUYUz1jmvOLEbtYbmYR6pDeERaIH2p1Bmm8KpVE6H93P7r3YgvqHeZ9oT
         HKc5fiOwGpkyuzn3MEKjGYCqs/o6GOwMhI2Kcutyu2MTUrNZj5piqiDSyuepCUXFEOPj
         YuSW6kTu5KzumaIZpJtoLbMuwmUh+KvBwTKlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692696718; x=1693301518;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X68FOKuKZtNxsbjc1WiyKWS+LkgWxPGtFzool1niGUA=;
        b=GJlLTwjMwedgpxu2j5umAL60etnkGUaTyk4CTWaDLngZ3JMwv9JjLyZcS5T/ycB6rM
         GRK4bEk91egMsc5MQBetGs7k75tsyYRtgqNPyTTag34MqdrweXNL48XuIvmZBYXAW2rN
         P90t4xiv5z+wOWKwcQe6jeZUF285HDcWGbKxIWMZVpf9tVLGMiYrhqCYKo6H66+nT2tb
         tvOJFhdmbuEiuM0hgLvjRUa8+JqYUrwXcMj8f5eYmrsqi8kggsXWiON/46kPE5Fd7KV4
         MrepVb7fPhGOpchsXzGmNIiUU5OgX9zPE/kgEsQvFm3AsFO2JXBP/pMqAlIFA0myoeda
         6AQQ==
X-Gm-Message-State: AOJu0YxrLwhRH8S8rfHCyfRVDPCMkjtUNfSY581XcT6HZuKpBglPu3ra
	iKbFvAuSh+GtsMjlDbIVpmuxng==
X-Google-Smtp-Source: AGHT+IEpHgavaMwjarXk7N6WNJqKB6bN8DB/wqyUb5Ta/28xzQbdQnZ+O321NHHajqw3iigeq51o+g==
X-Received: by 2002:a05:600c:21d7:b0:3fe:407c:a053 with SMTP id x23-20020a05600c21d700b003fe407ca053mr7095128wmj.16.1692696718146;
        Tue, 22 Aug 2023 02:31:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb4c:c27c:35e6:14a1? ([2001:8b0:aba:5f3c:eb4c:c27c:35e6:14a1])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c228a00b003fe4ca8decdsm18994202wmf.31.2023.08.22.02.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 02:31:57 -0700 (PDT)
Message-ID: <4530442ff691249c07136e85a3eccce1c64ba6f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
	Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 22 Aug 2023 10:31:57 +0100
In-Reply-To: <ZN7j425iXGBPbS5i@windriver.com>
References: 
	<1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
	 <ZNt45UVb0Ps/kKLM@windriver.com>
	 <15f7e67b-afd7-7504-aa23-41a4c3cb62a1@prevas.dk>
	 <ZN7j425iXGBPbS5i@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 09:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186498

On Thu, 2023-08-17 at 23:22 -0400, Paul Gortmaker wrote:
> [Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)] On =
16/08/2023 (Wed 09:55) Rasmus Villemoes wrote:
>=20
> > On 15/08/2023 15.08, Paul Gortmaker via lists.openembedded.org wrote:
> > > [Dilemma on changes - merge or not to merge (e.g. 6.4)] On 14/08/2023=
 (Mon 10:54) Richard Purdie wrote:
> > >=20
> > > > Remaining are:
> > > >   * an error upon boot on preempt-rt on qemux86-64
> > > >      (e.g. https://autobuilder.yoctoproject.org/typhoon/#/builders/=
72/builds/7616/steps/36/logs/stdio)
> > > >      We'll probably just have to ignore it in parselogs as it has b=
een??
> > > >      around for a while and nobody seems interested in fixing it up=
stream.
> > >=20
> > > Just back from vacation and I see an internal report of 10-ish at boo=
t
> >=20
> > it seems to be rate-limited to 10 per boot, so it should never appear
> > more than those 10ish times:
> >=20
> > static bool report_idle_softirq(void)
> > {
> > ...
> >         if (ratelimit >=3D 10)
> >                 return false;
> > ...
> >         ratelimit++;
> > ...
>=20
> Amusingly enough - you were looking right at the problem.  Just a few
> stable kernels ago, it was inadvertently ratelimited to zero.  :-P
>=20
> https://lists.openembedded.org/g/openembedded-core/message/186343

Thanks for tracking this down and the subsequent fix. Sadly it didn't
lead us to a magic fix everywhere but it is good to have it resolved
and we can drop the "ignore the error" patch.

I've been poking at this qemuppc issue which is now affecting both 6.1
*and* 6.4 on the autobuilder. It seems pretty consistent that "bitbake
core-image-sato-sdk -c testimage" for qemuppc generates rcu tracebacks
and/or hangs when trying to configure/compile cpio in the image. It
usually only gets as far as configure.

I'd swear this is a new thing that just started happening so it is
likely something that was backported to both 6.1 and 6.4 stable series.
How likely is it the same bug would get backported to both at once? ;-)

On the autobuilder, "qemuppc-altcfg" is building 6.1.46 and "qemuppc"
is building 6.4.11 and both hang.

I tried locally and was able to reproduce it first try. After 10 mins
of testimage, I could ssh into the image and see the rcu stall:


   16.638778] systemd-journald[113]: Received client request to flush runti=
me journal.
[  540.762141] rcu: INFO: rcu_preempt self-detected stall on CPU
[  540.772535] rcu: 	0-...!: (1 ticks this GP) idle=3D71e4/1/0x40000002 sof=
tirq=3D73154/73154 fqs=3D0
[  540.773036] 	(t=3D6104 jiffies g=3D177277 q=3D1 ncpus=3D1)
[  540.773334] rcu: rcu_preempt kthread timer wakeup didn't happen for 6103=
 jiffies! g177277 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402
[  540.773390] rcu: 	Possible timer handling issue on cpu=3D0 timer-softirq=
=3D50723
[  540.773480] rcu: rcu_preempt kthread starved for 6104 jiffies! g177277 f=
0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D0
[  540.773529] rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, O=
OM is now expected behavior.
[  540.773580] rcu: RCU grace-period kthread stack dump:
[  540.773687] task:rcu_preempt     state:I stack:0     pid:16    ppid:2   =
   flags:0x00000800
[  540.774731] Call Trace:
[  540.774927] [f1051da0] [c0d84cc4] __schedule+0x378/0x890
[  540.775876] [f1051df0] [c0d85244] schedule+0x68/0x118
[  540.775964] [f1051e10] [c0d8c678] schedule_timeout+0xb0/0x17c
[  540.776012] [f1051e50] [c00d4d84] rcu_gp_fqs_loop+0x4cc/0x6ac
[  540.776057] [f1051eb0] [c00d859c] rcu_gp_kthread+0x238/0x284
[  540.776100] [f1051f00] [c008a4d0] kthread+0xfc/0x114
[  540.776144] [f1051f30] [c001c338] ret_from_kernel_thread+0x5c/0x64
[  540.776248] rcu: Stack dump where RCU GP kthread last ran:
[  540.776462] CPU: 0 PID: 3161 Comm: cc1 Not tainted 6.1.46-yocto-standard=
 #1
[  540.776797] Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
[  540.776866] NIP:  a7a9f67c LR: a7a9f67c CTR: 00000040
[  540.776914] REGS: f3a25f40 TRAP: 0900   Not tainted  (6.1.46-yocto-stand=
ard)
[  540.776987] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 28000284  XER: 20000=
000
[  540.777230]=20
               GPR00: a7aa7a9c af9a2660 00000000 00000000 00000002 00000070=
 00000060 00000000=20
               GPR08: 00000008 00000700 a7ad9ff0 00000008 00000020 101df7bc=
 a7ad9fe0 00000000=20
               GPR16: a7adb5f8 a7adb008 a7ad9ff0 af9a282c a7adb944 00001000=
 00000010 00000000=20
               GPR24: 10000034 a7adba28 00000000 00000000 00000000 00000041=
 a7adaff0 a7adb008=20
[  540.777644] NIP [a7a9f67c] 0xa7a9f67c
[  540.777970] LR [a7a9f67c] 0xa7a9f67c
[  540.778015] Call Trace:
[  540.778274] CPU: 0 PID: 3161 Comm: cc1 Not tainted 6.1.46-yocto-standard=
 #1
[  540.778316] Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
[  540.778340] NIP:  a7a9f67c LR: a7a9f67c CTR: 00000040
[  540.778365] REGS: f3a25f40 TRAP: 0900   Not tainted  (6.1.46-yocto-stand=
ard)
[  540.778392] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 28000284  XER: 20000=
000
[  540.778502]=20
               GPR00: a7aa7a9c af9a2660 00000000 00000000 00000002 00000070=
 00000060 00000000=20
               GPR08: 00000008 00000700 a7ad9ff0 00000008 00000020 101df7bc=
 a7ad9fe0 00000000=20
               GPR16: a7adb5f8 a7adb008 a7ad9ff0 af9a282c a7adb944 00001000=
 00000010 00000000=20
               GPR24: 10000034 a7adba28 00000000 00000000 00000000 00000041=
 a7adaff0 a7adb008=20
[  540.778879] NIP [a7a9f67c] 0xa7a9f67c
[  540.778913] LR [a7a9f67c] 0xa7a9f67c
[  540.778943] Call Trace:

(and yes, dmesg did truncate there)

For fun, I applied this change alone:

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-ke=
rnel/linux/linux-yocto_6.1.bb
index b4601f583e7..a26851a4620 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -22,7 +22,8 @@ SRCREV_machine:qemuarm ?=3D "4e49d63e747e81aebad5ce6091ba=
6de09f09d46f"
 SRCREV_machine:qemuarm64 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
 SRCREV_machine:qemuloongarch64 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839=
ad2"
 SRCREV_machine:qemumips ?=3D "e527feb9cd8acbcbcd7115f51cf71166fdbce11a"
-SRCREV_machine:qemuppc ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+#SRCREV_machine:qemuppc ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemuppc ?=3D "b110cf9bbc395fe757956839d8110e72368699f4"
 SRCREV_machine:qemuriscv64 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
 SRCREV_machine:qemuriscv32 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
 SRCREV_machine:qemux86 ?=3D "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
@@ -46,6 +47,7 @@ SRC_URI +=3D "file://0001-perf-cpumap-Make-counter-as-uns=
igned-ints.patch"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e4=
6"
 LINUX_VERSION ?=3D "6.1.46"
+LINUX_VERSION:qemuppc ?=3D "6.1.38"
=20
 PV =3D "${LINUX_VERSION}+git"
=20
rebuilt core-image-sato-sdk and it is still going in testimage and past
configure into compile so I have a feeling it will eventually complete
with no rcu stall. The thing is slow.

This suggests the problem we're looking for is between 6.1.38 and
6.1.46. I tried this with 6.1 as I figured there might be fewer commits
than on 6.4 and once we find the issue, it is probably the same for
6.4.

I'm hoping that if we can track down the bug on qemuppc, it might solve
the x86 issue too which seems much more rare and hard to reproduce.

At test runs taking 10mins to break and at least 30 mins to complete,
this could take a while but I'll try and keep going and narrow it down.

Cheers,

Richard


