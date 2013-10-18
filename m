Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA9D06CE9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 15:10:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9IFAuAi028179
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:10:56 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 18 Oct 2013 08:10:56 -0700
Message-ID: <52614F81.9010303@windriver.com>
Date: Fri, 18 Oct 2013 10:10:57 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1381954954.git.tom.zanussi@linux.intel.com>	<fd09f894b40dadb8bc8b267a26dbf52e22a53d66.1381954954.git.tom.zanussi@linux.intel.com>
	<1382108670.29912.553.camel@ted>
In-Reply-To: <1382108670.29912.553.camel@ted>
Subject: Re: [PATCH 1/1] wic: add pseudo to the populate-extfs step
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
X-List-Received-Date: Fri, 18 Oct 2013 15:10:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/13 10:04 AM, Richard Purdie wrote:
> On Wed, 2013-10-16 at 15:25 -0500, Tom Zanussi wrote:
>> Without this, files in the generated filesystem pick up the wrong
>> ownership.
>>
>> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
>> ---
>>   scripts/lib/mic/kickstart/custom_commands/partition.py | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
>> index 302cace..0eb0671 100644
>> --- a/scripts/lib/mic/kickstart/custom_commands/partition.py
>> +++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
>> @@ -216,7 +216,14 @@ class Wic_PartData(Mic_PartData):
>>           """
>>           Prepare content for an ext2/3/4 rootfs partition.
>>           """
>> -        populate_script = "%s/usr/bin/populate-extfs.sh" % native_sysroot
>> +        populate_script = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
>> +        populate_script += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" % rootfs_dir
>> +        populate_script += "export PSEUDO_PASSWD=%s;" % rootfs_dir

Location of the passwd file, if we are in a chroot, it will use the chroot'd 
version, otherwise you need to tell pseudo where it is.

>> +        populate_script += "export PSEUDO_NOSYMLINKEXP=1;"

This controls how the symlinks are populated from the point of view of 
non-pseudo environment.  If you intend to manipulate the results (and make them 
useful) -outside- of the pseudo environment, you need this.  If you do all of 
your operations from within pseudo, the defaults are correct.  Otherwise you can 
get links such as "/bin/sh -> /bin/bash" and it points to the host's bash, not 
the chroot's /bin/bash.

>> +        populate_script += "export PSEUDO_DISABLED=0;"

This shouldn't have to be set, unless the disabled has been previously set in 
the environment.

>> +        populate_script += "%s/usr/bin/pseudo %s/usr/bin/populate-extfs.sh" % \
>> +            (native_sysroot, native_sysroot)
>> +
>>           image_extra_space = 10240
>>
>>           image_rootfs = rootfs_dir
>
> I've merged this but I would like to figure out why pseudo can't manage
> more sane defaults rather than needing all of those variables...
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


