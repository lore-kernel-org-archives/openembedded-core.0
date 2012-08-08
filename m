Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1SyzeJ-0006ys-5J
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 08:21:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7869tRp014872
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Aug 2012 23:09:55 -0700 (PDT)
Received: from [128.224.162.182] (128.224.162.182) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 7 Aug 2012 23:09:54 -0700
Message-ID: <502202B0.3060005@windriver.com>
Date: Wed, 8 Aug 2012 14:09:52 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1344341416.git.wenzong.fan@windriver.com>	<38e3b88585fd93495837f9f071887989a080ccd6.1344341416.git.wenzong.fan@windriver.com>
	<4B47D650-7569-4396-825C-92CB04489F87@dominion.thruhere.net>
In-Reply-To: <4B47D650-7569-4396-825C-92CB04489F87@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] sysfsutils: install libs to base_libdir
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
X-List-Received-Date: Wed, 08 Aug 2012 06:21:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2012 08:23 PM, Koen Kooi wrote:
>
> Op 7 aug. 2012, om 14:14 heeft wenzong.fan@windriver.com het volgende geschreven:
>
>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>
>> Fix the warning form pcmciautils building:
>>
>> "WARNING: QA Issue: pcmciautils: /sbin/pccardctl, installed in the
>> base_prefix, requires a shared library under exec_prefix (/usr):
>> libsysfs.so.2 =>  /usr/lib/libsysfs.so.2"
>>
>> Just refer to Debian/Ubuntu distributions, install sysfsutils libs
>> to "/lib*" instead of "/usr/lib*".
>>
>> [YOCTO #2907]
>>
>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>> ---
>> meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb |    4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>> index 3e4fdda..f01d19b 100644
>> --- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>> +++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>> @@ -8,7 +8,7 @@ LICENSE_libsysfs = "LGPLv2.1"
>> LIC_FILES_CHKSUM = "file://COPYING;md5=3d06403ea54c7574a9e581c6478cc393 \
>>                      file://cmd/GPL;md5=d41d4e2e1e108554e0388ea4aecd8d27 \
>>                      file://lib/LGPL;md5=b75d069791103ffe1c0d6435deeff72e"
>> -PR = "r3"
>> +PR = "r4"
>>
>> SRC_URI = "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz \
>> 	  file://sysfsutils-2.0.0-class-dup.patch \
>> @@ -24,3 +24,5 @@ PACKAGES =+ "libsysfs libsysfs-dev libsysfs-staticdev"
>> FILES_libsysfs = "${libdir}/lib*${SOLIBS}"
>> FILES_libsysfs-dev = "${libdir}/lib*${SOLIBSDEV} ${includedir}"
>> FILES_libsysfs-staticdev = "${libdir}/lib*.a"
>
> Ahem! ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>> +
>> +export libdir = "${base_libdir}"
>
> And can you post the buildhistory diff to see if anything else moved when it shouldn't have e.g. package config files?

I make a diff to the build dir, only the location of 'lib/' was moved:
------------------------
Only in sysfsutils-2.1.0-r4.new/image: lib
Only in sysfsutils-2.1.0-r4.old/image/usr: lib
Only in sysfsutils-2.1.0-r4.new/package: lib
Only in sysfsutils-2.1.0-r4.old/package/usr: lib
Only in sysfsutils-2.1.0-r4.new/packages-split/libsysfs: lib
Only in sysfsutils-2.1.0-r4.old/packages-split/libsysfs: usr
Only in sysfsutils-2.1.0-r4.new/packages-split/libsysfs-dev: lib
Only in sysfsutils-2.1.0-r4.old/packages-split/libsysfs-dev/usr: lib
Only in sysfsutils-2.1.0-r4.new/packages-split/libsysfs-staticdev: lib
Only in sysfsutils-2.1.0-r4.old/packages-split/libsysfs-staticdev: usr
Only in sysfsutils-2.1.0-r4.new/packages-split/sysfsutils-dbg: lib
Only in sysfsutils-2.1.0-r4.old/packages-split/sysfsutils-dbg/usr: lib
Only in sysfsutils-2.1.0-r4.new/packages-split/sysfsutils-dev: lib
Only in sysfsutils-2.1.0-r4.old/packages-split/sysfsutils-dev: usr
Only in sysfsutils-2.1.0-r4.new/sysroot-destdir: lib
Only in sysfsutils-2.1.0-r4.old/sysroot-destdir/usr: lib
------------------------

Thanks
Wenzong

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


