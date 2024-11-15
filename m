Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF54D68BC5
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 14:53:13 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.22427.1731682387640014755
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Nov 2024 06:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P6LAuriz;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d3f35b0482so10705286d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 06:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731682387; x=1732287187; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QE/CJ2ZA7Aazf6/r460MIMgRbijrbD5xXS/oKBUK9bg=;
        b=P6LAuriz5Z0FVvHfp2cBUL9I0bFiH5oCJRATqTnwtQohfNmStPzhVw8oO0NLKHQx+4
         qsXYlkFZ8s9XnZxfoy8lymfdQv6MeY/vBA1jSv49JaVxULUXmf1swtlCutgl5aJcvvOr
         4xw9hOxfAPdBaNw75RfiqXbkGwBDZ4E+dQXHt0MiwvFSw+UplaRvQAYXVUlOxY/ep516
         zQlzbqxttXlasCWG+3DmIAh4FddzftW7Q8gSpcBokmL9lLVUo61MdlrdM1DM6p7TEYYT
         /EAPj1auJldqPMKwq3F4tnfLq1BIwbhtrSFU9cLbGz5o8xKjeNywk7d9GnfaR+ixMmyA
         1M6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731682387; x=1732287187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QE/CJ2ZA7Aazf6/r460MIMgRbijrbD5xXS/oKBUK9bg=;
        b=BUs/iEtt7BA5iZIR4FbceI7Dpg2U619SQWh3FDi1bwAIYgHX3sUkauSVZAazVHxR3X
         1xJLf/zhwyUw5GPOUrE7qeAagP93BxlixHM+hgTL2Qqx/TH89FXFFYs8qwZDKqiZM5G1
         RAO3roF3UCHxh3aZFSCg1dLj/5n7n2UMG6lRmMgfEX69ncRsEOJmVskq25sKeo4BZFMW
         Wkcm8coRRs8Sd0HDxdeaPhjwj7qwBzChHfy0uN/FH0303cIKgn2Q3wleDq/UVRL9kWXe
         bgSrhzcXJbhtBP+aOxDdFiC1UUoyGSXJla9CkD7c7iHUsuN8on7cac2XiulRj+2CB4d0
         Iuig==
X-Gm-Message-State: AOJu0Yx9ejQTyKu3DJnjcZF5enFYSGK0EUBEGRwRPQvhs5v5StElvAoh
	l9toCYWHdtyoru3cLMfsewOjFs5iYkrnj4upQjboahQ7EFvyYi2SnEhIzGmgKLQmklTXrGGXoWu
	K/yx1hDCguoAR1DiGtIIKcd5LCRjS0Q==
X-Google-Smtp-Source: AGHT+IE3SW6AaYvLPlZPXU1l9jiequgfhce/5TExck+q4t+yJ9PeIiI7Ds3Mi+DlgEILLkUyKcInJOcHPHYM0TaFMIY=
X-Received: by 2002:a05:6214:5d88:b0:6cb:f561:2a83 with SMTP id
 6a1803df08f44-6d3fb846f7fmr35140136d6.43.1731682386681; Fri, 15 Nov 2024
 06:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20241114111100.2624737-1-alex.kanavin@gmail.com> <ZzdCHndPtezHmT75@bootlin-mathieu>
In-Reply-To: <ZzdCHndPtezHmT75@bootlin-mathieu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Nov 2024 15:52:55 +0100
Message-ID: <CANNYZj_53=XLRGX0GoVXKba47Kd+aN4ho72o=OZeYUzKbFyrTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf: add an addfragments directive
 for oe-core and dependent layers
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 14:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207186

On Fri, 15 Nov 2024 at 13:44, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
> I'm not sure what is the issue, but it looks like this patch is breaking
> the patchtest-selftest on the autobuilder: the remove layers step is
> timing out.
>
> https://valkyrie.yoctoproject.org/#/builders/71/builds/431
>
> Can you have a look at this issue ?

I'll do that; I've also realized the v2 patchset is missing a couple
things I was going to implement (prefixing fragment names with layer
names; using standard library functions for manipulating configs), so
I'll send a v3 and check it with patchtest-selftest first.

Alex

