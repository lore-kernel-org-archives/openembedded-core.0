Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D316C369C7
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 03:29:44 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.606.1744860569309772651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 20:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NDrGxRs0;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so1954775e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744860567; x=1745465367; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lKA7ehQFIjxjoe45X/KoOYiwTYDdbRp+NK2LEfORs88=;
        b=NDrGxRs0Fo0w897DnzlBvmsserJiEfTm/YljocSVMNQMc3XvbUI1xxrXYtDdv6JgC3
         jsqC/hQ1cJEnz+uJdqZnxsAv7PbJWlpENJ+YCpWNUSqkF9NcAmzBN03Bqh5sW7B0mhLM
         b5cSwaQHqgpGkmAPQx/GcxfghktQlCf8jt7fxEUbeBwbubgNTOLmcoB8h15ZDOewQUWp
         HxT6lPmHXScU9JU7y6B0tCZmkX38ciyyi5bPPTAcf4ORit11L76zcHEt76HV5XbFbE5o
         Sk09HX1gLNf57MvGs2rIaaRr6rPcjlamlVeBFRdUX9uXDJWBCqsa9y7+eM/ZFWBQeaKn
         c6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744860567; x=1745465367;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKA7ehQFIjxjoe45X/KoOYiwTYDdbRp+NK2LEfORs88=;
        b=nc+vXB/T0Hz8N+p4NEf2sGPZesjXtM3IRB3Da0QcGeRWfc9SL/fAeP7wacpwK4CLPv
         o7oF+cxxnkgclDOKJnR3fQZKdQCHtpsxXxV9wl6deN13VdjmsWeHgTOBi+i+9m4YkXPp
         Q+vfLHAIa/9a3ILDi9Seblea5WHg8sxdhGFacMrkkAA4Kw6Sk4NyIChWjV5xXY3CoHw8
         JyINZrUQQVdqy3E6C7DdjL0HcEfUpV8L6kqwsgq3x4fKu1tOaParusgx5W52uR8MCtMt
         SF7KDiGzz+BP+BU9d78qnCvIkE+d5kGdYtakzx3TpfZ2/4nh9/E3xS10yTv9bkQhzo1C
         JrZg==
X-Gm-Message-State: AOJu0YzhoVQH//HDrRmfGz0NjiAYQ8w+Nf1YO4pN8Hbosld0ceImDBAz
	RONHMRCvLp/CbcqE5B2WRmKcdBxHrbfMQFExv8hRghylcXe3Wdc0
X-Gm-Gg: ASbGncvHyA0vXY7rpDcD0cw0NLwFJJpNHpmmPkIlieRUIJ0AyMIlZkqtqgL2EQsId3x
	Z9V9dhSKgeMuqGl9zB31M9EGUSAsQEEUc+5keeUmq51DtZyo6/c/8dGRrbEpHq/q2kssIVxHiJp
	QbEn0vpxojl/E8rEvaSYslctUHNuD73iJuTt0cGeJYd09h4IqESlJYiBuNUqlr4HYJNuyhiTqsv
	OR8yW+dQZv44Q74dU276GDgmXXAv7bypYTJAcKGmZPlAOMXMGYM7eTdzF+HgKVgsbyewzpVDpAM
	e7z/sZb+yMRJFPA36O6IqxOMxGRaJ01+axHZEauZAqAL4bnZ90y37Lny/oXqcYaPenU4nSS8aBh
	mDN1MGD9E
X-Google-Smtp-Source: AGHT+IENPElfjqChOtWlosbF2tJePTByPsrR49YYYjmLCKW7nkzEuhO1/914fg5X3BKWsqMJzGdpbw==
X-Received: by 2002:a05:6000:4026:b0:391:2889:4ea4 with SMTP id ffacd0b85a97d-39ee5b13c0cmr3839679f8f.9.1744860567345;
        Wed, 16 Apr 2025 20:29:27 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm18713620f8f.76.2025.04.16.20.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 20:29:26 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH OE-Core 0/5] connman: Pick fixes from previous series
Date: Thu, 17 Apr 2025 03:29:13 +0000
Message-Id: <20250417-connman-fixes-v1-0-160b2b811116@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIl1AGgC/x3LMQqAMAxA0atIZgO2KFWvIg5VU81gKg2IULy7x
 fHx+RmUEpPCWGVIdLNylAJTV7AeXnZC3orBNrZrWtPhGkVOLxj4IUVLSx+so8G4HspzJfpDWab
 5fT8QLi4HXwAAAA==
X-Change-ID: 20250415-connman-fixes-2eb8f27e9178
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 03:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215032

Drop the full PACKAGECONFIG/package layout changes and just pick the fixes from
the previous series.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
Alex Kiernan (5):
      connman: Set --runstatedir to ${runtimedir}
      connman: Create ${sysconfdir} for systemd images
      connman: Add iptables/ip6tables-save to ac_cv_path
      connman: Mark iptables/nftables mutually incompatible
      connman: Set dns-backend automatically

 ...vice-stop-systemd-resolved-when-we-use-co.patch | 26 ----------------------
 meta/recipes-connectivity/connman/connman_1.44.bb  | 14 +++++++-----
 2 files changed, 9 insertions(+), 31 deletions(-)
---
base-commit: 927d804422c998b5c941049f45a3d77c0668a43e
change-id: 20250415-connman-fixes-2eb8f27e9178

Best regards,
-- 
Alex Kiernan <alex.kiernan@gmail.com>


