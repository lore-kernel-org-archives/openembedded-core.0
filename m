Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425E1C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 09:47:56 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.79436.1717408072166512008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 02:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ksgu7DOF;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ea9386cde0so38480431fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 02:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717408070; x=1718012870; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QgjcBb7aGX1Eg3n7RUzjI/7nVMseQSEMutWEuEVuw/s=;
        b=Ksgu7DOF8+bvlDQUpNHdm05VT3xGEIazaQPfYHsHGB4QNDGn2AV3wEEttaGBdZhRrq
         cd6VlNzah4YYbzGYYgFi6GeG1Kx7wJ4kSzV0NTbqvyt8Mm9IFrWwc28X75fITbeZAhwp
         SUrsIbFAm6HDlhQEuSDtYIk5ZVehMopvEE7iWjpPnH28z4Y7NhxUMHXdDpmTPdKm+Hom
         iwrKoliHvIkJ/dENJgc8XGdoVlMCD6llo+x+yy5m9WQ4n+X7x26wCVEZ3DlmMiFyZq/9
         YpK/JqWGmpuG11IhD4xnI06FyCTAPEeUriBvtnQJq3wfdJYq27Y9IuRB2ZOQ8B20RWsC
         elcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717408070; x=1718012870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgjcBb7aGX1Eg3n7RUzjI/7nVMseQSEMutWEuEVuw/s=;
        b=uuIkigzVe/Qxq0o0ASGA+1A6Pa7iwphv5JhFJrIkrNSvA+bnbjztn9vAQAPMAN5+g9
         rm5PA6xo/NYLB3UmFNsGCfG5DOaa/8urhUcMeEw/pRm8MD6C8SOhT8rc3VX/qp/G9deV
         VbUyDr4STU7WVI3284fEnOzmLkRZrdnbx0xzk8nz/GVzcsmpiGokjRpy+KNlINfOEMTa
         2RimYfdRjyQFlZUwjq7m4RhjueTH8HDNXSkcG6gUBJ3yaXzCLTYKGp83pBI0PLVl3JVc
         hvRsw4SczRXAl+QtDt5Y2RhDGhl4eiMfammTgeQvps720jYZxVDYSN0yXsqm90Ex/7GW
         tUeQ==
X-Gm-Message-State: AOJu0Yz0roV2j8OcTCisE+WVQTDkxzcPi4FBmuCF9EOebPJoPlGnekke
	rYdrlz4wt+xCLXoPntNxA/83PaPq9TDh8rfUdLrNVChqlmdf1+I9de0X4a1IZhycX0XB84estnD
	EHFDMszgqOIMC/lcG0POlZTR+abo=
X-Google-Smtp-Source: AGHT+IGXguQhcqRpq3YafSxHPYXA3951pKdYOH2hruJo71XOcLMXWN7qF014udQXKbdgE0kKMotlOYjZzdSWWP2cfnA=
X-Received: by 2002:a2e:9ac2:0:b0:2d8:b2e:7bf3 with SMTP id
 38308e7fff4ca-2ea94f58e4fmr52300871fa.0.1717408069934; Mon, 03 Jun 2024
 02:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_4vum5En3xs8nKNOOPCvHSPJ=0Z=VFyCDc4qVsvSq3Kw@mail.gmail.com>
 <30049.1717407619992664732@lists.openembedded.org>
In-Reply-To: <30049.1717407619992664732@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Jun 2024 11:47:42 +0200
Message-ID: <CANNYZj_7E1oMmg866uAPs26xg+Q1HVf-V2pXffciGtyQS_Sigw@mail.gmail.com>
Subject: Re: [OE-core] Set the CMake BUILD_TESTING option to OFF as the
 default setting
To: fbberton@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 09:47:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200241

On Mon, 3 Jun 2024 at 11:40, Fabio Berton via lists.openembedded.org
<fbberton=gmail.com@lists.openembedded.org> wrote:
> Based on this, I would say that we don't want to build tests unless ptests are enabled (so the argument that building tests also tests the code is moot). In turn, it may be sensible to use the default CMake option to disable building of tests.

Sorry, but I do not follow. Building tests does test the code, as it
exposes API problems and incompatible versions etc.

Why should we do something else than what cmake does by default?

Alex

