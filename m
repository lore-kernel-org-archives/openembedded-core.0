Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD69C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 14:59:27 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.10949.1745420361914914638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 07:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GSshwQHS;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8fce04655so61085606d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 07:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745420361; x=1746025161; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=okLUVtIWxAgFToWu2fdZhZ0EUMMfysaCOIEcQDfhTiI=;
        b=GSshwQHSo0sKgWix/dDPiQkjuH4kw13p3a3VSFoitWBop5H9wEnMJl+GoBwRHvHO3l
         geZGPBjItOvIVj1vspGLzVGmEPpjHmsIKRtgKjFfWbYeEotJWveBqH6IfkzMHEv5P9Jm
         8bC2siEP9wDzW6h+NvdYWAa17pEMwrLI4Ud5NCUMl2m8e0sTBktRf0JX4HX7eAm+xgi7
         zc9LB3tEQ+zpOjf7ieP7GI1LTb5tyXHxFcuaBNBzY0Bwt0Oi8IOdKzcETr/tpFJJ0Pp6
         jfyXgHM92dW67qg32xA18RA8F5CVDpAT2USKeJymieJ0DPTW4CnirwBVS5kBv37xeyeX
         d7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420361; x=1746025161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okLUVtIWxAgFToWu2fdZhZ0EUMMfysaCOIEcQDfhTiI=;
        b=LrNtGfUrcF76/3NNVqygqF8zsQk/VJQED0MbfHZkbDSliAw59wNeZk+yPSRw0YZFZt
         6vgsWe7LckE4CAlGD73J9Vh1BbFEW76gdzq8wUVJ/Wsp9StEDiyF/dktXAcJoR9rU9yt
         hsdAdwLBak60ck9+NYFP0OqpjRRHUh79Qpa7V2x33XbEWLmXPoXhBx9godsrreLitM6u
         tOmPd6cAwo7H2Qw/525VlCKJBZewzcjW4Rnb+1dSDPIftafT+6pn8p0SxVFEyjA3Xx3/
         kj2q8+jkZKZn7KZAGesztSuwJfZXtXrK10dx8qlIgDDwEFtMmh80aSaHDXoQglY1ok7Y
         U6Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWpw7yUlw6HBEntftPWSieE4XU1Nv9BKOwdtx0pLznSUTxzAszF1oJkrvbHvnF39hMcUiHuNRUpyi9fTPicVFQLYg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzUEm59PyqJn7Tg3Cf6WRuYezn56ty4MB6vn4o0uPoLfLkRIOjh
	11NvdMYMLdkK6GyUDIcmbfMyouCmU9N2RsjKiauOwMhNQ2O4hbrVVrAyhTrdyqUerZO4FHbQW/1
	xb8cRxo1xf5ELnOv7ngeitCkgCJVf3g==
X-Gm-Gg: ASbGncsxlJnj4IMWG+R5WjoTI7Ajy2NlBcOH368e2pFMG2ATE+mpvI7T1KdJ68k9gmf
	7wpobMKho7xqaYuBsKOYUkrtW7SMafZ8qmJhHldL5QrRxSg0lXrPnjr7Ot4gmoRw9MnAJ4qFO/P
	lmkWHWnIXDmN+0lN5nDWQJac+GWfCxjHMiFNVV2yDuE9SQnPXMpOqon66G
X-Google-Smtp-Source: AGHT+IH/w9k4b4+BBkHXOE0Wdr+5JOHykmIbFk2kRDWb5WobWQtljtz9xgpSie+Fy++uZFRqKRftDT2joligKR0/0l4=
X-Received: by 2002:a05:6214:e47:b0:6e4:4085:9f72 with SMTP id
 6a1803df08f44-6f2c450150amr361392446d6.7.1745420360925; Wed, 23 Apr 2025
 07:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250421090611.3862686-1-yi.zhao@windriver.com>
 <20250421090611.3862686-2-yi.zhao@windriver.com> <CANNYZj_Zfs_eqK4GDdH_5yj5uGcttoHQ4uO1=uQ3u55--SV7Sw@mail.gmail.com>
 <4e3faf82-60b7-4538-bc64-5c03d4ba99a5@windriver.com>
In-Reply-To: <4e3faf82-60b7-4538-bc64-5c03d4ba99a5@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Apr 2025 16:59:09 +0200
X-Gm-Features: ATxdqUGmYay4HfYc4GiZvk6wA8fcP7OwBFfFbDRj0ovibOvlYAsRyujpqLVThlc
Message-ID: <CANNYZj9EC2=+XLtNRuwNHWNCqkKYfnCoCFm+1BNzwfsTTTGvmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] sassc: fix runtime version
To: Yi Zhao <yi.zhao@windriver.com>
Cc: yi.zhao@eng.windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 14:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215312

On Wed, 23 Apr 2025 at 14:50, Yi Zhao <yi.zhao@windriver.com> wrote:
> There is already a sassc_version.h file with version number [NA] in the
> source directory. When ${S} != ${B}, the generated sassc_version.h is
> located in the build directory, and the same file in the source
> directory is not overwritten. However, the latter is used during build,
> resulting in version [NA]. Can it be fixed by inheriting
> autotools-brokensep? Or copy the generated sassc_version.h from ${B} to
> ${S}after do_configure?

I think a better fix is to make a patch that deletes the bogus
generated sassc_version.h from the source tree. Normally this patch
would be offered upstream, but it looks like this upstream is
inactive, so you can mark the patch as Inactive-Upstream [last commit
X years ago].

Alex

