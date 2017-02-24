Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1B37750A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 10:33:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1OAXgQJ011735
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Feb 2017 02:33:42 -0800 (PST)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Feb 2017 02:33:41 -0800
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <59065e2b-6a13-8736-6257-5ae42b647163@windriver.com>
Date: Fri, 24 Feb 2017 18:33:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: Yocto Bug#10456 discuss
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
X-List-Received-Date: Fri, 24 Feb 2017 10:33:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jussi and bruce

Yocto Bug#10456: X can not launch on qemumips64

I find the kernel 4.4 is ok, and on the latest 4.9 is ok, but on kernel 
4.8 is failed.

This is because this commit in linux-yocto-4.8:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

commit d03516df837587368fc6e75591f6329c072b9eb5
Author: Matthew Leach <matthew.leach@codethink.co.uk>
Date:   Tue Jun 21 16:19:49 2016 +0100

     tty: serial: 8250: add CON_CONSDEV to flags

     When using the 8250 as a boot console and the main console results in
     messages being printed twice.  The console framework will only
     unregister boot consoles if a new console is registered with the
     CON_CONSDEV flag set.

     Set this flag for the univ8250 console to prevent double-registration.

     Signed-off-by: Matthew Leach <matthew.leach@codethink.co.uk>
     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

diff --git a/drivers/tty/serial/8250/8250_core.c 
b/drivers/tty/serial/8250/8250_core.c
index fa823a5..dcf43f6 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -675,7 +675,7 @@ static struct console univ8250_console = {
         .device         = uart_console_device,
         .setup          = univ8250_console_setup,
         .match          = univ8250_console_match,
-       .flags          = CON_PRINTBUFFER | CON_ANYTIME,
+       .flags          = CON_PRINTBUFFER | CON_ANYTIME | CON_CONSDEV,
         .index          = -1,
         .data           = &serial8250_reg,
  };

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The 4.9 has been reverted it, so backport that reverted patch can fix 
this bug, but I don't know why this related to qemumips64?

Thanks

Dengke


