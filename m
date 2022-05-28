Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59294C433F5
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 12:44:16 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.14523.1653741852221831709
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 May 2022 05:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=by4zldrn;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 192.55.52.136, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653741852; x=1685277852;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tXZ1KjyAmYx40LJtnpozkmTsTM5kYtwRcbuUXLBg1JI=;
  b=by4zldrnlOH1HijVW0WjgrghTIQZ2CCdEGSvQ7W9GOcsV2E2v72MemiC
   /FgL/4kDh1wSNlSbEYXufuyQR+DwgZ0havsa+mhiRF+KNq6v7LQzDvVoH
   y1MzbefYp2aLaPmq6ES2azqz+eOOrj65lAZ2MCwXL0V3yqyGrvuMvtjLS
   77yEngEz6fXAsPJlm3i6DZW68VJZ7TrFaptcFfjeErqT3N/0tvMo7NbV/
   M+kdIhBhhMiIAkOnrSNvlAO0XhQDnhmuPn85j/pA9HoZxwxN6hd4FbcLu
   7K1SWUzs1KO+A/oy+c8ZhlDQxDu4eOG2eTFuH9O+pR+4LgNRkxxU15LaL
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10360"; a="254545686"
X-IronPort-AV: E=Sophos;i="5.91,258,1647327600";
   d="scan'208";a="254545686"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2022 05:44:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,258,1647327600";
   d="scan'208";a="604394646"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.173.202])
 ([10.249.173.202])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2022 05:44:08 -0700
Message-ID: <3346eae8-a3c5-3f98-9e51-fccb3ba573aa@linux.intel.com>
Date: Sat, 28 May 2022 20:43:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe-core] [PATCH] systemd: Correct
 0001-pass-correct-parameters-to-getdents64.patch
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <20220523133419.2216713-1-jiaqing.zhao@linux.intel.com>
 <CANNYZj-Mvf2vCdMQipyhPxnfBxB-rLniGBhckkj8ELOc+ZvLQA@mail.gmail.com>
 <37b2c6e6-6f5a-ea40-2349-b03f1d5599d1@linux.intel.com>
 <CAMKF1spzgWPD0HZLR9sbtffgF0WFD64VMjGmEzB9UQ4Tgu=JeQ@mail.gmail.com>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: 
 <CAMKF1spzgWPD0HZLR9sbtffgF0WFD64VMjGmEzB9UQ4Tgu=JeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 May 2022 12:44:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166227

On 2022-05-24 00:22, Khem Raj wrote:
> On Mon, May 23, 2022 at 7:21 AM Jiaqing Zhao
> <jiaqing.zhao@linux.intel.com> wrote:
>>
>> It's an musl-specific issue I believe.
>>
>> man page defines it as [1]
>>         ssize_t getdents64(int fd, void *dirp, size_t count)
>>
>> But in musl, it's an alias of getdents [2]
>>         int getdents(int fd, struct dirent *buf, size_t len)
>>
>> Shall we report to musl instead of systemd?
>>
>> [1] https://man7.org/linux/man-pages/man2/getdents.2.html
>> [2] https://elixir.bootlin.com/musl/v1.2.3/source/src/linux/getdents.c
>>
> 
> I think it is worth reporting at both places.
> 
> Here the data buffer is filled with packed dirent
> structures, not regular dirent structure, therefore a void* argument
> like glibc is doing
> probably makes more sense. But we have to reason it with musl community as well.

musl community replied me the reason they made getdents64 an alias of getdents at
https://www.openwall.com/lists/musl/2022/05/24/5

While systemd community will absolutely ignore this issue as it's musl-specific,
systemd only focuses on glibc.
https://github.com/systemd/systemd/blob/01ae74c8c7f364dd3a1d71a43af00c34f531d3f7/docs/CODING_STYLE.md?plain=1#L200

>> On 2022-05-23 21:59, Alexander Kanavin wrote:
>>> Inappropriate still means the issue needs to be reported to upstream,
>>> can you do this please?
>>>
>>> Alex
>>>
>>> On Mon, 23 May 2022 at 15:34, Jiaqing Zhao <jiaqing.zhao@linux.intel.com> wrote:
>>>>
>>>> Current patch removes the uint8_t* cast in src/basic/recurse-dir.c:57
>>>> to fix musl build, but it changes the value here as pointer arithmetic
>>>> is type-depended in C. This patch corrects the behavior by adding an
>>>> extra cast to struct dirent*.
>>>>
>>>> Also changes the patch's Upstream-Status to Inappropriate as it's musl-
>>>> specific.
>>>>
>>>> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
>>>> ---
>>>>  ...0001-pass-correct-parameters-to-getdents64.patch | 13 ++++++++-----
>>>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
>>>> index 028f50b243..9ebff9825a 100644
>>>> --- a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
>>>> +++ b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
>>>> @@ -1,4 +1,4 @@
>>>> -From 8c8899b4641125cfe8e7baee32e5c5f452545d2c Mon Sep 17 00:00:00 2001
>>>> +From dab02796780f00d689cc1c7a0ba81abe7c5f28d0 Mon Sep 17 00:00:00 2001
>>>>  From: Khem Raj <raj.khem@gmail.com>
>>>>  Date: Fri, 21 Jan 2022 15:15:11 -0800
>>>>  Subject: [PATCH] pass correct parameters to getdents64
>>>> @@ -12,16 +12,16 @@ Fixes
>>>>          n = getdents64(fd, &buffer, sizeof(buffer));
>>>>                             ^~~~~~~
>>>>
>>>> -Upstream-Status: Pending
>>>> +Upstream-Status: Inappropriate [musl specific]
>>>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> -
>>>> +Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
>>>>  ---
>>>>   src/basic/recurse-dir.c | 2 +-
>>>>   src/basic/stat-util.c   | 2 +-
>>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>>  diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
>>>> -index efa1797b7b..797285e3be 100644
>>>> +index efa1797b7b..03ff10ebe9 100644
>>>>  --- a/src/basic/recurse-dir.c
>>>>  +++ b/src/basic/recurse-dir.c
>>>>  @@ -54,7 +54,7 @@ int readdir_all(int dir_fd,
>>>> @@ -29,7 +29,7 @@ index efa1797b7b..797285e3be 100644
>>>>                   assert(bs > de->buffer_size);
>>>>
>>>>  -                n = getdents64(dir_fd, (uint8_t*) de->buffer + de->buffer_size, bs - de->buffer_size);
>>>> -+                n = getdents64(dir_fd, de->buffer + de->buffer_size, bs - de->buffer_size);
>>>> ++                n = getdents64(dir_fd, (struct dirent*)((uint8_t*) de->buffer + de->buffer_size), bs - de->buffer_size);
>>>>                   if (n < 0)
>>>>                           return -errno;
>>>>                   if (n == 0)
>>>> @@ -46,3 +46,6 @@ index c2269844f8..7cd6c7fa42 100644
>>>>           if (n < 0)
>>>>                   return -errno;
>>>>
>>>> +--
>>>> +2.34.1
>>>> +
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#166033): https://lists.openembedded.org/g/openembedded-core/message/166033
>> Mute This Topic: https://lists.openembedded.org/mt/91288052/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

