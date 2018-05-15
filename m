Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB48174EC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 13:21:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4FDKO2Q024088
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 May 2018 06:20:40 -0700
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 May 2018 06:20:14 -0700
To: Victor Kamensky <kamensky@cisco.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <1522952730-5967-1-git-send-email-kamensky@cisco.com>
	<1522952730-5967-6-git-send-email-kamensky@cisco.com>
	<CAJTo0LZmS7TFPhQLsUFY0=BCAgAtrZm=6q-Y5TSB7XhP0zLpWQ@mail.gmail.com>
	<alpine.LRH.2.00.1805140833400.58919@sjc-ads-6991.cisco.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <f8b6eefa-fb0c-6fc1-7a20-5eb3a82c7ff6@windriver.com>
Date: Tue, 15 May 2018 09:20:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.00.1805140833400.58919@sjc-ads-6991.cisco.com>
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
X-List-Received-Date: Tue, 15 May 2018 13:21:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05/14/2018 02:25 PM, Victor Kamensky wrote:
> 
> 
> On Mon, 14 May 2018, Burton, Ross wrote:
> 
>> On 5 April 2018 at 19:25, Victor Kamensky <kamensky@cisco.com> wrote:
>>> New crosstap python implementation is total replacement for
>>> crosstap shell script, that has superseding capabilities.
>>> New script support cross compiling of SystemTap scripts
>>> for user-land, by using supplied image rootfs. Whereas old
>>> script could only deal with scripts against kernel. New script
>>> has more complex logic and additional capabilities.
>>
>> ...
>>
>>> +        benv_kernel = BitbakeEnv("virtual/kernel")
>>> +        (self.staging_bindir_toolchain,
>>> +         self.target_prefix,
>>> +         self.target_arch,
>>> +         self.target_kernel_builddir
>>> +        ) = benv_kernel.get_vars(
>>> +             ("STAGING_BINDIR_TOOLCHAIN",
>>> +              "TARGET_PREFIX",
>>> +              "TRANSLATED_TARGET_ARCH",
>>> +              "B"
>>> +            ))
>>
>>> +        if not os.path.isdir(self.target_kernel_builddir):
>>> +            print("ERROR: Cannot find '" + 
>>> self.target_kernel_builddir +
>>> +                  "' directory. Was 'kernel/virtual' built?")
>>> +            ret = False
>>
>> You can't assume that B exists and is useful, as if virtual/kernel was
>> installed from sstate then all the installed pieces will be present
>> but $B will be empty.
> 
> Ross, thank you for pointing to this. I will look at it.
> 
> Please note use of B of kernel/virtual by crosstap preceeded my
> commit:
> 
> c6da6b64 (Tom Zanussi 2012-08-31 00:06:57 -0500 109) 
> TARGET_KERNEL_BUILDDIR=$(echo "$BITBAKE_VARS" | grep ^B= \
> c6da6b64 (Tom Zanussi 2012-08-31 00:06:57 -0500 110)   | cut -d '=' -f2 
> | cut -d '"' -f2)
> 
> I just followed the same logic.
> 
>> For example, I re-ran oe-selftest on the autobuilder, the kernel was
>> extracted from sstate as the previous run built it, and the test
>> failed:
> 
> Systemtap translator generates kernel module source and it needs
> cross compiled environment to build it against proper kernel sources
> build artifacts. I.e cross compilation of kernel module should
> be supported when kernel is extracted from sstate.
> 
> So my thought was to figure out how to cross compile kernel module
> against kernel/virtual sstate, I can take a look how recipe that
> 'inherit module' works in such case. So I've tried the following in
> tree pulled today (cryptodev-module is recipe example that
> does 'inherit module'):
> 
> Variant1:
> 
> bitbake cryptodev-module
> bitbake -c clean linux-yocto
> bitbake -c cleansstate cryptodev-module
> bitbake cryptodev-module
> 
> Variant2:
> 
> bitbake cryptodev-module
> mv tmp-glibc tmp-glibc.bak
> bitbake linux-yocto
> bitbake cryptodev-module
> 
> In both cases I see that full kernel rebuild (pull source, compile,
> etc) is retriggered by building cryptodev-module, even if
> linux-yocto initially is pulled from sstate. In Variant1
> cryptodev-module build actually failed because some host utilities
> from kernel tree (like scripts/basic/fixdep) were not rebuilt.
> 
> I don't think it is proper for crosstap utility to retrigger
> full kernel/virtual build. So unless kernel module build against
> kernel/virtual sstate without full rebuild of kernel/virtual is
> solved I am not sure what I can do in crosstap script.

I recall some work that we did on this 2 (or was it 3) year ago
now .. but can't dig up the thread references. The choices were
to have the helper utilities in sstate or trigger their rebuild
from the shared source + build artifacts. Obviously the outcome
of that work was not a complete solution.

> 
> Currently I see that work-shared/$MACHINE/kernel-source and
> work-shared/$MACHINE/kernel-build-artifacts are created and it
> seems their purpose is to facilitate external kernel modules
> build, and maybe need to full kernel rebuild will be fixed soon.

Correct. The build artifacts are enough to build external
modules, but not a full kernel rebuild, that is what the kernel-devsrc
does. But even those full kernel rebuilds do required the scripts/helper
utilities to be rebuilt.

The recipes that inherit modules really should be triggering the
rebuild of those helper scripts if they don't exist, so if that
isn't working, or not enough of the kernel build infrastructure is
in the build-artifacts directory .. that is an area to look into
more.

Bruce

> 
> Do I miss something? Any advise how to address this problem
> is appreciated.
> 
> Thanks,
> Victor
> 
>> 2018-05-13 22:36:08,905 - oe-selftest - INFO - FAIL:
>> test_crosstap_can_use_systemtap_on_qemu (crosstap.CrossTapTest)
>> 2018-05-13 22:36:08,906 - oe-selftest - INFO -
>> ----------------------------------------------------------------------
>> 2018-05-13 22:36:08,906 - oe-selftest - INFO - Traceback (most recent
>> call last):
>>  File 
>> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/crosstap.py", 
>>
>> line 25, in test_crosstap_can_use_systemtap_on_qemu
>>    self.assertIn('hello world', result.output, 'Crosstap failed.')
>> AssertionError: 'hello world' not found in 'ERROR: Cannot find
>> \'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/linux-yocto/4.14.30+gitAUTOINC+ea9330894e_74f6cd2b69-r0/linux-qemux86_64-standard-build\' 
>>
>> directory. Was \'kernel/virtual\' built?
>>
>> Ross
>>


