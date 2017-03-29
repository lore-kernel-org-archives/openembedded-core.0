Return-Path: <spopovyc@cisco.com>
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0BBFF77C0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 11:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=5475; q=dns/txt; s=iport;
	t=1490786850; x=1491996450;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=PwTr3r643EHtdUFRLL1n7T4ZxsoluBYoQ+br1ertO3Y=;
	b=SmF8kBoKzNW3vdwdtIgfYpQ76alDIrQhU/+zoD+ku9B6TJE8d1s/kOWB
	phXK8wC24Cqds4v4LcYO1mSHY4H4qUIpfULlS9Rsy7XnPQRBv+sznukEv
	7MVClA+ZWredS1Owm9mw+Nl3OVQHNQARDAVQd/+R6l7jU8Z2cAotXzlHu E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CpAQAomdtY/xbLJq1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBhDaBC4NiihFzkF2NDoYxgg+CDiKGAAKDcxgBAgEBAQEBAQFrKIU?=
	=?us-ascii?q?VAQEBAQIBI1sLCxEBAgECAQICJgICPQwGCAYBDAYCAQGJeQUIrW+CJopJAQEBA?=
	=?us-ascii?q?QEBAQEBAQEBAQEBASKBC4VDggWBQIEqh1qCXwWJFweGQ3xRizKGfYtTglCOY0i?=
	=?us-ascii?q?TIh84gQQ6HxWFGR0ZgU09NYk2AQEB?=
X-IronPort-AV: E=Sophos;i="5.36,241,1486425600"; d="scan'208";a="650757921"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2017 11:27:28 +0000
Received: from tuxracer.local ([10.61.218.101]) (authenticated bits=0)
	by aer-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id v2TBRRnu002084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 29 Mar 2017 11:27:27 GMT
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <4713eca3e627fb1bececc59af252a0768c955d11.1490727266.git.spopovyc@cisco.com>
	<1490739984.13980.294.camel@linuxfoundation.org>
From: Serhii Popovych <spopovyc@cisco.com>
Message-ID: <80bc0ce9-3e83-864d-7f94-ed80b4f0cc79@cisco.com>
Date: Wed, 29 Mar 2017 14:27:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490739984.13980.294.camel@linuxfoundation.org>
X-Authenticated-User: spopovyc
Subject: Re: [PATCH] glibc: Support building with 2.6.32 kernels on x86 / x86_64
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
X-List-Received-Date: Wed, 29 Mar 2017 11:27:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


