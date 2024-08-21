Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9010C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 08:59:02 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.15625.1724230739374550465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 01:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NNHnCkrb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-371afae614aso2431518f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 01:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724230738; x=1724835538; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+95+i+EwKQpsnngaXN6jyf+2NhxkWgTtwM+cs/JeDZw=;
        b=NNHnCkrboQYKjZddAZ2vPYPage/sQLW1IRNnJnTQ9hpIo1X2FB2Pn2NmxYdc1I+f1k
         0r9jgNsNBO0yiIYb3RY+sIZZbBNbK1tERUHRY5PoTBYyiiwkt+Ut1i07DHI7TD0oNKXO
         3a0mYDfOvbhnZW8oiIqKXzh+YCKsVMtk0IYGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230738; x=1724835538;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+95+i+EwKQpsnngaXN6jyf+2NhxkWgTtwM+cs/JeDZw=;
        b=KGj15Sb/HGFvagBcJ9FnSmRVXzCXcyj7QL8jk9jOeYp2vRwQ4cB3+hzExj2OJvpysw
         gs2uPAQbo7eD4simB4EkTRjjECmn9p8Z174uQn4YXKkj/CPG+/TdaWwDIOpLhg7bpG7l
         Vh5fgsfLu9ZTNDhydY26VCgEte5WYxqs3M3tHcUZy1bR3fbMJi+DRdJ6G5X925eYgAai
         gAQCs5xO6TIpN/F6UMJyWx90zxkP32yTWqrHCIdmvSDGzUQoylkku4NuqnoBYPwLZ0cX
         TJI2exGdOwFKgCkFtjSHiTm8d0a1jZ/Z7Lf/KuFcd4ku1vKR6XioHZvjbtCP5CtcHdfn
         muWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFka/rpmVuY+3VKNpy4du9O9OwkWG9TNcKJF0IGM3jYRRj1Mtm7Q7zlqWQkh0sAreiVNcxF+wtTbT0BzUR0knMXw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzOFWYiHLYEm5d5TcYiaE8djXThbD+lldlrxINX29HulWuDkj2Q
	brMiZRCxtGc/WQDm/SXat9VdqwUnYqbt3qK8+IRga+l/O7cFl+VB2HdAW9HtMVI=
X-Google-Smtp-Source: AGHT+IEJhSEUvpSGIHBOzrg0T4abfYnXRKx0djs7h1ryXab71HNH3JVey9fjefV3cTyM8fmgxUdZ+w==
X-Received: by 2002:a5d:6d8c:0:b0:371:913a:3533 with SMTP id ffacd0b85a97d-372fd5c9ba4mr1172841f8f.22.1724230737578;
        Wed, 21 Aug 2024 01:58:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:91ef:3f82:9d0e:a987? ([2001:8b0:aba:5f3c:91ef:3f82:9d0e:a987])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189849cdbsm15193068f8f.28.2024.08.21.01.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:58:57 -0700 (PDT)
Message-ID: <c1d1e39a3ef77428e273ecaed59ef1406869dd38.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-check: disable the text format by default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rybczynska@gmail.com, openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Date: Wed, 21 Aug 2024 09:58:56 +0100
In-Reply-To: <20240821051721.70558-1-marta.rybczynska@ygreky.com>
References: <20240821051721.70558-1-marta.rybczynska@ygreky.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 08:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203577

On Wed, 2024-08-21 at 07:17 +0200, Marta Rybczynska via lists.openembedded.=
org wrote:
> The cve-check JSON format has been present for a long time now,
> and this is a moment to disable the TEXT output.
>=20
> The JSON format is easier to parse by automatic tools, so users
> should have migrated already.
>=20
> Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
> ---
> =C2=A0meta/classes/cve-check.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index 0d7c8a5835..41f2b8304f 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -61,7 +61,7 @@ CVE_CHECK_REPORT_PATCHED ??=3D "1"
> =C2=A0CVE_CHECK_SHOW_WARNINGS ??=3D "1"
> =C2=A0
> =C2=A0# Provide text output
> -CVE_CHECK_FORMAT_TEXT ??=3D "1"
> +CVE_CHECK_FORMAT_TEXT ??=3D "0"
> =C2=A0
> =C2=A0# Provide JSON output
> =C2=A0CVE_CHECK_FORMAT_JSON ??=3D "1"

I'm wondering if we should remove this at this point? I'd prefer the
build generated machine readable data and then external tools can be
used to create text based reports of that if/as/where needed rather
than complicate the code class code with potentially many different
report formats...

Do we have a tool which can generate a text report from the json?

Cheers,

Richard

