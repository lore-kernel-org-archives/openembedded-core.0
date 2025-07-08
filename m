Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9262C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 14:57:54 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.20933.1751986664629308140
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 07:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CO7QERl3;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a44e94f0b0so57033621cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 07:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751986664; x=1752591464; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HZY91mM3PfxhIkeHdFCE93lquiw9UfkYBvd0K9m/69g=;
        b=CO7QERl3XIePmi7FcAWPJ0TXVr2BaSSE4I+JvPuWEDNJxnTVMPphqHpiYZGBoW7Tu/
         b3OKP1AuMQnxVYttiDtiqm8PwlupDNidFVggE+GUxAeHwhiS9JKvWRUG4pStuSSpbkT1
         eQ22ACkz1wEO3QON8nB+2/81235bX+tH9nQSOKR5LtaF17TBP+yr+C2ORBqBwTLnoghq
         afV9nZzIGkfzvIArP3aMaNrbnGnL8BAvrWVUJAFSe9NLRNw7T6VHrD83OpNwiVP2l9Cn
         UXlfcIW/2xdSADHS1X2byMY3pRogYIES2EhfEjp9XYJB66yDzPseKmkgPJraL47b23db
         JjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751986664; x=1752591464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZY91mM3PfxhIkeHdFCE93lquiw9UfkYBvd0K9m/69g=;
        b=nyehCPBt6RRAN2FgMk6BKjBZ8Rgfk7MrZ1VjlEHhCpclZBC9OOLtmNSnEUv82p/wcj
         jrx3hQdc0sKMFrSSPK56S0OlnVrGK8p53j/bOtUMWrotOjWHWaxq0y4VcNp4hrIyXALO
         PMvD0Qa1CSHZ3+5W1j4sx/cJ0P1YakwaAOPgk9VS4GB/jARphEQTQditRyKw27d54yVQ
         Z0NN9ffuXzHIoVsVxHhsbWD/vSaSk1s/VvUI6CPEbkFkDqVSKe1CoEJVwKYSeQVJ/8LK
         oEJKBSVGRB+iPXfGZbpD3yFDRbOY6ZzeGO1f36XHaCxygHjE5cy6ZDj5D/jb4f2roknK
         4gDw==
X-Gm-Message-State: AOJu0YyfuSl5IC9+pC837+okPHg+TatJR0PzkF76YS/TIzvOyrNEMFCt
	CWFcd+KKAX+QHDpGGnAOKmz6aLkXa8/a/QX+N6laFSWJnevyj1yCS3aRuANdz6zFppeT1AVrnoo
	6bvHTWhOeyw0QwyyxodD/Rf2yDaui7kmIr7mi
X-Gm-Gg: ASbGncvsvVBtvkmNFRjVJiB4e9eTNmgP2ZDUInwSUF8ksu7PE+dJ4505W65JtjE7QnW
	UqmYuug8H8yrZc22VXnIfczXNIVKL4mBdND+hSjLMinKWV66s/qcuUnJ5V9cDOzU5F/o09SkPLC
	F/sEejLS9sWKpN+d/YekD8ott2O8TtIk9vecihl0mMYWtN
X-Google-Smtp-Source: AGHT+IH+k0PKYs+m0u1eUhBKRXO+EAmIdmExm0scb8Swp9LSGKhoSLf8DCkIV4tLpJJuDDKu/51Pf0oBux40aFFsqrQ=
X-Received: by 2002:a05:6214:2341:b0:700:c46f:3bd with SMTP id
 6a1803df08f44-7047daddd34mr50493136d6.25.1751986663477; Tue, 08 Jul 2025
 07:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250707085530.614280-1-pascal.weisser.ext@karlstorz.com> <20250707085530.614280-2-pascal.weisser.ext@karlstorz.com>
In-Reply-To: <20250707085530.614280-2-pascal.weisser.ext@karlstorz.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Jul 2025 16:57:35 +0200
X-Gm-Features: Ac12FXwMlKA0ols6JTdED4tCOklJSyhAbAaXIJB9eUoBOdxCzzaBbpBziM8OPyo
Message-ID: <CANNYZj_v9UmJxCRUbVF8tkEEdv1XrQyA7DScbbO=r_5ueZwj+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/1] systemd: add rdepends on libnss-resolve
 to nss-resolve PACKAGECONFIG
To: Pascal.Weisser.ext@karlstorz.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 14:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220047

On Mon, 7 Jul 2025 at 10:55, Weisser, Pascal.ext via
lists.openembedded.org
<Pascal.Weisser.ext=karlstorz.com@lists.openembedded.org> wrote:
> Add a runtime dependency on libnss-resolve to nss-resolve PACKAGECONFIG in
> systemd recipe.

Again, why runtime? What is the mechanism that loads the library?

Alex

