Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1FFD60D1E
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 05:03:57 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.13989.1731992629816351609
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 21:03:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TMpvlLmE;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so429105b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731992629; x=1732597429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fmkpqxwXLNwKD3E7lZEz0KgmpG2QRIi5O7mnPBneL0=;
        b=TMpvlLmEwV1Koj3LLUSyEpyQZvcKrVVtVQ4arjeEURNqdwxbtDhyZPs3iuTanOHVj6
         43szS+7d3sTbq41B4CoJDWtFvjF5AXEJiRsX7K3hB/pkdS/fLzNsoWoX262LJ3dTiThn
         TrOjIdDGfGccfnrb8w1TyPWbF7w5rVAZijIt9i/HMEW6h3qwZuUqJomIS42hMvL+9NFj
         gV2jDM5OrG60y8IUojZyONtzoOWmXClcWQIBwjf7aFWYKL9nJ7FOdLVdTpqOvii9cUlJ
         egnySl/++lft+r4SWaCGz8+KNDyFlNOiJupkaOzMZh3B3Bax/pqML3iWm8iGuwFwBbBu
         c6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731992629; x=1732597429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fmkpqxwXLNwKD3E7lZEz0KgmpG2QRIi5O7mnPBneL0=;
        b=voVsaeQ1Ua4aDmWrGo7hRRlQ+xHDHFZpuR6W+Kf3oe64rOYHYJnjSYVJoZRfLGPeR2
         So22xYeuK64gvB44NDTokv+F+YaaUz9B2qpl2l24HbNt+YSqs/TcTf41maynFXXbqLLs
         xFDF4+gYCbVTrnE/7X+8CKx3xwrU3pXAYTwmPdYvU4MgRJceXZ3K6pn8I70+6X23ii75
         B5KZN1i4tZa7lZkXaF2rT3ILjX5mnHFzJTOfIoyELuSO88bIODvroXW1IktT5AJnQr4u
         yVA+pqo8hY0sKZLAonGB4nDBfabD2phBgfDt76H5YzYp7DT2NYSr+44K9MxVotcHwEjc
         i2NQ==
X-Gm-Message-State: AOJu0Yw1zps3CSSNhbxsxhWOV6Qtk2gUSiceL6kRNWdHK+hhNcUDI7y4
	AKXezGZ6xcyF/fMvLd75+ioeC8xFQRm1/kz3slw8O6nPQwabO4pDN7RTWw==
X-Google-Smtp-Source: AGHT+IFZ30s8nNxN779NPgDS+raRsSlNzQa1mUXxm7dZMmRfvtU4EAxi5N7WPrh3Ko35gRSqn0A3Rg==
X-Received: by 2002:a05:6a00:3e12:b0:71e:7cb2:57e7 with SMTP id d2e1a72fcca58-72476b96c11mr20723332b3a.10.1731992628688;
        Mon, 18 Nov 2024 21:03:48 -0800 (PST)
Received: from kamensky-p15s.cisco.com ([2601:641:8000:93e0::1731])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770ee8afsm7346324b3a.23.2024.11.18.21.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 21:03:47 -0800 (PST)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH 2/2] systemtap: add --with-extra-version configure option
Date: Mon, 18 Nov 2024 21:03:01 -0800
Message-Id: <20241119050301.4197-2-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241119050301.4197-1-victor.kamensky7@gmail.com>
References: <20241119050301.4197-1-victor.kamensky7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 05:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207377

When --with-extra-version="oe" option is used, systemtap code
stop using GIT_PRETTY_REV that comes from
'git describe --dirty --always --abbrev=8' output in its version
and uses --with-extra-version value instead. 'git describe' output
has reproducibility issue since it depends on commits present in
lattest branch, and that may change. Thus using fixed value instead
addresses systemtap reproducibility issue.

[YOCTO #15288]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15288

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 68f5c76428..7c9cbe0da0 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -17,6 +17,7 @@ EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
             --without-nss --without-avahi --without-dyninst \
             --disable-server --disable-grapher --enable-prologues \
             --with-python3 --without-python2-probes \
+            --with-extra-version="oe" \
             ac_cv_prog_have_javac=no \
             ac_cv_prog_have_jar=no "
 
-- 
2.45.0


