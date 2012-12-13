Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Tj1s5-0003ex-O6
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 07:02:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBD5lbaJ022413
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Dec 2012 21:47:37 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 12 Dec 2012 21:47:36 -0800
Message-ID: <50C96C02.1060400@windriver.com>
Date: Thu, 13 Dec 2012 13:47:46 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <cover.1355236839.git.constantinx.musca@intel.com>
	<5078335c2652b28a2613b3395cd95665675c1626.1355236839.git.constantinx.musca@intel.com>
	<50C7E6CB.50002@windriver.com> <50C8389C.9050105@intel.com>
In-Reply-To: <50C8389C.9050105@intel.com>
X-Originating-IP: [128.224.163.154]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] alsa-utils: Pass udev-rules-dir as parameter
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
X-List-Received-Date: Thu, 13 Dec 2012 06:02:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2012 03:56 PM, Constantin Musca wrote:
> On 12/12/2012 04:07 AM, ChenQi wrote:
>> On 12/11/2012 11:29 PM, Constantin Musca wrote:
>>> Fix the following warning:
>>> WARNING: QA Issue: alsa-utils: Files/directories were installed but 
>>> not shipped
>>>    /lib
>>>    /lib/udev
>>>    /lib/udev/rules.d
>>>    /lib/udev/rules.d/90-alsa-restore.rules
>>>
>>> [YOCTO #3440]
>>>
>>> Signed-off-by: Constantin Musca<constantinx.musca@intel.com>
>>> ---
>>>   meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb 
>>> b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
>>> index 597e8b6..8f28a48 100644
>>> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
>>> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
>>> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
>>>   LIC_FILES_CHKSUM = 
>>> "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>>> file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9" 
>>>
>>>   DEPENDS = "alsa-lib ncurses libsamplerate0"
>>> -PR = "r2"
>>> +PR = "r3"
>>>
>>>   SRC_URI = 
>>> "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
>>>              file://ncursesfix.patch \
>>> @@ -21,7 +21,7 @@ SRC_URI[sha256sum] = 
>>> "2e676a2f634bbfe279b260e10a96f617cb72ee63c5bbf6c5f96bb61570
>>>   # http://bugs.openembedded.org/show_bug.cgi?id=2348
>>>   # please close bug and remove this comment when properly fixed
>>>   #
>>> -EXTRA_OECONF = "--disable-xmlto"
>>> +EXTRA_OECONF = "--disable-xmlto 
>>> --with-udev-rules-dir=${base_libdir}/udev/rules.d"
>>>   EXTRA_OECONF_append_libc-uclibc = " --disable-nls"
>>>
>>>   inherit autotools gettext
>> Hi Musca,
>> Another bug is related to the udev rules directory. It's similar to 
>> this one.
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2804
>> (You could also use 'udev' to filter the message in oe-core list to 
>> see the previous discussions on this topic.)
>> It seems alsa-utils does not seem to be the only package that 
>> hardcodes its udev-rules-dir.
>> Besides, udev cannot start properly if installed under /lib64.
>>
>> #!/bin/sh
>>
>> ### BEGIN INIT INFO
>> # Provides:          udev
>> # Required-Start:    mountvirtfs
>> # Required-Stop:
>> # Default-Start:     S
>> # Default-Stop:
>> # Short-Description: Start udevd, populate /dev and load drivers.
>> ### END INIT INFO
>>
>> export TZ=/etc/localtime
>>
>> [ -d /sys/class ] || exit 1
>> [ -r /proc/mounts ] || exit 1
>> [ -x /lib/udev/udevd ] || exit 1
>> [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
>> [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
>>
>> The question here is:
>> Whether we should always install udev under /lib or patch all 
>> packages that hardcodes udev-rules-dir to be under '/lib'. Maybe 
>> there are other better approaches?
>>
>> Please have a look at these and let me know your opinions.
>>
>> Thanks a lot,
>> Chen Qi
>
> I think the best solution is to patch all packages that hardcode the 
> udev-rules-dir path to use ${base_libdir}/udev/rules.d (this is the 
> standard path). udev doesn't start properly if installed under /lib64 
> because the init script hardcodes the udevd path (/lib/udev/udevd). If 
> everybody is ok with this, I will send another patch for pcmciautils 
> which sets udevdir to ${base_libdir}/udev/.
>
>
> Cheers,
> Constantin
>
>

Hi Richard,
Could you please have a look at this?

You gave me some suggestions on a similar problem before (mdadm 
udev-rules-dir problem, bug#2804).
As the same problem is encountered in other packages, I have to ask:
Are we going to take the approach of fixing every package that hardcodes 
udev-rules-dir, as suggested by Constantin?

Thanks,
Chen Qi


