Return-Path: <kamensky@cisco.com>
X-Greylist: delayed 577 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 14 May 2018 18:34:38 UTC
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6EFA97863A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 18:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4513; q=dns/txt; s=iport;
	t=1526322880; x=1527532480;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=S7pcjNPFilY9ET5XAzM1IdGlRuxbOXiVJe7bkGT8x7U=;
	b=jLq20OVGLQc8sdLM35D1gYKVSIzvojc546MWTl2D8JT0cKB1Df+grD1K
	G94OkXUTNz5vwsgbKIrfufgqNuqAgFmP9Yb9Mu23lDsQB0uZuMqQHBNWy
	aFUwQylKXprX+fZP7voxRjuGntNUreUuUauXHlmWJiWauFX3TRlPBdADc 4=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0APBABb0/la/4sNJK1cGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNDYXsojFSMEoFYIYEPi0aJZAsbhFECgxEhOBQBAgEBAQE?=
	=?us-ascii?q?BAQJsHAyFKAEBAQMBOAI/BQsLGC5XBgESgyWBdwitR4hAgieIJYITgT6CXIp?=
	=?us-ascii?q?HAocwCIRfZD2DUYctCYVniiA9gyiHVJA8AgQLAhMBgSUzIYFSTSMVgn4Jgj+?=
	=?us-ascii?q?JGYUNHzCQaQEB?=
X-IronPort-AV: E=Sophos;i="5.49,401,1520899200"; d="scan'208";a="114325999"
Received: from alln-core-6.cisco.com ([173.36.13.139])
	by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 May 2018 18:25:01 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-6.cisco.com (8.14.5/8.14.5) with ESMTP id w4EIP1Oa019348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 14 May 2018 18:25:01 GMT
Date: Mon, 14 May 2018 11:25:01 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
In-Reply-To: <CAJTo0LZmS7TFPhQLsUFY0=BCAgAtrZm=6q-Y5TSB7XhP0zLpWQ@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1805140833400.58919@sjc-ads-6991.cisco.com>
References: <1522952730-5967-1-git-send-email-kamensky@cisco.com>
	<1522952730-5967-6-git-send-email-kamensky@cisco.com>
	<CAJTo0LZmS7TFPhQLsUFY0=BCAgAtrZm=6q-Y5TSB7XhP0zLpWQ@mail.gmail.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 5/5] crosstap: replace script with new python based implementation
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
X-List-Received-Date: Mon, 14 May 2018 18:34:38 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII



On Mon, 14 May 2018, Burton, Ross wrote:

> On 5 April 2018 at 19:25, Victor Kamensky <kamensky@cisco.com> wrote:
>> New crosstap python implementation is total replacement for
>> crosstap shell script, that has superseding capabilities.
>> New script support cross compiling of SystemTap scripts
>> for user-land, by using supplied image rootfs. Whereas old
>> script could only deal with scripts against kernel. New script
>> has more complex logic and additional capabilities.
>
> ...
>
>> +        benv_kernel = BitbakeEnv("virtual/kernel")
>> +        (self.staging_bindir_toolchain,
>> +         self.target_prefix,
>> +         self.target_arch,
>> +         self.target_kernel_builddir
>> +        ) = benv_kernel.get_vars(
>> +             ("STAGING_BINDIR_TOOLCHAIN",
>> +              "TARGET_PREFIX",
>> +              "TRANSLATED_TARGET_ARCH",
>> +              "B"
>> +            ))
>
>> +        if not os.path.isdir(self.target_kernel_builddir):
>> +            print("ERROR: Cannot find '" + self.target_kernel_builddir +
>> +                  "' directory. Was 'kernel/virtual' built?")
>> +            ret = False
>
> You can't assume that B exists and is useful, as if virtual/kernel was
> installed from sstate then all the installed pieces will be present
> but $B will be empty.

Ross, thank you for pointing to this. I will look at it.

Please note use of B of kernel/virtual by crosstap preceeded my
commit:

c6da6b64 (Tom Zanussi 2012-08-31 00:06:57 -0500 109) 
TARGET_KERNEL_BUILDDIR=$(echo "$BITBAKE_VARS" | grep ^B= \
c6da6b64 (Tom Zanussi 2012-08-31 00:06:57 -0500 110)   | cut -d '=' -f2 | 
cut -d '"' -f2)

I just followed the same logic.

> For example, I re-ran oe-selftest on the autobuilder, the kernel was
> extracted from sstate as the previous run built it, and the test
> failed:

Systemtap translator generates kernel module source and it needs
cross compiled environment to build it against proper kernel sources
build artifacts. I.e cross compilation of kernel module should
be supported when kernel is extracted from sstate.

So my thought was to figure out how to cross compile kernel module
against kernel/virtual sstate, I can take a look how recipe that
'inherit module' works in such case. So I've tried the following in
tree pulled today (cryptodev-module is recipe example that
does 'inherit module'):

Variant1:

bitbake cryptodev-module
bitbake -c clean linux-yocto
bitbake -c cleansstate cryptodev-module
bitbake cryptodev-module

Variant2:

bitbake cryptodev-module
mv tmp-glibc tmp-glibc.bak
bitbake linux-yocto
bitbake cryptodev-module

In both cases I see that full kernel rebuild (pull source, compile,
etc) is retriggered by building cryptodev-module, even if
linux-yocto initially is pulled from sstate. In Variant1
cryptodev-module build actually failed because some host utilities
from kernel tree (like scripts/basic/fixdep) were not rebuilt.

I don't think it is proper for crosstap utility to retrigger
full kernel/virtual build. So unless kernel module build against
kernel/virtual sstate without full rebuild of kernel/virtual is
solved I am not sure what I can do in crosstap script.

Currently I see that work-shared/$MACHINE/kernel-source and
work-shared/$MACHINE/kernel-build-artifacts are created and it
seems their purpose is to facilitate external kernel modules
build, and maybe need to full kernel rebuild will be fixed soon.

Do I miss something? Any advise how to address this problem
is appreciated.

Thanks,
Victor

> 2018-05-13 22:36:08,905 - oe-selftest - INFO - FAIL:
> test_crosstap_can_use_systemtap_on_qemu (crosstap.CrossTapTest)
> 2018-05-13 22:36:08,906 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> 2018-05-13 22:36:08,906 - oe-selftest - INFO - Traceback (most recent
> call last):
>  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/crosstap.py",
> line 25, in test_crosstap_can_use_systemtap_on_qemu
>    self.assertIn('hello world', result.output, 'Crosstap failed.')
> AssertionError: 'hello world' not found in 'ERROR: Cannot find
> \'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/linux-yocto/4.14.30+gitAUTOINC+ea9330894e_74f6cd2b69-r0/linux-qemux86_64-standard-build\'
> directory. Was \'kernel/virtual\' built?
>
> Ross
>

