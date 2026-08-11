Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BB9C5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 09:49:16 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51091.1786441755982787985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 02:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q16yDpcN;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-908239232adso4577476d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 02:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786441755; cv=none;
        d=google.com; s=arc-20260327;
        b=hgwFphvK9vPVDYdo1BsTxFwBG29LeGdWquUwC54ItzA8rtv+kurwyMDknjsg8cGlok
         XBtH2Fw50n/4EJWkMc0ziODh/alXvQ7tZj5j9PX/5Sqv83iI/lwrRwTCOi5Be+QwMjC/
         bMSfGh4fu4wL6EbAu6TizH4SMRxdkMvSr+X1ZUlvCIYOw3PAQHTqLQmFAbDtZ0r6v6ru
         WJuEZ3uLh3ng6MNCO326kvE1PhcM5pYuoniOUIyK1mhjzZN+ZSY+9kuv/XIUKNu6u8nw
         ydT33nefksL8YTm+FgxW+bw2ApVrNUF6/XHJ66IT2bxk346PvM81+74PKwIl91yQE4g9
         OqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D2rZ94kBx5tAQrHrbOJPUzxuaP1xZJ+es993QcU+O8U=;
        fh=+RM+TpM6nuk7iP5pCpejrvP5WFbkj7K/9Pq6e47cg5g=;
        b=jz2uYLOPO3w56YRynQPWF8g8NF3nULcWObHxFvC3sd9/pcX730bYp5I5gEITQso1H0
         duu6EQ4+fUlWYxfeG83EFcuC+Hn3QQugB4X4Nmdw+goZN+BLgtscPiWwcgsYWNbHiLds
         nYPmqOkhT6gp9zvVr2azmDrjSoNEoFkO/M12On1d+LjHbQCa9xRzvOV4UKH8k1Ei+yU6
         fJqIDF4o06CtcZJcsQRY+4K4vtI4UWYwU39C7gvPEckk3P31UEMgnAxIxQAktWiLFo/9
         GjpHfLKWz4MqYDY1o3YZ6Py/7Ac1r9ntmWXEdMYPEQ+Gco4hH7WVmVJruQFw4Ntwfa1v
         GwYQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786441755; x=1787046555; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D2rZ94kBx5tAQrHrbOJPUzxuaP1xZJ+es993QcU+O8U=;
        b=Q16yDpcNBjCex9PShgpdplB0L8VVBCux+AK6Rd7Ntq+nIanFv58XkLb80dy9+7Mo3Y
         MPP1vUSGSHXUkVskqnQmpekF6DyNjmmo+SC6vTFoHLZ/Fkmt2E7WnC84w/+j5tSvdcIz
         v4uZl0t8uNr9CbwEBra9YxDbjcJZ5nO9CpZDM4g5NykmIF5nAPXLIEnWjoX/W6Ssz88F
         J/Fx9jwcXRdiuesMaEuGHjrNMI0j1TPybiBc6SkOgpyXlOy2oZXWUr8wF3o4mp+lDn5V
         qV15ZdfkdQ/Cw+nsacc5cBzljlDrjECf+6HSJnLjHeIBJxdnH1XW33g5OVboDMeRpTL+
         A/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786441755; x=1787046555;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D2rZ94kBx5tAQrHrbOJPUzxuaP1xZJ+es993QcU+O8U=;
        b=Mu913Ycj38oK2tIa2aO76JWCGgFp5E7fAlptwr6GPTo8sHqCNdMHNdOq47zATfBQ0e
         cjqI30g28crhtAzkq2nQVooPxxqLlw6lvL+TSENkpWjEjNQlhVf92obl7vFCWDQ8RCOI
         GZG1zF0e9Iz1h/ZD78tL7wQftAFcURSnBo3s35Yg6B+n0dr2tQ0E1I0st39uS0vizyWi
         4ldy3o2pvPKpBtZBm/ZnjuzHK/luv4TtHLJd2jqJwDz/2501/Ynka216w9TTBHrk7ujH
         ZYYqi3VDfV+GYJSY+i5lr7g1wJogteZO5wN345Oz3ZQNNwLitv8mPSQ8Q+UKZWI/kaRN
         3cuQ==
X-Gm-Message-State: AOJu0YyyGCd7UVVOOHyAejMAJ8js7VAUbnq5Dqyn5/tpYe0XMkwKcLvH
	LL0yA1k7kvt8rbkXxH9cYqqDjsUcze3Pb+EN1Y2plx7USrnEAEKXOo/+Yt3XT51OJ6xLhbP12uF
	mHCNv9L+bYMYkbqiC8/SFUS2cvOhf1WrQMA==
X-Gm-Gg: AR+sD13QMRZ9H3lodITOF0tVTBedlNT0o4MOsT/hn3z4WKapN2na1goDUJTFQwzW5Wf
	UXrZ2yphe3HqOgCoIoZLB342Nj8ZtJp6tudkEQ5SC3xD1CaANXXNjaUdooSnVmPJItEzLs58a0J
	Hq9E4wENJnmS4ACyVZ8+pqAE9YuVLLOdcjyCjqUBk6/NA3V62ZbwdtOLMAR5weyrHY3k65X/aQC
	afS6hX/QYN5KL68NHdH8lbq9XupVaPxuaUkfqt7YKglAPD0qCftmUCDhAJfOpGAd4QfBlGzY80i
	GCvtq3U84JW1VyEg0l76rWWTsHLeEntvDYNEctjIr6GirUsBbScWGZBl7yABtjnCTEa70yV0onO
	+7A4=
X-Received: by 2002:a05:6214:202b:b0:8fe:57d4:69cd with SMTP id
 6a1803df08f44-90a671c931bmr13432316d6.14.1786441754784; Tue, 11 Aug 2026
 02:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260810-fix-boost-v1-0-4e838b3d43b4@windriver.com> <20260810-fix-boost-v1-2-4e838b3d43b4@windriver.com>
In-Reply-To: <20260810-fix-boost-v1-2-4e838b3d43b4@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Aug 2026 11:49:03 +0200
X-Gm-Features: AUfX_mwvmKRfPlwZhEJS-Rl8E8qWSANxF9wn4tElF0LM3UcgHly98iH7LQRefTE
Message-ID: <CANNYZj8r8uC=xJdrOyEk-ScGjJpNmAbBCZwCGheHg8XxEY9fDg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] boost: Add support for Boost.Python NumPy extension
To: rob.woolley@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 09:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243178

On Mon, 10 Aug 2026 at 19:36, Rob Woolley via lists.openembedded.org
<rob.woolley=windriver.com@lists.openembedded.org> wrote:
> +PACKAGECONFIG[numpy] = ",,python3-numpy python3-numpy-native"

I'm slightly concerned that this needs the native variant at build
time. What for? If boost queries native numpy using native python for
options and settings, then those aren't necessarily correct in a
cross-compile scenario.

Alex

