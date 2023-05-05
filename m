Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA0EC77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 16:51:40 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.786.1683305498976503631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 09:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dYLRXX1V;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f004943558so2300584e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 09:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683305497; x=1685897497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGDI+iBqHH0KjOazrY/B5OiwRiHaZI5IBd6LxzOCOM8=;
        b=dYLRXX1V6yFjmTbwJ2EKp19yJqqXSAgS6jePeTnc/5NHy+Mx4tGCXbqlyhz/1pepNg
         sV70+twulTscC7OuPEvJID6Gtw3+ICNt4uaJOD9BaOd9qeEeuiRZAIxZHm0wCuccwWN+
         +EYigcra2idGrU+/+mqoj8ZJF0xIRZ5TSgppD4Zr8KbH14LawZmBAorLtX1IcvBbA9+2
         Nvy1nNibNwfrd+1RVVeDg7xiS+ijY9oyhezL7K46cDlrleLfNsFDnx7out3VHIh++m0P
         ZnJx0LKT68ZIj9shKsrJBjZd+vGFlDfcO6jh2L4jvplRa4brD2wbGba5mZLJkWGB78Dn
         tYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683305497; x=1685897497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGDI+iBqHH0KjOazrY/B5OiwRiHaZI5IBd6LxzOCOM8=;
        b=AYsjjz5GwDOmMDVUhAv+s8ZQiA17orj6hFyVhwlGmsX2YYK+7nYc9Zb4xCvm5N6huK
         Vl7+exQ4/FPkbgME9kBdtzmQxT7CtQEYOpfDzgzkMC1octUGn/ifn9cmySTNUKHGpyZv
         7nDbPL8+z8GQFCkN3BanTcvUMR2bla6kPPlzG+mfnK/SlBXGKS7SEL5LqxsSvRrM5D/G
         vxFzgicplJnzmPBpvx9gSN7mGeiQT4hdOoGMiRNx/6O+wnRFVkgbCuy3n5+B0uF7wvo/
         3SjRSHQbC7ECHx9+Fus7Fp9PlHexNEYs02631EaQzJgLwELb8GUXj9oaNE6+Kg98Dq5y
         X8ng==
X-Gm-Message-State: AC+VfDwWi0s/HmO/A+bD4E+J+62au+8sXrOpkIY26shPg0xDPwfz9E6P
	z5/J+QmhTKqJSVg3A6nhDF+SKKO86SqHd94aTs8=
X-Google-Smtp-Source: ACHHUZ6bOgZz0dt0r9fwiz3c/Qi8d1j50+W59pAphhOvtJMcZWAan4xGfqOel2IyqZjXBUmbBLATPEMQEUaoJb31Fa4=
X-Received: by 2002:ac2:47ec:0:b0:4e9:6033:20d3 with SMTP id
 b12-20020ac247ec000000b004e9603320d3mr695748lfp.24.1683305496654; Fri, 05 May
 2023 09:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230427073528.3956414-1-alex@linutronix.de> <DAE64A67-C0E3-4880-AE19-357FED7695C4@arm.com>
In-Reply-To: <DAE64A67-C0E3-4880-AE19-357FED7695C4@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 May 2023 18:51:25 +0200
Message-ID: <CANNYZj_ynuqtXg_=A11cfd9-PNTamKcbVhKMCG7-98+g+PwLkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] insane.bbclass: add a SUMMARY/HOMEPAGE
 check (oe-core recipes only)
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 16:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180957

On Fri, 5 May 2023 at 13:43, Ross Burton <Ross.Burton@arm.com> wrote:
> I=E2=80=99m torn over this and the maintainer check.  I like that the che=
cks are being done earlier so they don=E2=80=99t trip up in oe-selftest, bu=
t I don=E2=80=99t like that they=E2=80=99re errors.
>
> If I want to add a new recipe to core and use devtool, it will immediatel=
y fail to build with errors due to the summary, homepage, and maintainer fi=
elds being missing.  For this reason, I believe these should be warnings: t=
hey tell you that something needs to be done, but you can focus first on ma=
king a recipe that *compiles* before having to write a nice summary.

No problem. I'll correct that.

Alex

