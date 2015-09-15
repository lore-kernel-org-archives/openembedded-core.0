Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0DD73D13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 15:13:55 +0000 (UTC)
Received: by iofh134 with SMTP id h134so202943336iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 08:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=tab7w6V/EDE2hjJQCFHKjKsZxkCPIw4fzTXVg7f1o88=;
	b=JM/E6YItapSUdsZCaP3jpqKfixf8xVfCinL8NNMZsv+IGTdB12ACbIfQx/XW3fxZsc
	cKVu/yKjs/rfDsgdQ7zi6WNP7xmVenpCzE2uJc61gd/CGHj1z2pXNmDNziv6afNRTKzp
	kFje7RdVzNQnu4EbI95v+kJ5fID77obyV1XclOUmqQMlo8fEhakWnZTIa1rfDcjP5ThO
	9KjitK4tvwvZCnUmrO6/pG11ckC+rBaySpI1WYxyp4kbynHx1TaKIPl9H0JseMSW8Vx7
	MVxl5w/VGMdu7i9685gZxwbgvfqllkO5sAlHSBiFmODlVgUtPhJHTVqwmUvlAq9o7aqg
	wDbw==
X-Received: by 10.107.162.139 with SMTP id l133mr33068416ioe.49.1442330035543; 
	Tue, 15 Sep 2015 08:13:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Tue, 15 Sep 2015 08:13:26 -0700 (PDT)
In-Reply-To: <20150915062937.GN9460@loska>
References: <cover.1442248108.git.raj.khem@gmail.com>
	<2e8b33d5ff6928987dde0b059cd7403fc32a2e0b.1442248108.git.raj.khem@gmail.com>
	<20150915062937.GN9460@loska>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Sep 2015 08:13:26 -0700
Message-ID: <CAMKF1soOSzDNCTtCk-piCt0LHbrP6p6eZZCE6EuWaf5WHkK2BQ@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/12] hostap-utils: Use C99 stddefs in defining local typedefs
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
X-List-Received-Date: Tue, 15 Sep 2015 15:14:01 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 14, 2015 at 11:33 PM,  <Mikko.Rapeli@bmw.de> wrote:
> On Mon, Sep 14, 2015 at 04:31:17PM +0000, Khem Raj wrote:
>> The code is creating more abstract types which is nice however it should
>> be using standard defines from stdint.h and not random defines to base
>> its own type system
>
> These types are not random. They are standard Linux kernel types used by headers
> exported to userspace and their definitions come from <linux/types.h>.
> These headers should not depend on libc headers like stdint.h.

Right they are not random in general but they are randomly being
redefined by the application,
if it should be using linux/types.h those are different types than
what is being defined here. I have just
made the semantics of existing logic to be more c99 compliant.

>
> Also, this file is actually a convenience copy of <linux/wireless.h> which should
> be used directly instead.

There must be a reason to make own copy. May be hostap-utils want to
be portable to more than linux

>
> -Mikko
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch | 36 ++++++++++++++++++++++
>>  meta/recipes-bsp/hostap/hostap-utils.inc           |  4 ++-
>>  2 files changed, 39 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
>>
>> diff --git a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
>> new file mode 100644
>> index 0000000..b44dca3
>> --- /dev/null
>> +++ b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
>> @@ -0,0 +1,36 @@
>> +From 742fb110d9841a04b3ced256b0bf80ff304dcaff Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Mon, 31 Aug 2015 05:45:08 +0000
>> +Subject: [PATCH] Define _u32/__s32/__u16/__s16/__u8 in terms of c99 types
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +Upstream-Status: Pending
>> +
>> + wireless_copy.h | 10 +++++-----
>> + 1 file changed, 5 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/wireless_copy.h b/wireless_copy.h
>> +index 8208258..1171a35 100644
>> +--- a/wireless_copy.h
>> ++++ b/wireless_copy.h
>> +@@ -86,11 +86,11 @@
>> + #else
>> + #include <sys/types.h>
>> + #include <net/if.h>
>> +-typedef __uint32_t __u32;
>> +-typedef __int32_t __s32;
>> +-typedef __uint16_t __u16;
>> +-typedef __int16_t __s16;
>> +-typedef __uint8_t __u8;
>> ++typedef u_int32_t __u32;
>> ++typedef int32_t __s32;
>> ++typedef u_int16_t __u16;
>> ++typedef int16_t __s16;
>> ++typedef u_int8_t __u8;
>> + #ifndef __user
>> + #define __user
>> + #endif /* __user */
>> +--
>> +2.5.1
>> +
>> diff --git a/meta/recipes-bsp/hostap/hostap-utils.inc b/meta/recipes-bsp/hostap/hostap-utils.inc
>> index 89d977a..140321d 100644
>> --- a/meta/recipes-bsp/hostap/hostap-utils.inc
>> +++ b/meta/recipes-bsp/hostap/hostap-utils.inc
>> @@ -10,7 +10,9 @@ SECTION = "kernel/userland"
>>  PR = "r4"
>>
>>  SRC_URI = "http://hostap.epitest.fi/releases/hostap-utils-${PV}.tar.gz \
>> -        file://hostap-fw-load.patch"
>> +           file://hostap-fw-load.patch \
>> +           file://0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch \
>> +"
>>  S = "${WORKDIR}/hostap-utils-${PV}"
>>
>>  BINARIES = "hostap_crypt_conf hostap_diag hostap_fw_load hostap_io_debug \
>> --
>> 2.5.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