> On Tue, 2017-03-28 at 18:57 +0000, Serhii Popovych wrote:
>> While glibc states that 2.6.32 kernels still supported
>> for x86 / x86_64 builds are failing due to out of date
>> LIBC_LINUX_VERSION macro checks for such architectures.
>>
>> This macro statically defined to 3.2.0 with commit 5b4ecd3
>> (Require Linux 3.2 except on x86 / x86_64, 3.2 headers everywhere.)
>> and additionally checked before --enable-kernel.
>>
>> Since both --enable-kernel and LIBC_LINUX_VERSION checks
>> are the same and there is no users of last one we can
>> safely get rid of it enabling glibc builds with 2.6.32
>> kernel headers.
>>
>> Also add --enable-kernel to glibc-initial build so that we
>> build it correctly with old headers.
>>
>> Cc: XE-Linux <xe-linux-external@cisco.com>
>> Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
>> ---
>>  meta/recipes-core/glibc/glibc-initial.inc          |   1 +
>>  .../glibc/0028-Kill-LIBC_LINUX_VERSION-macro.patch | 113
>> +++++++++++++++++++++
>>  meta/recipes-core/glibc/glibc_2.25.bb              |   1 +
>>  3 files changed, 115 insertions(+)
>>  create mode 100644 meta/recipes-core/glibc/glibc/0028-Kill-
>> LIBC_LINUX_VERSION-macro.patch
>>
>> diff --git a/meta/recipes-core/glibc/glibc-initial.inc
>> b/meta/recipes-core/glibc/glibc-initial.inc
>> index f94603c..60b25dd 100644
>> --- a/meta/recipes-core/glibc/glibc-initial.inc
>> +++ b/meta/recipes-core/glibc/glibc-initial.inc
>> @@ -12,6 +12,7 @@ do_configure () {
>>  	find ${S} -name "configure" | xargs touch
>>  	cfgscript=`python3 -c "import os;
>> print(os.path.relpath('${S}', '.'))"`/configure
>>  	$cfgscript --host=${TARGET_SYS} --build=${BUILD_SYS} \
>> +		--enable-kernel=${OLDEST_KERNEL} \
>>  		--prefix=/usr \
>>  		--without-cvs --disable-sanity-checks \
>>  		--with-headers=${STAGING_DIR_TARGET}${includedir} \
>> diff --git a/meta/recipes-core/glibc/glibc/0028-Kill-
>> LIBC_LINUX_VERSION-macro.patch b/meta/recipes-core/glibc/glibc/0028-
>> Kill-LIBC_LINUX_VERSION-macro.patch
>> new file mode 100644
>> index 0000000..f5eaf1c
>> --- /dev/null
>> +++ b/meta/recipes-core/glibc/glibc/0028-Kill-LIBC_LINUX_VERSION-
>> macro.patch
>> @@ -0,0 +1,113 @@
>> +From 88f83e4b5a8929dac9095ed264700fcb62d5e4dd Mon Sep 17 00:00:00
>> 2001
>> +From: Serhii Popovych <spopovyc@cisco.com>
>> +Date: Fri, 17 Mar 2017 15:48:34 +0000
>> +Subject: Kill LIBC_LINUX_VERSION macro
>> +
>> +After commit 5b4ecd3 (Require Linux 3.2 except on x86 / x86_64,
>> +3.2 headers everywhere.) minimal kernel version raised from
>> +2.6.32 to 3.2.0 for all architectures except x86 and x86_64
>> +unless newer already used for architecture.
>> +
>> +However LIBC_LINUX_VERSION macro still is in effect and fails
>> +configure even with --enable-kernel=2.6.32.
>> +
>> +While it is present in configure.ac it does not affect anything
>> +except LINUX_VERSION_CODE check which already performed by
>> +--enable-kernel.
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
>> +---
>> + sysdeps/unix/sysv/linux/configure    | 39 -----------------------
>> -------------
>> + sysdeps/unix/sysv/linux/configure.ac | 21 -------------------
>> + 2 files changed, 60 deletions(-)
>> +
>> +diff --git a/sysdeps/unix/sysv/linux/configure
>> b/sysdeps/unix/sysv/linux/configure
> 
> This is presumably a generated file. We should only patch configure.ac
> as otherwise the potential timestamp differences between these can
> cause problems (we've been burnt before). The configure version will
> get updated when we reautoconf.

Yes thats true, but I get following

| running configure fragment for sysdeps/unix/sysv/linux
| checking installed Linux kernel header files... missing or too old!
| configure: error: GNU libc requires kernel header files from
| Linux 3.2.0 or later to be installed before configuring.
| The kernel header files are found usually in /usr/include/asm and
| /usr/include/linux; make sure these directories use files from
| Linux 3.2.0 or later.  This check uses <linux/version.h>, so
| make sure that file was built correctly when installing the kernel header
| files.  To use kernel headers not from /usr/include/linux, use the
| configure option --with-headers.
| WARNING:
/home/spopovyc/oe/build-oe/tmp-glibc/work/x86_64-nativesdk-oesdk-linux/nativesdk-glibc-initial/2.25-r0/temp/run.do_configure.58685:1
exit 1 from '$cfgscript --host=x86_64-oesdk-linux --build=x86_64-linux
--enable-kernel=2.6.32 --prefix=/usr --without-cvs
--disable-sanity-checks
--with-headers=/home/spopovyc/oe/build-oe/tmp-glibc/work/x86_64-nativesdk-oesdk-linux/nativesdk-glibc-initial/2.25-r0/recipe-sysroot/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/include
--enable-hacker-mode --enable-addons'
| ERROR: Function failed: do_configure (log file is located at
/home/spopovyc/oe/build-oe/tmp-glibc/work/x86_64-nativesdk-oesdk-linux/nativesdk-glibc-initial/2.25-r0/temp/log.do_configure.58685)

When patching only configure.ac and by looking at configure
I see it wasn't recreated from changes in confiugre.ac

and by looking at glibc-initial/glibc recipes i see that
do_configure() task is overwritten to not to call autoreconf,
so I think patching configure is correct here.

Also I found few more patches in glibc directory that patch
both configure and configure.ac.

Thanks,
Serhii

> 
> Cheers,
> 
> Richard
> 

