Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC61C77FF1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 03:21:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4P3L1Ru014247
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 20:21:01 -0700 (PDT)
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 24 May 2017 20:21:01 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1495618375.git.kai.kang@windriver.com>
	<ea7b4a713a48b0b2533bbec7680355b852200ecc.1495618375.git.kai.kang@windriver.com>
	<dea305d5-9575-12b5-c7e2-4b7e8f186a10@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <fd58140d-77ec-a230-4679-a28068e064c5@windriver.com>
Date: Thu, 25 May 2017 11:19:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <dea305d5-9575-12b5-c7e2-4b7e8f186a10@windriver.com>
Subject: Re: [PATCH 1/1] libpcap: add native package
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
X-List-Received-Date: Thu, 25 May 2017 03:21:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年05月24日 21:19, Kang Kai wrote:
> On 2017年05月24日 17:33, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Add package libcap-native required by recipe daq-native in layer
>> meta-networking. And daq-native is added to fix snort start error.
>
> I just realize that it only needs daq-native provide a shell script, 
> so libpcap-native may not be needed. I'll figure it out.
> Please ignore this patch for now.

Unfortunately there is a var STATIC_LIBS in the shell script 
daq-modules-config from package daq-native which depends on configure 
options.
If doesn't build with libpcap for daq-native, then no '-lpcap' in the 
output of the shell script daq-modules-config and build snort will fail.

So libpcap-native is needed indeed, and please help the review the 
patch, thanks.

BTW, the typo 'libcap-native' in commit message has been updated in 
poky-contrib git repo.

Thanks,
Kai


>
> Thanks,
> Kai
>
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-connectivity/libpcap/libpcap.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc 
>> b/meta/recipes-connectivity/libpcap/libpcap.inc
>> index 6635779..e57ea87 100644
>> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
>> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
>> @@ -38,3 +38,5 @@ CXXFLAGS_prepend = "-I${S} "
>>   do_configure_prepend () {
>>       sed -i -e's,^V_RPATH_OPT=.*$,V_RPATH_OPT=,' ${S}/pcap-config.in
>>   }
>> +
>> +BBCLASSEXTEND = "native"
>
>

-- 
Regards,
Neil | Kai Kang


