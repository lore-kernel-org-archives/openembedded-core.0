Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83247C32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 11:05:38 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web09.6539.1664363131533744701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 04:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qry8ZHnF;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id bu25so17922070lfb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 04:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FqZnKMfnjF7Z+0wXGALVIixDMJS3rvPHXdYx7aj6eew=;
        b=Qry8ZHnFdiZMzulDqcFyeeq5izJMksuagVQjmwzs3ogyhrH9iacDqvUizSqcgSb4qF
         hwX8eR/i1G8jywu2VnzGSIqUCSe7FZJi7NnQkWb7NNsEjFvrJd1sWJFxCOwiOuZOz9Jw
         5gI3mPLWR0aZeVxeDKUXzuPhTWbHvVLp+3n1xVGNGB2ELiHqdYjd5ubrn9KkUDF2T3jA
         nUnMja9HvRl0TkX/gcWiWrHtryvjzkHn4xsGUd/HNfRTOuqsTmq7YjrkAu30irQhvMi0
         u4vJxAENly7KW/eKYft1bhEBEJjmRSA+I95zIA3A3iAO+sJZ9OfhWpXCcabgVxQce6Bn
         K9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FqZnKMfnjF7Z+0wXGALVIixDMJS3rvPHXdYx7aj6eew=;
        b=KW3F9e9pO/eXvNcZNncEuRI5oydi6ZyhivAUAyBQxKpj6+m7guo9vwKGrwAAl0y977
         KyG9HKADA0bR8GwL2UzkqXk2eKsqzTy5gJFOH1LorRi5shTynBe4ihYmwizIE5TtvpHQ
         V9Ig8bIHhLYHog7B9363GaDAmAEOC57DRNM5nfiEDFR7Sk6LuvWQ+Zm3RGm8Ps3dtYio
         6C5oOSfqILwPRAhRAVJ1WPnDAr5MdeAKD4uybVG3jSUacLoua8jIXSryVcFg1pB5n9K7
         iHYOMRT/jK5mOW1Tinhv3fubLGH8JugEMOWGVIiRezy2dIxDP3jWknmeL1KPXUP2qVWI
         yH1Q==
X-Gm-Message-State: ACrzQf151WbC4lRJAG9hftX0r4weqOl5qbTX2aoEAvsLQr+N14UY90Qq
	pIBU+lJ8am4PswPOw+/S+cC6mqJAHRDiui+Xd7I=
X-Google-Smtp-Source: 
 AMsMyM4/BnyvUHaxg/PJQ2vha4hHBzAI3XhwFZmThG0nccnyCY1vaN5rg4uDoOOzDtXhDON4HdoNBOYfAjqVNqqGp6M=
X-Received: by 2002:a05:6512:10c4:b0:499:4c:64d7 with SMTP id
 k4-20020a05651210c400b00499004c64d7mr13188371lfg.521.1664363129528; Wed, 28
 Sep 2022 04:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124708.2218995-1-pkj@axis.com>
 <20220922124708.2218995-2-pkj@axis.com>
 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
 <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
 <c78bac9a0a53243336d237bc5f6d51758f5a5dfe.camel@linuxfoundation.org>
 <6dbf0e264c68433a8aee1a772015c852@axis.com>
 <1718C14CEB633922.9698@lists.openembedded.org>
 <CANNYZj_rRJFsnOcSrkONYfmkZdUe1eCZKYcvnkpPj7jm7eVu+g@mail.gmail.com>
 <faab0d74b95849bdb1d39ac0146dd523@axis.com>
 <CANNYZj_2+-GiZ4Qa67GJ3KFJMqFxLFXW6XKMtL+a9=NrPmi66A@mail.gmail.com>
 <77825785242f4d99b336af0da596e286@axis.com>
 <CANNYZj81uAD1wMJyizCHTiwCnCnw_XMOLqPOzKGu0Og1sejauw@mail.gmail.com>
 <1568abaf9b604bfaae699a53c537d51b@axis.com>
 <CANNYZj_L2+OJE4TYt4A2QVXjsmSOVWKbWD4EPz=AkQj5snxXgA@mail.gmail.com>
 <b1adfa5db65d431a8959e07181bfffa2@axis.com>
 <17190128C53AF22E.9603@lists.openembedded.org>
In-Reply-To: <17190128C53AF22E.9603@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Sep 2022 13:05:17 +0200
Message-ID: 
 <CANNYZj_jRy+FsKRGwAYWx6WYvAk8Am9L5LgWqO9-v0Cf_cjg2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
To: alex.kanavin@gmail.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 11:05:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171147

On Wed, 28 Sept 2022 at 13:00, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:

> I'm also unsure why are you so adamantly against checking if the build
> dir already exists before the fact. It's not that difficult (either
> it's relative to `pwd` or an absolute path), and not likely to change
> upstream.

Which is a trivial one-liner in python:
os.path.exists(os.path.abspath(build_dir))

Alex

