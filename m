Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9345D71CB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 16:03:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wt8d16ty2z1qqkg;
	Wed, 21 Jun 2017 18:03:01 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wt8d15LVjz3hkQM;
	Wed, 21 Jun 2017 18:03:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id sPBYeutpDXjz; Wed, 21 Jun 2017 18:03:00 +0200 (CEST)
X-Auth-Info: ZVNZvTcbTG/rEd+lJkGJvd81aRoAoiNgQ9pwp281Vrg=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 21 Jun 2017 18:03:00 +0200 (CEST)
To: Denys Dmytriyenko <denis@denix.org>,
	Otavio Salvador <otavio@ossystems.com.br>
References: <20170620221512.21860-1-otavio@ossystems.com.br>
	<20170620235544.GO28053@denix.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <5dcc3780-3b0b-ee73-ae98-eda431d0dfe8@denx.de>
Date: Wed, 21 Jun 2017 17:25:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170620235544.GO28053@denix.org>
Cc: trini@konsulko.com, brad.mouring@ni.com,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-fw-utils: Allow replacement of fw_env.config
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
X-List-Received-Date: Wed, 21 Jun 2017 16:03:02 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 06/21/2017 01:55 AM, Denys Dmytriyenko wrote:
> On Tue, Jun 20, 2017 at 07:15:12PM -0300, Otavio Salvador wrote:
>> If a fw_env.config file is found in workdir, this is preferred over
>> the U-Boot example.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>>  meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
>> index c2e8f0fb84..0682f9274b 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
>> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
>> @@ -19,7 +19,14 @@ do_install () {
>>  	install -d ${D}${sysconfdir}
>>  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
>>  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
>> -	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
>> +
>> +	# If a specific file is added in a .bbappend, this is used instead
>> +	# of the generic one
>> +	if [ -e ${WORKDIR}/fw_env.config ]; then
>> +		install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
> 
> I don't get it - if it's expected that a .bbappend will be adding a more 
> specific version of fw_env.config, why that .bbappend can't simply install 
> it with do_install_append()?

+1 , I dont get it either. Just use do_install_append and be done with it.

-- 
Best regards,
Marek Vasut

