Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9VCv-0007i3-0l
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 08:04:53 +0200
Received: by wibhq4 with SMTP id hq4so5227582wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 22:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=UoF5KG7YCokiF8TuWwxhk6ak+V7FCGH7X1op/gpAeVs=;
	b=LhioLkhOE/uQzjo6kM9SHM131Oq1grhQEkPW01HoZPgJMtoOWKXGBJo/YoPuMza7L5
	lnJUxBVzRx9K//12rdddsnkQiaexyF324H2J5G59seSKkU5mngRkFtZJQPSAhkFTcV5O
	zn77YgfvCdNt00bQUIHcGtygUpEDRUOZBosD5eQ+Sbzj4zRldvZ2qYWrlMcPHrCXIGhV
	iX1NImI/Vbb3JYE5W9m5yNeGpF8denMGxQaoq9qJT+AcIuc5lAh78jzUwW+dI27U6Qcl
	TE5UK92AQoyP1L1byQXmQvfvRP4VUHQEe1WzI6HsYCn/EELxVjr1wJ0BfA9Gurgx+TaC
	kMbg==
Received: by 10.216.121.16 with SMTP id q16mr513651weh.193.1346910748943;
	Wed, 05 Sep 2012 22:52:28 -0700 (PDT)
Received: from [172.20.0.49] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id do5sm3281242wib.10.2012.09.05.22.52.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 22:52:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5047F316.8030808@linux.intel.com>
Date: Thu, 6 Sep 2012 07:52:26 +0200
Message-Id: <E5E839E2-8D4D-4B80-BC93-BD72FA95F5FA@dominion.thruhere.net>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
	<1346136108-13062-9-git-send-email-koen@dominion.thruhere.net>
	<70CC66F5C30A414DADDA6973E4CA391A64E50F@039-SN1MPN1-001.039d.mgd.msft.net>
	<5047F316.8030808@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQlWQa1hDnKfW42cB386tayOJ8NQLbWacctt5K7CqGvl0yZsVr2VRbnAsBUPHS9MsAVmOhV7
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Scott Garman <scott.a.garman@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-denzil][meta-oe][PATCH 09/11] kernel: Add kernel headers to kernel-dev package
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
X-List-Received-Date: Thu, 06 Sep 2012 06:04:53 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 6 sep. 2012, om 02:49 heeft Darren Hart <dvhart@linux.intel.com> het =
volgende geschreven:

