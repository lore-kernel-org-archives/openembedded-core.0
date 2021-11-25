Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953CBC433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 15:42:37 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web08.13504.1637854956464229883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 07:42:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZjsRxIa7;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id v1so27334367edx.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 07:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/dGdzTKCnMWhmewoDk3sKmzstlQ6Ak7j3Xd3wAQJi5g=;
        b=ZjsRxIa7Rcv8YnFAO0kwtTFUNI0siEFwtyzujRrlXyoadN8a7fzpK3hceWwFC19+9Y
         Wd8El78J+Iaowqr/DXOIRhPe8bMlel0e+5MOc7JdzgkspJMOhRuUcod3zVrHXlBD+AXR
         fW5n68RJImz0zM4HEAqVzit2tJPWIzk2khfjRrmw2aexyj+mElu7fqX/r0cB/751CPTE
         QpcwStP1yfSbtw9sqw1h+LmuO4pV9YTC6f9QH23gxEiOJnGsk/UIpkz9kCgYw2XUNgT5
         SHZKJ0j/1GuIKqCcJBFSR4FowvJGC4YjE8VD9p2TTIuWzqkV22XR93dq3MNrXLg2nrKt
         CimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/dGdzTKCnMWhmewoDk3sKmzstlQ6Ak7j3Xd3wAQJi5g=;
        b=xvulGOurDVYHqFMbkJTEYY0IjV3PW3dXulqT/jQYsZWN3GmJmrqbRmhCLTtIG+rcWo
         hdRhZgUBub7rZ6UOkokDmGty/Rw7EtYJWm9S7uPw3Z8IKlkIenT/5GHJM5Ay7+0kanQm
         0A2OoLj7xT0CqPeaTjS2kAZvkLSXzwbN2ES3HceOvntZ6G/kuJfT58S2ikX13fzepINV
         IyRgOxl3Q216FWZYf41wXWR2wilzx+6jScmNvBEZUy8TWxMQOb7y2QtzT9R2Ps5CCVZu
         EuS4KBWJV0c1aoqDrHhKgj2A2SPpSLmN6jLxiqIDCcrxjNWpXbpo3Oj9zI78YGvO6UzX
         qN9g==
X-Gm-Message-State: AOAM532ndbsOnjHIrqMHRwsGZEQO0jZUgCjEI41s6jYU7z6gPgjKxoq4
	a34Rm5fiv3Dw/Vi9YbMdSNV43/sIte0Nd9zGwI0=
X-Google-Smtp-Source: 
 ABdhPJwVUO3yP40GGxWdJ/WYnpxQAzsT3vml+o8AYWFYOz/NWgaikwjY1WwISRPsBFa8s0JQku687SFcNRrTANL/INQ=
X-Received: by 2002:a17:906:48cd:: with SMTP id
 d13mr31613004ejt.35.1637854954613;
 Thu, 25 Nov 2021 07:42:34 -0800 (PST)
MIME-Version: 1.0
References: <1617235191-37594-1-git-send-email-denis@denix.org>
 <CAP71WjwizBME7VsK+Mpy=mysN_=ViykHhpJ0owgAb_2wH=cnXA@mail.gmail.com>
In-Reply-To: 
 <CAP71WjwizBME7VsK+Mpy=mysN_=ViykHhpJ0owgAb_2wH=cnXA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Nov 2021 10:42:22 -0500
Message-ID: 
 <CADkTA4Op48T7RcVG2Hyqt21=mrY7AVWmLgQJocgEvpK=1kqZnQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: pass CROSS_COMPILE to
 configure and build
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Denys Dmytriyenko <denis@denix.org>, Steve Sakoman <steve@sakoman.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Nishanth Menon <nm@ti.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 15:42:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158785

On Thu, Nov 25, 2021 at 10:22 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> Bruce, Steve,
>

The backport is also fine with me!

Bruce

>
> On Thu, Apr 1, 2021 at 2:00 AM Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> Fixes:
>> |   CALL    /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/checksyscalls.sh
>> |   CALL    /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/atomic/check-atomics.sh
>> |   LDS     arch/arm64/kernel/vdso/vdso.lds
>> |   CC      arch/arm64/kernel/vdso/vgettimeofday.o
>> |   AS      arch/arm64/kernel/vdso/note.o
>> |   AS      arch/arm64/kernel/vdso/sigreturn.o
>> |   LD      arch/arm64/kernel/vdso/vdso.so.dbg
>> |   VDSOSYM include/generated/vdso-offsets.h
>> |   OBJCOPY arch/arm64/kernel/vdso/vdso.so
>> | objcopy: Unable to recognise the format of the input file `arch/arm64/kernel/vdso/vdso.so.dbg'
>> | /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/arch/arm64/kernel/vdso/Makefile:61: recipe for target 'arch/arm64/kernel/vdso/vdso.so' failed
>
>
> One of our meta-qcom users hit this issue with dunfell
> https://github.com/ndechesne/meta-qcom/issues/394
>
> Backporting this patch to dunfell seems the right thing to do. The patch applies cleanly and it fixes the problem for me.
>
> e.g.
> ddad8183490c (make-mod-scripts: pass CROSS_COMPILE to configure and build)
>
> Feel free to add
> Reported-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>
>>
>> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
>> Cc: Nishanth Menon <nm@ti.com>
>> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>> ---
>>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>> index 92ffa47..b2b50b9 100644
>> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>> @@ -19,7 +19,7 @@ DEPENDS += "bc-native bison-native"
>>  DEPENDS += "gmp-native"
>>
>>  EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
>> -EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}""
>> +EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
>>
>>  # Build some host tools under work-shared.  CC, LD, and AR are probably
>>  # not used, but this is the historical way of invoking "make scripts".
>> --
>> 2.7.4
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#150130): https://lists.openembedded.org/g/openembedded-core/message/150130
>> Mute This Topic: https://lists.openembedded.org/mt/81764668/1279857
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [nicolas.dechesne@linaro.org]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

