Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98508D690EF
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 09:39:56 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web11.91524.1732786791813359329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 01:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UddnSuIS;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51514257e57so188694e0c.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 01:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732786791; x=1733391591; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5+FPCveTNh+O1G3XoN6PVtllSONph+5lWvNJvmRsW0Y=;
        b=UddnSuISCHWqYf67xSury3nQ2udGjCgHXDFYRvnFqjBNmEk/E7AJC/Pwa0jFdqWhUG
         GlT1MT8HhgfztTf7ecSaAi/XbDzqux2aaBSrFjQ/JihOiCPhOLLcZi71VeE0xrcXPofN
         Z/bLJdMwxHg77bwCP4O8KUIEfRVF4VK4FTN50mmvOpLaOdiSJAgKINpTkYg1UeKB3yRx
         sLaQzZ5k9hrGT5gdb3yt0dA6DTYaAODuKiMXHaBl7+ZLq4m+JOo3cwtV3Jv4hju2RDoF
         KVkhfhIVuiJ7nLeKpdhQULA7YkdMgP4iywkOMEqOQh/HJ0wddAWiwByPf7POaoK/EUNo
         Xd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732786791; x=1733391591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+FPCveTNh+O1G3XoN6PVtllSONph+5lWvNJvmRsW0Y=;
        b=V+r7U5/xX3MVjoCKNUXqEkY2xwnYhgBsuvsOr/Ntop/8jVPiw94shpWCD5xHOeojeZ
         eaPI6TSXCy3c6RWn2LzoGuMzx97ANSh8tzihphB1dqr/y7MyGJgjs8XqJx0aF/N3RNGO
         3/nidGlKkcxEqgu2C77EwidNSJbmOJrMJ/6tmCT1KMA2MVJ+0Em/CWU20lUxqnauXvcR
         DE3CaMW1l/I1rN0QUFL2E3vNGWRy+5jZIa2wNcweU3tVS7LDePYivwv1xDa6e9GbwdzG
         aiLiqJ2gkUd1xJopWr9mDvDnPXJKfr3WbNEca+07XgV842aG+sGaN2c+JorKKYvJLBr1
         bwzw==
X-Gm-Message-State: AOJu0Yx2MeP9iT3cZh8Q5Nf9PebzgFcZfZemXkzP6Ywhid4zV52SDqJM
	gKiXIXxp7VnbujDPyFBeWPq1ry2ku0jZWvv3dWbv0GS9hSBHTmB+6j/+BjNGkrIH78Zt12lJIo+
	qtYhg+1/LhYGKm5Fo3YPtts9AvtbYTw==
X-Gm-Gg: ASbGncuFExHS7mUCZlepDqcP4M1E1YET+lUNoHkPQh5b28ojuMr7ZLh4iXixD1zSC67
	A9kqFSsOTYcMc2JRLQqLRHBvFQBsqQc5Dhj+R8XpOQ7LK/fqoMBVZ1rDTFtxDNfSQnA==
X-Google-Smtp-Source: AGHT+IGUerlxCUMuUJnzCq3fhGLA8DWPXJSD5HU6RgWd0axKLu+VaMcuPSiaGdrDT8CugxrlGkFboraydQ/tA6m8DqE=
X-Received: by 2002:a05:6122:a16:b0:507:9096:423a with SMTP id
 71dfb90a1353d-515569e3f58mr8348231e0c.12.1732786790731; Thu, 28 Nov 2024
 01:39:50 -0800 (PST)
MIME-Version: 1.0
References: <20241127233600.4124020-1-hongxu.jia@windriver.com> <20241127233600.4124020-2-hongxu.jia@windriver.com>
In-Reply-To: <20241127233600.4124020-2-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Nov 2024 10:39:39 +0100
Message-ID: <CANNYZj8J6P8OyLjMhFtddZZNgb7WbEJr-h1Y+8PTq37mhonFCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] gnupg: upgrade 2.5.0 -> 2.5.1
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 09:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207984

On Thu, 28 Nov 2024 at 00:36, hongxu via lists.openembedded.org
<hongxu.jia=eng.windriver.com@lists.openembedded.org> wrote:

>  create_wrappers() {
> -       for i in gpg2 gpgconf gpg-agent gpg-connect-agent; do
> +       for i in gpgconf gpg-agent gpg-connect-agent; do

This needs to be replaced with gpg rather than simply dropped?

You also need to adjust gcr recipe to use gpg instead of gpg2.

Alex

