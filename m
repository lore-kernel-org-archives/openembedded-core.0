Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1F106E64A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 14:53:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8MErxhr013307
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 07:53:59 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Sep 2016 07:53:58 -0700
To: Robert Yang <liezhi.yang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1474359109.git.hongxu.jia@windriver.com>
	<00a74627bbc662e9c42e0d2bc0a0d6b2adeaab4a.1474359109.git.hongxu.jia@windriver.com>
	<CAJTo0LZ=0_jwrZ=1FXnBHpd_9K=1qfnGijrXe62qSaaNenzUmQ@mail.gmail.com>
	<909061f7-cc26-9af1-a3c1-6e7de855d2a9@windriver.com>
	<a43fcaae-89a4-7710-8c63-122db5a49918@windriver.com>
	<1a095950-5ab5-544c-3338-f88f409e3454@windriver.com>
	<1eae4a9d-e7f8-6bfe-915e-4333eff01dec@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <847294ac-f04b-af43-6b31-d16ba41eae6e@windriver.com>
Date: Thu, 22 Sep 2016 09:53:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1eae4a9d-e7f8-6bfe-915e-4333eff01dec@windriver.com>
Subject: Re: [PATCH 1/1] rpm: make install with --nosignature and --nodigest work
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
X-List-Received-Date: Thu, 22 Sep 2016 14:53:59 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 9/21/16 8:39 PM, Robert Yang wrote:
> 
> 
> On 09/21/2016 10:10 PM, Mark Hatle wrote:
>> On 9/20/16 10:37 PM, Robert Yang wrote:
>>>
>>>
>>> On 09/21/2016 04:33 AM, Mark Hatle wrote:
>>>> On 9/20/16 10:00 AM, Burton, Ross wrote:
>>>>>
>>>>> On 20 September 2016 at 09:15, Hongxu Jia <hongxu.jia@windriver.com
>>>>> <mailto:hongxu.jia@windriver.com>> wrote:
>>>>>
>>>>>     -Upstream-Status: Submitted [Sent email to rpm-devel@rpm5.org
>>>>>     <mailto:rpm-devel@rpm5.org>]
>>>>>     +Upstream-Status: Rejected [Sent email to rpm-devel@rpm5.org
>>>>>     <mailto:rpm-devel@rpm5.org>]
>>>>>     +http://rpm5.org/community/rpm-devel/5655.html
>>>>>     <http://rpm5.org/community/rpm-devel/5655.html>
>>>>>
>>>>>
>>>>> Considering upstream has explicitly rejected this patch, why should we accept it?
>>>>>
>>>>> Ross
>>>>>
>>>>>
>>>>
>>>> I'm confused by what the patch is doing looking at it.
>>>>
>>>> It sounds like from the description there is a bug that without the change,
>>>> packages with (intentionally) bad checksums and such are allowed to be installed.
>>>>
>>>> The bug is caused by a previous patch that enabled nosignature, etc -- because
>>>> the comparisons turned out to be backwards.
>>>>
>>>> So really nosignature, etc is already in place -- it's just not working properly?
>>>>
>>>> What was rejected upstream is the use of nosignature in any context.  RPM5
>>>> maintainer believes it is unwise and unsafe to permit uses to install packages
>>>> that have failed basic validation.  (I tend to agree.)  Similarly, even being
>>>> able to run queries and other operations against them may be dangerous as well.
>>>
>>> If command like "rpm5 -qp --nosignature --nodigest <file.rpm>" queries database,
>>> then it would cause rpm5 hang when more than one "rpm5 -qp" is running, so I
>>> fixed the *query* problem, and the *install* problem is not caused by the fix.
>>> Btw., *rpm4* doesn't query database when "rpm -qp file.rpm", if we are going
>>> to use dnf in next release, maybe we can consider using rpm4 as Fedora does.
>>> I did a rough statistics for oe-core's local patches, the winner is rpm, it
>>> has 77 local patches, that's not good for maintaining, and you can imagine that
>>
>> 30 patches are simply configuration changes.
>>
>> 42 patches are bug fixes that have been submitted and will likely go away in the
>> next uprev.
>>
>>> how many times it surprised us. rpm4 should be more stable than rpm5, I don't
>>> know how many distros use rpm5, I can't access rpm5.org atm, it seems that the
>>> web is down (It was OK yesterday), but widely used distros like Redhat and Suse
>>
>> The website is working for me today.
>>
>>> uses rpm4, so maybe rpm4 will make our life much more easier, and also for
>>> yocto's user. I think that why we need rpm5 before was because we need use it
>>
>> There is a major problem with rpm4.  It doesn't support cross compiling at all.
>> We know in the past there have been significant problems with it and BerkleyDB
>> with endian issues.  Also it was not possible to do cross-architecture installs
>> (in the past, this one might be resolved.)
>>
>> The general functionality between RPM4 and RPM5 is nearly identical.  RPM 4 has
>> a plug-in interface (which I personally don't believe should be used due to
>> security issues.)  RPM 5 has a focus around specific security enhancements.
>> Some are reasonable, some are a bit too experimental to be used.
>>
>> The other main difference is software license.  RPM 4 is 'GPLv2', while RPM5 is
>> 'LGPLv2'.  This doesn't sound like a big deal at first -- but RPM 4 can't be
>> linked to OpenSSL for it's crypto library.  RPM 4 is linked ONLY to NSS, while
>> RPM5 can use beecrypt, nss, openssl and others.  This makes for a significantly
>> more flexible embedded system.
>>
>>> to compute the package dependencies, but now we have smartpm, so we don't rely
>>> on that any more.
>>>
>>> Here is the recipe list which has more than 10 local patches, and we have 1762
>>> patches atm:
>>>       77 rpm
>>
>> I'd think it's a better comparison to say '30', the configuration items.  So
>> it's similar to perl or openssl in complexity.  I'd agree that is a fair comparison.
>>
>>>       59 gcc-5.4
>>>       49 gcc-6.2
>>>       36 ltp
>>>       31 python3
>>>       30 perl
>>>       29 openssl
>>>       28 man
>>>       27 glibc
>>>       24 python
>>>       23 tcp-wrappers-7.6
>>>       23 systemd
>>>       18 busybox
>>>       14 syslinux
>>>       14 python-smartpm
>>>       14 elfutils-0.166
>>>       14 apt
>>>       13 qemu
>>>       13 libtool
>>>       13 gstreamer1.0-plugins-bad
>>>       13 glib-2.0
>>>       13 binutils
>>>       13 bind
>>>       12 coreutils-6.9
>>>       11 valgrind
>>>       11 gdb
>>>       11 dhcp
>>>       11 autoconf
>>>       10 unzip
>>>       10 dpkg
>>>       10 console-tools-0.3.2
>>>
>>>>
>>>> If fixing the problem is as simple as reverting the other change -- and that
>>>> doesn't cause other problems elsewhere...  I'd rather see that.
>>>
>>> We can't revert the patch, it would break packagefeed-stability.bbclass,
>>> we will see the hang
>>
>> Something is wrong with the implementation then.
>>
>> You should not be doing the equivalent of:
>>
>> list = '<all packages>'
>> for each in list; do rpm -qp $each ; done
>>
>> This is HORRIBLY inefficient, even with rpm4.
>>
>> The proper way to query a number of packages is in a single transaction.  This
>> permits RPM to load the data and validation structures once.
>>
>> This is equivalent to:
>>   rpm -qp `cat list`
>>
>> or
>>
>>   echo list > /tmp/tmpfile
>>   rpm -qp /tmp/tmpfile
> 
> pkg-diff.sh from build-compare can only use two rpm pkgs as arguments:
> 
> pkg-diff.sh rpm1 rpm2

Sounds like a potential -future- enhancement to build-compare.

> So we use "for each in list; do pkg-diff.sh each1 each2; done". We need
> change pkg-diff.sh to make it accept files as arguments. And it works well
> with rpm4, so I'm not sure whether the upstream can accept such a change
> or not. The hang reason for rpm5 is that it reads database (/var/lib/rpm)
> when not needed, so I think that fix rpm5 is the correct way.

A quick and simple alternative (since quering the DB isn't desired in any case)
is to simple set '--dbpath=<random tmp location>' then after the query remove
the tmp location.   No database, no collision, no problem.

--Mark

> // Robert
> 
> 
> 
>>
>> (The later solving the problem of 'too many arguments')
>>
>> This may seem counter intuitive, as the first way looks to be better on a
>> multi-core machine -- but in my experience the overhead of starting rpm, setting
>> up the data structures is very expensive, much more then the
>> load/validate/display of the package information.
>>
>> --Mark
>>
>>>
>>>>
>>>> --Mark
>>>>
>>
>>


