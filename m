Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5794105A583
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:22:19 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19201.1773314533040439008
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jJueHcI5;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-89a07f66f4eso10958996d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 04:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773314532; cv=none;
        d=google.com; s=arc-20240605;
        b=D5eXU5uydW6SY5wgAIqqEzQkhcoGsoQZXoGjld918bFeLvVKsjCJjuQLJzMkwl3cjh
         W8cFsqDC42Z+bZ5I7pgxrB/iqPPv0yV+PoYVtjeg9J3FQ2eGW+Ol8RVsObGej1wCFEuI
         vqFMtmFu3uR6EJ9ry/jW5utcQOfmYWKVjvF1c6uzJVrW+LAjwRo9oGz0TfrlLMvS0U1/
         I2i0jWNv8sdbC4AwCkWVIN4PhMqzcRrVdGD1SQV82D6w9jx9rX+4YhR4ec3P4X+1Wdkc
         BIeW+NDRiwf1kT2MzAec8JNut5EjHgoKIRz69KEZ9bXGvPrWY/gvGRa2n3vIyP7UjmQg
         8I6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lrV+No0aklH6Lmyk7hI/++DQH9mRkJJdZ1VO4F8u+tU=;
        fh=jVUlJHNhWiWuBMjna+1VXRvN1hElWSF8mVbncmwVn4A=;
        b=KF+0KzrXYT8mrpLhg2i1+DysLpRHarDuoaKIBlIzsagSh8vOSiUkKOz0pZVitWyBI8
         oAzRaSDsJyus9nOHetrv3333wTKufE3yyqft5ax0KSEpA52O9dmfy0dP9Rpn01C3OtA9
         8Vvx7IWFDHSVR+65g3li/FD6FuYPf/SH06+hqurwGlfyw3IRErYMQg8ffLjagJHIfsL4
         g+tsTfV8wUANvSF2vU8UUNK8IhOnhM3y5zFWmjp04ZE/4qCPljIZEycq7SwSyFuQtwe3
         2guVu5iWPXY4vDkm1MZ9Vo/pC0+MaILhBcIJTNMYaa9iCCnVK5tGU9pagh0b4ESvQPAu
         eq6g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773314532; x=1773919332; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lrV+No0aklH6Lmyk7hI/++DQH9mRkJJdZ1VO4F8u+tU=;
        b=jJueHcI5+vDNtu2AOJE1pd46UjaFcR5PVbdhvQJSMJ+eAWm0K1yOp9dvrX6lhapNA9
         w5m4RJCfAjnBsXu6XOjSQINfW9u5vB6MDWdWlPoG8lUkvss+4ESgNOlU8M4Dg8Ewua+z
         ijVX5XkYkhSk8uSbYyW+RpLq/bianTLDVKdIqIr95bnZYYppg9rU+PNKzlPt/f/PLscj
         1OnlJ4XTIN7jrkqPyXYpRIC+FDd0Ls+sj0++aDWRRsfpZw0AwtUMsZexcau2SLaZyUGM
         BSjKrkHrrT2OEACU/KrOWOtgNRTm++26dlHJlIE/uHT4MhSnCk05BVVbR5AS0Lw5P2Df
         01dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314532; x=1773919332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrV+No0aklH6Lmyk7hI/++DQH9mRkJJdZ1VO4F8u+tU=;
        b=BzRqCnbpqUbIhGofa2T29KrQ5q5QxqpaXns2rJjgdoqWI0Q6U2u99yLecOvdFwjKZ0
         9aFMbo2vS7B8sCPVwPYw+yxOh9MzFZHEdWV4k8I0VOMD5h+xgGoKI1Q40oFt4wxkRXU0
         uHOhKOORPM6KFWVXWhszM/wbr9lPOUvYSt3uMTieVQOeLvjlwiq1/1DgkyOa/Hvxr562
         YShl6DOdF9ZmQpxsMSHtfSTWrNIO99fE8QBUB8tOFLRTtq+vyHUBsq7x5fteMCitvhh1
         7Y3wZGffx8k3rqNiORCiYTQEmcX40UTmmnNoTKfQJEDHvSzckY1ZlSBpQ8CQFd5I2xiF
         EoMw==
X-Gm-Message-State: AOJu0Yw81JDGvxjCpiqfheFPfqcoYq64wPdXvOhzzPsMHlIJNtYdbHbj
	r+zppY83B/HV6vdnJL4uJ+uUtdZmNsfxLS9OrkwEiORqr85qHVCL29JHVyKq/ZTDD+TH8xU6ica
	pUVqj93e5wS+UKoj3ATLDm595Rcb0LAw=
X-Gm-Gg: ATEYQzwxL1RiyHefVs6a2IlnlRWn2e/3VwEKF5wOrf2gP4C0AtecoDslAxH8TrOe6CT
	v8FXfEo8iAMmeZEjmD2R84VYemfYtvnr/nH8ApvKRzbLpGjvysSdUMLvCZcH6HzCyXWHjySjF46
	KCHYPoVH42YVttO6ehXt6/Z3lKgTGIeMppvmbgbtudMVCpRPGswstyx1iifh1Za/CQPSkd9KJQS
	Mt/aAHuqmxhQwrH951co/6G4XmAJatsrXeYhr8xogFYJMs92CvOD3XlyKF3m6ZHbdCxY7qFp+w2
	gasXBOXkugfGY7OpsFBZgOth0HtdFfgrJvf3TIJNPA==
X-Received: by 2002:a05:6214:622:b0:899:fd8c:55d2 with SMTP id
 6a1803df08f44-89a669da324mr83932106d6.15.1773314531967; Thu, 12 Mar 2026
 04:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260305053505.1632077-1-alistair.francis@wdc.com>
In-Reply-To: <20260305053505.1632077-1-alistair.francis@wdc.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Mar 2026 12:22:00 +0100
X-Gm-Features: AaiRm53V6Yuwpzejg9VB7CR_1Obd9K7Rst74E8hgj2XAxZyiLbdHcNmV_5pNgnE
Message-ID: <CANNYZj9FNw4F0228tOo_BJUzrkvWFy-_5pLDv7XG=J-Z3FWP0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] machine/qemux86-64: Recommend extra kernel modules
To: alistair23@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 11:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232938

On Thu, 5 Mar 2026 at 06:35, Alistair Francis via
lists.openembedded.org <alistair23=gmail.com@lists.openembedded.org>
wrote:
> When bulding Linux with kernel modules by default they aren't included
> in the qemux86-64 machine. Let's ensure that they are included by
> setting the MACHINE_EXTRA_RRECOMMENDS to include " ernel-modules".
>
> This is already done for the qemuppc64, qemuloongarch and qemuriscv
> machines.
> -MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
> +MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
> +MACHINE_EXTRA_RRECOMMENDS += " kernel-module-snd-ens1370 kernel-module-snd-rawmidi"

The consensus in the patch review meeting was that BSPs forcing *all*
of the kernel modules into images is actually an anti-pattern that
should be avoided. It should only list specific, known to be useful
items, similar to how linux-firmware or python modules are packaged
and installed. This has unfortunately gotten into qemuriscv
definitions, but the correct approach would be to replace that with
specific module lists, e.g. by replicating autobuilder tests for that
target:

https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json

Alex

