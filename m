Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6858ED6C284
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 17:56:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.28198.1732039006870638330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 09:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CVychTLQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315abed18aso30763145e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 09:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732039005; x=1732643805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3M3XDyj3KmVe6drI3/8nnFccSD9qZgXQGKCU5ljj0w=;
        b=CVychTLQSwEWWZZng8n6iQ44c5vz3fm0pTkBfdZHgwNAx80p3qYDKyoIdznGgFvdyp
         8nbxLf5SRkiSsGnqctoIxtdYCaK6YzYN8c1Vk/nEnYkLowCxzF9HiFkPunOwlrjddGvf
         VVoZd3txf8F0GSJ3dSKJs8LQtpgKpv40RnlYVsfV4ALDCALxtT96rjQeBR21Ny6ULQjf
         u5wXa+grr5fM7/eWwiv3HQW6tI2B/YjV65Yyb0gZv2FylG585QttzcRsUFy5J79VvpLr
         Q30CHJCh74cS/qR8GOjC71YVYbgh6woCX1mCxCMw4e65XwfyrwWQobHtYfGKPhYdFtX/
         ctWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732039005; x=1732643805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3M3XDyj3KmVe6drI3/8nnFccSD9qZgXQGKCU5ljj0w=;
        b=BG4Lt98UAR5Miv530A9s6M8ia6Az7AM20aRtvVBovZHE6ysIucfshg6b2ilIpN28y3
         i0XHAC/dwgCVquo25jMFpCWOCSd/Tfgv1WK3hPi5Ea60a+8oQ3IC/qdMGiNUst8BlfD9
         er6EsKYla26ZcNQnrDcFbjWtUz/JtobXrgM3Qpycn+mlAaI4/WfwBbwNqtTw2b8BCrmX
         RwTEcefONa8xB4dv8F+drELUhpKyL6cSrg7FI2BdnYefe7Ulg+CgbjczotrRisbEHSII
         A5wqCZUrnSE69FUqjqZQco7ttyl+rHNjLBRZ4A/26umDleTRcspN4aVJt701RjONJYmn
         tBaQ==
X-Gm-Message-State: AOJu0YyKSsvNkAZ9rnH+CQsmce8rYqNXDlQa9nYEcC43SZ0yEJlyoFi7
	JvaxK05EuOZkIaX7C7BizwAdfKlMwT+Jdos7QlDAE8+y/OEbYK7votyoBeu8
X-Google-Smtp-Source: AGHT+IGkwjBPDHXy4Cz6PvdKOCJ6WpiWllMInyVlh7iJaXZvJ7ILkIH/7F1DBNukmiRPETt/K/WLOA==
X-Received: by 2002:a05:6000:1869:b0:382:488d:dfc5 with SMTP id ffacd0b85a97d-382488de00emr6494166f8f.0.1732039004683;
        Tue, 19 Nov 2024 09:56:44 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3823e0c910asm9405250f8f.39.2024.11.19.09.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 09:56:44 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [scarthgap][PATCH 2/2] libpam: drop cracklib from DEPENDS
Date: Tue, 19 Nov 2024 17:56:26 +0000
Message-ID: <20241119175626.2155200-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119175626.2155200-1-gudni.m.g@gmail.com>
References: <20241119175626.2155200-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 17:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207404

cracklib was dropped as a dependency in libpam v1.5.0
See the following commit as reference:
https://github.com/linux-pam/linux-pam/commit/d702ff714c309069111899fd07c09e31c414c166

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-extended/pam/libpam_1.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-extended/pam/libpam_1.5.3.bb
index bcaa84c9a5..f05272652d 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
 
 SRC_URI[sha256sum] = "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283"
 
-DEPENDS = "bison-native flex-native cracklib libxml2-native virtual/crypt"
+DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
 EXTRA_OECONF = "--includedir=${includedir}/security \
                 --libdir=${base_libdir} \
-- 
2.43.0


