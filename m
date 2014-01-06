Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CEAF60D86
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 07:28:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s067SxNT003248
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 Jan 2014 23:28:59 -0800 (PST)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 5 Jan 2014 23:28:59 -0800
Message-ID: <52CA5B4D.6050206@windriver.com>
Date: Mon, 6 Jan 2014 15:29:17 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1388629298.git.Qi.Chen@windriver.com>
	<7ddc616565a80346dd323664d0c36490a698fb89.1388629298.git.Qi.Chen@windriver.com>
	<52C72A60.9010702@linux.intel.com>
In-Reply-To: <52C72A60.9010702@linux.intel.com>
X-Originating-IP: [128.224.162.164]
Subject: Re: [PATCH V2 1/2] initscripts: split the functions script into a separate package
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
X-List-Received-Date: Mon, 06 Jan 2014 07:28:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2014 05:23 AM, Saul Wold wrote:
> On 01/01/2014 06:25 PM, Chen Qi wrote:
>> Many SysV init scripts need the /etc/init.d/functions script. But
>> this script is part of the initscripts package. As a result, the
>> initscripts package should always be installed into the system to
>> avoid errors when starting daemons. However, it makes no sense to
>> install the initscripts package into a systemd based image, because
>> what the init scripts provide has already been provided by the systemd.
>> On the other hand, the functions script might be still needed in a
>> systemd based image because other init scripts such as distcc might need
>> it.
>>
>> The above situation leads to a natural separation of the functions 
>> script
>> from the initscripts package. And this patch does so. It separates the
>> functions script into initscripts-functions packages.
>>
>
> There seems to be a problem with the multi-lib build, please check 
> this logfile for errors.
>
> http://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/71/steps/Building%20Images/logs/stdio 
>
>
> Thanks
>     Sau!
>
>

Thanks for pointing it out.

I've fixed it and sent out V3.
I also modified the patch a little so that it could apply to the latest 
master cleanly.

Best Regards,
Chen Qi

>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/initscripts/initscripts_1.0.bb |    8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb 
>> b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> index 5951e0c..ea28672 100644
>> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
>> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> @@ -42,8 +42,12 @@ KERNEL_VERSION = ""
>>   inherit update-alternatives
>>   DEPENDS_append = " update-rc.d-native"
>>
>> -ALTERNATIVE_PRIORITY = "90"
>> -ALTERNATIVE_${PN} = "functions"
>> +PACKAGES =+ "${PN}-functions"
>> +RDEPENDS_${PN} = "${PN}-functions"
>> +FILES_${PN}-functions = "${sysconfdir}/init.d/functions.${PN}"
>> +
>> +ALTERNATIVE_PRIORITY_${PN}-functions = "90"
>> +ALTERNATIVE_${PN}-functions = "functions"
>>   ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
>>
>>   HALTARGS ?= "-d -f"
>>
>
>


