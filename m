Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A2EE9A048
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 12:57:44 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13317.1771505859921407210
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 04:57:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m56Da7W4;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4834826e555so8434585e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 04:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771505858; x=1772110658; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHBf5ETwW0fNMEcnFisWmdzC9pOZbH6mWw59lQTdLZ0=;
        b=m56Da7W4O2K8HjdPfqj9TlrxnLN+bbibg3qpI0NJyOogb3WIrMuV5Uds4VT5Y+zVYj
         4lLIiouO5Pr1PdapKKdwNB3C3UGqleYfnX6PruUuAv/4muHY9fp4ojkLrP6mtq+dxoTe
         DvtUoOHcYNN1gMhK0uytYRiV7BlJLgPSf8MkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771505858; x=1772110658;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHBf5ETwW0fNMEcnFisWmdzC9pOZbH6mWw59lQTdLZ0=;
        b=aZkVcl+SN9oRIq40KB/bnIaSSUF2lxKcYV10pXHVBndnudJcukhhCdnJtqX8ttZ9bI
         XnTAlzCYPGhpHgtDAo7k5dF3w+Q9iIcEV+MZDKSjEC+4Zdz9yguXXyGulnh6Ciy5stRu
         67pqbrttQyr2CQ2roAxjJTakbDtBNv0jFmjUnwkuRdWjXiolDZKJlVosfYckpU0ZBOOh
         4azqrINL82vN/SePqltDLpNCjMN6cm7J3BbRLD0Q/IVpah397rt0If1cRD8u0UFkleYA
         /P9sxfV0XBKaRfL5oJLebEg/cdMA4verZdLBkUzZT4pRj7d6IR59TS1ZC/zoxbXOyMyV
         KcQg==
X-Forwarded-Encrypted: i=1; AJvYcCUkFWyX9hAaGg3J3mcqRxnm14xrkNnA4VZjIFhMk9/jPlkZFEvDBHKipwaA51oM7GssM6wnDV0vfUFkMIKrkIYnvA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxUIyhk6z36BbSzib1TkYjfb59WqKu5ZV0GmvTWI7t0MexyX4TC
	CflP3425gQzVSZtjyj344Mq2BSdMaUNrpjuVFRhp7MxYLyg1FqRxmtJb7uR6IpxxQ3U=
X-Gm-Gg: AZuq6aKdelKA6jre2+/P9m/2T4IEQP4FEaFtAY8WlZdtpEauucWz/H6CDtR4V3AbROg
	elFUrm+FgSJJH90rGgoBFUUNl3wxGiYZwlYEud+ZgiJYau0Z5IenjQ7Eetl7qOKliyT+RPDz2O5
	JbgvInWgwLv8jm/aYrxq+fBv0mdCd8iCFwM2YCo5i9dyO+oYuwS3wgnyZMn0IbVWH1E8FX9Qp0M
	JE3x69gTzhol667Ueu5EVjL7AXW0wUhjCVXsAzGB2NY6Y/XxpuvkehmS7xzvSimE02mcWjViQ+k
	nuYi1fxUac4KCFeQvZRCyptDofVZDuoED5FVu+NKnMod4q1Yg+xQm09AsMoqywsuiJbio6Aa6XW
	xM2OyfCkykQZUMfRp5zbCUgXGO+3TCBumlMWvglesnLO4JLpV9CB8sW4wx7HPdFsHd2xzGvkiwS
	9fJi1tlBFLUdBkAqLZYmNiLd6mCzHSeUx/HUzlqphX2NkOm/oFW9gDtFhaNHik+2EDbrm2/G4vX
	ByvwJoOJ8yMB94=
X-Received: by 2002:a05:600c:470b:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-48379c01465mr338371445e9.31.1771505858151;
        Thu, 19 Feb 2026 04:57:38 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f985e4asm17798145e9.20.2026.02.19.04.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 04:57:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 13:57:37 +0100
Message-Id: <DGIYEZWHNL1Z.BDA5BX7BPC3I@smile.fr>
Subject: Re: [OE-core] [meta][scarthgap][PATCH] libmd: add ptest for 'libmd'
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Naman Jain" <nmjain23@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260127091608.598339-1-namanj1@kpit.com>
 <CAMSfU+5X8yphvKpggDiwAva9GNrkgPv23udRXqUhrSrJB6Yi9w@mail.gmail.com>
 <CALCkg5bw6BqhBjf+rkE+RraYvM+KkEis6qFovi+-6YaxLs3Pog@mail.gmail.com>
 <CALCkg5Z2cykCt9f0P6vgc3ZTsg0nbV+bFWgzazMonosG0SiSgg@mail.gmail.com>
In-Reply-To: <CALCkg5Z2cykCt9f0P6vgc3ZTsg0nbV+bFWgzazMonosG0SiSgg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 12:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231424

On Thu Feb 19, 2026 at 12:35 PM CET, Naman Jain wrote:
> Hi
> The patch is merged in master
> https://git.openembedded.org/openembedded-core/commit/?id=3D4c0a41389bdab=
30e3b349fef8df6ca0ef4893b89
> Can you please check

Hello,

