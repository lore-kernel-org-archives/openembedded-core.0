Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC5EC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 13:30:51 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.12444.1699968648725552200
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 05:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OlkAT6pw;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c72e275d96so75620211fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 05:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699968647; x=1700573447; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vPiLK/kUuJfkAt6RFAl1cqEnOXxWX9LMyQUkZl4wL+8=;
        b=OlkAT6pwRaAkN0GpdFkI9Two7RUpkZvwTZpjQeALqxJqMpmM47QlaiN8gUBFmetjhQ
         oRN4zPpwOp2crzpo+x6LmFewgRCsrtbIerqymDik6m76jPuDmhJILgNUXdNUzHZUGXL8
         eET0Dw1lYKHSFdvkbc6mbCE6dYBzMdqNpqOujMFIfkiY4JeXbRud0FRDG3aw+9aowkQN
         rxKj3zlm95NehfGin6QcQGm2imvBcsjIx4TezqXdd3uBl3L2FbXjyZMMxISBCkXV0zm9
         /H9smsRnizqQGTQRDBWx6ngQ3yIwUs81XqsADu+QVZp7mzxlrAaydE1qinX+sBdRqoz8
         2AMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699968647; x=1700573447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPiLK/kUuJfkAt6RFAl1cqEnOXxWX9LMyQUkZl4wL+8=;
        b=B3BntBmrr6fdI2mr0ZHrViCTruSAKK23e6riiSYnpCJB9RKDkdECi5xYrwzHN8YRvk
         GX/jnhXa4/o5L/kN8Z0F4nOM5xvGYRSngVlpOWJYFQOrupGF7cBs3Gv/oHyavWzo25nH
         NpGbxAvTOw2XpqBqZoaDFrnDg/9znGnIdwQuOM77iHDLGWH6sMWzEt/Dc+4/Bpi0jx0O
         v0XzWdEPkxhRo4uUH0cBxVM7rkT/3x6FxRKkyaI/77nyi7pnAEDAd1zPqsLtlDmkiQf3
         0JSpPNCPiy784pJzYir3gPXgYxNyIr0w7lgkjaCNqaWaxCR1Rhqkpn33owHG+HSv5VaM
         sOGg==
X-Gm-Message-State: AOJu0YyzLc/VmhbfFPpQj9OyM7sx25AOKoxbPuH0oswCAH/GyUgbvm5G
	HrG9ejubOgFAqazGuCU7pvUPDARg4wk9ZoIZ1mw=
X-Google-Smtp-Source: AGHT+IFITO54FTxTWdsqYodzH5Q3ffbYg+y1FHhzS21M/bb55IPx5MOAFrLqjaD7KrwJ9Z8vDATBR4L6WHX6FSZLvPc=
X-Received: by 2002:a2e:b5cb:0:b0:2c5:1ea4:4e99 with SMTP id
 g11-20020a2eb5cb000000b002c51ea44e99mr1573706ljn.48.1699968646705; Tue, 14
 Nov 2023 05:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20231107152641.1043-2-jermain.horsman@nedap.com>
 <20231107152641.1043-5-jermain.horsman@nedap.com> <CANNYZj8_gtZxzuUiAuu=ykJ05xK=cYqi9-D9697Zfiee5rU7Vw@mail.gmail.com>
 <VI1PR10MB318254B843785AEB44CA9393F7A8A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <VI1PR10MB318254B843785AEB44CA9393F7A8A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Nov 2023 14:30:35 +0100
Message-ID: <CANNYZj_dmE_E_qezCj=TjSTJH_KLpM4aZ7GY09rsHMEQoMrubA@mail.gmail.com>
Subject: Re: [OE-core] [RFC 3/7] bitbake-layers: Add ability to update layer
 repository configuration
To: Jermain Horsman <jermain.horsman@nedap.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 13:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190507

On Wed, 8 Nov 2023 at 16:22, Jermain Horsman <jermain.horsman@nedap.com> wrote:
> I was working with the assumption that not validating would not be
> acceptable.
> I guess it comes down to whether we (want to) trust the users to validate
> their input, or if we think it is more important to make sure that it is.

I'm not even sure we can do useful validation, as what you have in a
local checkout may not match what (sometimes much later) will be
available in a remote repo. Branches get pruned. People forget to
push. Tags get moved around or deleted. People force push by mistake
and sometimes on purpose without thinking further. And so on. The only
rock solid reference is the full hash of the commit id.

Alex

