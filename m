Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F5EEE49A4
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 11:47:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.6087.1692704828638791025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 04:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KiabGL7S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31c5a2e8501so1530033f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 04:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692704827; x=1693309627;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t1guvdW4vSF8p6pwZLwBhjLR4Acv1n/ffEeXE1MLslc=;
        b=KiabGL7S94Ro4a3MnMfY3nFrRUKUfD56UElgSPt8+pxdCn5CZK6Xycth93WQeUyek+
         TsR3quZPhBCD5nHcCGZNpbsr/eJw+i057U7+Yrp4NBTxjP4jZBF58EBUG8m1XDH+bwg2
         i9llBMCRepxB31DHERe+T6E3j5ZH/t0OQAGIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692704827; x=1693309627;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t1guvdW4vSF8p6pwZLwBhjLR4Acv1n/ffEeXE1MLslc=;
        b=KUydp9Pka1B+JH4GAbvnXJm8j9fR7jSHmhP5qtBAmTkfyuq7HVTOjsH6MSdBCzpal4
         gMOWp8FFgNL8fCtK7svKVsEK1GtPhNBDDZ7EykyJtMcw022KoS1zOY6e3JudZzjSGX2f
         xKVleK2ezJeIyWgeIyM2KB80rWIcZeoAPv/OuTgW2woP+1EdYO3DnTJlSUZkRAI0HHCQ
         USOB8nZmdWMWqGn0XqOUNWOuvMRfMww8t2DXpCqwChTmFSzxadU2TkktHOPde/l11+M8
         Yc9I2HnDipyP8vDtKHQAnFFq4p0XWE42Fg88IlruDMEG8p9Q7tfHfiwkZ/guIwkWZJdL
         Csbw==
X-Gm-Message-State: AOJu0Yxr7bkNyo2DDpV7+Yo/W6ubJPUN8qc6FgzwJZwO9NYIPzCKCIaQ
	riJrs+CFHSZIHUX/aYHluOQerw==
X-Google-Smtp-Source: AGHT+IGVry5qxVtJxEuHcia1L/qdPeegJms5zx8qBQnHbHRJLZe3di7PN0BWDNsiig3RAk+3jUKHEQ==
X-Received: by 2002:a05:6000:1808:b0:319:7fdc:d15f with SMTP id m8-20020a056000180800b003197fdcd15fmr7811430wrh.26.1692704826780;
        Tue, 22 Aug 2023 04:47:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb4c:c27c:35e6:14a1? ([2001:8b0:aba:5f3c:eb4c:c27c:35e6:14a1])
        by smtp.gmail.com with ESMTPSA id s15-20020adfea8f000000b0031807bd3614sm15612469wrm.90.2023.08.22.04.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 04:47:06 -0700 (PDT)
Message-ID: <d7982e9549e8e8042dfdfdaa4f3173684aa726bb.camel@linuxfoundation.org>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
	Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 22 Aug 2023 12:47:04 +0100
In-Reply-To: <177DAFEBFB5EB0D2.24073@lists.openembedded.org>
References: 
	<1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
	 <ZNt45UVb0Ps/kKLM@windriver.com>
	 <15f7e67b-afd7-7504-aa23-41a4c3cb62a1@prevas.dk>
	 <ZN7j425iXGBPbS5i@windriver.com>
	 <177DAAB2E4C3384A.4797@lists.openembedded.org>
	 <177DAFEBFB5EB0D2.24073@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 11:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186504

On Tue, 2023-08-22 at 12:07 +0100, Richard Purdie via
lists.openembedded.org wrote:
> so between 6.1.38 and 6.1.41 ?

[    0.000000] Linux version 6.1.39-yocto-standard (oe-user@oe-host) (power=
pc-poky-linux-gcc (GCC) 13.2.0, GNU ld (GNU Binutils) 2.41.0.20230731) #1 P=
REEMPT Wed Jul 19 14:22:18 UTC 2023
[   14.971050] systemd[1]: Started Journal Service.
[   16.158584] systemd-journald[113]: Received client request to flush runt=
ime journal.
[  532.519478] rcu: INFO: rcu_preempt self-detected stall on CPU
[  532.530290] rcu: 	0-...!: (1 ticks this GP) idle=3D4f2c/1/0x40000002 sof=
tirq=3D70544/70544 fqs=3D0
[  532.530929] 	(t=3D6170 jiffies g=3D170793 q=3D3 ncpus=3D1)
[  532.531235] rcu: rcu_preempt kthread timer wakeup didn't happen for 6169=
 jiffies! g170793 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402
