Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SD0E4-0004nU-Sg
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 23:16:17 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Mar 2012 14:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="126257638"
Received: from unknown (HELO [10.255.12.79]) ([10.255.12.79])
	by orsmga002.jf.intel.com with ESMTP; 28 Mar 2012 14:07:12 -0700
Message-ID: <4F737D80.60802@linux.intel.com>
Date: Wed, 28 Mar 2012 14:07:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: "Cui, Dexuan" <dexuan.cui@intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
	<5e91d5cc67fa356f9ed065aad28f978da7d29452.1332826876.git.sgw@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCE9C6F@SHSMSX102.ccr.corp.intel.com>
In-Reply-To: <A25F549E4D43CD42B4C02DF47A1913230FCE9C6F@SHSMSX102.ccr.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 28 Mar 2012 21:16:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/28/2012 08:35 AM, Cui, Dexuan wrote:
> Hi Saul,
> Did you test "bitbake core-image-minimal" inside the vmware guest?
> I got the following ERROR immediately:
>
This should be addressed by the 5/6 patch that adds the correct PSEUDO_* 
setup into the minix session script.

I guess that you tried to run this on the command line and as you might 
notice I modified the bashrc, but for some reason that did not get 
picked up when the shell started up, I think we need to force the 
builder user to get /bin/bash as a shell not /bin/sh

Sau!

> ------------------------
> ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
>      Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
>      Following is the list of potential problems / advisories:
>
>      Pseudo is not functioning correctly, which will cause failures during package installation. Please check your configuration.
>
> ERROR: Execution of event handler 'check_sanity_eventhandler' failed
> ------------------------
>
> I suspect in the guest, pseudo is not setup properly?
>
> Thanks,
> -- Dexuan
>
>> -----Original Message-----
>> From: Saul Wold [mailto:sgw@linux.intel.com]
>> Sent: Tuesday, March 27, 2012 1:43 PM
>> To: openembedded-core@lists.openembedded.org
>> Cc: Cui, Dexuan
>> Subject: [PATCH 1/6] self-hosted-image: pre-populate the builder user with
>> poky source
>>
>> From: Dexuan Cui<dexuan.cui@intel.com>
>>
>> This patch installs the poky source into the /home/builder/poky/ of the
>> self-hosted-image.
>> This makes the user of self-hosted-image easier to start a build.
>>
>> I think the recent poky master is stable enough, so I specify a commit number
>> by SRCREV -- we may want to update this number before releasing 1.2.
>>
>> This patch fixes [YOCTO #2065]
>>
>> Signed-off-by: Dexuan Cui<dexuan.cui@intel.com>
>>
>> Added code for supporting target based pseudo fixed indentation
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   meta/recipes-core/images/self-hosted-image.bb |   41
>> +++++++++++++++++++++++-
>>   1 files changed, 39 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/images/self-hosted-image.bb
>> b/meta/recipes-core/images/self-hosted-image.bb
>> index d56c2cb..5aa670d 100644
>> --- a/meta/recipes-core/images/self-hosted-image.bb
>> +++ b/meta/recipes-core/images/self-hosted-image.bb
>> @@ -4,7 +4,7 @@ LICENSE = "MIT"
>>   LIC_FILES_CHKSUM =
>> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>>
>> file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de
>> 20420"
>>
>> -PR = "r5"
>> +PR = "r6"
>>
>>   CORE_IMAGE_EXTRA_INSTALL = "\
>>       task-self-hosted \
>> @@ -13,7 +13,10 @@ CORE_IMAGE_EXTRA_INSTALL = "\  IMAGE_FEATURES
>> += "x11-mini package-management"
>>
>>   # Ensure there's enough space to do a core-image-minimal build, with
>> rm_work enabled -IMAGE_ROOTFS_EXTRA_SPACE = "2621440"
>> +IMAGE_ROOTFS_EXTRA_SPACE = "1048576"
>> +#IMAGE_ROOTFS_EXTRA_SPACE = "2621440"
>> +#IMAGE_ROOTFS_EXTRA_SPACE = "20971520"
>> +#IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
>>
>>   # Do a quiet boot with limited console messages  APPEND += "quiet"
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
>> +	echo "/usr/bin">
>> ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
>> +	echo "BB_NO_NETWORK = \"1\"">
>> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
>> +	echo "INHERIT += \"rm_work\"">>
>> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
>> +        mkdir -p ${IMAGE_ROOTFS}/home/builder/pseudo
>> +        echo "export PSEUDO_PREFIX=/usr">>
>> ${IMAGE_ROOTFS}/home/builder/.bashrc
>> +        echo "export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo">>
>> ${IMAGE_ROOTFS}/home/builder/.bashrc
>> +        echo "export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64">>
>> +${IMAGE_ROOTFS}/home/builder/.bashrc
>> +
>> +        chown builder.builder ${IMAGE_ROOTFS}/home/builder/pseudo
>> +
>> +	chown -R builder.builder  ${IMAGE_ROOTFS}/home/builder/poky }
>> +
>> +IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
>> +
>> +python do_get_poky_src () {
>> +    bb.build.exec_func('base_do_fetch', d)
>> +    bb.build.exec_func('base_do_unpack', d) } addtask do_get_poky_src
>> +before do_rootfs
>> --
>> 1.7.7.6
>
>


