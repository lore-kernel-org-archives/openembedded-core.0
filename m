Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DADCFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:56:45 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.596.1764691002421954613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:56:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dB0P4xZR;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8804ca2a730so78667506d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764691001; x=1765295801; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/e/lyK+4wSg94j3192y6VebhFXz2loqRiGthIAnpeUs=;
        b=dB0P4xZRdCV0QTaDel1/TDKmRQkprm6o3WG872FmD0H/cfucaygVyQ6lvDPB/eSobT
         kbKFHVUgGzS6liT0Hm3Oc9Pymg+5GZuQzqB/N0Y/WZJPseu3i5SlKTm+srdQ3bvj8Db7
         WT2MC+Qq+vNqzJtzYCEYIhZKlKKZIzEgn1SJrcAK7Ea58lFjLTUA5XTfo2T5EE0UJUJj
         Z/hc4xF3c45JM+AR6xbHnsbNbyjdbQ2ZmcWTeojQSORHsqj7xnKkdskRwKC+B0YL6ACm
         vXqGPfxt6Nr99WiVyx9AXNS/jveJhZ0leBFaGWLTlGHAdKfjKLN5EkmKZMOGTOnJvt5/
         VAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764691001; x=1765295801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/e/lyK+4wSg94j3192y6VebhFXz2loqRiGthIAnpeUs=;
        b=Uk+dGuQHSIIQgMQdZCgIwxesHYRn1c4mJhVZQsV9TeW2nlbeB5PrPtyabmYMLkNd5m
         oT7NLyd7h295YD+RzK0F8k6BEMNEr8O4ViKbuvQDGXjsQqOB+uQDroKhqN7vwgy5KC2M
         BYhsicicQDYHPjvOihGc/nYGADrDukcy7ilcE1H1SohEOMhB3gzlmq2TlQHu1zXBCzXu
         RmUJPKYWp4/AYdD73z6TwG0KzLy61Z4ofbdmm6sSBMqaRevjf/LmYwq8Pk+bi0ILMLOW
         xuFDnoAawmwwgrXr43WluzHK2ZE5nBGTYdwbRTa0i6pI02WF2nK/FssHWNdgWMnaLxRf
         g8oA==
X-Gm-Message-State: AOJu0Ywsn2/owFkejsgQHMIZwjBFOOkDJbskkkMk247h1+/5wuzuphXF
	+7CaMUAxzzaTwKgzH1nY54Icstzla1aTYzcfd8rvkDELnd/epzGQjbMgaGzdkOSffcXqvCRMxz8
	tHrfwQlyXPCWqivvMnU1Umq1K/64BN/Y=
X-Gm-Gg: ASbGncuV73iyltCKJ3LaF+2HwllFgodx1AsC4VCvZUcA7TNe1solHpvXAUjn0DPFJ4c
	pgfy6lfU5MLc8xaUwimeyFLVCRFBDpXaVpOUGrMMQh9rpzqM75Dlld9vbhV+ipfKa/8dGk5zGDV
	6BIUnx/KdRJaD5idynqUExTP52Afc/dBbfmztbniZMuvz/gr7MJj8LcMp0lt5YrkYHDKx8zHUuU
	dZkqsptS5rWKRB22T/UubHBZnT85RPqBKXb+aBUor4o/8KWfNw2hmDm9aAXu6S05XfHoZSeGBtu
	rPux/cEukBWJStOh9L73tp6F0hlm2A==
X-Google-Smtp-Source: AGHT+IHtMRSDt+uMaX+59Bx2R89KJ1P0DBhT9B9iKWeT+Ua3+/M0M+9BAUGClI5UcqGsnabacZk4EK0koiZwTIR3j3M=
X-Received: by 2002:a05:6214:3c9b:b0:882:3b63:f7f5 with SMTP id
 6a1803df08f44-8847c515fd2mr588213986d6.41.1764691001390; Tue, 02 Dec 2025
 07:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20251202155043.815098-1-corentin.guillevic@smile.fr>
In-Reply-To: <20251202155043.815098-1-corentin.guillevic@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Dec 2025 16:56:30 +0100
X-Gm-Features: AWmQ_blXRJQ3lGDp-l0GOq7R8OSAabzTSN5vyAmeSDqVatKKxXKAJw_nifoeSh0
Message-ID: <CANNYZj9qxZ4KmoP_8YeMUY9j12us8iNkhp3rs7UViSYpL5gRag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe-setup-layers: support inline URI
To: corentin.guillevic@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 15:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227173

On Tue, 2 Dec 2025 at 16:50, Corentin Guillevic via
lists.openembedded.org
<corentin.guillevic=smile.fr@lists.openembedded.org> wrote:
>  scripts/oe-setup-layers | 11 +++++++++++
>  1 file changed, 11 insertions(+)

I like the idea, but this is extremely incomplete. You need to update
the schema in bitbake repo, the sample file in meta-files, and the
generator in 'bitbake-layers create-layers-setup'. You also need to
update bitbake-setup and its tests.

Alex

