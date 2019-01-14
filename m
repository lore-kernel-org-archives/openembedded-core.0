Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5AEFE7BFF6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 17:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=5165; q=dns/txt; s=iport;
	t=1547487625; x=1548697225;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=l6ibpl1+rGw9fI3QwK7gct0H/7meR2aZpquydklp1Pg=;
	b=gG2d6LAEISHRvfy0Z+uSKsfAjGlcoDlNgsyYJSnS2aTjXX0d5EigIG1s
	80Y0o5+yba4764eSGX/dmfbiRMv7UwVVqCU6OO9QgJkOhk9RkqYrT0Jqm
	NS2nCCQXUro0TxIEWnCV5zm2SUWtyWRLnlT3TZYfoN9p/kdwT0Kutgvn3 8=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0APAACCyDxc/xbLJq1jGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAQGBVAEBAQEBAQsBgmmBAieEAYh5jG4tmXcLAQEbhFECgmE?=
	=?us-ascii?q?3Bg0BAwEBAgEBAm0cDIVKAQEBBCMVQRALEQMBAgECAiYCAk8IBg0GAgEBgx4?=
	=?us-ascii?q?BggGtUIEvhUKEYhR3i0uBQD+BESeCa4gKglcCkESQZloJhxyKZgYYgjGHaYd?=
	=?us-ascii?q?lmkUCERSBXCKBVjMaCBsVgycJgh4Xgm2LMz0DMIpfAQE?=
X-IronPort-AV: E=Sophos;i="5.56,478,1539648000"; 
   d="scan'208";a="9438783"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jan 2019 17:40:23 +0000
Received: from [10.63.15.135] ([10.63.15.135]) (authenticated bits=0)
	by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTPSA id x0EHeMwJ018638
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 14 Jan 2019 17:40:23 GMT
To: Khem Raj <raj.khem@gmail.com>
References: <1545421530-7972-1-git-send-email-rbilovol@cisco.com>
	<CAMKF1srqgrtC2bNZM30CVSwRHV+uKtXpNCDg2xaT7jJ0f0sTLw@mail.gmail.com>
From: Ruslan Bilovol <rbilovol@cisco.com>
Message-ID: <a8c2fc61-6b0f-6e33-a7f6-aedc169bbd6a@cisco.com>
Date: Mon, 14 Jan 2019 19:40:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srqgrtC2bNZM30CVSwRHV+uKtXpNCDg2xaT7jJ0f0sTLw@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: rbilovol
X-Outbound-SMTP-Client: 10.63.15.135, [10.63.15.135]
X-Outbound-Node: aer-core-2.cisco.com
Cc: XE-Linux <xe-linux-external@cisco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] systemd: fix remaining issues with statx and glibc 2.28+
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
X-List-Received-Date: Mon, 14 Jan 2019 17:40:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Chen,

Will you pick up this fix? Still don't see it in the master-next

Thanks,
Ruslan

