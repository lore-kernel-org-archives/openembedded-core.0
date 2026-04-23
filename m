Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CCCF9934B
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 07:40:18 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14493.1776930016946717137
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 00:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RflCsBAW;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so78224725e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 00:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776930015; x=1777534815; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEMPC421b+Hw+FsCQK0o4xMuEX8e8W/ZcjM0a9l9yc8=;
        b=RflCsBAWZXNMau4aAZc0h1zYdcwmTwVCaL10a3hS/7Yk4NcrWpdQaWJr3hNIBHfGmz
         KTZez5lhiyMmuigs4LPTYpWIz9L269wVoXB105vhbVWUkfobYPC2JS5BtN6KQSLRSjGE
         jusQKMxNacJk6ITX9IZffh4K0EVJoqqVnS020=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776930015; x=1777534815;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vEMPC421b+Hw+FsCQK0o4xMuEX8e8W/ZcjM0a9l9yc8=;
        b=DsybpHXnD4O9T5Gj73RuAXQlWhXyk033j+P87M/OsLAJlhzW+ia0RBZj00M/qyKeKW
         U6/pQ6wwT9E3cq2XE8kF4eKbgtyY6MEhQRvLi9zhfxp7V3FkJfG9HTt18+7Fo5xpZ7SZ
         fmvPMWjJRG5uiN+uKJnEBbIsZLw0ogxVrVI71I41K2eEwPJeJ8VaqUbvW8ILQGOuU4SR
         mGBeS0IhiaB3G6nZTPY2vf/RZ0RyUfHIv8cH664G8vwg8OpTG79RJKrzsHM8HsNsmNHj
         fiApTFqQ3ujbdOKQujy+NK5eNHzmdLaXgTCovPv6JkfpicgIn0NVv/Mpqd/SDtXbXRFE
         PyaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rS/X3D3E+7NyITEJa5JhBX2Z55+LIo8Fweza2SBwf6V1dL63+aIkSo/Du0xnahzmO0EBQ4RXiW7F1Egh7nIYrog==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzdj1ChNufcSwREq7kQOkN4IwhskHEfcWJkOxw+g3P9qSv7F5+j
	HMfvbdtXESdXqM3i9nUPtSJFwe2S5jZhR8W4HFjouqlrmwyK/RjH9nYVehar3PCpi+g=
X-Gm-Gg: AeBDiesY0/o2zTr93e6MiuWKqPJMfz6i+0gTgQJOJzU0ZnwIG8fmeyXy8g/WBOlDenE
	vaV6UAsPy9v0SpmIH1ch5lCAVyBuHo0W0gEV3ZCRFTqLHd8RU3v+mpA7161kGi4Uz+bMrpp5aaJ
	OF2ZmZbfLR+NiebBq2oJtraY+l48FTv7PPB84+NQRAbc6IZGH+/x4Z3LsZM9iLz3zWkicdsq693
	7r7wUJigzTofP0cFb+TGDTVIOMH8AKhz0TSRlBpt2GxdjojfeXF/WPxJyGW/DH0q4TmaUR8U6gi
	rAbbBv6VcIbUVsO0el0J6jZpgjkDAb3yOEdbDWjtYJhcK/iTRtB6vAXUmbeOEU3NxNmpSS+bckP
	YD/Rt2CIImo1cExsTMh2d5V8BJHp0x2tizN6Yg/tHgDi+wXR6nWiaWsSQBtx3wugV93v6XaKz+d
	3JOf9j2Bf8kMt7kM0/MgCg+kVlbzPVQY+VLSLqqS6tL7kpcDUYU6sJDCk8zO2BEwdCRbWrbYQ84
	iq29d5d1HBkkeJyG8lUTuZf5Q==
X-Received: by 2002:a05:600c:c0d5:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-488fb74dffemr285052015e9.9.1776930014815;
        Thu, 23 Apr 2026 00:40:14 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891b46cffasm323440805e9.13.2026.04.23.00.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 00:40:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 09:40:13 +0200
Message-Id: <DI0D4B4HFWPE.30JV1XG0HFBXA@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "sureshha" <suresh.ha@bmwtechworks.in>
To: "Yoann Congal" <yoann.congal@smile.fr>, <git-patches@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v2] systemd: backport patch to fix
 journal-file issue
X-Mailer: aerc 0.20.0
References: <20260330110508.1013370-1-git-patches@bmwtechworks.in>
 <DI0D1AFMURTB.318ISRG49BOEQ@smile.fr>
In-Reply-To: <DI0D1AFMURTB.318ISRG49BOEQ@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 07:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235749

