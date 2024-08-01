Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1DEC3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 17:08:29 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.73743.1722532108188792412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 10:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=0jKHcWBW;
 spf=pass (domain: baylibre.com, ip: 209.85.166.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-81fbbd4775bso140316239f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722532107; x=1723136907; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MwFZ9CF/je4efb5ZJA2ioI3x2DdxvBsTXLYFUzwlW/s=;
        b=0jKHcWBWP8225CmaX1/MvfuzYZvOmN48n85Z6/F2pDiYpLUqTkSH9VanpChLRSlUaF
         e/f381YxMqzJBdAFi6txCxpyFfmRa7piSx0PG0vV479VXREHCOrOwN4g7QNFtjRBjDTa
         J3fxe+ParowZeRQ95ALd7Ewx0H9lH9cKX9SwvtBXJmI/tmyIEwCrusimea7ub79qZTt8
         ARZhP9n/5FPxuxW1UyBZeCH8HzgdyRebvOsvyMzJOP99gjdRZU44jQNCEKfoIx7+BqbR
         tE/Hk76gmluemetTNmS/EYxmAD/vkLQFOlj8lz2KM7R/Wl2yh6N8N5amLkbIE4gSdCdE
         W/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722532107; x=1723136907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MwFZ9CF/je4efb5ZJA2ioI3x2DdxvBsTXLYFUzwlW/s=;
        b=k50ym1vYvGS/AEjnrgCpUGin3br5VXKLdc5JWOQJBe/4d1CRjXEi5+aDNZhKZdfZVO
         rKU/eEaiKL9JbsdEt8EJd4BhNLxQZMRQYizz6QR5iLeTumONsPTIiX6dyP/FzIxgFzVG
         +o/k3p+jVg0OXOa1jRDCos2S7tZUIXICQ6ureQYpEUwkVL5YN874wgdXuLImySup3yRP
         6up6y0cOHsNAFkLNUf1w+4/QvIuAud1X8559qqsXPw1T0jdh4mkZudaEsS3219aXzKob
         MaOAe9L3wprsocAaI5zYO74vhCnhIVkHoYo6UUgDRE/Dsh3ee/jtX9IcENuJZwAW4nqb
         sP4A==
X-Gm-Message-State: AOJu0Yw32o764xhIdciQ3v0/1y4Qzvl922vTHzCC0Ajjez2g1xj42gZ9
	toKUOWqaluR1eH/7DlZRzFS87YLtDmSH8ufgT11X+J/wRCUFt7uRBr2Rjuhm4/amKbBt+oZjoF0
	r
X-Google-Smtp-Source: AGHT+IHNtXIUs6A4/rwijdE4ZpLCmm5xBlS8AKHoklK/bCCS3SBP2FvE8fgtKnnfxilGMowC6ooHdA==
X-Received: by 2002:a05:6602:1683:b0:803:cc64:e0d4 with SMTP id ca18e2360f4ac-81fd4350067mr143203339f.3.1722532107063;
        Thu, 01 Aug 2024 10:08:27 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-81fd4d71ec8sm6156139f.44.2024.08.01.10.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 10:08:26 -0700 (PDT)
Message-ID: <bdbfaef0-c88b-486c-b8bd-b517e5a2cce6@baylibre.com>
Date: Thu, 1 Aug 2024 13:08:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] kea: upgrade 2.4.1 -> 2.7.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240801153419.3011935-1-tgamblin@baylibre.com>
 <CANNYZj8XjyadwqTUnPe9=K9hOC3aUx2eHyxQQsYtETPXup0jxw@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj8XjyadwqTUnPe9=K9hOC3aUx2eHyxQQsYtETPXup0jxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 17:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202760


On 2024-08-01 12:45 p.m., Alexander Kanavin wrote:
> 2.7.1 can't be accepted as it is a development version, and the
> automated version check/upgrade should have given you the latest
> stable (2.6.1).

Thanks for the heads-up. Noticed an issue with my TMPDIR workaround too, 
so I'll resubmit for the correct version.

Trevor

