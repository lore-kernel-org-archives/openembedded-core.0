Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE451D13562
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 14:12:23 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.30239.1730038336372895015
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 07:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vd/OaGwZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso32561775e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730038334; x=1730643134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CwicXKfpappJbAEuYVkYaLKyyBU3Ha4QLN775uKPrNo=;
        b=Vd/OaGwZF2SVLm9Q4JQnzc5VCTb7LvfKpUTiH5/mfC+OSy92I4IwsaBKz6WwVA9RDp
         1VUfBKF7KPaaVj44TwKdB4800WxJTCb6uF8LSfhrtxip7oHvBOZcl1LD/xEwnQYj7VXw
         74LW6Nqj47xnIg1G4HsAeWuNZKxswAXc7b5gRmFgO2c1XzYT3/X1e4ON/L5RfsyAEtI1
         xuJGzmki04u22cBZZiv0NZSwoM1m8PVz2fGR40JtFYMSwy5Y1JJkrVid2c9XJ+nre64x
         kMh7Bhfbj53mXtcsbvc0Dgl81sCpLnkmdxATqRmqzJxcNxeuWDdSdy6AxdQx9pZcvuyU
         hbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730038334; x=1730643134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwicXKfpappJbAEuYVkYaLKyyBU3Ha4QLN775uKPrNo=;
        b=VbBkFkhnxogOcaHYZVGUotEfRhQDzgvx54npbu5ut03g/ra2L8HGSvgh/9V4l5t1NR
         99U02+/p25meYUYGaj0XCmI2Ob7n/LlTxJVm+4ZEd4dMQKeH6jlZ6t0qpfTHGoXQKrsN
         BP826JrV2tRCjImSPvwGrVTRMc+eVVmFcDIUUgbbmlDtS4adZN13hdnLAU++HED3fH/G
         QPRbWyh5BPAa0PYvztiM1TVLfQdqg77daMUCkq309lBn4gilOORjlQNlPZwXFzNJbiX+
         +HV9gxnbaQHkapdfhYVqHKqEezZ/bJbSmLxwpZlV+5h7cqTvtvcY89aO9otIDPpd1nIJ
         dhZw==
X-Gm-Message-State: AOJu0YzYmi1gCD6CDDMKbDQPHrwFLvW1sKEdZcot2TNXk2WKe8543m2B
	PF+NDqD8+8jXBlnBtETpRglOofTIj34s1fNhWGszDxhtzKRAagV+NvinOA==
X-Google-Smtp-Source: AGHT+IEBKkeGYhTRGVDt7/JfDQXN/T0g+nyJ4m8MTro1CaZlsIpfPoDFgIA7RQeSxZ3iegHel/WPJA==
X-Received: by 2002:a5d:4ad1:0:b0:37d:4a21:c754 with SMTP id ffacd0b85a97d-380610f4d5fmr3930714f8f.2.1730038334388;
        Sun, 27 Oct 2024 07:12:14 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193594ff3sm76307875e9.12.2024.10.27.07.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 07:12:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH] vala: add -Wno-error=incompatible-pointer-types work around
Date: Sun, 27 Oct 2024 15:12:11 +0100
Message-ID: <20241027141211.2891395-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 14:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206402

* to allow building vala-native on hosts with gcc-14
* we could backport:
  https://gitlab.gnome.org/GNOME/vala/-/commit/23ec71b1a5c4cead3d1bdac82e184d0a63fa7b79
  which is already included in scarthgap, but that's big patch doing almost the same

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/vala/vala.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 162e99bb03..87d8fedc3f 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -39,6 +39,10 @@ EOF
 
 EXTRA_OECONF += " --disable-valadoc"
 
+# work around for vala-native build with gcc-14 instead of backporting
+# https://gitlab.gnome.org/GNOME/vala/-/commit/23ec71b1a5c4cead3d1bdac82e184d0a63fa7b79
+BUILD_CFLAGS += "-Wno-error=incompatible-pointer-types"
+
 # Vapigen wrapper needs to be available system-wide, because it will be used
 # to build vapi files from all other packages with vala support
 do_install:append:class-target() {
-- 
2.47.0