On 12/22/18 1:48 AM, Khem Raj wrote:
> On Fri, Dec 21, 2018 at 11:45 AM Ruslan Bilovol <rbilovol@cisco.com> wrote:
>>
>> Commit 776d14db9589 "systemd: Detect if statx struct is
>> defined in sys/stat.h" did only a part of work, and systemd
>> build fails on src/basic/chattr-util.c compilation due to
>> same statx redefinition issue.
>> Backport additional patch from systemd master
>>
> 
> 
> LGTM
> 
>> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
>> ---
>>
>> v3: rebased to recent OE master (again)
>>
>> v2: rebased to recent OE master, added signoff
>>
>>   ...-linux-stat.h-check-with-other-checks-and.patch | 78 ++++++++++++++++++++++
>>   meta/recipes-core/systemd/systemd_239.bb           |  1 +
>>   2 files changed, 79 insertions(+)
>>   create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch
>>
>> diff --git a/meta/recipes-core/systemd/systemd/0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch b/meta/recipes-core/systemd/systemd/0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch
>> new file mode 100644
>> index 0000000..0db7fce
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch
>> @@ -0,0 +1,78 @@
>> +From 9c869d08d82c73f62ab3527567858ce4b0cf1257 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
>> +Date: Wed, 18 Jul 2018 17:26:17 +0200
>> +Subject: [PATCH] meson: unify linux/stat.h check with other checks and use
>> + _GNU_SOURCE
>> +
>> +Using _GNU_SOURCE is better because that's how we include the headers in the
>> +actual build, and some headers define different stuff when it is defined.
>> +sys/stat.h for example defines 'struct statx' conditionally.
>> +
>> +Upstream-Status: Backport
>> +
>> +Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
>> +---
>> + meson.build         | 20 ++++++++++++++------
>> + src/basic/missing.h |  2 +-
>> + 2 files changed, 15 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/meson.build b/meson.build
>> +index 68423bd..99035d2 100644
>> +--- a/meson.build
>> ++++ b/meson.build
>> +@@ -421,11 +421,9 @@ decl_headers = '''
>> + #include <uchar.h>
>> + #include <linux/ethtool.h>
>> + #include <linux/fib_rules.h>
>> +-#include <linux/stat.h>
>> + #include <sys/stat.h>
>> + '''
>> + # FIXME: key_serial_t is only defined in keyutils.h, this is bound to fail
>> +-# FIXME: these should use -D_GNU_SOURCE, since that is defined at build time
>> +
>> + foreach decl : ['char16_t',
>> +                 'char32_t',
>> +@@ -436,13 +434,23 @@ foreach decl : ['char16_t',
>> +                ]
>> +
>> +         # We get -1 if the size cannot be determined
>> +-        have = cc.sizeof(decl, prefix : decl_headers) > 0
>> ++        have = cc.sizeof(decl, prefix : decl_headers, args : '-D_GNU_SOURCE') > 0
>> ++
>> ++        if decl == 'struct statx'
>> ++                if have
>> ++                        want_linux_stat_h = false
>> ++                else
>> ++                        have = cc.sizeof(decl,
>> ++                                         prefix : decl_headers + '#include <linux/stat.h>',
>> ++                                         args : '-D_GNU_SOURCE') > 0
>> ++                        want_linux_stat_h = have
>> ++                endif
>> ++        endif
>> ++
>> +         conf.set10('HAVE_' + decl.underscorify().to_upper(), have)
>> + endforeach
>> +
>> +-conf.set10('HAVE_STRUCT_STATX_IN_SYS_STAT_H', cc.sizeof('struct statx', prefix : '''
>> +-#include <sys/stat.h>
>> +-''', args : '-D_GNU_SOURCE') > 0)
>> ++conf.set10('WANT_LINUX_STAT_H', want_linux_stat_h)
>> +
>> + foreach decl : [['IFLA_INET6_ADDR_GEN_MODE',         'linux/if_link.h'],
>> +                 ['IN6_ADDR_GEN_MODE_STABLE_PRIVACY', 'linux/if_link.h'],
>> +diff --git a/src/basic/missing.h b/src/basic/missing.h
>> +index 14ad3d4..9044683 100644
>> +--- a/src/basic/missing.h
>> ++++ b/src/basic/missing.h
>> +@@ -24,7 +24,7 @@
>> + #include <uchar.h>
>> + #include <unistd.h>
>> +
>> +-#if !HAVE_STRUCT_STATX_IN_SYS_STAT_H
>> ++#if WANT_LINUX_STAT_H
>> + #include <linux/stat.h>
>> + #endif
>> +
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
>> index 03acce2..91a026d 100644
>> --- a/meta/recipes-core/systemd/systemd_239.bb
>> +++ b/meta/recipes-core/systemd/systemd_239.bb
>> @@ -37,6 +37,7 @@ SRC_URI += "file://touchscreen.rules \
>>              file://0001-timesync-changes-type-of-drift_freq-to-int64_t.patch \
>>              file://0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch \
>>              file://0002-core-Fix-use-after-free-case-in-load_from_path.patch \
>> +           file://0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch \
>>              "
>>
>>   # patches made for musl are only applied on TCLIBC is musl
>> --
>> 1.9.1
>>

