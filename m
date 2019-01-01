Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39FD46B43D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jan 2019 20:17:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x01KHGSX030882
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Jan 2019 12:17:32 -0800
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 1 Jan 2019 12:17:05 -0800
To: Jonas Bonn <jonas@norrbonn.se>, <openembedded-core@lists.openembedded.org>
References: <20181231120559.25470-1-jonas@norrbonn.se>
	<20181231120559.25470-3-jonas@norrbonn.se>
	<08f2090e-75cd-2551-5c01-5f22e5f2574d@windriver.com>
	<dc905b3a-ef1b-410a-c670-e849c9a8e6a2@norrbonn.se>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <b29c6e70-f606-3f4e-aad0-5f998b333a25@windriver.com>
Date: Tue, 1 Jan 2019 15:17:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <dc905b3a-ef1b-410a-c670-e849c9a8e6a2@norrbonn.se>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH 2/7] systemd-conf: simplify creation of configuration
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
X-List-Received-Date: Tue, 01 Jan 2019 20:17:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 1/1/19 12:03 PM, Jonas Bonn wrote:
> Hi Randy,
> 
> Thanks for looking at this.
> 
> On 01/01/2019 16:29, Randy MacLeod wrote:
>> On 12/31/18 7:05 AM, Jonas Bonn wrote:
>>> The configuration files that systemd installs are just skeletons
>>> detailing the available options and their default values.  The
>>> recommended means of changing the configuration is to provide snippets
>>> in configuration directories.  For example, journald.conf settings are
>>> best set in /usr/lib/journald.conf.d/ and can be overridden by the user
>>> by providing overriding snippets in /etc/systemd/journald.conf.d/.
>>>
>>> The base configuration files have the lowest priority; they will always
>>> be overridden by any snippets.  As such, it's probably best to not
>>> provide them at all.  This also moves us a step closer to an empty /etc
>>> which is should be a long term goal in order to allow running OE as a
>>> "stateless system".
>>>
>>> This patch moves the systemd configuration to snippets in
>>> /usr/lib/*.conf.d.  This simplifies the recipe considerably since it now
>>> just sets up a couple of text files and doesn't even need access to the
>>> systemd source anymore.
>>> ---
>>>   meta/recipes-core/systemd/systemd-conf.bb | 34 +++++++++--------------
>>>   1 file changed, 13 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd-conf.bb 
>>> b/meta/recipes-core/systemd/systemd-conf.bb
>>> index 7fe2e1105b..a504afe3e7 100644
>>> --- a/meta/recipes-core/systemd/systemd-conf.bb
>>> +++ b/meta/recipes-core/systemd/systemd-conf.bb
>>> @@ -1,9 +1,8 @@
>>> -require systemd.inc
>>> -
>>>   SUMMARY = "Systemd system configuration"
>>>   DESCRIPTION = "Systemd may require slightly different configuration 
>>> for \
>>>   different machines.  For example, qemu machines require a longer \
>>>   DefaultTimeoutStartSec setting."
>>> +LICENSE = "GPLv2"
>>
>> Systemd claims that these conf files are: LGPLv2.1+ licensed.
> 
> The configuration files from systemd may be LGPLv2 licensed, but this 
> package now only creates some configuration snippets which are 
> independent of systemd (it's just data, now).  As such, one could 
> certainly put whatever license one wanted on this.  Honestly, GPLv2 is 
> probably a stretch... I can hardly see that any license applies to this, 
> to be honest.  Consider that:
> 
> /usr/lib/journald.conf.d/systemd-conf.conf
> 
> contains
> 
> ForwardToSyslog=yes
> RuntimeMaxUse=64M
> 
> Just configuration data that the package creates dynamically.

I agree, maybe it's best to just use:
LICENSE = "MIT"
or as you say, no license tag at all.

> 
>>
>> https://github.com/systemd/systemd/blob/master/sysusers.d/systemd.conf.m4
>>
>> https://github.com/systemd/systemd/blob/master/modprobe.d/systemd.conf
>>
>>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>> @@ -13,36 +12,29 @@ ${sysconfdir}/systemd/logind.conf \
>>>   ${sysconfdir}/systemd/system.conf \
>>>   ${sysconfdir}/systemd/user.conf"
>>> -FILES_${PN} = "${sysconfdir}/systemd"
>>> -
>>> -do_configure[noexec] = '1'
>>> -do_compile[noexec] = '1'
>>> +FILES_${PN} = "/usr/lib/journald.conf.d/* \
>>> +/usr/lib/logind.conf.d/* \
>>> +/usr/lib/system.conf.d/* \
>>> +"
>>>   do_install() {
>>> -    rm -rf ${D}/${sysconfdir}/systemd
>>> -    install -d ${D}/${sysconfdir}/systemd
>>> -
>>> -    install -m 0644 ${S}/src/coredump/coredump.conf 
>>> ${D}${sysconfdir}/systemd/coredump.conf
>>> -
>>> -    install -m 0644 ${S}/src/journal/journald.conf 
>>> ${D}${sysconfdir}/systemd/journald.conf
>>> +    install -d ${D}/usr/lib/journald.conf.d
>>
>> Should the recipe use /usr/lib or is / should there be a
>> 'systemdconfdir' var?
> 
> So, I looked into the systemd source and, as far as I can see, it seems 
> that systemd hardcodes the paths to configuration files, tmpfiles, 
> presets, etc.  It's all really /usr/lib/... with no method of specifying 
> any other location.  For this reason, I've used these explicit paths 
> above, strange though it may appear...

I thought that might be the case. Thanks for looking into it.

Some people might want to use a variable name for the path so
that it's uniquely identified should they want to patch systemd's
definition but I don't think that's required.

../Randy

> 
> /Jonas


-- 
# Randy MacLeod
# Wind River Linux

