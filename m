Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 984AD7DE28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 12:30:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4FCU6AJ009358
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 May 2019 05:30:06 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 15 May 2019 05:30:05 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRT7NFoRN8EXYDiQ64+0g-bB=jvd7HcfUCRn+_26iRQX4Q@mail.gmail.com>
	<0ffc3e2e-2321-0edb-c90a-76225017472d@windriver.com>
	<20190515110813.GA13420@localhost>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <6e3c7d20-a86b-9487-5640-0de47f716d95@windriver.com>
Date: Wed, 15 May 2019 20:30:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515110813.GA13420@localhost>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: output failed config.log
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
X-List-Received-Date: Wed, 15 May 2019 12:30:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 5/15/19 7:08 PM, Adrian Bunk wrote:
> The end of config.log often contains expected error messages completely
> unrelated to the actual problem.

I am afraid you did not suffer pain from it, the most related message

with do_configure failure is config.log. Take a example, as my previous

commit [grub/grub-efi: fix unrecognized command line option

'-pipe-Wno-error' in CFLAGS]

It takes me hours to reproduce grub/grub-efi build faiure (only

happen while DEBUG_BUILD = "1"), and from log.do_configure, I can't

tell the root cause

...

checking for i586-wrs-linux-gcc... i586-wrs-linux-gcc  -m32 -march=i586 
--sysroot=TOPDIR/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/recipe-sysroot
checking whether the C compiler works... no
configure: error: in 
`TOPDIR/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/build':
configure: error: C compiler cannot create executables

...


But from config.log, I got more detail '-pipe-Wno-error'

which helps me to locate the issue

...

configure:5094: i586-wrs-linux-gcc  -m32 -march=i586 
--sysroot=/buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/recipe-sysroot 
-Og -g -feliminate-unused-debug-types 
-fmacro-prefix-map=/buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0=/usr/src/debug/grub/2.02-r0 
-fdebug-prefix-map=/buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0=/usr/src/debug/grub/2.02-r0 
-fdebug-prefix-map=/buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/recipe-sysroot= 
-fdebug-prefix-map=/buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/recipe-sysroot-native= 
-pipe-Wno-error  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed 
-fstack-protector-strong -Wl,-z,relro,-z,now conftest.c >&5
i586-wrs-linux-gcc: error: unrecognized command line option 
'-pipe-Wno-error'; did you mean '-Wno-error'?
...
configure:5141: error: in 
`/buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/build':
configure:5143: error: C compiler cannot create executables

...


> Debian autobuilders already dump config.log when when configuring failed,
> and there it is a common problem that people end up searching for the
> problem in the wrong places due to that.

It's another story, it is better that autobuilder provide sufficient and

necessary info and data, not only config.log, but also local.conf,

all available log.do_***, sources in ${B} and ${S}, even data in ${WORKDIR},

result of `bitbake -e'

but before we got there, the fix is best choice for do_configure failure

//Hongxu

i

//Hongxu

> If possible, it would therefore be better to make it accessible separately.



