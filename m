Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RJ5Q1-00033s-R3
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 17:29:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9QFNT1T023535
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 08:23:29 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 26 Oct 2011 08:23:28 -0700
Message-ID: <4EA825F0.1030504@windriver.com>
Date: Wed, 26 Oct 2011 10:23:28 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <840A81C1B782724A8EB52725BD519EFF1A8F25@MBX20.4emm.local>
	<840A81C1B782724A8EB52725BD519EFF1A8F4E@MBX20.4emm.local>
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF1A8F4E@MBX20.4emm.local>
Subject: Re: useradd changes to dbus, base-passwd
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
X-List-Received-Date: Wed, 26 Oct 2011 15:29:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 10/25/11 10:37 PM, James Limbouris wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> James Limbouris
>> Sent: Wednesday, 26 October 2011 9:35 AM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] useradd changes to dbus, base-passwd
>>
>> Hi,
>>
>> Recent changes to dbus have broken some sdk building:
>>
>> Missing or unbuildable dependency chain was: ['meta-toolchain-qte', 'task-qte-
>> toolchain-host-nativesdk', 'qt4-tools-nativesdk', 'dbus-nativesdk', 'base-passwd-
>> nativesdk']
>>
>> I think the commit introducing the base-passed dependency is
>> 46e6c3fa8034b12d178d605f3f5d7efe69671a13 (dbus: use useradd class to
>> allow use in read-only filesystems).
>> I'm not too clear on how useradd works, so I can't tell if simply adding
>> BBCLASSEXTEND = "native nativesdk" to base-passwd is sufficient. I'd expect
>> that this would cause dbus to add itself to the sdk sysroot's passwd (which
>> previously didn't exist?). Seems harmless enough... I'm giving it a try now, but
>> any advice or opinions would be appreciated.
> 
> It seems that adding BBCLASSEXTEND = "native nativesdk" to base-passwd and shadow-sysroot is not sufficient.
> dbus itself will not build for nativesdk:
> 

...

> NOTE: package dbus-nativesdk-1.4.12-r1: task do_install: Failed
> ERROR: Task 1370 (virtual:nativesdk:/home/james/oe/sources/oe-core/meta/recipes-core/dbus/dbus_1.4.12.bb, do_install) failed with exit code '1'
> 
> Perhaps we should not inherit useradd when building for nativesdk? After all, the sdk sysroots have not had /etc/passwd in the past.

The useradd class should only be used in a target build.  Neither nativesdk or
native have a reasonable set of actions with useradd.

I am a bit confused as to why we are building dbus in a nativesdk situation.  I
would have thought that we'd be forced to use the host system's version of dbus
for compatibility sake.  Perhaps this is the root of the problem -- or I'm
mistaken and we do need to build it -- in that case we need to avoid including
useradd with non-target builds.

--Mark

> James
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



