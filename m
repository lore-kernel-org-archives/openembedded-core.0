Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 52BB673772
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 14:01:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5JE15YB003963
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 Jun 2015 07:01:05 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Fri, 19 Jun 2015 07:01:04 -0700
Message-ID: <558420A0.309@windriver.com>
Date: Fri, 19 Jun 2015 09:01:04 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
References: <1434633188-3434-1-git-send-email-dbaryshkov@gmail.com>
	<CALT56yOBxbjc=F96unuigiBAR9En9kYKce9ZqWmtkneOGYVQqQ@mail.gmail.com>
In-Reply-To: <CALT56yOBxbjc=F96unuigiBAR9En9kYKce9ZqWmtkneOGYVQqQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arch-mips.inc: don't override TRANSLATED_TARGET_ARCH
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
X-List-Received-Date: Fri, 19 Jun 2015 14:01:06 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 6/19/15 4:23 AM, Dmitry Eremin-Solenikov wrote:
>> On 6/18/15 8:13 AM, Dmitry Eremin-Solenikov wrote:
>>> Currently MIPS64 N32 is broken. There is internal disagreement
>>> between TARGET_ARCH (which doesn't contain ABIEXTENSION) and
>>> TRANSLATED_TARGET_ARCH (which contains ABIEXTENSION). ABI is already
>>> encoded into the TARGET_OS. ARM tunes in the same situation override
>>> neither the TARGET_ARCH nor the TRANSLATED_TARGET_ARCH. So let's drop
>>> this override.
>>
>> This series won't work properly, unless I'm reading something incorrectly.
>>
>> You won't be able to build/install a tri-lib system after this change, as
>> something needs to be there to differential between MIPS32 (o32), MIPS64 (n32)
>> and MIPS64 (n64).
>>
>> Currently this is done via the ABIEXTENSION value.
> 
> Why do you need this differentiation in the TARGET_ARCH? We have TARGET_SYS
> (triplets) for that, don't we? And the compilers for the N64/N32 (the
> only thing IIRC
> that is really dependent on the TARGET_ARCH) should be interchangeable, AFAIU.

The triplet for o32 is:

mips-os-linux

The triplet to n64 is:

mips64-os-linux

The triplet to n32 is:

mips64-os-linux

thus w/o the ABI extension there is no mechanism to distinguish between n64 and n32.

> Can you point me, please, how to create a tri-ABI SDK and/or image?

Configure with a MIPS64 capable machine (yes qemumips64 is adequate).  Then add
the following to your local.conf:

require conf/multilib.conf
DEFAULTTUNE = "mips32r2"

MULTILIBS = "multilib:lib32 multilib:lib64"
DEFAULTTUNE_virtclass-multilib-lib32 = "mips64-n32"
DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"


This will set the default ABI to 'o32', with optional n32 and n64 support.  (You
can switch around the defaulttune values to change which is default and which is
optional.  A common config is n32 default, o32 / n64 optional.)

>>
>> What is currently broken w/ MIPS64 N32?  We put in a number of fixes for this
>> problem and SDK generation in the YP 1.8 time frame.  Perhaps something has
>> changed since then or maybe the fixes were not as complete as we thought?
> 
> Quite simple configuration (MIPS64 N32 image) fails to build.
> 
> 
> lumag@nexs:~/OE$ MACHINE=qemumips64n32 bitbake core-image-base
> NOTE: Started PRServer with DBfile:
> /home/lumag/OE/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46391, PID:
> 15895
> Loading cache: 100%
> |########################################################################################################################|
> ETA:  00:00:00
> Loaded 1302 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'binutils-cross-canadian-mips64' (but
> /home/lumag/OE/sources/openembedded-core/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'binutils-cross-canadian-mips64' is unbuildable,
> removing...

Looks to me that when binutils was upgraded, the rename of the arch component
broke in some way.  The arch renaming used by the cross-canadian toolchain
components SHOULD have changed things to me "mips64-n32" in the n32 case.  This
is the purpose of the ABIEXTENSION being added to the 'TRANSLATED_TARGET_ARCH'
in arch-mips.conf.  See commit: 0bcc01121e928d0be7a0550e500425852c63cf98 for
additional details.

(The commit msg includes the configuration listed above as well.)

--Mark

> Missing or unbuildable dependency chain was: ['binutils-cross-canadian-mips64']
> NOTE: Runtime target 'packagegroup-cross-canadian-qemumips64n32' is
> unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-cross-canadian-qemumips64n32',
> 'binutils-cross-canadian-mips64']
> ERROR: Required build target 'core-image-base' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-base',
> 'packagegroup-cross-canadian-qemumips64n32',
> 'binutils-cross-canadian-mips64']
> 
> 
> 
> 


