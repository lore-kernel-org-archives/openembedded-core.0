Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E1DC77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 07:31:21 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.14769.1682580678559066711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 00:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=fZK6s9ra;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2a8b1b51dbdso77021011fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 00:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682580677; x=1685172677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3zay7Gb1cV/9nhlOBKch6kuP1Ud7s9OaD52COIl3PE0=;
        b=fZK6s9raVuJIwugUMhvSf6ffpzjhZx+ZW3SnDpi8X6F3SxU1V7QRvJbla6S1I6K2uj
         BGSfZx5u71Uw8MoO4PcRc+jcZdyZIbfKBt5kW8DqggZ2S0zXLy8vMgODJCccZlfWxRkr
         hv1JPA+4YlIoHbsevefXe0r0StkbQEB25Fh9XkuKbgSYHUwWAHyku5OEVGzBpf1OOvsM
         fpPjIomivUYf+IsXYtgAWv0vCuzvSuapOEvbJbHGufH9SVjWAPgMnvq/SfB6LCdU1AqG
         NgvVQJfaRqsK6wO9Qdk7xfd5hk92sdAgYlV9rYch38/4g/VafPevhDEbA+JD32JK4NP6
         DiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682580677; x=1685172677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zay7Gb1cV/9nhlOBKch6kuP1Ud7s9OaD52COIl3PE0=;
        b=Zu+/dBhhR7TNQ0nnKKPqG/fajOMofw3WdztOIOd5EMdli1LAO+/andh1xXslXsI7Lw
         VRF4Ti98QsgGqnsLYmq3HKd8kG8cvxovRut+ELOlCiW2j2B+aWDKkYJQTIg5Vn08R7Y5
         I85K6gAOOU9u7yNcj0TOp9njxm7lNkj/5UdSMq+AEUsSiC0w3Nyey9DofN46pCiFLNfX
         C+wC6wXNl3RtxnmeYuhtP7ETUGb4RWL9Y+FPgQDl6EWNyKgLT+7x+MMwcpaHIpmv7mKX
         qm3uIXWd+FBSUQAVnPDBwKX+IAh3qcQJv3HEqf8g/aFhuBk8+1wtiZZf7s5IBcveqBVF
         +gOA==
X-Gm-Message-State: AC+VfDxr40tC4V8axe/fscM0FSRzbjAq4Bxjed5ZhlPYbn3iEmpDlFl4
	iwXSuOpyZTNm7t0GlueT+vaiNE6Ynpg5r6Ugld8=
X-Google-Smtp-Source: ACHHUZ5Q+E94dnvnpT37i4I20YzO0dr8Ems9Kvp9VQX2k9zLsvJlnHrpPQTXxDZyveUQfnuHxEM6nVs2eeLC0ytC2oU=
X-Received: by 2002:ac2:5397:0:b0:4f0:c2b:f61d with SMTP id
 g23-20020ac25397000000b004f00c2bf61dmr265997lfh.49.1682580676760; Thu, 27 Apr
 2023 00:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-5-alex@linutronix.de>
 <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com>
 <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com> <CO6PR11MB560204CC8CEB29806F20BAFEED6A9@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB560204CC8CEB29806F20BAFEED6A9@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Apr 2023 09:31:05 +0200
Message-ID: <CANNYZj-VX7Rs-xWimADJWi4Xm=rPesvp03A_cBqWFuYPEss8Ng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/11] bitbake.conf: set minimum required kernel
 to 5.15
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180474

On Thu, 27 Apr 2023 at 09:30, Chen, Qi <Qi.Chen@windriver.com> wrote:
> Does this mean that SANITY_TESTED_DISTROS should also be updated to remove all distros with kernel older than 5.15?

No. This check only applies to target kernels built by yocto, not any
of the build host or sdk host kernels.

Alex

