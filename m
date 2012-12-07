Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Ming.Liu@windriver.com>) id 1Tgqmr-0002EX-8E
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 06:47:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB75XK6Q022944
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Dec 2012 21:33:20 -0800 (PST)
Received: from [128.224.162.133] (128.224.162.133) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Thu, 6 Dec 2012 21:33:20 -0800
Message-ID: <50C17F9C.2090200@windriver.com>
Date: Fri, 7 Dec 2012 13:33:16 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, Saul Wold <sgw@linux.intel.com>
References: <1354694264-23741-1-git-send-email-ming.liu@windriver.com>
	<50BFA0ED.2030303@linux.intel.com> <50C00182.3070102@windriver.com>
In-Reply-To: <50C00182.3070102@windriver.com>
X-Originating-IP: [128.224.162.133]
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
X-List-Received-Date: Fri, 07 Dec 2012 05:47:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2012 10:22 AM, ChenQi wrote:
> On 12/06/2012 03:30 AM, Saul Wold wrote:
>> On 12/04/2012 11:57 PM, Ming Liu wrote:
>>> /etc/init.d/urandom fails to start/stop because it tries to save
>>> random-seed into /var/lib/urandom folder which does not exist in the
>>> file system.
>>>
>>> Fixed by creating /var/lib/urandom at do_install time.
>>>
>>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>>> ---
>>>   meta/recipes-core/initscripts/initscripts_1.0.bb | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb 
>>> b/meta/recipes-core/initscripts/initscripts_1.0.bb
>>> index d25838b..39be9a8 100644
>>> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
>>> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
>>> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system 
>>> startup initialization scrip
>>>   SECTION = "base"
>>>   LICENSE = "GPLv2"
>>>   LIC_FILES_CHKSUM = 
>>> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>>> -PR = "r137"
>>> +PR = "r138"
>>>
>>>   INHIBIT_DEFAULT_DEPS = "1"
>>>
>>> @@ -133,4 +133,6 @@ do_install () {
>>>       fi
>>>
>>>       install -m 0755 ${WORKDIR}/device_table.txt 
>>> ${D}${sysconfdir}/device_table
>>> +    # Holds state information pertaining to urandom
>>> +    install -d ${D}/var/lib/urandom
>>
>> I thought this would go in volatiles, not here.
>>
>> Sau!
>>
> Hi Saul,
>
> From my understanding, volatiles is a configuration file which deals 
> with files related with volatile storage.
> Files, directories and links related to volatile storage should be in 
> this file, as it's a final method to check and make sure they are 
> created properly. But files under /var/lib should not there.

Hi, Saul:

Any comments? Should I send the V2 (put it into volatiles)?

the best,
thank you

>
> So in my option, this patch is ok.
>
> Thanks,
> Chen Qi
>
>>>   }
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



