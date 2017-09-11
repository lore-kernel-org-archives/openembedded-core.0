Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 672B97822D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 14:15:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8BEF4JC025369
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 11 Sep 2017 07:15:05 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 11 Sep 2017 07:15:03 -0700
To: Mike Looijmans <mike.looijmans@topic.nl>,
	<openembedded-core@lists.openembedded.org>
References: <1504577432-63141-1-git-send-email-mark.hatle@windriver.com>
	<198c3d9e-8b4a-db67-3dea-4ac4f40174f9@topic.nl>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <015aa6bc-59bb-adcf-01f6-222a8b645561@windriver.com>
Date: Mon, 11 Sep 2017 09:15:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <198c3d9e-8b4a-db67-3dea-4ac4f40174f9@topic.nl>
Subject: Re: [PATCH] psplash: Initialize psplash only if a framebuffer exists
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
X-List-Received-Date: Mon, 11 Sep 2017 14:15:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/6/17 8:31 AM, Mike Looijmans wrote:
> Isn't this a weird situation?
> 
> If you installed psplash but don't have a framebuffer, then something must be 
> broken. I'd rather see that error than this being silently ignored and then 
> wondering where the splash went.

Sorry I missed this reply before.

We choose to disable the warning because we've got many systems where we have a
common rootfs.  Some of them have displays and some do not.  The message was
triggering test failures (that look for errors/warning on bootup.)

It might make sense for someone to check and instead of silently stop, report
back a message that indicates that there is no framebuffer instead of the
existing error.  That would at least make this a 'known' condition.

> There's the corner case (most of my boards and for example settop boxes behave 
> like this) that the framebuffer initializes some time later in the boot 
> process (e.g. after loading FPGA logic, or loading some closed-source binary 
> video driver blob). For these systems, the psplash should be initialized by 
> the hotplug manager (mdev, udev, systemd) as soon as the device appears.

I hadn't considered that setup, but yes.  An extension to udev or similar would
make sense in that case.

--Mark

> On 05-09-17 04:10, Mark Hatle wrote:
>> psplash-init exits if there is no framebuffer device detected.
>> This is done to avoid the following error message from
>> occurring when booting up:
>>
>> "Error opening /dev/fb0: No such file or directory"
>>
>> Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta/recipes-core/psplash/files/psplash-init | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recipes-core/psplash/files/psplash-init
>> index 66c85e9..0bce1de 100755
>> --- a/meta/recipes-core/psplash/files/psplash-init
>> +++ b/meta/recipes-core/psplash/files/psplash-init
>> @@ -7,6 +7,12 @@
>>   # Default-Stop:
>>   ### END INIT INFO
>>   
>> +if [ ! -e /dev/fb0 ]; then
>> +    echo "Framebuffer /dev/fb0 not detected"
>> +    echo "Boot splashscreen disabled"
>> +    exit 0;
>> +fi
>> +
>>   read CMDLINE < /proc/cmdline
>>   for x in $CMDLINE; do
>>           case $x in
>>
> 
> 
> 
> Kind regards,
> 
> Mike Looijmans
> System Expert
> 
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
> 
> Please consider the environment before printing this e-mail
> 
> 
> 


