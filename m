Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E4CD1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 10:20:01 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4492.1765275599643912477
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 02:19:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dHndOj3d;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8804ca2a730so88597366d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 02:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765275599; x=1765880399; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H9HkXWRBGU7bCfCeuHjHWhiTBO1nCzCXjVtIpUIhpc8=;
        b=dHndOj3d+RxDdJ+5RbGzqiZHE2k798umyeVi8IVkR9xdE3lPvwHX7torRJfEDQ0vDi
         R83gRHq3iyTc3IfKKr4PmO4wH1dpI3QNSFPWpcRcq24Q/iVqD9XZEP5fO31Po6DUKHD2
         tHhYVqFBkje/QiXQaX1GsT7gQcaErXOv+bpLZSxzogU2A26OtZ7Jekch7TrcE5UJmBev
         2ECNCaadNkrGQJv6e4W48Jh/wQKIhR7dATodfmGVDTFb3uLYZgeLvUfkQonBu1pcAMJh
         JmnV3hrWF6VOY6xrE5kaYmrWKqQyD2Li6WGBd3junGwbxyTkGNR5rc6MuMVF6DUh/FlD
         arSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765275599; x=1765880399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9HkXWRBGU7bCfCeuHjHWhiTBO1nCzCXjVtIpUIhpc8=;
        b=Mvgi266AWofhZBJn6ypj87PVPHxetu/ZoVdiYt0g11gYwwzd6/Gh1UGfZt1nbTklE0
         JfeumfNvfDvUCTuSkZ2DWjQoZGlwi7n0M77UlXix/W7TbA+oCT9qFMi9leEKkpqKJ4Zw
         oBwh8b3itV/vuTTYQ6pPOu4ZPDtCarhLIUpdCOy86tbQnXV9BRw5N9b8DiD88/Fr78Qb
         rj7A6bBXbeoZKgEbeCCxn2mI9rd60pIgZla1o0LFkhJ1McDcRgR7qlRvZa7vXExVpJ4X
         xK7KcD8FvT9Aj1axWTK0pEHCOyhPJcaHLt7xj2d6gu8DfHTx22JagJqRPYrp4AhNUAhX
         AiOQ==
X-Gm-Message-State: AOJu0YxqkndTkPPE8oNpNluum0GX/Isp4JUkkqTzfNdftSgPWY4G8Nwj
	qQr5bAk07D1sIaD9+i0Yuk1EQvDPjbgro2++SklfK/TM1oCdfLqPssM6MvPRA5htCo068M/VvBS
	EBA0gjiEgAnw32IR+kb+5p7PNAj8axtw8BQ==
X-Gm-Gg: ASbGncui3lnTJMHhIGBLqSRzPrvLb8cgWqUSg4FuLRcjBl3x7Glz38BVr8pj0gfDw3j
	VuIdZN2CUs1yjaCObxkYRt7G1ez9TmF7TC5QIORpvK0N9gFTYfMGDcR4WiXYjzu7o1tgbaTRIYB
	gtRpY9XY3HG0wRd+owmH8k7iUxHSRLM9yOJV3bxylnxFZOVP2EJnVbZ+1uVJ3e27oXmBgm9xHuP
	9LOhu89kVZljngjZovxv68QUPJ26r5gQj3nR5ARBsU+L7AAX+Lu9Lra7GtoEYTUEtybVV8pL8uB
	IExEZnFYwTdHMhrd30Pq4lxWCZ7ukw==
X-Google-Smtp-Source: AGHT+IH7BlrJJkgTSuKNnFZyE552IUCnAwyV5XbOpG6GDvHMlN6e+m1IJmpAY0tmsgeNBs2CyK06bh1qAvm6g0eRqrY=
X-Received: by 2002:a05:6214:c81:b0:880:46a7:b1c3 with SMTP id
 6a1803df08f44-8883db619d6mr187698436d6.28.1765275598575; Tue, 09 Dec 2025
 02:19:58 -0800 (PST)
MIME-Version: 1.0
References: <20251208091148.368769-1-changqing.li@windriver.com>
 <CANNYZj8TPT+Y0-ni63tyGPWZHZ4zweaAm7nKdMM_KA40AOkwGg@mail.gmail.com>
 <47201384-ce8d-4188-be45-4bbde9a27601@windriver.com> <CANNYZj_kb0aX2TbAc2dQujwrDit_nOh=HhAQi5fG-U0+DurM8g@mail.gmail.com>
 <e4a61408-3316-4f00-b6d6-dbbd236b5a4e@windriver.com>
In-Reply-To: <e4a61408-3316-4f00-b6d6-dbbd236b5a4e@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Dec 2025 11:19:46 +0100
X-Gm-Features: AQt7F2oHHxTCGQdlrLa01mSfu-5wuZmxTnDUds509_jSxFzGf4lXcGnR33uUrqg
Message-ID: <CANNYZj_eF5_Dbz15B06seYBkNE5mddEQR=CzTrfX0O=Hm0RzOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] go.bbclass: change GOTMPDIR to improve reproducibility
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 10:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227422

On Tue, 9 Dec 2025 at 11:13, Changqing Li <changqing.li@windriver.com> wrote:
> This issue reproduced when cgo is enabled,  and go internally add --ffile-prefix-map="WorkDir"=/tmp/go-build" to gcc
>
> to tell gcc not include workdir in object file. for go-helloworld, it should be pure go,  does not include the "C", so it will not met this issue.

Alright. The patches are ok then, please summarize these points in v2
commit messages.

Alex

