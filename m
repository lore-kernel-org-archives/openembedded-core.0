Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9703AC00528
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 21:14:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.19676.1691356438431468848
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 14:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=fXoDTLwR;
 spf=pass (domain: essensium.com, ip: 209.85.128.50, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fe2bc27029so38792995e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 14:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1691356437; x=1691961237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jk6s398ONapwS1jkPBq8aZ3JOS0gXV2ovKTyr4Kpf0c=;
        b=fXoDTLwRj75NjFzUTk2OPtv85RSZp8wxKlOCvsc5hAEJN6r389Y+2dEHe3KdTfBK2r
         DINZNuMWT615d0cflSKNPpcmYV6WSwBmLVm16gGEl0lFIS9kSe03DydSsf6HDtcuXT4o
         agF4695lC8r08YVOMdBeJICIEY2Y2ppUxXolFqN68k0gydDhUcOlqNy/PSOKmse7nWYB
         7K93wlglhaGnS744/CbTJTQH6gwcenjOdoW2EqST2f3joiq6IGcKDWTrHLKNDPxczbP/
         5zC6TYAJTVtaSJTYzKA4imBsE70n+adNX7otFcuLiIZ9SySuCruQ4KvbLrH+Cd0Gkokc
         SpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691356437; x=1691961237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jk6s398ONapwS1jkPBq8aZ3JOS0gXV2ovKTyr4Kpf0c=;
        b=aQzqcCcg/kXilmFB/LN+jvlBjAMJC5YGUc26vvHNFk0CFIpwXKQ2xYEreKkjruH5Kz
         wlYTNGd/9mOR4OnEZ2XuVfWe1Yy3AJdIpkUFo0PRSCowJHWN6bHth8Z8yX7xqh/U+tNR
         EH5QXS7NawtX40yhEF9NDz9/7YCc8TVa/iOr7FOZ9vuF4orDkAeOmBL14Zx8sIsPTfPq
         LrrnrhXvHLYgh6OoAOfWiDkyENVZZCXoSnRWhMNW9Qgdj46frX9v7I6+za12pBp5sVZb
         W3QSKPdcJuWlrm94XyMn313JrALMtdLfS8ogb21siRu1eG7SFUiCSP+MLH8lpqdL/BPW
         1GTQ==
X-Gm-Message-State: AOJu0YwchYM/HKYiSVQW/31+3i9L4hcyE2Vwu2YY/zXfOjKM4UrFo3pX
	iXyGT1fGwF5BmcAOn5qx5UEJ7+KfG0B1fm+/3+8=
X-Google-Smtp-Source: AGHT+IEWrIbrCUx7fTufw2CZ5PlnTUTe7L2kqiJVk92nAJUdM0Xwucj6yLBtzGYbwch/VUzM1EDs9w==
X-Received: by 2002:a7b:cbcf:0:b0:3fc:193:734e with SMTP id n15-20020a7bcbcf000000b003fc0193734emr5994227wmi.32.1691356436548;
        Sun, 06 Aug 2023 14:13:56 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c021500b003fe1a092925sm8612055wmi.19.2023.08.06.14.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 14:13:56 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 0/5 v2] image_types: use IMAGE_FILE_MAXSIZE variable to create fixed partition size
Date: Sun,  6 Aug 2023 23:13:41 +0200
Message-ID: <20230806211348.1191553-1-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 21:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185574

Details are described in the first patch now.

Difference from v1:

* Added documentation for IMAGE_FILE_MAXSIZE variable
* Added Python function to get the value of this variable from shell functions
otherwise parsing issue can happen
* Added an additional task to check the final result which works for all filesystems
and not only those created with dd command.

Charles-Antoine Couret (5):
  image_types: add python function to get the IMAGE_FILE_MAXSIZE:fstype
    value
  image_types: use IMAGE_FILE_MAXSIZE variable for ext2/3/4 image types
  image_types: use IMAGE_FILE_MAXSIZE variable for btrfs image types
  image_types: use IMAGE_FILE_MAXSIZE variable for f2fs image types
  image: add check_image_max_size as post function to check file size
    against IMAGE_FILE_MAXSIZE

 documentation/ref-manual/variables.rst  | 14 ++++++++
 meta/classes-recipe/image.bbclass       | 30 +++++++++++++++++
 meta/classes-recipe/image_types.bbclass | 43 ++++++++++++++++++++-----
 3 files changed, 79 insertions(+), 8 deletions(-)

-- 
2.41.0


