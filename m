Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5646373129
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 02:16:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1P2GkDY021393
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Feb 2017 18:16:46 -0800 (PST)
Received: from [128.224.16.209] (128.224.16.209) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Feb 2017 18:16:44 -0800
To: Bruce Ashfield <bruce.ashfield@windriver.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
References: <59065e2b-6a13-8736-6257-5ae42b647163@windriver.com>
	<4d97435c-25e7-06ac-71e6-8b936ccc8ee2@windriver.com>
From: dengke <dengke.du@windriver.com>
Message-ID: <54e2d71a-7f33-5d5f-0dfe-b1d2c5cd89b6@windriver.com>
Date: Sat, 25 Feb 2017 10:16:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <4d97435c-25e7-06ac-71e6-8b936ccc8ee2@windriver.com>
Subject: Re: Yocto Bug#10456 discuss
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
X-List-Received-Date: Sat, 25 Feb 2017 02:16:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

OK, thanks, I will send patch to revert it in Morty.

Dengke
在 02/24/2017 10:24 PM, Bruce Ashfield 写道:
> On 2017-02-24 5:33 AM, Dengke Du wrote:
>> Hi Jussi and bruce
>>
>> Yocto Bug#10456: X can not launch on qemumips64
>>
>> I find the kernel 4.4 is ok, and on the latest 4.9 is ok, but on kernel
>> 4.8 is failed.
>>
>> This is because this commit in linux-yocto-4.8:
>>
>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> commit d03516df837587368fc6e75591f6329c072b9eb5
>> Author: Matthew Leach <matthew.leach@codethink.co.uk>
>> Date:   Tue Jun 21 16:19:49 2016 +0100
>>
>>     tty: serial: 8250: add CON_CONSDEV to flags
>>
>>     When using the 8250 as a boot console and the main console 
>> results in
>>     messages being printed twice.  The console framework will only
>>     unregister boot consoles if a new console is registered with the
>>     CON_CONSDEV flag set.
>>
>>     Set this flag for the univ8250 console to prevent 
>> double-registration.
>>
>>     Signed-off-by: Matthew Leach <matthew.leach@codethink.co.uk>
>>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>> diff --git a/drivers/tty/serial/8250/8250_core.c
>> b/drivers/tty/serial/8250/8250_core.c
>> index fa823a5..dcf43f6 100644
>> --- a/drivers/tty/serial/8250/8250_core.c
>> +++ b/drivers/tty/serial/8250/8250_core.c
>> @@ -675,7 +675,7 @@ static struct console univ8250_console = {
>>         .device         = uart_console_device,
>>         .setup          = univ8250_console_setup,
>>         .match          = univ8250_console_match,
>> -       .flags          = CON_PRINTBUFFER | CON_ANYTIME,
>> +       .flags          = CON_PRINTBUFFER | CON_ANYTIME | CON_CONSDEV,
>>         .index          = -1,
>>         .data           = &serial8250_reg,
>>  };
>>
>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> The 4.9 has been reverted it, so backport that reverted patch can fix
>> this bug, but I don't know why this related to qemumips64?
>
> Looks like the console is interfering with X claiming a VT for
> startup.
>
> But I wouldn't worry about the root cause all that much, if you've
> bisected it, and it has been reverted already in newer kernels .. that
> should be enough evidence for anyone.
>
> Bruce
>
>>
>> Thanks
>>
>> Dengke
>>
>
>


