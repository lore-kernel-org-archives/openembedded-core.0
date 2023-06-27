Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB906C001B0
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 10:17:46 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9556.1687861059928002312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 03:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=U+h35kMD;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3113dabc549so6082925f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 03:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687861058; x=1690453058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMvObPWdIlJ/z/UjnpYHvcV1jsMLsogaUYeDmRJDyFo=;
        b=U+h35kMDY2Ohu4T6ZWhC/1LYOeGLzdl7l7U8b6niutF3vGME/4+iAOOor25G8lf5bg
         yJ3VxlkgGqpb/IkLGxEJLYGisNk24wncUG/6tKcAGRaATbqlvKF1DaqLveNRCArNleCY
         cJxx93aZFHdMuEGnKHVvTSYJNQrrAAR8bNVqI1zK7DuOOdl0+FKKboVNEMGTpifXGrbZ
         AhNS++++IhpBImf3P1FBxfuHafbF04xb8+4OyuuPTGnRZYE+LeoKcxxnhRYVN3xZnlnf
         oNypicWQ4L+eDBxXNB5BYucSXwwML7USIkrVzjLt4bmJOTYtKtDgA8eK1MCKLXFO2nD2
         dEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687861058; x=1690453058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMvObPWdIlJ/z/UjnpYHvcV1jsMLsogaUYeDmRJDyFo=;
        b=V19o1oNkzQbtTQbQ+ayVOd7DrHx7t4vgZ54u7xDL4uNMtHViQkr6St3vWgjqDZLLU0
         Z4dL8f9JKPhIgof5SkcRJcM4IflGDzjBhMC2cJTTc90SPr8OET1Vl+PEa8GBQaLyN/X4
         zEBUg8kjGkIYuIlK87QTy08fsGvyFATt4fFxgF6VG0txWEzB8IycEvCzjJMriqYlufnp
         6c2zEL9MKyoCPFZ/jk7sBDrbhXxYGIYe1s6UmrMB2s1UKmXpOr3HftqzsJSpw0TkiKoZ
         Anhe6Ku++4DHnhczPBYs4gBGov0XYeBJAjD/GNVYFEH9jLUjBewRpRDT2hGa8D/mVMW4
         H7Ww==
X-Gm-Message-State: AC+VfDwHu+s5RcArhnckBsIm6B/pjEoz8/YuVjLiCUJJg0hwD37ycVPX
	3FKgFBjo2V3ZZf5PF9h3RtgWHFsF5Th9eg==
X-Google-Smtp-Source: ACHHUZ4BjkvVe14KnS7FqjNStUtCDJi5MsLUcz9ot9uPs0kyKfqFUXNfFS1URq62kxfEu5XC6nSHgg==
X-Received: by 2002:adf:e801:0:b0:313:f32d:cf96 with SMTP id o1-20020adfe801000000b00313f32dcf96mr5531255wrm.70.1687861057936;
        Tue, 27 Jun 2023 03:17:37 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id s6-20020a5d4ec6000000b0030ae849c70csm9961436wrv.37.2023.06.27.03.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 03:17:37 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH 5/5] init-manager-systemd: add modulesloaddir and modprobedir
Date: Tue, 27 Jun 2023 10:16:44 +0000
Message-Id: <20230627101644.881715-5-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230627101644.881715-1-jose.quaresma@foundries.io>
References: <20230627101644.881715-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 10:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183483

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v5: introduced in v5

 meta/conf/distro/include/init-manager-systemd.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
index 7867d90028..4989b93502 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -5,3 +5,7 @@ VIRTUAL-RUNTIME_init_manager ??= "systemd"
 VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
 VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
 VIRTUAL-RUNTIME_dev_manager ??= "systemd"
+
+# Use modules-load and modprobe config path distribution specific
+modulesloaddir ?= "${libdir}/modules-load.d"
+modprobedir ?= "${nonarch_base_libdir}/modprobe.d"
-- 
2.34.1


