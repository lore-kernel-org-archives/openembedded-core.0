Return-Path: <sgw@bigsur.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317DCC46CD2
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 00:04:16 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.28154.1706400249910832296
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jan 2024 16:04:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bigsur.com header.s=bigsur.com header.b=VDrpyb4U;
 spf=pass (domain: bigsur.com, ip: 209.85.214.177, mailfrom: sgw@bigsur.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d8cec0f71aso615495ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 16:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bigsur.com; s=bigsur.com; t=1706400248; x=1707005048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EXk2xvWR2WIV10RgPNh7GRlZ8reoWelXTNApa0kaYeo=;
        b=VDrpyb4UBbS703PWHBHSymYaP7VcTsFyC5F3qLRV+gZP5NYtL5cZehMpcDLkkjUhED
         b818J3sPo9QRU5u1GYH6OK8eurXZ5IyupBUvyNUGedeHlY9bg9A4w7ttgBlxrXKZwaAO
         F5okPimO/kK1ZDohRLUSGcx06gmeti0TEt29A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706400248; x=1707005048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EXk2xvWR2WIV10RgPNh7GRlZ8reoWelXTNApa0kaYeo=;
        b=kV09uECTJGD5SS7Q5RP5hlTMiaABQsykfELnLVEgC4WAcrfhIFYN6CeL9AaoWk3OFA
         tAX/XmJCGEb4SyfxpFe9G3KBdZYgIQVNrng9ED9X8NzweI1rQEW/Wxw1VWJM8Wko5z+n
         CRBY1YWr3m7gInnJXei2T6EgXfpEkifTIU93hzb7OKpvF1FZXNulR9c8kJJ3ta7a/LP+
         gu92LLpWePRfRkmqXxYsdHZ1qdiU7qEoX2eFDrw35SZSR1/FgGmPdY53EHE2Bj9JSUsJ
         j2t9fNKOPzwrzBzOrbGTAUpz+wlOTVIcgvALcdxlI8pdh+pKKVFLJZ/VjXjzwJJRBc9X
         Pj+w==
X-Gm-Message-State: AOJu0YweG2GJMI04BVnV5lDHeaGTYdAK97n6LCLYIIpJ5YnBcUVRHc7K
	G2pLPyE0D9NexQih6Wq+RJoIvVsjCSzJSpqosXVeh+cQo1XKjUUQOIlraHujJOHlnHmCpKtpV1s
	=
X-Google-Smtp-Source: AGHT+IGW3lyDkGkh3ItHmF5RYntw+F31kkW4AyBopXIGJHynokbU/LCwzY+tGM358kZsfYSSAvDc5w==
X-Received: by 2002:a17:902:b786:b0:1d8:d374:da91 with SMTP id e6-20020a170902b78600b001d8d374da91mr36510pls.31.1706400248414;
        Sat, 27 Jan 2024 16:04:08 -0800 (PST)
Received: from framework.localdomain ([69.9.134.55])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902eb0500b001d58ed4c591sm2926823plb.105.2024.01.27.16.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 16:04:07 -0800 (PST)
From: Saul Wold <sgw@bigsur.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: [PATCH 0/1] BBClass checker script (14235)
Date: Sat, 27 Jan 2024 16:04:04 -0800
Message-Id: <20240128000405.3074503-1-sgw@bigsur.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 00:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194435

This is the first pass at a script for addressing 14235 [0]:
bbclass file name convention is not consistent wrt dash and underscore

This is could be a contrib script or added to bitbake parsing somehow, 
I am open to suggestions for where to add this or if other tests are
needed.

[0] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14235

Saul Wold (1):
  check-bbclasses: add new script to check bbclasses

 scripts/check-bbclasses | 109 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100755 scripts/check-bbclasses

-- 
2.34.1


