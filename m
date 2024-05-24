Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDD2C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 15:18:42 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.18543.1716563921616007723
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 08:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Csfw80oY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4200ee47de7so66600065e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 08:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716563920; x=1717168720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I2lBlrCelMFUe5G2Gc2qYP4oTiZqYCVml+KISGrIqOI=;
        b=Csfw80oYzDgBRECgQnsmVvkszKvEvYpsnYigLtnfNgobxDd9JVGheB6XSFC/dNRCmi
         2e5pyrJFJ9qLUvYY7dVEKWFeHF4pvTy0DDh/pv3drmr60A3/2jFpMFY3CmJTJr4yfbDK
         bdCYrp235awmRYyZGyJoWwmcsaD2DDFpVYHJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716563920; x=1717168720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I2lBlrCelMFUe5G2Gc2qYP4oTiZqYCVml+KISGrIqOI=;
        b=egkIoh9gHyWObRFJkAulwIQmiTorA4cKuPPlBmcG4XFJRSLlAnPgONyGoMxQCjIB/8
         MpAuORMtOaw2f+vdig/5EL3gVyi38fquXt+nBx6vOMDZvlLCRejEeWW1v7L9QA6IEHyv
         jmJUeiT6XHAGs+VfsQGYKS18lDB2sM1AhHbre4OwV5jQ+F7u49UiZmWXfiNDXf//4gJb
         ND6uKuwl9dqxvEqVFk/zB27ozaouCyfvTS6+NtmtMobtTVf2yfwxCP0UUb72C163Rk1i
         Rr+5A+UR2ZPXCR597sj8OwE6PUo26zMSGEI6Fh/h7xCswpwkWWLP0PsKflrnHUc805jY
         QrKw==
X-Gm-Message-State: AOJu0YwtZi8/bpZmKrVC7Re2lrvbOuFI8wqUb83vehtOufHdzzfS2iln
	hretKAjbEk38gXKEQrgIoTh/ZrRqeiLF59Aknd9N0N1i4jo9+Y7fvpwXT3XoPNlkpIeOpb8RruQ
	q
X-Google-Smtp-Source: AGHT+IF7YiinO2AzLJXq3tVp2JYIbNpUsLvSpK2S2OLAQQ5Ltt9N0oljAD6pRoGJmmisBecbU57rcg==
X-Received: by 2002:a05:600c:5808:b0:41b:dca6:a3fa with SMTP id 5b1f17b1804b1-42108a27c03mr19396845e9.39.1716563919874;
        Fri, 24 May 2024 08:18:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9ca4:3686:8521:57da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100fb99e8sm55814065e9.43.2024.05.24.08.18.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 08:18:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Add os-release to SIGGEN_EXCLUDERECIPES_ABISAFE
Date: Fri, 24 May 2024 16:18:38 +0100
Message-Id: <20240524151838.2450718-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 15:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199852

This rebuilds whenever DISTRO_VERSION changes (i.e. any commit is made)
and systemd depends upon it so lots of things end up rebuilding which
isn't necessary,

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index f2bca0aa5ba..65eb657fd93 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -45,6 +45,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   ca-certificates \
   shared-mime-info \
   desktop-file-utils \
+  os-release \
 "
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
-- 
2.40.1


