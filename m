Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C175ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 06:08:39 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.21911.1661926114951815075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 23:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hPVCYGyq;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id z29so9922025lfb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 23:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=sbIktRLFdhBBAqfs7hy65u+ywwLtyLZraC8espEvDUc=;
        b=hPVCYGyqWRACRCaerCpsjNsmGMmCDWyOr1RX7nzPRd+0fe0LOekjD1NJVuNXrPrOZm
         R446q9JAO0a+fPMSwa5pJKzFylq8A96JprHjqq2xK8+lDOFOrH8HMAI5jCQ4demRUG09
         HYCN+SoiQFsU0q23pH95ukg+Ta4SkDGLcOB5yQ0OPfQUSf1iWCv/pW0GVtbZYPH+bNTH
         SUc3OnSSAkMD/5ENN5BtufYK0Cy1S6x7JHKRlrGmQVGIDGaKja7LWOqBbvSZEL00btSd
         KrfSd+Lzj5oQtjf1ZsCACXAm9jCXU08FJCEDwTgi8LVHIcmpnXYzvR26POUu3TJTwOZD
         im0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=sbIktRLFdhBBAqfs7hy65u+ywwLtyLZraC8espEvDUc=;
        b=iZaVCFeRKc/n6E7QGzvhzo6mkkDCoUfiZxYMnACTgpCexyv7v4l+5YbgGsiE9YVPtz
         jz8BA24qGg8MSIqM/dsB81YpDldo6U4eQiPYfHoo9TDxuGJKBouhnWBE+pgQe6q7y4w7
         DPXu35GngG7/JqRdiD3/7OXAmbAX0k5rvFBLus4ZzppKiRfsZh5Z/OYos/auuBHva1MQ
         mMMv27QMyhBzNU2LjJFXCJvK5v35Ixq+a00Cyp5e+cRqCNgaIEJPKejNZRkL65ucXrsM
         2MQCw5UwRbS/poF6NV+kdNb/vip+ygHqu7eYbkO3asry9XkTPpXMo9NiSy9VsZSKykBs
         /MGg==
X-Gm-Message-State: ACgBeo2sEY4unbBneW9mfnCffKGX/vFFK9hLX+XVHs53CZQVxV/IDLsh
	3CwNXvMieB6SLSFUeb+gEEtgc/1i9wBdnt8VwWc=
X-Google-Smtp-Source: 
 AA6agR4TrCteEKtBqECCDCOfqo4riPED4RX0Cc/4IBfMaspVRSMXCJKfE6C7z0eac1ZHgab9JYd6ZKjJjGAvHHAu2Wc=
X-Received: by 2002:a05:6512:33c9:b0:494:79c1:8ea1 with SMTP id
 d9-20020a05651233c900b0049479c18ea1mr1771356lfg.26.1661926112934; Tue, 30 Aug
 2022 23:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220830225832.2700943-1-raj.khem@gmail.com>
In-Reply-To: <20220830225832.2700943-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 31 Aug 2022 08:08:21 +0200
Message-ID: 
 <CANNYZj8kG+k3_E-f5KAp6Q5PZGKQy0kzNHUgBgRYzVnU5GGjnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ncurses: Fix configure tests for exit and
 mbstate_t
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 06:08:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170093

On Wed, 31 Aug 2022 at 00:58, Khem Raj <raj.khem@gmail.com> wrote:
> +Add needed headers for including mbstate_t and exit()
> +
> +Upstream-Status: Inappropriate [Reconfigure will solve it]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>

This would benefit from a better explanation: why isn't configure.ac
being patched? What is 'reconfigure' and how it will solve the
problem, and when will it happen?

Alex

