Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 470A9607A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 06:37:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0F6bmC2001587
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 14 Jan 2016 22:37:49 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 22:37:47 -0800
To: Mike Looijmans <mike.looijmans@topic.nl>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1452824908.git.liezhi.yang@windriver.com>
	<06cd5b4b25da645fae5767a44b2e5d63550cdb52.1452824908.git.liezhi.yang@windriver.com>
	<56989142.2050800@topic.nl>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <569893BA.80608@windriver.com>
Date: Fri, 15 Jan 2016 14:37:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <56989142.2050800@topic.nl>
Subject: Re: [PATCH 1/8] bitbake.conf: set CONFFILES by default
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
X-List-Received-Date: Fri, 15 Jan 2016 06:37:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/15/2016 02:27 PM, Mike Looijmans wrote:
> How about /etc/init.d and /etc/rcS.d? Are these now suddenly CONFFILES too?

For /etc/init.d/*, yes, and I think that they should be CONFFILES.

For /etc/rcS.d/*, they are symlinks which are not owned by pkg,
but created by update-rc.d.

// Robert

>
> On 15-01-16 03:29, Robert Yang wrote:
>> There are a lot of binary packages have files in /etc/, but only a few
>> of them have set CONFFILES, more than 180 packages are not set in a
>> world build.  So treat all the files in /etc/ as CONFFILES as Debian
>> does:
>> - All the files in /etc/ are CONFFILES
>> - Move the file out of /etc/ if it is not a conffile
>> - If /etc/foo can't be moved out, and is changed during
>>    runtime, then create a symlink /etc/foo -> /var/foo
>>
>> [YOCTO #8436]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/conf/bitbake.conf |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 2fe6b24..f0e4b3a 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -271,6 +271,7 @@ PACKAGE_BEFORE_PN ?= ""
>>   PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale
>> ${PACKAGE_BEFORE_PN} ${PN}"
>>   PACKAGES_DYNAMIC = "^${PN}-locale-.*"
>>   FILES = ""
>> +CONFFILES = "${sysconfdir}/*"
>>
>>   FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/*
>> ${libdir}/lib*${SOLIBS} \
>>               ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>>
>
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Embedded Products
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>
>
>
>

