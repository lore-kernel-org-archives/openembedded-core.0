Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 370F76FFCC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 14:24:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1OEOCRa012375
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Feb 2017 06:24:12 -0800 (PST)
Received: from server.local (128.224.22.134) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Feb 2017 06:24:12 -0800
To: Dengke Du <dengke.du@windriver.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
References: <59065e2b-6a13-8736-6257-5ae42b647163@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <4d97435c-25e7-06ac-71e6-8b936ccc8ee2@windriver.com>
Date: Fri, 24 Feb 2017 09:24:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <59065e2b-6a13-8736-6257-5ae42b647163@windriver.com>
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
X-List-Received-Date: Fri, 24 Feb 2017 14:24:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-02-24 5:33 AM, Dengke Du wrote:
> Hi Jussi and bruce
>
> Yocto Bug#10456: X can not launch on qemumips64
>
> I find the kernel 4.4 is ok, and on the latest 4.9 is ok, but on kernel
> 4.8 is failed.
>
> This is because this commit in linux-yocto-4.8:
>
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> commit d03516df837587368fc6e75591f6329c072b9eb5
> Author: Matthew Leach <matthew.leach@codethink.co.uk>
> Date:   Tue Jun 21 16:19:49 2016 +0100
>
>     tty: serial: 8250: add CON_CONSDEV to flags
>
>     When using the 8250 as a boot console and the main console results in
>     messages being printed twice.  The console framework will only
>     unregister boot consoles if a new console is registered with the
>     CON_CONSDEV flag set.
>
>     Set this flag for the univ8250 console to prevent double-registration.
>
>     Signed-off-by: Matthew Leach <matthew.leach@codethink.co.uk>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> diff --git a/drivers/tty/serial/8250/8250_core.c
> b/drivers/tty/serial/8250/8250_core.c
> index fa823a5..dcf43f6 100644
> --- a/drivers/tty/serial/8250/8250_core.c
> +++ b/drivers/tty/serial/8250/8250_core.c
> @@ -675,7 +675,7 @@ static struct console univ8250_console = {
>         .device         = uart_console_device,
>         .setup          = univ8250_console_setup,
>         .match          = univ8250_console_match,
> -       .flags          = CON_PRINTBUFFER | CON_ANYTIME,
> +       .flags          = CON_PRINTBUFFER | CON_ANYTIME | CON_CONSDEV,
>         .index          = -1,
>         .data           = &serial8250_reg,
>  };
>
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> The 4.9 has been reverted it, so backport that reverted patch can fix
> this bug, but I don't know why this related to qemumips64?

Looks like the console is interfering with X claiming a VT for
startup.

But I wouldn't worry about the root cause all that much, if you've
bisected it, and it has been reverted already in newer kernels .. that
should be enough evidence for anyone.

Bruce

>
> Thanks
>
> Dengke
>


