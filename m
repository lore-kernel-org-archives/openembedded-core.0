Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB73C5320E
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 11:07:46 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.208092.1724065660598924133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 04:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QegpL/rO;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3ce5bc7b4so17737081fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 04:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724065659; x=1724670459; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ERfCpjb3POB9Ep0sAYu/aUjoFwazZ0LFGuTHziuI5A=;
        b=QegpL/rOiBGzjK+2Yjz8aoYwLln12E1Odhsxnb5mYRTzkOaOJytaKUC8r/zy8sf5n2
         7IwCYLUjIzlysmhDyTyahnHB9R/iq+qXa1PgjtegwyjNqV+zTjEtqCKs2IW4tvwIZiM5
         t+Dwv8lA+CQQawxWt4DlDV8XbniH7fTe0/I7azHK4OiA7NVJIndrSzBOUHdE0KDoqddA
         jH2DckH+oVTlqw7zr/PS0aWGlg3zgp4ZgOq3QE5CXAiAPAzbygwCjYHUwtBsZGzKc4f9
         DjvnEIsGZx7po6E36VH36fZbhR6q8luitowLOCmcE4DD1jUDGk9XdmE58L0wv8r6KZ57
         Ibsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724065659; x=1724670459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ERfCpjb3POB9Ep0sAYu/aUjoFwazZ0LFGuTHziuI5A=;
        b=vqZe2ytj37lr5vTrAZUmLcJYGQ1DQRwSP8OvloQhHrVbbkZ3bGkNJuKjhrDzbb5VPC
         bxkjITg3ZWe7FDbUv7gX+CbyGXFlVjov9PD/GLFfYxgLkM52ejBKMMqvgX5w4Mja72q8
         YJPv0YH0A0xUrOscbdZcDd9eVenrwY/v4Sh3eWqmwOxuFxpB2V5o7VfHdVlGxkdvwkRh
         NLIIMIwLfCOb7rM5H1nPi8oBNL4HJZodYWr/hYkqmR2odPPF77RrtIXp0tUYlQBG74vZ
         pBDFrizFnEVU87MEUWhlX5jtoXU41CMgWGTvy6YGK7UDzbZLDIViG4f6M2L+e23WN3sU
         TK9A==
X-Gm-Message-State: AOJu0Yw3r+5mH79Ik6VnQT/aqquEw0cJYT8OteH53CMdqAiRVWUxvKJj
	u1ySEAVDXa3IXpRnaAdjKtCX9hySnE53h6xEtM5L0IlAmz3fzXneEUq1ryC3H+xx2YGWIbr97le
	zXwSJKBQ186BfzLboEzmkRps/8ew=
X-Google-Smtp-Source: AGHT+IF97sZ8UJP3tJF0x7t6mFK6oK/rb43O2mseVZikpV1IDdR9aFWClggaGOhh4Gq7y8qx+FQ8stNsxzTeksbhXtw=
X-Received: by 2002:a2e:a988:0:b0:2ef:2df7:3d9a with SMTP id
 38308e7fff4ca-2f3be578565mr69526111fa.9.1724065658054; Mon, 19 Aug 2024
 04:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240819094701.27210-1-Deepesh.Varatharajan@windriver.com>
 <CANNYZj9MxBgY-v=vDyhqMn_euNAtT7Am1EJN9Xc4s_7t=jD8qQ@mail.gmail.com> <IA1PR11MB73203EA21C1DC3257EE94C80908C2@IA1PR11MB7320.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB73203EA21C1DC3257EE94C80908C2@IA1PR11MB7320.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Aug 2024 13:07:26 +0200
Message-ID: <CANNYZj9yDyd984X8rD7VuxsvUezLXMJq35hAN_b=Lqq8q7eggA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] rust: rustdoc reproducibility issue fix
To: "Varatharajan, Deepesh" <Deepesh.Varatharajan@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, "Gowda, Naveen" <Naveen.Gowda@windriver.com>, 
	"Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 11:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203504

On Mon, 19 Aug 2024 at 12:58, Varatharajan, Deepesh
<Deepesh.Varatharajan@windriver.com> wrote:
> The exception list 'exclude_packages' in meta/lib/oeqa/selftest/cases/reproducible.py is already empty.

If it's already empty, then what reproducibility problem is the patch
fixing? Something does not compute here.

Alex

