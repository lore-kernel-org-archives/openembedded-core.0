Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F47377112
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Sep 2016 02:29:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u832T8HJ014717
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 2 Sep 2016 19:29:09 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 2 Sep 2016 19:29:08 -0700
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>
References: <cover.1472794137.git.liezhi.yang@windriver.com>
	<b506d54a2cb91ebf6e166775b9f05c0311c650d0.1472794137.git.liezhi.yang@windriver.com>
	<1472804818.9440.14.camel@andred.net>
	<4c8005dd-65b2-145d-86aa-5470cd21b2e8@windriver.com>
	<1472815640.9440.45.camel@andred.net>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <d78d1ee3-4b8c-9430-648f-cceb4764b8c5@windriver.com>
Date: Sat, 3 Sep 2016 10:29:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472815640.9440.45.camel@andred.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libnl: remove RREPLACES and RCONFLICTS for libnl-genl
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
X-List-Received-Date: Sat, 03 Sep 2016 02:29:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 09/02/2016 07:27 PM, André Draszik wrote:
> On Fr, 2016-09-02 at 17:53 +0800, Robert Yang wrote:
>> Good questions, the libnl-genl2 in provides is introduced by
>> REPLACES_${PN}-genl = "libnl-genl2", so libnl-genl2 should be preserved.
>> And there was no libnl-genl.rpm in the past, but libnl-3-genl.rpm,
>> please see commit message for more info.
>>
>> Here is the updated patch:
>>
>>    git://git.openembedded.org/openembedded-core-contrib rbt/libnl
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
>> rbt/libnl
>>
>> Robert Yang (1):
>>    libnl: fix RREPLACES and RCONFLICTS for libnl-genl
>>
>>
>> Subject: [PATCH 1/1] libnl: fix RREPLACES and RCONFLICTS for libnl-genl
>>
>> The libnl-genl.rpm provides libnl-genl-3-200 after the following 2 fixes:
>> libnl: update to v3.2.28
>> libnl: fix packaging mistakes
>>
>> $ rpm -qp --provides
>> tmp/deploy/rpm/core2_64/libnl-genl-3-200-3.2.28-r0.4.core2_64.rpm
>> elf(buildid) = 4e753b2361ba0b02f162244a87cc0680796e46cc
>> libnl-genl = 3.2.28
>> libnl-genl-3.so.200()(64bit)
>> libnl-genl-3.so.200(libnl_3)(64bit)
>> libnl-genl2
>> libnl-genl-3-200 = 1:3.2.28-r0.4
>>
>> Note, the libnl-genl2 is introduced by REPLACES_${PN}-genl = "libnl-
>> genl2".
>
> Ah, ok. And so is the last line, libnl-genl-3-200, I suppose. (The IPK
> backend doesn't seem to do that)
>
>> So that we don't need set libnl-genl-3-200 in the RREPLACES and
>> RCONFLICTS, otherwise it would cause do_rootfs errors when install both
>> libnl-genl.rpm and lib32-libnl-genl.rpm:
>>
>> Computing transaction...error: Can't install
>> libnl-genl-3-200-1:3.2.28-r0.0@core2_64: conflicted package
>> libnl-genl-3-200-1:3.2.28-r0.0@lib32_x86 is locked
>>
>> We didn't meet this error before was because there was no libnl-genl.rpm,
>                                                             ^^^^^^^^^^^^^^^
> Should that be libnl-genl-3-200.rpm ?
>
>> but libnl-3-genl.rpm, and it doesn't provide libnl-genl-3-200 by default.
>
> OK.
>
> So now that there is nothing in ${bindir} of the -genl package anymore, it
> applies the normal package renaming using the SONAME, resulting in libnl-
> genl-3-200.
>
> Whereas previously it used ${PN}-genl as package name, where PN was set to
> libnl-3 during package creation. Why was it libnl-3 (why did it not use
> libnl-3-200 as prefix)?

The rename is done by debian.bbclass, you can take a look into it.

// Robert

>
> Cheers,
> Andre'
>
>

