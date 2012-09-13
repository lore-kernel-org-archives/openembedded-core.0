Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TCCm4-0002Uw-0I
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 19:00:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8DGlgsO002373
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 09:47:42 -0700 (PDT)
Received: from msp-dhcp28.wrs.com (172.25.34.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 13 Sep 2012 09:47:42 -0700
Message-ID: <50520E2E.1040804@windriver.com>
Date: Thu, 13 Sep 2012 11:47:42 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20120911130155.GC14077@jama.jama.net>
	<1347460383.11710.34.camel@ted>
	<20120913062017.GA11252@jama.jama.net>
	<1347532926.11710.66.camel@ted>
In-Reply-To: <1347532926.11710.66.camel@ted>
Subject: Re: qemuarm: should it really have TUNE_ARCH armv5te?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 17:00:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/12 5:42 AM, Richard Purdie wrote:
> On Thu, 2012-09-13 at 08:20 +0200, Martin Jansa wrote:
>> On Wed, Sep 12, 2012 at 03:33:03PM +0100, Richard Purdie wrote:
>>> On Tue, 2012-09-11 at 15:01 +0200, Martin Jansa wrote:
>>>> Hi,
>>>>
>>>> when building spitz and qemuarm (both produces packages in armv5te feed)
>>>> resulting packages are tuned with -mtune=xscale (when built for spitz)
>>>> or -mtune=arm926ej-s (when built for qemuarm).
>>>>
>>>> From
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=1916#c5
>>>> Firstly, if you go changing the tune parameters in a given machine,
>>>> you are expected to use a different PACKAGE_ARCH. If you do that, you
>>>> will get a different package feed for the different binaries,
>>>> different WORKDIR and so on. This was always the way the package
>>>> architectures was intended to work and nothing has changed there. Yes,
>>>> you as the user changing various variables can create inconsistent
>>>> package feeds. There are 101 ways you can do that, the simple answer
>>>> is just don't. We're therefore unlikely to add MACHINE to DEPLOY_DIR
>>>> or remove PACKAGE_ARCH, please just use it as its intended.
>>>>
>>>> Does qemuarm use oe-core as it's intended?
>>>>
>>>> Shouldn't spitz produce something like armv5te-xscale and qemuarm armv5te-arm926ejs?
>>>> It would cause all recipes to build again (cannot share armv5te feed anymore),
>>>> but at least it would build it and user will really get it on target, right now
>>>> opkg upgrade can download some packages with xscale some with arm926ej-s.
>>>>
>>>> $ ~/bitbake/bin/bitbake-diffsigs
>>>>    stamps.1347348910/spitz/armv5te-oe-linux-gnueabi/linux-libc-headers-3.4.3-r0.do_configure.sigdata.04b364a15889fcff7502614f1c116abc
>>>>    stamps.1347348910/qemuarm/armv5te-oe-linux-gnueabi/linux-libc-headers-3.4.3-r0.do_configure.sigdata.656f0583be969b427f040f2e143bcb14
>>>>    basehash changed from 7fe9c0a3455dac20ba6a90ed337b097e to d8dd2ff8613d0aafe60bef1a1e9469a1
>>>>    Variable TUNE_CCARGS value changed from
>>>>    ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
>>>>    ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}
>>>>    ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}
>>>>    ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}
>>>>    ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)}
>>>>    ${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale", "", d)}
>>>>    to
>>>>    ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
>>>>    ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}
>>>>    ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}
>>>>    ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}
>>>>    ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)}
>>>>    ${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=arm926ej-s", "", d)}
>>>>
>>>
>>> This is a tricky one. As others have mentioned, this is a tune
>>> parameter, not an arch one and as such the binaries are compatible with
>>> each other although they potentially are compiled differently with
>>> different optimisations.
>>>
>>> As such, mixing the feeds is permitted and will not cause any real world
>>> usage problem. As you point out, sstate is much more sensitive to this
>>> kind of change and is correctly deciding the output is different though.
>>>
>>> I think my preferred approach would be to have the tune files do
>>> something like:
>>>
>>> -mtune=${ARMV5TEDEFAULTTUNE}
>>>
>>> and then the user can set ARMV5DEFAULTTUNE to whatever the believe is a
>>> appropriate. This would result in the package feed at least having a
>>> consistent state of one tune and sstate would be happy. It then becomes
>>> a distro policy decision which is what it should be. ARMV5TEDEFAULTTUNE
>>> would default to the current values meaning the distro would then just
>>> do:
>>>
>>> ARMV5TEDEFAULTTUNE_poky = "xscale"
>>>
>>> and hence make their decision. Of course the distro could also decide to
>>> split the package architectures up which is equally fine.
>>>
>>> Does something like that sound like it would work?
>>
>> My solution seems to be a bit more flexible then this.
>
> Which cases does it enable which the above doesn't?
>
> I'm a little worried about adding more indirection to the DEFAULTTUNE
> variable itself since the whole tune situation is already convoluted and
> indirected enough without adding another level of it :/. That variable
> is the one exposed to the user straight away, not hidden more behind the
> scenes.
>
> Taking a step back and looking at the APIs I'm really not very happy
> with the usability of them already and I don't think this helps.
>
> Someone commented about the ppc situation and I was told that there, the
> binaries are incompatible with each other. It is more unusual to have
> situations where there are micro-optimisations through -mtune yet the
> binaries remain compatible.

On PPC there are a bunch of different ABIs:

PPC32 (Classic)
PPC32-soft float (Classic)
PPC32-e500v1 (e500v1 instructions and registers)
PPC32-e500v2 (e500v2 instructions and registers)

There are some variations in the classic mode, w/ and w/o using Altivec. 
However, on PPC the save/restore of variables on context switching is done using 
exception handling -- and register passing for classic mode is always through 
normal registers.

They do have variants of processors for the PPC32 and PPC32-soft float ABIs, for 
each variant we just assign a new package arch -- and then make that compatible 
with the other package archs.  (Almost exactly the same way it's done on 
traditional Linux systems on x86).

So in the end you really have two levels of information that make up the package 
ARCH.  ABI & CPU instructions/optimization.

MIPS is a bit more complex, but generally the same rules apply.  You have ABI 
and processor optimizations that produce the package ARCH.

ARM seems to be the one exception, where you have three levels.. ABI 
(EABI/hf-EABI), processor family (armv4, armv5, armv7, cortext....), and then 
CPU optimization.  This seems to cause additional confusion, as the CPU 
optimizations are not being captured in the current package ARCH, which makes it 
difficult to optimize on a feed.

--Mark

> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



