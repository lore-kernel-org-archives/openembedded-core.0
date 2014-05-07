Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31F5360650
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 14:37:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s47EbG3e007656
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 May 2014 07:37:16 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Wed, 7 May 2014 07:37:15 -0700
Message-ID: <536A451B.7080809@windriver.com>
Date: Wed, 7 May 2014 09:37:15 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Bj=F6rn_Krombholz?= <pirobk@gmail.com>, Khem Raj
	<raj.khem@gmail.com>
References: <536899F5.1030104@gmail.com>	<20140506205518.GE11339@denix.org>	<CAMKF1spaD8x1e2VYMwq34R2RLbz6xDw9ypDVwzr8sQJBuOpm5A@mail.gmail.com>	<5369533B.9010209@windriver.com>	<CAMKF1srtVO7u8OU5v=V=B4Gmy6LdD21jMKftTBwcS2+Q99V5xA@mail.gmail.com>
	<536957A8.90300@windriver.com> <536A2D11.8000009@gmail.com>
In-Reply-To: <536A2D11.8000009@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain doesn't compile working binaries
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
X-List-Received-Date: Wed, 07 May 2014 14:37:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

On 5/7/14, 7:54 AM, Björn Krombholz wrote:
> On 05/06/2014 11:44 PM, Mark Hatle wrote:
>> On 5/6/14, 4:40 PM, Khem Raj wrote:
>>>
>>> On May 6, 2014 2:25 PM, "Mark Hatle" <mark.hatle@windriver.com
>>> <mailto:mark.hatle@windriver.com>> wrote:
>>> so they
>>> need a hard path to the correct ld.so to get started.
>>>
>>> isnt this fixed by the installer when it is run
>>
>> Yes, it sounds like either he moved the files after the the installer
>> ran, or didn't use the installer at all and just tried to execute them
>> out of the build system.
>>
>> (If the installer -was- used, then it's definitely a bug.)
>
>
> The installer _was_ used, I didn't move any files and used the default
> location /usr/local/oecore-[...]
>
> Thanks for the hints.
>
> Additional note, in case it was missed: I am using v2013.06 (yocto 1.4 base, Angstrom variant)
>
>
> I guess the problem is, that the relocation_sdk.py excludes /lib/ and
> 32/64 bit variants.
>
> I just
> - re-run the installer with -S
> - edited the extracted relocation script commented the lines out:
>
>              #if fname.startswith("/lib/") or fname.startswith("/lib64/") or fname.startswith("/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib64/"):
>              #    break
>
> - re-run the relocation
>
> Now I see the expected result, matching the "old" toolchain from summer 2013:
> # ldd /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/m4
>          linux-vdso.so.1 (0x00007fffe6800000)
>          libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/../../lib/libc.so.6 (0x00007f86e8110000)
>          /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00007f86e84c0000)

The bove may work, but it's incorrect.  It appears to be trying to run:
   /lib64/ld-linux-x86-64.so.2, -instead- of
 
/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2

The check is there specifically because some distribution creators add software 
that is expected to use the host system's ld.so (ld-linux-x86-64.so.2 in this 
case) loader.  So we detect that behavior by looking for system paths embedded 
into a particular binaries executable.

In this case, where m4 is provided as a nativesdk item, there should be no 
references at all to the system /lib64/ld-linux-x86-64.so.2.

I'm not familiar with the YP 1.4 + Angstrom variant to expand on this and 
determine where the error actually is.  But in general nativesdk elements 
referencing any type of system ld.so is incorrect.

--Mark

> Executing the binary works as well.
>
>
> Comparing the binaries from the current toolchain with those from the old one skipping the relocation step (extracted toolchain with -R) shows:
>
> Old and working:
> # ldd m4
>          linux-vdso.so.1 (0x00007fffb1800000)
>          libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/./../../lib/libc.so.6 (0x00007f50bd210000)
>          /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00007f50bd5c0000)
>
> New and broken:
> # ldd m4
>          linux-vdso.so.1 (0x00007fff6c000000)
>          libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/./../../lib/libc.so.6 (0x00007fefc1de8000)
>          /lib64/ld-linux-x86-64.so.2 (0x00007fefc2198000)
>
> /lib64/ obviously doesn't get replaced.
>
> I have no clue how to debug this any further. Not even sure if the problem is more likely related to eglibc packages or somewhere hidden in the general OE build scripts. :/
>
> I will build a v2013.12 version now and check if there is any difference.
>


