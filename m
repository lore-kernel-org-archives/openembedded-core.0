Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FFEC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 15:36:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.10827.1742484995981078426
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 08:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NVoPkdAf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-399737f4fa4so540209f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 08:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742484994; x=1743089794; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwAlV4xvX3b+oF4sCBLWp3bS7l6TIEuifiM1A+hQ3Cw=;
        b=NVoPkdAfnZf+GKNFUNw1exFae2g/3UDztVlxiX7n2gkpmqZG56QUWoYRF0maDTwYRZ
         C20BZiY8eCFzIk4QExvYBAtmZAU2KgvFSPkHMjtPSXGq6cdsTkpCKRwoR6GnJWhfS6xy
         Did3jUOx8L/L0PNwzD6w3iF9v91ec/+pC4NTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484994; x=1743089794;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FwAlV4xvX3b+oF4sCBLWp3bS7l6TIEuifiM1A+hQ3Cw=;
        b=RsRKZ26iy47r8XkbRjjDGxelZRYpAo1n2rQBu4wpJzSKMdbsTEYTsx1lj8j9EyuFE+
         Sa2QHCKAXkxcc4ojSG0d8a0RFth4QNo91LOR5pOPkDLpoHRNDMDapR01+ORppjEamyMA
         3eQnn8JWYJ8cM4uf1fRRWdkDRNSXGULHQ5sBJo9GVlfJa5crmp5lu7VuGT66S9VKhJsC
         oVdX7JBqYWBHyOdDjXFzvrBKxmkqdUo/PIKnsA3gZCMJuojsBN5t/z2h6x9yAk8wAkMS
         g8HeUbcw4NWj2gsJ87meBI4K2phPxe+v8nI6zMyaRfL43ThB9/LiAm0GJoMmRPDts9rD
         L4nQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6tneI09nF0neIVGtnbA3/mOj73iHLllb9a8/SX+gnDfxDlOL7dsvpLqUU3/dmRHFwbrWZat8G2v1zrUvb2GGzgQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy3uBvMCROq0kde8DZDPjUsMMO6DYYQzHhW828f1aWmusP75/pA
	qYdWpJxcmkAXfLPSh0PENTN2WMK4ogYyKYb3TaaR6auJyEHUWP4m+3Lw3VDxqDo=
X-Gm-Gg: ASbGnct5A9nE7POKI6Y9mSdXWc7wPHxHmgZgcRTqzSzghlniAYaAkKgfMY3a9Tq8+NB
	JdjeQCywgF7tpFJi6mfcXxnqpOFvbIJ7NjOYXLXMcZveLW+VMeOQfP8KsNWNmK7KQpmfx37yVWM
	JO3UHYyfTmLiUIdTlIV0IyOn4z22ZcSFmIsFd8yVObmFlyq2xFuKmg6vrL27+vpsbFsC5CYK023
	TXliyoWoIQgVqrFbbGZs66q5YNj1m4LGAVgE8NgvY4ZvDC9a5zRpUzWrsLJobRM7kA5+MuvuwPZ
	tx8/dPqfS1D7GKCl3Zmlta3LIiGFUYK9cvE1QsdXOE5JFY5An9Ekd+nmfSnbD0Kbjgos6oWbLcv
	Sxr/FYV6c6D4oe1JqMPcQzAWuYjSWArnQ8w==
X-Google-Smtp-Source: AGHT+IFuyBbhD0ljTzjJCghmsbUNHkAnoMicrXTXoDnCKCtiOUfE1a7j0l0GVN4Rx7YxVpkwAJO5kg==
X-Received: by 2002:a5d:6da6:0:b0:38f:39e5:6b5d with SMTP id ffacd0b85a97d-399795dfe36mr3864154f8f.44.1742484994110;
        Thu, 20 Mar 2025 08:36:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ede9:63ed:996d:ca84? ([2001:8b0:aba:5f3c:ede9:63ed:996d:ca84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c255bsm23650336f8f.23.2025.03.20.08.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:36:33 -0700 (PDT)
Message-ID: <d727b0982977c96cfdef97ef4d11ea006abfd72a.camel@linuxfoundation.org>
Subject: Re: [OE-core][scarthgap][PATCH] expat: patch CVE-2024-8176
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Mar 2025 15:36:32 +0000
In-Reply-To: <AS1PR10MB5697243DCA6D38EC18E2D42BFDD82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250317213335.1865158-1-peter.marko@siemens.com>
	 <AS1PR10MB5697243DCA6D38EC18E2D42BFDD82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 15:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213408

On Thu, 2025-03-20 at 15:28 +0000, Peter Marko via
lists.openembedded.org wrote:
> Please drop this patch for now.
> The CVE fix causes a regression, see
> https://github.com/libexpat/libexpat/issues/980
> I'll submit a new patch when the regression is fixed.
>=20
> Expat 2.7.0 was already merged in master.
> I think we can live with it and hope for a quick fix.
> I'll be observing the regression discussions.
>=20

The expat maintainer did comment privately that this a complex fix and
not well suited to backporting. We may want to consider a version bump
for expat for this, once the issues are resolved.

Cheers,

Richard

