Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id D87647198A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 21:44:59 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wshG36JBMz1qrds;
	Tue, 20 Jun 2017 23:44:59 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wshG34s5Rz3jRB4;
	Tue, 20 Jun 2017 23:44:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id g0CEJSMdGDr5; Tue, 20 Jun 2017 23:44:58 +0200 (CEST)
X-Auth-Info: A2MoqsqzR525NMeQJrf7IvvxKwVmvA4p+hnYxCBREsg=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 20 Jun 2017 23:44:58 +0200 (CEST)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Brad Mouring <brad.mouring@ni.com>
References: <20170620204029.19499-1-brad.mouring@ni.com>
	<f35ef85f-1868-ef13-1003-3bf1cfc58b89@denx.de>
	<20170620205349.GA19584@zardoz.amer.corp.natinst.com>
	<CAP9ODKoR2bZgeNzzBhNmDzJw6KOvqfboYpY3cj1JMnoqS4YKMQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <ae378e9f-5646-41fc-642c-9716a2a03ac4@denx.de>
Date: Tue, 20 Jun 2017 23:16:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoR2bZgeNzzBhNmDzJw6KOvqfboYpY3cj1JMnoqS4YKMQ@mail.gmail.com>
Cc: Tom Rini <trini@konsulko.com>,
	Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] u-boot-fw-utils: Allow target-specific fw_env.config
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
X-List-Received-Date: Tue, 20 Jun 2017 21:45:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 06/20/2017 10:57 PM, Otavio Salvador wrote:
> On Tue, Jun 20, 2017 at 5:53 PM, Brad Mouring <brad.mouring@ni.com> wrote:
>> On Tue, Jun 20, 2017 at 10:43:51PM +0200, Marek Vasut wrote:
>>> On 06/20/2017 10:40 PM, Brad Mouring wrote:
>>>> As implemented currently, the fw-utils recipe does not allow for
>>>> ...
>>>> +# by the U-Boot environment utilities "fw_printenv" and "fw_setenv".
>>>> +# By default, use the default included in the U-Boot source
>>>> +UBOOT_FW_ENV_CONFIG ??= "${S}/tools/env/fw_env.config"
>>>> +
>>>>  inherit uboot-config
>>>>
>>>>  do_compile () {
>>>> @@ -19,7 +24,7 @@ do_install () {
>>>>     install -d ${D}${sysconfdir}
>>>>     install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
>>>>     install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
>>>> -   install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
>>>> +   install -m 0644 ${UBOOT_FW_ENV_CONFIG} ${D}${sysconfdir}/fw_env.config
>>>
>>> Do we really need yet another variable ? Wouldn't it make more sense to
>>> add do_install_append_yourmachine() {} in your meta-whatever to
>>> u-boot-fw-utils_%.bbappend and install whatever additional files you need ?
>>
>> This is (kinda) what we were doing, there was some discussion as to
>> whether or not this made sense upstream. I was unsure of the
>> acceptability of a do_install_append.*() clobbering a file of the
>> original do_install().
>>
>> Thanks for the input.
> 
> Or split up the configuration to u-boot-fw-utils-config package and
> make u-boot-fw-utils generic? So we can have the configuration in a
> specific package.

Keep in mind that u-boot-fw-utils is actually built for particular
machine (it contains ie. the default env for that machine) so bundling
the config file with it is IMO OK. No need to introduce additional
packages for every simple file.

-- 
Best regards,
Marek Vasut

