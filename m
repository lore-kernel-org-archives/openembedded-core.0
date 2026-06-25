Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABD7CDE001
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 15:22:27 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14197.1782400946327220418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 08:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sjaZ0tsi;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8e066990fb4so25835856d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 08:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782400945; cv=none;
        d=google.com; s=arc-20260327;
        b=eHNMySGl0c0QSMUB3xfnjrG6buVj4s0XsOak+utS677/GGNalXDiOn6YJfv3/+2ZqZ
         N9Dtao02bLYmZb5w9fd0wi4Wt9f9Ey1sEm8+lJn+aBYlhMuqKlw5unFJ2v813Fj+3U86
         abIatzbHgxt0SV7UJS0ciu2n/tTRUbNrAb8SIzrSle3jJI6z5oO6GjIBksAq4Uk02MmJ
         P4/tFKCdBNbL6FH4EtZRKiglOnfLWKCCDqNvVOGTpRAN1hYMQRk5BR8mX5mdNgWLGx2G
         yUzghW5MYaQ99KWJIdQ2bFwBcVPhfjfOCS79SlMqTcON9Gs3DDbfO3bjaDJYz1QXgjzT
         IjWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ntKSZv4CcNVaYAZTaaNEOfNOE8Roa7az/MCGFE5WTuY=;
        fh=Q3r/UcZ1ho0dXFQzAPcDqTyxkGxeQu6V4QO/tnpgn4s=;
        b=nuHQVY7wrzHfg6YUf5mcZDX6EumGkdBE8YPNkhZIW7GZ1V/98Tj5uJS6KNA971ANi6
         Tc2wi7qknGwGF59PX9F2Ze7WFhuKiC2Eb+ohnG/LWPwBGuehOgftGT2jqgVmeCfYdKkq
         nrLePga6HRBwS+bchsr7jcCp4z1nO9G+TSArPVn1h9LbLv8m006emouJB5i1+MITSNu4
         +25koILv+TNngx0WaCMWWlvGeFdXBBkiHPzG/O0pa597PWQAJ/8NbQyYFJmX5sDUT87y
         QKMQRa13jcP0IsE0b/n/L7PLHaV8xFYGmxbJOA8xfb/coy2FDqEKM66gmXklSJaztpet
         wtoQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782400945; x=1783005745; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ntKSZv4CcNVaYAZTaaNEOfNOE8Roa7az/MCGFE5WTuY=;
        b=sjaZ0tsioNzuyy7bJ9fa9yYmsAKBDE2xwCYBgvmrT23O+XJgZfm/yrkNtHHnWWXBLm
         xl2uhuIN/GX4PnIoyaYP5+On1v9GU0+e7+yeETi2FV1jCQziAh2KAgdDu3+hJoAhkoA6
         sWAD2krMq9feKOh6IBbO1gsKhMRXUd5/B6ItKDKCWrp3symDelET6zysGSzm/uMWVVH0
         oUa8BcchAwRFxz9o3MhvafqS1UkFe6xJIQzyra6ZrpjpF0zcKGIx+CeEUDBxV0JQ0Eyc
         YR+/nXiR/C7IfrZA7gLT6p/8GABvURucjF0BHO8UN66THpHoe14nbQ07SKobw8i/t/F4
         8eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782400945; x=1783005745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntKSZv4CcNVaYAZTaaNEOfNOE8Roa7az/MCGFE5WTuY=;
        b=EszXBXfOoIJOpJPqogLFyEqwVy7182ceZcHKFTpQ/LI5FJQqTXnOYwm0/FbszhDVkO
         jzaVXvWxEyY7A7SnJLblIsNr3NDY6iKPBw7QnEJ6MP0K3f4ECX9bfWutd10gvSCAQJx4
         oIhNF/KIfyQnj+NbE7jsqZ9t9Ibqky1apaVR1RAtCocVXpx3K917uw+d/gTN8jyfdDc2
         gDUeK64r84AaFpXuI+QcBy2r+BNoxIjMx0YhKZSICj9dLo661UfLJkeUdgXSZG9ZTUf2
         EKu1oIv/kLiTucjP9mz18qOKx9zmHN1GBd21w5UhPl99rXiS3nfVKA1B6mO0i4w2EjQZ
         wXwA==
X-Gm-Message-State: AOJu0YwdOxKBNvC+bYEQQbRyClzI6l/cpb/FZOSayTx78IQEDBRiKDDv
	CHwDmwQ8hZ+5DbJCJLg9mCj92UVYfDavw+Kh2cWGeAmV1einwU38eEyocxa28Ys4ehRDXs0K72K
	T5N/Gga2RmpDh8OzWNE6fS6iI+DSe95k=
X-Gm-Gg: AfdE7cnxnr9ijAK4McbLdhrQBxAz4JbJYO662VEg9esBNwrlr9aZhBW6UJaWbVB4bMb
	oqGspsoDdCXY/20VAKmmCqT6uYueENfOy5fFuy7xjI5hftg1AApsEZHkrrgG+0gLBpvfBkuwIwm
	/l/LbWdEMn5d+h/MjDx9XtFGsQY//uvv5CCt+gZrhggm3I5vp4ncAquXff3Fl2kIr5mB1KBhzn+
	17mtSECGe0e63GM/cEWrPvjzT9aB2a/0OoVoNNG2VNytTJF9wKHO5NnyvR/BRnSdW9eMXqj8g==
X-Received: by 2002:a05:6214:5192:b0:8e6:816a:f368 with SMTP id
 6a1803df08f44-8e6d57c6a88mr48669296d6.40.1782400944120; Thu, 25 Jun 2026
 08:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260625133120.2111653-1-luca.fancellu@arm.com>
In-Reply-To: <20260625133120.2111653-1-luca.fancellu@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Jun 2026 17:22:11 +0200
X-Gm-Features: AVVi8CdFtflHACs39QIyME0OIlbSafjf0JnZh_vqlcXmOzr7XmNvtR3Gjo_1AuA
Message-ID: <CANNYZj8L9c48wTyEp38RkCMzi=XQQS9_rr++KJwZvk2fSuTHeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: Enable MLIR support
To: luca.fancellu@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 15:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239577

On Thu, 25 Jun 2026 at 15:31, luca fancellu via lists.openembedded.org
<luca.fancellu=arm.com@lists.openembedded.org> wrote:
>
> Enable the MLIR LLVM project in the clang folder so the compiler
> flow can use MLIR and TOSA APIs that are not provided by a plain
> LLVM build.

This needs a bit more justification. What is 'MLIR', what is 'TOSA'
and why are those things important enough to be provided by oe-core?
The recipe is added, but not used by anything.

Alex

