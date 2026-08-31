Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF8EC61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:06:57 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25580.1788167211774280310
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=T4pZwZym;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso22712575e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788167210; x=1788772010; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NIMJUpjDyTID7HnIOSdElwmLneafEVLvBOlaU+O38wA=;
        b=T4pZwZymqc7UjX+QB6mwX0CZ/4h3/lLL2O9Dz1/Qpb533uBYz52Fq0WAWKcEp02A/9
         7QpjZPBdxw/+88x7zSSHelZW+Oh/6wyFmeQ/LR5BytBk0flfMlcfdsOaHAKb6XJY7BZD
         z+DQM4Vo8OQbfa3YQJ5YppYXbJnKDukMTqCyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167210; x=1788772010;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIMJUpjDyTID7HnIOSdElwmLneafEVLvBOlaU+O38wA=;
        b=ed5AU+BWuD+yKsyI2isvYsqENDb1FAjkc+DUanDA/TsCdPcGyuiJoUBVn2ouj4tSmV
         GXEdILR94+djnjoISH7NzCgGSGi3TH9bwGYvfNg1r0W3d/mBVFbefkBreQQXJANuOn7c
         /25VmLODiyBNaYfo30xhMhfbORAjb/RUXuESLKYBMbjxS6CpfPGI+m++Bk+rTkOq4HYB
         7SCA+TFRKMj9jALZm1mf8qrJK0qtzOuQuNvmgBlFno50zPwKR6M1WqLqmv/McFZ2wJQK
         4QWwj7q4LOertuPQZdtc9o1y3jQEpf9gUHWIvAoDemQpyC5bfdtdpwWzedHutZ15qP6l
         t82g==
X-Forwarded-Encrypted: i=1; AHgh+Rrw9lh2l82siBNBPUC3TlP9QJPf3ax9o4VUYzZKfUbrW/NyyEUce5vh+jlwogRwqoCUuN1QI5AbJKC3f3f9MOkwWw==@lists.openembedded.org
X-Gm-Message-State: AFuF++l2OXGzeZOw0czXykHCiQ99CphFfHiKtC5AIFGz2nuOB/exApue
	QWoPpf+go+vlCiubOeMpP/SR7GtY/uNXpfdcCPt7vHEIE0MeiF3pLjpIMpWxvc8c9rbvTdf36AB
	qNoj5lu8=
X-Gm-Gg: AR+sD111jQipvNeP2csPXMh5ihwOOCYxzeuWlLouGILxN2ud6NKTuh1VI8MSmb80tTN
	qoesYGZCW0VLmjBsBdq4V9NhhXcv5Yb4NV7qXo4ByiSqyjkqldTooH6cx9C/LkcgT9lqYpKJNY8
	KiNu6phxXVgfSMMduPIHlEo6TdrMTLYgiocnuYqsis81AzJqx4YRXkAnypC7tTlAt2+GX7g8P02
	+QQHjy+IXnQ9btVDdlU1eqqs643uFdB/V5Z5TovFcqnf1+5xErT7hl60XFQyP5YPlPrcCLipTol
	tFPLaIIjb0fd+vuF+vEjTnQm0pHMjWPKc1EOUNZg89/oSW2pY59otlPtv1qovs666nKrfPXoVTC
	EOe2LRSiZcHwyuaLMcTznLTRaoZTcMvNLd5wZCGYa/rJ8New0ZYEaqTNrjnCJSVrfTqIoWtn/kQ
	ismBjWhDN7HXIJrgRTNelaUYeBDL8ILiIN5hHJcbCOdWSukZfLQHxmCrnEDaLWHZEZULO9rP43J
	PqmreUOWsNt8Jwn2LnRtSoaVxAol7gK7A8tS/2bc2XptQ0W
X-Received: by 2002:a05:600c:8b76:b0:49b:9161:db26 with SMTP id 5b1f17b1804b1-49cd9479180mr31708415e9.14.1788167209601;
        Mon, 31 Aug 2026 02:06:49 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea87e1asm131350985e9.2.2026.08.31.02.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:06:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 11:06:48 +0200
Message-Id: <DL30DF8R6J3Y.2XMP2OA0BFNV0@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Sundeep.Kokkonda@windriver.com>
To: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: fix CVE-2026-5435
X-Mailer: aerc 0.20.0
References: <20260819092634.570557-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260819092634.570557-1-Hemanth.KumarMD@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244752

On Wed Aug 19, 2026 at 11:26 AM CEST, Hemanth Kumar M D via lists.openembed=
ded.org wrote:
> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)
>
> Specifically, CERT, TKEY, TSIG, OPT.  This removes the buggy
> implementations of TSIG, fixing bug 34033, and partially
> fixing bug 34069.
>
> Reference:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-5435
> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D34033
> [3] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dca44a6609c29=
a683b03575fa035c6d17aa591e72
>
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---
>  .../glibc/glibc/0024-CVE-2026-5435.patch      | 137 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
>  2 files changed, 138 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2026-5435.patc=
h

Hello,

As fas as I can tell, a fix for this CVE is also needed on wrynose.

I can't merge here until this is fixed there.

Can you send a patch to fix this on these branches and then, ping back
here?

Thanks!
--=20
Yoann Congal
Smile ECS


