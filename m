Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UJ5f3-0005eN-9D
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 18:21:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2MH4rW9027690
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:04:53 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 22 Mar 2013 10:04:53 -0700
Message-ID: <514C8F34.7060503@windriver.com>
Date: Fri, 22 Mar 2013 12:04:52 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1363831511-800-1-git-send-email-zhenhua.luo@freescale.com>
	<1363969789.3097.16.camel@ted>
In-Reply-To: <1363969789.3097.16.camel@ted>
Subject: Re: [oe-core v2] rpm: split out run-postinsts
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
X-List-Received-Date: Fri, 22 Mar 2013 17:21:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/22/13 11:29 AM, Richard Purdie wrote:
> On Thu, 2013-03-21 at 10:05 +0800, Zhenhua Luo wrote:
>> Split out run-postinsts script into separated package, sometimes only the postinsts script is required to run all postinsts scripts in /etc/rpm-postinsts/ instead of the whole rpm package.
>>
>> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
>> ---
>>   meta/recipes-devtools/rpm/rpm_5.4.9.bb |    8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> index 6286771..cfdc390 100644
>> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> @@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
>>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>>
>>   DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
>> -PR = "r61"
>> +PR = "r62"
>>
>>   # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
>>   # in order to extract the distribution SRPM into a format we can extract...
>> @@ -199,7 +199,7 @@ CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
>>
>>   LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
>>
>> -PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
>> +PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale ${PN}-postinsts"
>>
>>   SOLIBS = "5.4.so"
>>
>> @@ -223,9 +223,11 @@ FILES_${PN} =  "${bindir}/rpm \
>>   		${libdir}/rpm/bin/wget \
>>   		/var/lib/rpm \
>>   		/var/cache/rpm \
>> -		${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
>>   		"
>>
>> +FILES_${PN}-postinsts = "${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
>> +                "
>> +
>>   FILES_${PN}-dbg += "${libdir}/rpm/.debug \
>>   		${libdir}/rpm/bin/.debug \
>>   		"
>
> Don't we need to depend on this package somewhere so that it gets
> installed?

I think it should be required from the rootfs_rpm.bbclass in some way.

--Mark

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



