Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U82uz-0000LK-Ic
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 07:12:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1K5uOoQ020784
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Feb 2013 21:56:24 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 19 Feb 2013 21:56:23 -0800
Message-ID: <51246587.2040502@windriver.com>
Date: Wed, 20 Feb 2013 13:56:23 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <cover.1361258872.git.Qi.Chen@windriver.com>
	<faa3ee348ac4e3d74d7f2f00d954ed6ee845bba1.1361258872.git.Qi.Chen@windriver.com>
	<CAC1BbcQHHs+La4h=0GaHWWWsFzpe8EffJKHNyMdPWzNb+0znWw@mail.gmail.com>
In-Reply-To: <CAC1BbcQHHs+La4h=0GaHWWWsFzpe8EffJKHNyMdPWzNb+0znWw@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] image.bbclass: add a hook funtion to support readonly rootfs
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
X-List-Received-Date: Wed, 20 Feb 2013 06:12:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/19/2013 07:39 PM, Bernhard Reutner-Fischer wrote:
> On 19 February 2013 08:38,  <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> read_only_rootfs_hook: this funtion is invoked only if 'read-only-rootfs'
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
>> index dd78acb..7d533b6 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -233,6 +233,24 @@ run_intercept_scriptlets () {
>>          fi
>>   }
>>
>> +# A hook function to support read-only-rootfs IMAGE_FEATURES
>> +# Currently, it only supports sysvinit system.
>> +read_only_rootfs_hook () {
>> +       if ${@base_contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
>> +               # Tweak the mount option in fstab
>> +               sed -i '/rootfs/ s/defaults/ro/' ${IMAGE_ROOTFS}/etc/fstab
> to be cautious i would say
> sed -i -e '/^[#[:space:]]*rootfs/s/defaults/ro/' ${IMAGE_ROOTFS}/etc/fstab
> for ro rootfs fs_passno should be set to 0, too, imo:
> sed -i -e '/^[#[:space:]]*rootfs/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}'
> ${IMAGE_ROOTFS}/etc/fstab

Thank you for your suggestion.

Version 2 has been sent out.

Best Regards,
Chen Qi

>> +               # Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
>> +               if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
>> +                       sed -i 's/ROOTFS_READ_ONLY=no/ROOTFS_READ_ONLY=yes/' ${IMAGE_ROOTFS}/etc/default/rcS
>> +               fi
>> +               # Run populate-volatile.sh at rootfs time to set up basic files
>> +               # and directories to support read-only rootfs.
>> +               if [ -e ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
> -x if you want to execute it below.
>> +                       ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
>> +               fi
>> +       fi
>> +}
>> +
>>   fakeroot do_rootfs () {
>>          #set -x
>>          # When use the rpm incremental image generation, don't remove the rootfs
>



