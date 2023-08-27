Return-Path: <sveyret@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6ECC83F10
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 16:42:49 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.1184.1693154558808102076
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 09:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dG5w+fVH;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: sveyret@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-400e8ab9325so8027925e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 09:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693154557; x=1693759357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=luNsGtM+/nwKBS1a4ym328mMJfKWDF1QLhUouaKejZg=;
        b=dG5w+fVHlj6H9/J9GFyiCkiqTNUnisG9iPlMnAXaCdZGpdFaxBDX5U4+XOlIKMLC3q
         YT19GoVdmrldzAZ/iM5rrAKmq3W32SiviyV26ksS8niH7tyyxthvKpuwwqk9wGV4LvQ7
         VRvRc1wN4mI/w9D0y6qKC7WUDtVEgW+Lj9B7A3Y5xjCh68wFji2RNwzgFRfq3OIi02bQ
         DqSPvOcqdKL9pNcyR7iAyW8qem+e41dGDwmJIhYEdBgb6RX6DMs+0HrihMGmCW9vHu6J
         WktTjziwDp1Tnc9fqxlr+yH4xYpJkBkcbFyR5BRP+tAa9KRufOvHX6C+W/Fx8VDemsj9
         W67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693154557; x=1693759357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luNsGtM+/nwKBS1a4ym328mMJfKWDF1QLhUouaKejZg=;
        b=cg+MDSYomaZ8uZbdUnXvtu5TQgmHXRZLfbHgCkgKUM53Wh+Rqq2mja2rPhkzqa9NmE
         hEX3ACPkVnjPmXvnM9ifuz/RDceskXC8g3VgdHo3jj5B0Za+OZ9ElnX3YoshsCrNQC51
         thjSkAUOODbFDBBK+9s178zJ0+ihcdAvzx4LOomzuZZNfS/rIgfRWDkZrxSgRZK4W3Da
         DGciAYG+kKLkyM0aNiaT3w927cDixrA6Vow3d+exQJCveddasSjxbsIMKjFJD+ZqP6VQ
         aMamrPd6pno3h/im5mMDGXMRmBPvKlbOZR4y2138GZjlov8EqG3ERR/nm9AxYJ7R7Srq
         MOTg==
X-Gm-Message-State: AOJu0Yz2EoHxMzgpTZmya4bpCsdOTBuRkzvcjpTVkJ0Q9f7Au5mU0BRj
	8vI6TFAjVDpWVyVGiPyrS0VVcZIAc1s=
X-Google-Smtp-Source: AGHT+IE+fUkNha90lLD/KQYRKqgY4xRC6Cmbcw2uTNf0Aw9f/rD/eHduMtuKejqcSL04hjVFZBHIzQ==
X-Received: by 2002:a5d:65c5:0:b0:319:8dcf:5c10 with SMTP id e5-20020a5d65c5000000b003198dcf5c10mr16882543wrw.6.1693154556906;
        Sun, 27 Aug 2023 09:42:36 -0700 (PDT)
Received: from buffy.int.neptura.org ([2a01:e0a:3ed:3de1:ef11:32d0:af22:f04f])
        by smtp.googlemail.com with ESMTPSA id y1-20020adff6c1000000b00317e77106dbsm7951800wrp.48.2023.08.27.09.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 09:42:36 -0700 (PDT)
From: =?UTF-8?q?St=C3=A9phane=20Veyret?= <sveyret@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?St=C3=A9phane=20Veyret?= <sveyret@gmail.com>
Subject: [meta-oe][PATCH] volatile-binds: Allow creation of subdirectories
Date: Sun, 27 Aug 2023 18:41:23 +0200
Message-ID: <20230827164122.17735-2-sveyret@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 16:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186778

The mount-copybind script will create the parent directory of the bind
mount if it does not exist. But actually, if this is the case, the
service will not even start because of the ConditionPathIsReadWrite.
This patch adds a "or" condition to allow the service to start also if
the parent directory of the bind mount does not exist.

Signed-off-by: Stéphane Veyret <sveyret@gmail.com>
---
 .../volatile-binds/files/volatile-binds.service.in             | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
index 52384c8264..5a0055bec3 100644
--- a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
+++ b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
@@ -3,7 +3,8 @@ Description=Bind mount volatile @where@
 DefaultDependencies=no
 Before=local-fs.target
 RequiresMountsFor=@whatparent@ @whereparent@
-ConditionPathIsReadWrite=@whatparent@
+ConditionPathIsReadWrite=|@whatparent@
+ConditionPathExists=|!@whatparent@
 ConditionPathExists=@where@
 ConditionPathIsReadWrite=!@where@
 
-- 
2.41.0


