Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UdAyY-0004A2-OX
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 05:05:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4H2kgtP024007
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 May 2013 19:46:43 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 16 May 2013 19:46:41 -0700
Message-ID: <51959A10.8000402@windriver.com>
Date: Fri, 17 May 2013 10:46:40 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1368690819.git.Qi.Chen@windriver.com>
	<d978543b3558dc8cc14379cd10506c3f0c6f2953.1368690819.git.Qi.Chen@windriver.com>
	<5195262C.3090709@linux.intel.com>
In-Reply-To: <5195262C.3090709@linux.intel.com>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] image.bbclass: add postinst_enable_logging
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
X-List-Received-Date: Fri, 17 May 2013 03:05:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/17/2013 02:32 AM, Saul Wold wrote:
> On 05/16/2013 10:56 AM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Add a function postinst_enable_logging, so that when 'debug-tweaks'
>> is in IMAGE_FEATURES, we create .enable_postinst_logging under /etc,
>> which is used by run-postinst scripts to determine whether to log or
>> not.
>>
>> [YOCTO #4262]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/image.bbclass |    7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 2b42e12..fc5e23c 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -175,6 +175,8 @@ MACHINE_POSTPROCESS_COMMAND ?= ""
>>   ROOTFS_POSTPROCESS_COMMAND_prepend = "run_intercept_scriptlets; "
>>   # Allow dropbear/openssh to accept logins from accounts with an 
>> empty password string if debug-tweaks is enabled
>>   ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", 
>> "debug-tweaks", "ssh_allow_empty_password; ", "",d)}'
>> +# Enable postinst logging if debug-tweaks is enabled
>> +ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", 
>> "debug-tweaks", "postinst_enable_logging; ", "",d)}'
>>
>>   # some default locales
>>   IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
>> @@ -484,6 +486,11 @@ ssh_allow_empty_password () {
>>       fi
>>   }
>>
>> +# Enable postinst logging if debug-tweaks is enabled
>> +postinst_enable_logging () {
>> +    touch ${IMAGE_ROOTFS}/etc/.enable_postinst_logging
>
> I do not think this should go here, maybe better to have it in the 
> /etc/default dir and named postinst, since that matches what other init
> related scripts do and source the file in each postinst script, it 
> should also have a standard guard to check existance of the file and 
> checks something like a "ENABLED" variable instead?  This could also 
> be extended for getting the log file location also.
>
> Sau!
>

Thanks a lot.
I'll follow your advices and send out a v2.

Best Regards,
Chen Qi

>
>> +}
>> +
>>   # Turn any symbolic /sbin/init link into a file
>>   remove_init_link () {
>>       if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
>>
>
>



