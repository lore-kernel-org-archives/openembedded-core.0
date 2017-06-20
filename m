Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 328F471A84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 20:59:58 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wsgG72BDhz1qtXX;
	Tue, 20 Jun 2017 22:59:57 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wsgG51XLvz3j37n;
	Tue, 20 Jun 2017 22:59:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id aVMPIl99m7-x; Tue, 20 Jun 2017 22:59:56 +0200 (CEST)
X-Auth-Info: fRy6E/zhRGV72Zd7EAJ2ADlJ7Lhn4u8Sqg5BA8ufcQU=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 20 Jun 2017 22:59:56 +0200 (CEST)
To: Brad Mouring <brad.mouring@ni.com>
References: <20170620204029.19499-1-brad.mouring@ni.com>
	<f35ef85f-1868-ef13-1003-3bf1cfc58b89@denx.de>
	<20170620205349.GA19584@zardoz.amer.corp.natinst.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <89778545-bbd2-56d0-a636-b0c182079b05@denx.de>
Date: Tue, 20 Jun 2017 22:59:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170620205349.GA19584@zardoz.amer.corp.natinst.com>
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
X-List-Received-Date: Tue, 20 Jun 2017 20:59:59 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 06/20/2017 10:53 PM, Brad Mouring wrote:
> On Tue, Jun 20, 2017 at 10:43:51PM +0200, Marek Vasut wrote:
>> On 06/20/2017 10:40 PM, Brad Mouring wrote:
>>> As implemented currently, the fw-utils recipe does not allow for
>>> ...
>>> +# by the U-Boot environment utilities "fw_printenv" and "fw_setenv".
>>> +# By default, use the default included in the U-Boot source
>>> +UBOOT_FW_ENV_CONFIG ??= "${S}/tools/env/fw_env.config"
>>> +
>>>  inherit uboot-config
>>>  
>>>  do_compile () {
>>> @@ -19,7 +24,7 @@ do_install () {
>>>  	install -d ${D}${sysconfdir}
>>>  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
>>>  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
>>> -	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
>>> +	install -m 0644 ${UBOOT_FW_ENV_CONFIG} ${D}${sysconfdir}/fw_env.config
>>
>> Do we really need yet another variable ? Wouldn't it make more sense to
>> add do_install_append_yourmachine() {} in your meta-whatever to
>> u-boot-fw-utils_%.bbappend and install whatever additional files you need ?
> 
> This is (kinda) what we were doing, there was some discussion as to
> whether or not this made sense upstream.

Link?

> I was unsure of the
> acceptability of a do_install_append.*() clobbering a file of the
> original do_install().

That's probably what really needs to be discussed.

We can probably add some task which by default installs the
fw_env.config example and can be overridden in meta-whatever . Maybe the
others can jump into here and explain how to handle overriding the
default config file best.

-- 
Best regards,
Marek Vasut

