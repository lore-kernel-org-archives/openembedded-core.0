Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AC6CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 11:50:49 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9737.1778154643091804781
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 04:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OdI7gNOJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8acb3dab8dfso4285106d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 04:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778154642; cv=none;
        d=google.com; s=arc-20240605;
        b=KOwfP1MhEzYxrewAeNgxOVUyrNRvqreYzXIEja2xDwv2p0PsmqAk2cHMKH+MlSkK42
         9/8cEi8WctVokjq9+rhW0oPqoYW8+fbkG++0/Ybq4I+KxtRy8Qnfdm9IxhPgt9rfr7xX
         0cGJAjx36g5mhn7r53wwHcGMRV8+P/WbY7CRKpLnIyNUaLZ+eWyNoHicwJkfjAtVZjMT
         alGL04bQVnkJ6wjhxCSAW7aWuMKrIh1PW1jLtF3GGFx2bTh9u1W6YuzMho/N+ee3y+ak
         F3T/FJ6zK0SUth9HHV7GCqtlZNM+GgAh1kA2VINP8vtwbH3qa9gh/plxT/odurB426iz
         llzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DYUvX8y0vVSmkkXd4jyqTzOGV4M9ykTEXAAiZG/QDAY=;
        fh=7uRbJ90YJ/5HcFJL7sKXwm/j+5erf9dcZ5dTHpuzEE4=;
        b=h/vxs8DN7oyMwJI7qmp6XmdQOYofeXSFVSdu5S3qrgs8bkyLGk+HyH6SEvVqwrWVa6
         iyr7OqMOzixWkRQIwi0QunTG9DL9v2Fp7Fal1F7R4Ga0nFywAxnnNcfAEOwZmdPr8tAF
         SZPfo9E5o7Te1dxO17S63kiMR4T3df8l0OU28rSZGHYaFk9hIsFWuoZCEuiO+CVkh9hR
         NKQPCYth7X4yhmipNSXmj0fXL6Bi6gNS6Ge/BTZc7/ncb1BsHPfWwbAx8dBognovoLMs
         A+0/VKAxZJeFm8NxARM8Mwl39cw5wHx7tqdajIFve5VThNIMlDFecFbhq5aGR48ujB2J
         /I2g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778154642; x=1778759442; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DYUvX8y0vVSmkkXd4jyqTzOGV4M9ykTEXAAiZG/QDAY=;
        b=OdI7gNOJB95Ez5pnRYfhEKmIwNKn/8ltolazt/PB/pyEVvdDxv6i+5pQdygTmlVdFN
         lEXeeEvogMs7h/pFwdb6mY7zbISwHH/l1OFy7PXztlXk2qcTZYkpAYI9jCDjjBex+fO2
         ZJ9tEve213pmgNR0eUoayEwWtPh0tdLwI+J+gRRWXaMDaT3rBq+xnXDika7FTBfjQjvW
         rh/WtejiZHIc0ZWBkM9bHWX7jhoWcmY8zbq0wnohJOo0TGW6Mw6QDOu72qcEdt2p2qgM
         hgQpialj/HDpBawlFNGw2tzq3EDPczn+MvCNvXo4+9C0AthmYnmH0/xcuc7PMU5OgVaL
         XAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778154642; x=1778759442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYUvX8y0vVSmkkXd4jyqTzOGV4M9ykTEXAAiZG/QDAY=;
        b=met9gpMgXEP9MFlgdslJX0KpNAg7qp00ICrUw86Q6s8rG39ZBhxzVaMKt7mFK2XJwR
         hDiZ+Ofb0IeHpT78dP3lUJNUHd6iMexqvnUGq9K31smIPUzGasIrZREmtxy2B2c/+Kw1
         9b6yijuSX+jaOkZoZ0hXOyw9jgcuOK255ZUQ2Yqsh7r5bbirukPMyZzwt1Fdb9O9fIPM
         pmYK0RKEbo/NO9eDW2qsSEedZHZrEWqU02/NS+2mJ5WqRf1XqX4fxlO+dBBL87WsSp6D
         J1jjwiO7TrKaUqlEfHXXMF7lNGqjrdXGz3jBEP/qA4SMPzMZ4uWH8IEXVnANowlXIfAS
         Z7+A==
