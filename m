Return-Path: <mans.zigher@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12B8C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 06:52:26 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.3737.1648536745499611980
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 23:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BWsJuiao;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: mans.zigher@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id e5so16797823pls.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 23:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=4aNXRjvvuERJzk+yC/bc3nay/17I6ZiI/SraUgeN70w=;
        b=BWsJuiaohWjLuz6nFowPgzmcw1P89B4k8lDh0yDtg+K+kEBjxkK5GYtEoYpzwOT3np
         dwuJXz1XFrfBbzJgUt267Pc3PjoZhLvfmNx9YSLGUSDn9HPVd5N1zx7t5YqhcrKrujTj
         9r2fNf7wq9d67bz5bBrzO9gxSQYLdmmF75pCVFjX+SZIsrc9OebaoyILUr1YNQxuwQyY
         yHQABS/4ZhWEwoez16I3sZIDPuMj0YYPnwEvH+WOBg5f30tIH1J79dQ+VRr1pf6AuXui
         iZeZ8UA+fBIrzfFEP1ihGThrtvhyugUXH0KI18M59zwKmesjvCuvRC56A9Ln21bt3Xx8
         Re4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=4aNXRjvvuERJzk+yC/bc3nay/17I6ZiI/SraUgeN70w=;
        b=RfCbEtDmwP60dyeIik8pt3XsINOwXQXIjWf0h4vHfRdE6VrhDWMIhlo6H4FtzhX7JI
         WU/9LleYEs3tFKQpbmJQTVqsO6f++4pwP8CxvMPPY4387BaFDZfYXMIwd0+1orHx0AoH
         IM+W1SZQxMBnfE4b04OSfGHEq4Vbh4c1K+C7Bh7ghAs020MrjSW7/74ZNgoXVPsGSaUc
         na0v+TipAe+kMz51N3eNDcKN/F+LzvedXq27lLUm4jke/gKcQEqryzCwU3XrLnDMc8SB
         zdNg6C6zk/81OFSQOkfyNPVe7HAoH5RzYwlPyaaIuRgqC3t95yTtVkvHT3geCJeAppH1
         1LJA==
X-Gm-Message-State: AOAM531zUhQ5q4NVvuoCEsj/0BRBrdZ0lai2Who3lZkOzAO7irx9zR+s
	hGqUhb4pycDXO+qSFUWis+CLThcpWYgANL4BmdkDK8++SLnnXg==
X-Google-Smtp-Source: 
 ABdhPJx34HelG8IviSO60G+LydsL4kAFsXAEm5TcgOh/iTymUajsurFb9+z088FfO00mOFnqRUvImcx9pZRZGtmB6TQ=
X-Received: by 2002:a17:902:834a:b0:14f:3337:35de with SMTP id
 z10-20020a170902834a00b0014f333735demr29560415pln.8.1648536744677; Mon, 28
 Mar 2022 23:52:24 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TcOlbnM=?= <mans.zigher@gmail.com>
Date: Tue, 29 Mar 2022 08:52:13 +0200
Message-ID: 
 <CAEhQi8mbm-RXs0=7Ygj+rMqJYZaxPw4xTjJnkoXApXKQZGWFiA@mail.gmail.com>
Subject: [OE-core] Including kernel-devsrc to the SDK while using
 INCOMPATIBLE_LICENSE
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 06:52:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163738

Hi,

I am trying to add the kernel-devsrc to the SDK by using

TOOLCHAIN_TARGET_TASK_append = "kernel-devsrc"

My problem is that we are trying to prevent GPLv3 packages by setting

INCOMPATIBLE_LICENSE = "GPL-3.0"

This resulting in an issue because the kernel-devsrc depend on GPLv3 packages

RDEPENDS_${PN} = "bc python flex bison ${TCLIBC}-utils"

We are currently using Thud. We are not shipping the SDK so the
INCOMPATIBLE_LICENSE is only needed for the image build. Any
suggestions on the best approach on how to solve this would be really
appreciated.

Thanks

