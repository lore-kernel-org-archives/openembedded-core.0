Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Ts3PK-0003vX-Ur
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 04:29:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r073EeQU011194
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 6 Jan 2013 19:14:40 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Sun, 6 Jan 2013 19:14:39 -0800
Message-ID: <50EA3DAD.7040206@windriver.com>
Date: Mon, 7 Jan 2013 11:14:53 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1357465230.git.Qi.Chen@windriver.com>
	<1d17c4e8a5cdbfd59016e83b3a6aab810638aebf.1357465230.git.Qi.Chen@windriver.com>
	<20130106095233.GD3272@jama>
In-Reply-To: <20130106095233.GD3272@jama>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V6 3/6] core-image.bbclass: support read-only rootfs
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
X-List-Received-Date: Mon, 07 Jan 2013 03:29:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2013 05:52 PM, Martin Jansa wrote:
> On Sun, Jan 06, 2013 at 05:44:25PM +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> The hook function is appended to ROOTFS_POSTPROCESS_COMMAND
>> properly to support the 'read-only-rootfs' image feature.
>>
>> [YOCTO #3406]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/core-image.bbclass |    5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
>> index 2e67018..ebb9597 100644
>> --- a/meta/classes/core-image.bbclass
>> +++ b/meta/classes/core-image.bbclass
>> @@ -28,6 +28,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
>>   # - dev-pkgs            - development packages (headers, etc.) for all installed packages in the rootfs
>>   # - dbg-pkgs            - debug symbol packages for all installed packages in the rootfs
>>   # - doc-pkgs            - documentation packages for all installed packages in the rootfs
>> +# - read-only-rootfs    - tweaks an image to support read-only rootfs
>>   #
>>   PACKAGE_GROUP_x11 = "packagegroup-core-x11"
>>   PACKAGE_GROUP_x11-base = "packagegroup-core-x11-base"
>> @@ -73,9 +74,9 @@ inherit image
>>   
>>   # Create /etc/timestamp during image construction to give a reasonably sane default time setting
>>   ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
>> -
>>   # Zap the root password if debug-tweaks feature is not enabled
>>   ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_root_password ; ",d)}'
>>   # Allow openssh accept empty password login if both debug-tweaks and ssh-server-openssh are enabled
>>   ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks ssh-server-openssh", "openssh_allow_empty_password; ", "",d)}'
>> -
>> +# Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
> This read_only_rootfs_hook does more than that, please update comment
>
> Cheers,
>

Thank you for your kindly reminding.

I've modified the comment and sent out this patch again.

Cheers,
Chen Qi

>> +ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
>> -- 
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



