Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41566C433FE
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:34 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.20380.1637901393833376073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eVKIRWuI;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id x5so7770745pfr.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QoU9TfqkFEx3cdVlUfxScpbz7MVNaMf6r0f9bzwuouU=;
        b=eVKIRWuIrswnZ7ZctZiZC7/ZE/eLJkzbmKw27zKVfcvX2WIy5KSROwpJBvEoYe7VWp
         7jQUHe7QMwPOPKSNbXwh//n5IJncDxZCjcugwHpYQ/Mrn8yQDSTXeB/UoVjR6JpbjTik
         hCVgV8NRvdX9KexUY2iQjEYBi82nMxifmxGW4x0+BQa/0C9XOo3AlRiNfOrrWSUgWYg3
         kRowAsG29M9gOHtjFZuRy0WFZy9/G8v4+HJsQZsN7iYChdZTToHX3Ovz67o0GGAUTCVf
         NS85oookB++bI/srvW9/XSubluZTpUZgAdthzYlkjLx1yA5Cr+lTFfU4k5mmCF5hx3wm
         Ldkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QoU9TfqkFEx3cdVlUfxScpbz7MVNaMf6r0f9bzwuouU=;
        b=vUU5LdaNTL1xpzG4OUF05oiOzKUjOmxfU1gm9uvqJWLXYnNnkUChMt0jAPDgCkPmf1
         CkUj9tFzDR5o5fSVKr/iA8vSGfWSjTenp/+yGCyzQrg+FI31XBMWYl2o4TDh3pCzMXUc
         NBSh27nj56iAjlBJjDmCgd0wrwLpIzTy7wwicmD3iZKkwc8qQjybBb+spVcvzE2AKsRK
         SH09xqwsjoQwZxy6psXLw3OBsCn+VN9EL43vOLncfgw8tPGm6k9qbBqzNQc1VNUh/Emq
         zfLKPjtkgDcY2Guy8liQXvt2PVbVawospeyGk9WhtDkdspED1xXqNa8pG6b46DjadFIN
         sibw==
X-Gm-Message-State: AOAM531K4bcugRFNNcuu/tBs+63fpAUTVIHfmGRLGG1OIQ/K3KKFpRfH
	Rc0t3gkWyKJF1qJs9bH3Ww1Cz6o0oXk=
X-Google-Smtp-Source: 
 ABdhPJy/LjZcGJk+lnGr4IlngwEG7ozs2r22JxPXjpnYyyQVnQONHJHI9aWxuJpPcvTSAaO8zf01Wg==
X-Received: by 2002:aa7:9acc:0:b0:4a2:b8b5:8813 with SMTP id
 x12-20020aa79acc000000b004a2b8b58813mr18849798pfp.4.1637901393203;
        Thu, 25 Nov 2021 20:36:33 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 22/26] dnf: drop python3-disutils dependency
Date: Thu, 25 Nov 2021 20:36:01 -0800
Message-Id: 
 <9e4370858bcb3f91f2e013911d92b32be09aec23.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158818

Upstream dropped the now deprecated distutils:
18995d65 Remove distutils which are deprecated in python3.10 (RhBug:1950229)

Usage was replaced with sysconfig, which is in pyton3-core

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/dnf/dnf_4.10.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.10.0.bb b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
index 6ff2a6b1e6f..3fc24b132df 100644
--- a/meta/recipes-devtools/dnf/dnf_4.10.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
@@ -38,7 +38,6 @@ RDEPENDS:${PN} += " \
   python3-netclient \
   python3-email \
   python3-threading \
-  python3-distutils \
   python3-logging \
   python3-fcntl \
   librepo \
-- 
2.30.2


