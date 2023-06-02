Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BA4C7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 12:21:47 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.11130.1685708498118003384
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 05:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Fp6npdvk;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b1a3fa2cd2so23310251fa.1
        for <Openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685708496; x=1688300496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqWorUDQXtcfjjeWSK/mwKHdot91jzN0mvPYSXoREhs=;
        b=Fp6npdvkDNlw6UVjFr4KaE9MPXwN8alRA+YOcC1krnFawyiYKrk2Beh6XuhhvgzTfp
         deoe1nVC4jUxRyKnzDOska4PqnYr/H26pc3Q22v9YFUYXgeIjH3QKUr0blYxKGdY8Qs+
         Q1Wtav6yeDZWWXOcli7/hFzPWaGeB7bWsmMroKRj1s4TG1MXz42a3/PED+++xG8qNuCF
         vKRvCIpcB9QwjwWUfh+N+EB1sbiW3Wy5WysSlyH6Vf2wkPEkaoyjLvI9xVjdpfTXDmCo
         QAeExm1JAlgE7982A9k4ajCS7/mh3l8idm/zaUP1pxxbNlRJB0cF1mACqque/3vlcIh/
         E0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685708496; x=1688300496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqWorUDQXtcfjjeWSK/mwKHdot91jzN0mvPYSXoREhs=;
        b=F2BTu94j7U+PXXnOiVZh0uFl1DAa2MPrcnfGs/QCZXa0ur38Qwfdv+hCiB+7OaOR2O
         Uz2snSlrz2UOTVzi5iVR4pryKLHw7nsWW9QYOf03NzjquxukEF/RJPLkKU5bqDGUISlJ
         ShQStciwe7UEvwOV4SvPiDSSHRaziqDHWkM3++jJScQd1c2X1P30muFi8MceFLlMHXkK
         6ezeTBjLrlPls2IzaFvvJKiMoBIaysyStLpw5NKK4icKw/et5KZwe9l2doMEBd25blhE
         M9CF/nLl+JAC/pHXTKmMfxIPzx/cw5FT9CsVMKOgUOlJkuN14nqiD4fhFs97xwfZqqFo
         E5Ng==
X-Gm-Message-State: AC+VfDzF1BxzAzzkRFhemSXEsHtpmobF/u9xmlMDRIYMyK9OemUph+O/
	y5FUZL04kLOjKhP4LAmo4NMoa7SR4uLPdRE5BfE=
X-Google-Smtp-Source: ACHHUZ6HAO0sQvlwP8rcWta7zS3CKwbcjxzWPUCQ34xIOy3X0lAO9qUUE4G3rQN95iP0mTOxjA+FYu5+jsSNKN8M32E=
X-Received: by 2002:a2e:9790:0:b0:2a8:bd1f:a377 with SMTP id
 y16-20020a2e9790000000b002a8bd1fa377mr1581374lji.20.1685708495927; Fri, 02
 Jun 2023 05:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230602095037.97981-1-alexis.lothore@bootlin.com>
 <20230602095037.97981-4-alexis.lothore@bootlin.com> <CANNYZj8vV1=GOacn_vHpfeJ1h29AdLNJsO6X-wXPrW9vahc_5Q@mail.gmail.com>
 <ZHnYGjE3ahdytp+g@nuoska> <228e247a-2121-d1c6-95bf-51f18ec95e03@bootlin.com>
In-Reply-To: <228e247a-2121-d1c6-95bf-51f18ec95e03@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Jun 2023 14:21:24 +0200
Message-ID: <CANNYZj_1AJCrsAmzyS7gu02oZF3oC8h4iHL0SnGSAqTWEt4KLg@mail.gmail.com>
Subject: Re: [OE-Core][RFC][PATCH 3/3] testimage: implement test artifacts
 retriever for failing tests
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 12:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182313

On Fri, 2 Jun 2023 at 14:14, Alexis Lothor=C3=A9 <alexis.lothore@bootlin.co=
m> wrote:
> I wondered about this possibility while adding this variable, and at this=
 time I
> thought it would encode to much "CI logic" in testimage class. But since =
you
> raise the suggestion, I can update to pass directly the file list, which =
could
> indeed be overridden by CI tests runners. We can start with those three p=
aths in
> the default value.

But this isn't CI logic. It's bitbake's QA logic, which can and should
be available in local builds. Running testimage locally is a supported
and regularly used operation, so it should work exactly same as in CI.

Alex

