Return-Path: <nitin.a.kamble@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id F2806610F5
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 04:33:25 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Aug 2014 21:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,802,1400050800"; d="scan'208";a="464993862"
Received: from snehamur-mobl1.amr.corp.intel.com (HELO [10.254.185.76])
	([10.254.185.76])
	by azsmga001.ch.intel.com with ESMTP; 04 Aug 2014 21:33:24 -0700
Message-ID: <53E05E94.2050802@intel.com>
Date: Mon, 04 Aug 2014 21:33:24 -0700
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Organization: Intel Corp
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Hart, Darren" <darren.hart@intel.com>, 
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>, 
	"Burton, Ross" <ross.burton@intel.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
References: <cover.1406658528.git.nitin.a.kamble@intel.com>
	<b60eac03f169389484bcc40fdfc3e4e12cb7934b.1406658528.git.nitin.a.kamble@intel.com>
	<D005011E.9F32A%darren.hart@intel.com>
In-Reply-To: <D005011E.9F32A%darren.hart@intel.com>
Subject: Re: [PATCH 1/1] INITRD var: make it a list of filesystem images
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
X-List-Received-Date: Tue, 05 Aug 2014 04:33:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 8/4/2014 9:38 AM, Hart, Darren wrote:
> On 7/29/14, 11:34, "Kamble, Nitin A" <nitin.a.kamble@intel.com> wrote:
>
>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> Hi Nitin,
>
> Generally speaking this looks like a good improvement. I don't have any
> major technical concerns, but we do need to address some grammatical
> issues in the commit and the docs below to make sure people can follow the
> intent here.
Thanks Darren for the detailed review. With such review the quality of 
my writtings
will definitely improve.

>
>> The initrd image used by the Linux kernel is list of file system images
>> concatenated together and presented as a single initrd file at boot time.
>>
>> So far the initrd is a single filesystem image. But in cases like to
>> support
>> early microcode loading, the initrd image need to have multiple filesystem
>> images concatenated together.
> Consider:
>
> Currently, the INITRD variable is a single filesystem image. For optional
> early boot features, such as microcode loading, a modular approach would
> provide the most flexibility and is minimally invasive. Converting INITRD
> to a list of images to be concatenated accomplishes this.
>> This commit is extending the INITRD variable from a single filesystem
>> image
>> to a list of filesystem images to satisfy the need mentioned above.
> Can now drop this paragraph.
I am fine with your wording. I would add further, that the Linux kernel 
can already handle
initrd images which have multiple filesystem images concatenated together.

>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>> ---
>> documentation/ref-manual/ref-classes.xml   |  4 ++--
>> documentation/ref-manual/ref-variables.xml |  2 +-
>> meta/classes/boot-directdisk.bbclass       | 13 ++++++++++---
>> meta/classes/bootimg.bbclass               | 27
>> ++++++++++++++++++++++-----
>> meta/classes/grub-efi.bbclass              |  2 +-
>> meta/classes/syslinux.bbclass              |  2 +-
>> meta/conf/documentation.conf               |  2 +-
>> 7 files changed, 38 insertions(+), 14 deletions(-)
>>
>> diff --git a/documentation/ref-manual/ref-classes.xml
>> b/documentation/ref-manual/ref-classes.xml
>> index e7e9942..0bf3546 100644
>> --- a/documentation/ref-manual/ref-classes.xml
>> +++ b/documentation/ref-manual/ref-classes.xml
>> @@ -881,7 +881,7 @@
>>          <itemizedlist>
>>              <listitem><para>
>>                  <link
>> linkend='var-INITRD'><filename>INITRD</filename></link>:
>> -                Indicates a filesystem image to use as an initrd
>> (optional).
>> +                Indicates list of filesystem images to concatenate and
>> use as an initrd (optional).
>
> Missing article:            ^ a
I hope I do not do these kind of article mistakes again.

