Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9872AC001DF
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 11:50:59 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.59286.1691495451024183912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 04:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TobHZbtX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.179, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b9cd6a554cso86536971fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 04:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691495449; x=1692100249;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wYQpDIpT7ZM/4Ee3qou+NcWOZyQo9yT6dSPaOFhnhi0=;
        b=TobHZbtXfCt+IoWtd1aaXA3p+aQN4kp+BbrWwmTKOF8EBxRjwwB/T+AUYkrlbS/9Wr
         FCmT96AdfP6z6xFBMzs+A2AIJpNdKhbMnparFaP+b90REeaUCfmDaYLSEZxZGX818/yO
         bSvLEi48MYl/3YjQVAjbek4DKRxCTmIzu32GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691495449; x=1692100249;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYQpDIpT7ZM/4Ee3qou+NcWOZyQo9yT6dSPaOFhnhi0=;
        b=COLcsoyRsg2b/0jC1EPbIYAu682swaQLDGCpYM8A34QhZTpozEvuG47e33dTl/ArKW
         fRrt/8J5MBVRGIyo1EOcLaMd/hPS4JMv3dEMHorkC+UNeo5+21sT53YYZjFl2xOxoDpM
         nLi6T47B9kJd7eeqOxOzPy3j/YAPYG5zlpyijDxWBTW8ZTiaUCTbfXjFq1RdEo6sAvSE
         LwT9f+GqQkatkXym+onjNSOO0IjkJ5M6eiwUoG8GPfixGDrbL2KwDdln3QW7v2eCwij6
         5W7zNBUGs/MLS+MjQ9Jflj9PfodVP1Lis1xHn60cVMBLveTkWu0CkXKyWj3G09K/ZW/+
         wkmQ==
X-Gm-Message-State: AOJu0YwabmZhyAUra3pNR4r+Fm+bY4lafqzsiolM0IdvZwWh1bufuNJX
	NHhDl0Kia12zc6k40CQnAT3TQe6l8NcLj7cmJSk=
X-Google-Smtp-Source: AGHT+IGr3/osPa41eAaLNNZ3oNLyzUVYsyFodKHJ5Jhzx5X+Ui08imD/sVqdrjRz+h5Bp8JdgNYd4w==
X-Received: by 2002:a2e:8913:0:b0:2b7:7ab:3c60 with SMTP id d19-20020a2e8913000000b002b707ab3c60mr8994867lji.32.1691495448910;
        Tue, 08 Aug 2023 04:50:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8c9a:4256:d8e9:42e2? ([2001:8b0:aba:5f3c:8c9a:4256:d8e9:42e2])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b003fe1630a8f0sm17683373wmc.24.2023.08.08.04.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 04:50:48 -0700 (PDT)
Message-ID: <000572c1ba81252efa552b812b0dc0838772c2f1.camel@linuxfoundation.org>
Subject: systemd issue with network commandline config and 6.4 kernel
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Luca Boccassi <bluca@debian.org>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Tue, 08 Aug 2023 12:50:47 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 11:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185660

Hi,

We'd like to switch to the 6.4 kernel and there are two blockers. One
of them is that systemd appears to be breaking the network device
config with 6.4 kernels.

This happens with core-image-sato but not with core-image-minimal.

In the sato image, I can see the kernel gets the ip=3D commandline
parameters and sets up the network (IP-Config: Complete: <correct
info>) in the dmesg logs. When I look at the "ip addr" config, that
setup is gone though.

The autobuilder manifestation of this is for example:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/7580/step=
s/23/logs/stdio

i.e. ping fails.

Does anyone know why updating from the 6.1 kernel to the the 6.4 kernel
would cause this only for systemd images?

I couldn't spot anything in the journal but I'm not sure I'd know what
to look for...

Thanks,

Richard

