Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TyZb8-0005XV-Kp
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 04:05:03 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0P2nON4016470
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 18:49:24 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Thu, 24 Jan 2013 18:49:23 -0800
Message-ID: <5101F2C0.60905@windriver.com>
Date: Fri, 25 Jan 2013 10:49:36 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<3d6b90b5ad79166eda3883ad4e9d5ca1ed937f10.1359014474.git.Qi.Chen@windriver.com>
	<51018F26.104@windriver.com>
In-Reply-To: <51018F26.104@windriver.com>
X-Originating-IP: [128.224.163.154]
Subject: Re: [PATCH 02/12] image.bbclass: add a hook funtion to support readonly rootfs
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
X-List-Received-Date: Fri, 25 Jan 2013 03:05:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/25/2013 03:44 AM, Mark Hatle wrote:
> On 1/24/13 2:16 AM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> read_only_rootfs_hook: this funtion is invoked only if 
>> 'read-only-rootfs'
>> is in IMAGE_FEATURES. It tweaks some basic files and makes populate-
>> volatile.sh script run at rootfs time.
>>
>> For now, it has real effect only if the init system is sysvinit.
>>
>> [YOCTO #3406]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/image.bbclass |   18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 0293d2e..91045fc 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -201,6 +201,24 @@ run_intercept_scriptlets () {
>>       fi
>>   }
>>
>> +# A hook function to support read-only-rootfs IMAGE_FEATURES
>> +# Currently, it only supports sysvinit system.
>> +read_only_rootfs_hook () {
>> +    if ${@base_contains("DISTRO_FEATURES", "sysvinit", "true", 
>> "false", d)}; then
>> +            # Tweak the mount option in fstab
>> +        sed -i '/rootfs/ s/defaults/ro/' ${IMAGE_ROOTFS}/etc/fstab
>
> There is a slight bug in the above.  Not all configurations will 
> contain an /etc/fstab!  So you need to check for the existence of the 
> file before you try to sed it.
>
> (Initramfs is where I hit a problem trying to test this.)
>
> --Mark
>

Thank you for pointing it out. I'll fix it.

Thanks,
Chen Qi

>> +            # Change the value of ROOTFS_READ_ONLY in 
>> /etc/default/rcS to yes
>> +        if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
>> +            sed -i 's/ROOTFS_READ_ONLY=no/ROOTFS_READ_ONLY=yes/' 
>> ${IMAGE_ROOTFS}/etc/default/rcS
>> +        fi
>> +            # Run populate-volatile.sh at rootfs time to set up 
>> basic files
>> +            # and directories to support read-only rootfs.
>> +        if [ -e ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
>> +            ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
>> +        fi
>> +    fi
>> +}
>> +
>>   fakeroot do_rootfs () {
>>       #set -x
>>       # When use the rpm incremental image generation, don't remove 
>> the rootfs
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



