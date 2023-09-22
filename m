Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A7DCE79A8
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:51 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.16347.1695367483503819308
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j7SRqzPL;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-53339349956so1892638a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367482; x=1695972282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Dq/8dxv8OztUdVusH05aV7O5xoHQDOhEVVYntN1sfU=;
        b=j7SRqzPLnYCDutSHW7k50ySiOF/IALqyDj0TecMdByCPVpvR7yX9QATgwHzoCPrMlr
         DlAzSr5KN8y+b1tiKNpPQ8SzVmsi10Y50+5Bq+H2L2b3oIPUpTtrxBRYxG3jTdTJHUvB
         sDAvXe1+ipysOZnuOsAqNs1EZ0L0mmHjwfn8k0N5lIDSz+rXEfekKYS62F1CjOeKXAqg
         /GMIWGqrSNCbe+UmMhG0D+1YIrK+V1OEomVVH5ZWLdBI9dUnY6zLI4Lx3XJGeDf0rnNO
         XENSpY0sBDaX1uHZF3yFBuEy8RbpGWr5LUWN3L2BiuuE9fvKtxZUTYeVBSp7ANTF+CXC
         xIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367482; x=1695972282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Dq/8dxv8OztUdVusH05aV7O5xoHQDOhEVVYntN1sfU=;
        b=NxD4nojiIPd+x0x8H0mPHCQqHh+qS3o674xww2/JNeUvK0Nst11/O66PsOQDL3jSQ2
         OedRVDPZxX+Z4ZeM5/kUr2rqYLpLFw5toOlYLtrNsPTyFLhguNNnPWH8wchbKGFTnKYk
         RuadJh1PD7doUebZ2Shu82ZGcuCRw0jZ6rW/1mzcK58R7U1KsjmmCawhsGLFq5sAEZxL
         bsuGBNc823k3NfRLM4Cey4+Kz+Yt3Bmu2Alq0241/v8WJuvBuJgMtzdl+It1FibwxvZX
         SWcoOjOYWeerfF/sb+h3vcvSDOCqcjcgWIyQLMPJzSl4HINOeQivNUXMGr/N7Z1TOcOR
         varA==
X-Gm-Message-State: AOJu0Yz33Yvt304CsMFbTk0j94gp9c8ecs8XsKPqJKMbiy7hBPva4poH
	G4ePjmtyyjcDVPmiPPBCGpvjzvNMXg8=
X-Google-Smtp-Source: AGHT+IFNpviVVfua+ywyB0plfTjRxiwbTySv6DgTM7o81Sddwnre6YK/qpVGGj/qUzV8f9cemBEYTQ==
X-Received: by 2002:a17:907:2e19:b0:9ae:7611:99be with SMTP id ig25-20020a1709072e1900b009ae761199bemr646270ejc.66.1695367481987;
        Fri, 22 Sep 2023 00:24:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/40] debianutils: upgrade 5.12 -> 5.13
Date: Fri, 22 Sep 2023 09:24:03 +0200
Message-Id: <20230922072431.1481743-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188055

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../debianutils/{debianutils_5.12.bb => debianutils_5.13.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.12.bb => debianutils_5.13.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.12.bb b/meta/recipes-support/debianutils/debianutils_5.13.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.12.bb
rename to meta/recipes-support/debianutils/debianutils_5.13.bb
index 4002a44cdb3..915277b42cf 100644
--- a/meta/recipes-support/debianutils/debianutils_5.12.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.13.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=74765f57ae5dd2b10ffbc39528d98753
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "78bdc9165504b61ff4ea25a95d9865c45bfe7520"
+SRCREV = "d49a78eb264c1b2ad3d0d6de8e1fb776bda9c943"
 
 inherit autotools update-alternatives
 
-- 
2.30.2


