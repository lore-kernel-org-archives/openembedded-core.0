Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BD5C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 13:38:44 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.12792.1747316318560868540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 06:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=joQxnYgw;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso4212646d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 06:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747316317; x=1747921117; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OGV25gqVaBE3CRH14kz1znyM2BXMBzeQx1p8JLOvF4U=;
        b=joQxnYgwcJHbomQVPjs9Z6dUj/avoWk9WpBLUTvKRgSNKGa9aY112zhbulryg/LxXF
         GncCJ8gtA11GhFrMpZqNJRLl5TCeKI9YCPn7qO2KHqbSQA1vCxixJAfi8o5kU4Euy+6K
         Azxv3z5sWqxWyNX79Ct0EfUQZsA9QBGRfFn2cjMO+YoML/A3fx0jvhz16Y4emMFGT3K7
         qASM1okPZIIC1DTlaLRapugbeAcb2MwLRhVg99eWUXAbn8HE9QNNsbk4bXXoFLbr0439
         nsGyo3yreEF8Al29x8mJwojjJEEA4T8coK3ddUIVizHTBtiGB90hm9tbRXFpibg53drs
         re/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747316317; x=1747921117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGV25gqVaBE3CRH14kz1znyM2BXMBzeQx1p8JLOvF4U=;
        b=Z9+mUziohzANImU+3QurINQq3w+sFTmNhx9GADLNIki6KyRKFaN0IdTwk3qh2+EWq5
         CIS/fSb2p+U3P5keYGKyL3NZ5aDlavMtTzGyxwPidYbEXcNFfQr0vQIssb9Id0nxoBJt
         ZHibK4VGNnjynDLuRIgj2zMMNwD2ar9upJr87ddQTIfR0e/pi7R5bmZGrz7x0XueJYzs
         fJ3DdRxryEGte3S4a6LeCwbB3aCupcobtG3F/TuEBpJydUCeCseHrCR1YG3jyqrPrjxd
         3UDU0EhXJehYQ4ZFC7qspFj/1TNH7QOhKqh1PHzgFwS78yMaXVzHHwfyo4T8k1a6FBnK
         zCyg==
X-Gm-Message-State: AOJu0Yyiu972nvOES52Ty3rBaNHgC/iy04daolPBC3k2XP2OQGBRItGr
	1QgPbZjgoVoKEDXCee02gj9oCOu3jq5EpoAKVN1SmrfaEoEspx5KHn4Uc5j+LscCclboZZLXzLY
	klJga5fsHEfVxezLFz1G5cUioq5s=
X-Gm-Gg: ASbGncvMH1ZizSrpegn2KIczhbkejsXKql7mACRUmYlEvrn3v+5eC+HNrDnLFwZgs7u
	3icK7CvZWTqEpugYafVeCPmVLvYgupyMtxqq6TSCVy4I5OO3wQt8dAkCSO/b1tdre9MZmNZ3Jhl
	h1dFEu1npvX4bCdZo0iEIaEMYs9y47+SEv1v0uPrG9B7nbl/QgbIn+SeBqf/yi2OIkTQOD5V8Sq
	XS5
X-Google-Smtp-Source: AGHT+IFprWVYLK9fSJy4EB8Nl9Dev9AlM1/lbsQxI7zKWEWbdh9i+KRaL78ViG94UM/Jssn2xTJ+Ngbm7l1oJhSTP2w=
X-Received: by 2002:a05:6214:c6c:b0:6e4:6ee1:a282 with SMTP id
 6a1803df08f44-6f896e0e944mr120601426d6.18.1747316317428; Thu, 15 May 2025
 06:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250515130753.326236-1-luca.fancellu@arm.com>
 <CANNYZj9qTsHiDK-hHgNUN72+i--RamkCNt760Fa3ZjWkEzqSAA@mail.gmail.com> <6C8DA825-0E82-4776-9E56-55B17CF1052A@arm.com>
In-Reply-To: <6C8DA825-0E82-4776-9E56-55B17CF1052A@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 May 2025 15:38:26 +0200
X-Gm-Features: AX0GCFuNAjA63vIleLEjYBfH3n7U6Z7e0K7ab0BQ_KH_uOyLz42BGVOMLpb-OeI
Message-ID: <CANNYZj-71JnUvJb1tAZ34TGQX8RTwGB9ATUVc7-ptf+CemP+XA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 13:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216678

On Thu, 15 May 2025 at 15:36, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
> > Why? Can that be a PACKAGECONFIG?
>
> I used the same approach as lldb, why do you think we should use a different approach?

The request was to explain why this is beneficial, and should be
always enabled. What is the use case specifically in clang?

Alex

