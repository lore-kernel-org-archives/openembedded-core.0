Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A281DC77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 09:59:07 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.21990.1684490338717606462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 02:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=CNdOzfqt;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4efe8b3f3f7so3496671e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 02:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684490337; x=1687082337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWxDwTpFlH1+8x3vWJm+IoAlBx4S2Y759+Q9dJF5bmI=;
        b=CNdOzfqtyFIDt5Pod/a1UsMcq6rZ+haY9B89sNCRwE4CSqQx33BpqL/6BeoOjW3cMC
         PAX+nz6L46bGPV1jeMa+7NVWNWcH9lvCRSA1MKaxwv9RsUarxTbAxxZcAt6Dqjho6WXH
         a8Oc9ATlar1dzwzsseeorANYDwk+eq0EHXiYpQ4H7Cq71dUvC4lJJa+hKbUdcWXyJ9YP
         kodb/f1dTidtHvbCgZQ1PweJj1KXzzAXQ6pOL95LctIHoNwB6sXxXRxLtzSjYBKJNcuI
         JsRaSlUCP+vQ774VCBphNQld0nS6cIcFP4Yb6jdzH/U2nhYrHhSv51FF4b6nol2duqTr
         B28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684490337; x=1687082337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWxDwTpFlH1+8x3vWJm+IoAlBx4S2Y759+Q9dJF5bmI=;
        b=ZlF6o/NLFQHZ0jgN7yw2xJ4BqeDaf02+lsFHMMAIX8PCAjcCq75MVfojUjDQgp53pS
         0oHf4E1G2gzPclucUXLNU7l4c9ulaIB6D2kvmMhbgnzXcNeUK1hH7KSVoi2KkwqQDHID
         9eBejrpf98NOVxzMGClUKurxzirPzvB9ONUH1JpV/IfO5NTn8KuCW9aq2X3cAILmBVVh
         VBPtlV6UE0dyjoEf9WnzJQt/sgo/1KkapNGdO1LeYe5DxAmWhKopHOVorcpJbChjPU7z
         YVhOebb/HHg4AB5i35PieokrBbI5CkoWQCjEWrmfVHCmDWT61sCzeCVBWX+GFCd4ZwfI
         DDig==
X-Gm-Message-State: AC+VfDw8lnuqr9RfP69pPFD+4/XXwJkH4+P2RX8VsFTgIyBxWlWG1nKX
	GD0tYJC9g9mXXigElnbvHzp0BXAz/maXDFb6TJM=
X-Google-Smtp-Source: ACHHUZ5nbVAqwqv8i2/IX5e4USjoODL5ZOwJBbbCqEB93jg/kH31462KSNT+P1R/x54jZDVe+FR0RalG8jrVxzBfgiA=
X-Received: by 2002:ac2:4c9a:0:b0:4f1:4602:fb63 with SMTP id
 d26-20020ac24c9a000000b004f14602fb63mr616574lfl.41.1684490336737; Fri, 19 May
 2023 02:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230509172344.1516743-1-alex@linutronix.de> <20230509172344.1516743-25-alex@linutronix.de>
 <88BC9F83-117D-4E32-84A4-8AAAFFFC5C99@arm.com>
In-Reply-To: <88BC9F83-117D-4E32-84A4-8AAAFFFC5C99@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 May 2023 11:58:44 +0200
Message-ID: <CANNYZj89teUL2oNLzndE0_YUKDOmOu5_pqW9TUUD_Rd8hHnZcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 25/27] gdb: enable python PACKAGECONFIG
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 09:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181546

On Thu, 18 May 2023 at 17:52, Ross Burton <Ross.Burton@arm.com> wrote:
> > -PACKAGECONFIG ??=3D "readline ${@bb.utils.filter('DISTRO_FEATURES', 'd=
ebuginfod', d)}"
> > +PACKAGECONFIG ??=3D "readline ${@bb.utils.filter('DISTRO_FEATURES', 'd=
ebuginfod', d)} python=E2=80=9D
>
> This means that gdb hard-depends on python, can we split that out into a =
separate gdb-python package so we don=E2=80=99t pull the whole Python stack=
 in with gdb?

Yes, I just sent a revised patchset for this.

Alex

