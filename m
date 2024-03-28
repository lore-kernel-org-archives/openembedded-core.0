Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02525CD1283
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 17:55:56 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.3347.1711648554962096370
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 10:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U0n5gkUW;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33e285a33bdso805752f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 10:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648553; x=1712253353; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhWwD/9NvuHb2boGvpGnYrCrV2TgNlzIXaCuCig4OFw=;
        b=U0n5gkUWKXH1rWt1Y9AKkdveWPpMtn+u+c10fqquMOkWMjjuoQrfbseYbZBiG5MJr7
         X2edpNMxNX8kMTJz+aZvN3djG2Gtca0eEy4Wz7b90bujZrqZQXRzMtavglWn8OuvFdc3
         IxALjAgWl/LjlN7wS+25v9+ZOCGwmlVSmNwS7OVXKHFs8WEKmmVLL3k1O3CjVmJ70nGR
         O+LY96i0mPwruJbxtfAJ/WkBQCs6fZhg2XZOat7kOlHMzOXArxpZ9d8nPhCBF9ySI0i4
         Q81neyjxkympBENXNz6BKT4bRA9mnJmXGPmNOy4UD+q37TC2tUi+HSJ4lRD8Am6/k67G
         4TxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648553; x=1712253353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhWwD/9NvuHb2boGvpGnYrCrV2TgNlzIXaCuCig4OFw=;
        b=d5Oe3anbCX/hSUY5sikiW9nGx3rR8TE6StMNC6uq7o/mK/PJR1yUn0XzGiQHCOWid4
         h5l7Adplhr6Gy7lHsJ6NmvpIfIeEVFM9F8ibkxXsXvrk7ZOHbBzPevKeN5B3DLF0wRkA
         /XZJ65yd3TXr2vepYxPbkPcWoKARo0Mp1VfbG2Ya6YYR9P365xPIM3ZNZwwm+mdt6YGR
         H3QxEN48c0uxUI7QBB/T1YN/Qy90h+UWRFXti6O0I+bhT8Nf910fJAdcblB/xgs3d4JG
         JDIoEaxkAOeUy4Uba5O0/bn0gXJSmAjt6WlFdWdH5OJ6W5kHS6tep4fONycMVRjw93Ou
         bIpw==
X-Gm-Message-State: AOJu0YxiXcTgz8vclPh99Wfe326LCGpAVMc02NLtuhwS5U8tg6Kzp9JV
	uwp3U5bpu4DMNPwGb7H/0PZBGe1CX6DMa4WWCj6+86rJbdLaqqu6eQar9YOdCmKT7HtJoU+VMPd
	2Weh7EPgvX5FoDtzIQEgt/ENWzFM=
X-Google-Smtp-Source: AGHT+IHHTxgYr7JEdDJt7iHf7aOA2+0ime+6FA2EBkJOmftZhDaYqSzqNesYrm/aKfHAeP1PPFIchVLyI0xvqigY2y4=
X-Received: by 2002:adf:c981:0:b0:341:e4f4:4399 with SMTP id
 f1-20020adfc981000000b00341e4f44399mr1791063wrh.68.1711648553170; Thu, 28 Mar
 2024 10:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240325102055.1037135-1-max.oss.09@gmail.com>
 <CADkTA4PYLUCck7Y0evO_597xOvwooe1vn5kSvJ1pqq+ew98FKg@mail.gmail.com> <CADkTA4M9wf--yDs9+ggQuKwSKnGYVaV994RfK+L+Q5XhUhXT8A@mail.gmail.com>
In-Reply-To: <CADkTA4M9wf--yDs9+ggQuKwSKnGYVaV994RfK+L+Q5XhUhXT8A@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Thu, 28 Mar 2024 18:55:42 +0100
Message-ID: <CAEHkU3X2X=sC+xFd5DEwYChnBZcjcA_6+TxZHgASDOzL9cAkwA@mail.gmail.com>
Subject: Re: [OE-core][Patch v1 1/2] perf: fix build with latest kernel
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 17:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197601

On Tue, Mar 26, 2024 at 6:48=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
>
>
> On Tue, Mar 26, 2024 at 1:46=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
>>
>>
>>
>> On Mon, Mar 25, 2024 at 6:21=E2=80=AFAM <max.oss.09@gmail.com> wrote:
>>>
>>> From: Max Krummenacher <max.krummenacher@toradex.com>
>>>
>>> Kernel commit 9eea8fafe33e ("libbpf: fix __arg_ctx type enforcement for
>>> perf_event programs") added with 6.9-rc1 tools/include/uapi/asm/bpf_per=
f_event.h
>>> which for arc, arm64, loongarch, riscv and s390 includes headers from
>>> the arch/${ARCH}/... directories.
>>> Thus the build in OE fails as those headers are not present.
>>>
>>> Fix this by additioanly copying all files in arch/${ARCH}/include/.
>>>
>>> Fixes:
>>> ERROR: perf-1.0-r0 do_compile: oe_runmake failed
>>> | In file included from work/verdin_imx8mm-tdx-linux/perf/1.0/perf-1.0/=
tools/include/uapi/linux/bpf_perf_event.h:11,
>>> |                  from libbpf.c:36:
>>> | work/verdin_imx8mm-tdx-linux/perf/1.0/perf-1.0/tools/include/uapi/asm=
/bpf_perf_event.h:2:10: fatal error: ../../arch/arm64/include/uapi/asm/bpf_=
perf_event.h: No such file or directory
>>> |     2 | #include "../../arch/arm64/include/uapi/asm/bpf_perf_event.h"
>>> |       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>>> ---
>>>  meta/recipes-kernel/perf/perf.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/per=
f/perf.bb
>>> index 4f26813de0..6408c65462 100644
>>> --- a/meta/recipes-kernel/perf/perf.bb
>>> +++ b/meta/recipes-kernel/perf/perf.bb
>>> @@ -139,6 +139,7 @@ PERF_SRC ?=3D "Makefile \
>>>               tools/scripts \
>>>               scripts/ \
>>>               arch/arm64/tools \
>>> +             arch/${ARCH}/include \
>>
>>
>> We've always tried to stay within the tools/ source umbrella since we re=
ally
>> don't want to copy any more of the kernel than we have to, since otherwi=
se,
>> we might as well go back to simplifying things and just building against=
 the
>> entire kernel source tree.
>>
>> I'd like to see if there's a way that we could limit this to the uapi (a=
nd hence
>> use our uapi headers), and avoid needing to make the copy. If we need a
>> copy, then being as specific as possible would be the goal.

I was too lazy to limit this when I came up with the patch.
Currently the only header missing is
../../arch/arm64/include/uapi/asm/bpf_perf_event.h,
so limiting to arch/${ARCH}/include/uapi should work fine, I'm unsure if
the header file itself exists for every ${ARCH} so only copying the one
file is probably a dangerous way forward.

>
>
>
> I meant to also add that I'm not talking about the libc-headers for the
> uapi bits, as they are not tracking the latest kernel by design. Although
> it would be interesting to see how perf does treat the older uapi against
> the new kernel, so we can document the tested combinations.
>
> Bruce

Let's wait till you give linux-yocto-dev a try run.Happy Easter.
Max
>
>
>>
>>
>> I'm not moving linux-yocto-dev to the latest -dev until next week, but I=
  can
>> look into this more then.
>>
>> Bruce
>>
>>
>>>
>>>               arch/${ARCH}/Makefile \
>>>  "
>>>
>>> --
>>> 2.42.0
>>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await th=
ee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

