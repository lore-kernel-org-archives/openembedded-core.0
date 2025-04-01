Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3E0C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 18:29:34 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.1068.1743532165390735939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 11:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UnOYHE77;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso60676986d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 11:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743532164; x=1744136964; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PrVH+uXJAp7dyiUz29G2OzMi/e23CsyYY08/BsZXWGA=;
        b=UnOYHE774l2ut0SkbHdl93O0gmvXVObXQc5Jtvds8r43HFhaScvjWEX1/a699U7czK
         IVeruj0iHuICPMIiLXWP+XvoZpeK9rCcQf5loyrQ4HchyzNyfxQx9Nn667EAXuUxEgjx
         00LI2dIhK3VVo7QsoaZ8BtWKfk0YXpcpTx7FqNJV1TNiDhbP2QMYvF9dkr8Ld2CrB0bu
         uKQa2ovjKUbnJeMvBL3KP/GejNboBiKMBsD5Ou76T6twNii70fiHE5Oj7FQ+9wv8OzY1
         rD1u92HSYqI8YWlAGAJEpej+aYWxyQOEWs15tpbMnCtDOR5Eea8sqLSDLb7uojF6mkUT
         KoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743532164; x=1744136964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrVH+uXJAp7dyiUz29G2OzMi/e23CsyYY08/BsZXWGA=;
        b=mBtRenxEB2wKc/773kptN1NVeSRKCPpS+wCv0U83veoLQNLOyMx2AzDc4L6CRgq7di
         gaMElgdy5Q07D5liKe9uXdbuGaJiIYc7b6zarLlo9X/wTrBxFiHvE2dNjS9CVfQqqJ6f
         2+QZb3RVNvSqjmoU5LtN29o/sFc+Yg7136ibq6QEVx26oSy90Se0IrF79DuNlbXzwrcr
         Nv+Jg6J7pzkNrCQ3/XnQ4AbEHa8ODknHtX/plDr1dV2n8kMzmzIDRaOE8eYNEj9w+pu+
         5/MD9Z0aVMdETjbQLX4+DgWerqc0eT8/GK+S97x9WzFu/ux5abQfF8FQ/FlDpzeBvCPc
         AShw==
X-Forwarded-Encrypted: i=1; AJvYcCUPt8kj2XnBBBuacji2x+pnX44G4DCJ0JQ1sOoFdkKlkgvxx8DUQ2wdgvIzsHt8qmEQY7q5ZfsiH/bvaJswBk+FLA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwapYreagrlCWn+b40o/0//J+8pjtsDaAg/tOTfljpFK4dsdqLZ
	X+7WazfUBaxNe/rZ0rSHzac2NCqpdq9B0gAfmkeczF9UHJIDrYlKRy3FhASQtvwxO4+3SVebqWW
	CQONke7VN7PxUUOT0T0tzUuHlbbs=
X-Gm-Gg: ASbGnctJ7P7fWF5WgYWhlRLoYHS/97I2tcEsiBbSUpi0RPSyOXQT6woF16qmHCnnlg2
	S2cdaT76IEl5U9GZV9HKdO9PT+zauO8Q078MnwIR2/8jwVIZRx1+ym3qOrLKMw11EsFODFuSgND
	Cv8WJxeNEeOQdOJ4WVPFnSMLvn/yyR/ZOhZr9PSKVgrOAeuynegdH2SnhkAy/8
X-Google-Smtp-Source: AGHT+IGIQCqt5Yah+ca3iVjyTSX1vaGLivsuZyEBsV07c6WMAFdTqPQaddWTjiUHtAHFjooE74w0rIoIo4zEBlqx390=
X-Received: by 2002:a05:6214:5016:b0:6eb:2fd4:30a7 with SMTP id
 6a1803df08f44-6eed61ff1f9mr168368776d6.33.1743532164465; Tue, 01 Apr 2025
 11:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250327141258.2690906-1-adriaan.schmidt@siemens.com>
 <607113C9-1438-4B7C-8B23-FA8911BEC331@arm.com> <AS4PR10MB53181EC3B1B610B1DA880120EDA12@AS4PR10MB5318.EURPRD10.PROD.OUTLOOK.COM>
 <FCB285E1-1F26-45E0-B365-4463FC94DCE6@arm.com> <AS4PR10MB53185F705DF9DEE6D54304E9EDAC2@AS4PR10MB5318.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS4PR10MB53185F705DF9DEE6D54304E9EDAC2@AS4PR10MB5318.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Apr 2025 20:29:13 +0200
X-Gm-Features: AQ5f1JoxjKlucpYXmfOeQTDfryO7tbOiwnOMm75CMBKUBHQ09r6fPIcLIxpr4NI
Message-ID: <CANNYZj9BbWkFminKmz3Fag7p_fD+mG07yHDVET5681q40hwrnw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] libunwind: update 1.6.2 -> 1.8.1
To: adriaan.schmidt@siemens.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 18:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214144

On Tue, 1 Apr 2025 at 20:26, Adriaan Schmidt via
lists.openembedded.org
<adriaan.schmidt=siemens.com@lists.openembedded.org> wrote:
> This looks pretty up-to-date.
> The mips-byte-order.patch (set to apply=0 in your branch) is still needed, and has not yet been merged upstream.
> With that I was able to successfully "bitbake libunwind" for the x86, arm, mips, and ppc qemu machines, both 32 and 64bit, with and without TOOLCHAIN=clang, and with and without TCLIBC=musl.
>
> Do you remember if you had any specific issues when you worked on this last year?

I guess we should put this on the autobuilder and see what comes up?

Alex

