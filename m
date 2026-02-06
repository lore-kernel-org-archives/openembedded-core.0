Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19085EE2090
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 10:57:12 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8843.1770375426336242281
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 02:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G4bDU8mj;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso374972a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 02:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770375425; x=1770980225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcMjXYaujTKolTPFw6o91qxRM3yVjMPueazzorFhIUA=;
        b=G4bDU8mj7rn4SCdri5j/jntAFLTVIIEvZ3/cK5DqPwT0qpd9CwppA0cArO7c2W20Gs
         wJzweFflYMsOnlNK4xKaCgO39Ps8srnNCha8w78WWfeJQLF9REghcungaVdHEBL7zxvK
         E8zQlP7eiQAGCI2prRLzNPc0sL3QAyISVXtO290iwcUv4uuYc8n4G8i8c4hyd2IYIpZa
         bWBwf82i9CgI3IKmuFf8MiRuamHaV2YXaSHXU/1sqoftuGU7Sx3+ZGQRBZyGnigZt9oj
         qmFXFOiiWOaRFbAzSaUqVK47tYGNg8riGgsWbyt5+N8YJIiW53T9hgodPm1RpoKNVcr8
         i0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375425; x=1770980225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qcMjXYaujTKolTPFw6o91qxRM3yVjMPueazzorFhIUA=;
        b=U7C4glJ0yWBekjP25aXBvBIBN41M0Qg5lAtqOBhmUDekzNO7yK/dKsNnmEUCU44wx5
         dQkTRbMkylTZBwqKN19XUYMNdLaI3CzqhmpNKDRUoC/MEDKkluKFIZvIYpSxyciyFUVj
         Jjy1VwDWcAqnKw7siOoWfpa2yRcKATTmgRCJMCcs8ays3r0jjbrWOXXjlmSS08DeoTb+
         /Sd8XE3BwGaGjGyc1GRi2oXN8cGdST1qBZoXwpbetDvHOnsMqzI2qZCqFArUOJFdGXVD
         yT5bvPuOCWmx41rVOsJZFUK4OEFyQXjF13+3sfgWva6FEE5eChQ9k4mcZN7k9lopcpbh
         Aucg==
X-Gm-Message-State: AOJu0Yw6W4GjdQm+l3DdcNUjvDJZF+I5cWZHWldMW6oWJI00SeQHts1I
	9hyvYFFm2YmvjineunBkQD+RdlOkuU/yrJaUYPUuq7dowi/mHGTuyOzFXeF/Hg==
X-Gm-Gg: AZuq6aLniJ+Ct70Y1hvdZBhbBqLdaZ+OQo4ti1yV8JKBeltI/MUR4zK96Rc2t0fHTGz
	sDF1PKIgP8NU96qvyxQBWOskmzHRIjVbFuKGpm0eHzQpC0JvIfzhaoPoqwLAth9/qJ0y4wGMEz0
	eNHzrcoo08nIMX/qY4LDQjL1uJtMt+TQA3lFct58o58eVIZyE5/qqlndqJVTNsCK40LhyxMcr0c
	dfAIxXBp0lz5S1dK8c6BS/r6HHPRJB9tHAshT+VeT30MBFwIi19ya4MYhVILOSfMEAHa17GGClb
	EWgGCcXtVJkCUz/93A9chEiCN5JQ3FBHlGEo1Np8lNIxjpuEvkIIBkIiyfkPt8nqYy46PKPKuRS
	Wi6R4IBB0yRui2C0qPZNQQYuSoHu/MbA7lxxKGRtQy/41HsphMAhYSVJQyx0AymQvtcarow3kSG
	zbppyAZoWmUqFAXzJ0+gl98nv0S3kzOkp8Lw==
X-Received: by 2002:a05:6a21:e8b:b0:38b:dec8:9d9a with SMTP id adf61e73a8af0-393ad3769b5mr2320220637.55.1770375425464;
        Fri, 06 Feb 2026 02:57:05 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb526676sm1779496a12.12.2026.02.06.02.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:57:05 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 3/3] vim: ignore CVE-2025-66476
Date: Fri,  6 Feb 2026 23:56:43 +1300
Message-ID: <20260206105643.2636897-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206105643.2636897-1-ankur.tyagi85@gmail.com>
References: <20260206105643.2636897-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 10:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230612

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-66476

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-support/vim/vim_9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
index fee9f055e9..c492342ffb 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -21,3 +21,5 @@ ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
 # in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
 #
 lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
+
+CVE_STATUS[CVE-2025-66476] = "not-applicable-platform: Issue only applies on Windows"

