Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkUIE-0005Jr-8d
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 08:02:58 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jun 2012 22:52:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171501983"
Received: from unknown (HELO envy.home) ([10.255.12.71])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2012 22:52:01 -0700
Message-ID: <4FED4226.30700@linux.intel.com>
Date: Thu, 28 Jun 2012 22:50:30 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1340942930.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340942930.git.dvhart@linux.intel.com>
	<5b45f71fee3c593e5420a5a9b36ba947c429a397.1340942930.git.dvhart@linux.intel.com>
	<CAMKF1sopV66-Rohk5HYMygcSamkcxDgOM8bfruF7VWR0ZAXpnQ@mail.gmail.com>
In-Reply-To: <CAMKF1sopV66-Rohk5HYMygcSamkcxDgOM8bfruF7VWR0ZAXpnQ@mail.gmail.com>
X-Enigmail-Version: 1.4.2
Cc: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] kernel: Add kernel-headers package for target module build
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
X-List-Received-Date: Fri, 29 Jun 2012 06:02:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/28/2012 09:52 PM, Khem Raj wrote:
> On Thu, Jun 28, 2012 at 9:18 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>> [YOCTO #1614]
>>
>> Add a kernel-headers package to kernel.bbclass. This packages
>> effectively packages what was already built and kept in sysroots for
>> building modules with bitbake. Making this available on the target
>> requires removing some additional host binaries.
>>
>> Move the location to /usr/src/kernel-headers.
>>
>> Before use on the target, the user will need to:
>>
>>    # cd /usr/src/kernel-headers
>>    # make scripts
>>
> 
> IMO using kernel-headers may not be representing the package contents
> correctly since I believe it contains more than headers. Its probably
> kernel-dev or external-lkm-dev or somesuch.

I modeled the name after ubuntu which uses the name "linux-headers".
Fedora calls it "kernel-devel". I chose the prefix "kernel" as that is
what all the rest of the packages start with and I chose "headers" as I
am most familiar with the Debian world (he says from his FC17 laptop...).

However, I don't have a strong opinion here, I'll happily call it
kernel-devel if that is strongly preferred by some.

--
Darren

> 
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
>> CC: Tom Zanussi <tom.zanussi@intel.com>
>> CC: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/classes/kernel.bbclass |   11 +++++++----
>>  meta/conf/bitbake.conf      |    2 +-
>>  2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 31e633b..b82af74 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -130,7 +130,7 @@ kernel_do_install() {
>>        # Support for external module building - create a minimal copy of the
>>        # kernel source tree.
>>        #
>> -       kerneldir=${D}/kernel
>> +       kerneldir=${D}/usr/src/kernel-headers
>>        install -d $kerneldir
>>
>>        #
>> @@ -183,10 +183,11 @@ kernel_do_install() {
>>                cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
>>        fi
>>
>> -       # Remove the following binaries which cause strip errors
>> +       # Remove the following binaries which cause strip or arch QA errors
>>        # during do_package for cross-compiled platforms
>>        bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
>> -                  arch/powerpc/boot/mktree"
>> +                  arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
>> +                  scripts/kconfig/conf.o"
>>        for entry in $bin_files; do
>>                rm -f $kerneldir/$entry
>>        done
>> @@ -247,13 +248,15 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>>
>>  # kernel-base becomes kernel-${KERNEL_VERSION}
>>  # kernel-image becomes kernel-image-${KERNEL_VERISON}
>> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-misc"
>> +PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev \
>> +            kernel-misc kernel-headers"
>>  FILES = ""
>>  FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
>>  FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*"
>>  FILES_kernel-vmlinux = "/boot/vmlinux*"
>>  # misc is a package to contain files we need in staging
>>  FILES_kernel-misc = "/kernel/include/config /kernel/scripts /kernel/drivers/crypto /kernel/drivers/media"
>> +FILES_kernel-headers = "/usr/src/kernel-headers"
>>  RDEPENDS_kernel = "kernel-base"
>>  # Allow machines to override this dependency if kernel image files are
>>  # not wanted in images as standard
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 9b26580..9f3abee 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -380,7 +380,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
>>  ##################################################################
>>
>>  OLDEST_KERNEL = "2.6.16"
>> -STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/kernel"
>> +STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/usr/src/kernel-headers"
>>
>>  ##################################################################
>>  # Specific image creation and rootfs population info.
>> --
>> 1.7.10.2
>>

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




