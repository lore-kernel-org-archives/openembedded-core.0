Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34B8C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 14:40:46 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web08.12659.1642689645420978832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 06:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=EiWZa5Je;
 spf=pass (domain: foundries.io, ip: 209.85.219.170,
 mailfrom: igor.opaniuk@foundries.io)
Received: by mail-yb1-f170.google.com with SMTP id v186so18474320ybg.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 06:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=60W9sapXE6mFEcOQse1oAyQ8U+dJ8vZIyuU1Iu9sd3Y=;
        b=EiWZa5JeXfUuZwvf24gwkQGEI+fLXZPB5mPnWmZkUL2TL91hzT05l687txwL32dq3l
         Wosbu3pms2No9oUe9gAO5VJhikAbBWroNUrggZz4waYH38sqsXkt2BWwNssghFoKgsAs
         bCku1hrB2ipPJiRAjkys6MPNq1/6lRfOvXkRPPRAjn9l8dy/YGa/HursyinnBbboDE+Y
         7XMs2cSOiet6p4vGLMib+WnP07LSWjQcg8PPEW1WGW+PoHm54sq0qgr4WIoXVt6Yhb33
         6Cu5cSWO6Zxub+xyeqHYtq7yFdEp8JiV8mDqUshzY8sqbm/HreVXfGdvT+NLWKLhIUgE
         Uo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=60W9sapXE6mFEcOQse1oAyQ8U+dJ8vZIyuU1Iu9sd3Y=;
        b=s07UekcChMnK3LCEZ8md9NIN4mgkikuViFnkXrXdUWhkw3UDKsCzHhuNpeOI2ZYN8C
         jQQomqWlXOJFC2svzhxvA40EgD9hw6RF56P3CCQnPN79gLugQHqbyjuIrE3dp7uydhFb
         2EdIoTuFH5157WpL7VQ6IXCuHg0LkM0ukLdnp5jQOnv8cjLg4OsqJlb5IzNCGsnumfsN
         J1gkbt1XhpgzHP/eNolIoWF4HHt+ILQ+jEI+7TOYfqan2gmqEl7nHBpx4FT7NjvMLhuV
         HBBzmPvhVM8Hw0N0kFIhKTP20rd20Xlz8h8sK0kYbuy5qFdSm/Hvmg0eMWvBaXbwUfVy
         Lzuw==
X-Gm-Message-State: AOAM533ys6C8JB/s9xkjzXcntb2C8WhmzQAdR9n5lVFqaFYu9AM2JGnh
	x2GOAneyOs8867Y7gZLo93HL4YSBtRK64uJf8ehZJgWm+vuj6A==
X-Google-Smtp-Source: 
 ABdhPJwWmNMAqw4O3fPzI8tS1LT8g4QyBXUEXqXUGpxbSstyD35xlRmTN55jEHoRguDf4WnGu/gmDNj/Rs0k/++wH8o=
X-Received: by 2002:a05:6902:348:: with SMTP id
 e8mr47749628ybs.431.1642689644413;
 Thu, 20 Jan 2022 06:40:44 -0800 (PST)
MIME-Version: 1.0
From: Igor Opaniuk <igor.opaniuk@foundries.io>
Date: Thu, 20 Jan 2022 16:40:33 +0200
Message-ID: 
 <CAL6CDMGDmLQ+kQACFOO716ofrjBGUjH=SnBR+n7FYg8Ey3VThg@mail.gmail.com>
Subject: [oe-selftest] adding new tests workflow
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 14:40:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160763

Hi everyone,

I do have some questions about a standard workflow people usually
follow when adding new test sets to meta/lib/oeqa/selftest/cases/.

When oe-selftest is invoked for example this way:
oe-selftest --run-tests wic.Wic2.test_offset  --machine random

It usually creates a new build dir, then as far as I understood it
builds all available recipes (~30GB of build cache) for a random
machine.

When I try to invoke oe-selftest again, it prints error message that
build dir already exists:
2022-01-20 16:27:50,892 - oe-selftest - INFO - Adding layer libraries:
2022-01-20 16:27:50,892 - oe-selftest - INFO - openembedded-core.git/meta/l=
ib
2022-01-20 16:27:50,892 - oe-selftest - INFO -
openembedded-core.git/meta-selftest/lib
2022-01-20 16:27:50,893 - oe-selftest - INFO - Running bitbake -e to
test the configuration is valid/parsable
2022-01-20 16:27:52,524 - oe-selftest - ERROR - Build directory
openembedded-core.git/build-st already exists, aborting

So there are two questions:
1. Are there a way to avoid building full set of recipes, if I really
want to run tests for one specific module (ksparser for example,
--run-tests wic)
2. Is it possible to re-use existing build directory for that and
expect bitbake to rebuild only recipes that were changed?

Thanks and looking forward to suggestions.

Regards,
Igor

--=20
Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations

Igor Opaniuk
Embedded Software Engineer
T:  +380 938364067
E: igor.opaniuk@foundries.io
W: www.foundries.io

