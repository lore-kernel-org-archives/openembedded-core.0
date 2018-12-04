Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7DCD36BE0C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 01:57:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wB41vA2G007145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Dec 2018 17:57:11 -0800 (PST)
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 3 Dec 2018 17:57:10 -0800
To: "Burton, Ross" <ross.burton@intel.com>, =?UTF-8?Q?Andr=c3=a9_Draszik?=
	<git@andred.net>
References: <20181203152815.6623-1-git@andred.net>
	<CAJTo0LYwiZ57t7zZBSYO51Tn2AwObKYJ6xqBExDCKr7LLssdqg@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <17942ed5-f221-9a69-62f8-828a44e097a9@windriver.com>
Date: Tue, 4 Dec 2018 10:04:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYwiZ57t7zZBSYO51Tn2AwObKYJ6xqBExDCKr7LLssdqg@mail.gmail.com>
X-Originating-IP: [128.224.163.141]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: split out blkdiscard into its own package
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
X-List-Received-Date: Tue, 04 Dec 2018 01:57:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

I think this is a good idea. I opened a new bug in bugzilla to track it, 
and assigned it to myself.
Ross, please check the bug description to see if that's what you want.
Andre, if you want to work on it, take the bug and let me know.

Best Regards,
Chen Qi

On 12/04/2018 12:40 AM, Burton, Ross wrote:
> When do we just programatically split instead of doing it piece by piece? :)
>
> Ross
> On Mon, 3 Dec 2018 at 15:28, André Draszik <git@andred.net> wrote:
>> From: André Draszik <andre.draszik@jci.com>
>>
>> For systems that don't otherwise depend on the full
>> util-linux package, blkdiscard is a mere 18k (on
>> cortexa7t2hf-neon).
>>
>> Signed-off-by: André Draszik <andre.draszik@jci.com>
>> ---
>>   meta/recipes-core/util-linux/util-linux.inc | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
>> index a05c1cabbe..b5f77f7b6b 100644
>> --- a/meta/recipes-core/util-linux/util-linux.inc
>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>> @@ -27,7 +27,7 @@ DEPENDS_append_class-nativesdk = " lzo-native"
>>   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
>>              "
>>
>> -PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
>> +PACKAGES =+ "util-linux-agetty util-linux-blkdiscard util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
>>                util-linux-swaponoff util-linux-losetup util-linux-umount \
>>                util-linux-mount util-linux-readprofile util-linux-uuidd \
>>                util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs util-linux-fsck \
>> @@ -74,6 +74,7 @@ FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
>>   FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
>>
>>   FILES_util-linux-agetty = "${base_sbindir}/agetty"
>> +FILES_util-linux-blkdiscard = "${sbindir}/blkdiscard"
>>   FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${BPN}"
>>   FILES_util-linux-fstrim = "${base_sbindir}/fstrim.${BPN}"
>>   FILES_util-linux-cfdisk = "${base_sbindir}/cfdisk"
>> @@ -126,7 +127,7 @@ RDEPENDS_util-linux-su += "libpam"
>>   RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
>>   RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
>>
>> -RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit util-linux-ionice util-linux-switch-root"
>> +RRECOMMENDS_${PN} = "util-linux-blkdiscard util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit util-linux-ionice util-linux-switch-root"
>>
>>   RRECOMMENDS_${PN}_class-native = ""
>>   RRECOMMENDS_${PN}_class-nativesdk = ""
>> --
>> 2.20.0.rc1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



