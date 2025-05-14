Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623C5C3ABC5
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 06:46:08 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.95870.1747205161052500214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 23:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WT06IY14;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a1fb17a9beso2932104f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 23:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747205159; x=1747809959; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKAnGnFEz+CdI0usOXWFPzU7OhKZr0g2YC0KcjQ9adg=;
        b=WT06IY14NfxoY1uRlYsDph+ucvIxd9TD9IgYV9e95W1KY6E64JMR//OEowXgjim0Yu
         BkDEALZWxoYY03dFcCyWASjxg/5H654w1GGueMJm1kzRYBg5kYOGqmkdgQMV3oVDB7TR
         mZS9MsicBuNzicgXN0Belt1wMz9+rgiCplIF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205159; x=1747809959;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vKAnGnFEz+CdI0usOXWFPzU7OhKZr0g2YC0KcjQ9adg=;
        b=ruVB/I/485Vxl8NZ19taNkM5M/EXdTdEaB4IbEynMgJ+Z3ZheF2jyVD2i1mmJMLCsw
         E+Bvq5XmHNbmfD43Rg9gEO4dzt1p3N9iLHpskiOASUt46BNkcM6Q6oPK/I6RgkloiMPC
         3/PLthkjfJ8+al5I4BIfbrc1/tdvA/l8jr899wXSB6k78vS/8Q2OAhniTUpapOZ2gkEt
         7D9kNuMo7scD8kn6i02ZLRQHe6cK03mXtI2AML/YUoPznsLk9JCnHVJpBu1vEi4+E7sv
         Zkq98VnuJWjYiNevZQAYtVHU7gry5ud9WV1MPUjL4ec2NUYfrcLNyfCdBLIdCruFBGbA
         KGzA==
X-Forwarded-Encrypted: i=1; AJvYcCVh1gyn6CAvwhxtEVDA1DktHIFVyvGy16yxs6Fp1bTneGIQWM1+Tss54iNEuuedez/KDTR0oTVv8syPeuikS79FMQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwltjoLjVdc79ALl1IUtfYDycZFdnPLfBNNy6+N9h8LN0KVFhPw
	gVchD/jtPXuWIae/WuTe8RLj5nHY42RIJXjwSOXhgC2HflfSPHzigNSTdW8tt1k=
X-Gm-Gg: ASbGncvU1KAZ/Bglz6u4vPIddvtS4LXLapxKXDGQuCelDWld6iJnaKcVetPTUmgj4lc
	vO4Zvp7IE5aYJdV52+3DE2ArVCihDMSHVKGXxEQGDx/CIadcvPJv11rl6cHG89QBv7Qi16E77Xr
	tlva2FS1hT9F1AH4oaifWv6h5RY/GyQqGwRhg71eD0Gx9sr4q4a++priafvqMYSoU/gNcn3zgc/
	D0sfk+m/rkxQ1llUZDekyXEN5ExweCswnUITh1ZpwHCsBXgoNIFKqwLBO5drRhqTBnLFTV/DLaE
	yv8aX6sCslNYXtp8rEwNIRPYnR4dhUhJHxg2FEhRmuVDpMsv5gGwjS5c1ajTMyKyvldfFNeOPt+
	t2RwCJyHGX6YsIUYcGz/Lgy1N0GSUq+f0Eta10zjK1C3FJOAdzlk=
X-Google-Smtp-Source: AGHT+IEcntbu5osJYlLQN3+iX7fK3ffglqJdmD3UBGUfUCz3jrfeYZy/1yJ9FcguRvjjP4gOZrxE6w==
X-Received: by 2002:a5d:584b:0:b0:3a0:af63:c35d with SMTP id ffacd0b85a97d-3a3496a4f35mr1481175f8f.19.1747205154880;
        Tue, 13 May 2025 23:45:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34? ([2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c78fsm18665596f8f.97.2025.05.13.23.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 23:45:54 -0700 (PDT)
Message-ID: <08371b2e9910aae9eef58828773ed8c196ea3c0f.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for walnascar on Sun 11
 May 2025 01:49:49 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "steve@sakoman.com"
	 <steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
 "yocto-security@lists.yoctoproject.org"
	 <yocto-security@lists.yoctoproject.org>
Date: Wed, 14 May 2025 07:45:53 +0100
In-Reply-To: <AS1PR10MB569724059D582CAF8A6A2A8CFD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250511115243.D83E9100407@builder.sakoman.com>
		 <AS1PR10MB5697B496C5947EC961F51DBFFD94A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <3a5a047bd48aae6576a4422f421616211b1a262d.camel@linuxfoundation.org>
	 <AS1PR10MB569724059D582CAF8A6A2A8CFD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 06:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216476

On Wed, 2025-05-14 at 06:43 +0000, Marko, Peter wrote:
> Sure thing, I have sent 3 patches to yocto-patches on Sunday.
> So far they're not merged...

Sorry, I've been meaning to but there is a lot going on. I'm not sure
we want to stop styhead metrics quite yet so that means one of them
needs tweaking and I didn't want to push back and as for a new
version...

Cheers,

Richard

