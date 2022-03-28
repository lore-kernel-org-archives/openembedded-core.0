Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CB3C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 14:15:58 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web08.11457.1648476956482225426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 07:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GdR9XZa1;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id p10so19130848lfa.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n6eSBgI5zx91igCjLmuR77sivOMepSA1dJs9zve+MQY=;
        b=GdR9XZa18Kcbaj2M+TIQ+ZwhgRr/Zt3o5kK89zj4zHKVq9hFvNlGOyhHk15xA2rxBR
         TGJrKNJ6PhvIjqui4Y7h42G0Oanfjg7UGpZ9qPsPrWvAefgKcrbZITV9ltrST2Txjmt1
         1B3hYk0sRpN05lUwO1O7lZseEBFhfa8C2JCnANctU8BIHV8e80D8z9HF/SNnNJVRpr0x
         bxgMWjvOqLQT1afiI7uzGG35in53oSVVUkj2eErW4+957jRdQOAw1OvePtPxr3W37or9
         19JGrZDzV/PUQoHai/QPbR1aRuFzxNrG7046/A15Z4NMru3NYl1UGFBkdCcuoegEF2R4
         f4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n6eSBgI5zx91igCjLmuR77sivOMepSA1dJs9zve+MQY=;
        b=AX0W0WUOLcoX9wk7+FvIgKRogxkMhYeyW7MLEXO5YNF1mly5VCHlcw8DHoj2H3Cpzt
         pL5/rzCsx1dvi+kAdaX93A9WZFiy+Nd01pVypED64NmN8TEyXbhNdOxl5LakFwQcVtXp
         USbcul3TvhBDQj2bEHZkveNHPNG1/D+iUUZSK2m/KB/Jue8lFk3hiYUQEcMkd9ANQGLu
         wI44SOwS4l0G02tjv5YmwzJqfdBYXOD3yX2M/wu6oHWJHBwcnymzcDz4MhGiLoxGrL0R
         dhQUETqr14Pz6vvE8332knRMmUkPCx0YN9BGbxmOwva2Ee3WqhgPKugqMcd19HBjZ0K0
         6oNA==
X-Gm-Message-State: AOAM530N6rf6w/jqjXrZFFnKpHLzTkbw1/7um9Ak7B0LJnvD71G4TD7n
	r61pYIAfRbcJoAPtbOo/RLOx6hyu8+5U6g==
X-Google-Smtp-Source: 
 ABdhPJzgypbM7dZqIIintArNtJzAf7BPuVxPcPBf/w+fg7uHCBC3g5Et+ItQuV9TS2zmDqkQW9WVQw==
X-Received: by 2002:a05:6512:16a9:b0:44a:2f67:3b29 with SMTP id
 bu41-20020a05651216a900b0044a2f673b29mr20951896lfb.153.1648476954077;
        Mon, 28 Mar 2022 07:15:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:73c:8290:4c78:ea54:965b:7b3c])
        by smtp.gmail.com with ESMTPSA id
 r11-20020a2e8e2b000000b0024980665874sm1729301ljk.52.2022.03.28.07.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 07:15:53 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH 0/2] Some kernel fitimage build fixes
Date: Mon, 28 Mar 2022 16:15:49 +0200
Message-Id: <20220328141551.571676-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 14:15:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163707

From: Ming Liu <liu.ming50@gmail.com>

Ming Liu (2):
  kernel-fitimage.bbclass: change 'echo' to 'bbnote'
  kernel-fitimage.bbclass: introduce FIT_SUPPORTED_INITRAMFS_FSTYPES

 meta/classes/kernel-fitimage.bbclass | 35 +++++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

-- 
2.25.1


