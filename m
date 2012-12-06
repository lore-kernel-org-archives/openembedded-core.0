Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TgRL8-00071z-Cx
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 03:37:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB62N61Z024649
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2012 18:23:06 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 5 Dec 2012 18:23:04 -0800
Message-ID: <50C00182.3070102@windriver.com>
Date: Thu, 6 Dec 2012 10:22:58 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1354694264-23741-1-git-send-email-ming.liu@windriver.com>
	<50BFA0ED.2030303@linux.intel.com>
In-Reply-To: <50BFA0ED.2030303@linux.intel.com>
X-Originating-IP: [128.224.163.154]
Subject: Re: [PATCH V1] initscripts/urandom: create directory before staging into it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 02:37:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2012 03:30 AM, Saul Wold wrote:
> On 12/04/2012 11:57 PM, Ming Liu wrote:
>> /etc/init.d/urandom fails to start/stop because it tries to save
>> random-seed into /var/lib/urandom folder which does not exist in the
>> file system.
>>
>> Fixed by creating /var/lib/urandom at do_install time.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/recipes-core/initscripts/initscripts_1.0.bb | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb 
>> b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> index d25838b..39be9a8 100644
>> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
>> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system 
>> startup initialization scrip
>>   SECTION = "base"
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>> -PR = "r137"
>> +PR = "r138"
>>
>>   INHIBIT_DEFAULT_DEPS = "1"
>>
>> @@ -133,4 +133,6 @@ do_install () {
>>       fi
>>
>>       install -m 0755        ${WORKDIR}/device_table.txt        
>> ${D}${sysconfdir}/device_table
>> +    # Holds state information pertaining to urandom
>> +    install -d ${D}/var/lib/urandom
>
> I thought this would go in volatiles, not here.
>
> Sau!
>
Hi Saul,

 From my understanding, volatiles is a configuration file which deals 
with files related with volatile storage.
Files, directories and links related to volatile storage should be in 
this file, as it's a final method to check and make sure they are 
created properly. But files under /var/lib should not there.

So in my option, this patch is ok.

Thanks,
Chen Qi

>>   }
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



