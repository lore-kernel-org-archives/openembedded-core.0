Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101F8C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 08:07:27 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.2174.1745568438635790610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 01:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UCo81MwM;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f2c45ecaffso20602456d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 01:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745568437; x=1746173237; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/CU3wBLWd+RLDHtodkyNH2YiOFEZrELTcOGao1OMh/k=;
        b=UCo81MwMpB5vXG478U7smNOYfJzl42tis4H8eXWUregW75e6UgQtqH7+SQjh1Nsc2Z
         LlFLjA/ZUg4VtNr7ZdAkmekPQ+dEH4eXE9xy8TT+XcWeObPfl9Vu5GH5lN2iQDtVZk6x
         Bu0ewB0XUNZpdeGHUi0FVmdUEfXPUsF5G3WY/rTUQJECS9cP6HwUh3Jbo3vweEiOTP7n
         NSXFR+XymA7YzOqd0xcRt17hTUlbXOct1vFCLdcePJdsX67enGiGfwqHCKwSrWylSLNw
         SCtRh2cu+4beWj62bW7ECY0iV3ad/E5KeBkFlbMw+gmJi2g9zUhANfDhUFFV2zfE436H
         4JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568437; x=1746173237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CU3wBLWd+RLDHtodkyNH2YiOFEZrELTcOGao1OMh/k=;
        b=JhlGq1+bAz2oEAT9BfX42I9FxgPFm3x2qQXs9sBq0brrBHMQbgK65vImGSlTbqvFHN
         h3A4aN2Ds/JrEGFGWwuIEkFTx9A81mfwoOBjrTKSNpMfqHPBPOUYvx18RGlrpFtPLL9k
         Odmq1U48znVtvi6EPER06Guwg6nyZtRnDihNHc5wzHPQY0K3o+TuFdg9V2oUfkTeQXfo
         wMX3y1+vUM6xuU2Gh/wMUgOkoe+B1G/RNOyzcr4BNWjka+E5pz8XNv+COwlhxkWjdETq
         +cSPJMINohwtBUzo3u3XPoLBj2RMIcgRh4zaLMV5NAmRkYbh0bCrS8ggoIdBfpon7i54
         z/3A==
X-Forwarded-Encrypted: i=1; AJvYcCVyMCBh5srIpG4MzV0brJ/dD99XKQL30lmzQutqQ8xfJQxx8YwNiz8L7FCGvomr7jkomfsaJi2MF7eThdZmO+MvDw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyKrtss6Zj0g2SyT7PBoB78f9FtWtWvmO07YekFs4NF6vqo0ic7
	HYcddJ9NjGs6WEK+G4CUO9xZxjWQCiI1fPrdOuj2c8hqqJDUWS3LjpV30dCMVVi1fHQMwo1RN97
	ggh9p2tcwlQ6L4BmsXIey4WqaC2g=
X-Gm-Gg: ASbGncsaw+EoxtUZEb7lnKw9voagGCWyH7sf8jn8VMDZ7n/bSbCLkB/kcwtHbRdrc5r
	JWNfFVkJc/UYIBTqkz+l6yHgZ5iKENw/b9LmMvgWn7mbeW0jdalGlYMfphApI2qdVmb5mMS7sIi
	aC3jODWOIIOQ+Wt+d/3ddhazTDdSjyom8/SpNyslG7RWrpX+Bt84LDMk3y
X-Google-Smtp-Source: AGHT+IH1Y0pMKqr2qFmVJg/u+kCjyC+KBUZfxyd0uvIp8/vj0BJliolVSXNSfpNRIPdXUvsHukMzsCQ3yBLzpgb/Yt4=
X-Received: by 2002:a05:6214:500f:b0:6f2:bcbf:1030 with SMTP id
 6a1803df08f44-6f4cbb590b7mr24988816d6.43.1745568437639; Fri, 25 Apr 2025
 01:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250424150148.1749041-1-ross.burton@arm.com> <AS1PR10MB569732ABE0E8E4E01B69728EFD842@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569732ABE0E8E4E01B69728EFD842@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Apr 2025 10:07:06 +0200
X-Gm-Features: ATxdqUFa25dfyG1LaPWVj0-OSs9mkl7YxpqoHa6QCZ_ocKE9DnjDqMG7086YLik
Message-ID: <CANNYZj-YGcH6PmUH=Eief3ynE88KrOgXNH+v+VqViYkhjONSnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wget: use libpcre2
To: peter.marko@siemens.com
Cc: "ross.burton@arm.com" <ross.burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215439

On Fri, 25 Apr 2025 at 09:15, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:
> Shouldn't the pcre be explicitly disabled via EXTRA_OECONF?
> Without that the configure may try to autodetect / search for it...

Yes. Or there should be a new PACKAGECONFIG pcre2 specifically for
that implementation, replacing pcre in the default enabled set in the
recipe, and pcre definition should stay as it is.

Alex

