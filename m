Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655A2C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 23:11:23 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.2546.1698880276536015020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 16:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=et4j/ACf;
 spf=pass (domain: essensium.com, ip: 209.85.221.48, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-32dff08bbdbso159787f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 16:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1698880274; x=1699485074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8SWGu+/Yob/hSdRnNxqxDboKpeSCU+97HNVSFFJz1uU=;
        b=et4j/ACf05fk07Azsog4++8a8BixHIPpufuTGoRzNp60q1M2roygZFZvLAaG3f8H0G
         zSnX0D89kbBmK1bLkSQHXJE2E8tQQT+3tb2aXMHzQppZFKQCefvlbDq2BrFSvwlM6VH+
         Co1lrK4mw2wAZVl29sPL9/u3bbdoJa+mqkUC40MHMiH2a+1JYtn6Xdrw2/1QlxLchaXc
         gC4TNI/Ud+896f0ggibnVLvOpetA0NG69uOmHQsrFLTov/xFSnqy+0gmDsUzBnd2Nrxa
         WC7tJxtZN1WqAcTHUSBwBSy4AyYlWOtMk+P6rdg0Cfg9O0A+XajWGBLLPSCaQlGoCvPL
         wjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698880274; x=1699485074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8SWGu+/Yob/hSdRnNxqxDboKpeSCU+97HNVSFFJz1uU=;
        b=B1qtNWWvTw+wxmwflJrLcel20VtPPK8Okd+MexZAUq/yNdEqsJmTAYP7fh0YkkA3t/
         BT6eg7WXUNqpxoKEe5xWY2w0AaZiVRRiLOixzUhhcPN/urFbJsIkMyYC+OPHBT/nx0tJ
         ZTs7y7CMdE7ZA0hViQwqHqVUbgqIk7kLHO9YvoU8Ckmx07vEWNMnwXGE4Q/29Vn4Y+vc
         lo/oFfAWw4t+Y0mlLJkS3wcz03b/My5J6Yjw12lMekQauWhL+/+tnDmGyk0xZtk8/B3A
         x/upgNDK/Rk1mdf+38uQjmOUVri9eN8zMraiVJ8OE837VFfOrig9SamF49ygzBorvd9X
         Nqlg==
X-Gm-Message-State: AOJu0YwZ71jvb3fgSkCYVksKFanWAf0ZlG6JcMBT7qLFzh7u4ITCuQ6G
	4PF942urdHrBM2TtKAqFW/jnFNOJDqlkSvhgJxk=
X-Google-Smtp-Source: AGHT+IHQCtqedf+plVlfJvJbRM55iHF6lNQ554kvhfBfG1MPDkA5gj9AGt+K0w6EKS0TD7E/tJA3JQ==
X-Received: by 2002:a5d:6d82:0:b0:32f:9511:9795 with SMTP id l2-20020a5d6d82000000b0032f95119795mr5696392wrs.11.1698880274617;
        Wed, 01 Nov 2023 16:11:14 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.gmail.com with ESMTPSA id m11-20020adff38b000000b0032db4e660d9sm854601wro.56.2023.11.01.16.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 16:11:14 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 0/5 v3]  image_types: use IMAGE_FILE_MAXSIZE variable to create fixed partition size
Date: Thu,  2 Nov 2023 00:10:49 +0100
Message-ID: <20231101231058.86928-1-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 23:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190048

Details are described in the first patch.

Difference from v2:

* Added working and failing tests in meta/lib/oeqa/selftest/cases/imagefeatures.py
* Split commit to send documentation to right mailing list

Difference from v1:

* Added documentation for IMAGE_FILE_MAXSIZE variable
* Added Python function to get the value of this variable from shell functions
otherwise parsing issue can happen
* Added an additional task to check the final result which works for all filesystems
and not only those created with dd command.

Charles-Antoine Couret (6):
  image_types: add python function to get the IMAGE_FILE_MAXSIZE:fstype
    value
  image_types: use IMAGE_FILE_MAXSIZE variable for ext2/3/4 image types
  image_types: use IMAGE_FILE_MAXSIZE variable for btrfs image types
  image_types: use IMAGE_FILE_MAXSIZE variable for f2fs image types
  image: add check_image_max_size as post function to check file size
    against IMAGE_FILE_MAXSIZE
  ref-manual: document IMAGE_FILE_MAXSIZE variable

 documentation/ref-manual/variables.rst        | 14 +++++
 meta/classes-recipe/image.bbclass             | 30 +++++++++++
 meta/classes-recipe/image_types.bbclass       | 43 ++++++++++++---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 52 +++++++++++++++++++
 4 files changed, 131 insertions(+), 8 deletions(-)

-- 
2.41.0


