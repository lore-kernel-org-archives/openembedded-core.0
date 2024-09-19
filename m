Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC81CF396A
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 20:21:34 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.3124.1726777285366847373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 13:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a91N14RJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-374cacf18b1so815052f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 13:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726777284; x=1727382084; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUbNRbfyHNIuLDzgKlh/mMdaomgbApg9ieH8l5wGzdM=;
        b=a91N14RJMilebQss3fV6oZn0YjPst04mfTt8bV0UDgAeEe1B1Dn4dCApdaXL9SCj2c
         C5ubk8qkL6zkmAnGz9Lm7W4HqCtr6s8cQ85Z4K04Ph2SOsnOLfHG8DqhBl9CHXck8NPf
         76bJ2iAxR67/DE0EwejurgSAf/7DirF4Wu4F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726777284; x=1727382084;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wUbNRbfyHNIuLDzgKlh/mMdaomgbApg9ieH8l5wGzdM=;
        b=vTbMsaINw+Vv8c1zLePtg2TscGEsybgUqB+aYM12dBoOoAQFEW6W7HiEkRwFkSZeFu
         qCLZ2EBT5ZDOrqDER4w4CTv/Ss/G2IOqY7r41SIHkiaC2rS1PilG5Ld5P3f6yRdsGb70
         fI73GZ+OTDnTrGGFpcFfawst1S9NkDMFXD4uEJUNufMEOuCqu6oiJ7lEXxql1QuI3u2n
         xIN1RuMMvLdf9WxoqCW8Ugg+IMEWWYpQ7we+dIYGpjct0mRDeOE12ZBhxiybgzIVW40O
         Ub5oU3H1x1kRI+naMybtaEdZQiCjl1THDNCxzh0AzpPK61qsGObY8vs6aA51Gx33gaXc
         uKag==
X-Forwarded-Encrypted: i=1; AJvYcCUBBIN5CBJ2AzAhe5g7WO10n0VQf0tqli4hiFySuyZaHCLZPq91dh9KBRcXO5TfNbJOOnbuwCOWF77P02dGpkdOzQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwDO4zZsXfHSSTyhGYEPQaSPZ/rdmzaWsyOzZa/wmOHKczL+V4p
	Gx5+poF2i1/YhsijqSLtTidOqVCALCi3kAsi9eED8BBI3zlEYSlkJih3rI1Ne+8=
X-Google-Smtp-Source: AGHT+IF5fKhpRRqM9iceuba/rb85Y5WCqlsxRBVaMEybYI5brttopjM7vJULSJkKQoKDb7BVp/FIRg==
X-Received: by 2002:adf:f3c1:0:b0:378:e8cd:71fa with SMTP id ffacd0b85a97d-37a4319e036mr122702f8f.39.1726777283742;
        Thu, 19 Sep 2024 13:21:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3dff:6e76:1854:48ea? ([2001:8b0:aba:5f3c:3dff:6e76:1854:48ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e78002a4sm16164447f8f.78.2024.09.19.13.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 13:21:22 -0700 (PDT)
Message-ID: <1e6aa2178bf8588a28634c11fb311fe5afd28352.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-check: add field "modified" to JSON report
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quent_55@hotmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2024 21:21:21 +0100
In-Reply-To: <AS4P195MB1645496BED047F45D6B9247FEB632@AS4P195MB1645.EURP195.PROD.OUTLOOK.COM>
References: 
	<AS4P195MB1645496BED047F45D6B9247FEB632@AS4P195MB1645.EURP195.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 20:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204710

On Thu, 2024-09-19 at 15:40 +0200, Katawann via lists.openembedded.org
wrote:
> cve-check: add field "modified" to JSON report
>=20
> Signed-off-by: Katawann <quent_55@hotmail.com>
> ---
> =C2=A0meta/classes/cve-check.bbclass | 1 +
> =C2=A01 file changed, 1 insertion(+)

Duplicating the shortlog isn't a great way to avoid the patchtest
email. You had some good text in your 0/1 cover letter. I'd suggest
putting that ("Added the "modified" field to the JSON export in the
cve-check.class. This field captures the last modification date of each
CVE, providing more detailed information on changes and updates within
the exported data.") into the main commit message instead.

Cheers,

Richard