>
>>                  </para></listitem>
>>              <listitem><para>
>>                  <link
>> linkend='var-ROOTFS'><filename>ROOTFS</filename></link>:
>> @@ -2864,7 +2864,7 @@
>>          The class supports the following variables:
>>          <itemizedlist>
>>              <listitem><para><emphasis><link
>> linkend='var-INITRD'><filename>INITRD</filename></link>:</emphasis>
>> -                Indicates a filesystem image to use as an initial RAM
>> disk
>> +                Indicates list of filesystem images to concatenate and
>> use as an initial RAM disk
> Missing article:             ^ a
>
>>                  (initrd).
>>                  This variable is optional.</para></listitem>
>>              <listitem><para><emphasis><link
>> linkend='var-ROOTFS'><filename>ROOTFS</filename></link>:</emphasis>
>> diff --git a/documentation/ref-manual/ref-variables.xml
>> b/documentation/ref-manual/ref-variables.xml
>> index b4d6e71..16e3ed6 100644
>> --- a/documentation/ref-manual/ref-variables.xml
>> +++ b/documentation/ref-manual/ref-variables.xml
>> @@ -4020,7 +4020,7 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR =
>> "${INC_PR}.3"
>>          <glossentry id='var-INITRD'><glossterm>INITRD</glossterm>
>>              <glossdef>
>>                  <para>
>> -                    Indicates a filesystem image to use as an initial RAM
>> +                    Indicates list of filesystem images to concatenate
>> and use as an initial RAM
> ditto
>
>>                      disk (<filename>initrd</filename>).
>>                  </para>
>>
>> diff --git a/meta/classes/boot-directdisk.bbclass
>> b/meta/classes/boot-directdisk.bbclass
>> index 0da9932..995d3e7 100644
>> --- a/meta/classes/boot-directdisk.bbclass
>> +++ b/meta/classes/boot-directdisk.bbclass
>> @@ -71,10 +71,17 @@ boot_direct_populate() {
>> 	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to
>> use.
>> 	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage $dest/vmlinuz
>>
>> -	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
>> -		install -m 0644 ${INITRD} $dest/initrd
>> +	# initrd is made of concatenation of multiple filesystem images
> # Assemble the initrd from the list of filesystem images
>
>> +	if [ -n "${INITRD}" ]; then
>> +		rm -f $dest/initrd
>> +		for fs in ${INITRD}
>> +		do
>> +			if [ -n "${fs}" ] && [ -s "${fs}" ]; then
>
> The -n test is unnecessary here. How would "for fs in ${INITRD}" result in
> an fs of "" ?
The -n test is needed here, it checks whether the file exist or not.

>
>> +				cat ${fs} >> $dest/ignited
>> +			fi
> Some kind of a warning at least is warranted if a file appears in the
> INITRD list but is either 0-size or non-existent.

I tried to keep the original style of the code. But it makes sense to 
add a warning  or even an error here.

>> +		done
>> +		chmod 0644 $dest/initrd
>> 	fi
>> -
>> }
>>
>> build_boot_dd() {
>> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
>> index d52aace..7b3ce65 100644
>> --- a/meta/classes/bootimg.bbclass
>> +++ b/meta/classes/bootimg.bbclass
>> @@ -18,7 +18,7 @@
>> # an hdd)
>>
>> # External variables (also used by syslinux.bbclass)
>> -# ${INITRD} - indicates a filesystem image to use as an initrd (optional)
>> +# ${INITRD} - indicates a list of filesystem images to concatenate and
>> use as an initrd (optional)
>> # ${COMPRESSISO} - Transparent compress ISO, reduce size ~40% if set to 1
>> # ${NOISO}  - skip building the ISO image if set to 1
>> # ${NOHDD}  - skip building the HDD image if set to 1
>> @@ -67,9 +67,17 @@ populate() {
>>
>> 	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to
>> use.
>> 	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage ${DEST}/vmlinuz
>> -
>> -	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
>> -		install -m 0644 ${INITRD} ${DEST}/initrd
>> +	
>> +	# initrd is made of concatenation of multiple filesystem images
>> +	if [ -n "${INITRD}" ]; then
>> +		rm -f ${DEST}/initrd
>> +		for fs in ${INITRD}
>> +		do
>> +			if [ -s "${fs}" ]; then
>> +				cat ${fs} >> ${DEST}/initrd
>> +			fi
>> +		done
> Same test commentary here.
>
>> +		chmod 0644 ${DEST}/initrd
>> 	fi
>>
>> 	if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then
>> @@ -80,10 +88,19 @@ populate() {
>>
>> build_iso() {
>> 	# Only create an ISO if we have an INITRD and NOISO was not set
>> -	if [ -z "${INITRD}" ] || [ ! -s "${INITRD}" ] || [ "${NOISO}" = "1" ];
>> then
>> +	if [ -z "${INITRD}" ] || [ "${NOISO}" = "1" ]; then
>> 		bbnote "ISO image will not be created."
>> 		return
>> 	Fi
> Perhaps the -s test should be replaced with a -s of $dest/initrd?
The -s test is replaced by the loop few lines below.
>> +	# ${INITRD} is a list of multiple filesystem images
>> +	for fs in ${INITRD}
>> +	do
>> +		if [ ! -s "${fs}" ]; then
>> +			bbnote "ISO image will not be created. ${fs} is invalid."
>> +			return
>> +		fi
>> +	done
> This additional loop could be eliminated by including this test above.
> Right? Or am I missing something subtle here?
That approach will leave a hole where, the function will continue when 
one of the filesystem image is invalid.
So the loop is better here as it does not leave any hole.
>> +
>>
>> 	populate ${ISODIR}
>>
>> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
>> index 505d032..47bd35e 100644
>> --- a/meta/classes/grub-efi.bbclass
>> +++ b/meta/classes/grub-efi.bbclass
>> @@ -7,7 +7,7 @@
>> # Provide grub-efi specific functions for building bootable images.
>>
>> # External variables
>> -# ${INITRD} - indicates a filesystem image to use as an initrd (optional)
>> +# ${INITRD} - indicates a list of filesystem images to concatenate and
>> use as an initrd (optional)
> Used the "a" here, good :-)
That was not a typo :)

>> # ${ROOTFS} - indicates a filesystem image to include as the root
>> filesystem (optional)
>> # ${GRUB_GFXSERIAL} - set this to 1 to have graphics and serial in the
>> boot menu
>> # ${LABELS} - a list of targets for the automatic config
>> diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
>> index b9701bf..d6498d9 100644
>> --- a/meta/classes/syslinux.bbclass
>> +++ b/meta/classes/syslinux.bbclass
>> @@ -5,7 +5,7 @@
>> # Provide syslinux specific functions for building bootable images.
>>
>> # External variables
>> -# ${INITRD} - indicates a filesystem image to use as an initrd (optional)
>> +# ${INITRD} - indicates a list of filesystem images to concatenate and
>> use as an initrd (optional)
>> # ${ROOTFS} - indicates a filesystem image to include as the root
>> filesystem (optional)
>> # ${AUTO_SYSLINUXMENU} - set this to 1 to enable creating an automatic
>> menu
>> # ${LABELS} - a list of targets for the automatic config
>> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
>> index 7fa3f31..31fbd6c 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -225,7 +225,7 @@ INHIBIT_PACKAGE_STRIP[doc] = "If set to "1", causes
>> the build to not strip binar
>> INHERIT[doc] = "Causes the named class to be inherited at this point
>> during parsing. The variable is only valid in configuration files."
>> INHERIT_DISTRO[doc] = "Lists classes that will be inherited at the
>> distribution level. It is unlikely that you want to edit this variable."
>> INITRAMFS_FSTYPES[doc] = "Defines the format for the output image of an
>> initial RAM disk (initramfs), which is used during boot."
>> -INITRD[doc] = "Indicates a filesystem image to use as an initial RAM
>> disk (initrd)."
>> +INITRD[doc] = "Indicates list of filesystem images to concatenate and
>> use as an initial RAM disk (initrd)."
> "a list"
>
>> INITSCRIPT_NAME[doc] = "The filename of the initialization script as
>> installed to ${sysconfdir}/init.d."
>> INITSCRIPT_PACKAGES[doc] = "A list of the packages that contain
>> initscripts. This variable is used in recipes when using
>> update-rc.d.bbclass. The variable is optional and defaults to the PN
>> variable."
>> INITSCRIPT_PARAMS[doc] = "Specifies the options to pass to update-rc.d.
>> The variable is mandatory and is used in recipes when using
>> update-rc.d.bbclass."
>> -- 
>> 1.8.1.4
>>
>>
> Thanks,
>
Thanks Darren for the review. I think I can improve myself with it.

Nitin