X-Forwarded-Encrypted: i=1; AFNElJ9ZjPMwwHi6LdafqAxEEOvSZT5dENEliQ//JVMheAGdJFKvW6ETahfPn+cvlV9dYMTIRqLqndKrZsJU0wKRisnlhw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yws08xnSx2sMBGezrMGfK7p5SGmFXkN2Pogwsp8ut3iYurdAayQ
	ASyPE7eTBefoo+5GKfvaW3KVyWRJuxM+dQWFzUGvXtOx6/u4iVDDrZscRz9+YMT7yu9803VAj5N
	a+ZDXfdZxUpVk4JM2ceaj6Rbyy/hNncU=
X-Gm-Gg: AeBDietPRWxVQX27OKrIqEBUx7Krmt6hRjAeRa8a2Vcpij23kIvGFOkYLPY+8ut2TWw
	leGSFhAaysCD7kgnr9Zpc9+a9FA8d9MkuyvW8r+PeYmykbBOVnJX/5mouoJbm/l9ffd4k0/66eY
	3b/JEAkNSuHYzV//7FhiCAsO6s2h9qist13csrSeLHNLjHudtYWyz+1EjNdTpRFkwFNlX2BMkmJ
	MKB6GhyG8FfXJ7ZoKp3c4KzJTcXJWkdGe0XNNXFmEDtK1r7RnCJ0fL725fA5zhp4bjA06h3N6g5
	jhITAr2+4hBPDNCNgeOIZgWQmvv57n3CXGPCSDjz5FMilaAMpQwgIU1SRRw5EV4=
X-Received: by 2002:a05:6214:767:b0:8ac:a6f7:8a72 with SMTP id
 6a1803df08f44-8bc4600fee2mr113729906d6.43.1778154642057; Thu, 07 May 2026
 04:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <DM4PR11MB61899D3F758D2B3C7BAA9361C444A@DM4PR11MB6189.namprd11.prod.outlook.com>
 <eb249cdc0bfb57d3e0ef4cb20dafffe7896c408b.camel@linuxfoundation.org> <DM4PR11MB6189C2259D0CAC50D124C689C43C2@DM4PR11MB6189.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6189C2259D0CAC50D124C689C43C2@DM4PR11MB6189.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 May 2026 13:50:30 +0200
X-Gm-Features: AVHnY4IWfAfx5ALq3A93n8ztTZ9cg9LKktxZ_JIRsozCwjFjCaLtdaZYOb2DJfI
Message-ID: <CANNYZj9CbmTZ7uEVd3AAT8x2jn1T0SQiO=SjE5fr15F+V_=bxw@mail.gmail.com>
Subject: Re: [OE-core] Inquiry Regarding Package Upgrade Approach vs. Manual
 CVE Fixes in LTS Releases
To: deeratho@cisco.com
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Viral Chavda (vchavda)" <vchavda@cisco.com>, Yoann Congal <yoann.congal@smile.fr>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 11:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236583

On Thu, 7 May 2026 at 13:40, Deepak Rathore via lists.openembedded.org
<deeratho=cisco.com@lists.openembedded.org> wrote:
> You mentioned that runltp has been removed upstream; however, I see it is still included in the Wrynose release. Is there a plan for its complete removal from Wrynose?

What I see is that wrynose has already been switched to use kirk and
does not use runtlp. Can you provide links to where you still see
runltp inclusion?

> Is there any plan to support kirk in the Scarthgap LTS release?

No. Such changes aren't eligible for LTS backports.

Alex

