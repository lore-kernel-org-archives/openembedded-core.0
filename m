Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312A9C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 11:31:26 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.14803.1736767884151063265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 03:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kiIlYats;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6dd15d03eacso38202476d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 03:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736767883; x=1737372683; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hak5pSQs5I3lY/gydJmhEojGb38XGlq2ECzK5hcGm+M=;
        b=kiIlYatsrG1L1ylWMKgaN+XhnTHrc+b4zR5gXCYX/jigJAeayApGcqByMETAzZybbG
         9WVT/k9gv3SvHpLjPQQzmnqdRpuJeYrJkKhJMS+mvgTzKDXEXMOxoT/O0C1b0CkITOBn
         B3LYx/0LTAHO5p3X+fzlnkoQvhemayUQBXvFfyY1y1FQLLIvE4uaiolHdtNkhMqh5nfr
         DTWmvSUN1o6QnW5kOSdU6J6tzZkm5ECOY8/7ib2Q6ip4XwpRwZSXZJgQ88lgWUwOMupV
         iB5S63Kg1/obVCfaXd8w+54bkRtWIJAC+/Id7SDKJtXGsVNi0R2pCjWNDX0AYy3mUPOJ
         PuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767883; x=1737372683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hak5pSQs5I3lY/gydJmhEojGb38XGlq2ECzK5hcGm+M=;
        b=CJOVVHaGUSGgD5azJflHxm8Fsi6K2FEebVuTuhVZvGGT5mD7wtxaNu0PVlfBQQHs07
         nZ6VndNHBRX4pLuJMHhtFcERPi8yWfwWzym9lqaaFnNuHikPYUnYHkz8EEFIlVjZszgK
         RTX8UBk6IfGkyPQYKPEn5A/P64z7nhBkiAt/wdpl9UZP/7RSOqacJvhtH79t6+9HD1OO
         i3mVfW22c9krzQPYKuv9ocIhDgXv2/B7BWI2jGMZ8DbU02CPVYz2lA/qn/55ibrMDBer
         ecsfhA32Zxf3HkD2SqP/vAhKYBuEm4q7HDHrEWvWwccKKBrZK73Lg3WWCRmjkoS7wv1G
         il4Q==
X-Gm-Message-State: AOJu0Ywr5xVn67ELbj63h5UNTBJvhvA2QlTXYP9+rba122qUQbfRfA7l
	xOHl1s8xhk7xV8NV1ALfsll5qB5Si72CcLjlx1vX//OR6FlphcjmKB/NLOUDXItIzOQtORcmOMn
	VhS12BtKs46NkfiPDtDEynhE6J+U=
X-Gm-Gg: ASbGnctp1/JSu3o8Kd22yK9fWupU+xN4+AiydsD/HDjFro+h80QEeIakq8SRrDraGG+
	qhgC4oyoTT1nHR0pdPmTVWsMzQTd8eHvBegKOa2hZozQAE757WlcZxA5J0JIDUVmRu6CNmLYt
X-Google-Smtp-Source: AGHT+IFjAZxlqHubDQoL0La14JUVIzJapNpC3tKZoppxV0d3PrNQDVVtOUgLI6k04bPqoCz2Ie1NpPBJAwfEr/Hb+nw=
X-Received: by 2002:a05:6214:2f88:b0:6d8:b5dd:7699 with SMTP id
 6a1803df08f44-6dfbaa188fdmr122597986d6.17.1736767883200; Mon, 13 Jan 2025
 03:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20250112145359.607585-1-chris.laplante@agilent.com>
In-Reply-To: <20250112145359.607585-1-chris.laplante@agilent.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jan 2025 12:31:12 +0100
X-Gm-Features: AbW1kvay8DdKPZHVULoUoKC4QT_RE1uNnv2-6Df3-deAJhoaIuTlGlE2A7_ZmuU
Message-ID: <CANNYZj8U7b=ivPzXDvrpqpQLLt2kVZLKYDhDA6gExo_Q5hNsXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] De-globalization of 'devtool'
To: chris.laplante@agilent.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 11:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209712

On Sun, 12 Jan 2025 at 15:55, Chris Laplante via
lists.openembedded.org
<chris.laplante=agilent.com@lists.openembedded.org> wrote:
> This patchset removes global variables from the 'devtool' script. It
> also changes `Context` to be a dataclass.

Thanks, these changes look really nice.

Alex

