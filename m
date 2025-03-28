Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC34C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 14:40:07 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.12770.1743172804412134909
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 07:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cBzidlhP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf848528aso19363055e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743172802; x=1743777602; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eZtsAXubqH6yPoA91jqmrEsEGLcrT7TkeXgkpAYRXpY=;
        b=cBzidlhPpRiHRqD5tBQhRv+c3jkfvvYKWclmRCBs6PnBVTYHDEuFEwC93/DA6Xuu4x
         UBz2biNm21qqjp7Kqm/lZCnG0n4rdiXGP4RFJSUdkmLD/cMHGzwG6DnrggfCkHapj7Db
         zuQGjlpw2JiPA8kbYmAvRlV4s7dE0N+mJBH2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743172802; x=1743777602;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZtsAXubqH6yPoA91jqmrEsEGLcrT7TkeXgkpAYRXpY=;
        b=I7v3p85XV8Jazczc1zzESC8GGL6PryQmb9JlVx/TZmAJ66ZUXf33D4kZtInkylRpmq
         w5eLaDJ1Z0c+6WbexhBj0oLX4C5mEC9OM8q+b34Xjhhp/GkOe5BU05J1WNrdc1tj3/75
         Hk1EdBeXZ78WCZAWaPUfKiTP22C/5jZOKy7RTfdfaxMI9zOFGNVpb8/DLWoo9+oz3MIm
         uD6Jn/uFMWDuQWB3gFmDAacG7e10cbGZQ2LzdUvVOE+HSe0JTuB0EZZscKqlvsY6Eydj
         SvA5JvW7eh5tE4ZpGcRwK9Zq0uTasZDJVb3SWv+QjJgCerMS0w6oLn+h8YGcLOSPqMw7
         A50A==
X-Forwarded-Encrypted: i=1; AJvYcCX5zZCCHiNGDTTQ3J166/6ML8nVp740Wn9yVuGP6FQqZPSTL7yCrGnbe5MtntWdEdYHRZo0IBWjA2d9R55zs/1pRA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyfVLiJ1vvcX3PsBtZ66en1Q5Ssu9ChwqdcYcHht1d+FjXphmc6
	wQEwgiYckhSGcNgt1BAAI7FhcqO9sBKM5iHixS5NJhcKqEbA3iZ3JoA7EFkCHlE=
X-Gm-Gg: ASbGncvCnJEam5fk17bloi5nkObTp6VXiFLw+XjplBVeznbz37++q3zlDa2pA0Vwdog
	fQkD+oPqwZIC4LYDE9mPLl9ZoXbW5RTRJvZCAEUGrsuetyOhwqrGdAAPuj9C5VEDZANRFytdG5V
	ZmlgoJE2K8GC0eFu4JFRkB8Vd+fjVFsfJyNnsxcVetypOrEI4tbjFRUhD4j8ks8+YUFH3IXxLZd
	947qkcEWpZkzaK14h8NNV6DXwCfUjMe/D/GMV9FZM1AyIYsSy+BGoIhpt1HZe2HBAAj9k81EJqS
	0ilUFl5ZgjkAj6L6JfIGAUkRXuzL6NR1MaKdlQWRQyqPeLOHJ7GxG7Ouxe/yqjM0KHe77mgR98s
	5aT7UswzbeehEthWH2p5H3TANjr0+jLOdhQ==
X-Google-Smtp-Source: AGHT+IFLNvjAGirDc11R0w2abXPR9KRHiMWyXpfSqqtf+Mn672qH78NJb1N9FT8Wtp29zXhH8AX/Ow==
X-Received: by 2002:a05:600c:444c:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-43d84fb27a7mr72708875e9.17.1743172802564;
        Fri, 28 Mar 2025 07:40:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8d57:ea33:89bd:8b22? ([2001:8b0:aba:5f3c:8d57:ea33:89bd:8b22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91439d11sm17837655e9.0.2025.03.28.07.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 07:40:02 -0700 (PDT)
Message-ID: <fc9c93b1523399820a1a3b72f2da021c2780c179.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] rust: Upgrade 1.84.1->1.85.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Fri, 28 Mar 2025 14:40:01 +0000
In-Reply-To: <20250328143005.880998-2-Yash.Shinde@windriver.com>
References: <20250328143005.880998-1-Yash.Shinde@windriver.com>
	 <20250328143005.880998-2-Yash.Shinde@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 14:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213842

On Fri, 2025-03-28 at 07:30 -0700, Yash Shinde via
lists.openembedded.org wrote:
> From: Yash Shinde <Yash.Shinde@windriver.com>
>=20
> Rust stable version updated to 1.85.0
> https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
>=20
> Some of the major updates:
>=20
> - Update LIC_FILES_CHKSUM in libstd-rs and rust recipes.

How did the license file change? Was the overall recipe LICENSE
affected?

You need to be clear about what changed and if LICENSE is impacted.

Cheers,

Richard