[  532.531294] rcu: 	Possible timer handling issue on cpu=3D0 timer-softirq=
=3D49025
[  532.531582] rcu: rcu_preempt kthread starved for 6170 jiffies! g170793 f=
0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D0
[  532.531634] rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, O=
OM is now expected behavior.
[  532.531670] rcu: RCU grace-period kthread stack dump:
[  532.531783] task:rcu_preempt     state:I stack:0     pid:16    ppid:2   =
   flags:0x00000800
[  532.533233] Call Trace:
[  532.533499] [f1051cd0] [5ea7c162] 0x5ea7c162 (unreliable)
[  532.534406] [f1051da0] [c0d83234] __schedule+0x378/0x890
[  532.535228] [f1051df0] [c0d837b4] schedule+0x68/0x118
[  532.535313] [f1051e10] [c0d8abf8] schedule_timeout+0xb0/0x17c
[  532.535361] [f1051e50] [c00d4d08] rcu_gp_fqs_loop+0x4cc/0x6ac
[  532.535405] [f1051eb0] [c00d8520] rcu_gp_kthread+0x238/0x284
[  532.535446] [f1051f00] [c008a434] kthread+0xfc/0x114
[  532.535490] [f1051f30] [c001c338] ret_from_kernel_thread+0x5c/0x64
[  532.535650] rcu: Stack dump where RCU GP kthread last ran:
[  532.535868] CPU: 0 PID: 3056 Comm: touch Not tainted 6.1.39-yocto-standa=
rd #1
[  532.536025] Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
[  532.536294] NIP:  100145d0 LR: 100011cc CTR: 00000000
[  532.536347] REGS: f38bdf40 TRAP: 0900   Not tainted  (6.1.39-yocto-stand=
ard)
[  532.536422] MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002460  XER=
: 00000000
[  532.536737]=20
               GPR00: 100011c4 af9ce570 a7d872a0 100150ec 0ff6e850 65000000=
 65000000 fefefeff=20
               GPR08: 00000003 0ff6e840 00000003 65000000 42002282 10038058=
 00000000 10164888=20
               GPR16: 10160000 00000000 101e5eb0 00000008 10160000 10001120=
 00000000 10016998=20
               GPR24: 100151f4 100168d0 00000000 10030000 10016920 00000002=
 af9ce904 100150ec=20
[  532.537150] NIP [100145d0] 0x100145d0
[  532.537204] LR [100011cc] 0x100011cc
[  532.537246] Call Trace:
[  532.537443] CPU: 0 PID: 3056 Comm: touch Not tainted 6.1.39-yocto-standa=
rd #1
[  532.537487] Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
[  532.537597] NIP:  100145d0 LR: 100011cc CTR: 00000000
[  532.537625] REGS: f38bdf40 TRAP: 0900   Not tainted  (6.1.39-yocto-stand=
ard)
[  532.537653] MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002460  XER=
: 00000000
[  532.537764]=20
               GPR00: 100011c4 af9ce570 a7d872a0 100150ec 0ff6e850 65000000=
 65000000 fefefeff=20
               GPR08: 00000003 0ff6e840 00000003 65000000 42002282 10038058=
 00000000 10164888=20
               GPR16: 10160000 00000000 101e5eb0 00000008 10160000 10001120=
 00000000 10016998=20
               GPR24: 100151f4 100168d0 00000000 10030000 10016920 00000002=
 af9ce904 100150ec=20
[  532.538092] NIP [100145d0] 0x100145d0
[  532.538125] LR [100011cc] 0x100011cc
[  532.538153] Call Trace:

SRCREV_machine:qemuppc ?=3D "a456e17438819ed77f63d16926f96101ca215f09"
LINUX_VERSION:qemuppc ?=3D "6.1.39"

so between 6.1.38 and 6.1.39?

Cheers,

Richard



