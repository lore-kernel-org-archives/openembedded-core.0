Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F015665EE6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 08:58:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s458w7iR002854
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 May 2014 01:58:07 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 5 May 2014 01:58:06 -0700
Message-ID: <536752A5.2050103@windriver.com>
Date: Mon, 5 May 2014 16:58:13 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1399275082.git.Qi.Chen@windriver.com>	
	<70f2774fe13948f7f044c202325762d48cd1369e.1399275082.git.Qi.Chen@windriver.com>
	<1399277902.12731.109.camel@ted>
In-Reply-To: <1399277902.12731.109.camel@ted>
X-Originating-IP: [128.224.162.187]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] populate_sdk_base: modify the recrdeptask of do_populate_sdk
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
X-List-Received-Date: Mon, 05 May 2014 08:58:09 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2014 04:18 PM, Richard Purdie wrote:
> On Mon, 2014-05-05 at 16:11 +0800, Chen Qi wrote:
>> If 'rm_work' is enabled, `bitbake core-image-xxx -c populate_sdk'
>> doesn't clean things up for the nativesdk packages.
>>
>> This patch modifies the 'recrdeptask' for do_populate_sdk to fix this
>> problem.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/populate_sdk_base.bbclass |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
>> index 10d04ed..278d1b7 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -333,5 +333,5 @@ populate_sdk_log_check() {
>>   do_populate_sdk[dirs] = "${TOPDIR}"
>>   do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS', True).split()])}"
>>   do_populate_sdk[rdepends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_RDEPENDS', True).split()])}"
>> -do_populate_sdk[recrdeptask] += "do_packagedata do_package_write_rpm do_package_write_ipk do_package_write_deb"
>> +do_populate_sdk[recrdeptask] += "do_packagedata do_${BB_DEFAULT_TASK}"
> No. This task has no such dependency on do_build of the other tasks. We
> don't create invalid dependencies just for the sake of it.
>
> If you run "bitbake X -c populate_sysroot" or -c package_write_ipk or
> 101 other options, it will not run rm_work either. Are you proposing we
> add do_${BB_DEFAULT_TASK} to every task in the system?
>
> Cheers,
>
> Richard
>
>
>

Thanks for making things clear.

Best Regards,
Chen Qi

