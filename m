Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7927F36A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 11:01:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x76B0jDC008086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Aug 2019 04:00:55 -0700
Received: from localhost.localdomain (128.224.162.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 6 Aug 2019 04:00:22 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1565075067.git.liezhi.yang@windriver.com>
	<e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
	<4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <18287a98-33b5-c788-946e-5b5338c1c204@windriver.com>
Date: Tue, 6 Aug 2019 19:01:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 11:01:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/6/19 6:43 PM, Richard Purdie wrote:
> On Tue, 2019-08-06 at 15:05 +0800, Robert Yang wrote:
>> Fixed:
>> $ bitbake stress-ng bash -ccleansstate && bitbake stress-ng
>> ERROR: stress-ng-0.10.00-r0 do_package_qa: QA Issue: /usr/share/bash-completion/completions/stress-ng contained in package stress-ng-bash-completion requires /bin/bash, but no providers found in RDEPENDS_stress-ng-bash-completion? [file-rdeps]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
>> index f7faf97..904eb0c 100644
>> --- a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
>> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
>> @@ -11,7 +11,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
>>   SRC_URI[md5sum] = "46aa41d37690324ceab4febfcc549018"
>>   SRC_URI[sha256sum] = "d09dd2a1aea549e478995bf9be90b38906a4cdf33ea7b245ef9d46aa5213c074"
>>   
>> -DEPENDS = "coreutils-native"
>> +DEPENDS = "coreutils-native bash"
> 
> Technically you just want to make this an RDEPENDS of the appropriate
> package, which would give some small dependency improvement too.

Yes, exactly, I will send a V2 for it. What mis-leaded me was that
stress-ng-bash-completion RDEPENDS on bash-completion, and bash-completion
RDEPENDS on bash, so bash is on the dependencies chain, but stress-ng can't
find it, and there is no qa issues if we build bash firstly:

$ bitbake bash
$ bitbake stress-ng
No qa issues.

So the reproducer is:
$ bitbake stress-ng bash -ccleansstate && bitbake stress-ng

This might be a bug?

// Robert

> 
> Cheers,
> 
> Richard
> 
> 

