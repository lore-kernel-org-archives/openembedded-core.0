Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBE0C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 08:36:27 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.2318.1745570182472713285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 01:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HOwZrG6E;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5568355ffso184279485a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 01:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745570181; x=1746174981; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RMF2sHiCUwzr0AQ6A/R3awD7EsEqky7CmCUUKEJn9M8=;
        b=HOwZrG6E+AbGtsOMYJcjOhLlFfmKEiPe8eBVFW8eMetGG5u9XRlg1hY18n4svPLXuQ
         PCwMd+DNMRO6PWsHAx3/4ZBGGew8xJSTPht8Gfpz4mRfwz3lkZfdkIpj2OS4uwNZ/T6S
         QggHB7yG1YHs7AQOvTougmIui5jLyGMz7/nZADBy8F6mTCHJj6JHxF4z6v1Yppb/26ev
         VuRFEPr803m7RwErCEZGf0J3jvpWN5Cb0Q8yXOU7qGYa6cf2ZWy0BwvRtZLKBKICoc3T
         ff4Nos6RpTUJrur/zyft58wTFHVjzvm1VOPtExuierWYZ4f1IDokO6hY26q1DtvW/l5u
         zjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745570181; x=1746174981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMF2sHiCUwzr0AQ6A/R3awD7EsEqky7CmCUUKEJn9M8=;
        b=LFEuoGS3NjbXbgAYr3bEcKyW1EPVcblsIcYzdOFlE9u1TX4cYAhzxcyP6h3oT5ZhMw
         4nu2y6q60J5HeuYIfMlg8RNTS8J9H2nDK056GfTnyM/F7gimxraTf8xZC06/UU52xXJT
         0Q/IsgyiVyRuC5aLYIRuiJUB1mJ678y+JYWTJrvHGubmzlZqPhytx8L5JfS5p8zcYbac
         ecNuAhdpIgfdqYjN2b43/YzZN3cLt+IfMeLemWRnElw7i4zuX8OMm4wR+cua+b5YkPXC
         6Hch74IqTqMeLWGvBo7Q6xdPvMpk0EzfD686WdmtA5VO2p4Y2nO6334OeV9ma2g71nNb
         xjAw==
X-Gm-Message-State: AOJu0YwXk45TKNC7TMB57FkP9JFw7tLl7kPLwzCXXIDBj3eMGw+N6pHx
	GhDMMc7Hm36WLez8F0u12DWy4YrlNWY2eLoIm+QGpqcBET9rwwYrDUKKGBt6imAv5ogKU8OjGuc
	6yLqV75Dywf7hS+jZkJmVBuqThuU=
X-Gm-Gg: ASbGncvxCmIJzaD7mMmLZ9VRKRwgYaOqC0e4hOmTkgGzu8CWY6etuQ5N/0xlVCqYAYQ
	wA/F5dUH7nc2vpiwbhU4dANIds6fuAWbp+tKhUohMNnr4q/zYw93HsAmILLTYb7rievGeIaSTqD
	CAK6R9HkCfIGIp/oPeHLMJez18OZbrnBNgAAF0gfszPkf4kVOAb+SBtHPV
X-Google-Smtp-Source: AGHT+IG6Ghe53Cv+R1oiErHAyC9YGhcEuk9T14ks1jgllVkzw1Iv1v0LVPqzKGimdrIM6YaLJWXkiEiAJct+ieMnGyU=
X-Received: by 2002:a05:620a:17a6:b0:7c0:be39:1a34 with SMTP id
 af79cd13be357-7c9619e841dmr163211685a.43.1745570181546; Fri, 25 Apr 2025
 01:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250424213951.2514902-1-f_l_k@t-online.de> <CANNYZj9POGReasMqgt6=BVRexWAMGF0FYbVoPzNwRkfojTk-7Q@mail.gmail.com>
 <B2M9VS.YHEM9X6L6IP01@t-online.de>
In-Reply-To: <B2M9VS.YHEM9X6L6IP01@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Apr 2025 10:36:10 +0200
X-Gm-Features: ATxdqUEDZXd9vXmz7ZkoMBkcalLQDNH6dxxCqKhlQ-oxP9N41w_LsR0buobdUtM
Message-ID: <CANNYZj9_8zy8khNS0RWxvkM7Peg8kiDkuLHngrSuHMkR4oyaaA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] default-providers.inc: add entries for virtual/libsdl2
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215443

On Fri, 25 Apr 2025 at 10:25, Markus Volk <f_l_k@t-online.de> wrote:
> Some possible problems I can think of:
>
> - libsdl2-compat would add a requirement for x11 and opengl

This is already the case for libsdl2-native, so it won't worsen
things. At some point we can see if we can disable x11 and run
qemu-system-native as a pure wayland client, perhaps only after they
add direct sdl3 support.

> - I'm not sure why this is, but libsdl2-compat was added to non-repro-meta-oe.inc, which
>   suggests there may still be a reproducibility issue

Yes, this needs to be addressed before adding to core.

Alex

