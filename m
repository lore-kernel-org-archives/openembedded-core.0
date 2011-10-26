Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RJ6qB-0006xa-1I
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 19:00:35 +0200
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2011 09:53:26 -0700
Received: by wwe6 with SMTP id 6so1963936wwe.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 09:53:25 -0700 (PDT)
Received: by 10.216.24.13 with SMTP id w13mr1226889wew.84.1319648004882;
	Wed, 26 Oct 2011 09:53:24 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id fr4sm4230832wbb.0.2011.10.26.09.53.22
	(version=SSLv3 cipher=OTHER); Wed, 26 Oct 2011 09:53:23 -0700 (PDT)
Message-ID: <4EA83ACB.4040001@intel.com>
Date: Wed, 26 Oct 2011 09:52:27 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <840A81C1B782724A8EB52725BD519EFF1A8F25@MBX20.4emm.local>
	<840A81C1B782724A8EB52725BD519EFF1A8F4E@MBX20.4emm.local>
	<4EA825F0.1030504@windriver.com>
In-Reply-To: <4EA825F0.1030504@windriver.com>
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
X-List-Received-Date: Wed, 26 Oct 2011 17:00:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/2011 08:23 AM, Mark Hatle wrote:
> On 10/25/11 10:37 PM, James Limbouris wrote:
>>> -----Original Message-----
>>> From: openembedded-core-bounces@lists.openembedded.org
>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>>> James Limbouris
>>> Sent: Wednesday, 26 October 2011 9:35 AM
>>> To: openembedded-core@lists.openembedded.org
>>> Subject: [OE-core] useradd changes to dbus, base-passwd
>>>
>>> Hi,
>>>
>>> Recent changes to dbus have broken some sdk building:
>>>
>>> Missing or unbuildable dependency chain was: ['meta-toolchain-qte', 'task-qte-
>>> toolchain-host-nativesdk', 'qt4-tools-nativesdk', 'dbus-nativesdk', 'base-passwd-
>>> nativesdk']
>>>
>>> I think the commit introducing the base-passed dependency is
>>> 46e6c3fa8034b12d178d605f3f5d7efe69671a13 (dbus: use useradd class to
>>> allow use in read-only filesystems).
>>> I'm not too clear on how useradd works, so I can't tell if simply adding
>>> BBCLASSEXTEND = "native nativesdk" to base-passwd is sufficient. I'd expect
>>> that this would cause dbus to add itself to the sdk sysroot's passwd (which
>>> previously didn't exist?). Seems harmless enough... I'm giving it a try now, but
>>> any advice or opinions would be appreciated.
>>
>> It seems that adding BBCLASSEXTEND = "native nativesdk" to base-passwd and shadow-sysroot is not sufficient.
>> dbus itself will not build for nativesdk:
>>
>
> ...
>
>> NOTE: package dbus-nativesdk-1.4.12-r1: task do_install: Failed
>> ERROR: Task 1370 (virtual:nativesdk:/home/james/oe/sources/oe-core/meta/recipes-core/dbus/dbus_1.4.12.bb, do_install) failed with exit code '1'
>>
>> Perhaps we should not inherit useradd when building for nativesdk? After all, the sdk sysroots have not had /etc/passwd in the past.
>
> The useradd class should only be used in a target build.  Neither nativesdk or
> native have a reasonable set of actions with useradd.
>
> I am a bit confused as to why we are building dbus in a nativesdk situation.  I
> would have thought that we'd be forced to use the host system's version of dbus
> for compatibility sake.  Perhaps this is the root of the problem -- or I'm
> mistaken and we do need to build it -- in that case we need to avoid including
> useradd with non-target builds.

Grepping through our classes, it looks like I can detect the nativesdk 
within useradd.bbclass by checking for 
bb.data.inherits_class('nativesdk', d).

I've filed a bug for this and will develop a patch to ensure useradd is 
becomes a no-op for nativesdk builds:

http://bugzilla.pokylinux.org/show_bug.cgi?id=1702

Thanks for reporting this!

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


