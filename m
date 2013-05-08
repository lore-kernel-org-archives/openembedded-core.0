Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UZtmm-0006Ey-NU
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 04:07:20 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r481nCca029310
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 May 2013 18:49:12 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 18:49:12 -0700
Message-ID: <5189AF15.20103@windriver.com>
Date: Wed, 8 May 2013 09:49:09 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1367919920.git.liezhi.yang@windriver.com>
	<518984CD.4060601@linux.intel.com>
In-Reply-To: <518984CD.4060601@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] replace genext2fs with populate-extfs.sh
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
X-List-Received-Date: Wed, 08 May 2013 02:07:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Darren,

No, I haven't sent them to the ext mailing list, can we merge them in
oe-core and then back port to the ext community ? Or I should send them
to the ext mailing list first ?

// Robert

On 05/08/2013 06:48 AM, Darren Hart wrote:
> Have these been reviewed on the ext mailing list already?
>
> --
> Darren
>
> On 05/07/2013 02:48 AM, Robert Yang wrote:
>> * The benefits:
>>    - Really support ext4
>>    - Support the sparse file (the sparse file became into the common file before)
>>    - Have a uniform code for ext2/3/4 generation
>>    - Remove the depends on genext2fs-native
>>
>> * Impact
>>    - Build time:
>>      a) If we build fresh core-image-sato, there is nearly no impact.
>>      b) If we do the image generation, which means:
>>         $ bitbake core-image-sato
>>         $ bitbake core-image-sato -ccleansstate
>>         $ bitbake core-image-sato
>>     About 50 extra seconds are needed, here is my test result:
>>     Before the patches: 4m25s
>>     After the patches: 5m17s
>>     This is because the genext2fs is much faster than the
>>     populate-extfs.sh, we will replace this script by the mke2fs when it
>>     supports create the filesystem from a initial directory.
>>
>>    - Disk space (take core-image-sato as an example)
>>      a) The image file size is the same as before (529M)
>>      b) The disk usage is a little different: (du -sh)
>>                before       now
>>         ext2:  364M         388M
>>         ext3:  381M         404M
>>         ext4:  380M         387M
>>
>>     We may need to adjust the IMAGE_OVERHEAD_FACTOR from 1.3 to 1.4.
>>
>>     I have done some simple runtime testing on core-image-sato and
>>     core-image-minimal, they worked well.
>>
>> // Robert
>>
>> The following changes since commit 3472c1f7ab409cd91c1d4782d9e00880b84e3ae8:
>>
>>    grub-efi-native: Cleanup whitespace (2013-05-03 16:37:05 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib robert/ext4
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ext4
>>
>> Robert Yang (4):
>>    e2fsprogs: the max length of debugfs argument is too short
>>    e2fsprogs: let debugfs do sparse copy
>>    e2fsprogs: add populate-extfs.sh
>>    image_types.bbclass: replace genext2fs with populate-extfs.sh
>>
>>   meta/classes/image_types.bbclass                   |   46 ++++----
>>   .../e2fsprogs-1.42.7/debugfs-too-short.patch       |   28 +++++
>>   .../e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh   |   93 ++++++++++++++++
>>   .../e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch   |  114 ++++++++++++++++++++
>>   .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb |    4 +
>>   5 files changed, 257 insertions(+), 28 deletions(-)
>>   create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch
>>   create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh
>>   create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch
>>
>


