Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE56DC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 09:25:27 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.18175.1742981125547994880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 02:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UNGC1A1s;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ecf0e07954so48209916d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 02:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742981124; x=1743585924; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kDHEKMgMPS230qCT6dvmj4CkNzKQyYbFSoiTTHK0ep8=;
        b=UNGC1A1skUvBJgs0BgJTdxMuzfTLUpvUEW0A6s0b6nXvQi/OrKd5LvpyLNu9tZTAJ0
         HcUpPGZm4BJxjLiu5Yjt9kyunyrK/5Lng8AjWXpiRkUz8ibx3sLSZYsDN9/OoniFgqF5
         ZZFc8BxY4ljp123eb6aQfrc4nRsdvPsGJQNKA3qbIUj1bshdBSeDC2JUYRnGHe3NMYn3
         dV/kqL9+YxnKFjAaUPoEEXrP8sQDhPcWSBx5V5NiED7Vg4j1RsJDJNvbaHLwMi3u0YQe
         /dPKeJB+NP1QoQ/BYaT3r6tVkOALUdNB92DFcwYlacVAxZAhjf0ljscC6bQvF0wQD1xG
         LWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742981124; x=1743585924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDHEKMgMPS230qCT6dvmj4CkNzKQyYbFSoiTTHK0ep8=;
        b=VRacJtLmqHV82/jMTZhrDBnBnbICXHNoDAK3M5lWWjbwBPnETwPhwFGVNDnbTVgVKm
         OMGMWLB4aEHIaps/KWEMmClLd8wXGMBykRxGlH6yNaY6qsvRwRYqWZQaLxbS4xn0PnrH
         t1ZHYKeZVaDdf8nU9u0QmzQAlDZu/n0nOswWpKwBN3NA3Mr9Z+lRsBOaub8XxjXc8aaJ
         pydBAmgAlVEvviaf1pmwH/LxdhUzk0ks4SEpVMfL95wrA3quNE4mKhZoOTEVNo3p/xmR
         30KU5i1MimhLCFoGb6Av1nezqboMZS9M9hzbxYU+K0rOH3T+SNKVjfAhnUJJq4BG4FTc
         djxw==
X-Forwarded-Encrypted: i=1; AJvYcCUjcR2qalB9RmgJk2jHmZpwMVdBLVRLIHzSgv/YBz+7SE6F1dQ4zwvM1d3ydJqZyRj4ZMDIq2YQyjN0OEcQOr20zQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxS4c8Y+SM24+A18yOYUzbdsaQTziK6HVj4hqyjUl9FH5JDinjY
	KJCOHgphvkcHbGv56CGy0mRbUC8H9eOfCYEt1wsrwcAg0qLP7zftUp5XryguEkHBYkIJeDjPbjn
	s2sopzTJvmBXF5ZdnL0aaNlWxVcw=
X-Gm-Gg: ASbGncvziJmc72rTKa/g5Spxxv/RHNjAu3e8iVLJgYtE2PfrnPDktQ4doP+7U+tffdi
	d+BoFBQXmQq059FwErvWO3fU1vMexZgR0HO8NtzkpPUGmAxHT/jQAwnxfGN2XjNQGp5jXhUxpih
	rec9zQzHhG/45TRMbUB/bIxd2QPgT2gJx67+S05HnHXwHE24+/25XcO6EIyVOF
X-Google-Smtp-Source: AGHT+IHEiQiLyiTXuxa3ymKrfqzPWkbo1GllD2JviBBEWcOm8otlUx/iDyQaNbRda5k4+qmdSTRibwyJVYJkfIHVhUk=
X-Received: by 2002:a05:6214:19cd:b0:6d8:9062:6616 with SMTP id
 6a1803df08f44-6eb3f2ba60fmr304813876d6.7.1742981124413; Wed, 26 Mar 2025
 02:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <1742439740-18703-1-git-send-email-wangmy@fujitsu.com>
 <D8KXQ6QPGOL6.1VKUBIEENIJYU@bootlin.com> <TYWPR01MB11861D6EC6DC97514BE5AADF9DCA62@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861D6EC6DC97514BE5AADF9DCA62@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Mar 2025 10:25:12 +0100
X-Gm-Features: AQ5f1JpbNRKHpky9kzoIy8Td4Ln87fh5369o30O-gqKaZ6oLpgwfg7C_BmdRLo0
Message-ID: <CANNYZj8aWxzYSmtUWro+MytTpOHhULwa9yFFT+oxCtxytoV5gQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] dnf: upgrade 4.22.0 -> 4.23.0
To: wangmy@fujitsu.com
Cc: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 09:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213641

On Wed, 26 Mar 2025 at 02:45, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> After compiling the image, I did not encounter such an issue, so could you please tell me how to reproduce this problem?

What is in your testing setup? I was able to reproduce this easily by
putting the update on top of current poky master and building
core-image-minimal.

Generally, please keep in mind: integrators do not have capacity (and,
often, knowledge) to look deeper into the issues caused by incoming
patches. They report the fail, drop the offending patch and move on to
other incoming patches.

Alex

