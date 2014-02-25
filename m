Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6ACBB6F09E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 15:16:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Feb 2014 07:16:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,540,1389772800"; d="scan'208";a="487799820"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2014 07:16:41 -0800
Received: from [10.237.108.41] (apalalax-mobl.ger.corp.intel.com
	[10.237.108.41])
	by linux.intel.com (Postfix) with ESMTP id 8DAD96A4007;
	Tue, 25 Feb 2014 07:16:30 -0800 (PST)
Message-ID: <530CB3D7.5090009@linux.intel.com>
Date: Tue, 25 Feb 2014 17:16:39 +0200
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
Organization: Intel OTC
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1392929845-23411-1-git-send-email-sgw@linux.intel.com>	<42DC4075-3C8F-4D01-AFDB-82AD3357C709@gmail.com>	<2119167.FSmXca6tad@peggleto-mobl5.ger.corp.intel.com>	<E43D4A79-222F-4109-A77E-4121AF6DBE94@gmail.com>
	<530CB27A.3050305@linux.intel.com>
In-Reply-To: <530CB27A.3050305@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Ensure ROOTFS path is absolute
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
X-List-Received-Date: Tue, 25 Feb 2014 15:16:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/2014 5:10 PM, Alexandru Palalau wrote:
> On 2/22/2014 6:34 PM, Khem Raj wrote:
>>
>> On Feb 22, 2014, at 4:55 AM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>>
>>> On Friday 21 February 2014 21:57:37 Khem Raj wrote:
>>>> On Feb 20, 2014, at 12:57 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>>> There is a problem if a relative path is passed to the kernel for NFS
>>>>> usage
>>>>> that it will not correctly find it, so ensure that the ROOTFS path is
>>>>> absolute.
>>>>>
>>>>> [YOCTO #2807]
>>>>>
>>>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>>>> ---
>>>>> scripts/runqemu | 4 +++-
>>>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/scripts/runqemu b/scripts/runqemu
>>>>> index 0db7ad6..57c5de4 100755
>>>>> --- a/scripts/runqemu
>>>>> +++ b/scripts/runqemu
>>>>> @@ -462,7 +462,9 @@ if [ -z "$ROOTFS" -a "x$FSTYPE" != "xvmdk" ]; then
>>>>>
>>>>>         error "Unable to determine default rootfs for MACHINE
>>>>> [$MACHINE]"
>>>>>
>>>>>     fi
>>>>>
>>>>> fi
>>>>> -# ROOTFS is now set for all cases
>>>>> +# ROOTFS is now set for all cases, now expand it to be an absolute
>>>>> path,
>>>>> it should exist at this point +
>>>>> +ROOTFS=`realpath $ROOTFS`
>>>>
>>>> I think this change also means we need to add dependency on realpath
>>>> package
>>>> as prerequisite for build host.
>>>
>>> realpath is part of coreutils.
>>
>> realpath is package of its own not coreutils, at least on ubuntu
>
> On CentOS 6.5 realpath is not part of coreutils and is not part of a
> default repo. I could find it only on RPMforge.
Added https://bugzilla.yoctoproject.org/show_bug.cgi?id=5879 on this matter.
>
>>
>>> Another alternative would be readlink -f (but
>>> that also appears to be part of coreutils.)
>>
>>
>> this might be better options since coreutils is more or less
>> given on any distro
>>
>>>
>>> Cheers,
>>> Paul
>>>
>>> --
>>>
>>> Paul Eggleton
>>> Intel Open Source Technology Centre
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>


-- 
Alexandru Palalau

