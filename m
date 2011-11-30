Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RVoPo-0006E3-Bw
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 18:57:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAUHpAN1003251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 09:51:10 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 30 Nov 2011 09:51:09 -0800
Message-ID: <4ED66D0D.5000801@windriver.com>
Date: Wed, 30 Nov 2011 11:51:09 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1322641493-5889-1-git-send-email-koen@dominion.thruhere.net>
	<1322674730.17484.15.camel@ted>
In-Reply-To: <1322674730.17484.15.camel@ted>
Subject: Re: [PATCH] consolekit: package /var/log/Consolekit
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
X-List-Received-Date: Wed, 30 Nov 2011 17:57:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/11 11:38 AM, Richard Purdie wrote:
> On Wed, 2011-11-30 at 09:24 +0100, Koen Kooi wrote:
>> This fixes startup issues like this:
>>
>> 2011-11-30T09:02:10+01:00 beaglebone ck-log-system-start[91]: **
>> (process:91): WARNING **: Couldn't create log
>> file /var/log/ConsoleKit/history (No such file or directory)
>>
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>>   .../recipes-support/consolekit/consolekit_0.4.5.bb |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
>> index 562dfb3..a02203c 100644
>> --- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
>> +++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
>> @@ -2,7 +2,7 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
>>   HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
>>   BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
>>
>> -PR = "r5"
>> +PR = "r6"
>>
>>   LICENSE = "GPLv2+"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>> @@ -23,7 +23,7 @@ EXTRA_OECONF = "--with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
>>                   ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module --with-pam-module-dir=${base_libdir}/security', '--disable-pam-module', d)} \
>>                  "
>>
>> -FILES_${PN} += "${libdir}/ConsoleKit ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
>> +FILES_${PN} += "${localstatedir}/log/ConsoleKit ${libdir}/ConsoleKit ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
>>   FILES_${PN}-dbg += "${base_libdir}/security/.debug"
>>
>>   PACKAGES =+ "pam-plugin-ck-connector"
>
> Looks like this is breaking builds:
>
> | consolekit                  ##################################################
> | error: unpacking of archive failed on file /var/log: cpio: rename failed - Invalid argument

This is a bit of an obscure error, but what it really means is that something 
created a directory called /var/log, while something else created a symlink 
called /var/log.  The directory owner was installed before the symlink owner.. 
so when the symlink was being installed cpio went "huh?!"  (note: the problem 
could be /var... hard to tell)

This is one of the situations that the system wide directory "fixing" in 
packages.bbclass is support to resolve.

--Mark

> :(
>
> http://autobuilder.pokylinux.org:8010/builders/nightly-x86-64/builds/197/steps/shell_30/logs/stdio
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



