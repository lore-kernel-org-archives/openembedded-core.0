Return-Path: <sledz@dresearch-fe.de>
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id C169A65D8E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 12:33:28 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 679EEE0115;
	Tue,  8 Apr 2014 12:33:29 +0000 (UTC)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by fensuse.internal.dresearch-fe.de (Postfix) with ESMTP id 369C3701204;
	Tue,  8 Apr 2014 14:33:29 +0200 (CEST)
Message-ID: <5343EC99.800@dresearch-fe.de>
Date: Tue, 08 Apr 2014 14:33:29 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <5330220F.8050504@dresearch-fe.de>		<1395664516.24232.56.camel@ted>	<533029C5.1000406@dresearch-fe.de>		<1395665593.24232.58.camel@ted>	<53303FAB.5020907@dresearch-fe.de>		<20140324151537.GD29998@jama>	<53315AE7.1020304@dresearch-fe.de>	
	<53319AAD.5070506@windriver.com>
	<53429BF2.2050804@dresearch-fe.de>	
	<5342A69C.9020901@dresearch-fe.de> <1396882151.24597.72.camel@ted>
In-Reply-To: <1396882151.24597.72.camel@ted>
X-Enigmail-Version: 1.6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: complex versioning scenario
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
X-List-Received-Date: Tue, 08 Apr 2014 12:33:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.04.2014 16:49, Richard Purdie wrote:
> On Mon, 2014-04-07 at 15:22 +0200, Steffen Sledz wrote:
>> On 07.04.2014 14:37, Steffen Sledz wrote:
>>> On 25.03.2014 16:03, Mark Hatle wrote:
>>>> ...
>>>> If the package 'requiring libfoo' has a DEPENDS += ... in it.. then yes, it should have been rebuilt when the libfoo was rebuilt.
>>>
>>> Unfortunately i can't confirm that.  :(
>>>
>>> part of the real app recipe:
>>> ------------> snip <-------------
>>> DEPENDS = "vala-native libdrtrace libdrhip libdrbcc jansson"
>>> RDEPENDS_${PN} = "dropmodes"
>>> ------------> snap <-------------
>>>
>>> part of the real resulting opkg control file for this app:
>>> ------------> snip <-------------
>>> Depends: dropmodes, libglib-2.0-0 (>= 2.36.4), libdrhip1 (>= gitr27+42af787eb2), libjansson4 (>= 2.4), libc6 (>= 2.18)
>>> ------------> snap <-------------
>>>
>>> I miss the runtime dependencies for libdrtrace and libdrbcc. Where are they gone?
>>
>> Some additional info:
>> ------------> snip <-------------
>> # objdump -p ./package/usr/lib/libdrhip.so.1.0.0
>>
>> ./package/usr/lib/libdrhip.so.1.0.0:     file format elf32-littlearm
>> ...
>> Dynamic Section:
>>   NEEDED               libc.so.6
>>   SONAME               libdrhip.so.1
>> ...
>>
>> # objdump -p ./package/usr/lib/libdrbcc.so.1.0.0
>>
>> ./package/usr/lib/libdrbcc.so.1.0.0:     file format elf32-littlearm
>> ...
>> Dynamic Section:
>>   NEEDED               libdrtrace.so.0
>>   NEEDED               libm.so.6
>>   NEEDED               libreadline.so.6
>>   NEEDED               libpthread.so.0
>>   NEEDED               libc.so.6
>>   SONAME               libdrbcc.so.1
>> ...
>>
>> # objdump -p ./package/usr/bin/drbccproxy
>>
>> ./package/usr/bin/drbccproxy:     file format elf32-littlearm
>> ...
>> Dynamic Section:
>>   NEEDED               libdrhip.so.1
>>   NEEDED               libdrbcc.so.0
>>   NEEDED               libdrtrace.so.0
>>   NEEDED               libgio-2.0.so.0
>>   NEEDED               libgobject-2.0.so.0
>>   NEEDED               libglib-2.0.so.0
>>   NEEDED               libjansson.so.4
>>   NEEDED               librt.so.1
>>   NEEDED               libpthread.so.0
>>   NEEDED               libc.so.6
>> ...
>> ------------> snap <-------------
>>
>> So it seems the data objdump shows are OK.
>>
>> E.g. the app drbccproxy really has a dependency to a libdrbcc. But this is not refelected in the control file.
> 
> At this point you'll probably have to look at the shlibs code in
> package.bbclass and see why its not picking up the shlib dependencies
> correctly for the packages...
> 
> It does appear there is some problem there but its hard to saw what
> without a test case to reproduce.

I could isolate the problem. :)

If a package contains a shared library *and* a binary (e.g. a related command line tool) then the soname major version *is not appended* to the package name (see debian_package_name_hook in debian.bbclass). All other problems are aftereffects.

Is this an intended behaviour? There should be a big fat warning if this is the case.

Or is it a bug?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

