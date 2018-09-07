Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 863B97978A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 01:23:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w871NJoe003804
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 18:23:19 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 6 Sep 2018 18:23:19 -0700
To: <richard.purdie@linuxfoundation.org>
References: <cover.1536248856.git.kai.kang@windriver.com>
	<daa5eda99a0a87cd55e79dd68d7aca71c2cde746.1536248856.git.kai.kang@windriver.com>
	<3f4638c2cbe530b8da9954ea68ae4304c78ee18d.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <cb065f00-0242-b503-a78f-989f6130c13d@windriver.com>
Date: Fri, 7 Sep 2018 09:22:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3f4638c2cbe530b8da9954ea68ae4304c78ee18d.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] multilib: fix install file conflicts
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
X-List-Received-Date: Fri, 07 Sep 2018 01:23:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月07日 06:31, richard.purdie@linuxfoundation.org wrote:
> On Thu, 2018-09-06 at 23:52 +0800, kai.kang@windriver.com wrote:
>> diff --git a/meta/recipes-core/udev/eudev_3.2.5.bb b/meta/recipes-
>> core/udev/eudev_3.2.5.bb
>> index 75617c8d4e..75130f03ef 100644
>> --- a/meta/recipes-core/udev/eudev_3.2.5.bb
>> +++ b/meta/recipes-core/udev/eudev_3.2.5.bb
>> @@ -23,7 +23,9 @@ SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/$
>> {BP}.tar.gz \
>>   SRC_URI[md5sum] = "6ca08c0e14380f87df8e8aceac123671"
>>   SRC_URI[sha256sum] =
>> "49c2d04105cad2526302627e040fa24b1916a9a3e059539bc8bb919b973890af"
>>   
>> -inherit autotools update-rc.d qemu pkgconfig distro_features_check
>> +inherit autotools update-rc.d qemu pkgconfig distro_features_check
>> multilib_script
>> +
>> +MULTILIB_SCRIPTS = "${PN}-dev:${datadir}/pkgconfig/udev.pc"
>>   
>>   CONFLICT_DISTRO_FEATURES = "systemd"
>>   
>> @@ -65,7 +67,7 @@ PACKAGES =+ "eudev-hwdb"
>>   
>>   
>>   FILES_${PN} += "${libexecdir} ${base_libdir}/udev ${bindir}/udevadm"
>> -FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
>> +FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc* \
>>                      ${includedir}/libudev.h ${libdir}/libudev.so \
>>                      ${includedir}/udev.h ${libdir}/libudev.la \
>>                      ${libdir}/libudev.a
>> ${libdir}/pkgconfig/libudev.pc"
> I already commented on this, the file should be installed into libdir
> if its arch specific. I suspect libudev.pc is, udev.pc is not and
> udev.pc needs to stop referencing libdir.

Sorry, I thought no good way to deal ${libdir} in .pc files. I'll fix it.

Regards,
Kai


>   
>
> Regardless, we're not using MULTILIB_SCRIPTS for .pc files.
>
> Cheers,
>
> Richard
>

-- 
Regards,
Neil | Kai Kang


