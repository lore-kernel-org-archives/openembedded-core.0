Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC40C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 12:24:33 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.30845.1702038269093969699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 04:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MsZX19AY;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c9ef682264so24885921fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 04:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702038267; x=1702643067; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ilLIYkJk+QC9WNVc0QHm/hGQ4ZwAVagyGCGfecZBuw=;
        b=MsZX19AYeECCAetjeQ/cN2GnvFRokg1HHHj+LpIWuM0lb9FxZ55Q+8HhJYgtgt9E1u
         BkdAzKtW9T/beDD4SpwRhEUDTkSco/Ku9kpr0y0GB+iBQcmcjxgw4GuBfiNgfU2ylzTQ
         HaxPgwlnsohmZ2KB021723SIZJ5yLqxpoZbGJaGLHXk7DgCgIfgMHNF7axcKYMYPWTdT
         Ffd6lBTYvYmScrCZtbZS8J4NfPdL/ZQ/3fG6NOPYIdAzoG0VVUl3PMMnplk7gO4WuRz9
         j/Yy1xjEN1FJ3TPDlS07yd+HQfGAsyQA8MGSwYXASbqK7NHi1ZK7upnsZkYqO7AJMoEs
         Ollw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702038267; x=1702643067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ilLIYkJk+QC9WNVc0QHm/hGQ4ZwAVagyGCGfecZBuw=;
        b=hiXwToV3bvDlkEr4oSNyxOt0q1aDr4Qv0rKw64elVt2c7QnZh6KjtU90TuYpuLfufg
         hRyVOrsx4p1Jp92O09wGrRdGLR7jsGBnNOu8kWMQNnsLXxCN4HvIjqX13Tghm5Zmo5Ks
         9lf4NY8dv65qq29dhTMK6hbOymZ3VufTN4SS4V6xtyqy5vAqjLDyZCx0PqFWXQz7CqDS
         /PP00k3+7SwK9dXRqpoZPyWuuK8SJBFA+nBVapaQc3SRdTw9mbstCFmnCPKHkocK+Njw
         b87LhUK1lrE7TU3RHhLFzhdl8LurrxC/ebUAWAnt+9wLgEw59RYIwRRiSJPR+LcEqA+B
         afKg==
X-Gm-Message-State: AOJu0YyRPg4oO2fqyrDvoxfsRTWbZL83LS9Cqp/63IK41mEt0Q6H6HdY
	dIlPe2VfkKH/dO59h1SB7T4Z32OE+s3aEBmOFAE=
X-Google-Smtp-Source: AGHT+IG19rY1d4Rc2B1GC1Zdyf/AF36RTSsRZSBCBOLWNgGH2s3iwX2uwdGkM/Y4s8roEEpK4eE+NE5JGwX7cuNtvrw=
X-Received: by 2002:a2e:985a:0:b0:2ca:d14:96cf with SMTP id
 e26-20020a2e985a000000b002ca0d1496cfmr2403832ljj.48.1702038266935; Fri, 08
 Dec 2023 04:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20231208101522.198832-1-alex@linutronix.de> <20231208101522.198832-6-alex@linutronix.de>
 <0b9ea27634ed3c7ccdcd74de9cd8418d893e21c5.camel@linuxfoundation.org>
In-Reply-To: <0b9ea27634ed3c7ccdcd74de9cd8418d893e21c5.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Dec 2023 13:24:15 +0100
Message-ID: <CANNYZj9+3AwPdtXSFHyAab1sDzPZMHf9GyjN=1MX4B+R7XJ-Zg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] oeqa/selftest/sstatetests: re-disable CDN tests
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 12:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192053

On Fri, 8 Dec 2023 at 13:22, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Crazy question - for the CDN tests, why don't we try just setting a
> dummy SSTATE_DIR, then "bitbake <images> -n" and check the "State
> Summary:" line in the output?

It would be good to know what is missing though, not just how many?

Alex

