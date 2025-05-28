Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBC7C5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:33:50 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.928.1748446421675991767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 08:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GoNwL2Mo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c9563fafso3447372b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748446421; x=1749051221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMXW42mfkE47FcIkm94wtl7KuTlhnYNRBbhjoltTaoc=;
        b=GoNwL2MoV2P+g9VyvFwK3mTa36wcTNHV7AGkcR0l7tyQb5QL7kFUXZLNGc8PWTct/B
         My/UePz5urFx5reKVbHpyC945th9Fz3/LtP7Cp/HnsZH89JwqrQ/cct/pZTeP5TszmiV
         hhfJIs7tWIAYbhecqg582x/wdDbzLLVnD00ng4Fr1TxpjFZRBqxQMzBud7+zV1K3W0kV
         4LU/ZJMpOcCIv6rcNKigYTp2HajGN/nnfv+6aU3b2KkPAFbC4VGqVYGQ87+OON3ars2F
         xYUiuTJAknK0CBKlPVc/6xY8bWC18/1bxtOSkSRabXi9HhGw8PDToLj/c9K+c9NLH/lb
         zW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446421; x=1749051221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMXW42mfkE47FcIkm94wtl7KuTlhnYNRBbhjoltTaoc=;
        b=nLn+ohWjZ8s7hYbVxkhGBE54fcegdpIz4QZ8RzYtJzP+cBy0RXQqFaLpxy3e+y2sbI
         P1jlpsyzsWZ8eOhNO8fHwBF8cdr3Gu5UgW1pT4G+EFcVVkTt7IrdDkCVEUFMnthaYtXV
         Ihqy60GN/jP6OBwOF4saWpeSm/cTPDsv46xwXTNzROf5Zw9CzxrGm5hOiIRgOE4+PXKJ
         aaAdqE48QksH4l8msiPc6zpqbukSm1Kv45bMeqycSeCggP1kt0I+DhMuZTlbMAjbqkg8
         BTEy5H9z27XIDWmFj6mhjOmtl7DX5xvnPE0k4p1UoduhocME4rT7aQe+6ftrf67Cwdh/
         rIoA==
X-Gm-Message-State: AOJu0YyPg3BCj2xVQkF+CFl6OSizMDD3Tg/2oKjBeA5GYqGD6mRdRRdB
	tCDnHQqetVqQYskv2SQT/8jFBoZq86er8+BU/dNVEEQFRzjbQAiaQ2ayFrqwVX5iw1w95MO3jJD
	XaZjE
X-Gm-Gg: ASbGnctP3N2hak9khhJ+iSdEZj4fjf+TfrsoRgxcUEZNOcQan3BpOy9O2ziWoA1uJ+1
	bdhHtXtxhcGutYlRqnTQi+nWU+TLYpXudu7l/N8e+v38j180FGS/C8KZ3HVISu1WwxLJDRz8hO7
	TMEQjQxi4WajBbjFCL1b2RgdZ7KMWt0+4Ota4yc45VvvXg4fyI4qpK4THp8OKBWxNrdpBCpxhRn
	dKNKUD4EeKsBcBtY1l7OsqIc58fIZGgSzvHuge/BYcR4eWsVYlTwHEQ2j8PfgrEmoOhFEBhV5m9
	mR+mPTWD1ny8PKVnKF8CRU0gLdO0p89U8EYW/hQ9pjI=
X-Google-Smtp-Source: AGHT+IHwiSIwoHrRMxJvyQnBKsfFahy7XUGsrGc+2cJnWAlUEB/iyVgXczmbAa2GzkK3eXVMsTpmJQ==
X-Received: by 2002:a05:6a21:9010:b0:209:ca8b:91f2 with SMTP id adf61e73a8af0-21aad8349b6mr3990718637.19.1748446420936;
        Wed, 28 May 2025 08:33:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c1basm1400268b3a.132.2025.05.28.08.33.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:33:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 03/14] sqlite3: mark CVE-2025-29087 as patched
Date: Wed, 28 May 2025 08:33:12 -0700
Message-ID: <a9386d9f3f4f5256dca2eee6355e3cc74d77af1d.1748446235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748446235.git.steve@sakoman.com>
References: <cover.1748446235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 15:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217367

From: Peter Marko <peter.marko@siemens.com>

Description of CVE-2025-29087 and CVE-2025-3277 are very similar.
There is no lonk from NVD, but [1] and [2] from Debian mark these two
CVEs as duplicates with the same link for patch.

[1] https://security-tracker.debian.org/tracker/CVE-2025-29087
[2] https://security-tracker.debian.org/tracker/CVE-2025-3277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
index 8264d4443a..60da0b773d 100644
--- a/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
@@ -7,6 +7,7 @@ Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
 FossilOrigin-Name: 498e3f1cf57f164fbd8380e92bf91b9f26d6aa05d092fcd135d754abf1e5b1b5
 
 CVE: CVE-2025-3277
+CVE: CVE-2025-29087
 Upstream-Status: Backport [https://sqlite.org/src/info/498e3f1cf57f164f]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
-- 
2.43.0


