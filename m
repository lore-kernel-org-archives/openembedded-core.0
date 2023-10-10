Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E52CD8CB4
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 20:37:45 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.835.1696970264873329537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 13:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EhxRZUg4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-32329d935d4so5537173f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 13:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696970263; x=1697575063; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vO20jxf6pT1sM6n5oJldnuFpETc2vq+0TXX9IKNKm1E=;
        b=EhxRZUg4CmcEKyPJYJKmtbodAbYYr0yy6/QIGuTQ+NKEGfR6ixo65R97LaNBZmS+GN
         zAIgIFKVSSGDemgx8N3lLD4I/9Yp4b8aEm3bcNz5xnmOTUQJ2ovUhpkXxq3MvEr+jKS3
         H0Z3XSx8vNplnePNIXTW7MT+xACcz4g+iGNp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696970263; x=1697575063;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vO20jxf6pT1sM6n5oJldnuFpETc2vq+0TXX9IKNKm1E=;
        b=EOEKlLjTj9UV18R2zEaQg9HpknU3Zj0ZZXtZMjZoOs1iy3WHYF9dBURJxfFQ4GIV0O
         PXAq2Ac5FMTvEUic4VHoogzsxmp/3aNjO8i9FXWTSS6rU87Qqy6Vvm/Z8ffzT6QFAuIR
         USiT5v1GX9oZ9Nu58BtMXGLJjrz8HAPi6N/A+cWUTqscU0WbGjCvx8l6KP5hANRP34sB
         K7gKgkeY9OOmtk+vVHqJxPG6AZzN6G8SWW16Q8+1ZlA2Yh/0TFmx3/i5qJHPzS//SUGR
         BqIGbDz9cQITk34zLmax1xk9/Wgdb8Ni7K7INP40OjbLZGp/X1Z9xDJQdY9X9Zb6GI4b
         /U9Q==
X-Gm-Message-State: AOJu0YwembPdX8elIn+rlpbzBdq4QHo5wjtgmloqpaD7O5Bzl425SsiD
	PLK8Ym+wbUc+E1EDFPeyOKJmmUDVrpRszE17Yz8=
X-Google-Smtp-Source: AGHT+IFiE7w7c8HwlA+/QrQRNVL6oT1wMMgtJA9SSI3IVSmLl4QV4S0UBHRirihP8SxySHlptDVonA==
X-Received: by 2002:a5d:4049:0:b0:323:33cf:7872 with SMTP id w9-20020a5d4049000000b0032333cf7872mr15908595wrp.6.1696970263112;
        Tue, 10 Oct 2023 13:37:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90? ([2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90])
        by smtp.gmail.com with ESMTPSA id n14-20020adfe78e000000b0032196c508e3sm13482029wrm.53.2023.10.10.13.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 13:37:42 -0700 (PDT)
Message-ID: <1bc916b554d1a587cce663a076920136b96cd758.camel@linuxfoundation.org>
Subject: Re: [OE-core] Summary of the remaining 6.5 kernel serial issue (and
 6.5 summary)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Paul Gortmaker <p_gortmaker@yahoo.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, Mikko Rapeli <mikko.rapeli@linaro.org>, Randy
	MacLeod <randy.macleod@windriver.com>
Date: Tue, 10 Oct 2023 21:37:41 +0100
In-Reply-To: <178C704E48D36FAB.24994@lists.openembedded.org>
References: <178BF2895FF685E6.5378@lists.openembedded.org>
	 <178C1443D3C8D91F.5378@lists.openembedded.org>
	 <178C704E48D36FAB.24994@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 20:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188914

I've been asked how to reproduce this setup more easily outside of
OEQA. I hacked this up:

https://www.rpsys.net/wp/rp/simpleqemu.tgz

extract it, hack the paths in commands.py to point at a qemux86-64
build of core-image-minimal and then "./commands" should boot an qemu
image using the system's qemu binary as it would during the QA tests,
setting up the two serial ports as it would during tests.

Obviously I've just brutally hacked this out of the QA code so there
are plenty of sharp edges. It should allow the serial setup to be
replicated and experimented with more easily though without bitbake
involved. It could be cut down a lot more too.

Cheers,

Richard

