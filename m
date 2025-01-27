Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06085C02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 20:01:13 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.762.1738008070094361755
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jan 2025 12:01:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tcVIC-0006ea-EQ; Mon, 27 Jan 2025 21:01:08 +0100
Message-ID: <1a634941-bcb7-42c4-9c7d-283e3325ebd2@pengutronix.de>
Date: Mon, 27 Jan 2025 21:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/2] barebox: upgrade 2024.12.0 -> 2025.01.0
To: Khem Raj <raj.khem@gmail.com>, ejo@pengutronix.de
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
References: <20250127153944.676370-1-ejo@pengutronix.de>
 <20250127153944.676370-2-ejo@pengutronix.de>
 <CAMKF1sqX7gFCEH78fHS+jkUSieL5crAU_RwAUO-daJL0u+fj0g@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAMKF1sqX7gFCEH78fHS+jkUSieL5crAU_RwAUO-daJL0u+fj0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 20:01:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210308

On 27.01.25 20:06, Khem Raj wrote:
> On Mon, Jan 27, 2025 at 7:40 AM Enrico Jörns via
> lists.openembedded.org <ejo=pengutronix.de@lists.openembedded.org>
> wrote:
>>
>> Changes:
>>
>> * Added LLVM/Clang support for the sandbox architecture.
>> * Enabled command execution from the sandbox command line.
>> * Improved TFTP with dentry caching and default-disabled window size.
>> * Introduced hardening features: register zeroing, stack variable
>>   initialization, and malloc buffer zeroing.
>> * Enhanced AM625 support with network support, watchdog driver, and
>>   bootsource detection.
>>
>> Changelog: https://lore.barebox.org/barebox/Z4oUYdHXEAtnkySC@pengutronix.de/T/#u
>>
>> Also adds a new patch created for fixing barebox-tools build with musl.
>>
>> Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
>> ---
>> v1 -> v2:
>>   * added barebox patch file to fix musl build (by Ahmad Fatoum)
>>   * minor wording change in 'Changes'
>>   [* added patch to remove old barebox .patch file]
>>
>>  meta/recipes-bsp/barebox/barebox-common.inc   |  6 +-
>>  ...linux-types.h-define-loff_t-for-musl.patch | 57 +++++++++++++++++++
>>  2 files changed, 61 insertions(+), 2 deletions(-)
>>  create mode 100644 meta/recipes-bsp/barebox/files/0001-scripts-include-linux-types.h-define-loff_t-for-musl.patch
>>
>> diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
>> index fce3b825ae..13f1d81289 100644
>> --- a/meta/recipes-bsp/barebox/barebox-common.inc
>> +++ b/meta/recipes-bsp/barebox/barebox-common.inc
>> @@ -3,6 +3,8 @@ SECTION = "bootloaders"
>>
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
>>
>> -PV = "2024.12.0"
>> +PV = "2025.01.0"
>>  SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
>> -SRC_URI[sha256sum] = "717a2416b37942f584b0bb2eb61ccbf85dc0f1a5c841318f47cd6967b9c4dcab"
>> +SRC_URI[sha256sum] = "288a838e6fe8897ea46dabd112e42287177353c88a7d442cefc8be8d1a85f5b5"
>> +
>> +SRC_URI += "file://0001-scripts-include-linux-types.h-define-loff_t-for-musl.patch"
>> diff --git a/meta/recipes-bsp/barebox/files/0001-scripts-include-linux-types.h-define-loff_t-for-musl.patch b/meta/recipes-bsp/barebox/files/0001-scripts-include-linux-types.h-define-loff_t-for-musl.patch
>> new file mode 100644
>> index 0000000000..bce9d2ebf5
>> --- /dev/null
>> +++ b/meta/recipes-bsp/barebox/files/0001-scripts-include-linux-types.h-define-loff_t-for-musl.patch
>> @@ -0,0 +1,57 @@
>> +From e46f4add079bbae4ac0926ed113e393786e89bef Mon Sep 17 00:00:00 2001
>> +From: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> +Date: Mon, 27 Jan 2025 15:31:46 +0100
>> +Subject: [PATCH] scripts: include/linux/types.h: define loff_t for musl
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +musl doesn't define loff_t, but glibc does and both of them define
>> +__linux__. This leads to build errors with musl when code makes it into
>> +scripts/ that uses loff_t. This was already fixed once e.g. in commit
>> +c0d065fb0aa0 ("scripts: bareboximd: remove usage of loff_t").
>> +
>> +Instead of playing whack-a-mole in future, let's just define loff_t
>> +for non-glibc builds of scripts/.
>> +
> 
> loff_t is not posix defined but it is available in musl.
> you need to add -D_GNU_SOURCE to the compiler cmdline.

I somehow thought _GNU_SOURCE was already being set globally, but you're
right: Not all files were setting it.

I just Cc'd you on a patch[1] to define it on the compiler command line instead.

[1]: https://lore.kernel.org/barebox/20250127195109.3928003-1-a.fatoum@pengutronix.de/T/#u

Thanks,
Ahmad

> 
>> +Also, make sure <linux/types.h> is always included for scripts/common.h,
>> +which is the only header currently making use of loff_t.
>> +
>> +Fixes: 5171f4d0696f ("scripts: implement read_fd and pread_full for tools")
>> +Upstream-Status: Submitted [https://lore.barebox.org/barebox/20250127143146.2965544-1-a.fatoum@pengutronix.de/T/#u]
>> +Reported-by: Enrico Jörns <ejo@pengutronix.de>
>> +Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> +---
>> + scripts/common.h              | 2 ++
>> + scripts/include/linux/types.h | 2 +-
>> + 2 files changed, 3 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/scripts/common.h b/scripts/common.h
>> +index a0d16606b5..21ec576a5b 100644
>> +--- a/scripts/common.h
>> ++++ b/scripts/common.h
>> +@@ -1,6 +1,8 @@
>> + #ifndef __COMMON_H
>> + #define __COMMON_H
>> +
>> ++#include <linux/types.h>
>> ++
>> + int read_file_2(const char *filename, size_t *size, void **outbuf, size_t max_size);
>> + void *read_file(const char *filename, size_t *size);
>> + void *read_fd(int fd, size_t *out_size);
>> +diff --git a/scripts/include/linux/types.h b/scripts/include/linux/types.h
>> +index e81d7e8101..02a330cd4e 100644
>> +--- a/scripts/include/linux/types.h
>> ++++ b/scripts/include/linux/types.h
>> +@@ -14,7 +14,7 @@ typedef int16_t __s16;
>> + typedef uint8_t __u8;
>> + typedef int8_t __s8;
>> +
>> +-#ifndef __linux__
>> ++#ifndef __GLIBC__
>> + typedef long long loff_t;
>> + #endif
>> +
>> +--
>> +2.39.5
>> +
>> --
>> 2.39.5
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#210302): https://lists.openembedded.org/g/openembedded-core/message/210302
>> Mute This Topic: https://lists.openembedded.org/mt/110840770/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

