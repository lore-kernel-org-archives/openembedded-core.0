Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RM4Yn-0001M0-6Q
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 22:10:53 +0100
Received: from mail-qw0-f52.google.com ([209.85.216.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 03 Nov 2011 14:04:42 -0700
Received: by qaea17 with SMTP id a17so3517355qae.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 14:04:42 -0700 (PDT)
Received: by 10.224.33.76 with SMTP id g12mr5844291qad.46.1320354279293;
	Thu, 03 Nov 2011 14:04:39 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id gg6sm7467950qab.3.2011.11.03.14.04.38
	(version=SSLv3 cipher=OTHER); Thu, 03 Nov 2011 14:04:38 -0700 (PDT)
Message-ID: <4EB301E5.9050809@intel.com>
Date: Thu, 03 Nov 2011 14:04:37 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1320325020-19012-1-git-send-email-koen@dominion.thruhere.net>
	<86762F88-8EB9-47D0-B1F7-A867ADCCFB1C@dominion.thruhere.net>
	<1320331161.20107.56.camel@ted>
In-Reply-To: <1320331161.20107.56.camel@ted>
Subject: Re: [PATCH] avahi: fix useradd race condition
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
X-List-Received-Date: Thu, 03 Nov 2011 21:10:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2011 07:39 AM, Richard Purdie wrote:
> On Thu, 2011-11-03 at 14:04 +0100, Koen Kooi wrote:
>> Op 3 nov. 2011, om 13:57 heeft Koen Kooi het volgende geschreven:
>>
>>> Avahi doesn't work at boot because of:
>>>
>>> + sh /OE/../rootfs/var/lib/opkg/info/avahi-daemon.preinst
>>> Running useradd commands...
>>> grep: /OE/../rootfs/etc/passwd: No such file or directory
>>>
>>> That is due to:
>>>
>>> Package: avahi-daemon
>>> Version: 0.6.30-r9.0
>>> [..]
>>> Depends: libavahi-core7 (>= 0.6.30), libdaemon0 (>= 0.14), libcap2 (>= 2.22), libavahi-common3 (>= 0.6.30), libdbus-1-3 (>= 1.4.12), sysvinit-pidof, libc6 (>= 2.12), libexpat1 (>= 2.0.1)
>>>
>>> After this patch:
>>>
>>> Package: avahi-daemon
>>> Version: 0.6.30-r10.0
>>> [..]
>>> Depends: libavahi-core7 (>= 0.6.30), libdaemon0 (>= 0.14), libcap2 (>= 2.22), libavahi-common3 (>= 0.6.30), libdbus-1-3 (>= 1.4.12), sysvinit-pidof, libc6 (>= 2.12), shadow, libexpat1 (>= 2.0.1), base-passwd
>>>
>>> This also changes ${PN}-daemon to avahi-daemon to be consistent with the PACKAGES/FILES lines below
>>>
>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>> ---
>>> meta/recipes-connectivity/avahi/avahi.inc |    7 ++++---
>>> 1 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
>>> index 79cfd73..728c38f 100644
>>> --- a/meta/recipes-connectivity/avahi/avahi.inc
>>> +++ b/meta/recipes-connectivity/avahi/avahi.inc
>>> @@ -14,7 +14,7 @@ SECTION = "network"
>>> # python scripts are under GPLv2+
>>> LICENSE = "GPLv2+&  LGPLv2.1+"
>>>
>>> -INC_PR = "r9"
>>> +INC_PR = "r10"
>>>
>>> DEPENDS = "expat libcap libdaemon dbus glib-2.0"
>>>
>>> @@ -23,8 +23,9 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
>>>            file://99avahi-autoipd \
>>>            file://initscript.patch"
>>>
>>> -USERADD_PACKAGES = "${PN}-daemon"
>>> -USERADD_PARAM_${PN}-daemon = "--system --home /var/run/avahi-daemon \
>>> +USERADDPN = "avahi-daemon"
>>
>> My gut feeling is that useradd.bbclass should add the RDEPENDS in its
>> pythoncode instead of relying on people to set both USERADD_PACKAGES
>> and USERADDPN to the same value.
>
> Agreed, looking at the code I think we can make this easier on the user.
> I'll take the fix to solve the short term issues but we could do with
> improving this.

I've filed a bug and will work on a fix for this:

http://bugzilla.pokylinux.org/show_bug.cgi?id=1727

Thank you for uncovering the source of the problem.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


