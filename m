Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD3EC4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 14:13:05 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.12375.1705587180312537851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 06:13:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fmm4KISV;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so15186722e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 06:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705587178; x=1706191978; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GcaM0E1IHaCVuohImWWdlzmrFI8ZkIJvpC5DEFIxszQ=;
        b=Fmm4KISV3FqVAQrG5wR6fpjUmPgYMUKkZDpM3FfDbwvc9zfrmEALaxZ7XasIOGZZUJ
         2elF2FObhRYG81gA7SwBzDrjDzrmeNHo8v/wTlUAti7Uj5kD/5kdmv9qqbWhnDjJCoJS
         PvK2VHJfXz4B8Rb6VAlxFYB1yiX0CEAMbZqVAEXiQxPlhjSDOC4RTq8eVg1/mHKgit0w
         4K9z0iUhkjvmTMrh5kExYvVPNZNNVQjMMtE9PdKWwgjwwUonivMvsinLvCEEUMtnT0ZG
         /7nF38f6TkrQuiKhNClLlm3y4pm1D3zTy3YQb5ARXn+w8cr6VYTxbkV27Vpzkjs4yd9Q
         zHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705587178; x=1706191978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcaM0E1IHaCVuohImWWdlzmrFI8ZkIJvpC5DEFIxszQ=;
        b=LwI0aYZizN717VPYI+vEgBSigGEmARFPQeDoo96I9NvQ8Dj+x/gpWc4cFOyWwkqFzx
         0/04YOxcs80dJzMlw2Ltt53TANDQWqC6bYN4EZ4IoV2KXKfr71UcnhMsVTDXS6IHe5ic
         IDO6UzIrlpzkrigheMLEgwrQHA+n4Kbp/Eu4Z58LTXEtovjlXFj6d9Nr9YTReWWGqRlG
         ZC1aJv5yRh4oygWl2c89GN5cdpQluTQ/VI3aM4k/POCi+q9PbITDKy6AMKqadZukp6Yp
         HQ379dF1bmw3z4rsGEjCjBz5sAOVVf7lPjZdkvXEtNA4Aezr39r4RF4fxhN6HXw0UWXf
         uwXQ==
X-Gm-Message-State: AOJu0YyUh7IzHmx42jdl334SMn+3ldXRfo/76HDSULcZXu8K2vlQCmLB
	Zoza3t5MfWAyvwu7EIJwLPbqJ2icYEpldY989TlMLLNKcJee5b+rqC4WpsqRCQFlv25fkHNPiMd
	8AblEbyRelRv+QZ5Pkha+dVud2w82YW7r
X-Google-Smtp-Source: AGHT+IE6Y3wJC5kQVwpQS8YAMB98WsnptFASB99xPF2uWpu1Nahy3yX5I3w3OYAk/4puigCZ9NNWtkFEr5cAo2OHIvc=
X-Received: by 2002:a05:6512:3c81:b0:50e:4e6b:9cd7 with SMTP id
 h1-20020a0565123c8100b0050e4e6b9cd7mr751843lfv.12.1705587178317; Thu, 18 Jan
 2024 06:12:58 -0800 (PST)
MIME-Version: 1.0
References: <dfcf7a4a-81b1-ff26-d14-923bf379025@crashcourse.ca>
 <CANNYZj9aG5qcpe6PksShW4W69uk7EZ+j7yxHb43tgfDrk8ygFQ@mail.gmail.com>
 <5610c776-f1d9-3543-9878-56fad23e776a@crashcourse.ca> <CANNYZj9swGJz6kc4ykCAOnw=ACc_4aCn1UODGZSKrhT4Rcpj4g@mail.gmail.com>
 <cbd55bb-9148-16b4-4146-b6e8cebb9d3@crashcourse.ca>
In-Reply-To: <cbd55bb-9148-16b4-4146-b6e8cebb9d3@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Jan 2024 15:12:47 +0100
Message-ID: <CANNYZj_0QmjJY-LE9FiGo0iVWA28u3rsFujEyS9ppk-bDCk8fg@mail.gmail.com>
Subject: Re: [OE-core] want to confirm i'm using "externalsrc" and
 "bin_package" efficiently
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 14:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193988

On Thu, 18 Jan 2024 at 15:10, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   ah, got it. that's still fine since as the content is almost
> exclusively binary (pre-built) content, redoing from scratch will take
> no time at all. thanks for clarifying that.

Pre-built content is ok on its own, but if those items are in the
dependency tree of something that does take time to build, they will
subvert sstate and lengthen build times.

Alex

