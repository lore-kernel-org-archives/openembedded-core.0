Return-Path: <jatedev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747DCC4829E
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 00:12:26 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.7805.1708042336458713846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 16:12:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SKOPlfto;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: jatedev@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-607d5af59feso9721177b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708042335; x=1708647135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iE8F4dHobLowy1gmxDob3Nf+DiSkci9kWUTNphJfD0w=;
        b=SKOPlfto4hmu/AtNHdQYWvNOW43cLGpvDNHchuilAnEk73mSBvIyWDsqdhXnQUHQnz
         qwkRtHoK0tFPEkM4mSQGcT3e8ECUseLgqfa3aXvxw78naWGCHr8Sr02pcXuxc1yf+j/i
         rpgT4sCiNLPamtI/YK51wH+GqioPFVGSVWGhnAVtzK1dtZhQhVyRHmb/lPAjhy6pN7oh
         Z0eWh0+CmT0KMgNQmYu2fXV6/mLm2xidu33/QJrSBslmTpIl6GLEYOnpgrsM75eEjokV
         znRhO72xt8VsJYHfaAtCVnStguIpcTZvoAquP640Ey9QK4mQ4MvRfz63IaTR5P4axkXp
         dJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708042335; x=1708647135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iE8F4dHobLowy1gmxDob3Nf+DiSkci9kWUTNphJfD0w=;
        b=gxyR8Ahq8xmvrw2fe/9kQ7DCAX5oXObmbrS8ZzLtU0WcBaiM3keRfRT9iTcQ5xQNrK
         gz7yaAy6xlGtMGgKKEthHUE3yr5uS6agufOUd79CoqRc3hndF0Gs1wp6gfqq5YMIz8V+
         6I4L75xwRrGMgYdsmGrAzW3gkOJu7BrzAAa3CPOk1yR6lhXO1021Xm44Q6KVRsb6Blnc
         DvQlJLivQp851IAPaQYVEXihp7bmWzx0DH9at06tNgZqbbaWbaGLfkIuOkJANWzvfi5z
         PE4tPN/XqaQuvNSIZGGsb/JGGDdWXPMNoXh8pM/vPH2NLevpWNCOchKAYJow86yP1rUn
         nuJw==
X-Gm-Message-State: AOJu0YyJlP0MgPc2JD/GoO4+Q3MkKHLGjVot/jSWXSTzMDfKKMh1pWb7
	E1/9GipTiNeccnedPrxUrzo25ls+eqplmzkamC/DzE+HRysW1tZf7VRO94xK
X-Google-Smtp-Source: AGHT+IGstHhq/Pj8i2DwvyLpifkoGlPDtjJa8BcenRB9+sEfIfdwGh18F8YRUmwrk87VbjpXsxD5gA==
X-Received: by 2002:a81:4fcc:0:b0:607:845a:7f4 with SMTP id d195-20020a814fcc000000b00607845a07f4mr3453506ywb.27.1708042334804;
        Thu, 15 Feb 2024 16:12:14 -0800 (PST)
Received: from localhost.localdomain ([63.148.217.19])
        by smtp.gmail.com with ESMTPSA id y69-20020a0dd648000000b006079e8f3572sm107150ywd.85.2024.02.15.16.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 16:12:14 -0800 (PST)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jate Sujjavanich <jatedev@gmail.com>
Subject: [OE-core][dunfell][PATCH 0/1] Backport do_package sstatesig fix
Date: Fri, 16 Feb 2024 00:12:06 +0000
Message-Id: <20240216001206.3428-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 00:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195731

I found out that this backport is applicable to dunfell.
This increased sstate reuse.

Richard Purdie (1):
  sstatesig: Allow exclusion of the root directory for do_package

 meta/lib/oe/sstatesig.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.25.1


