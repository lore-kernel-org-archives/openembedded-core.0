Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137AAD3B994
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 14:18:03 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.46713.1732630681338736302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 06:18:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ao2YiFRi;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d41c87aec0so44742686d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 06:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732630680; x=1733235480; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/8cn2mOfCgR1WRbI+Ib8k1IKCLam9c+VjmUQ6DvDS7k=;
        b=ao2YiFRiEADwrAkoc3QfVWFBjc2Oh0EGcgu+UwIhzpBRgRylLRDYC3ecrdpe+BbqDp
         WwCRTbz3LjWk+w9xoBjDUW9q7W5uEAtEViT2qClSgrenYgtJ0S1zViEmhXXQcytC+cLS
         dokqCnSqMHQPG+X8/StD8W43rycu7G8CRdfx2Kcz9KZckwgOM7lh3d5t7iKKv3L3zAqD
         PBDA7XKN/qWUM5FaAK4cb0WSHTebOH1Dt4UigX/5pOLzNL/jP1hcjO77xaX0X7y+j3bN
         HdeaJj6QxMOUX63NFrTP2q3pzf+kYQggTby83EwOocfVdrOKkzyotts2aEChDua6VHg/
         w9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732630680; x=1733235480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8cn2mOfCgR1WRbI+Ib8k1IKCLam9c+VjmUQ6DvDS7k=;
        b=Yy3TT901Y4EkMjNjArSUkwTRThuRo4wwwDJ6ptQsf5KqTlcEWJ5fS3mL+SCEens3v7
         fsHa60dxogkDfUGeyI8jXGU2fSKHI3NCEJuTBWyeiu2+KVnn4uXav7r5Z5DHq21SSZkv
         2MlOLZCeQjS3qWOLjoUlaYkC7ameZT1CTP/p2u4cWWZ9nFAES6ro9vX5pcnc/ZEbfwbG
         ocaPvrbY6fz42ctpTx2ajRJg9sayY+brQ5DAYS+DLbfxNsBK/a5Ln3DxGD6kUl1k/aMQ
         mvoigtpYD7gWNBzN4bBHk4gHqEkA+WoC5KfzFlP8LxNANz6kSLB/TKaldQp6pqp7UOxn
         6UfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFcJFERZohUQhCN0Xx9kAQ+L3r0UoqP521qDkfbWj56XYhjpy0kFfhiR2tjF1MonVQniXyJ1nhUbVbCFgStwnfYA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwSEzVie6TKASxB+hpF+3qIY6ezUxGFYrJQGo1A3So8T3oWRQAe
	PUoLfZmQQYW3Fsuoe4MUnAe/xRBKMCF7w0k8jYXaeB7d75F+KlqCNKfrvLuceEbBZVE8Mih3YoZ
	4grql8+TLOzAm5Yv8lHbZwzsSbVXMWw==
X-Gm-Gg: ASbGncuCEclOX07fe9JBG6Krs9hFB7cUQIGmFs9uxa89UK4AiarWaY0IEmJY9Ffz3/B
	YR2gf/XgHkX2An1hqjjeo9axV4eZh8BQxW40/MsPg+k+tc0+WQcF8kQ1qgme0imjEaw==
X-Google-Smtp-Source: AGHT+IGrxHPpeWrBEJZG1b3TnFnvYzkHJJgXzdTeOVU14oxT6u1ciLolI7+O/D2wcmnWf1HEBimXEo+qE5vuF+O9ipk=
X-Received: by 2002:a05:6214:766:b0:6d4:1d9b:1563 with SMTP id
 6a1803df08f44-6d451374123mr257023916d6.40.1732630680285; Tue, 26 Nov 2024
 06:18:00 -0800 (PST)
MIME-Version: 1.0
References: <TYWPR01MB11861AA75103D416B518D1CEEDC2F2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CANNYZj82P1RMCicKPN5z9gvwbcVJgzXrVp7F09UbfFXok0ob-Q@mail.gmail.com> <d4102dba59d94d0253b0ccfb56daaaef8a48decf.camel@bootlin.com>
In-Reply-To: <d4102dba59d94d0253b0ccfb56daaaef8a48decf.camel@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Nov 2024 15:17:48 +0100
Message-ID: <CANNYZj8G4B84MOEH2LL=cDFUzB--jKx8zYo_KG1Vv7cgtxd-+A@mail.gmail.com>
Subject: Re: [OE-core] conflict between tcl8 and tcl
To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: wangmy@fujitsu.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 14:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207856

On Tue, 26 Nov 2024 at 15:11, Thomas Perrot <thomas.perrot@bootlin.com> wrote:
> > > There're lots of conflicts between tcl8-doc and tcl-doc.
> > > Currently considering two modification options:
> > > 1. Using priority to resolve the conflict. For example, set the
> > > priority of tcl to be high and setting the priority of tcl8 to be
> > > low
> > > 2. Rename the directory where the conflicting files of tcl8 are
> > > located, such as adding the tcl8 version number, to distinguish it
> > > from tcl
> >
> > I think option 2 is a better one. What is the reason for installing
> > both though?
> >
>
> I have prepared a patch that replaces the suffix 'tcl' with 'tcl9'.
> Both are installed because 'expect' depends on 'tcl8'.

That doesn't explain why tcl-doc and tcl8-doc would be both installed.
Expect doesn't need them.

Alex

