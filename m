Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEB1CAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 08:14:29 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.11658.1758615267856574249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 01:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iySdQgHN;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-84d0bdc64abso193555885a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 01:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758615267; x=1759220067; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N3/XXMcEeOKjRSQxjAPE6WM2BVxkHbTBaeTJQ5dBZLM=;
        b=iySdQgHNw1NZFUxO+Rp1mI2LmG1GHtXFM+TwYWPloOkJTv6j9aOWWwihJNBVrYopSh
         9sXhhheM5Kv8CiARcfc7EogOFQ6VN3DM8DjP8CuKYUYHhEZzJpCbWWRD6s9fGbEVFRPs
         GEL3sPEwJ2Eq9fGkFGSeKvCWTb/9z66w8OSHlJLOaUc1241y8108xSenPC1uzD0xTbS7
         vnkBuTYoWXEZzhHlsB80r/B0kI7XmG7HepOWRqNB+tR9yZfe2iG7K3td5PrNJlhFXBoh
         xbojda80+VeubjlDRDO1oyqWOsAyo+LXwsIpRoS1jjpGR0cIJGoADzfHmin7OZMqK3Is
         ukRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758615267; x=1759220067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3/XXMcEeOKjRSQxjAPE6WM2BVxkHbTBaeTJQ5dBZLM=;
        b=OyPIpj0Q7min+ydXKRIUoOYJjY8TXcu2FiXi5nVYtpE014xIrM0PClqrP90GTTINvz
         lxE563FNSkmgoOVeide5ozEerUNmCQ2Yd8cYjF15lgFIF31OatIK6LwpA3t1DERsIyBL
         9aydW4aj1Y4DL1f/LRqqHc9u6qbH7tL8gOnsy+0wGuzVvzoQ7wgTE09Q2c4t/iR172YP
         cFGaSds7ykl4dWMmVQberjLVfuwLmI3TDCRG9cFu1889bWmaW0Fq4pFX5f6Q5YtGD8U0
         NYxN6hcB5RHpzIynYjah9DuYpZHqZ5wlBERA8COWAiavJB4RO4+yOJce1UwmUTjbMVMc
         PJlQ==
X-Gm-Message-State: AOJu0YwMwBsbiF9h0+yTp39hXnl4vhsXnsWBhX504et30+/l5DI3tQyT
	VZGzYDPRV55Lsr70ri+X+S1Ygo3myMmB+BtFETM6nQ6vHsdV/zFQVyKiswtRBQd45gZKs9TdUSY
	LSb1u5wdcbUtlGC02T3nfjJ25wPqzXZaBeA==
X-Gm-Gg: ASbGncvjHafgTCK84Srps6SSpee5/kLriR+NY1jMmfTVNC9N5gOwAhB/+JvV2YuPqtp
	W4ux0hbPwOac2BcqDVVl9ydxNA3fq0Z8au/CMd/BTL26QVnJVfsh1ExUZ47ZP2AGF1tiz8rzf4K
	iYZnH5cBse7AMocgLSmLOyayXh0NsL3uAbDJSiQR3Ln56lOg4QHoOScKhNsIsyChWRi8UF0Up+G
	0PXKFhNYM1xhHwDGi+Ykm+AYWjQRoJ62n7VlqXo6O0xE/+dG9e7cUbKTreRr9zIRhI5um06x+/z
	JFbI
X-Google-Smtp-Source: AGHT+IHy/zV3ABSFAKO+awOWVP0T2LHT4zcpCdtZJmv70QapxUfPZtLUHpv7zXtvBrSMUqX+dT8bKRxcZupWxnhlpPE=
X-Received: by 2002:a05:620a:471f:b0:849:ec39:e98d with SMTP id
 af79cd13be357-851708f8f90mr189704885a.46.1758615266601; Tue, 23 Sep 2025
 01:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250923005234.2952070-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20250923005234.2952070-1-Randy.MacLeod@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Sep 2025 10:14:15 +0200
X-Gm-Features: AS18NWAweIEZls5LgWL6LwN2P6RU7VDN5tRk_Epq4BAGhNDh_Xe3Pw7H9dYcdkw
Message-ID: <CANNYZj8xQKdfsJQP-r_qAEqYFHCnzZVCC_NLHbX6yFj1OU7mZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] gawk: disable persistent memory allocator
 due to licensing
To: randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 08:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223868

On Tue, 23 Sept 2025 at 02:52, Randy MacLeod via
lists.openembedded.org
<randy.macleod=windriver.com@lists.openembedded.org> wrote:
> +# pma adds AGPL license
> +LICENSE:append = " ${@bb.utils.contains('PACKAGECONFIG', 'pma', ' & AGPL-3.0-or-later', '', d)}"
> +LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'pma', \
> +    'file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19 \
> +     file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19', '', d) \
> +}"

This is incorrect, and has already been discussed in a similar patch.
LICENSE is for the source code license, and should be set
unconditionally regardless of whether pma is enabled. Then you can set
licenses for particular binary packages subject to whether pma is
enabled or not.

Alex

