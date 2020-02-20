Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 91D3160B1F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 10:02:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a9so1326975wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 02:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=6GMBVv3nax+xKA9uc3CZN/myXFq5d2dCD7qL41dvmTE=;
	b=APmYL3hQWd4u4H2H1jjYkCMOKVCdAgk2HjRiktjQeAOejf3glPsmeT1+58VuthQ4Ow
	Zn9fB8pr+wFi+vb5NO1uF0P2bnuJgHcGFjRWWW2PtoMf3OBHmqna21XyAUt6ITt3MTBd
	UsKe6cn1p+hGClJLIPkw+I5YNMwRx8pmajFs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=6GMBVv3nax+xKA9uc3CZN/myXFq5d2dCD7qL41dvmTE=;
	b=s8CIHtYgKUVB19RdYmN9oEqTqvNhuZS1Yqy9ClQXPiboF1XL5a8cHJE5GcKz8Mn0wE
	JPsr4/o926FL9UOIzx8qAQJs5N6r4mbRZEGjBSrJTD2G8T6C3MQiwLPsBJ8EMiR7JeEv
	+c09jSlkF5aupkIsYIRF3jrORly0uoJu01Jt34KXMV650vSNjrBFfZOcKVk5wFsZZvMR
	QQEPuXAQur6kr5Pd9x14kkHSVQWJi5e470yP2xrdFy/vmI0E3ave6KLHK/TZ46r/tpFg
	ZIll5eaIYRQEIj81IqHLBS3TFKiLOsJUccx/GfVo3ZYNmCqCehxk25iQ/utVavyyaOyg
	zNpw==
X-Gm-Message-State: APjAAAWSK7wzeZeYHWLMzhwZfJhqWxFFRz31jYlJUUaSBE6Vczri2YE3
	pfklp2gnvSQIrsMTiLbsevdhBw==
X-Google-Smtp-Source: APXvYqymc3zSIXEpFCH41//oCwvEhJ4w5ZoF0NVkptPkd86Xt6/HVwLinag1cdiVmmW0oodZNuAimA==
X-Received: by 2002:a1c:7419:: with SMTP id p25mr3629761wmc.159.1582192926179; 
	Thu, 20 Feb 2020 02:02:06 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a26sm3916715wmm.18.2020.02.20.02.02.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 02:02:04 -0800 (PST)
Message-ID: <4688fc5ac550088b553d602ef1ecb110447a9100.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Li Zhou <li.zhou@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 10:02:02 +0000
In-Reply-To: <1582165584-187223-1-git-send-email-li.zhou@windriver.com>
References: <1582165584-187223-1-git-send-email-li.zhou@windriver.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH] lttng-modules: Check the pid_ns before using it because it may be NULL
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
X-List-Received-Date: Thu, 20 Feb 2020 10:02:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-20 at 10:26 +0800, Li Zhou wrote:
> Check the pid_ns before using it because it may be NULL to fix below
> issue:
> <1>[ 22.637196] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000080
> <1>[ 22.645982] Mem abort info:
> <1>[ 22.648769] ESR = 0x96000007
> <1>[ 22.651817] Exception class = DABT (current EL), IL = 32 bits
> <1>[ 22.657730] SET = 0, FnV = 0
> <1>[ 22.660777] EA = 0, S1PTW = 0
> <1>[ 22.663910] Data abort info:
> <1>[ 22.666784] ISV = 0, ISS = 0x00000007
> <1>[ 22.670611] CM = 0, WnR = 0
> <1>[ 22.673574] user pgtable: 4k pages, 39-bit VAs, pgdp =
> 0000000012378f78
> <1>[ 22.680180] [0000000000000080] pgd=000000007f023003,
> pud=000000007f023003, pmd=000000007f01f003, pte=0000000000000000
> <0>[ 22.690794] Internal error: Oops: 96000007 [#1] PREEMPT SMP
> <4>[ 22.690797] Modules linked in: adkNetD ncp
> lttng_ring_buffer_client_overwrite(C)
> lttng_ring_buffer_metadata_client(C)
> lttng_ring_buffer_client_discard(C)
> lttng_ring_buffer_client_mmap_overwrite(C)
> lttng_ring_buffer_client_mmap_discard(C)
> lttng_ring_buffer_metadata_mmap_client(C) lttng_probe_signal(C)
> lttng_probe_printk(C) lttng_probe_sched(C) lttng_probe_irq(C)
> lttng_tracer(C) lttng_statedump(C) lttng_ftrace(C)
> lttng_lib_ring_buffer(C) lttng_clock_plugin_arm_cntpct(C)
> lttng_clock(C)
> <0>[ 22.690823] Process lttng-sessiond (pid: 3093, stack limit =
> 0x000000005d27910f)
> <4>[ 22.690828] CPU: 1 PID: 3093 Comm: lttng-sessiond Tainted: G C
> 4.18.37-rt820-custom #1
> <4>[ 22.690830] Hardware name: DUS33 (CPM2-20) (DT)
> <4>[ 22.690833] pstate: 60000005 (nZCv daif -PAN -UAO)
> <4>[ 22.690845] pc : do_lttng_statedump+0xcc/0x8a8 [lttng_statedump]
> <4>[ 22.690849] lr : do_lttng_statedump+0xc4/0x8a8 [lttng_statedump]
> <4>[ 22.690851] sp : ffffffc07fe57ad0
> <4>[ 22.690852] x29: ffffffc07fe57ad0 x28: ffffffc008ae2700
> <4>[ 22.690856] x27: ffffff8000724000 x26: 0000000000000001
> <4>[ 22.690859] x25: ffffff80089c9620 x24: 0000000000000000
> <4>[ 22.690862] x23: ffffffc008ae2e10 x22: ffffff80089d3380
> <4>[ 22.690865] x21: ffffffc07f450000 x20: ffffffc008ae2700
> <4>[ 22.690869] x19: 0000000000000007 x18: 00000000fffffffe
> <4>[ 22.690871] x17: 0000000000000000 x16: ffffff800824b980
> <4>[ 22.690874] x15: 0000000000000000 x14: 736162203b656e6f
> <4>[ 22.690877] x13: 6e203d20676e6964 x12: 0000000000000000
> <4>[ 22.690880] x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f
> <4>[ 22.690882] x9 : 3c1f647968721eff x8 : ffffffc0877504c8
> <4>[ 22.690886] x7 : 09093a7c093a7c08 x6 : ffffff8010c4b317
> <4>[ 22.690888] x5 : 0000000000000000 x4 : 00000040a7575000
> <4>[ 22.690891] x3 : ffffffc008ae2e28 x2 : 0000000000000000
> <4>[ 22.690894] x1 : 0000000000000000 x0 : 0000000000000000
> <4>[ 22.690896] Call trace:
> <4>[ 22.690902] do_lttng_statedump+0xcc/0x8a8 [lttng_statedump]
> <4>[ 22.690905] lttng_statedump_start+0x20/0x30 [lttng_statedump]
> <4>[ 22.690981] lttng_session_enable+0xf0/0x120 [lttng_tracer]
> <4>[ 22.691018] lttng_session_ioctl+0x22c/0x328 [lttng_tracer]
> <4>[ 22.691026] compat_sys_ioctl+0x110/0x778
> 
> Signed-off-by: Li Zhou <li.zhou@windriver.com>

Are upstream aware of this issue? I'd really like their opinion on this
before we merge anything.

Cheers,

Richard




