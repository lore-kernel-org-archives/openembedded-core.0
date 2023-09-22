Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF32DE7D0DC
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:51 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.16346.1695367482121536848
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iS+ilXAT;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9ae7383b7ecso140121766b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367480; x=1695972280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EK18omYd3YciT8p563AUUd1ump1BuwcZi1+6pYhoy1Q=;
        b=iS+ilXATrQnNOquDtOnvOLrpeXw+O+uKv+wS12W3zoUaebQ2z+8n3TiBKAY+U4DxO1
         XveT2rTUeIYWlyJqD9ENwEA9i11ztqk4pEa6z2g22R/nCOLEhzWsGAzA/OS5EKseInK8
         MJNVZ1A1e+9ChcBSWs9DiXW5dQeUUJeapBcxDuHBlt3BpMOWqg6HHdR1qPLA0DTxlhD/
         NskHKGUIOX8568cSmr6bycLDg8i85uJ8HulR/BAXBur//PMVbiBpkjgVZiT93q872BWt
         6EvdRPogmDP90wjYrX89sRkwzY6V07UTrwFAn43xAzDeB6uNann62v/Cr3Ub/K/2eiKX
         /YRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367480; x=1695972280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EK18omYd3YciT8p563AUUd1ump1BuwcZi1+6pYhoy1Q=;
        b=M1ApwphU/mg8idvspQqGLGNVAXAPuHJKYu4edNoiWnCc5bVM5xaCNyeLamrNYLEZxm
         TFUOKWZsOWp+coQYFvlcXDU+iRPkh/B3/jEs7PRbxybp+HlPvJUFl8nGz9TnC1OUelsQ
         XdNYB4VacN7DbHR1ii8iCiqxGJ3D097R4UrJ7hm9gblGcstrArGh8/xdieRRebcpLgTL
         MoayLWl0zUc6rjwDk8KN3Q5A7xXxPowYB2896qeoYOBnSsqNZ8KcP539lhvDbTPoy1DE
         NlxWGtnWnqPndL68E3dHdxAPid3FSfwuywbPbfNmsuvUPYPYU57+V/7C7zlzPuBpcXps
         HL4g==
X-Gm-Message-State: AOJu0Yz6DQyvn6XLrJk4IdUZEv+iGmn8Qk8lfqBM0+EO0NObnBRx2yf4
	7qL9DA5ee4h1iABHdYnNxS9ZBuyoyHQ=
X-Google-Smtp-Source: AGHT+IHwk9JtZrI+qbP3scHxkujmxICT7S3OBMk7JJYs+92upxW8VTd2fg8WUmegnY0DjN5anZzRrQ==
X-Received: by 2002:a17:906:3147:b0:993:eee4:e704 with SMTP id e7-20020a170906314700b00993eee4e704mr2489439eje.38.1695367480454;
        Fri, 22 Sep 2023 00:24:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/40] btrfs-tools: upgrade 6.3.3 -> 6.5.1
Date: Fri, 22 Sep 2023 09:24:01 +0200
Message-Id: <20230922072431.1481743-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188054

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../btrfs-tools/{btrfs-tools_6.3.3.bb => btrfs-tools_6.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.3.3.bb => btrfs-tools_6.5.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb
index e7a64e83635..527e13d08e2 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "bb0ca35245858f17a6ced97aade1dd8d70f9c9d7"
+SRCREV = "92d04d4780886a9850716e5529f1dace97779931"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.30.2


