Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58E9675CF1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 16:12:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAGGC3Cc020734
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 16 Nov 2015 08:12:03 -0800
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 16 Nov 2015 08:12:02 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com> <56433886.3060700@linux.intel.com>
	<564343E9.9020702@windriver.com> <5643497F.1080106@linux.intel.com>
	<5645EB64.4020200@windriver.com>
	<60657.10.252.13.130.1447431170.squirrel@linux.intel.com>
	<56461044.2020202@windriver.com> <5649A752.2060308@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <564A0051.2080005@windriver.com>
Date: Mon, 16 Nov 2015 10:12:01 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5649A752.2060308@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Mon, 16 Nov 2015 16:12:05 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 11/16/15 3:52 AM, Alexander Kanavin wrote:
> On 11/13/2015 06:31 PM, Mark Hatle wrote:
> 
>> The compiler today support many more instructions for a given architecture
>> family then QEMU models for that same architecture.
>>
>> IA32 -- some of the current and even some former generate i7 instructions fall
>> under this problem.  If you host system does not have the same instruction set,
>> QEMU doesn't know how to emulate everything.
>>
>> MIPS64 (Such as the Octeon III) is a good example.
>>
>> PowerPC has many variants as well that QEMU does not support.
>>
>> It would be wonderful if there was a tie together of what gcc/as and qemu
>> supported -- at least from an application perspective, but that simply doesn't
>> happen in the real world.
> 
> How about approaching this from the other side then? Machines can be 
> defined so that if gobject introspection distro feature is enabled, then 
> the standard qemu-supported compiler settings are used (same as 
> qemumips64 for instance). If not, then people can tweak the compiler to 
> their heart's content.

Problem is that gobject can't be limited by a 'machine'.  Since any machine
needs to theoretically have access to gobject built components.  (ignoring that
machines should never specify distro features...)

I think a small group of folks that are interested in this work and who
understand facets of it should get together and try to identify the problem and
come up with an alternative solution.

I have a lot of experience with pulling out internal structure size, packing,
order, etc from generated binaries via objdump, readelf and other mechanisms --
but I have no experience using gobject itself.

So if we could get together to identify how a gobject binary is generated -- how
the introspection happens internally -- and the output of the introspection
tool.  It's very likely that I or others can come up with an approach to do the
introspection that doesn't require QEMU.  (It may require the gobject binary
generation having additional information placed in it -- or an introspection to
occur at the time of compilation and saved away in a cache...)  but the point
is, we need to figure out a general solution to this that doesn't require QEMU
for "most things".

(BTW just to reiterate.  I COMPLETELY believe that we need to add gobject
support to oe-core in the next year.  And we need to try to help the gobject
community better support cross compilation as well, if they are receptive --
without dramatically altering there existing work.)

--Mark

> 
> Alex
> 