On Thu Apr 23, 2026 at 9:36 AM CEST, Yoann Congal wrote:
> On Mon Mar 30, 2026 at 1:05 PM CEST, Suresh H A via lists.openembedded.or=
g wrote:
>> From: sureshha <suresh.ha@bmwtechworks.in>
>>
>> Backport patch to fix systemd journal-file assertion on removed or corru=
pted files
>>
>> Extracted from systemd MR:
>> https://github.com/systemd/systemd/pull/40378
>>
>> Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
>> ---
>
> Hello,
>
> Looks to me that this patch is still needed on master. Can you send it
> there?
> Or, alternatively, wait for master to have systemd upgraded above
> v260 and then, resend this backport request.
>
> Thanks!
>
>>  ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
>>  meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
>>  2 files changed, 66 insertions(+)
>>  create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-file-=
do-not-trigger-assertion-on-removed-or-.patch
>>
>> diff --git a/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-=
trigger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/=
0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch
>> new file mode 100644
>> index 0000000000..ad8f31261e
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger=
-assertion-on-removed-or-.patch
>> @@ -0,0 +1,65 @@
>> +From 1350f39db7e72116c3b2423db02da3ddc8e29082 Mon Sep 17 00:00:00 2001
>> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
>> +Date: Sun, 18 Jan 2026 19:15:31 +0900
>> +Subject: [PATCH] journal-file: do not trigger assertion on removed or
>> + corrupted journal file
>> +
>> +When a journal file is removed or corrupted, then the value `p`, which =
is
>> +read from Object.data.entry_offset, may be zero.
>> +
>> +Note, journal_file_move_to_object() checks the passed offset and return
>> +-EBADMSG if it is invalid.
>> +
>> +Fixes the issue reported at
>> +https://github.com/systemd/systemd/pull/40372#issuecomment-3762907261.
>> +
>> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/11=
2cbc37906fb97afe0ad04164262cf62d0af5e9]
>> +
>> +Comment: Patch is refreshed as per codebase of v255
>> +
>> +Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
>> +---
>> + src/libsystemd/sd-journal/journal-file.c | 7 +++----
>> + 1 file changed, 3 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/=
sd-journal/journal-file.c
>> +index 08f3b82..633de5b 100644
>> +--- a/src/libsystemd/sd-journal/journal-file.c
>> ++++ b/src/libsystemd/sd-journal/journal-file.c
Also, this patch lacks whitespace at the start of the empty context
lines...
>> +@@ -3305,7 +3305,9 @@ use_extra:
>> +
    ^ ... here for example.
>> + static int test_object_offset(JournalFile *f, uint64_t p, uint64_t nee=
dle) {
>> +         assert(f);
>> +-        assert(p > 0);
>> ++
>> ++        if (p <=3D 0)
>> ++                return -EBADMSG;
>> +
>> +         if (p =3D=3D needle)
>> +                 return TEST_FOUND;
>> +@@ -3341,7 +3343,6 @@ static int test_object_seqnum(JournalFile *f, uin=
t64_t p, uint64_t needle) {
>> +         int r;
>> +
>> +         assert(f);
>> +-        assert(p > 0);
>> +
>> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
>> +         if (r < 0)
>> +@@ -3382,7 +3383,6 @@ static int test_object_realtime(JournalFile *f, u=
int64_t p, uint64_t needle) {
>> +         int r;
>> +
>> +         assert(f);
>> +-        assert(p > 0);
>> +
>> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
>> +         if (r < 0)
>> +@@ -3423,7 +3423,6 @@ static int test_object_monotonic(JournalFile *f, =
uint64_t p, uint64_t needle) {
>> +         int r;
>> +
>> +         assert(f);
>> +-        assert(p > 0);
>> +
>> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
>> +         if (r < 0)
>> +--
>> +2.34.1
>> diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-=
core/systemd/systemd_255.21.bb
>> index 87e186bbfa..504d6cbef6 100644
>> --- a/meta/recipes-core/systemd/systemd_255.21.bb
>> +++ b/meta/recipes-core/systemd/systemd_255.21.bb
>> @@ -29,6 +29,7 @@ SRC_URI +=3D " \
>>             file://0002-binfmt-Don-t-install-dependency-links-at-install=
-tim.patch \
>>             file://0003-timedated-Respond-on-org.freedesktop.timedate1.S=
etNT.patch \
>>             file://0008-implment-systemd-sysv-install-for-OE.patch \
>> +           file://0023-journal-file-do-not-trigger-assertion-on-removed=
-or-.patch \
>>             "
>> =20
>>  # patches needed by musl


--=20
Yoann Congal
Smile ECS


