Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC5ACCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 13:13:02 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17302.1762261974472557868
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 05:12:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ehe98kLL;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8af121588d9so304934885a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 05:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762261973; x=1762866773; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LvCj0j0M73irm5StfaBv4DUEsFVG8fs7tB9Gw8iXJYI=;
        b=ehe98kLLHkXWDNJh2XwK1iKNa2S+O5dZ4WfG7M2yOCtrHE2NyDgH2WGE9+7R7PdlAL
         oJcW06Frwww2h5PNUy5vEARbSd5y3aTZLJIubLvthizFLCMlgIy977PobFaq9rQy+VWQ
         7+NgpKDmjS6+R0IvwsXjMxGFZlD2Zl7JhGVNl3N69xFDCh+GX6YQ82Fpg6PqAH5HFnND
         0SOaG1gEyGcO2L7k75MWnSo/8YUPNpoLvNshgr/Yo8Ni3eBqUgRpqwn8aEmI2vpszI32
         L4DUAmogz+QH7hTxVKxVknRm04AQ2xxShXgJbHYIC++3jG/dg+/+X8ce4eipQLYDEh3v
         XNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261973; x=1762866773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvCj0j0M73irm5StfaBv4DUEsFVG8fs7tB9Gw8iXJYI=;
        b=wffGOodIaL2l/WOHCOLhWMLggYO6h1J3MNQ/ZKUUtEhohcVRF+hjriIP/3SfBKfpyR
         ak8SmW9xrbZunxrNEJuTbkiaGKbIgTKZkwlTKduisBwznjERHT3eyMu72ZZ4tz4EVjpS
         gEKv8wRxxm/tVUPYiC08z055brnra7rb0EsYO6g8xTzahisLkbCVfUZmlOrx1Yh+c7ab
         0KuXJ+cGlpliQ2mPOwo95x/3XNx2SlA3kv6cURfjrBtRRBOuXXcOSi9swmZgq7/HkUED
         uykynTMdpbaPHPuUd4xyH9w6LuoDCTV8UDOO0yI6dVYo0tBekWHPdlblyPHF0c9/V5LA
         Ypsw==
X-Gm-Message-State: AOJu0YxOUDhh0SRyVvxqY2gv7NaHfGUqAzbVTeBx/dKy5TpzcpUSiYAV
	klt4AHQ1/6CX6jhrxO6G1TMv5D2XXeTVpZ0tO+Xxe5ZeJe4iVM99MHW5iokYPs5pZLWVpT7q88t
	BjQ5W+VaBoolgXYp/78oXGsaU8KqjfB+5hQ==
X-Gm-Gg: ASbGncvpYlp4WvfHxgZ5ftz0E9u7AmTKlkgKEbREGaN4bTWKioTLCnSJxN2KzbrpyW4
	h3iRIM8cPLCfJK+NOWouKw6W2QYCAcNSk8AiM7AO7JVm81xnkHWGWgsIWzOhMOpSNrwXp3XBiU1
	th5ZcbydQb0pSd1rj8/mXvOPYC0GpjqtBzlcyt0iQ0Pa+PfpgZjo8hm9BvS7kcMMEENIS8zlNf3
	TWNDi4GmgQifYBnCPHhgrwkk1YixtQHN48G58eIp5OStAXhukpSElcxvUjRlmMnGrA+ml34O8mK
	+li74yuRfx0MTsI5z8g=
X-Google-Smtp-Source: AGHT+IHSnj12Ho2hOraBZbgtOdJghIDOuEZkKeby7xWGMgi8Nt/WUFsCohF+rZWwKBtvbadOquhzBaL6W21OIhjV9RM=
X-Received: by 2002:ad4:5962:0:b0:880:49f2:38b2 with SMTP id
 6a1803df08f44-88049f23a2fmr135520956d6.14.1762261973487; Tue, 04 Nov 2025
 05:12:53 -0800 (PST)
MIME-Version: 1.0
References: <20251104033329.466996-1-Qi.Chen@windriver.com>
In-Reply-To: <20251104033329.466996-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Nov 2025 14:12:42 +0100
X-Gm-Features: AWmQ_bn8_oFws0201-vet894D1F3_P2zYflO3xmewYGaTYW_19HoOgrIrIT9IC8
Message-ID: <CANNYZj-1v+RJvkMaij=LQJH=Edbp2ci80_+qOuGfDSkbCNY3xw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] oeqa/sdk/cases/autotools.py: fix host_sys value
 to handle multilib case
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 13:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225722

On Tue, 4 Nov 2025 at 04:33, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> This is because in case of multilib, HOST_SYS value is not correct.

Can you please give an example of the incorrect value, and what it
should be. We probably can find a better way to obtain the correct
value than surgery on CONFIGURE_FLAGS.

Alex

