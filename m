Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE62C7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 06:55:00 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.5904.1682060098045116118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 23:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nHwhBE+Q;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4ec8399e963so1330784e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 23:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682060096; x=1684652096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0SzMJOO9Nza7lOKrQFehPJLAUJvbxijbunK9+j9h7o=;
        b=nHwhBE+Q0+Dup45b79QPvqss/o8Vicxf4HKOqWWwPVFOtqj9zq5lLn9mUmK6YukVOF
         V9W8Y1UVMo0sk+so1QzkvgdXGG5ldUutEUi+Mdft/cHmUK6+uf9Xqfsxt2KsXuQG923E
         tmhZFIzRAtcxkBnp8cDgZcWt7Fh1RFNqpxKqmez5KncVyocTnf2tVoxbZaIjnikDHhUC
         BCebenyOBmij2CaqN/8x5/A5nmG/JSU/AMI0MmXd9QEKr/emNb22yy4u6xgkk2MxvC63
         cpTAa/HlLTglCQz4DU0PkX7xWq0g6zYeT7cw62GGedv0ejnw8C/V1QLXdarjdBbZ3Jhg
         NJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682060096; x=1684652096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0SzMJOO9Nza7lOKrQFehPJLAUJvbxijbunK9+j9h7o=;
        b=KnpIlzKY1vuW/jdaoC97i2vvpM8DQZGxSuajtUPueEz2K5J7SlK+OJ3DbIxNWkJvlA
         JJcuX8F5rqVce+BvYuFaUdFJ/mIkI5As5T42mdj6DILQ+ckLMnF6848m/+lO98Au12Lq
         We2571gIEfq0CGyrQG2Ub8J70nOVOUpscdEpLBwlx4dwfbyOVKatpZDst/smxKsW0ppV
         hmNB/8svB0rAvJWw01dZ2G7BzqF+xfzDbyq2lCIkPY6+kT5XRVmjb/qxuz2zPmNfs4dm
         7Rj3ikH+1eKpYpRuL6psEQsT9RETm0zdnSjZAyBYMHAn33JLeHWEloK2cdbfLkGWhZz4
         LhGg==
X-Gm-Message-State: AAQBX9cSd67RtldJDeRUB/Zlf0TNJAzRg8kezVKlNxcelERWGWAFWpJ/
	WGGWqho5+vLpVqMHw+lQ+O8XqiXdChgt+DDfWI4=
X-Google-Smtp-Source: AKy350bemEJZu6lGE/FR6XY+1FWmUJBrG/jRHWoC5givrfa0mTS8MM5iCeZMsX1KdudO0XhCD6osHn/QMR9eiocwkE0=
X-Received: by 2002:ac2:518b:0:b0:4ec:a48a:28c0 with SMTP id
 u11-20020ac2518b000000b004eca48a28c0mr837570lfi.25.1682060096213; Thu, 20 Apr
 2023 23:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230420052442.16443-1-yang.xu@mediatek.com> <CANNYZj-C8ujMnqkZqyU8rgAF+rJ9Bwqc2bOLkuGu0d0cJpXfpg@mail.gmail.com>
 <90b1e25cde406898154a05d03babc739120e643c.camel@mediatek.com>
 <CANNYZj-0u9XVkCVHT+WjtFkQ_nYg9i4OUj311wK5GgRhp7ZZfA@mail.gmail.com> <db555f3f6c09c4576358846cba9e64d055422e59.camel@linuxfoundation.org>
In-Reply-To: <db555f3f6c09c4576358846cba9e64d055422e59.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Apr 2023 08:54:44 +0200
Message-ID: <CANNYZj-F8S2WQRT01e46HCWrx68AYbKdUGOGWsk7aaLY1SSLxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: set package level PERL5LIB
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: =?UTF-8?B?WWFuZyBYdSAo5b6Q5omsKQ==?= <Yang.Xu@mediatek.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 06:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180277

On Thu, 20 Apr 2023 at 22:11, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > Thank you, I understand this now. I'm fine with the fix, but can you
> > add this additional information to the commit message? So that it's
> > available in git history if anyone needs to understand it.
>
> I think there is something additional we need to do. If the path
> compiled into perl breaks when it is installed from sstate, we should
> make sure this path is *always* incorrect. That way things will work or
> fail deterministicly.

That's right. I'll take a look at what happens inside perl, finding
the correct place to patch can be tricky.

Alex

