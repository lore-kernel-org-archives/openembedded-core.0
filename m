Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id AF7F96F9F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 07:27:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s337R7qd012633; Thu, 3 Apr 2014 08:27:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gPo4HLYPsJsS; Thu,  3 Apr 2014 08:27:07 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s337R0PQ012629
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 3 Apr 2014 08:27:01 +0100
Message-ID: <1396510015.2910.59.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
Date: Thu, 03 Apr 2014 08:26:55 +0100
In-Reply-To: <1396457186-5961-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1396457186-5961-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] files/device_table-minimal.txt: cleanup
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
X-List-Received-Date: Thu, 03 Apr 2014 07:27:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-04-02 at 18:46 +0200, Matthieu Crapet wrote:
> This device list is only used if USE_DEVFS is set to '0' (which is NOT the default since 2013-12-14,
> see commit f54fdd6673a136ee1cee1f3263a8a7820de43ca3) and if IMAGE_DEVICE_TABLE and IMAGE_DEVICE_TABLES are not set.
> 
> This is, of course a very subjective list but minimal with 62 (special) files.
> However, you should be able to boot correctly a lot of embedded linux around.
> 
> Changes:
> - add sda, sdb, sda[1234], sdb[1234]
> - add mmcblk0, mmcblk0p[1234]

If I remember correctly, mmc devices are dynamically allocated numbers.
Can we guarantee these are going to be correct?

> - add rtc0, rtc1
> - restrict maximum hdaX from 19 to 4 (pata is old)
> - add ttyS1

I only see ttyS, not S0 or S1?

> - remove initctl, apm_bios, tty8, ttySA
> - sorted entries

Cheers,

Richard

> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  meta/files/device_table-minimal.txt | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/files/device_table-minimal.txt b/meta/files/device_table-minimal.txt
> index 56c74bb..e4891cc 100644
> --- a/meta/files/device_table-minimal.txt
> +++ b/meta/files/device_table-minimal.txt
> @@ -9,23 +9,27 @@
>  #    p	Fifo (named pipe)
>  
>  /dev		d	755	root	root	-	-	-	-	-
> -/dev/initctl	p	600	root	root	-	-	-	-	-
> -/dev/apm_bios	c	660	root	plugdev	10	134	-	-	-
> +/dev/console	c	662	root	tty	5	1	-	-	-
>  /dev/fb0	c	600	root	root	29	0	-	-	-
>  /dev/hda	b	660	root	disk	3	0	-	-	-
> -/dev/hda	b	660	root	disk	3	1	1	1	19
> +/dev/hda	b	660	root	disk	3	1	1	1	4
>  /dev/kmem	c	640	root	kmem	1	2	-	-	-
>  /dev/kmsg	c	600	root	root	1	11	-	-	-
>  /dev/mem	c	640	root	kmem	1	1	-	-	-
> -/dev/null	c	666	root	root	1	3	-	-	-
> -/dev/ram	b	640	root	root	1	0	0	1	4
> -/dev/tty	c	662	root	tty	5	0	-	-	-
> -/dev/tty	c	666	root	tty	4	0	0	1	9
> -/dev/ttyS	c	640	root	tty	4	64	0	1	1
> -/dev/ttySA	c	640	root	tty	204	5	0	1	1
> -/dev/zero	c	644	root	root	1	5	-	-	-
> +/dev/mmcblk0	b	660	root	disk	179	0	-	-	-
> +/dev/mmcblk0p	b	660	root	disk	179	1	1	1	4
>  /dev/mtd	c	660	root	disk	90	0	0	2	8
>  /dev/mtdblock	b	640	root	root	31	0	0	1	8
> -/dev/console	c	662	root	tty	5	1	-	-	-
> +/dev/null	c	666	root	root	1	3	-	-	-
> +/dev/ram	b	640	root	root	1	0	0	1	4
>  /dev/random	c	644	root	root	1	8	-	-	-
> +/dev/rtc	c	644	root	root	254	0	0	1	2
> +/dev/sda	b	660	root	disk	8	0	-	-	-
> +/dev/sda	b	660	root	disk	8	1	1	1	4
> +/dev/sdb	b	660	root	disk	8	16	-	-	-
> +/dev/sdb	b	660	root	disk	8	17	1	1	4
> +/dev/tty	c	662	root	tty	5	0	-	-	-
> +/dev/tty	c	666	root	tty	4	0	0	1	8
> +/dev/ttyS	c	640	root	tty	4	64	0	1	2
>  /dev/urandom	c	644	root	root	1	9	-	-	-
> +/dev/zero	c	644	root	root	1	5	-	-	-
> -- 
> 1.8.5.4
> 



