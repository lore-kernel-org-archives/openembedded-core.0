Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69640EE36B3
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 17:53:16 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51662.1770918787111674910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 09:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T5DlN+Is;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-896f4627dffso1912116d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 09:53:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770918786; cv=none;
        d=google.com; s=arc-20240605;
        b=Ehaki2stb/hwbdKhQA6e1k4jMWnEZr2U/lyiw7UMAqKtn+gIANrCDvGAkFTeDLDYwS
         vr4DBT2iQjDZXD1NyBaGX9DcI91zSmb0kvvYV6buC5fDfDolgl6sEr2AQBBpXFxW5RJA
         fqFIGzZv0O8o+MCA4J0bBpUFR1aRNAZdWJsCzXOxtXMiXmrIwGJpNPcV01kVDEVlvH33
         U/29ERogE/Rpf80lD7xzemoHUpPHkr2UkkFClWJzpN3oqcVzbOmv9zgpHDJgb15kTb5s
         4IhAVjnHVme5RNeOyDAGwwwSLbWJO8cxNGmjcId1eEX9opC2AmHFDcwVwykiwRXMgi1I
         UtLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hjMrKicrig/UhzxzFCcc1JmcqEVZ8SFG9UJyVWp8pcM=;
        fh=+E+903tN7uA7VNC39/QQ7HB3WvLqK2fTeZGVkBFWM0Q=;
        b=i2St2bnrhPf5DkE47dRV2EXO2xyX49dss1AEXlkzkRwqjuhf72lh6uqj3ZeLtSN6jK
         g5aRkab8eZekNsHt2mMDxvi3fTlF5uyr2rxxPC9YgtKh7fhCjfwbTleIQUwPqwOQOnKQ
         ijgkHI9BOGnT2lHiDn2SjPmKIfmGkwoLycXwP48u6Yh3Z8c63sUwVUhUH22k9p4naP6R
         w4hqdUU2w+FdYo527U+dA4ru8/BC+ZMCJ9n2d+st74I7aRZwdJpFHGxjy1evvzc+ZVEU
         njo+IafEhMZ5YCZyqRT/DnYu1D+ra31lOuB9WD3Fmdn8HmZek5RFg1TTBtpmrisWf1Fp
         8ZMA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770918786; x=1771523586; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hjMrKicrig/UhzxzFCcc1JmcqEVZ8SFG9UJyVWp8pcM=;
        b=T5DlN+IsFLQbIAcjM0F35JSvl+V/0EB7DoWuyhGu5YSMRPK/CepL/AX9ZCdsAFi89J
         GaUsgYv4KycXn1HzO0CHwGmsogm65FCDlJAh18roNwUAu2N67iZjfLWuK28q8u3BC9dS
         mrIPnRtwpzjZTIYpbHQhtP/8350X8f68QY1m5hPpIP/DWz3AEAieyzMlFqlEfvEsnHPj
         sxes5RVcQTQjPAb3SBB0BV1U0joAATzBucVHEYY8WnJBsqRErSHwU3At3RnZEUpC9M53
         67nd3L3oGL/IBxAuvvivGvI696v9SZd1RESRMzjjUn13hiYcUSmEoWpEsQIDnwIjnteC
         WKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770918786; x=1771523586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjMrKicrig/UhzxzFCcc1JmcqEVZ8SFG9UJyVWp8pcM=;
        b=d6Rqw6riS7g6uyRlz+jlGC+heLsmBQfsyeYOLJr8AE6dtx4A1CXfc9gss5NwlDJ4jS
         CjY/mgxTkNisBNiL7CgTIg+fo/weyknVd0h0iiP+ZPy9VQuY96efsc7KZCOXklQvbWLk
         PnJG9My3RBG6qbM4xoMCBCazRUiX5g1FCMXpAtJSDjepnqOlQvF4IwNGzXKl3ppkqD+3
         h/2/7r3px4y1gxq7nk3undHwLbI7C7iDp7eiLZ2aPbCl6Fy7s0qo21+UQ45GJwOGNtmb
         qvSRH6HsfxGkHaFDX26C55ntVnK8V6wPk97lvki/510bwGQSgHXD3MG/GGndzDj9ZS6f
         OLRg==
X-Gm-Message-State: AOJu0Yyid13JqkGMcKPs66B3sI3CyCisDe+HFr4p6+kVs0uQZlMJMEmG
	XWvyzP1cAykkWHSn7HvJzN1axXFMJ9uXBdIMaLyhrDBPhC6h1tR2Xlma74PISMxrOm0MnIu3fNe
	IzcCqnR8krTiD3M6jgerrFGUGd8A5Sx0=
X-Gm-Gg: AZuq6aKfkqcL0TOO1TNH4KqvlIRDpm1BfG92lSwmzu+ZXSY0wu8hBqpOHqaGpZ9Jobx
	86qqi9EE5PBUQTcZURJPYBmUBBZgqC3eJ32twT+1E6lkGR32jy48j/0ammTUy7jSfuBUpPlRCAC
	zuEZtlxNIgTzqqG7UD/zoTn0Q9SiwfgmSasTe1bPgSsU15d/oU7yxZztBAzoLYhKeglK0pgqs2/
	uB/uFr2C0Enl95cwk0Kj0XZu6SM4RIs+Ge+wJ4eYLh+L65aQhN8OKOJtrEWwZsT3NSsGThtfPYW
	UhCJQbfNCHsr4iDCWuX2UH3R3OUuvoKRHLRc0aHPGg==
X-Received: by 2002:a05:6214:e46:b0:88a:41d9:23d7 with SMTP id
 6a1803df08f44-89729c5ff16mr39248276d6.39.1770918785974; Thu, 12 Feb 2026
 09:53:05 -0800 (PST)
MIME-Version: 1.0
References: <20260212165035.1806068-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20260212165035.1806068-1-sunilkumar.dora@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Feb 2026 18:52:55 +0100
X-Gm-Features: AZwV_QiCYEpgZrzYuCUrOJYEJ9kb8kRD97fYo1hvEoily0B5XTGsWXCKoQUC450
Message-ID: <CANNYZj-qm=XBzzwm5sD88mguQPEDudAnkO=0CmGKN33MGDjBmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Enable dynamic linking with llvm
To: SunilKumar.Dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, alex@linutronix.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 17:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231052

On Thu, 12 Feb 2026 at 17:51, Dora, Sunil Kumar via
lists.openembedded.org
<SunilKumar.Dora=windriver.com@lists.openembedded.org> wrote:
> This issue occurs because rustc, which is statically linked with LLVM libraries,
> was built on one machine using a newer toolchain and then executed on another machine
> that has an older linker.

I don't think the above is quite accurate? The issue is maybe better
explained step by step:

- llvm-native is built with a newer (e.g. gcc 15/binutils2.45) toolchain
- rust-native is statically linked with parts of llvm-native using an
older toolchain (e.g. binutils 2.40), which does it incorrectly
- rust-native is executed (toolchain is not relevant at this step
anymore), and crashes inside statically linked llvm code

> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

"Signed-off-by:" tags are sensitive. They're like real signatures, in
the sense that you can only add your own, and never other people's
(even if they gave you 'permission' via some side channel). If you
want to acknowledge others, you should do it with an informal tag,
e.g. Suggested-by or Tested-by, or just say "Thanks to Alex for X, and
Deepech for Y".

Alex

