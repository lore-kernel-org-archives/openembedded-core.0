Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE40CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 14:16:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48971.1762784168833838405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 06:16:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cy3UQlkp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47117f92e32so27150995e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 06:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1762784167; x=1763388967; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pmmdt5KWycpDSokFv1DrtX90FBLMj6Na17tPMjHOuJ0=;
        b=Cy3UQlkp8XaQHCUWh9SiF+vU9q6VXFYDxtohx009NZfYASllIQ3tlKX3yuqyX3kmwz
         7vBvhA3qcYd2otInTigtmc09Ws1w1evxv5zfE4vHP+QCEwpOx0cDLUnnfvVlD+Bwoa00
         c+7NRPeydeIGtttzzDpZIRXkzEf0gQWzgpe4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762784167; x=1763388967;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmmdt5KWycpDSokFv1DrtX90FBLMj6Na17tPMjHOuJ0=;
        b=vc2PhMXmBocBMcBXvsM03UH9gdcKza64x3juM6drcPbwQ+AtvzIaiw5nCRrlvIYaHG
         ITWdoNkB68gDfCZ1kRag6VAlEWnechKzoCFjPXsH1hsSSYsZToshkU8+G8h9mGJOsV8H
         o+o6tTvjAPQImgpuMb869doU40ZWhOC000KPlB8cVgCgQAvDHbjMhUkXhZHh6Vf2cXXQ
         6wR9rj3QwfE6pH/6Jx6B9DXJxT1fCuEoNKOHNsRnboq0RN0cRJQsAlJhdYOYbqtUHGV5
         IngKfR8sVel/w2DwFRgWo9oBmq0ZXuN+WeDo3KcZJri4s4SVbz7qUqXKTIxjscl5QE74
         n35Q==
X-Forwarded-Encrypted: i=1; AJvYcCXndPo2KEsNsh2g9+q8PlQjW8+VD2KepH8G2QZ68exZwNbRMSHkuvW0/yn93mciK0UYJeEy0iKYVRGVK1ZyG9ovUQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwohGRALCMr5SVYM4ed0FeRxk7v/z9GxNB9NDFwp8OyPLkoEMiL
	noed2o7Ru6DYECuab6kxlr6j6zFN44/696cvj+ObBA/KvW2xuesRsOChsDTEvaBKCzY=
X-Gm-Gg: ASbGncvio9piC1GnWe02SjH7FtezZsTXNnS6nD6Q7kHQA8hmV724OoprDXZ9N+xJqsT
	WKUonFgFJnnlb7rXViUJARuTFDVEiVvnBuxrqGBPDIzuxr9IBJtXH5FRbQU1rgqMGKbAss4X3Js
	/9BBJuCLms4hggTehgW++T333iYhSPLM+vrQ3glqjCQRgIx+vHI/yGl2F6fLbMLgVjRb/qnvr5l
	cJmY50QjOY6ThIg1jeq+8lLZlbtvxxYLi5gOsv34Zb3q/c9V1gazZGUubMZxn88MQLD6skluKl6
	OqlkJWJjYEnOE6kexgnOL9wxhzvbIUym3lb/t/B7TxIrj0jvneHzLDddcmM7XPcpINCXTlS8qZU
	GvhyGRdtTxXVUC6hOXnHsBY1pvaZZxBWDlaUpdPLxLTBfdAb+3z3XEBMtZFPTlv0QPeQHriMv3j
	ojAA081wgxbwO9O7r/PKIHf69cVyFMHuHDqn/rcYrBTupxzTlQ2/oLn+10QoqJ9T57
X-Google-Smtp-Source: AGHT+IGobhYCV91XhHmUf6KW+AeG7vM3DuE7cqtduINNeajcR9KEoLwrOxs8vTzXK1Qb6EKbiJ9cfA==
X-Received: by 2002:a05:600c:1f1a:b0:477:7f4a:44ae with SMTP id 5b1f17b1804b1-4777f4a492fmr14295275e9.39.1762784167175;
        Mon, 10 Nov 2025 06:16:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ec3b:58b3:3d18:55e2? ([2001:8b0:aba:5f3c:ec3b:58b3:3d18:55e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47764ec7736sm107982415e9.6.2025.11.10.06.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 06:16:06 -0800 (PST)
Message-ID: <1ccdd952a740a2d09774d825cc28bee20ff1525d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp in the
 database itself
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, rybczynska@gmail.com, peter.marko@siemens.com
Date: Mon, 10 Nov 2025 14:16:05 +0000
In-Reply-To: <20251103143157.315178-5-niko.mauno@vaisala.com>
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
	 <20251103143157.315178-5-niko.mauno@vaisala.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 14:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226123

On Mon, 2025-11-03 at 14:31 +0000, Niko Mauno via lists.openembedded.org wr=
ote:
> This should help to avoid problems that will occur if the modification
> time of database file itself is altered e.g. by unassociated
> process(es) on the file system which hosts the database file.
>=20
> Since this change updates the database structure by adding a new table,
> bump the 'minor' version number in database file names to enforce full
> database fetch. This should also iron out e.g. situation where the
> database might have inconspicuously omitted entries due to way in which
> the mtime of database file itself was relied upon.
>=20
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
> =C2=A0meta/classes/cve-check.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0.../recipes-core/meta/cve-update-db-native.bb |=C2=A0 3 +
> =C2=A0meta/recipes-core/meta/cve-update-native.inc=C2=A0 | 59 +++++++++++=
+-------
> =C2=A0.../meta/cve-update-nvd2-native.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +
> =C2=A04 files changed, 46 insertions(+), 21 deletions(-)

I am a bit worried about this since it takes what is a simple mtime
comparison and means that to check the database you now have to lock
and open it which is comparatively expensive.

What kind of "unassociated processes" are updating the mtime?

Cheers,

Richard


