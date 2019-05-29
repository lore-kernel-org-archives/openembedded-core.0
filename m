Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 157E97CFB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 02:45:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4T2j5ml004456
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 May 2019 19:45:05 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 28 May 2019 19:45:04 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1559016116-139663-1-git-send-email-changqing.li@windriver.com>
	<1559016116-139663-4-git-send-email-changqing.li@windriver.com>
	<df74915db04e0cdf9648a95e23435db3c8aa4684.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <b824eb18-6876-06ed-5246-65d9e671dd9e@windriver.com>
Date: Wed, 29 May 2019 10:45:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <df74915db04e0cdf9648a95e23435db3c8aa4684.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.186]
Subject: Re: [PATCH 3/5] bootchart2: add initscripts-functions as rconflict
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
X-List-Received-Date: Wed, 29 May 2019 02:45:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 5/29/19 7:13 AM, Richard Purdie wrote:
> On Tue, 2019-05-28 at 12:01 +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> bootchart2 rdepend on lsb, lsb rdepend on lsbinitscripts,
>> lsbinitscripts rconflict with initscripts-functions. so also add
>> rconflict for this one.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
>> b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
>> index 396d0ec..36092e6 100644
>> --- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
>> +++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
>> @@ -143,6 +143,7 @@ RDEPENDS_pybootchartgui = "python3-pycairo
>> python3-compression python3-image pyt
>>   RDEPENDS_${PN}_class-target += "${@bb.utils.contains('DISTRO_FEATURE
>> S', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
>>   RDEPENDS_${PN}_class-target += "lsb"
>>   DEPENDS_append_class-native = " python3-pycairo-native"
>> +RCONFLICTS_${PN}_class-target = "initscripts-functions"
> If lsb and initscripts-functions have the conflict, why do we need this
> in bootchart2 as well?
>
> Cheers,
>
> Richard

Yes,  this is wrong for indirect rconflict,  especially that, this maybe 
break someday when lsb changed.  Same as lsb/lsbtest in patch  4/5 and 5/5.


For patch 1/5, 2/5,  it is direct rconflict.  It will also report 
rconflict during do_rootfs when both are  installed  if only one package 
set rconflict.

but I think it is better to set rconflict for both packages, in this 
way,  when user parse the recipe to get the recipe info, it can get  
this rconflict

info.

>
>
-- 
BRs

Sandy(Li Changqing)


