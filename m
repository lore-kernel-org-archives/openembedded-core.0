Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TBTEJ-0002DH-2s
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:22:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8BG9srt024690
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Sep 2012 09:09:54 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 11 Sep 2012 09:09:53 -0700
Message-ID: <504F6251.8020702@windriver.com>
Date: Tue, 11 Sep 2012 11:09:53 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20120911130155.GC14077@jama.jama.net>
	<20120911134814.GF14077@jama.jama.net>
	<504F5E0C.7040502@windriver.com>
	<20120911155930.GH14077@jama.jama.net>
In-Reply-To: <20120911155930.GH14077@jama.jama.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: ARM-tuning -- was qemuarm: should it really have TUNE_ARCH armv5te?
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
X-List-Received-Date: Tue, 11 Sep 2012 16:22:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/12 10:59 AM, Martin Jansa wrote:
> On Tue, Sep 11, 2012 at 10:51:40AM -0500, Mark Hatle wrote:
>> On 9/11/12 8:48 AM, Martin Jansa wrote:
>>> On Tue, Sep 11, 2012 at 03:01:55PM +0200, Martin Jansa wrote:
>>>> Hi,
>>>>
>>>> when building spitz and qemuarm (both produces packages in armv5te feed)
>>>> resulting packages are tuned with -mtune=xscale (when built for spitz)
>>>> or -mtune=arm926ej-s (when built for qemuarm).
>>
>> I argued this when we original did the work for the tunings, and I lost....
>>
>>>> From
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=1916#c5
>>>> Firstly, if you go changing the tune parameters in a given machine, you are expected to use a different PACKAGE_ARCH. If you do that, you will get a different package feed for the different binaries, different WORKDIR and so on. This was always the way the package architectures was intended to work and nothing has changed there. Yes, you as the user changing various variables can create inconsistent package feeds. There are 101 ways you can do that, the simple answer is just don't. We're therefore unlikely to add MACHINE to DEPLOY_DIR or remove PACKAGE_ARCH, please just use it as its intended.
>>
>> That is certainly my expectation.  I'm not sure that the arm926ej-s can produce
>> binaries that are -not- arm5te binaries -- as that seems to be the standard for
>> what an armv5te is.  The xscale on the other hand is capable of having different
>> tuning parameters and had a few additional instructions.  In the past I've
>> generated a tuning simple called "xscale" that was compatible w/ armv5te.  This
>> way you could share non-optimized things, and go w/ xscale as necessary.
>
> Few more comments I did on IRC:
>
> 16:41:23 < JaMa> let's hope RP will comment on that as that was his comment I was copy&pasting
> 16:41:53 < JaMa> e.g. ppc seems to set TUNE_PKGARCH for each tune-*
> 16:44:24 < JaMa> but it would be better to set xscale/arm926 tune only for packages where such -mtune brings some speedup (and for those where we set PACKAGE_ARCH = MACHINE_ARCH already) and build the rest only with -march
> 16:45:36 < JaMa> but mixed feed and -mtune=xscale packages on arm926 targets looks like worst case
> 16:50:20 < JaMa> oe-classic had the same issue with mixed -mtune in package arch feeds, but at least it wasn't rebuilding them after each machine switch
>
> And I'm not sure where we could decide what's worth -mtune and what is not,
> because in recipe we can do it only with a lot of _arch overrides and in tune
> file with lot of _pn-foo overrides (and some could be also in other layers then oe-core etc.)
>
> But it would be nice to share most packages as "general" armv5te between e.g. spitz and qemuarm builds.

This really hints that defining the tunings become a distribution configuration.

You should be able to do:

DEFAULTTUNE_pn-openssl = "xscale"

To enable just openssl benefits from the xscale tunings.  (The pn- may not be 
needed.. I can never remember anymore...)  But that was the original idea with 
the tunings, make a way to specify DEFAULTTUNE for various things when 
alternative, but compatible tunings made a difference...  set that in the 
distro.conf and you have an optimized distribution for specific uses.  (You of 
course could also move that to a machine setting or similar file.)

--Mark

> Cheers,
>
>>
>>>> Does qemuarm use oe-core as it's intended?
>>>
>>> CCing bluelightning because xscale is used in lot of meta-handheld machines:
>>>
>>> Does this make sense?
>>>
>>> OE @ ~/openembedded-core/meta/conf/machine/include $ diff -uNr tune-arm926*; diff -uNr tune-xscale.inc*
>>> --- tune-arm926ejs.inc  2012-09-11 15:45:47.958202057 +0200
>>> +++ tune-arm926ejs.inc.new      2012-09-11 15:45:40.579194777 +0200
>>> @@ -8,4 +8,4 @@
>>>    AVAILTUNES += "arm926ejs"
>>>    TUNE_FEATURES_tune-arm926ejs = "${TUNE_FEATURES_tune-armv5te} arm926ejs"
>>>    PACKAGE_EXTRA_ARCHS_tune-arm926ejs = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
>>> -
>>> +TUNE_PKGARCH_tune-arm926ejs = "armv5te-arm926ejs"
>>
>> I'd suggest simply arm926ejs....
>>
>>> --- tune-xscale.inc     2012-08-28 11:01:04.899070433 +0200
>>> +++ tune-xscale.inc.new 2012-09-11 15:43:24.560060591 +0200
>>> @@ -8,10 +8,12 @@
>>>    AVAILTUNES += "xscale"
>>>    TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5te} xscale"
>>>    PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
>>> +TUNE_PKGARCH_tune-xscale = "armv5te-xscale"
>>
>> Again simplify to xscale
>>
>>>    AVAILTUNES += "xscale-be"
>>>    TUNE_FEATURES_tune-xscale-be = "${TUNE_FEATURES_tune-armv5teb} xscale bigendian"
>>>    PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
>>> +TUNE_PKGARCH_tune-xscale-be = "armv5teb-xscale"
>>
>> And xscaleeb (or be)
>>
>> --Mark
>>
>>>    # webkit-gtk has alignment issues with double instructions on armv5 so
>>>    # disable them here
>>>
>>>>
>>>> Shouldn't spitz produce something like armv5te-xscale and qemuarm armv5te-arm926ejs?
>>>> It would cause all recipes to build again (cannot share armv5te feed anymore),
>>>> but at least it would build it and user will really get it on target, right now
>>>> opkg upgrade can download some packages with xscale some with arm926ej-s.
>>>>
>>>> $ ~/bitbake/bin/bitbake-diffsigs
>>>>     stamps.1347348910/spitz/armv5te-oe-linux-gnueabi/linux-libc-headers-3.4.3-r0.do_configure.sigdata.04b364a15889fcff7502614f1c116abc
>>>>     stamps.1347348910/qemuarm/armv5te-oe-linux-gnueabi/linux-libc-headers-3.4.3-r0.do_configure.sigdata.656f0583be969b427f040f2e143bcb14
>>>>     basehash changed from 7fe9c0a3455dac20ba6a90ed337b097e to d8dd2ff8613d0aafe60bef1a1e9469a1
>>>>     Variable TUNE_CCARGS value changed from
>>>>     ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
>>>>     ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}
>>>>     ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}
>>>>     ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}
>>>>     ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)}
>>>>     ${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale", "", d)}
>>>>     to
>>>>     ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
>>>>     ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}
>>>>     ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}
>>>>     ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}
>>>>     ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)}
>>>>     ${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=arm926ej-s", "", d)}
>>>>
>>>> --
>>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>
>>>
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



