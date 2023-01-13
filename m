Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1E1C54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 10:00:44 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.82656.1673604041128829834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 02:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vh0mjYW1;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id y25so32372087lfa.9
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 02:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z2KN3T/Vs1rZMad3ZkTaF0dzW505/mYaKYY9DPnBco0=;
        b=Vh0mjYW1RYeLlZfgeO31ighDGRA/8/hB32xULlwuLO+OI7L3XKln0JJMZj9hyKEclq
         wq+YikRTOBhgiiWq3cNlOfpYmTCuSnDKjfR/RMzg8sEhhaZkXbqzIgNyzhbOWoPEutTn
         EJ8RLoPHmekaZUYonKylJesRtwctjqWax59MUv8RsvWV4fgXPJL7zcyCRZsqMqwA8rKH
         yRV8cs7+SvO3jyZ0j5GQ6wlFUGubDEI4wJfnnaCDDuIUxqOsTD2OE858hAG0CrkeZfyJ
         REGd37M4ujSdK6BuZSjB/q6qRyuh6TUotledGPViv6wlbgrSfHAVRzKpJMZkoliL54rq
         Qg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2KN3T/Vs1rZMad3ZkTaF0dzW505/mYaKYY9DPnBco0=;
        b=1GikFD7B5in/6u9SxFUUKG30JOyP/x0Kpt3jCIwsHS3n1NtSfuugAy9r3Kg1ZGZjPb
         2XuNf0nowwf4dfyiDxqgQI9vl1jprUzN6P8QUFJ+watxa9XIKG7eo6XZS6E/q5DZhH8E
         GDLyGgSUlnkqT4YYKOkjo3sQt6qQU6Gmit8ZWsnXOr3o+F4xwnK1ur6urmxbhKrFr+bg
         dB33vtLiyhIJF2RwmtmT4gkIIWJWzwW6Eu01JXZCwE4Szis3E3Ifl5kjMJct3Tu732Wk
         A1NDmB0mcbcqnztCguG9noUPtrustM1NAHXTMW8E1XKRmkWHpV4veMXADFNhZlI8N4Bi
         Bd7Q==
X-Gm-Message-State: AFqh2kqPFKUBFFRVZTSwC1dIsMt0VdmAEYqvfWzt3VIzGt2UTuzg/aYu
	Ak6Le1E36FsFhrNR2nA+fKiC40Qv0phC1K2rSsQ=
X-Google-Smtp-Source: AMrXdXuTGZ4UvG6MwZ1GTbsnHL7ddlTnUx0vatrzV2SUDI4/oMxuA5fot8Z1T/wBSRTK1522315jH5570IlYsu0MeHE=
X-Received: by 2002:a05:6512:39ce:b0:4cc:716d:e018 with SMTP id
 k14-20020a05651239ce00b004cc716de018mr1448943lfu.367.1673604039108; Fri, 13
 Jan 2023 02:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20230112213301.11768-1-s.zhmylev@yadro.com> <a956c7ec6640cfee5bebb41720beec74e8b663cf.camel@linuxfoundation.org>
 <dca56133ff38a2700cdeda8832d187e8f1863a63.camel@yadro.com>
 <CANNYZj89sJH398ksmtB-TRcTOW6_MYKsDdCie3mHe7QRvKu47Q@mail.gmail.com>
 <8eae30b2192df5bae48ad7c8eb028b868ef89e55.camel@yadro.com> <ea059c6fd86267376a501008384d57dd9c7f96fa.camel@linuxfoundation.org>
In-Reply-To: <ea059c6fd86267376a501008384d57dd9c7f96fa.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Jan 2023 11:00:27 +0100
Message-ID: <CANNYZj-P38yonASaKJFq_r+KvKvX6wj_7j7O=NFR3=SeUt-38Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_rpm: allow arch overriding
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Sergey Zhmylev <s.zhmylev@yadro.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 10:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175819

On Fri, 13 Jan 2023 at 10:50, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Can you perhaps convince your audit team this is a sensible usage given
> how the project builds and uses the rpms?

One more thing I want to mention is that if you want to align the
architectures so that you can install RPMs from Fedora, RHEL or any
other RPM-based binary distro, don't. It's not going to work at all,
or will cause you lots of pain and suffering. We use rpm for its
packaging and dependency resolution functions, but no one ever
promised any kind of 'compatibility' with Red Hat products.

Alex

