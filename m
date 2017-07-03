Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CAEF677AA9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 09:06:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6396ALR014413
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Jul 2017 02:06:10 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Mon, 3 Jul 2017 02:06:09 -0700
To: "Maxin B. John" <maxin.john@intel.com>, Fathi Boudra
	<fathi.boudra@linaro.org>
References: <20170703080331.5973-1-fathi.boudra@linaro.org>
	<20170703085935.GA17530@mbabyjoh-desk.ger.corp.intel.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <fc55f06f-e68a-33b3-a529-a6cb1a74efff@windriver.com>
Date: Mon, 3 Jul 2017 17:05:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170703085935.GA17530@mbabyjoh-desk.ger.corp.intel.com>
X-Originating-IP: [128.224.162.194]
Cc: naresh.kamboju@linaro.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ltp: add acl, attr, curl and util-linux runtime dependencies
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
X-List-Received-Date: Mon, 03 Jul 2017 09:06:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2017年07月03日 16:59, Maxin B. John wrote:
> Hi,
>
> On Mon, Jul 03, 2017 at 11:03:31AM +0300, Fathi Boudra wrote:
>> * Use a list and re-order alphabetically to make it easier to read and
>>    update.
>> * Add missing runtime dependencies:
>>    - acl (getfacl/setfacl commands are required)
>>    - attr (getfattr/setfattr commands are required)
>>    - curl (curl command is required)
>>    - util-linux (ipcs command is required)
>>
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>>   meta/recipes-extended/ltp/ltp_20170516.bb | 23 +++++++++++++++++++++--
>>   1 file changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb b/meta/recipes-extended/ltp/ltp_20170516.bb
>> index f537d60c15..564fdcf8c2 100644
>> --- a/meta/recipes-extended/ltp/ltp_20170516.bb
>> +++ b/meta/recipes-extended/ltp/ltp_20170516.bb
>> @@ -95,7 +95,27 @@ do_install(){
>>       cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
>>   }
>>   
>> -RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect ldd unzip gzip cpio cronie logrotate which at"
>> +RDEPENDS_${PN} = "
should be:

     RDEPENDS_${PN} = " \
>> +    acl \
>> +    at \
>> +    attr \
>> +    bash \
>> +    cpio \
>> +    cronie \
>> +    curl \
>> +    e2fsprogs-mke2fs \
>> +    expect \
>> +    gawk \
>> +    gzip \
>> +    ldd \
>> +    libaio \
>> +    logrotate \
>> +    perl \
>> +    python-core \
>> +    unzip \
>> +    util-linux \
>> +    which \
>> +"
> These changes look good. However, this patch is causing a parser error:
> ERROR: ParseError at /home/maxin/poky/meta/recipes-extended/ltp/ltp_20170516.bb:98: unparsed line: 'RDEPENDS_${PN} = "
>
> Please fix it.
>
>>   FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a /opt/ltp/testcases/data/nm01/lib.a"
>>   
>> @@ -106,4 +126,3 @@ INHIBIT_PACKAGE_STRIP = "1"
>>   INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>>   # However, test_arch_stripped is already stripped, so...
>>   INSANE_SKIP_${PN} += "already-stripped"
> Best Regards,
> Maxin


