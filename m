Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097EEC7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 12:02:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.10765.1685707326777730631
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 05:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=ieespDm+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f6ffc2b314so24608975e9.0
        for <Openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 05:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685707325; x=1688299325;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KMZP3m5RedYDNByWNzRO2IsOmCIcUVQZ3wZr+bDgVKU=;
        b=ieespDm+myvYSiFJOLRRfZs6ECNmw5+OB62ldHSWXS/+o/R3HZAkMUP+pfIT3U/y5Q
         At63941v9QA7j78GBKZ21kFXkZsCLkfg2vGZMQ4s1ufG0A5jVi5XlJKAW8WOH1GlevgW
         XG61l8XuONsu7WfRfODYdrS5TX5mmS5IjO4yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685707325; x=1688299325;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMZP3m5RedYDNByWNzRO2IsOmCIcUVQZ3wZr+bDgVKU=;
        b=Z+GG1EozWcqSsF65bmhawWYKBVUGwcuhX3HagkPxGXQvsoIq0hfyAcYThPr1xNrnTX
         gXNVztYR7xQSwRx64qhlRSMdYuz0AX735H6dXCs132YMtE+/CGomvKmiyWwfBSfzWITS
         TfRXUzTr3dzXMvQTxU0jSYiCl6Pf208+eUbxqQbXcHGC4+84uGIZKQKBE6oB6lI6RTxb
         rUL6UxoUcoLbeVwqAycodn8SN6i+wHfGDrWM2VPzDAzdyW9jTFcNZH4Q++pH5JsbYLHM
         5+U/vwNhPqZTNbSTyyutaDhzsCAinJQPryX8KTWeinisLIUMDNUMi5iM7EUYLz/M6ho1
         57aw==
X-Gm-Message-State: AC+VfDzrlY+3hFyB0/5J6vCAGRSA+4d5SVi7e8pz/78bsjOWiWndOn8A
	No2Obvg5GpjAL4oc60JdG4Xhdw==
X-Google-Smtp-Source: ACHHUZ6KG6y5Ykyjiq5khtGqYg1+lHOhLrOVBzAE0L78K0rUDcTSI1OtBYOhWRup6B5ntcuAzCKuvg==
X-Received: by 2002:a05:600c:2c4b:b0:3f6:8ba:6ea2 with SMTP id r11-20020a05600c2c4b00b003f608ba6ea2mr1812825wmg.15.1685707325256;
        Fri, 02 Jun 2023 05:02:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:527f:ecab:4831:c523? ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id c23-20020a7bc857000000b003f0ad8d1c69sm5295663wml.25.2023.06.02.05.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 05:02:04 -0700 (PDT)
Message-ID: <7f52a730227e60bb145201b27fc3fe827e2cc63a.camel@linuxfoundation.org>
Subject: Re: [OE-Core][RFC][PATCH 1/3] oeqa/target/ssh: update options for
 SCP
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Fri, 02 Jun 2023 13:02:04 +0100
In-Reply-To: <20230602095037.97981-2-alexis.lothore@bootlin.com>
References: <20230602095037.97981-1-alexis.lothore@bootlin.com>
	 <20230602095037.97981-2-alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 12:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182309

On Fri, 2023-06-02 at 11:50 +0200, Alexis Lothor=C3=A9 via
lists.openembedded.org wrote:
> Add two options for SCP:
> - by default scp expects sftp server to be available on target, which is
>   not always true (e.g: core-image-minimal image). Pass -O to force SCP t=
o
>   fallback to legacy SCP protocol

We deliberately switched away from SCP since it is deprecated and will
be removed in a later openssh release. This is therefore a step
backwards, we really need to do something different.

> - by default scp expects files. Passing -r option allows to copy
>   directories too

Cheers,

Richard

