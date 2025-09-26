Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D01CAC5AC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 07:38:29 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.12144.1758872306709763298
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 00:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lp/q4Ipl;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-78f15d5846dso17953186d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 00:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758872306; x=1759477106; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cccK2ga6t3Gpn0q1PeOvxM2J2ThmzIbZou9KJcmdyDI=;
        b=lp/q4IplAeHQUa6i236Q7+3EhuLfoZ1AVASCvGlZFmUtZQWsXQ3U8jY8HA/Il4xUvS
         FrvAOkRznxVvdrZmSd453EcYGrT6YBjcEqKBjv9pqdgFKNIal8hSCBYERvwOSrFKg5Iu
         Fuhf0US1oxsiudUqEQQa3Un0eebfzW4kRgKvxxmf6nk735ObR+Wgl+zMoG0fCAxzO9oO
         D/JJnRX3u0wRic9+fF7XHtgzcY9ojpdL/Bnrky8WWq1YtTGUG/SeG1ewATJMfgRL+pnG
         akohVkKNglfcKypkP76/PvnYsMF5bNNOwqmed2L5CcOHvypDuZMrWF2JKKinqkJz2MLa
         0vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758872306; x=1759477106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cccK2ga6t3Gpn0q1PeOvxM2J2ThmzIbZou9KJcmdyDI=;
        b=RDhY6sZQTkh69nx12LuIRdROeJLZXfFaBBA3crW3qr7/eMwm6ch/MDN86f0dyb95G1
         9lk403Ljyl/m7si+Ck8b9stQKNIOmCPb35dr6MVmzTef848laqYLCBtEmnLakqy3qS0p
         79uPFQKe2ugiLVgBy1AuBTz9w2Px7xhukKMxkoUnaDNGF0qjlua7iSN32goae0ck5p2Z
         fUr0CTJ+DzA7cBFnaDPNYFG7NjYoFfpDAiHFBt9jekPDu5eGdrkGojye9RDRo47GVw+8
         V9dBrzEm0rpxDUfOQC5Y1kMJxBJD7GiTw0UXJSkgG+9PWgc1oBzubYgQeOrxc6LV3N63
         mWHw==
X-Gm-Message-State: AOJu0YyiB6gwomnr0P7UaT0CC/1arf9QO8aI4TUT/y/tAKObM1+KaD+e
	nXB7hx1CHUJ1iox/PGA3XAUE4/Xhxp/dDIrbs2cp5ba5e4xmiSYAnptx+dIczhT/6Uyurxqt2PV
	0AGU0cFJEp6rkCPwTcqBrp4GV37mEbQlizA==
X-Gm-Gg: ASbGnctoFXHQ4V7fNX78mz3BjHZpFqp7ZUs3LiIe1ws1/XaLgvlXJtC7/NoUqGLdxFy
	HXaRLaKkLizrsHN9ChceWG3l2RcmMD1LFyd2T+Xvuqv76ICSFUDjlEfOie+AlEsjS5l4aGeZA4K
	VxSUvmUoQgKIPNsxaYHPXwYsMMYGdrxEwtQFjeqIdfH9GfxzJGQ4BRkGgrTUSB75Gc6Lk1Y+SDS
	khkrAZ1J5b1nZuotlac7ekUraRut2MjtctrdgBEUayB6qBso4RxVMW81JAV795v1iLGK8muo78b
	xXxR
X-Google-Smtp-Source: AGHT+IHv9Yhpy9pPpCTyhCoWaZvC4JxUAcQHxqVWhT0tiZ0N1cvJVFVVDuSdZAfRUJmsTLDCqwkiBi0qLo4ik2eX58M=
X-Received: by 2002:a05:6214:224c:b0:80c:2633:4831 with SMTP id
 6a1803df08f44-80c26334bf0mr65534456d6.18.1758872305577; Fri, 26 Sep 2025
 00:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250926071158.3439500-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250926071158.3439500-1-Deepesh.Varatharajan@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Sep 2025 09:38:14 +0200
X-Gm-Features: AS18NWCo40jqCJxpnAwrWruzjCAXm310SwDmqOTRWGprV__pQMSazQXbw4q8KJA
Message-ID: <CANNYZj-=rkw_rpYXK9FA5wQDbXRXthUk2y_LWRs4Mym+_em6iw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Drop rust-llvm use clang instead
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 07:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224059

On Fri, 26 Sept 2025 at 09:12, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>  meta/conf/distro/include/maintainers.inc      |  1 -
>  meta/recipes-devtools/clang/clang_git.bb      |  4 +-
>  meta/recipes-devtools/clang/common-clang.inc  |  6 +-
>  ...-gcs-instead-of-gcs-target-attribute.patch | 66 -------------
>  ...r-sort-ClassInfo-lists-by-name-as-we.patch | 31 ------
>  ...-llvm-allow-env-override-of-exe-path.patch | 33 -------
>  .../recipes-devtools/rust/rust-llvm_1.90.0.bb | 98 -------------------
>  meta/recipes-devtools/rust/rust-source.inc    |  1 -
>  meta/recipes-devtools/rust/rust_1.90.0.bb     | 18 +++-

1. Can you please split this patch in two? One that switches rust to
use upstream clang, another that drops rust-llvm recipe. I'm not sure
we should do the latter, having two patches would allow separate
reviews.
2. There is an upcoming patch from Ross that splits llvm from clang, I
guess this would have to be rebased on it first?

Alex

