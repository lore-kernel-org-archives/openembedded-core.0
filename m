Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UBTsu-0004aP-Re
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 18:36:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r21HKGAr027522
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Mar 2013 09:20:16 -0800 (PST)
Received: from msp-dhcp50.wrs.com (172.25.34.50) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Fri, 1 Mar 2013 09:20:16 -0800
Message-ID: <5130E34F.1060000@windriver.com>
Date: Fri, 1 Mar 2013 11:20:15 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130216 Thunderbird/17.0.3
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <3796.1362104349@schlepp.honig.net> <20130301092051.GG3279@jama>
	<2354.1362158028@schlepp.honig.net>
In-Reply-To: <2354.1362158028@schlepp.honig.net>
Subject: Re: [oe] [PATCH]: Resolve sysvinit and util-linux conflicting man pages.
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
X-List-Received-Date: Fri, 01 Mar 2013 17:36:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/1/13 11:13 AM, Jeffrey Honig wrote:
> Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> On Thu, Feb 28, 2013 at 09:19:09PM -0500, Jeffrey Honig wrote:
>>> From: Jeffrey C Honig <jeffrey.honig@windriver.com>
>>>
>>> [ CQID: WIND00404316 ]
>>>
>>> Use alternatives mechanism to prevent sysvlinux and util-linux
>>> man pages from causing conflicts.
>>
>> It would be better to set higher then default priority in one of them,
>> otherwise last installed/upgraded wins (at least with opkg u-a
>> implementation).
>
> As I understand it, this is already present:
>
> sysvinit_2.88dsf.bb:
>
> ALTERNATIVE_PRIORITY = "200"
>
> util-linux.inc:
>
> ALTERNATIVE_PRIORITY = "100"

And to clarify, this ensures the manpage for these alternatives match the 
priority of the base package as well.  So if both sysvinit and util-linux are 
installed (as well as their doc files), both man pages and executables will match.

--Mark

> Thanks!
>
> Jeff
>
>>> Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
>>> ---
>>>   meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb    |   11 ++++++++++-
>>>   meta/recipes-core/util-linux/util-linux.inc       |    9 +++++++++
>>>   meta/recipes-core/util-linux/util-linux_2.22.2.bb |    2 +-
>>>   3 files changed, 20 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
>>> index 0a11139..e64b67a 100644
>>> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
>>> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
>>> @@ -5,7 +5,7 @@ SECTION = "base"
>>>   LICENSE = "GPLv2+"
>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>>>                       file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
>>> -PR = "r10"
>>> +PR = "r11"
>>>
>>>   RDEPENDS_${PN} = "${PN}-inittab"
>>>
>>> @@ -45,6 +45,15 @@ ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
>>>   ALTERNATIVE_${PN}-pidof = "pidof"
>>>   ALTERNATIVE_LINK_NAME[pidof] = "${base_bindir}/pidof"
>>>
>>> +ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1"
>>> +
>>> +ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
>>> +ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
>>> +ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
>>> +ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
>>> +ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
>>> +ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
>>> +
>>>   PACKAGES =+ "sysvinit-pidof sysvinit-sulogin"
>>>   FILES_${PN} += "${base_sbindir}/* ${base_bindir}/*"
>>>   FILES_sysvinit-pidof = "${base_bindir}/pidof.sysvinit ${base_sbindir}/killall5"
>>> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
>>> index 10439c0..c91f4a3 100644
>>> --- a/meta/recipes-core/util-linux/util-linux.inc
>>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>>> @@ -154,6 +154,15 @@ ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
>>>   ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
>>>   ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
>>>
>>> +ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1"
>>> +
>>> +ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
>>> +ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
>>> +ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
>>> +ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
>>> +ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
>>> +ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
>>> +
>>>   # There seems to be problem, atleast on nslu2, with these, untill they are
>>>   # fixed the busybox ones have higher priority
>>>   ALTERNATIVE_PRIORITY[hwclock] = "10"
>>> diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
>>> index dd95573..f91784b 100644
>>> --- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
>>> +++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
>>> @@ -1,5 +1,5 @@
>>>   MAJOR_VERSION = "2.22"
>>> -PR = "r0"
>>> +PR = "r1"
>>>   require util-linux.inc
>>>
>>>   # note that `lscpu' is under GPLv3+
>>> --
>>> 1.7.9.5
>>>
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>



