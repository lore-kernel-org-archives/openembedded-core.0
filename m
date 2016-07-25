Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6CF5606BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 02:53:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6P2rDBQ016014
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 24 Jul 2016 19:53:13 -0700
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 24 Jul 2016 19:53:12 -0700
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@intel.com>
References: <cover.1468935802.git.liezhi.yang@windriver.com>
	<e6dc6baf0f850853605319815acc19cb14de189c.1468935802.git.liezhi.yang@windriver.com>
	<CAJTo0LbWf5q40LQmEZQxPF0wLNVmoi=J7HXjtJNwCxgMU2WtOQ@mail.gmail.com>
	<5791DDA1.1070707@windriver.com>
	<CAJTo0LaXgox5AuqLkjJ6xiJoLpYX6SDAnVnP4pzf30W-SWeaxA@mail.gmail.com>
	<CAMKF1spZ5qT2xfcyZtXKWYHk=6yiX0sQkWOpuOro_1ZAp_M=pQ@mail.gmail.com>
	<CAMKF1soDrhTdO0hxNb3L_Op=QCG-QGpkiS5oz2_PxRL=CVxNFg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57957F17.9040603@windriver.com>
Date: Mon, 25 Jul 2016 10:53:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soDrhTdO0hxNb3L_Op=QCG-QGpkiS5oz2_PxRL=CVxNFg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] e2fsprogs: 1.43 -> 1.43.1
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
X-List-Received-Date: Mon, 25 Jul 2016 02:53:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/23/2016 04:44 AM, Khem Raj wrote:
> On Jul 22, 2016 12:52 PM, "Burton, Ross" <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
>  >
>  >
>  > On 22 July 2016 at 09:47, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>  >>
>  >> Sorry, updated in the repo:
>  >>
>  >>   git://git.openembedded.org/openembedded-core-contrib
> <http://git.openembedded.org/openembedded-core-contrib> rbt/pu
>  >
>  >
>  > And now I notice that its failing on musl:
>  >
>  > | (cd elfshared; i586-poky-linux-musl-gcc  -m32 -march=i586
> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/sysroots/qemux86
> -o libcom_err.so.2.1 \
>  > | -L../../../lib -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro
> -Wl,-z,now -fPIC -shared \
>  > | -Wl,-soname,libcom_err.so.2 error_message.o et_name.o init_et.o com_err.o
> com_right.o )
>  > | i586-poky-linux-musl-ar rc libcom_err.a error_message.o et_name.o init_et.o
> com_err.o com_right.o
>  > | error_message.o: In function `init_debug':
>  > | /usr/src/debug/e2fsprogs/1.43.1-r0/git/lib/et/error_message.c:260:
> undefined reference to `__stack_chk_fail_local'
>  > | com_err.o: In function `default_com_err_proc':
>  > | /usr/src/debug/e2fsprogs/1.43.1-r0/git/lib/et/com_err.c:63: undefined
> reference to `__stack_chk_fail_local'
>  > | collect2: error: ld returned 1 exit status
>  >
>  > I guess the hardening needs to be glibc specific? (CC'ing Khem for an opinion).
>
> Musl work that have been done has been using hardening from day 1. So this
> should be fixed. Musl images work fine with pie

Hi Khem,

This happens on i586 (MACHINE=qemux86), the core2_64(MACHINE=qemux86-64) works
well. The failed option is -fstack-protector-strong, maybe something is wrong
with i586-musl-toolchain ?


// Robert

>  >
>  > Ross
>

