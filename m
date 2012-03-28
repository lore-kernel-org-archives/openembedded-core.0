Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SD0FM-0004po-CO
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 23:17:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Mar 2012 14:08:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="126257927"
Received: from unknown (HELO [10.255.12.79]) ([10.255.12.79])
	by orsmga002.jf.intel.com with ESMTP; 28 Mar 2012 14:08:11 -0700
Message-ID: <4F737DBB.1060307@linux.intel.com>
Date: Wed, 28 Mar 2012 14:08:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
	<5e91d5cc67fa356f9ed065aad28f978da7d29452.1332826876.git.sgw@linux.intel.com>
	<1489559.CsLVdoLD2R@helios>
In-Reply-To: <1489559.CsLVdoLD2R@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] self-hosted-image: pre-populate the builder user with poky source
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2012 21:17:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/28/2012 01:45 PM, Paul Eggleton wrote:
> On Monday 26 March 2012 22:42:55 Saul Wold wrote:
>> From: Dexuan Cui<dexuan.cui@intel.com>
>>
>> This patch installs the poky source into the /home/builder/poky/ of the
>> self-hosted-image.
>> This makes the user of self-hosted-image easier to start a build.
>>
>> I think the recent poky master is stable enough, so I specify
>> a commit number by SRCREV -- we may want to update this number before
>> releasing 1.2.
>>
>> This patch fixes [YOCTO #2065]
>>
>> Signed-off-by: Dexuan Cui<dexuan.cui@intel.com>
>>
>> Added code for supporting target based pseudo
>> fixed indentation
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   meta/recipes-core/images/self-hosted-image.bb |   41
>> +++++++++++++++++++++++- 1 files changed, 39 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/images/self-hosted-image.bb
>> b/meta/recipes-core/images/self-hosted-image.bb index d56c2cb..5aa670d
>> 100644
>> --- a/meta/recipes-core/images/self-hosted-image.bb
>> +++ b/meta/recipes-core/images/self-hosted-image.bb
>> @@ -4,7 +4,7 @@ LICENSE = "MIT"
>>   LIC_FILES_CHKSUM =
>> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>> file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>>
>> -PR = "r5"
>> +PR = "r6"
>>
>>   CORE_IMAGE_EXTRA_INSTALL = "\
>>       task-self-hosted \
>> @@ -13,7 +13,10 @@ CORE_IMAGE_EXTRA_INSTALL = "\
>>   IMAGE_FEATURES += "x11-mini package-management"
>>
>>   # Ensure there's enough space to do a core-image-minimal build, with
>> rm_work enabled -IMAGE_ROOTFS_EXTRA_SPACE = "2621440"
>> +IMAGE_ROOTFS_EXTRA_SPACE = "1048576"
>> +#IMAGE_ROOTFS_EXTRA_SPACE = "2621440"
>> +#IMAGE_ROOTFS_EXTRA_SPACE = "20971520"
>> +#IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
>>
>>   # Do a quiet boot with limited console messages
>>   APPEND += "quiet"
>> @@ -21,3 +24,37 @@ APPEND += "quiet"
>>   IMAGE_FSTYPES = "vmdk"
>>
>>   inherit core-image
>> +
>> +SRCREV = "26a46938d3ea1821e7bec4fa6cc8379babad238b"
>> +SRC_URI = "git://git.yoctoproject.org/poky;protocol=git"
>> +
>> +fakeroot do_populate_poky_src () {
>> +	# Because fetch2's git's unpack uses -s cloneflag, the unpacked git repo
>> +	# will become invalid in the target.
>> +	rm -rf ${WORKDIR}/git/.git
>> +	rm -f ${WORKDIR}/git/.gitignore
>> +
>> +	cp -Rp ${WORKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
>> +
>> +	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/conf
>> +	cp -Rp ${DL_DIR} ${IMAGE_ROOTFS}/home/builder/poky/build
>
> Could we change this last line to:
>
> mkdir ${IMAGE_ROOTFS}/home/builder/poky/build/downloads
> cp -RpL  ${DL_DIR}/* ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/
>
> This does two things:
>
> 1) Handles if DL_DIR on the build machine is not called "downloads" (which by
> chance mine was not when I tested it)
>
> 2) I notice if you set up a separate downloads directory and then use own-
> mirrors to fetch from your original downloads directory (possibly unorthodox,
> but it gets you a clean downloads directory without redownloading everything)
> you get symlinks into the original downloads dir rather than copied files. I
> don't know how many people will hit this but since we never want any symlinks
> in this directory in the self-hosted image, I think using -L is worth doing
> here.
>
That seems like a completely reasonable change and makes good sense, 
your right I did assume DL_DIR would include downloads.

Sau!

> Cheers,
> Paul
>


