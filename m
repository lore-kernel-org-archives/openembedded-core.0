Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BDFC44501
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:48 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.896.1783881820707523298
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=CrjrCkgs;
 spf=pass (domain: underview.tech, ip: 74.125.224.41, mailfrom: vince@underview.tech)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-664d7863920so2021411d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881820; x=1784486620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2on5WoQNL86V8E6GZk7fHZFXGR9HNiLzAIGKGrz45o=;
        b=CrjrCkgssUL3L0JmWF2prTYvasy2rzw7MCPKh1gNb/hl5Ig2CLCJknnyQAcstDuGwZ
         ttIVj+g+T6DkLtlW5OllMXyGPrS4ahxBaDZ7JpvbROUWlPWpJhmrEbdBqqitzCwAm9XT
         5bvDZKiMlKGRixY2+wkKB/uvAwprU4Bs8TkelhsAbuhesnTZqM1ne0j2AKIgP7SlDblj
         nfDXnR8A+TpMQLZP1vALsMy7oao5chYmrEps5mhS7oGTMG22TQ1qU9JeEY8pMh3ffOdj
         ZYHcRDCTf2EFrRABBdYpIk4DT6M5zXxOdk7z0wh/DxltAKNxT6tO9lSTC4nuyTqPqRh0
         1lrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881820; x=1784486620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2on5WoQNL86V8E6GZk7fHZFXGR9HNiLzAIGKGrz45o=;
        b=AVJ6Hm8w8Egygw9jzPhs+AobMSBd2WTBC+5niMdVdQikcpnmOwo8sMH4KLfeDjSYCR
         XXcL86lR2lJLSx/HWtx0ft+tPQ0q0JkpSzMW/8d+vsJVQbjS99d3ZkDQBf/BfInOYdFq
         iEoHYjIYTtdDxLkE8NhNQpsX22XlqdVZGMVKy7uHAVt0AeKq+24YOqGZUO74kg1GJbFY
         eYU14KVQshRdIr3N7gbBQ/47xZGzgbcWbF7xYnAMhjcP6yCx1Trz7zx0HgUSbfn2rqIg
         W5iS8hf6DQUvzRfQoCV5X5rNSVvZizia/BxGD6/wySqfxZcfQXYx07WWPLgakmLcC6ys
         HaEQ==
X-Gm-Message-State: AOJu0YwhLCueVy26p5AQd/Hi7rMofKMEqnnWeQBkwmrslL/ba1zHk2oK
	2hkB/XRBtZTOcJfNpaOGOI8iRkNSCTj0MaDAObizchm7PdgKFPz3Gr7GDRiVfxglXIzjSw+80H+
	6w1fNZt0=
X-Gm-Gg: AfdE7cllI6WobJNsOQm6MoKLBGDoMhcT/z2vqiDbhLIuP6eQV2tZe/wQBEGpkJXyT8d
	+e59iKTAboptOspFzxJzGFAIJ7ShsPOt+ipklQUk3OKOjm1B3/A1dLLE7uZkpXgqdsNS7K/NDyb
	JK8gcT3fkX4s7UFjJC32yZp0nk6WD1wgw/FJoIOR57B3qNRORdEAEnzc/cDEGg/1t5ZNMZZi4ye
	xnjasM2QcZxkOZi6GK/QPI6dqML2mJE6J7gxGBJjdh+eJewhOVTuvq2e/k9P+7k6j8QWOAwVUxQ
	9ka1XVXhaJuWybPFinAZ1yU3aInwTADBZEHG64PoBphK73sUSwRIRbon076+O0NQzxdHoz5tLm1
	fpnK+UwYV7WUCj2QkCbNnZX+uUSpb3w4f3qAKW9Q1EJ8bA2VMymB1V/xufvx2swSg46smMiyacT
	2xKJfKBGUHc8kp4Q==
X-Received: by 2002:a05:690e:d50:b0:667:cf87:583a with SMTP id 956f58d0204a3-667d7b50d7dmr3945566d50.28.1783881819783;
        Sun, 12 Jul 2026 11:43:39 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:39 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 26/27] make-mod-scripts: add KERNEL_PACKAGE_NAME prefix
Date: Sun, 12 Jul 2026 14:43:06 -0400
Message-ID: <20260712184307.3259642-26-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240816

get_kernellocalversion_file relies on hard coded
kernel-localversion file. The kernel- prefix changes
when you modify KERNEL_PACKAGE_NAME.

Update to account for the modification of KERNEL_PACKAGE_NAME.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 4b0630313f..c5d51411aa 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -21,7 +21,7 @@ DEPENDS += "gmp-native"
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
-KERNEL_LOCALVERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
+KERNEL_LOCALVERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}", "${KERNEL_PACKAGE_NAME}")}"
 export LOCALVERSION = "${KERNEL_LOCALVERSION}"
 
 # Build some host tools under work-shared.  CC, LD, and AR are probably
-- 
2.43.0


