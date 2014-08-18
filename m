Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7910465DD6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 13:43:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7IDgqL3003355
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Aug 2014 06:42:52 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 18 Aug 2014 06:42:51 -0700
Message-ID: <53F202DA.5070104@windriver.com>
Date: Mon, 18 Aug 2014 21:42:50 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1408366010.1669.11.camel@ted> <20140818131443.GL3660@jama>
In-Reply-To: <20140818131443.GL3660@jama>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Allarch and packagegroup improvement proposal
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
X-List-Received-Date: Mon, 18 Aug 2014 13:43:30 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/18/2014 09:14 PM, Martin Jansa wrote:
> On Mon, Aug 18, 2014 at 01:46:50PM +0100, Richard Purdie wrote:
>> As some people are already painfully aware, the current way packagegroup
>> and allarch interact with the sstate signatures is painful.
>>
>> Some example problem cases:
>>
>> * An allarch package of scripts with an interpretor dependency (e.g perl)
>>
>> * A packagegroup with dependencies on something which is debian renamed
>>    e.g. build-essentials on libgmp
>>
>>
>> Currently, packagegroups default to allarch and have their sstate
>> dependencies truncated. This means that when something like gmp
>> rebuilds, it can change package name thanks to debian renaming but the
>> packagegroup referencing the old name remains, causing image creation
>> failures.
>>
>> So the "obvious" fix is to stop truncating the dependencies? Well, that
>> means that the allarch package is written out every time machine changes
>> to a different arch.
>>
>> So we need to make packagegroups PACKAGE_ARCH specific? Well, this still
>> doesn't solve the problem of allarch packages having ever greater
>> problems with things like dependencies on perl.
>
> Well then maybe that allarch package with perl dependency shouldn't be
> marked as allarch.
>
>> An alternative solution I'm wondering about to address both issues is:
>>
>> * the sstatesig packagegroup code for dependencies handling should only
>> trigger for allarch
>> * we add a sanity test that checks if renaming has happened for
>> packagegroup dependencies and warn if it has.
>>
>> The trouble is the sstatesig code doesn't have the full data store, only
>> a limited cross section so it can't check if PACKAGE_ARCH == all, only
>> if the class is inherited. We therefore probably need to change
>> packagegroup to do conditional class inclusion (which is possible with
>> the modern code base at least). The use of the class can be tested from
>> the sstatesig code and hence indicate allarch.
>>
>>
>> For the second part, we could add something like:
>>
>> +    if bb.data.inherits_class('packagegroup', d) and bb.data.inherits_class('allarch', d):
>> +        if set(deps) != set(new_depends):
>> +            bb.warn("allarch packagegroup %s has renamed dependency %s" % (pkg, str(set(deps) ^ set(new_depends))))
>>
>> to runtime_mapping_rename in package.bbclass which tells us which
>> packagegroups need to move to be PACKAGE_ARCH. Unfortunately, a quick
>> run of OE-Core shows:
>>
>> WARNING: allarch packagegroup packagegroup-core-sdk has renamed dependency set(['libgomp', 'libgomp1'])
>> WARNING: allarch packagegroup packagegroup-core-x11-base has renamed dependency set(['dbus-1', 'dbus'])
>> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target has renamed dependency set(['libgcc1', 'libgcc-s-dev', 'libstdc++', 'libc6-dev', 'libgcc-dev', 'libgcc', 'libc6', 'eglibc-dbg', 'libc6-dbg', 'eglibc-dev', 'eglibc-thread-db', 'eglibc', 'libthread-db1', 'libstdc++6'])
>> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-dbg has renamed dependency set(['libgcc-s-dbg', 'eglibc-dbg', 'libc6-dbg', 'libgcc-dbg'])
>> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-dev has renamed dependency set(['libgcc-s-dev', 'libc6-dev', 'libgcc-dev', 'eglibc-dev'])
>> WARNING: allarch packagegroup packagegroup-core-x11-sato-base has renamed dependency set(['libsdl-1.2-0', 'libsdl'])
>> WARNING: allarch packagegroup packagegroup-core-x11-sato-base-dbg has renamed dependency set(['libsdl-dbg', 'libsdl-1.2-dbg'])
>> WARNING: allarch packagegroup packagegroup-core-x11-sato-base-dev has renamed dependency set(['libsdl-dev', 'libsdl-1.2-dev'])
>> WARNING: allarch packagegroup packagegroup-core-sdk has renamed dependency set(['libgomp', 'libgomp1'])
>> WARNING: allarch packagegroup packagegroup-core-x11-base has renamed dependency set(['dbus-1', 'dbus'])
>> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target has renamed dependency set(['libgcc1', 'libgcc-s-dev', 'libstdc++', 'libc6-dev', 'libgcc-dev', 'libgcc', 'libc6', 'eglibc-dbg', 'libc6-dbg', 'eglibc-dev', 'eglibc-thread-db', 'eglibc', 'libthread-db1', 'libstdc++6'])
>> WARNING: allarch packagegroup packagegroup-core-x11-sato-base has renamed dependency set(['libsdl-1.2-0', 'libsdl'])
>> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-dbg has renamed dependency set(['libgcc-s-dbg', 'eglibc-dbg', 'libc6-dbg', 'libgcc-dbg'])
>> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-dev has renamed dependency set(['libgcc-s-dev', 'libc6-dev', 'libgcc-dev', 'eglibc-dev'])
>> WARNING: allarch packagegroup packagegroup-core-buildessential has renamed dependency set(['libstdc++', 'libstdc++6'])
>> WARNING: allarch packagegroup packagegroup-core-buildessential has renamed dependency set(['libstdc++', 'libstdc++6'])
>>
>> so we do have the problem in a number of places.
>>
>> Does anyone have any thoughts?
>
> I'm in favor of removing default allarch and setting correct
> PACKAGE_ARCH manually in the packagegroup recipes like we do elsewhere.

I did a rough find and grep in oe-core, we have 27 packagegroup recipes:
$ find meta -name 'packagegroup-*.bb' | wc -l
27

And 7 ones which set the PACKAGE_ARCH:
$ grep PACKAGE_ARCH meta -r | grep 'packagegroup-.*.bb:' | wc -l
7

It seems that allarch still wins.

I think that we really need such a WARNING not matter whether remove the
default allarch or not. (if removed, we have to set the allarch for a few
packagegroup recipes, then we still need such a check.)

// Robert

>
> packagegroups are small and "rebuilt" quickly, so I don't mind
> "building" them once per TUNE_PKGARCH or even once per MACHINE_ARCH like
> we do for couple of them already.
>
> I can even find few changes from me on ML which do exactly that.
>
>
>

