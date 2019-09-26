Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3BABE7ED5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 05:51:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8Q5pF31017367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Sep 2019 22:51:15 -0700 (PDT)
Received: from [128.224.162.210] (128.224.162.210) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 25 Sep 2019 22:51:14 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1569466181.git.liezhi.yang@windriver.com>
	<e32ddb5983f3ac13e58fb60425bafbb711721151.1569466181.git.liezhi.yang@windriver.com>
	<CAMKF1sq9Yc4=_R2EkvUw4+m--YxgGViStkg9RU_mXXqH7SwBYA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <7624506c-1cc4-347c-feb2-faa5f2538e21@windriver.com>
Date: Thu, 26 Sep 2019 13:51:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq9Yc4=_R2EkvUw4+m--YxgGViStkg9RU_mXXqH7SwBYA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/3] apr: Fix configure error for nativesdk
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
X-List-Received-Date: Thu, 26 Sep 2019 05:51:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Khem,

On 9/26/19 10:57 AM, Khem Raj wrote:
> On Wed, Sep 25, 2019 at 7:52 PM Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> Fixed:
>> $ bitbake nativesdk-apr
>> buildconf: libtool not found.
>>             You need libtool version 1.4 or newer installed
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-support/apr/apr_1.7.0.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
>> index 09a65bf..a9d98be 100644
>> --- a/meta/recipes-support/apr/apr_1.7.0.bb
>> +++ b/meta/recipes-support/apr/apr_1.7.0.bb
>> @@ -1,7 +1,7 @@
>>   SUMMARY = "Apache Portable Runtime (APR) library"
>>   HOMEPAGE = "http://apr.apache.org/"
>>   SECTION = "libs"
>> -DEPENDS = "util-linux"
>> +DEPENDS = "util-linux libtool"
> 
> hmmm packages usually need libtoolize so please check if thats the
> case or maybe patch apr to
> do so., thereafter you can just DEPEND on libtool-cross

In do_configure:

libtool='${HOST_SYS}-libtool' ./buildconf

So it requires libtool which is x86_64-pokysdk-linux-libtool when build 
nativesdk-apr. The libtool-cross is already in default depends, and it
doesn't work when build nativesdk-apr, so I added libtool to the DEPENDS.

// Robert

> 
>>
>>   LICENSE = "Apache-2.0"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=4dfd4cd216828c8cae5de5a12f3844c8 \
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

