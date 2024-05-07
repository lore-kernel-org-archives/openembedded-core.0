Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46347C25B77
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 01:15:11 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.1089.1715044503576135153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 18:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fOErk+za;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2b37731c118so1983123a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 18:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715044502; x=1715649302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS8Ng2ILnd/moW06hNKZoPQzRtfOgKrme3ZDRhA8xTg=;
        b=fOErk+za8M0uAqRxbxmTnFB1T1zAiLKlm/gmeqAdkTd8/S898NpY3zcNuiZG0j99kL
         Z0+63lRlOEcnQKnCseVdlyh2ahU09ItPLya+m/Th14jueIWYOasuOHSx3lR8Cobpi6Sc
         Zpaoed06LiaiatdUSMbkF7XGMuujEADSBfXwb5ReJ0qFVLMduqHyZNFvFh3vYZXOxNRQ
         fZedsxb7dXXG72/Yt+MRG9jcl/7koBBYoW9vkStC4VwSyXRTTKWm4r51D5QJX2hd8nQl
         vj6PCwdp/iXRoCabWVLl10ajXxSwxW7ZyElahJbMnnYaQe6mDUk+/dqoik5Akgg+GImq
         q9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715044503; x=1715649303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS8Ng2ILnd/moW06hNKZoPQzRtfOgKrme3ZDRhA8xTg=;
        b=w4nODQL3lJrEJsuRf39FG8/J95+0bDKoKFqeStOK9KBFmQ/3grg+mUfifGOdJpeSHR
         vzTI7LD/tIVQwPU+VmWouAVwyziYU0GqXWRkWDAbcdgr+9J1O9vOtWVgFHXL24ZoeEhy
         KbEVaKViKnJXdBC4KhkofnqosuMUsl16UlK5Ff4zJtb1PQV5xIq+7m1x8zk209LvL+9T
         zfXd3x1Yjncb6ImZzrNh5dzIdjkSmiqz/k9Wm6lc4JQt23CzLjRiTecPosZilhDYCQvO
         /XySgb9sP/vZe0aBfro7a3Z+5/12+7QJNacf/+DLRnviRuK+5CfyQChXtqpW73rB7PN5
         YM2g==
X-Gm-Message-State: AOJu0YyqeOq1HWpIYxzUclWC9R5yWzbsPcpuGxBVDqaDSCdLHWqj2YY+
	2b/UI1Drrmuzr1OqsQZYVAqx/NmOjIf003NMTjKnA0Z/LbHahfVVQ0Iv55cq
X-Google-Smtp-Source: AGHT+IHOHu3TM4RMsIb2rX8Ye1OVq5O3Lw2ii2l/3S+kvzLeetZ0wOHi0rJfWWzwW3KgFVdW9ZVRvA==
X-Received: by 2002:a17:90b:611:b0:2b2:7c42:8312 with SMTP id gb17-20020a17090b061100b002b27c428312mr10063771pjb.43.1715044502336;
        Mon, 06 May 2024 18:15:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902d50b00b001eb2f4648d3sm8830898plg.228.2024.05.06.18.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:15:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 05/10] p11-kit: ignore various issues fatal with gcc-14 (for 32bit MACHINEs)
Date: Mon,  6 May 2024 18:14:50 -0700
Message-ID: <20240507011455.313230-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507011455.313230-1-raj.khem@gmail.com>
References: <20240507011455.313230-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 01:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199052

From: Martin Jansa <martin.jansa@gmail.com>

* these are reproducible only with 32bit MACHINEs and probably related
  to time64.inc

* http://errors.yoctoproject.org/Errors/Build/183154/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.25.3.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
index b7ebd44abc6..2ede38deba2 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
@@ -32,3 +32,13 @@ FILES:${PN} += " \
 INSANE_SKIP:${PN} = "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# # This one is reproducible only on 32bit MACHINEs
+# http://errors.yoctoproject.org/Errors/Details/766969/
+# git/p11-kit/import-object.c:223:62: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
+# git/p11-kit/import-object.c:229:70: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
+# git/p11-kit/import-object.c:264:78: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
+# git/p11-kit/import-object.c:223:62: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
+# git/p11-kit/import-object.c:229:70: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
+# git/p11-kit/import-object.c:264:78: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.45.0


