Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 72B6A6B31D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 09:01:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6Q91Nso011190
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 02:01:23 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 26 Jul 2013 02:01:23 -0700
Message-ID: <51F23ADF.904@windriver.com>
Date: Fri, 26 Jul 2013 17:01:19 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1374763888-7315-1-git-send-email-koen@dominion.thruhere.net>
	<21EAF1A7-D7BE-4275-9998-C42694B18C43@dominion.thruhere.net>
In-Reply-To: <21EAF1A7-D7BE-4275-9998-C42694B18C43@dominion.thruhere.net>
Subject: Re: [PATCH] util-linux: fix PACKAGECONFIG options
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
X-List-Received-Date: Fri, 26 Jul 2013 09:01:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2013 03:01 PM, Koen Kooi wrote:
> Op 25 jul. 2013, om 16:51 heeft Koen Kooi <koen@dominion.thruhere.net> het volgende geschreven:
>
>> The ??= operator is too weak and it's setting a non-existent PACKAGECONFIG option ('libpam' instead of 'pam').
>>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-core/util-linux/util-linux.inc | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
>> index d373cec..3d1198a 100644
>> --- a/meta/recipes-core/util-linux/util-linux.inc
>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>> @@ -47,9 +47,9 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
>>                  --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
>> 		usrsbin_execdir='${sbindir}' \
>> "
>> -PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
>> +PACKAGECONFIG_class-target ?= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>>                                  ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} "
>> -PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, pam,"
>> +PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
>>
>> # Respect the systemd feature for uuidd
>> PACKAGECONFIG[systemd] = "--enable-socket-activation --with-systemdsystemunitdir=${systemd_unitdir}/system/, --disable-socket-activation --without-systemdsystemunitdir"
> And of course this will trigger another bug:
>
> |  * check_data_file_clashes: Package util-linux wants to install file /build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/work/beaglebone-angstrom-linux-gnueabi/cloud9-image/1.0-r0/rootfs/usr/bin/su
> |       But that file is already provided by package  * shadow
Hi Koen,

I am working on this issue and the patch will be sent later.

Thanks,
Hongxu
>
> *sigh*
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


