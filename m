Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726CCC48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 11:02:01 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.38837.1707908514087918917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 03:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ddJsaPhl;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51197ca63f5so2480310e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 03:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707908512; x=1708513312; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ohnK7FrVM1Uz59D1mbIUM9DoR6POPqGjVKfBd5uNrd4=;
        b=ddJsaPhl6xj/UgYcr5ywJ1dFstjuCkMxy8EzXUthnlgvY9cb6aqCKXkaP782lmWooP
         gP4PkD2NBepeUV0/+h1ACRtAjNwU236iimu06EhhUb1AFZgGCidVloPjjZe5/iBqOuua
         NN8/58nvt9yDV8919Zapjkfh4MzYCQCwE6Zxo1UwsqNgIVHspecXgRLbDgoIsbP0XsKF
         1nR0/D7VHGKb117JlRZECpvmp8mW8RobUsxPuEuESxS86UDgpml5cGviLV7F1T2EJ0Pn
         2+eKB96LtEKE6JKC0Id5WNXYJrtHiKD550rK6uP1kYD824O7xjE9dRYZ94OCRsJcU5qp
         SDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707908512; x=1708513312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohnK7FrVM1Uz59D1mbIUM9DoR6POPqGjVKfBd5uNrd4=;
        b=O/EieQSW9jS0jBSjp8n01nFQQHyV/eOy8pVYtBLtBkk1cyvcqGrNbgNSrs0cxIle+d
         t2q0gnYsQUPbIruwBE4RhzRGupEY0ukPDKw5q16cM1pOTOqH5tM91jsN36xN9VwBr2JA
         JsmdwmIihc767NeqzvGAeVFVS+/2t+36p4xLsIL4OD9nmrwQdHU1d0QueHs9Wol0BZyp
         EtiKWJ+fclMeFl3nu3Ina4VGGs5XoyZk3ZaeN/C9nqWROq22EYtzOXLv8VX6N3yBpuji
         L6jf5V1SwEPg/vzR/7s3cexetm/OYvbjTcQhc3jK1ocuC5QbT4AufH/ZzSIGQ4QmVXtg
         Dvyw==
X-Forwarded-Encrypted: i=1; AJvYcCW1IsJbCzX94gp5Dxzvudxj8nhzzx56V1O6Bo/8psd37IKpbwKsNZUutCZ+6XQ61+KZw+7o0MMFSW4rK9xQ/SbAxsYiwU+MwUSuhJQHa2jmN7gzlR1qQLuQ
X-Gm-Message-State: AOJu0Yz9bz9y8FT8CeEjGS0DS7vpCjtvwxhurW2bCPOqDVfwdr7/phnd
	f12RfBa1FnYwqgEy6LzJHeVy/rRbjW3WqNNnlmT39SArpPCd6yJqSn2RcoOAEpNCJesvCg1JYSu
	NH+TcAklKQpAA2tV5WpWOC+KwXXI=
X-Google-Smtp-Source: AGHT+IGQtmf20KpxYAeZmmmc7hqTyDIHcZd0HhsQzqtJ1dO7v8DmJDy7/juEMFI05+8WdFnl4SjBavgAQcDw5Qiaz1A=
X-Received: by 2002:ac2:5a01:0:b0:511:577d:10de with SMTP id
 q1-20020ac25a01000000b00511577d10demr1631406lfn.37.1707908512038; Wed, 14 Feb
 2024 03:01:52 -0800 (PST)
MIME-Version: 1.0
References: <DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
 <3c844a195548fa8d0352bfc469996f3077eb5a0a.camel@gmail.com>
 <33e57963-8887-4c95-ad8f-654afcea5e74@savoirfairelinux.com>
 <14a1b53384f2901878d7b4ed225edf8254af07f9.camel@gmail.com>
 <CANNYZj9UxD9-Owt6H1OouZXu4WYWOoUnh77g10Cihj5nLjoAPw@mail.gmail.com> <4582012f-7518-462b-bee4-5777f28cb28d@savoirfairelinux.com>
In-Reply-To: <4582012f-7518-462b-bee4-5777f28cb28d@savoirfairelinux.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Feb 2024 12:01:40 +0100
Message-ID: <CANNYZj8GvH4RKa9phsQ7oSv2b0604DtLa09W1Fndm-bA3KANVg@mail.gmail.com>
Subject: Re: [OE-core] VS Code plugin and multiple build directories
To: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Ross Burton <Ross.Burton@arm.com>, Mohammed Raza <mohammed.raza@savoirfairelinux.com>, 
	peter.kjellerstedt@axis.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 11:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195465

On Wed, 14 Feb 2024 at 11:56, Enguerrand de Ribaucourt
<enguerrand.de-ribaucourt@savoirfairelinux.com> wrote:
>      "bitbake.pathToBitbakeFolder": "${workspaceFolder}/poky/bitbake",

I asked this in a different thread, but perhaps could ask here too:
how is this setting used? If vscode needs to run bitbake executable,
it can do so directly as that is placed in PATH by oe-init-buildenv,
no?

The reason bitbake location is complicated to set, is that not all
setups use bitbake copy contained in poky; some use separate clones of
standalone bitbake repository that can be anywhere.

Alex

