Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4ECC77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 10:50:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.23937.1683283837173149398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 03:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=KVCIW9k1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f1958d3a53so16358925e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 03:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683283835; x=1685875835;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZzANoTDmnt9Wfht8xOgoQXDmAWHuDhjIMsHSOvge0t0=;
        b=KVCIW9k1NC7rA/UICsjye+h3rd7zIaFLerXX1Rxa3nDsT4338vAonylEdQWqd09ue3
         92Zsm4ro1lafz21LXaTIZOW5zrXfaO2NyNhoQcHSXWGpsztGM4agPkmHAoBHQ1o9NOoE
         ZZmlWT6pqOBWpaUKtI8qCrFXf3Zt2vuxhtcjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683283835; x=1685875835;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZzANoTDmnt9Wfht8xOgoQXDmAWHuDhjIMsHSOvge0t0=;
        b=RNqRrruIri6/E0WMQWJLl4p7yMqKShsqTvbuXG5PAQq+8LDc/mvw++X6bQQ64HWvsr
         CX0DLELpXxq3L4/hTq5e6e5X6d8cOCBUhYtfvlukazF9cryFlcfIajPycwmNdOq2/+b8
         tyZKCkaPW/Wqc3yo00sLMwQ3FLtYimD5+EqBDNCljn+WSQX0I9s4rjBsIFeVcp/McTqO
         FG1CkDqw9toBWuCvLnUjZ3MhqfTGHU6xv1hq5yLKY+zFU49X4IpB0qJwEffADtw+CN7Q
         fomOw4RLXtzk87BwDae57kRsI+eBuwwIVsDZDXlbDs1wcWiNMW1TmyYsdQfhzbEC9uoT
         O0pw==
X-Gm-Message-State: AC+VfDxIiu5pm2le3URkJHhIIZ7dFLkdS43gImo6jVHg+RV20jckbzdA
	cs0gpy1LF1GPskmlONb0Yn8iQA==
X-Google-Smtp-Source: ACHHUZ5+vK342gSV2+t/mC6/jE3SninGG87qR5SndMNz3kOPCjdyeTsqnHQffBtA0KFoixM1ob3vJQ==
X-Received: by 2002:a1c:7c12:0:b0:3f1:7397:6dd with SMTP id x18-20020a1c7c12000000b003f1739706ddmr751732wmc.10.1683283835579;
        Fri, 05 May 2023 03:50:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86? ([2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86])
        by smtp.gmail.com with ESMTPSA id f12-20020a7bcc0c000000b003f17848673fsm7679017wmh.27.2023.05.05.03.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 03:50:35 -0700 (PDT)
Message-ID: <1b54d3066cc49b1598ebfc9e2ae287fe9558f869.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 1/2] oeqa/utils/qemurunner: change the
 serial runner
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, "lrannou@baylibre.com"
	 <lrannou@baylibre.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "khilman@baylibre.com"
	 <khilman@baylibre.com>
Date: Fri, 05 May 2023 11:50:34 +0100
In-Reply-To: <F625F79E-BD48-4A70-BA5F-D5BC13ED39D3@arm.com>
References: <20230411150503.2105880-1-lrannou@baylibre.com>
	 <20230411150503.2105880-2-lrannou@baylibre.com>
	 <F625F79E-BD48-4A70-BA5F-D5BC13ED39D3@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 10:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180907

On Fri, 2023-05-05 at 10:32 +0000, Ross Burton wrote:
> On 11 Apr 2023, at 16:05, Louis Rannou via lists.openembedded.org <lranno=
u=3Dbaylibre.com@lists.openembedded.org> wrote:
> > Create a new runner run_serial_socket which usage matches the tradition=
al ssh
> > runner. Its return status is 0 when the command succeeded or 0 when it
> > failed. If an error is encountered, it raises an Exception.
> >=20
> > The previous serial runner is maintained and marked as deprecated.
>=20
> I absolutely love this because the existing run_serial has the most
> confusing behaviour. However, we=E2=80=99re now duplicating a large chunk=
 of
> code: can the old function be implemented such that it calls the new
> function and adapts the return values?

This has hovered in the patch queue for that reason. I also love the
idea of it, it just doesn't feel quite ready.

I've been hoping we could convert the existing users and be able to
drop the old function but I'm not managed to see how much work is left
for that.

Cheers,

Richard

