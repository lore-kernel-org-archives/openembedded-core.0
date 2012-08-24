Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4xHS-0000dF-Qa
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 19:02:48 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Aug 2012 09:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="210668804"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2012 09:50:36 -0700
Message-ID: <5037B0DC.7080100@linux.intel.com>
Date: Fri, 24 Aug 2012 09:50:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Scott Garman <scott.a.garman@intel.com>
References: <1345745765-22194-1-git-send-email-sgw@linux.intel.com>
	<503730A6.4020708@intel.com>
In-Reply-To: <503730A6.4020708@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH - Denzil 1/2] build-appliance-image: rename from self-hosted-image
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
X-List-Received-Date: Fri, 24 Aug 2012 17:02:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2012 12:43 AM, Scott Garman wrote:
> On 08/23/2012 11:16 AM, Saul Wold wrote:
>> From: Valentin Popa <valentin.popa@intel.com>
>>
>> (-) renamed self-hosted-image to build-appliance-image
>> (-) replaced build-appliance-image description
>>
>> [YOCTO #2636]
>>
>> (From OE-Core rev: 04096f31778886479dac479132bded57e717653e)
>>
>> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Hi Saul,
>
> Would you mind pushing these commits to a contrib branch so I can
> cherry-pick them?
>
Check out sgw/denzil

Sau!

> Thanks,
>
> Scott
>
>> ---
>>   meta/conf/multilib.conf                           |    2 +-
>>   meta/recipes-core/images/build-appliance-image.bb |   70
>> +++++++++++++++++++++
>>   meta/recipes-core/images/self-hosted-image.bb     |   70
>> ---------------------
>>   3 files changed, 71 insertions(+), 71 deletions(-)
>>   create mode 100644 meta/recipes-core/images/build-appliance-image.bb
>>   delete mode 100644 meta/recipes-core/images/self-hosted-image.bb
>>
>> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
>> index 3b47c48..950f7cb 100644
>> --- a/meta/conf/multilib.conf
>> +++ b/meta/conf/multilib.conf
>> @@ -581,7 +581,7 @@ BBCLASSEXTEND_append_pn-sat-solver = " ${MULTILIBS}"
>>   BBCLASSEXTEND_append_pn-screen = " ${MULTILIBS}"
>>   BBCLASSEXTEND_append_pn-scrnsaverproto = " ${MULTILIBS}"
>>   BBCLASSEXTEND_append_pn-sed = " ${MULTILIBS}"
>> -BBCLASSEXTEND_append_pn-self-hosted-image = " ${MULTILIBS}"
>> +BBCLASSEXTEND_append_pn-build-appliance-image = " ${MULTILIBS}"
>>   BBCLASSEXTEND_append_pn-service = " ${MULTILIBS}"
>>   BBCLASSEXTEND_append_pn-setserial = " ${MULTILIBS}"
>>   BBCLASSEXTEND_append_pn-settings-daemon = " ${MULTILIBS}"
>> diff --git a/meta/recipes-core/images/build-appliance-image.bb
>> b/meta/recipes-core/images/build-appliance-image.bb
>> new file mode 100644
>> index 0000000..2b7906f
>> --- /dev/null
>> +++ b/meta/recipes-core/images/build-appliance-image.bb
>> @@ -0,0 +1,70 @@
>> +DESCRIPTION = "An image you can boot and run using either the VMware
>> Player or VMware Workstation.  For more information, see the<a
>> href='http://www.yoctoproject.org/documentation/build-appliance'>Build
>> Appliance page</a>."
>> +IMAGE_INSTALL = "task-core-boot task-core-apps-console
>> task-core-ssh-openssh task-self-hosted"
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM =
>> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>> +
>> file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> +
>> +PR = "r15"
>> +
>> +IMAGE_FEATURES += "x11-mini package-management"
>> +
>> +# Ensure there's enough space to do a core-image-sato build, with
>> rm_work enabled
>> +IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
>> +
>> +# Do a quiet boot with limited console messages
>> +APPEND += "quiet"
>> +
>> +IMAGE_FSTYPES = "vmdk"
>> +
>> +inherit core-image
>> +
>> +SRCREV = "3ab5d73f0c49df9fefa2a46031d33436bbd7d7d8"
>> +SRC_URI = "git://git.yoctoproject.org/poky;protocol=git"
>> +
>> +IMAGE_CMD_ext3_append () {
>> +    # We don't need to reserve much space for root, 0.5% is more than
>> enough
>> +    tune2fs -m 0.5 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
>> +}
>> +
>> +fakeroot do_populate_poky_src () {
>> +    # Because fetch2's git's unpack uses -s cloneflag, the unpacked
>> git repo
>> +    # will become invalid in the target.
>> +    rm -rf ${WORKDIR}/git/.git
>> +    rm -f ${WORKDIR}/git/.gitignore
>> +
>> +    cp -Rp ${WORKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
>> +
>> +    mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/conf
>> +    mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/downloads
>> +    cp -RpL ${DL_DIR}/*
>> ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/
>> +
>> +    # Remove the git2_* tarballs -- this is ok since we still have
>> the git2/.
>> +    rm -rf ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/git2_*
>> +
>> +    echo "/usr/bin" > ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
>> +    echo "INHERIT += \"rm_work\"" >>
>> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
>> +    mkdir -p ${IMAGE_ROOTFS}/home/builder/pseudo
>> +    echo "export PSEUDO_PREFIX=/usr" >>
>> ${IMAGE_ROOTFS}/home/builder/.bashrc
>> +    echo "export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo" >>
>> ${IMAGE_ROOTFS}/home/builder/.bashrc
>> +    echo "export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64" >>
>> ${IMAGE_ROOTFS}/home/builder/.bashrc
>> +
>> +    chown builder.builder ${IMAGE_ROOTFS}/home/builder/pseudo
>> +
>> +    chown -R builder.builder  ${IMAGE_ROOTFS}/home/builder/poky
>> +
>> +    # Allow builder to use sudo to setup tap/tun
>> +    echo "builder ALL=(ALL) NOPASSWD: ALL" >>
>> ${IMAGE_ROOTFS}/etc/sudoers
>> +
>> +    # Use Clearlooks GTK+ theme
>> +    mkdir -p ${IMAGE_ROOTFS}/etc/gtk-2.0
>> +    echo 'gtk-theme-name = "Clearlooks"' >
>> ${IMAGE_ROOTFS}/etc/gtk-2.0/gtkrc
>> +}
>> +
>> +IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
>> +
>> +python do_get_poky_src () {
>> +    bb.build.exec_func('base_do_fetch', d)
>> +    bb.build.exec_func('base_do_unpack', d)
>> +}
>> +addtask do_get_poky_src before do_rootfs
>> diff --git a/meta/recipes-core/images/self-hosted-image.bb
>> b/meta/recipes-core/images/self-hosted-image.bb
>> deleted file mode 100644
>> index aef1507..0000000
>> --- a/meta/recipes-core/images/self-hosted-image.bb
>> +++ /dev/null
>> @@ -1,70 +0,0 @@
>> -DESCRIPTION = "Version 1.0-r6 of the self-hosted image."
>> -IMAGE_INSTALL = "task-core-boot task-core-apps-console
>> task-core-ssh-openssh task-self-hosted"
>> -
>> -LICENSE = "MIT"
>> -LIC_FILES_CHKSUM =
>> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>> -
>> file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> -
>> -PR = "r15"
>> -
>> -IMAGE_FEATURES += "x11-mini package-management"
>> -
>> -# Ensure there's enough space to do a core-image-sato build, with
>> rm_work enabled
>> -IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
>> -
>> -# Do a quiet boot with limited console messages
>> -APPEND += "quiet"
>> -
>> -IMAGE_FSTYPES = "vmdk"
>> -
>> -inherit core-image
>> -
>> -SRCREV = "3ab5d73f0c49df9fefa2a46031d33436bbd7d7d8"
>> -SRC_URI = "git://git.yoctoproject.org/poky;protocol=git"
>> -
>> -IMAGE_CMD_ext3_append () {
>> -    # We don't need to reserve much space for root, 0.5% is more than
>> enough
>> -    tune2fs -m 0.5 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
>> -}
>> -
>> -fakeroot do_populate_poky_src () {
>> -    # Because fetch2's git's unpack uses -s cloneflag, the unpacked
>> git repo
>> -    # will become invalid in the target.
>> -    rm -rf ${WORKDIR}/git/.git
>> -    rm -f ${WORKDIR}/git/.gitignore
>> -
>> -    cp -Rp ${WORKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
>> -
>> -    mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/conf
>> -    mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/downloads
>> -    cp -RpL ${DL_DIR}/*
>> ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/
>> -
>> -    # Remove the git2_* tarballs -- this is ok since we still have
>> the git2/.
>> -    rm -rf ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/git2_*
>> -
>> -    echo "/usr/bin" > ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
>> -    echo "INHERIT += \"rm_work\"" >>
>> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
>> -    mkdir -p ${IMAGE_ROOTFS}/home/builder/pseudo
>> -    echo "export PSEUDO_PREFIX=/usr" >>
>> ${IMAGE_ROOTFS}/home/builder/.bashrc
>> -    echo "export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo" >>
>> ${IMAGE_ROOTFS}/home/builder/.bashrc
>> -    echo "export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64" >>
>> ${IMAGE_ROOTFS}/home/builder/.bashrc
>> -
>> -    chown builder.builder ${IMAGE_ROOTFS}/home/builder/pseudo
>> -
>> -    chown -R builder.builder  ${IMAGE_ROOTFS}/home/builder/poky
>> -
>> -    # Allow builder to use sudo to setup tap/tun
>> -    echo "builder ALL=(ALL) NOPASSWD: ALL" >>
>> ${IMAGE_ROOTFS}/etc/sudoers
>> -
>> -    # Use Clearlooks GTK+ theme
>> -    mkdir -p ${IMAGE_ROOTFS}/etc/gtk-2.0
>> -    echo 'gtk-theme-name = "Clearlooks"' >
>> ${IMAGE_ROOTFS}/etc/gtk-2.0/gtkrc
>> -}
>> -
>> -IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
>> -
>> -python do_get_poky_src () {
>> -    bb.build.exec_func('base_do_fetch', d)
>> -    bb.build.exec_func('base_do_unpack', d)
>> -}
>> -addtask do_get_poky_src before do_rootfs
>>
>
>


