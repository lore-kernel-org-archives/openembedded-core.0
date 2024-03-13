Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A14EC54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 18:01:28 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.2872.1710352885348693617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 11:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IfG75JZI;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso1103721fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 11:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710352883; x=1710957683; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HEr8A65sQ87UHv7dOSl7ZMryU1r+ronggVFVoM7fUQA=;
        b=IfG75JZIm0LzieSyYuFYYbDK2oU1MTOV92qTju6bIkjpeag0W/iHSzN7q/o4QWiCau
         lfHcM1K5hcTNEHGrGOm0/hEfHjG0jmr1dyhr2uUpfBObuWv/pzDZcdxOEGgNlREtz7zB
         HGjfAjFcbsAwo/cGtOgX+KmmwgG3hxNx1rN9+cGrsltgrPb87Dyx811jYtQKnXXruWgL
         ebnDAiNK0vje+F+E9Xj01SYOyykWAmloLeiibFymHdKPd4N4LRvNB2zKb2AvmalbDeNq
         LdCP39I7bw5JdwgLl9YdoNzwVJu/VRKrd90e8oyg0GVpVIk8hPM+z2mGfBGJDoIKR9QX
         Br2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710352883; x=1710957683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEr8A65sQ87UHv7dOSl7ZMryU1r+ronggVFVoM7fUQA=;
        b=sF3ESlZKTvo287C0moW/exXMKJet9KJtqyVSh+vR8msv01rPqnKG4VoEeQHANEwMJp
         hy5VvH9S24SrCQUsUHolUNsaMFzNlxJQcswdUlvpuADCpUiI58Y7xVdRqon0DZniMTUI
         AAxUUSh/Yeh8ZI9qEtYltDFwRbYNqXPQ0jViyejpKQ4yV65EfTc5knJxF3WmjKfaXTOB
         K81IOt0RPNIoNjDVo03cj5YhQ8dNzlyf7zRTg8fyoNRljwI+O4ZgC/LqXdKZdqiix7Mz
         1aeP//45O4FqFwgrhDjvjVOI6do9RCcr6ZV41ULlmiED0hwLBxXQvRZbXK0oeM+S5YJN
         oiOQ==
X-Gm-Message-State: AOJu0Ywtz0h7jUAlScqrXH4t7H7XJuODh0mE0pbHXiBbNvU7/WWe+kBD
	l9oC0hwVfKVBpfZMBoL9iPrHk21lD8AtjnRvSyaPzK653gkM09WpIU3Hu5Hrfdqa96lTtfa20oa
	8LvYPbKG/8qfx2tHuCvA0XXJpZbc=
X-Google-Smtp-Source: AGHT+IF0rF1bkB8gDsWHfm4TlmFLRgqI9ELIzsBKjxrk2aVWuPdsldc8nSv3phgetRu/Nej4nSEwx9AqSGWgtBHg+4g=
X-Received: by 2002:a2e:3317:0:b0:2d4:6bc4:1d4 with SMTP id
 d23-20020a2e3317000000b002d46bc401d4mr1748657ljc.9.1710352883435; Wed, 13 Mar
 2024 11:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240313173336.3900178-1-alex@linutronix.de> <20240313173336.3900178-21-alex@linutronix.de>
 <CAMKF1spuZD1nHfbygJ9qPpWZmC=g6QJea-ZUYmX=K9faJWKcXw@mail.gmail.com>
In-Reply-To: <CAMKF1spuZD1nHfbygJ9qPpWZmC=g6QJea-ZUYmX=K9faJWKcXw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Mar 2024 19:01:11 +0100
Message-ID: <CANNYZj9T6yY5_E3ygM6sFYBZ+OjqJkNjs8bRqNJmsAMmr=ewgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 21/21] man-pages: use env from coreutils-native
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 18:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197077

On Wed, 13 Mar 2024 at 18:55, Khem Raj <raj.khem@gmail.com> wrote:
> does buildtools tarball contain it ? if so, we may instead recommend
> that or add it to buildtools tarball instead of adding this dep
> for every host environment.

If there are more instances of this, then yes. Otherwise I wouldn't
add to the tarball just because there's a single recipe causing
trouble on a EOL distro that hopefully is soon purged from the
autobuilder for good.

Alex

