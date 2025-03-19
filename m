Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2E8C36003
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:28 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.2946.1742372185492077784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fJ+Y1CfM;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2260c915749so45337815ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372185; x=1742976985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKrGjdHHjnR7jsgqadzmaAaILBEfzJQIsOo3GFgMEZI=;
        b=fJ+Y1CfMjxXriJpXG8NN1bgabpriluhMdrFr9NMT0uusuMSqA1k82EeUA6WvfpFC7t
         GwOC4DOXMTpvyod/DSyVqba6TCWFUnEp4Xf9CJD7axojrQ6idiJXHik0RbwZDBQ4ktjx
         guVF8cNJ6CtMo/rZ453pz/MQKMzkpHf33+OOd+jDpMN3Y8VKjTs1oAiDUMELqZuV8RPj
         nhtFiJNkDY8MT/Ih6i+bRihNSgBehVY1+TIWUl523wfx8Um4H83bNn14DMIQA0MGGs2y
         +6X945yMjYXVA4MHvu32K4E9Mr5N/8p6+BwnqmVr/BQlItOIkEUAfHV4RrLSsdKsNv7R
         Fzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372185; x=1742976985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKrGjdHHjnR7jsgqadzmaAaILBEfzJQIsOo3GFgMEZI=;
        b=VAO8afPgUQMcpaCf1gZOGZbKmDDJwfyUk6CyVbeuOcO+nCnt9GH2agrSqkC7vbUJei
         SMukMMsJS2XXlPYpl19r7Ygyzw9ACn9cITvLT0YhCdir4gvTB2RGF33N8lJOwmCOjrQe
         VbajRgrWLTP6ZHfA1aCzinGXAtUWbFS7TnaClI2/XbqO23/28LcsOAE1TU31kg/JZHEE
         xmQJLlSc8B9YZWH67QC6tOeJ7197zrcDuDL2Ag9BAMMVflycm8Ib0HaHr/i29b9LjB9x
         k12UfsmIgy0bfkLInOYs+eE2JIODrXj7TaZV0/D3coVyGf30UEQCR4PhU4RR1IhULI8G
         HldQ==
X-Gm-Message-State: AOJu0YxM3S/biOWPL2vWom6HDXGW204RtZYJ4qttju+QYWMUEtGaiNk8
	+hinpA0XIqlFQUsB2wjO02jqd+HR+/J3EaOc4jQA6e5byzGf5LYP6xMrh6R3
X-Gm-Gg: ASbGnct5/ZY/awxvjM73w5lBzxPZ6JsDVBwGOdknC/W9yqXikIhcuej8xdRqAiIlXR1
	6pSjb7INoOQTzhtcBgGGzh/h5/gFE0tMUacZ26CT4mVK52OZXbZvAXmRcrU8G5lA0whIho5PKCa
	n14R9gkW8U9aLQE3IqO0BdACDATPWPqiJ/78fBO8BZXjiMzJJsyhoD6ViV8u+kaJRZl1KVM2rI7
	OEtZgFpKvNNmuHAOysXCibTx21XbCcHJuB4A4Mqvdk4CEAm40tHTmskghhQbDtdicmapMErLFyP
	A6ESu57PaWpyJsYXt58bosaL7vNegZMEAVSw
X-Google-Smtp-Source: AGHT+IEbgErBWD0YadtKxOpFrB/c8tATbkjA3NENP0gJFo80yqGcQLiOIUOx4FnjCEs3v7GvLhTWoQ==
X-Received: by 2002:a05:6a00:cd1:b0:736:a7e3:d4ab with SMTP id d2e1a72fcca58-7376d5f1894mr2713172b3a.5.1742372184678;
        Wed, 19 Mar 2025 01:16:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 12/25] man-db: Add missing rdep for col utility
Date: Wed, 19 Mar 2025 01:15:41 -0700
Message-ID: <20250319081610.3536475-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213279

man utility calls col utility internally when formatting is asked for
therefore it expects col to be in rootfs otherwise silently errors with
retcode 3 meaning 'file not found' in this case its due to col not being
found, other distros eg. gets this via bsdextrautils dependency

libssh2 ptest mansyntax.sh fails due to this error, which now works

Add util-linux explicitly to DEPENDS as system is not able to trancend
rdep to dep due to special handling of packages in util-linux recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/man-db/man-db_2.13.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes-extended/man-db/man-db_2.13.0.bb
index 2178239bb60..e9fd3b5ac57 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -13,8 +13,8 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
           "
 SRC_URI[sha256sum] = "82f0739f4f61aab5eb937d234de3b014e777b5538a28cbd31433c45ae09aefb9"
 
-DEPENDS = "libpipeline gdbm groff-native base-passwd"
-RDEPENDS:${PN} += "base-passwd"
+DEPENDS = "libpipeline gdbm groff-native base-passwd util-linux"
+RDEPENDS:${PN} += "base-passwd util-linux-col"
 PACKAGE_WRITE_DEPS += "base-passwd"
 
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'

