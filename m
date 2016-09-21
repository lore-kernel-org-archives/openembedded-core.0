Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3A78760750
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 01:46:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8L1kR9h001904
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Sep 2016 18:46:27 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Sep 2016 18:46:26 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20160920091958.23448-1-Yuanjie.Huang@windriver.com>
	<CAMKF1sooPU-oSmeGuNQXjEUvgWfAXubQuKc6bk=L45WtRD4xjQ@mail.gmail.com>
From: Yuanjie Huang <yuanjie.huang@windriver.com>
Message-ID: <e72d26a5-046a-6c89-009c-7cbaf8aaab3c@windriver.com>
Date: Wed, 21 Sep 2016 09:46:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sooPU-oSmeGuNQXjEUvgWfAXubQuKc6bk=L45WtRD4xjQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc-sanitizers: Fix libtool library files
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
X-List-Received-Date: Wed, 21 Sep 2016 01:46:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 09/21/2016 04:48 AM, Khem Raj wrote:
> On Tue, Sep 20, 2016 at 2:19 AM, Yuanjie Huang
> <Yuanjie.Huang@windriver.com> wrote:
>> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>>
>> Since libtool sysroot is not set when compiling sanitizers, the libtool
>> does no prefix the dependency path correctly. Fix it, so that programs
>> can link to sanitizer libraries without error.
>>
>> This patch changes the depenedency_libs line in libasan.la and
>> libusan.la from
>>          dependency_libs=' -lpthread -ldl '/usr/lib'/libstdc++.la '/usr/lib'/libstdc++.la'
>> to
>>          dependency_libs=' -lpthread -ldl =/usr/lib/libstdc++.la =/usr/lib/libstdc++.la'
>>
>> Upstream-Status: Inappropriate [embedded specific]
>> (LOCAL REV; NOT UPSTREAM) -- sent to oe-core on 2016-09-20
>>
>> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> index c987ccb..5fe5eaf 100644
>> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> @@ -50,6 +50,8 @@ do_install () {
>>           rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
>>       fi
>>       chown -R root:root ${D}
>> +    # Fix broken libtool with stdc++, as sysroot is not set.
>> +    find ${D} -name \*.la -exec sed -i "/^dependency_libs=/s@'/usr/lib'@=/usr/lib@g" {} \;
> what happens if you remove the .la files completely.
We have some user making use of these libraries directly, otherwise, 
cross gcc can link these sanitizer libraries with just -fsantizer flag 
without problem. Without .la files, his flow can not be libtoolized.

Best,
Yuanjie
>>   }
>>
>>   INHIBIT_DEFAULT_DEPS = "1"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


