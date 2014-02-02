Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id ECACC6E924
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2014 17:51:49 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id hl1so2801419igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2014 09:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HuJVV/HHXMnIjx933eBAahkPqwEavJtgHJrVrk0mYyo=;
	b=qBXxdtY0mk6t10YayzRo5RnWjNWRP9w6wePw0DLxSoshgPTKAq8gXokJ1dsK+C2ki8
	YlEzrpenZqMescdPEG0SKNMl1Ic8YBF9C9bVEzlFwkOJTRbZZueKpZVjAuSNeN2Jhjh7
	6bkzRwTp+YVGnkGgnLPePtM0pZFQPn5DC8OB2EM+Ir3e7iZqB0wyL85epC0jve0OCOpP
	/F8H+AtNhRwrO+hSwxKjaVHJwso1Y9lbXZkmm0KDOHT2FWrsxZBGkYN5MC2p9YYVRhzu
	1+LDhMXNVPUSExjoQ9rogTDxbKjcyJxkOSZCoG0hEh5RPpXcDVrDYKNGdWCzdOfCBanG
	+RHQ==
X-Received: by 10.43.49.1 with SMTP id uy1mr1620993icb.48.1391363510732; Sun,
	02 Feb 2014 09:51:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Sun, 2 Feb 2014 09:51:20 -0800 (PST)
In-Reply-To: <1391335353.28575.145.camel@ted>
References: <454d9116b5fa6e0dbd35b594e1baec619f3ad0a2.1391245078.git.raj.khem@gmail.com>
	<316623c1ac044a6286904cdc7d1f9c68ddb692c8.1391245078.git.raj.khem@gmail.com>
	<1391335353.28575.145.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Feb 2014 09:51:20 -0800
Message-ID: <CAMKF1so6Zbw7m6LLpRTEq44VWXk6e4+HqsKA1dYMx7nCi1t3zA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] wireless-tools: Upgrade 29 -> 30.pre9
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
X-List-Received-Date: Sun, 02 Feb 2014 17:51:50 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 2, 2014 at 2:02 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2014-02-01 at 01:00 -0800, Khem Raj wrote:
>> This also fixes the underlinking problems that
>> are unearthed with newer binutils 2.24
>> where one of the wireless-tools libraries is asking
>> for symbols from libm but all the symbols it asks
>> for are unfortunately weak and they do not let new
>> linker convince enough to link libm even though -lm
>> is on cmdline since we are using --as-needed by default
>> in linker, which means we end up with errors like
>>
>> | make: *** [iwconfig] Error 1
>> | libiw.so.30: undefined reference to `ceil'
>> | libiw.so.30: undefined reference to `pow'
>> | libiw.so.30: undefined reference to `log10'
>> | libiw.so.30: undefined reference to `floor'
>> | collect2: error: ld returned 1 exit status
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../wireless-tools/wireless-tools/man.patch        | 24 ++++++++++----------
>>  ...eless-tools_29.bb => wireless-tools_30.pre9.bb} | 26 +++++++++++-----------
>>  2 files changed, 25 insertions(+), 25 deletions(-)
>>  rename meta/recipes-connectivity/wireless-tools/{wireless-tools_29.bb => wireless-tools_30.pre9.bb} (79%)
>>
>> diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
>> index 8e16215..6a757da 100644
>> --- a/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
>> +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
>> @@ -1,15 +1,15 @@
>>  Upstream-Status: Inappropriate [configuration]
>>
>> ---- wireless_tools.26/Makefile.orig  2003-06-18 03:38:58.000000000 +0200
>> -+++ wireless_tools.26/Makefile       2004-07-03 23:35:29.000000000 +0200
>> -@@ -57,8 +57,8 @@
>> - # Install directories
>> - INSTALL_DIR= $(PREFIX)/sbin/
>> - INSTALL_LIB= $(PREFIX)/lib/
>> --INSTALL_INC= $(PREFIX)/include/
>> --INSTALL_MAN= $(PREFIX)/man/
>> -+INSTALL_INC= $(PREFIX)/usr/include/
>> -+INSTALL_MAN= $(PREFIX)/usr/share/man/
>> +Index: wireless_tools.30/Makefile
>> +===================================================================
>> +--- wireless_tools.30.orig/Makefile  2014-02-01 00:21:04.148463382 -0800
>> ++++ wireless_tools.30/Makefile       2014-02-01 00:23:35.448072279 -0800
>> +@@ -76,7 +76,7 @@
>> + INSTALL_DIR= $(PREFIX)/sbin
>> + INSTALL_LIB= $(PREFIX)/lib
>> + INSTALL_INC= $(PREFIX)/include
>> +-INSTALL_MAN= $(PREFIX)/man
>> ++INSTALL_MAN= $(PREFIX)/share/man
>>
>> - # Use local header if the version of wireless extensions is specified
>> - ifdef FORCE_WEXT_VERSION
>> + # Various commands
>> + RM = rm -f
>> diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
>> similarity index 79%
>> rename from meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
>> rename to meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
>> index 3aef24e..bae22a0 100644
>> --- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
>> +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
>> @@ -6,20 +6,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>>                       file://iwevent.c;beginline=59;endline=72;md5=d66a10026d4394f0a5b1c5587bce4537 \
>>                       file://sample_enc.c;beginline=1;endline=4;md5=838372be07874260b566bae2f6ed33b6"
>>  SECTION = "base"
>> -PE = "1"
>> -PR = "r4"
>>
>> -SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.29.tar.gz \
>> -        file://remove.ldconfig.call.patch \
>> -        file://man.patch \
>> -        file://wireless-tools.if-pre-up \
>> -        file://zzz-wireless.if-pre-up \
>> -        file://avoid_strip.patch \
>> -        file://ldflags.patch"
>> +SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.${PV}.tar.gz \
>> +           file://wireless-tools.if-pre-up \
>> +           file://zzz-wireless.if-pre-up \
>> +           file://remove.ldconfig.call.patch \
>> +           file://man.patch \
>> +           file://avoid_strip.patch \
>> +           file://ldflags.patch \
>> +       "
>> +SRC_URI[md5sum] = "ca91ba7c7eff9bfff6926b1a34a4697d"
>> +SRC_URI[sha256sum] = "abd9c5c98abf1fdd11892ac2f8a56737544fe101e1be27c6241a564948f34c63"
>>
>> -SRC_URI[md5sum] = "e06c222e186f7cc013fd272d023710cb"
>> -SRC_URI[sha256sum] = "6fb80935fe208538131ce2c4178221bab1078a1656306bce8909c19887e2e5a1"
>> -S = "${WORKDIR}/wireless_tools.29"
>> +S = "${WORKDIR}/wireless_tools.30"
>>
>>  CFLAGS =+ "-I${S}"
>>  EXTRA_OEMAKE = "-e 'BUILD_SHARED=y' \
>> @@ -29,7 +28,8 @@ EXTRA_OEMAKE = "-e 'BUILD_SHARED=y' \
>>               'INSTALL_MAN=${D}${mandir}'"
>>
>>  do_compile() {
>> -     oe_runmake all libiw.a
>> +     oe_runmake libiw.a
>> +     oe_runmake all
>>  }
>
> Why the change to do_compile?

Oh, I was earlier testing this while trying to remove static libraries
all together, I dont think it matters as much for fixing anything
else, let me test it out and undo it

>
> Cheers,
>
> Richard
>
>

