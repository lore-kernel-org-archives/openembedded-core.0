Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C56060167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 06:40:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6S6e4m2009774
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 Jul 2014 23:40:04 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sun, 27 Jul 2014 23:40:03 -0700
Message-ID: <53D5F055.2030803@windriver.com>
Date: Mon, 28 Jul 2014 14:40:21 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1406279934.git.Qi.Chen@windriver.com>
	<f11514aea79be9f009030d3acb5964de15a26223.1406279934.git.Qi.Chen@windriver.com>
	<33866F61-B200-4CA4-AC52-69BD3EB109A1@dominion.thruhere.net>
	<53D5B441.4050902@windriver.com>
	<DC28F4FA-9701-404C-9192-A61B9FD968E9@dominion.thruhere.net>
In-Reply-To: <DC28F4FA-9701-404C-9192-A61B9FD968E9@dominion.thruhere.net>
X-Originating-IP: [128.224.162.187]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: upgrade to 215
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
X-List-Received-Date: Mon, 28 Jul 2014 06:40:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2014 02:31 PM, Koen Kooi wrote:
> Op 28 jul. 2014, om 04:24 heeft ChenQi <Qi.Chen@windriver.com> het volgende geschreven:
>
>> On 07/25/2014 06:56 PM, Koen Kooi wrote:
>>> Op 25 jul. 2014, om 11:20 heeft Chen Qi <Qi.Chen@windriver.com> het volgende geschreven:
>>>
>>>> Upgrade systemd from 213 to 215.
>>>>
>>>> systemd-older-kernel.patch is removed as it's fixed in 215.
>>> NAK! This will drop libraries and and leave files unpackages, you need something like this:
>>>
>>> @@ -146,7 +146,9 @@ do_install_ptest () {
>>>     python populate_packages_prepend (){
>>>       systemdlibdir = d.getVar("rootlibdir", True)
>>> +    prefixlibdir = d.getVar("libdir", True)
>>>       do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
>>> +    do_split_packages(d, prefixlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
>>>   }
>>>   PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
>>>   @@ -198,7 +200,10 @@ RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
>>>   CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
>>>                   ${sysconfdir}/systemd/logind.conf \
>>>                   ${sysconfdir}/systemd/system.conf \
>>> -                ${sysconfdir}/systemd/user.conf"
>>> +                ${sysconfdir}/systemd/user.conf \
>>> +                ${libdir}/sysusers.d/systemd.conf \
>>> +                ${libdir}/sysusers.d/basic.conf \
>>> +                "
>>>     FILES_${PN} = " ${base_bindir}/* \
>>>                   ${datadir}/bash-completion \
>>> @@ -218,7 +223,8 @@ FILES_${PN} = " ${base_bindir}/* \
>>>                   ${rootlibexecdir}/systemd/* \
>>>                   ${systemd_unitdir}/* \
>>>                   ${base_libdir}/security/*.so \
>>> -                ${libdir}/libnss_myhostname.so.2 \
>>> +                ${libdir}/libnss_*.so.* \
>>> +                ${libdir}/sysusers.d \
>>>                   /cgroup \
>>>                   ${bindir}/systemd* \
>>>                   ${bindir}/busctl \
>>>
>>>
>>> lib*udev have moved, 2 nss plugins were added and the sysusers files should be added to CONFFILES.
>>>
>> Hi Koen,
>>
>> Which files are not packaged? I don't see any 'installed-not-shipped' error after upgrading.
>>
>> Note the I've added ${exec_prefix}/lib/sysusers.d to FILES_${PN}.
>> And I don't think files under /lib should be added to CONFFILES.
> System config files need to be in CONFFILES, even if they aren't placed in /etc
>

OK.
I'll send out a V2.
Thanks for your advice.

//Chen Qi

