Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF9BC00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 19:45:16 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.2827.1660160714063065342
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cK6Mynoq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id l22so18911265wrz.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 12:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=k89AaF86jSB4TFqBzTmnd1PUUFA4U5WGIDKdUbt9LX4=;
        b=cK6Mynoqb7KQxhR1eowLPoxbrtEVI1XtTvlleMo7ZqYpAQ3DqBWg7Z9IDa5Zsc4Wan
         T3N4MH6pO3Qz2vmxBbjN/qehAFkwWoC5NfY/AtoEZ2zdLbm+RqHGNBdHoVghqD41phMf
         Ns49IhfkaPVvia3+rddBVAVCtK0ryP+ZOsCS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=k89AaF86jSB4TFqBzTmnd1PUUFA4U5WGIDKdUbt9LX4=;
        b=45dEC2SlsA/O4uJTwMRx/vyibF/RcIKPw+v2nVjIAPrjX7FdI5OmFV5OBPDoufYQT/
         6U2w16WcwFmL8RDlOcKLzVLkYJu0UZov0Ax9S8w0gJQam+BNFvzrgBjWfl80OzlC36XU
         dYuqByG33lkQyWhrQSdyd299Cqp8RaEfBwEq9YwwCW/57+yJ8T7Xzeld9WJKwCGlJCh6
         yMil12U+l8DG6qpTIyj/5abM2vDpU8q83y8Fl7v8nmqvnJczJJvbGhYRrD4GH3LoKM1G
         vsjQ6s1Pt9cQxpXuDwN5gnOMo4P2UBc0DUBHSqqrs14VRUOLXTGOEkoGa9KcKjI3+o3n
         3I/Q==
X-Gm-Message-State: ACgBeo10pW/ql0pAg1DMd+yybgQd4/rMLa/v7jHH55vUS5LtHZfcq90l
	EWQcmkQFDsh1gALQdKPNiZL++5pzE1e4fw==
X-Google-Smtp-Source: 
 AA6agR7c8yChVp6jktTN96NeNvJa1SSNnDqumIPGHTVxXJ2CQqDfhJttpruWuz69oxQH8Sva3ga9uw==
X-Received: by 2002:a5d:64a1:0:b0:222:3b0d:c9a3 with SMTP id
 m1-20020a5d64a1000000b002223b0dc9a3mr13395225wrp.437.1660160712042;
        Wed, 10 Aug 2022 12:45:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bdb5:cbd6:cc51:991])
        by smtp.gmail.com with ESMTPSA id
 l21-20020a1ced15000000b0039747cf8354sm3240823wmh.39.2022.08.10.12.45.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 12:45:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] buildhistory: Only use image-artifact-names as an image
 class
Date: Wed, 10 Aug 2022 20:45:06 +0100
Message-Id: <20220810194510.484900-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 19:45:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169202

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 4ba9ec8f25d..35db2b11927 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -7,7 +7,7 @@
 # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
 #
 
-inherit image-artifact-names
+IMAGE_CLASSES += "image-artifact-names"
 
 BUILDHISTORY_FEATURES ?= "image package sdk"
 BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
-- 
2.34.1


