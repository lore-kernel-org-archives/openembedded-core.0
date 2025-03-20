Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDE0C36000
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 09:42:57 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.3460.1742463775722270053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 02:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KufHTgro;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so5004305e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742463774; x=1743068574; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=79NUlRb0+ymHlRq+m6r4xDqFOj2CzhO4naVphgVl1wA=;
        b=KufHTgroCWmCp7cxnN1LnAGA5FHoNg0zE2D8jiwkOOliEQHpDNgmNDWX2zMC2KOdEk
         JEqX6xEQTu8vZLaPwIa6ep4qoaEkpJqN0ib92MI20twI4qt+gMvrglgS992wmvilaNFr
         WFcENO7DdPVRaEvzctfYjG48fqbEa1trZSuro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742463774; x=1743068574;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79NUlRb0+ymHlRq+m6r4xDqFOj2CzhO4naVphgVl1wA=;
        b=T9wU9L44il4wSkdDU3md8foZAiWT2erDTLTXgMuRqVRODZOjlFSNcNulPyHr/YBbSc
         SLJJq4ivExZcv1qLNR64PDroUx1AG+ng7vt9EBHqHNtWg69AwGvn8MtHOZQVLjkSddtM
         d8tCqM0B2kOcp7tMKkY2G6SB+zo1vr/id353d9hWY5gcZgPS013uAoWWf9hkBN4dqvIz
         ZjEGU9bP+E2DbovbYTBd9XgZOjpZruBRS4T17YvQMkzakXsM2O8mWNa/cZiUdzz6MU17
         QX6Vx3PMSksv5/kxJLSKNHW5VMv6d/sBkPbscUgnn9B6/ZzZc841lJBcqoeMvIizWexZ
         6W6g==
X-Forwarded-Encrypted: i=1; AJvYcCWp8IiZ3fcOTgR7b7uS4Mg3+UlMXEJYQBFWC0aVce0M4PZyOnb81lAs3Atzs6L1dYmFn/fu0coN+fPCX+GmjVMRVQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwY5XF+eObStFF4lCLZzMKsxLOzVr4nEHYFZXTxVV7B933XDvZL
	cMvwaOPhBondfEUki7Nrg0EADkAN6i6QARwMQjoLJ1SC1qaLcZt1oOV/B9BBG0A=
X-Gm-Gg: ASbGncvGkZ2JsuV1c+u9iRc+bOoKcIvsDnW4KH9Hd5vsWaOSPDa1UE3GUGXbUKfkY/w
	y1y6S/zb4ZKTLB1xIDtOMbAA2Qti2RkYQjZuONYhfeGzYw/DtuyQolZ4XhAeScrOOjgr/T6tg2K
	J6DYATf/aP12bbBQpCnMcHr+AYBOMJFuR97P6zLFwwAuNnOQQ7wwAZMy6UEEqEICbrp9THHKiyk
	tBv5hJQKb9EGQvZyK+ZKfFqVCqtu4Cn79TaJsMn16wqtzFh85sCXADi5lv8pxiEgDY1DbkiShrO
	BIVVXutCutwcirJCPLgUGyEBSW6pajxBMu2DfTD8LeXX0DtbENbg6eQQjVhFIXcQoyZ4LylizJj
	0PIb+rthMJ3OgEBJSzoWhW/fMMzPMHXNVyCbnMI4M0Ffm
X-Google-Smtp-Source: AGHT+IFQ39mezJvXiL4b7gJkThLaa6COHr0PUnweopTOlNqN1IkPc8mb0lHaVFAFWxMXuGoZbxhMxQ==
X-Received: by 2002:a05:600c:4503:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43d437c3327mr65826685e9.15.1742463773869;
        Thu, 20 Mar 2025 02:42:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ede9:63ed:996d:ca84? ([2001:8b0:aba:5f3c:ede9:63ed:996d:ca84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f556a4sm43174265e9.22.2025.03.20.02.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 02:42:52 -0700 (PDT)
Message-ID: <87a48eb28f555495e48fe2b68001b502f2ff860a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "git: git-replacement-native: depend
 on ca-certificate"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: matthias.schiffer@ew.tq-group.com, 
	openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>, oss@ew.tq-group.com
Date: Thu, 20 Mar 2025 09:42:50 +0000
In-Reply-To: <20250320092959.563213-1-matthias.schiffer@ew.tq-group.com>
References: <20250320092959.563213-1-matthias.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 09:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213377

On Thu, 2025-03-20 at 10:29 +0100, Matthias Schiffer via lists.openembedded=
.org wrote:
> This reverts commit 2e99ffda70fd95b5eab3de47048032349cd66f4b.
>=20
> git-replacement-native is used only to provide a newer version than may
> be installed on the system; apart from that, it should work more or less
> the same. In particular, it is using the host system's /etc/gitconfig;
> it should also use the system CA certificates, otherwise it will break
> HTTPS connections in environments that need local certificates, for
> example for a corporate HTTP proxy.
>=20
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> =C2=A0meta/recipes-devtools/git/git_2.49.0.bb | 3 ---
> =C2=A01 file changed, 3 deletions(-)

This is going to turn into a battle where you and Max both alternate
with revert requests as you're seeing different breakage as far as I
can tell.

The original commit message says:

"""
git is delegating webacces for URLs using TLS to libcurl.
However our native libcurl build does not find a ca-certificate.crt
unless its curl-native work dir still exists and thus git will fail.
If a recipe uses AUTOREV with a git repo using https as its protocol
parsing of that recipe will fail fetching the latest HEAD.

Fix that by depending on ca-certificate and give its location
to libcurl via git's envrironment variable GIT_SSL_CAINFO.
"""

so the question is, does curl-native now use the system certificates?

Cheers,

Richard