>=20
>=20
> On 09/05/2012 02:42 PM, McClintock Matthew-B29882 wrote:
>> On Tue, Aug 28, 2012 at 1:41 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>> From: Darren Hart <dvhart@linux.intel.com>
>>>=20
>>> [YOCTO #1614]
>>>=20
>>> Add the kernel headers to the kernel-dev package. This packages what =
was
>>> already built and kept in sysroots for building modules with =
bitbake.
>>> Making this available on the target requires removing some =
additional
>>> host binaries.
>>>=20
>>> Move the location to /usr/src/kernel
>>>=20
>>> Before use on the target, the user will need to:
>>>=20
>>>    # cd /usr/src/kernel
>>>    # make scripts
>>>=20
>>> This renders the kernel-misc recipe empty, so remove it.
>>>=20
>>> As we use /usr/src/kernel in several places (and I missed one in the
>>> previous version), add a KERNEL_SRC_DIR variable and use that =
throughout
>>> the class to avoid update errors in the future.
>>>=20
>>> Now that we package the kernel headers, drop the
>>> kernel_package_preprocess function which removed them from PKGD.
>>>=20
>>> All *-sdk image recipes include dev-pkgs, so the kernel-dev package =
will
>>> be installed by default on all such images.
>>>=20
>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> CC: Tom Zanussi <tom.zanussi@intel.com>
>>> CC: Khem Raj <raj.khem@gmail.com>
>>>=20
>>> ---
>>> meta/classes/kernel.bbclass |   25 +++++++++++--------------
>>> meta/conf/bitbake.conf      |    2 +-
>>> 2 files changed, 12 insertions(+), 15 deletions(-)
>>>=20
>>> diff --git a/meta/classes/kernel.bbclass =
b/meta/classes/kernel.bbclass
>>> index 3ccd753..d79ba9f 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -77,6 +77,10 @@ EXTRA_OEMAKE =3D ""
>>>=20
>>> KERNEL_ALT_IMAGETYPE ??=3D ""
>>>=20
>>> +# Define where the kernel headers are installed on the target as =
well as where
>>> +# they are staged.
>>> +KERNEL_SRC_PATH =3D "/usr/src/kernel"
>>> +
>>> KERNEL_IMAGETYPE_FOR_MAKE =3D "${@(lambda s: s[:-3] if s[-3:] =3D=3D =
".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
>>>=20
>>> kernel_do_compile() {
>>> @@ -130,7 +134,7 @@ kernel_do_install() {
>>>        # Support for external module building - create a minimal =
copy of the
>>>        # kernel source tree.
>>>        #
>>> -       kerneldir=3D${D}/kernel
>>> +       kerneldir=3D${D}${KERNEL_SRC_PATH}
>>>        install -d $kerneldir
>>>=20
>>>        #
>>> @@ -191,20 +195,15 @@ kernel_do_install() {
>>>        # Remove the following binaries which cause strip errors
>>>        # during do_package for cross-compiled platforms
>>>        bin_files=3D"arch/powerpc/boot/addnote =
arch/powerpc/boot/hack-coff \
>>> -                  arch/powerpc/boot/mktree"
>>> +                  arch/powerpc/boot/mktree =
scripts/kconfig/zconf.tab.o \
>>> +                  scripts/kconfig/conf.o"
>>>        for entry in $bin_files; do
>>>                rm -f $kerneldir/$entry
>>>        done
>>> }
>>>=20
>>> -PACKAGE_PREPROCESS_FUNCS +=3D "kernel_package_preprocess"
>>> -
>>> -kernel_package_preprocess () {
>>> -       rm -rf ${PKGD}/kernel
>>> -}
>>> -
>>> sysroot_stage_all_append() {
>>> -       sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}/kernel
>>> +       sysroot_stage_dir ${D}${KERNEL_SRC_PATH} =
${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
>>> }
>>>=20
>>> kernel_do_configure() {
>>> @@ -252,13 +251,11 @@ EXPORT_FUNCTIONS do_compile do_install =
do_configure
>>>=20
>>> # kernel-base becomes kernel-${KERNEL_VERSION}
>>> # kernel-image becomes kernel-image-${KERNEL_VERISON}
>>> -PACKAGES =3D "kernel kernel-base kernel-image kernel-dev =
kernel-vmlinux kernel-misc"
>>> +PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image =
kernel-dev"
>>> FILES =3D ""
>>> FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
>>> -FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* =
/boot/config*"
>>> +FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* =
/boot/config* ${KERNEL_SRC_PATH}"
>>=20
>> This patch is causing the following on denzil (which Scott applied to
>> his denzil-next branch)
>>=20
>> ERROR: QA Issue: non debug package contains .debug directory:
>> kernel-dev path
>> =
/work/p5020ds_64b-poky-linux/linux-qoriq-sdk-3.0.34-r4/packages-split/kern=
el-dev/usr/src/kernel/tools/perf/.debug/perf
>> ERROR: QA run found fatal errors. Please consider fixing them.
>> ERROR: Function failed: do_package_qa
>> ERROR: Logfile of failure stored in:
>> =
/local/home/mattsm/git/poky/build-denzil/tmp/work/p5020ds_64b-poky-linux/l=
inux-qoriq-sdk-3.0.34-r4/temp/log.do_package.26851
>> NOTE: package linux-qoriq-sdk-3.0.34-r4: task do_package: Failed
>> ERROR: Task 13 =
(/local/home/mattsm/git/poky/build-denzil/../meta-fsl-ppc/recipes-kernel/l=
inux/linux-qoriq-sdk.bb,
>> do_package) failed with exit code '1'
>>=20
>> At first glance, it looks like we should:
>>=20
>> diff --git a/meta/classes/kernel.bbclass =
b/meta/classes/kernel.bbclass
>> index 7ae2a53..511b22b 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -546,4 +546,5 @@ EXPORT_FUNCTIONS do_deploy
>> PACKAGES =3D+ "perf-dbg perf"
>> FILES_perf =3D "${bindir}/* \
>>               ${libexecdir}"
>> -FILES_perf-dbg =3D "${FILES_${PN}-dbg}"
>> +FILES_perf-dbg =3D "${FILES_${PN}-dbg} \
>> +                 ${KERNEL_SRC_PATH}/tools/perf/.debug"
>>=20
>> Thoughts?
>=20
> I suppose that or pull in the patches to separate perf into a separate
> recipe, although that's 13+ patches.

I kept the perf change out on purpose in this patchset :)

> I prefer your solution for the
> stable tree.

Me too. I haven't run into that bug yet, but the fix is valid.



