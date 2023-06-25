Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667AAEB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 06:31:03 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.7208.1687674660559614662
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jun 2023 23:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lSXFHsPe;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f954d7309fso2623488e87.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 23:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687674658; x=1690266658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ev3QbKDo/242lnoYS/5C6ZY8qVnPTDjP63H92fzLUQ=;
        b=lSXFHsPeaY14eL+aintUfB2KsiV8rS/KLnZXq7xBuvb2VoeOYjmKElTRd+k4Tw6uYR
         CnugE/k57ajZDYM7ATKDj+4RoazuSIsURA+9numWpwE0f8Ewxe6EEum6ucvp4rx0LygF
         faZY3pqg8/OZBVnAuBcaNYW2fqi2yZu8vE1FC0aTQEINVEjP9XtadbQ0liktCfp4ueJS
         af1U1LLaZFsqsoM1Ik08olo+s53LNkcb/ad6XvPlDeHeyA0JNbUGGSh+1/ixrTGZiT2x
         w8l0WZLSgRQFctMFneUqbQZCQBzSYqB6fs8ieN1OWvWkSIl25xPXKjfwPpf+5zfftu0j
         BBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687674658; x=1690266658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Ev3QbKDo/242lnoYS/5C6ZY8qVnPTDjP63H92fzLUQ=;
        b=B3iWMzfJBr6Iy1nWgeU4xlFZaZ6uT4nfjN0WZZk6gE7wHhBvCIidGnfADhFZPdCscz
         hZ3NL3/5mahUOHvWCIiAOlZYcGCpVq85/0NoT4s9R3/IdEzXqjkHp3usWMYUnhk57Dv8
         0QKGQOt7D1OIzMYXAcfnfdLtro7DdHg7kF210qPZ6ckbaM7uBMEMHDOqjER18tTwkT/z
         kHITcAKaYg+PVDvyc5VYxFR1jfkE3fkMOS/6LipTsUKfYGYPr+d19x561wxKSNhYfKXL
         a5jjkyG4u1XAGrmeX8WudOLcgETkqdp/am5kME6iWskgx6/BPmwZwDd/JrXfqZE5re0w
         6MUg==
X-Gm-Message-State: AC+VfDyJHEjUoXgZ2nIfiAgo+w/IBn8uJFcpRVJGfHkmTcS26vkUsS3v
	Tk9Rj9cvt4aAqtNNtWSkkuneYzWAqf3knEQN2Z4=
X-Google-Smtp-Source: ACHHUZ6W3HfLovKXUOKIXyZ4DhhpHa+b6dPx/XOn//GojsGTeeBqUXaW/I9zTr36rWluVnKBmgrZDLP2hs+qzs7TEUM=
X-Received: by 2002:a05:6512:2346:b0:4f6:1307:80b0 with SMTP id
 p6-20020a056512234600b004f6130780b0mr11974397lfu.12.1687674657898; Sat, 24
 Jun 2023 23:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230624053223.228117-1-raj.khem@gmail.com>
In-Reply-To: <20230624053223.228117-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 25 Jun 2023 08:30:46 +0200
Message-ID: <CANNYZj8DuD6-miMrQ5W=PZEWxOOFtLdUNxYUQdmOFqPr-j9-iA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] mesa: Fix build with upcoming LLVM 17
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 06:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183368

On Sat, 24 Jun 2023 at 07:32, Khem Raj <raj.khem@gmail.com> wrote:
> +# llvm-config should be the one from llvm-native and not from build host ( if llvm is installed on host )
> +do_write_config:append() {
> +    sed -i -e '/\[binaries\]/a\' -e "llvm-config = '${STAGING_BINDIR_NATIVE}/llvm-config'" ${WORKDIR}/meson.native
> +}
> +

This change should be in a separate commit, and with a separate
explanation please. Is there a mistake in how meson.native is formed,
and if so, should it be fixed at the source?

Alex

