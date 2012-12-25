Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TnQxd-00040l-PA
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Dec 2012 10:38:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBP9NGfO013926
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Dec 2012 01:23:16 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 25 Dec 2012 01:23:15 -0800
Message-ID: <50D970A1.1020806@windriver.com>
Date: Tue, 25 Dec 2012 17:23:45 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1356335387.git.Qi.Chen@windriver.com>
	<20121225081912.GU8988@jama.palm1.palmone.com>
In-Reply-To: <20121225081912.GU8988@jama.palm1.palmone.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/2] read-only rootfs support
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
X-List-Received-Date: Tue, 25 Dec 2012 09:38:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/2012 04:19 PM, Martin Jansa wrote:
> On Tue, Dec 25, 2012 at 10:55:03AM +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi<Qi.Chen@windriver.com>
>>
>> Add read-only rootfs support to sysvinit startup system.
>> The main changes are:
>> 1) Let rootfs_xxx.bbclass support 'read-only-rootfs' image feature.
>>     If IMAGE_FEATURES contains 'read-only-rootfs', then the populate-volatile.sh
>>     script is run at rootfs time to set up basic directories and files.
>> 2) Improve the populate-volatile.sh init script.
>> 3) Add two config files specific to read-only-rootfs image, which are to be used
>>     by the populate-volatile.sh script.
>> 4) Automatically adjust the mount options in fstab when 'read-only-rootfs' is in
>>     IMAGE_FEATURES.
>>
>> Version 2 fixes a problem version one has, that is, if we build an image without
>> 'read-only-rootfs' image feature after we built one that has this feature, the
>> mount options in fstab is wrong.
> initscripts recipe still have that issue.
>
> Cheers,
Yes, you're right.
If we build an image without 'read-only-rootfs' image feature after we 
built one that has, all symbolic links used for an read-only-rootfs 
image should be removed and corresponding directories should be created.
Thanks a lot for your review and reply. I'll fix this problem and send 
out a V3.

Best Regards,
Chen Qi

>> The following changes since commit 90c0eb29f0b41e4ac2d3d17ebad7295c2ebdc02a:
>>
>>    rootfs_rpm.bbclass: remove debug code (2012-12-19 21:43:55 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib ChenQi/readonly-rootfs
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/readonly-rootfs
>>
>> Chen Qi (2):
>>    initscripts: support read-only rootfs
>>    rootfs_xxx.bbclass: support read-only-rootfs image feature
>>
>>   meta/classes/rootfs_deb.bbclass                    |   14 +
>>   meta/classes/rootfs_ipk.bbclass                    |   15 ++
>>   meta/classes/rootfs_rpm.bbclass                    |   20 +-
>>   meta/recipes-core/base-files/base-files_3.0.14.bb  |    8 +-
>>   .../initscripts/initscripts-1.0/bootmisc.sh        |    9 +-
>>   .../initscripts-1.0/populate-volatile.sh           |  285 ++++++++++----------
>>   .../initscripts/initscripts-1.0/volatiles          |    1 +
>>   .../initscripts-1.0/volatiles-readonly-minimal     |   23 ++
>>   .../initscripts-1.0/volatiles-readonly-sato        |   30 +++
>>   meta/recipes-core/initscripts/initscripts_1.0.bb   |   15 +-
>>   10 files changed, 265 insertions(+), 155 deletions(-)
>>   create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-minimal
>>   create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-sato
>>
>> -- 
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



