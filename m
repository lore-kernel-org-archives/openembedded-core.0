Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE8EC4167B
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 10:31:28 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.10119.1670581877688127794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 02:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=dmO+1KQT;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1670581878;
  x=1702117878;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:mime-version;
  bh=hS5/FG40zwliAaI+fDOPhaBzxeLq8SkLBcs1jePgJms=;
  b=dmO+1KQTEeuJxLzwq49kdM+jy1qGQ2+5TKcOqAXxg7M90O+oXZtqEzLt
   D4VhTVbii2laUmtM95Obgqd+NShZcJ/KqFLFIfZI8XxwxeYuMesDGhC9E
   5xIm3Q4LeqewoKEkUw9CAAMElALhqNToC5TeN832Vik6l41f8GNf4Z5Lq
   vt99CeNwem4jhGGC8p0KHbDbgHa+W0kjGftZ439lJ2fsXhnYv33qRBUpX
   v+Hc+9PHlXosb20CjAiAU8bb+wsPdb+UFTst1IBf0v9H+6Yf8T6pppWxT
   GE4C8u0uR8xhbDe0GylU1wgoeZWFLG8ZVTnDEC6qw1R76TL1k6za0CrIJ
   g==;
References: <20221208071136.1967696-1-olani@axis.com>
 <20221208071136.1967696-4-olani@axis.com>
 <08c1f279-d446-bc7c-f01d-4ebfb1da51d8@gmail.com>
User-agent: mu4e 1.8.8; emacs 29.0.60
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
Date: Fri, 9 Dec 2022 10:55:16 +0100
Organization: Axis Communications AB
In-Reply-To: <08c1f279-d446-bc7c-f01d-4ebfb1da51d8@gmail.com>
Message-ID: <jwq5yekdg24.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 10:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174441


On Fri, Dec 09 2022, Khem Raj wrote:

> Thanks for the patches
>
> On 12/7/22 23:11, Ola x Nilsson wrote:
>> Signed-off-by: Ola x Nilsson <olani@axis.com>
>> ---
>>   meta/conf/distro/time64.conf | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>   create mode 100644 meta/conf/distro/time64.conf
>> 
>> diff --git a/meta/conf/distro/time64.conf b/meta/conf/distro/time64.conf
>> new file mode 100644
>> index 0000000000..99eb06dc0f
>> --- /dev/null
>> +++ b/meta/conf/distro/time64.conf
>> @@ -0,0 +1,23 @@
>> +GLIBC_64BIT_TIME_FLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
>> +
>> +# TODO: Only for 32-bit architectures?
>> +TARGET_CC_ARCH:append:arm = " ${GLIBC_64BIT_TIME_FLAGS}"
>> +TARGET_CC_ARCH:append:armeb = " ${GLIBC_64BIT_TIME_FLAGS}"
>> +TARGET_CC_ARCH:append:mips32el = " ${GLIBC_64BIT_TIME_FLAGS}"
>
> We should enable it across all 32bit systems
> something like
>
> TARGET_CC_ARCH += "${@'-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64' if 
> d.getVar('SITEINFO_BITS') == '32' else ''}"
>
> would do it.

I was looking for a way to identify 32-bit platforms but did not find
SITEINFO_BITS.  I'll look into using that instead.

> Also adding -D_LARGEFILE_SOURCE will ensure needed functions that LFS 
> needs is enabled as well, usually its automatically defined when 
> -D_GNU_SOURCE is set but that may not be case all the time.

As far as I can tell, _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE are
independent of _TIME_BITS=64 and _FILE_OFFSET_BITS=64 (while
_TIME_BITS=64 requiress _FILE_OFFSET_BITS=64).

I thought the _LARGEFILE* options were controlled by the largefile
DISTRO_FEATURE but there seems to be some confusion about that.

It looks like you (Khem) made largefile default instead of using the
distro feature in all of the OE-core recipes, and the largefile distro
feature is no longer mentioned in docs.  It is mentioned as removed in
the transition notes.  But it is still in poky-tiny.conf and
POKY_DEFAULT_DISTRO_FEATURES.  Probably an oversight?

I do not see the _LARGEFILE*_SOURCE options defined globally anywhere.

Am I missing something?

>> +
>> +GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
>> +GLIBC_64BIT_TIME_FLAGS:pn-glibc-tests = ""
>> +# pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
>> +# both 32 and 64 bit file APIs.  But it does not handle the time side?
>> +# Needs further investigation
>> +GLIBC_64BIT_TIME_FLAGS:pn-pipewire = ""
>> +GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
>> +
>> +INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf_lib_libstd.so]
>> = "clock_gettime gettime fcntl fstat64 fstatat64 getsockopt ioctl
>> lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64"
>> +INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] = "fcntl fstat64 prctl stat64 clock_gettime"
>> +INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] = "fcntl lstat64
>> setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm
>> fstatat64 prctl mktime gmtime_r recvmsg stat64 clock_gettime
>> localtime_r"
>> +
>> +# libpulsedsp.so is a preload-library that hooks libc functions
>> +INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] = "setsockopt fcntl"
>> +
>> +
>> 

-- 
Ola x Nilsson

