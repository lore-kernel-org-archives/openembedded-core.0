Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96875C3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 14:27:55 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.77640.1746541665405504219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 07:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R1s0Z49I;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6f53c54df75so7389876d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746541664; x=1747146464; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pZFTHqtVOdS6/O7YL1Fy0UnC2b98cyu9EXnhNtki6zI=;
        b=R1s0Z49IyO1cBi2isFo9YgtFydT4S8V2VWJLl4FYty8LfbA6soYVjISYOQYvwN8V52
         20dsN4ZTLxxQeU4o5ETdigMQRDzoywd7XfUR7R6rkN78bkkYhLDlaSTIjqguuoe8DVXz
         lUGLhg6zLPY5I5kBj2b30OiINaB6u6yZLemkL1UeKw8xLso837w9Z1X3Jt0O+AedtZJB
         DqQ3Y32EWlpN6H8/reLLSeTs318u3k2UNTQnO7DtQa2Ieb51Sabr16sX0EVbZGt7RnLZ
         gQZ2VWgPLYJTI3gVrc66DmGHq/Vp3p1FzXUfRIL1SM7/Cj0RzWDNGDg5PMmDojStwOfa
         73Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541664; x=1747146464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZFTHqtVOdS6/O7YL1Fy0UnC2b98cyu9EXnhNtki6zI=;
        b=my2UJkRcqy3nebb0NpOa0Q5W1DIe8AWS6YGHR6GNEa9y0vVVwlogFnGoTG2Lbq8/CG
         sM/uzJqe2hESUJiR1or/yGv8EFrYXdMDPrsO5192NCMPrV9m8MffuCe1OXuZ7dQeIQAp
         mXy4NtK1Z8NbyfcaXTwzkGgVW2IyA82PB7XfLLOk6TQOtzdrafvjhQJ8/9pDJvTTggxI
         8uSFuwIj4+5UV5GQQzBNklqDOOFmoMWELNHnQroB2ui8LA1y5WGh88MZS2mz8EdtP5c7
         CkeKlMUz/sBq+Gj6/xJiGcJjR2PuK06alpt85/z1wvzvbOsrOte/WrawBxfDH5AlAFla
         p9Yg==
X-Gm-Message-State: AOJu0YwG/MjLlbVMtLC8QAo/o4kJkrxkxoLIrSydkmik0iVUalqP6Zfi
	HYbSDxvxEY7MlT6x1JpMQ2akcnaNYg73ZooX82DcevZCd100Esul4Bb7+Mb+uwARAzxktagpkxO
	frbVO/Igf4BXfYdfdm3Si4LvLjuU=
X-Gm-Gg: ASbGnctl6gtHpRcYWTmdU928gjxasskRtpy00n3PGqNUn+wL6Dsm12fARJ/7m9u1ZNj
	nft2mlB8Y8rTZ4ea6NggXJfl+LWlVHI6H5PhTMjRy23Q+q28EunafkfJ+wSKCT06ZsdVuNxTs45
	UVlZao2FFiVs0owsuoaVCdWV8=
X-Google-Smtp-Source: AGHT+IFxwbt4s2Ma7D35Q5hozpo0h8wG+UF73dzStvEsXEn9gIe2VNLVjB6Q7Lm74ENNsNnieWguCe2TiroZkrBuW04=
X-Received: by 2002:a05:6214:4384:b0:6f5:35f0:c89a with SMTP id
 6a1803df08f44-6f535f0c9e4mr59233736d6.18.1746541663891; Tue, 06 May 2025
 07:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250506110344.2129531-1-zboszor@gmail.com>
In-Reply-To: <20250506110344.2129531-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 May 2025 16:27:31 +0200
X-Gm-Features: ATxdqUH0x2SChq2or6kxeWnc0wtlh4RSF7aYy_1i2GDUV_1XslUem1d3t4avkKY
Message-ID: <CANNYZj9tUVnuB144GuKWzdLfwB_3eWd0OO=Rkv3+yKb-CSFWYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Allow using semantic version suffix
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 14:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216053

On Tue, 6 May 2025 at 13:04, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
wrote:
>   PV = "25.1.0"
>   SEMVERSFX = "-rc3"

Why not simply set PV to "25.1.0-rc3"? Nothing in the patch indicates
that would be a problem.

Alex

