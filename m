Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01407C369C7
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 20:36:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.30082.1744835804655826110
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 13:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UnbTJuT8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so9310295e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 13:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744835803; x=1745440603; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9sSHe9jpnBfpEk3oknuHz7QF13FmqkNieWT5uR6qOQ=;
        b=UnbTJuT809K73+7M39TsSdbhr3AgzTudQwYzG+Rpa5TjFUFYMzjGquYU2neQ7A/BBc
         sL7q1tgooMJSOBZK4oKVOVK/u2w/2M7JDR0N65tWtqK1ATjVG5fAH+gjcieDLHgpgfJp
         EfdQp98PpBZLxVFdiHzcp0Q+wOgitdjMW3qBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744835803; x=1745440603;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9sSHe9jpnBfpEk3oknuHz7QF13FmqkNieWT5uR6qOQ=;
        b=rvC8cnvqhm8H0Bbk5H2wlRl3H+ET1TXlBMaum9+dM7yIS1QFT3Krh1kQ4YhE9u61d/
         gSEhR/zCTzrHwaLvx9GOTlUmgwuyfdFzE8iAuufI9j1IiS3sYQn/0WZyydhOokVglb6i
         BQLPe3j8hVBOS/qJo/F3ijJOecU1QtVc2sUyJUWkC5sDzvGWq357PY2W2Fspnv3g9X5X
         DWm7HtA2gc30zZS8vmlQgZh6Alyhp03IlLJNSxZVmlb60c9yhWGrQWUM9zfYsTouN2OK
         xyQzRysXrnc1c6J+EgSSZVUHy48GwyF5rJSO9BaN+HqZ5bEJi3ofHRmPVmjsVCIF1MEY
         o8Hg==
X-Forwarded-Encrypted: i=1; AJvYcCU4CwL1wyjHHRl0h+4cegwKNfLKmYp3zpuOOFExqLhSK/abSOZu8trDDiJBgDFGtTQ6EzMGCTwmI18VRAefB7tTnw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyYFHfM7Goaxi/WrBGzeobnnduDJn0hMMKu/dY/brzHtXreD+yT
	dY3XjIrjS3pTRdbgVCLiETJ5yRWBPGRCQ1E0MAgjfh5zlOPBB+Ofron0eMtGnBM=
X-Gm-Gg: ASbGncu5zc7f3xOx1ae0c5oaa7OCFirvR/WFl/n3NWaowJ5V4qe3p8XrvK9rtpPSYx+
	O//3yzwHfcpcWGjrbxGIJHZF+24/Lqba9+EUTR56pXW4p7eTwdiv4yfJvIFu3isMFrOMS2lxEqn
	Tf5qDiUgKE5roXEINARc3aIYHVoZhOhHImGyeVr0ICmXPNTSfZ2uop1O/Zq4Xzn/N3sUi4dowsH
	Q9UO7IzsQkecB/GVy6j3diLcjHhSklp534M22BDQsFblfVRJp1awzDLEICICfFAg+zBgdqvLbxt
	oza9cq5PwErslNOZxIs0f+B4HDXiENDRoDPdcBK6jhYQlfVE3mE6vTIfTs0pB93jE0h2k6lUz9R
	ru2Hoce0ynK6lHVa+y9jBkFAjBdcvkQ==
X-Google-Smtp-Source: AGHT+IFC012vSTbUGVHtg8hWk+q/6L3K4kkm83MTmN6Y/ZceM9wn+lf5l3ImyT8n4soI6mo0np1fLw==
X-Received: by 2002:a7b:ce0c:0:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-4406354af55mr1870245e9.14.1744835802633;
        Wed, 16 Apr 2025 13:36:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3e1:10a8:f859:c922? ([2001:8b0:aba:5f3c:e3e1:10a8:f859:c922])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b58cc4csm31423295e9.25.2025.04.16.13.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:36:40 -0700 (PDT)
Message-ID: <715076f7bdef1a7fe98103edcb4c908f1ef2617b.camel@linuxfoundation.org>
Subject: Re: [OE-core][scarthgap 1/6] openssh: Fix for CVE-2025-32728
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
Date: Wed, 16 Apr 2025 21:36:39 +0100
In-Reply-To: <59850fba21c60ac9731e293bd21f90c6ae0391f8.1744834364.git.steve@sakoman.com>
References: <cover.1744834364.git.steve@sakoman.com>
	 <59850fba21c60ac9731e293bd21f90c6ae0391f8.1744834364.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215016

On Wed, 2025-04-16 at 13:14 -0700, Steve Sakoman via lists.openembedded.org=
 wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>=20
> Upstream-Status: Backport
> [https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1=
dfb6b628a9d1460f367]
>=20
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
> =C2=A0.../openssh/openssh/CVE-2025-32728.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 44 +++++++++++++++++++
> =C2=A0.../openssh/openssh_9.6p1.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A02 files changed, 45 insertions(+)
> =C2=A0create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-20=
25-32728.patch

Not fixed on master yet :(

Cheers,

Richard

