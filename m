Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DC6CCFA05
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 11:22:49 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18412.1762168967324291474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 03:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J3VTn7c3;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4e896e91368so51852281cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 03:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762168966; x=1762773766; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JuzxoPAzr7W5lB/mrppMxI49hsQVfL15IM9HrDyERCw=;
        b=J3VTn7c3Tl3fFVsB8x0v6a1rZnsHQMv671nEefuoO6YysLkBni2xfP6WM5cMckswnm
         sgpHhCUIKVGYudEcab499KDWwArKnd+q3ABepLCLU9nqwYZjDfFIaG2gHMxfAVn8e7HA
         oQDgsdC2HJM64A6gkj+VuASI84XZ7OLdbV9D22azOUpaZ4FZ37K+Oa0V1ooiAuNdGZwN
         NBe0hSmDHv5zAGu1X3wCSbMUenfmRcWnIxFIP2SWnPbPR6/yVGCIJIgiq4A7ERcWDNPE
         Pc0ewm9rIcVTFEUPDyNdvOm4fQS1KSigDlRqBMAq1qv7i2CTtDhwHkXvbvpZc1LVHSlh
         lKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762168966; x=1762773766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuzxoPAzr7W5lB/mrppMxI49hsQVfL15IM9HrDyERCw=;
        b=mgldxodJmy5OPOK3/EPLXWxtarGHEslzBLqjTSsqXwYlwtiRcNvW3ULGJGousP8NBR
         XYQRmk0BGkwRrn4w68mrAqPueq7Kan3OjUEZrCUnVTLCDTzHF3Dtk7DuIrNS91AnyPtd
         zCyn7Xgp/HPFSlmgZJOYfRmMNMd07pROdG8X1KluQxVj8SAFNTI7qhCMUMVH7MzNuvBZ
         Een0j7BYeq/F4jAwhK65ENzSkTYqo/qnx4+aFKujUAqAeuB7vK1+AKujQm3k9qMj+rAL
         CgmPHYvEW4ngtrdRj1iHBGJJdDrjNCNdsIVO324HgK5mzDdWulAvoPCqc68+iI9U1a72
         yseg==
X-Gm-Message-State: AOJu0YzjkyP/v77tpOqe+PjGOWu+8Nx+GXdVljxQTu0lSUv3Zs15zQZs
	iHvbIgA+HeAF5jdGqRPyYutilE7rgR9OWo5DnyJaS+tCOIWhp4wOLCmf4J/F4pYcv5RBf1pC7xZ
	wET1/yYOJ2m7CyJavKqSp3zBduyAB1+E=
X-Gm-Gg: ASbGnctT38KetFIaw/QVDbgZ3R0q3e+QMFf27M5vdzbPGuygmUnwHvsOVveXtSj852w
	6vqsQJoAYM316MT4C4qKDi4AAVBNf1tbJoBp2KcyCncF6OV8KXu9zPcLBqHY7IYdsdeJZCCggiK
	7zxeDSgZaMydHmdt3zOJTnlC8VrlRkZxO3x19ra4CYTBTle6w9ceXcU9mNIHJwXxcZCvsVP/V7J
	tyebP1el+s92umwmIG7AU0K411qfrnqZAC1JxV6rEkVMrKNYdoY7671ymRP0eWcjHXQMZcjg11/
	HbMB8quc1AG5TFN3KZvva4CohoRkHQ==
X-Google-Smtp-Source: AGHT+IHBoRjPOe/yyBU4q43sgT57KC+F1rImMKhedRGnDzmFwIcWeIXW5glwxq1EAxZ0XXAs2UHSod2T1Nei9NNNUBk=
X-Received: by 2002:ac8:7d14:0:b0:4eb:a387:1ecf with SMTP id
 d75a77b69052e-4ed310a8391mr147418671cf.80.1762168966280; Mon, 03 Nov 2025
 03:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20251103082911.1792759-1-peter.tatrai.ext@siemens.com> <20251103082911.1792759-2-peter.tatrai.ext@siemens.com>
In-Reply-To: <20251103082911.1792759-2-peter.tatrai.ext@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Nov 2025 12:22:35 +0100
X-Gm-Features: AWmQ_bkiPNQdWsF50z8dHjtN8FpDmu2Op7U9AP-TPkXnpg1rMzSxEbC6eE_XIaM
Message-ID: <CANNYZj802C5ABk_1tCkgwpO7a2ECC08dKzFaCK9WoR4qBNWmoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] oeqa/selftest/rust: pass zlib/zstd link
 args to test build
To: peter.tatrai.ext@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 11:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225647

On Mon, 3 Nov 2025 at 09:29, Tatrai, Peter via lists.openembedded.org
<peter.tatrai.ext=siemens.com@lists.openembedded.org> wrote:
> This fixes PowerPC (qemuppc) test failures with undefined references:
>   undefined reference to 'compress2'
>   undefined reference to 'uncompress'
>   undefined reference to 'ZSTD_decompress'
>   undefined reference to 'ZSTD_isError'
>   undefined reference to 'ZSTD_compress2'
>   undefined reference to 'crc32'
> -            cmd = cmd + " export RUSTFLAGS='-C strip=debuginfo';"
> +            cmd = cmd + " export RUSTFLAGS='-C strip=debuginfo -Clink-arg=-lz -Clink-arg=-lzstd';"

But this still does not explain why the issue is specific to powerpc.
Can you get to the bottom of it?

Alex