Thanks for the ping. Sorry I missed the previous one last week :(

That was not clear to me at the time, but I can't accept this on stable
branches under current stable policy (Sorry for that as well).

I will clarify the policy on that point with the project.

Thanks!

> Thanks
> Naman jain
>
> On Thu, 12 Feb, 2026, 12:39=E2=80=AFpm Naman Jain, <nmjain23@gmail.com> w=
rote:
>
>> Hi
>> The patch is merged in master
>>
>> https://git.openembedded.org/openembedded-core/commit/?id=3D4c0a41389bda=
b30e3b349fef8df6ca0ef4893b89
>> Can you please check
>>
>> On Tue, 27 Jan, 2026, 2:59=E2=80=AFpm Yoann Congal, <yoann.congal@smile.=
fr> wrote:
>>
>>>
>>>
>>> Le mar. 27 janv. 2026 =C3=A0 10:16, Naman Jain via lists.openembedded.o=
rg
>>> <nmjain23=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>>>
>>>> Adapt the compile 'test' phony target from Makefile and deploy as
>>>> ptest for libmd.
>>>> It takes less than 30seconds for ptest completion
>>>>
>>>> Signed-off-by: Naman Jain <namanj1@kpit.com>
>>>>
>>>
>>> Hello,
>>>
>>> This patch was also sent to master :
>>> https://lists.openembedded.org/g/openembedded-core/message/229867
>>> ... but not merged yet.
>>>
>>> Can you please wait for it to be merged on master before resending the
>>> backport request?
>>>
>>> Thanks!
>>>
>>>
>>> ---
>>>>  .../distro/include/ptest-packagelists.inc     |  1 +
>>>>  meta/recipes-support/libmd/files/run-ptest    | 18 ++++++++++++++++
>>>>  meta/recipes-support/libmd/libmd_1.1.0.bb     | 21 +++++++++++++++++-=
-
>>>>  3 files changed, 38 insertions(+), 2 deletions(-)
>>>>  create mode 100644 meta/recipes-support/libmd/files/run-ptest
>>>>
>>>> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
>>>> b/meta/conf/distro/include/ptest-packagelists.inc
>>>> index 9950e46776..784176f579 100644
>>>> --- a/meta/conf/distro/include/ptest-packagelists.inc
>>>> +++ b/meta/conf/distro/include/ptest-packagelists.inc
>>>> @@ -29,6 +29,7 @@ PTESTS_FAST =3D "\
>>>>      json-glib \
>>>>      libconvert-asn1-perl \
>>>>      libgpg-error\
>>>> +    libmd\
>>>>      libnl \
>>>>      libpcre \
>>>>      libssh2 \
>>>> diff --git a/meta/recipes-support/libmd/files/run-ptest
>>>> b/meta/recipes-support/libmd/files/run-ptest
>>>> new file mode 100644
>>>> index 0000000000..0c4a5f64ec
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/libmd/files/run-ptest
>>>> @@ -0,0 +1,18 @@
>>>> +#!/bin/sh
>>>> +
>>>> +cd test
>>>> +status =3D 0
>>>> +
>>>> +for testbin in *; do
>>>> +    if [ -x "$testbin" ] && [ ! -d "$testbin" ]; then
>>>> +        if "./$testbin"; then
>>>> +            echo "PASS: $testbin"
>>>> +        else
>>>> +            echo "FAIL: $testbin"
>>>> +            status=3D1
>>>> +        fi
>>>> +    fi
>>>> +done
>>>> +
>>>> +return $status
>>>> +
>>>> diff --git a/meta/recipes-support/libmd/libmd_1.1.0.bb
>>>> b/meta/recipes-support/libmd/libmd_1.1.0.bb
>>>> index dc588a0f95..ffc59deb26 100644
>>>> --- a/meta/recipes-support/libmd/libmd_1.1.0.bb
>>>> +++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
>>>> @@ -8,9 +8,26 @@ HOMEPAGE =3D "https://www.hadrons.org/software/libmd/=
"
>>>>  LICENSE =3D "BSD-3-Clause & BSD-2-Clause"
>>>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0436d4fb62a71f661d6e8b7812=
f9e1df"
>>>>
>>>> -SRC_URI =3D "
>>>> https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz"
>>>> +SRC_URI =3D "
>>>> https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz \
>>>> +          file://run-ptest \
>>>> +"
>>>>  SRC_URI[sha256sum] =3D
>>>> "1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332"
>>>>
>>>> -inherit autotools
>>>> +inherit autotools ptest
>>>> +
>>>> +do_compile_ptest() {
>>>> +    sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" test/Makefile
>>>> +    oe_runmake check
>>>> +}
>>>> +
>>>> +
>>>> +do_install_ptest() {
>>>> +    install -d ${D}${PTEST_PATH}/test
>>>> +    for bin in ${B}/test/*; do
>>>> +        if [ -x "$bin" ]; then
>>>> +            ${B}/libtool --mode=3Dinstall install "$bin"
>>>> ${D}${PTEST_PATH}/test/$(basename "$bin")
>>>> +        fi
>>>> +    done
>>>> +}
>>>>
>>>>  BBCLASSEXTEND =3D "native nativesdk"
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#230035):
>>>> https://lists.openembedded.org/g/openembedded-core/message/230035
>>>> Mute This Topic: https://lists.openembedded.org/mt/117485645/4316185
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
>>>> yoann.congal@smile.fr]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>>>
>>>
>>> --
>>> Yoann Congal
>>> Smile ECS
>>>
>>


--=20
Yoann Congal
Smile ECS


