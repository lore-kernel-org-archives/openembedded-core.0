Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-02.prod.phx3.secureserver.net
	(p3plsmtpa08-02.prod.phx3.secureserver.net [173.201.193.103])
	by mail.openembedded.org (Postfix) with ESMTP id A2B3161FE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 21:06:59 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa08-02.prod.phx3.secureserver.net with 
	id eM701o00V1mTNtu01M71Sh; Wed, 13 Aug 2014 14:07:01 -0700
Message-ID: <53EBD374.6070205@pabigot.com>
Date: Wed, 13 Aug 2014 16:07:00 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <53E9134F.7040108@pabigot.com> <53E95BD4.5090007@pabigot.com>
In-Reply-To: <53E95BD4.5090007@pabigot.com>
Subject: Re: Yocto development with C++11 threads and gcc
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
X-List-Received-Date: Wed, 13 Aug 2014 21:07:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/11/2014 07:12 PM, Peter A. Bigot wrote:
> On 08/11/2014 02:02 PM, Peter A. Bigot wrote:
>> The program below built on the target with the MACHINE=beaglebone 
>> gcc-4.9.1 compiler from Yocto/OpenEmbedded poky master produces this 
>> error:
>>
>> beaglebone[52]$ g++ -std=c++1y -pthread test.cc && ./a.out
>> starting
>> joining
>> pure virtual method called
>> terminate called without an active exception
>> Aborted (core dumped)
>>
>> When the program is recompiled with the defines for 
>> __GCC_HAVE_SYNC_COMPARE_AND_SWAP_X enabled as suggested at 
>> https://groups.google.com/d/msg/automatak-dnp3/Jisp_zGhd5I/ck_Cj6nO8joJ 
>> it works:
>>
>> beaglebone[53]$ g++ -std=c++1y -pthread test.cc && ./a.out
>> starting
>> joining
>> doit
>> done
>>
>> Preliminary analysis confirms that the built-ins for those defines 
>> are not being added by the compiler because it thinks the target 
>> doesn't support those operations.  Nonetheless, it doesn't use the 
>> substitutes that are obviously available.
>>
>> Can anybody recall anything about the way GCC is built under OE that 
>> would explain this?
>
> Not an OE problem.  See: 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=62100
>
> I'm testing a patch locally and awaiting GCC maintainer comment before 
> proposing it for OE.

The GNU folks objected to the workaround and suggested that the behavior 
is evidence that libstdc++ was not built with the same ABI flags as the 
compiler uses by default.

I built the release version of gcc 4.9.1 on the beaglebone and confirmed 
that it works fine.

This is indeed an OE-Core bug.

I've just sent a series of cleanup patches to gcc that may make it 
easier to detect differences.  I've spent some time changing the 
"obvious" things and have been unable to figure out where the 
compilation is going wrong.  I'm hoping somebody else can help out; as 
C++11 becomes more prevalent the workaround recommended on stackoverflow 
and other sites will continue to propagate, and it's not the right solution.

Peter


