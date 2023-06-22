Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD35EB64DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:53 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.1232.1687401407025224043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=4Y3NN5UB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b512309c86so1258965ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401406; x=1689993406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VeqoWSksfDOprAEuvtqn0Ta5ysfihdWxv+40lqxS2Y=;
        b=4Y3NN5UBeZsacUZMkjKJupx7PKeX6CANPK03TjH509ChVrkiha+7Z5waTXAI6W6ebM
         TPbZ/DBFP0tbzZUCwWsewvAmlktFEpHrJ8FZgcbBndpxkJEv2CwL7xqrwOJOiUBkpBej
         R+ZU0Dnbk6Kv7Npq0ixMoI/O2fFIB3Tb7taR+W8NRqlXDG5tBNttz1w0eMx/Y4DVhCho
         EFpVKQXz/lBg39vvH6a3ILGRlUlhqshRVLougofwO/gXLAt1r14pbVh6TjPOIl1lY3t4
         p1FXf3l25FrItRwr9tfesnt52DdlQCH5bJ8xGAe8pkNrAfkHZ7mGcaKJmJisWfmakqz2
         hPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401406; x=1689993406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VeqoWSksfDOprAEuvtqn0Ta5ysfihdWxv+40lqxS2Y=;
        b=I89+0uhrqZrYvoojpGT+bsHU1YKy1knBC6EYDwHkliyO9+hMwDSWcukoEkPWEl4TmM
         /Bu6zF/Y1kwDQaFW40fu/SM88w0l7ykd++BjxW39F9Ui4XBoodgIrP3fFYnxP4Fdx5FI
         2g/xA+dY95KcRIwwnJWNF9nD2onzWJ7bgBHVR0vYoz3ve84CYrsSLszM50MOH376/CHU
         dftOu9PpCglcUwP9/dlQxH8f0/LyYooaplCWs2Q0YhCRf+bih6Ps28Rubf+CPt3wCv6I
         zByLbUYhgYv1h9Wbn70FqqvMdFK5Ekz9TNb0llPScEeEcOw2+QmmRpcuGq8ujL8OS/RO
         KVgw==
X-Gm-Message-State: AC+VfDx4mvjGX8nedJrdHL0Ldj+2BTb3+PrlsufgtiCkmYD8ipah/lue
	EFmUp4jfG4i7yxPrJDIvbyjWIpb5DWunOfOSlu8=
X-Google-Smtp-Source: ACHHUZ6TMHmp1c/TNIoNYFjeXF3/WR7p92CD+IT9fjZGb7NkqaryplaojPz18OiZxCmxh6KGuojzxA==
X-Received: by 2002:a17:903:230c:b0:1b0:236e:e5ed with SMTP id d12-20020a170903230c00b001b0236ee5edmr23742651plh.14.1687401406113;
        Wed, 21 Jun 2023 19:36:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 22/23] layer.conf: Add missing dependency exclusion
Date: Wed, 21 Jun 2023 16:35:54 -1000
Message-Id: <0bb0592f4c8de7aa192a940e6d06ce0c4df1637c.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183222

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a dependency which should have been in this list but wasn't, found
when debugging create-spdx hash issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1075b9fc5d562dada45b3187cb737511ff8c7376)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 948ded667e..2cc7ed8415 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -69,6 +69,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   initramfs-module-install->grub \
   initramfs-module-install->parted \
   initramfs-module-install->util-linux \
+  initramfs-module-setup-live->udev-extraconf \
   grub-efi->grub-bootconf \
   liberation-fonts->fontconfig \
   cantarell-fonts->fontconfig \
-- 
2.34.1


