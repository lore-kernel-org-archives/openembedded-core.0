Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733E2C54731
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 20:39:00 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.818.1724791131449199515
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 13:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VqPavOwB;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f50966c448so34949991fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 13:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724791129; x=1725395929; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EOdCGzj/pQrG7bTsWe8E0HyDKq0pO68/0fSmbmV1gzM=;
        b=VqPavOwBLHA0XHEU5xPMvtXsmCLDDZbx2B/Vs+J4+MZVi6TfdpEe+mz+ukF5mreUhZ
         V5xp7ziWHVZ1z/xA94MSEHgWz5x8bgK2WKcfjSmMR79S3qurl5f0eXcneT+7S3fxXwA1
         GdWdKe+oKoe2rcWZy38ssv0uf7nDHG177i5ve3NrFrstCZOEmYyHo/tfv/gJ2D9nbSYU
         XLnpaLeGPRbelTo9vbjq6V3+FaTBaEF+RMclH1JEwiEIqMRdk+cJrdn5vIKH6W2MpI5B
         WTA8BACZSAA29DzoKyuIfCTQyFmfQ8VlZsmcPgT0G3459fxez6mZdQIC9ock+n00Jq13
         AYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724791129; x=1725395929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOdCGzj/pQrG7bTsWe8E0HyDKq0pO68/0fSmbmV1gzM=;
        b=svEAf5cuAKFs6G3X0ItAqh7/1dcSQMDPPBjdV2aTsGGf7Pv7uVUBN9kv49e+0j1AlB
         zg04zd/pFasjx54QawGYRo3y+j6jfTpUGSNWQZnUDXVXSdZSPkHpD1AKCicbTyU8rHWd
         yhsG9l2TJ4r+L6Q84ZRAwdvtKeMJ65s9cE0khPWjX+gGiYcLZMIb4aAMhpVd/mAOcuIN
         jdcTIDYk4C4aMSNnblUzGQIkgIzwbQXlg7CsCLnAhhPN2S48n2ZwJOZNQh9CTKiZOTzj
         kGqlGDwqy9a8kW3GMYzqJM9WiQaVjsJFifOUqMmD5/FhLpGUuSb7tVEEeY95S55C9Dn+
         KuvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTKlj1xd3cI74iASKmV6c7dKsuC0/nh4W7I8Zq3bg9L3b6heI7RpF/w0uQuxuxm4zFEBh9QgvyQi4mEigEif5sjw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5xAXgyXUJF7AD2SFHrH71FWnhKGkpJDIYC5sbBC8cATsd2vFP
	ULYxqcmxXciuLXN+2RDe70G5oPJYXg5NCf+UwkQj0C/NwgiPrMUsjeVj/mu1ne8gMkTBfDYU5St
	+ya5q6FJmFboC1iDpdfmhmZcIkbE=
X-Google-Smtp-Source: AGHT+IH+iGDETkH79TJ2Sgf5GqFwDN/eVk78imft5sOp9Lgt1sdu+JwMsncFFQlRIVUU3LIU2DmeKSfFxYvQGk0g5Ic=
X-Received: by 2002:a2e:1302:0:b0:2ef:2e1c:79ae with SMTP id
 38308e7fff4ca-2f514a265d6mr27142991fa.19.1724791128847; Tue, 27 Aug 2024
 13:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240825170553.566798-1-Yash.Shinde@windriver.com>
 <20240825170553.566798-2-Yash.Shinde@windriver.com> <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
 <15bf0cae-b114-4ac7-89d9-3f7df77b41bd@windriver.com> <CANNYZj-2yiGpKNc1Jcc6NO8+8MhNYiYV-3xh3BbJqTw4nyJT0A@mail.gmail.com>
 <1356a3e7519ffca6f65810ea2953429fbe08fa1e.camel@linuxfoundation.org>
 <152b3da8-8d5d-4dc2-ad60-ab03bc4b361b@windriver.com> <5216855652e912043a3b7a06e1d76956d2babdd7.camel@linuxfoundation.org>
 <17EFA275ACF95534.20373@lists.openembedded.org> <17EFA28FD32C2C48.20373@lists.openembedded.org>
 <CANNYZj_p+3JR8QtntEB+PktAhuuxOg7e-dbHv+1nFC=SzzVcSg@mail.gmail.com> <a16d7b2506544ee5ac1df57e98bd160126dcb4b1.camel@linuxfoundation.org>
In-Reply-To: <a16d7b2506544ee5ac1df57e98bd160126dcb4b1.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Aug 2024 22:38:37 +0200
Message-ID: <CANNYZj-ozQ+3JPRCJyigf2LFJnAzsWNWK7dtfORzZH_Jz+bLuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] rust: Upgrade 1.78.0->1.79.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 20:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203861

On Tue, 27 Aug 2024 at 21:51, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Shouldn't rust complain if it doesn't work with old compilers? Are the
> compiler requirements for rust documented anywhere? I'm reluctant to
> throw buildtools at anything that breaks. In theory we also would need
> to change the sanity.bbclass compiler versions tests and so on too :/

The specific error seems to be about libz-sys, which carries a copy of
zlib and that is built using host gcc - I suspect that somehow alma9
gcc is used incorrectly there. This could be a problem on our side,
I'd need to first try building cargo 1.79.0 directly on alma9 and see
if that breaks too in the same way, or not. Don't have any more time
to look into it today.

Alex

