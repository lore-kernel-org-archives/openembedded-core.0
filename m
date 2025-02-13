Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3DCC0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 09:57:20 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.7601.1739440633290076760
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:57:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XvMIt1AH;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e65a00556aso6148486d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 01:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739440632; x=1740045432; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0fVCrV5FFdxdok8aaQSegNUPwguafdJf2R6TbJA35uM=;
        b=XvMIt1AHl1vScPr6KUMz/kvNUsp72XSosdVTnuqAywKBS+3j7lfU4erUu9YEvrnjoL
         UtpSSk3e8A6F03PR1EvPIK5UcT23vLzBHqE3Lls4Ib9CluaoaYpPJreIcSLRCBFj9xT1
         HmEcDX6EOGmvQJkexkC3G15Qrw79ZPN30bwKv8vS5yjkpSc6DbovaPq2XjpuHL4mym+Z
         DrmRy0peR7mE4M9PUe2bqmtTlFzUTL4XCGXdwz5ZglttUtxSgo6vH/6Icj4a2Sd38Uvi
         bSJQFPhBU1qL5lkd+03qsnyJ26jtJGarqpYFN0huwrDWXRz4b1hbY7sa6xs7M5ndd0io
         tDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739440632; x=1740045432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0fVCrV5FFdxdok8aaQSegNUPwguafdJf2R6TbJA35uM=;
        b=wsCY/wkbSpZNywiGm/sr/UT+46Ci5DYoYeMZ95cOjrmAUeu15KdRpyDPoKkHqJEU3D
         QIA22/SkqZR8UGTpCxCC/1CAoOIKaGnNQRBH9u93B2c7u7tOd8iHwpDkGSvCe2TcJkIL
         +rinaHjSSzDcOuDiSMMzok3WZcelZ2Z4wWLmNuEmjy45ma2qiQDuhoNutzUcBf61MksS
         HRTG8yd/CZTgGv36fUwgvuecNHlaD5xfMV2RY/uAXUe2rowcNoSEJab5hjc+hy67Zt0W
         CPh8SN0WdkNuo4/lEd17fpQ4iLCKBPnTLt5Lh1aRfT8x0d2nAYszluq9kb59RYU1kbU8
         sluQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrhH5FjNF8bOBhGFeOGCBBZ09DQqqq7PuNawABkzvNGwdIQB+MLdbwhK7EiB4YKP5xIxYYwQkyvsTkA3sKLf7Oxg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyyZgqBG85glfYs9hyCQH6UbfSY1cC8pjOiHBdZccEFdMVvX8Ar
	uI1k8gE9miFPidwn/FfH9BuHS/IdXpzD7ZIaiPp4phJu97azomdRqfPPYGGNcc5OqOhlCImKIZF
	w6xZrAfmUZ/RzMiJpcmVHa17E9O0xJA==
X-Gm-Gg: ASbGnctBAgadZ2+isQVZv/aAKaMNgwZdr8daIMuTdqXQ8SNDbDYj8I24hK7emsLEwOl
	Tg8XfNDha2Jm32oiSTH8BXSImVEZgwF9Xt7YWoUov3xddUoreDSXsrOYI2OkgyWz84UjLiYQzPF
	OZ1Qz6KWeyI6qADLUYMTD4vxZQ3hON+1Q=
X-Google-Smtp-Source: AGHT+IHxKCX9sSbKkUAn8Y4OFSy9hx5dnyVmmu5J05YBJoxJLi6j+MvCVN8Z3W3pZCgvFzvWxq7SsbgdRQQncATSpJk=
X-Received: by 2002:a05:6214:f03:b0:6e4:4331:aae4 with SMTP id
 6a1803df08f44-6e65bf0cde5mr46984666d6.1.1739440632328; Thu, 13 Feb 2025
 01:57:12 -0800 (PST)
MIME-Version: 1.0
References: <20250206144907.1924993-1-oobitots@cisco.com> <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
 <PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8rSuhpT6eoWA5eudSkKZFkqcfcSWgL6YogcX1f1qjLFQ@mail.gmail.com>
 <PH0PR11MB49027CBF82294C3F722688C0D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj_BoKLY1dgiAW72Tuc+EF6BFCSfKozN2X8ibdCGqbgifw@mail.gmail.com>
 <DB5PR02MB102130601D165773C901753C1EFF22@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <PH0PR11MB4902EB32CF27A37CD32A2938D7FD2@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8kdZ1Stvu-OqakXhShp4easJXsYbaW0hg=T-ALGQj6zA@mail.gmail.com>
 <SA2PR11MB49064A61A32F35C2E519AA36D7FC2@SA2PR11MB4906.namprd11.prod.outlook.com>
 <CANNYZj8khhZ0EEeJ7W=epDWNKC6tTHPfd7Xk__G1M6T=ij6oOQ@mail.gmail.com>
 <PH0PR11MB49026C46CD70272E73A7C688D7FC2@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj-nec7b3k8GjrJTvuhfhZaJy3t3QZPcoT-ybfDVd+cMxA@mail.gmail.com> <PH0PR11MB49023C8B3C8FCDD4532DC0ECD7FF2@PH0PR11MB4902.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB49023C8B3C8FCDD4532DC0ECD7FF2@PH0PR11MB4902.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2025 10:57:01 +0100
X-Gm-Features: AWEUYZkQ0qsvhCkrfru1O1oDULKHERmQnDlt198tfDSqvsIdpAm6hIc409PtaWw
Message-ID: <CANNYZj8K2jQO3bZes+wjKDxXbO-OVzM626ibT6PKrS-0ZdDXCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate subpackage
To: "Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)" <oobitots@cisco.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Ruslan Bilovol (rbilovol)" <rbilovol@cisco.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 09:57:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211314

On Thu, 13 Feb 2025 at 08:00, Oleksiy Obitotskyy -X (oobitots -
GLOBALLOGIC INC at Cisco) <oobitots@cisco.com> wrote:
>
> > Is it trying to save space on target device, or trying to save space
> > on the build host? You really do need to describe your process in more
> > detail.
>
> It's attempt to save space on build host.

I wonder if you can special-case this in your scripts, e.g. remove the
bulk of systemd, except systemctl and libsystemd-shared, after the
'sysroot' has been made?

Alex

