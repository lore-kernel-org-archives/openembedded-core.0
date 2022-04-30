Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834E9C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 02:55:14 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.18434.1651287304806133827
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 19:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=hf+2JbLT;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 134.134.136.20, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651287304; x=1682823304;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=yDx3dohuzJ02K8Osx0ZFRW8faDEifchoKZjM4qci07Y=;
  b=hf+2JbLTwkqkU5ssQ/4rZ/QA70KGZkZFak1S/Ux1pTlxxaQwVnH++GF0
   DoVNvdGmiZr5Yx9OwSNUbT5XXgsgAoMhBZaptYixrzGQFxjPmS0Q9EhHY
   wXOwolUxa3rt3OJTZStxi+7j/Xk6pM7ApOWhGwjv6cG5yaXbKxE41Kwu8
   XQwP1tnaJrrUzYWB0SFbjC8ZFx+s13Zn7AzVzmdAEBg0lizFlyRSjQuV0
   5rv6GB0xoGv4Flt3iX5pnZRvYAxqWGpLv17UVVeWoJQM+pq5k7dkUPyt2
   CekRwL63NQRyEv12aYQ4PIEMc9O7K1MbpglCQbAyg6qEX4ccXCI76rJGS
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="254219890"
X-IronPort-AV: E=Sophos;i="5.91,187,1647327600";
   d="scan'208";a="254219890"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 19:55:03 -0700
X-IronPort-AV: E=Sophos;i="5.91,187,1647327600";
   d="scan'208";a="560690823"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.171.149])
 ([10.249.171.149])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 19:55:03 -0700
Message-ID: <422636e9-2273-7776-d8b9-8840592218b1@linux.intel.com>
Date: Sat, 30 Apr 2022 10:55:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core] [PATCH v2] base-passwd: Disable shell for default users
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220428094932.1411461-1-jiaqing.zhao@linux.intel.com>
 <45f20b28ba385221f04e0a157d7a6485c8233a04.camel@linuxfoundation.org>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: 
 <45f20b28ba385221f04e0a157d7a6485c8233a04.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Apr 2022 02:55:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165066

On 2022-04-29 20:22, Richard Purdie wrote:
> On Thu, 2022-04-28 at 17:49 +0800, Jiaqing Zhao wrote:
>> Change the shell of all global static users other than root (which
>> retains /bin/sh) and sync (as /bin/sync is rather harmless) to
>> /sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)
>>
>> Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-passwd/3.5.30]
>> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
>> ---
>> v2:
>> Fix indentation in bbfile.
>> ---
>>  .../base-passwd/disable-shell.patch           | 57 +++++++++++++++++++
>>  .../base-passwd/base-passwd_3.5.29.bb         |  1 +
>>  2 files changed, 58 insertions(+)
>>  create mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
>>
>> diff --git a/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch b/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
>> new file mode 100644
>> index 0000000000..dddc93ca35
>> --- /dev/null
>> +++ b/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
>> @@ -0,0 +1,57 @@
>> +From 91e0db96741359173ddf2be083aafcc1a3c32472 Mon Sep 17 00:00:00 2001
>> +From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
>> +Date: Mon, 18 Apr 2022 11:22:43 +0800
>> +Subject: [PATCH] Disable shell for default users
>> +
>> +Change the shell of all global static users other than root (which
>> +retains /bin/sh) and sync (as /bin/sync is rather harmless) to
>> +/sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)
>> +
>> +Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-passwd/3.5.30]
>> +Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
>> +---
>> + passwd.master | 32 ++++++++++++++++----------------
>> + 1 file changed, 16 insertions(+), 16 deletions(-)
>> +
>> +diff --git a/passwd.master b/passwd.master
>> +index e1c32ff..0cd5ffd 100644
>> +--- a/passwd.master
>> ++++ b/passwd.master
>> +@@ -1,18 +1,18 @@
>> + root::0:0:root:/root:/bin/sh
>> +-daemon:*:1:1:daemon:/usr/sbin:/bin/sh
>> +-bin:*:2:2:bin:/bin:/bin/sh
>> +-sys:*:3:3:sys:/dev:/bin/sh
>> ++daemon:*:1:1:daemon:/usr/sbin:/sbin/nologin
>> ++bin:*:2:2:bin:/bin:/sbin/nologin
>> ++sys:*:3:3:sys:/dev:/sbin/nologin
>> + sync:*:4:65534:sync:/bin:/bin/sync
>> +-games:*:5:60:games:/usr/games:/bin/sh
>> +-man:*:6:12:man:/var/cache/man:/bin/sh
>> +-lp:*:7:7:lp:/var/spool/lpd:/bin/sh
>> +-mail:*:8:8:mail:/var/mail:/bin/sh
>> +-news:*:9:9:news:/var/spool/news:/bin/sh
>> +-uucp:*:10:10:uucp:/var/spool/uucp:/bin/sh
>> +-proxy:*:13:13:proxy:/bin:/bin/sh
>> +-www-data:*:33:33:www-data:/var/www:/bin/sh
>> +-backup:*:34:34:backup:/var/backups:/bin/sh
>> +-list:*:38:38:Mailing List Manager:/var/list:/bin/sh
>> +-irc:*:39:39:ircd:/var/run/ircd:/bin/sh
>> +-gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
>> +-nobody:*:65534:65534:nobody:/nonexistent:/bin/sh
>> ++games:*:5:60:games:/usr/games:/sbin/nologin
>> ++man:*:6:12:man:/var/cache/man:/sbin/nologin
>> ++lp:*:7:7:lp:/var/spool/lpd:/sbin/nologin
>> ++mail:*:8:8:mail:/var/mail:/sbin/nologin
>> ++news:*:9:9:news:/var/spool/news:/sbin/nologin
>> ++uucp:*:10:10:uucp:/var/spool/uucp:/sbin/nologin
>> ++proxy:*:13:13:proxy:/bin:/sbin/nologin
>> ++www-data:*:33:33:www-data:/var/www:/sbin/nologin
>> ++backup:*:34:34:backup:/var/backups:/sbin/nologin
>> ++list:*:38:38:Mailing List Manager:/var/list:/sbin/nologin
>> ++irc:*:39:39:ircd:/var/run/ircd:/sbin/nologin
>> ++gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/sbin/nologin
>> ++nobody:*:65534:65534:nobody:/nonexistent:/sbin/nologin
>> +-- 
>> +2.32.0
>> +
>> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
>> index 9a27ad3ab5..ef7792ae49 100644
>> --- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
>> +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
>> @@ -14,6 +14,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
>>             file://input.patch \
>>             file://disable-docs.patch \
>>             file://kvm.patch \
>> +           file://disable-shell.patch \
>>             "
>>  
>>  SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"
> 
> This change causes a couple of ptest regressions in sed and strace:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3185/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3432/steps/13/logs/stdio
> 
> Cheers,
> 
> Richard

The sed and sedtrace failed ptest as the script switches to user `nobody` and run the test, they cannot be performed after shell is disabled by default for user `nobody`. The patchset v3 fixes that issue. I've verified sed and strace ptests are passed in my local build. Please help run it in the yocto autobuilder as I don't have the permission.

Thanks,
Jiaqing