>
>
> Alex
>
> On Thu, 1 Aug 2024 at 17:34, Trevor Gamblin via lists.openembedded.org
> <tgamblin=baylibre.com@lists.openembedded.org> wrote:
>> Refresh patch 'fix_pid_keactrl.patch' to apply on new version.
>>
>> Add an extra sed call to do_install:append() to remove a reference to
>> TMPDIR from ${D}/usr/sbin/kea-admin.
>>
>> License-Update: Update copyright year
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   .../kea/files/fix_pid_keactrl.patch            | 18 ++++++++++++------
>>   .../kea/{kea_2.4.1.bb => kea_2.7.1.bb}         |  5 +++--
>>   2 files changed, 15 insertions(+), 8 deletions(-)
>>   rename meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.7.1.bb} (93%)
>>
>> diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
>> index 63a6a2805b..98400212a5 100644
>> --- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
>> +++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
>> @@ -1,4 +1,4 @@
>> -From c878a356712606549f7f188b62f7d1cae08a176e Mon Sep 17 00:00:00 2001
>> +From 18f84773f992c64e07fb82949552e38a01aace4e Mon Sep 17 00:00:00 2001
>>   From: Armin kuster <akuster808@gmail.com>
>>   Date: Wed, 14 Oct 2020 22:48:31 -0700
>>   Subject: [PATCH] Busybox does not support ps -p so use pgrep
>> @@ -8,22 +8,28 @@ Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
>>
>>   Signed-off-by: Armin kuster <akuster808@gmail.com>
>>
>> +Refresh to apply on top of 2.7.1.
>> +
>> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>>   ---
>>    src/bin/keactrl/keactrl.in | 4 ++--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>
>>   diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
>> -index 450e997..c353ca9 100644
>> +index a7cf355630..c3565f7204 100644
>>   --- a/src/bin/keactrl/keactrl.in
>>   +++ b/src/bin/keactrl/keactrl.in
>> -@@ -149,8 +149,8 @@ check_running() {
>> +@@ -152,8 +152,8 @@ check_running() {
>>        # Get the PID from the PID file (if it exists)
>>        get_pid_from_file "${proc_name}"
>> -     if [ ${_pid} -gt 0 ]; then
>> +     if [ "${_pid}" -gt 0 ]; then
>>   -        # Use ps to check if PID is alive
>> --        if ps -p ${_pid} 1>/dev/null; then
>> +-        if ps -p "${_pid}" 1>/dev/null; then
>>   +        # Use pgrep and grep to check if PID is alive
>> -+        if pgrep -v 1 | grep ${_pid} 1>/dev/null; then
>> ++        if pgrep -v 1 | grep "${_pid}" 1>/dev/null; then
>>                # No error, so PID IS ALIVE
>>                _running=1
>>            fi
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.7.1.bb
>> similarity index 93%
>> rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
>> rename to meta/recipes-connectivity/kea/kea_2.7.1.bb
>> index 19309ce314..228d2fff34 100644
>> --- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
>> +++ b/meta/recipes-connectivity/kea/kea_2.7.1.bb
>> @@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
>>   HOMEPAGE = "http://kea.isc.org"
>>   SECTION = "connectivity"
>>   LICENSE = "MPL-2.0"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=618093ea9de92c70a115268c1d53421f"
>>
>>   DEPENDS = "boost log4cplus openssl"
>>
>> @@ -18,7 +18,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
>>              file://fix_pid_keactrl.patch \
>>              file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
>>              "
>> -SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
>> +SRC_URI[sha256sum] = "036bdfcc8b815199dc7c1d0edff01a1057462771b8c4bcc2f323c32bddf1bd5c"
>>
>>   inherit autotools systemd update-rc.d upstream-version-is-even
>>
>> @@ -64,6 +64,7 @@ do_install:append() {
>>       sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
>>              -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
>>              ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
>> +    sed -i "s:${B}/../kea-2.7.1::g" ${D}/usr/sbin/kea-admin
>>   }
>>
>>   do_install:append() {
>> --
>> 2.39.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#202758): https://lists.openembedded.org/g/openembedded-core/message/202758
>> Mute This Topic: https://lists.openembedded.org/mt/107668433/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

