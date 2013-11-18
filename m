Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 726AF6D586
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 12:59:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAICx1Y0007846
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Nov 2013 04:59:01 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 18 Nov 2013 04:59:00 -0800
Message-ID: <528A0EFE.6040300@windriver.com>
Date: Mon, 18 Nov 2013 20:58:38 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, Phil Blundell <pb@pbcl.net>
References: <1384440081.17320.65.camel@phil-desktop.brightsign>
	<CAMKF1spw=ARc3dXgTX4k9E4T4y39Vctyx9RNeeaAqoj9zfcYUw@mail.gmail.com>
In-Reply-To: <CAMKF1spw=ARc3dXgTX4k9E4T4y39Vctyx9RNeeaAqoj9zfcYUw@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: Add patch to avoid undefined references to boost::atomic::lockpool::get_lock_for()
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
X-List-Received-Date: Mon, 18 Nov 2013 12:59:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/14/2013 10:53 PM, Khem Raj wrote:
> On Thursday, November 14, 2013, Phil Blundell wrote:
>
>> Boost::thread uses functions from boost::atomic but doesn't actually
>> link with libboost_atomic.  This works fine on platforms where
>> BOOST_ATOMIC_FLAG_LOCK_FREE is true but will lead to undefined
>> symbol references otherwise.  Fix this by applying a patch from
>> the upstream bug tracker to add the missing library linkage.
>
>
> Is it fixed in 1.55? Then we might apply this to Dora and upgrade master to
> 1.55
>

Hi Khem,

Thanks, I will try it in dora.

// Robert

>>
>> Signed-off-by: Phil Blundell <pb@pbcl.net <javascript:;>>
>> ---
>>   meta/recipes-support/boost/boost_1.54.0.bb         |  1 +
>>   .../files/boost-1.54.0-thread-link_atomic.patch    | 59
>> ++++++++++++++++++++++
>>   2 files changed, 60 insertions(+)
>>   create mode 100644
>> meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
>>
>> diff --git a/meta/recipes-support/boost/boost_1.54.0.bbb/meta/recipes-support/boost/
>> boost_1.54.0.bb
>> index 3cf88fa..9e7a60a 100644
>> --- a/meta/recipes-support/boost/boost_1.54.0.bb
>> +++ b/meta/recipes-support/boost/boost_1.54.0.bb
>> @@ -3,4 +3,5 @@ include boost.inc
>>
>>   SRC_URI += "file://arm-intrinsics.patch \
>>               file://glibc.patch \
>> +            file://boost-1.54.0-thread-link_atomic.patch \
>>              "
>> diff --git
>> a/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
>> b/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
>> new file mode 100644
>> index 0000000..d39d0a9
>> --- /dev/null
>> +++
>> b/meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
>> @@ -0,0 +1,59 @@
>> +Link boost_thread with boost_atomic to avoid undefined references to
>> +boost::atomic::detail::lock_pool::get_lock_for().
>> +
>> +From https://svn.boost.org/trac/boost/ticket/9041
>> +
>> +Phil Blundell <pb@pbcl.net <javascript:;>>
>> +Upstream-Status: Backport
>> +
>> +diff -Nurp
>> boost_1_54_0/libs/thread/build/has_atomic_flag_lockfree_test.cpp
>> boost_1_54_0.pm/libs/thread/build/has_atomic_flag_lockfree_test.cpp
>> +--- boost_1_54_0/libs/thread/build/has_atomic_flag_lockfree_test.cpp
>> 1970-01-01 01:00:00.000000000 +0100
>> ++++ boost_1_54_0.pm/libs/thread/build/has_atomic_flag_lockfree_test.cpp       2013-08-23 19:51:52.706329968 +0200
>> +@@ -0,0 +1,14 @@
>> ++// Copyright (c) 2013, Petr Machata, Red Hat Inc.
>> ++//
>> ++// Use modification and distribution are subject to the boost Software
>> ++// License, Version 1.0.  (See http://www.boost.org/LICENSE_1_0.txt).
>> ++
>> ++#include "../../../boost/atomic.hpp"
>> ++#include "../../../boost/static_assert.hpp"
>> ++
>> ++int
>> ++main(int argc, char *argv[])
>> ++{
>> ++  BOOST_STATIC_ASSERT(BOOST_ATOMIC_FLAG_LOCK_FREE);
>> ++  return 0;
>> ++}
>> +diff -Nurp boost_1_54_0/libs/thread/build/Jamfile.v2
>> boost_1_54_0.pm/libs/thread/build/Jamfile.v2
>> +--- boost_1_54_0/libs/thread/build/Jamfile.v2  2013-06-15
>> 12:35:45.000000000 +0200
>> ++++ boost_1_54_0.pm/libs/thread/build/Jamfile.v2       2013-08-23
>> 19:52:30.018613408 +0200
>> +@@ -36,6 +36,7 @@ import os ;
>> + import feature ;
>> + import indirect ;
>> + import path ;
>> ++import configure ;
>> +
>> + project boost/thread
>> +     : source-location ../src
>> +@@ -140,6 +141,8 @@ local rule default_threadapi ( )
>> + feature.feature threadapi : pthread win32 : propagated ;
>> + feature.set-default threadapi : [ default_threadapi ] ;
>> +
>> ++exe has_atomic_flag_lockfree :
>> ../build/has_atomic_flag_lockfree_test.cpp ;
>> ++
>> + rule tag ( name : type ? : property-set )
>> + {
>> +     local result = $(name) ;
>> +@@ -248,6 +251,12 @@ rule requirements ( properties * )
>> + {
>> +     local result ;
>> +
>> ++    if ! [ configure.builds has_atomic_flag_lockfree
>> ++         : $(properties) : "lockfree boost::atomic_flag" ]
>> ++    {
>> ++        result += <library>/boost/atomic//boost_atomic ;
>> ++    }
>> ++
>> +     if <threadapi>pthread in $(properties)
>> +     {
>> +         result += <define>BOOST_THREAD_POSIX ;
>> --
>> 1.8.4.rc3
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org <javascript:;>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

