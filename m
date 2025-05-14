Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F098C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 13:16:40 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.102272.1747228593744480419
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 06:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dB92sPfW;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so49696626d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 06:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747228593; x=1747833393; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hz1Giv4mZid/E+k++uIeK3Da9WgGhAQ2lnAhPhvYaw0=;
        b=dB92sPfWvB91TbsewxU1uMdfisdGls5xeYOZ72wGQbZEtE67lIs2FQ3fwE6DJZEeNi
         bD3if7GlEL+JJT8VwYUVxg3K2Pt2LU8TnpfvZLc48eyOxmUANCK4LS6EmI0II/iB8b+l
         lQg4OBR4cuhr+VEQIrxlvN5WmpKWLgyeT2F2GdjbU5gqjlsCCK2qbtYcRui60zfV4Jf4
         IjHrTGRWQLGAp3sLmycKA0dV7sbPLw5r0QkPvJi6z/5fnSE1wQnEayFiwpOJcloC1+My
         zw1N6N9D96AgDx4b5vGLjHc8SFCl2kXzvKmP6n+l6jos3NcsEAzgMVuO2uS/gRcuBLr+
         ivyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747228593; x=1747833393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hz1Giv4mZid/E+k++uIeK3Da9WgGhAQ2lnAhPhvYaw0=;
        b=AJi8zrnubCMRMEBfLxfY3EyP80stNN6iGLOJazLi99Wk9vU2pqWqa1QSk/zf3O8xgK
         y8U/aNBoee9gBxXib/McER/LmrTf55ES/JfEV8MM0QaqdTPt2c4JSk8vY8e2L4YnLJmr
         i4Kf9R7YNLoTPim0XlAjGuk6d2fLqEp1XQgVD5xKZjput1ciNQHqrgqdQzCEQBQ5UbBK
         WSBthOuMmmPMdfBklnxYnJTpOTIdio0bKGdNOQAw0MresUnsvvywByQKU7ezNjqp5Bt4
         2OJnvD796fQVIeBtLnctxJ6KfmzgLZG1YEQ3yrcgJiQZMsCnLIi/yyBtan6JMVA1qPCP
         VMdA==
X-Gm-Message-State: AOJu0YyqaJU7vY5Vek5HoB4i5VzBQNcqFRk/zH7CMRsegQ7GALypWbIM
	446fPxgwV2zsBBqlhhSFp3D+jrBMsovkZJJqSvrrI+D2QLjpke1+y81NlP1/5C7hdEapxcqD2CR
	0DtUdEJPPU626nBRMslmfVpG+d08=
X-Gm-Gg: ASbGncugzXq8d/WVMOvjmW4c3gnTE57NCHEWTwC7cFJ1X8QY0i7xPoEBJDD7EYmStyj
	5h8w4a1PdGGMmsY4Ccy0pFfkX+lMDPjXHxkWCOU4uTncWSmPjo4Uw3pwOq+0XeJbPhhswkgx/cC
	d2I0K1irJGe5HqI4z+c6rfq+9IngyQgA75
X-Google-Smtp-Source: AGHT+IGufvSrq6z4XTMDCEKBDVAUh+71tNDk2JKiAaMSPC6wavDldKiSpbhOPTMI8/Kg8IWz7Yc5RLLZDVuw7FKnBoQ=
X-Received: by 2002:a05:6214:2a82:b0:6e6:4969:f005 with SMTP id
 6a1803df08f44-6f896eac92cmr44252476d6.30.1747228592709; Wed, 14 May 2025
 06:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj96qMX_tZf-yu+jSac6R3+_BqjigTO=4kvkuSW=ja-G4A@mail.gmail.com>
 <1013.1747132213222480212@lists.openembedded.org>
In-Reply-To: <1013.1747132213222480212@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 May 2025 15:16:25 +0200
X-Gm-Features: AX0GCFsmfLKzh94YUrIoRKnOXMngyjxk52AAcRnfCvq7eQi90iamrvAHMTjDl2M
Message-ID: <CANNYZj-g5MYbo7Nv5OzTjW=W2ECFCzNLi8s91RjtmDjrSO7_Wg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package: disable renamed dependency error if
 allarch is overridden
To: ohnatiuk@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 13:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216492

On Tue, 13 May 2025 at 12:30, Oleksandr Hnatiuk via
lists.openembedded.org <ohnatiuk=cisco.com@lists.openembedded.org>
wrote:
> a packagegroup explicitly inherits packagegroup and nativesdk classes

Why? I have to ask what is the use case for inheriting nativesdk in a
packagegroup then :)

Alex

