Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82180731D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 02:01:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7J21GN2015870
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Aug 2016 19:01:16 -0700 (PDT)
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 18 Aug 2016 19:01:15 -0700
To: Joshua G Lock <joshua.g.lock@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1468466649.git.Qi.Chen@windriver.com>
	<b833d4bb5bd450464c93f49727f0dd31691897a5.1468466649.git.Qi.Chen@windriver.com>
	<1470149703.2984.22.camel@linux.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <57B66877.70602@windriver.com>
Date: Fri, 19 Aug 2016 10:01:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1470149703.2984.22.camel@linux.intel.com>
X-Originating-IP: [128.224.162.229]
Subject: Re: [PATCH 1/1] systemd: split systemd-container
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
X-List-Received-Date: Fri, 19 Aug 2016 02:01:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2016 10:55 PM, Joshua G Lock wrote:
> On Thu, 2016-07-14 at 11:25 +0800, Chen Qi wrote:
>> Split container/vm related units into a new package, systemd-
>> container.
>>
>> The split mainly references Fedora 24, with a few differences.
>> Apart from the bash and zsh completion files, the differences include
>> adding systemd-spawn@.service into the systemd-container package.
>>
>> [YOCTO #9835]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/systemd/systemd_230.bb | 35
>> +++++++++++++++++++++++++++++---
>>   1 file changed, 32 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-
>> core/systemd/systemd_230.bb
>> index 374a197..cf8aec1 100644
>> --- a/meta/recipes-core/systemd/systemd_230.bb
>> +++ b/meta/recipes-core/systemd/systemd_230.bb
>> @@ -291,6 +291,7 @@ PACKAGES =+ "\
>>       ${PN}-pam \
>>       ${PN}-zsh-completion \
>>       ${PN}-xorg-xinitrc \
>> +    ${PN}-container \
>>       ${PN}-extra-utils \
>>   "
>>   
>> @@ -348,6 +349,37 @@ RRECOMMENDS_${PN}-binfmt = "kernel-module-
>> binfmt-misc"
>>   
>>   RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-
>> keymaps"
> It would be nice to provide more information about systemd-container to
> package managers with a SUMMARY_${PN}-container and DESCRIPTION_${PN}-
> container
>
>>   
>> +FILES_${PN}-container = "${sysconfdir}/dbus-
>> 1/system.d/org.freedesktop.import1.conf \
>> +                         ${sysconfdir}/dbus-
>> 1/system.d/org.freedesktop.machine1.conf \
>> +                         ${base_bindir}/machinectl \
>> +                         ${bindir}/systemd-nspawn \
>> +                         ${exec_prefix}/lib/systemd/import-
>> pubring.gpg \
> any reason you didn't use ${libdir}/systemd/import-pubring.gpg or
> ${nonarch_libdir} if the files is always installed in /usr/lib
> regardless of whether libdir is i.e. /usr/lib64
>
>> +                         ${systemd_unitdir}/system/busnames.target.w
>> ants/org.freedesktop.import1.busname \
>> +                         ${systemd_unitdir}/system/busnames.target.w
>> ants/org.freedesktop.machine1.busname \
>> +                         ${systemd_unitdir}/system/local-
>> fs.target.wants/var-lib-machines.mount \
>> +                         ${systemd_unitdir}/system/machine.slice \
>> +                         ${systemd_unitdir}/system/machines.target \
>> +                         ${systemd_unitdir}/system/org.freedesktop.i
>> mport1.busname \
>> +                         ${systemd_unitdir}/system/org.freedesktop.m
>> achine1.busname \
>> +                         ${systemd_unitdir}/system/systemd-
>> importd.service \
>> +                         ${systemd_unitdir}/system/systemd-
>> machined.service \
>> +                         ${systemd_unitdir}/system/var-lib-
>> machines.mount \
> I realise these are probably copy/pasted, but you could replace all of
> the ${systemd_unitdir}/system with ${systemd_system_unitdir}
>
> Otherwise this change looks good, thanks!
>
> Joshua
>

Thanks a lot for you suggestion.
I'll send out V2.

Best Regards,
Chen Qi

>> +                         ${rootlibexecdir}/systemd/systemd-import \
>> +                         ${rootlibexecdir}/systemd/systemd-importd \
>> +                         ${rootlibexecdir}/systemd/systemd-journal-
>> gatewayd \
>> +                         ${rootlibexecdir}/systemd/systemd-journal-
>> remote \
>> +                         ${rootlibexecdir}/systemd/systemd-journal-
>> upload \
>> +                         ${rootlibexecdir}/systemd/systemd-machined
>> \
>> +                         ${rootlibexecdir}/systemd/systemd-pull
>> \+                         ${exec_prefix}/lib/tmpfiles.d/systemd-
>> nspawn.conf \
>> +                         ${systemd_unitdir}/system/systemd-
>> nspawn@.service \
>> +                         ${libdir}/libnss_mymachines.so.2 \
>> +                         ${datadir}/dbus-1/system-
>> services/org.freedesktop.import1.service \
>> +                         ${datadir}/dbus-1/system-
>> services/org.freedesktop.machine1.service \
>> +                         ${datadir}/polkit-
>> 1/actions/org.freedesktop.import1.policy \
>> +                         ${datadir}/polkit-
>> 1/actions/org.freedesktop.machine1.policy \
>> +                        "
>> +
>
>
>>   FILES_${PN}-extra-utils = "\
>>                           ${base_bindir}/systemd-escape \
>>                           ${base_bindir}/systemd-inhibit \
>> @@ -371,9 +403,6 @@ FILES_${PN}-extra-utils = "\
>>                           ${rootlibexecdir}/systemd/systemd-resolve-
>> host \
>>                           ${rootlibexecdir}/systemd/systemd-ac-power \
>>                           ${rootlibexecdir}/systemd/systemd-activate \
>> -                        ${bindir}/systemd-nspawn \
>> -                        ${exec_prefix}/lib/tmpfiles.d/systemd-
>> nspawn.conf \
>> -                        ${systemd_unitdir}/system/systemd-
>> nspawn@.service \
>>                           ${rootlibexecdir}/systemd/systemd-bus-proxyd
>> \
>>                           ${systemd_unitdir}/system/systemd-bus-
>> proxyd.service \
>>                           ${systemd_unitdir}/system/systemd-bus-
>> proxyd.socket \
>> -- 
>> 1.9.1
>>


