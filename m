Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94F4C7316B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 09:53:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u829rfB4025916
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 2 Sep 2016 02:53:41 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 2 Sep 2016 02:53:40 -0700
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>
References: <cover.1472794137.git.liezhi.yang@windriver.com>
	<b506d54a2cb91ebf6e166775b9f05c0311c650d0.1472794137.git.liezhi.yang@windriver.com>
	<1472804818.9440.14.camel@andred.net>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <4c8005dd-65b2-145d-86aa-5470cd21b2e8@windriver.com>
Date: Fri, 2 Sep 2016 17:53:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472804818.9440.14.camel@andred.net>
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
X-List-Received-Date: Fri, 02 Sep 2016 09:53:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


Good questions, the libnl-genl2 in provides is introduced by
REPLACES_${PN}-genl = "libnl-genl2", so libnl-genl2 should be preserved.
And there was no libnl-genl.rpm in the past, but libnl-3-genl.rpm,
please see commit message for more info.

Here is the updated patch:

   git://git.openembedded.org/openembedded-core-contrib rbt/libnl
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/libnl

Robert Yang (1):
   libnl: fix RREPLACES and RCONFLICTS for libnl-genl


Subject: [PATCH 1/1] libnl: fix RREPLACES and RCONFLICTS for libnl-genl

The libnl-genl.rpm provides libnl-genl-3-200 after the following 2 fixes:
libnl: update to v3.2.28
libnl: fix packaging mistakes

$ rpm -qp --provides 
tmp/deploy/rpm/core2_64/libnl-genl-3-200-3.2.28-r0.4.core2_64.rpm
elf(buildid) = 4e753b2361ba0b02f162244a87cc0680796e46cc
libnl-genl = 3.2.28
libnl-genl-3.so.200()(64bit)
libnl-genl-3.so.200(libnl_3)(64bit)
libnl-genl2
libnl-genl-3-200 = 1:3.2.28-r0.4

Note, the libnl-genl2 is introduced by REPLACES_${PN}-genl = "libnl-genl2".

So that we don't need set libnl-genl-3-200 in the RREPLACES and
RCONFLICTS, otherwise it would cause do_rootfs errors when install both
libnl-genl.rpm and lib32-libnl-genl.rpm:

Computing transaction...error: Can't install 
libnl-genl-3-200-1:3.2.28-r0.0@core2_64: conflicted package 
libnl-genl-3-200-1:3.2.28-r0.0@lib32_x86 is locked

We didn't meet this error before was because there was no libnl-genl.rpm,
but libnl-3-genl.rpm, and it doesn't provide libnl-genl-3-200 by default.

Remove libnl-genl-3-200 from RREPLACES and RCONFLICTS will fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
  meta/recipes-support/libnl/libnl_3.2.28.bb | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb 
b/meta/recipes-support/libnl/libnl_3.2.28.bb
index 7ddbd40..26982f3 100644
--- a/meta/recipes-support/libnl/libnl_3.2.28.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
@@ -44,5 +44,5 @@ FILES_${PN}-idiag = "${libdir}/libnl-idiag-3.so.*"
  FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
  FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
  FILES_${PN}-xfrm  = "${libdir}/libnl-xfrm-3.so.*"
-RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
+RREPLACES_${PN}-genl = "libnl-genl2"
+RCONFLICTS_${PN}-genl = "libnl-genl2"
-- 
2.9.0

// Robert

On 09/02/2016 04:26 PM, André Draszik wrote:
> Thanks Robert!
>
> For my eduction, I don't understand this yet, though, and I don't want to
> cause issues like this again...
>
> On Do, 2016-09-01 at 22:30 -0700, Robert Yang wrote:
>> The libnl-genl.rpm provides libnl-genl2 and libnl-genl-3-200:
>>
>> $ rpm -qp --provides tmp/deploy/rpm/core2_64/libnl-genl-3-200-3.2.28-
>> r0.2.core2_64.rpm
>> elf(buildid) = 4e753b2361ba0b02f162244a87cc0680796e46cc
>> libnl-genl = 3.2.28
>> libnl-genl-3.so.200()(64bit)
>> libnl-genl-3.so.200(libnl_3)(64bit)
>> libnl-genl2
>
> How does RPM manage to add a provides of libnl-genl2 here?
>
>> libnl-genl-3-200 = 1:3.2.28-r0.2
>>
>> so that we don't need set them in the RREPLACES and RCONFLICTS, the
>> package manager can handle it, otherwise it would cause do_rootfs errors
>> when install both libnl-genl.rpm and lib32-libnl-genl.rpm:
>>
>> Computing transaction...error: Can't install libnl-genl-3-200-1:3.2.28-r0.
>> 0@core2_64: conflicted package libnl-genl-3-200-1:3.2.28-r0.0@lib32_x86 is
>> locked
>>
>> We didn't meet the error before was because there was no libnl-genl.rpm,
>> so that it had no effect, but now the following commit fixed the
>> packaging problem: (master-next branch)
>
> Hm, there has been a libnl-genl.ipk all the time. Why no rpm?
>
>> libnl: fix packaging mistakes
>>
>> Remove RREPLACES and RCONFLICTS for libnl-genl will fix the problem.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/recipes-support/libnl/libnl_3.2.28.bb | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb b/meta/recipes-
>> support/libnl/libnl_3.2.28.bb
>> index 7ddbd40..799962f 100644
>> --- a/meta/recipes-support/libnl/libnl_3.2.28.bb
>> +++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
>> @@ -44,5 +44,3 @@ FILES_${PN}-idiag = "${libdir}/libnl-idiag-3.so.*"
>>  FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
>>  FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
>>  FILES_${PN}-xfrm  = "${libdir}/libnl-xfrm-3.so.*"
>> -RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
>> -RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
>
> I can see how 'libnl-genl-3-200' could be an issue with RPM based systems
> (whereas libnl-genl2 shouldn't be a problem, except that RPM seems to add
> that as a provides???) But I don't understand how this wasn't a problem
> before?
>
> What am I missing?
>
> Cheers,
> Andre'
>
>

