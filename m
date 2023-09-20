Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09500CD492E
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:44 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.3197.1695249096279416532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zhuV7s34;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.46, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6bdcbde9676so221137a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249095; x=1695853895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAVQQpMn935v5ASUG11jKhYxXZH97PQBs2kUKh2VGHU=;
        b=zhuV7s34nFttIUPihTRkikQgy/LTQIJSTC+P53p3/vAWwpDGPil6nu2o2hmMujFVFo
         oOyrntv87uklJNsDIR6+iwSMG6qt3PzlkfU+b36CGBvoT33tNOi9n74D843YSEgbvEGJ
         6PEMMdxrsL/3tRzLtHbVFGYnx+DlDktkyAWWHJaWeitfyPOF+09lf7P4/AHVhZ8Ioquj
         OqyTTgzPDCmxm/AcqGrbJ8MaOw4A15VpltVIaetbCPIEfDyPy3L96p0VIc9JC52deA8B
         bKkmimHXzm7OTICt1nqq6E0fF2fgPDcNISTKZtMCXZdDwMX2GU54qVRSCt9TMNcgaBk7
         nw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249095; x=1695853895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAVQQpMn935v5ASUG11jKhYxXZH97PQBs2kUKh2VGHU=;
        b=c6cemdnCehe46DcnaZi6boBN4hjuIZzSfPnX4PbgfYVUNCcUg1Me+6wMw5gVpJTXrY
         q2O0uDODtuW+Vg+eZQRX/6Wr4L3TaakZc8IPnq6fMmFGRz0rFTiODChq1dNBFtV9j9sj
         5k7nPtV6OGVcVQ/eP5Qlo1USanuO1i00TT10g5IWXJKrgf9biOwC/Z7YY6qLFwJkM6ok
         gvjeeL3B9MH+OnuRk2mMH+cObie2AjTyxmB9FbJHZSZPVywkr9Qxrljy6at5XoAAQt51
         4fVI9wX17QwEhPV15WZpzvAL0LBjNfqtgIkafFLcrRShMWROayb4Dde4Z8G/gwAjXNne
         miRw==
X-Gm-Message-State: AOJu0Yw025KqaetkY/YSh3mEvPWo4SEUPgo79hxapEv02k9rSvWy79kM
	bllOx05xRUWr8d7bwHQa8qWC1Bvac/vM1Gqw70k=
X-Google-Smtp-Source: AGHT+IHLTRTjAVw+2lymy6N+t+E/Ou9pWIYtm4wQUrcppikCmhVTMxQ+jzrjxJuiDEmBkq4TMSP1pA==
X-Received: by 2002:a05:6358:2787:b0:139:c7cb:77b8 with SMTP id l7-20020a056358278700b00139c7cb77b8mr4738926rwb.20.1695249095146;
        Wed, 20 Sep 2023 15:31:35 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/20] wic: fix wrong attempt to create file system in upartitioned regions
Date: Wed, 20 Sep 2023 12:30:54 -1000
Message-Id: <af9f392a5e259b681077f25fa263965714a73a05.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187965

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The kickstart parser defaults fstype to "vfat". This leads to an attempt
to create an empty file system even for regions configured with "--no-table"
if used without fstype when no --sourceparams given.

The fix tests for fstype "none" or no_table in Partition prepare method.
This will omit the file system creation an the potential error for small
region with --no-table option.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db771a4cd36bf291a8b68edfd905e03243f2c8b3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index dce5d1485b..5275da6ed3 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -132,7 +132,7 @@ class Partition():
             self.update_fstab_in_rootfs = True
 
         if not self.source:
-            if self.fstype == "none":
+            if self.fstype == "none" or self.no_table:
                 return
             if not self.size and not self.fixed_size:
                 raise WicError("The %s partition has a size of zero. Please "
-- 
2.34.1


