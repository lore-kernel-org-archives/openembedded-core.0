Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA66EC2BB9A
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:44 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.54581.1718625943210962122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XePIhF1+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f8ec7e054dso2810679b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625942; x=1719230742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qbsSYQkcLQ+7gN52N/qI1lGI88acvlsU+TXP/CukCE=;
        b=XePIhF1+O3vVgBB/8TGqIMndkSj+KbGfqhlLCKoFye9oaNymuxCs7241Kc+k9D8RHY
         wMuLnitGkiXK6k6wFASmsQ38VPByVUNBh75hHEJYusTkriThTcrABe46/W1KDqstYy9c
         RMn0v18Tlnjn8MH9jSU0hD6N2b7yok+aIpcRfhi2CySikM7w6P00nx7Xy11vp4Oh0FOu
         /B74jXbvIGJZSjoNKsswaiQn0/F5Lr9iHGCrsNRhy2GhGfvAoaiM8LQIinl2lLZO5JvE
         IhfqZaXZnJysLwTTXdyEqvj/SiGdiaVZ/+HxgTSF+E1JE9fbPLslDQyt25rkwfFA3S09
         gJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625942; x=1719230742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qbsSYQkcLQ+7gN52N/qI1lGI88acvlsU+TXP/CukCE=;
        b=Oz7vnQdMTNd8ZJXNWoMWSOtMpWSuk11my9ZWyapPIMtq999hNN8azT9yvJcg1p13k4
         o+cp1iZdDNPfGth/0fJutBM0DyASON8DPhLsomvkQ+UjXzb8UItl928YvYW0qZ35fQxv
         90P51Cd2A2Xkc756FgZ3fB/1XPQmxUko4WShLYfpIlZmetKWpy6KgyFQg0xyE7RxoNge
         yQHO8Mt0OA85y8zAqSVTKvOBJaAeB6oBV871MjwKl90JCCdHyRvEM6nxwY3O+n7a26qA
         NIFfEzhWKTF1jrGRVt+RQsjmd8Yhc+6lBFdTNkNiJuUiNueb4irH4M23ntY6v1MKbcaE
         Vt7A==
X-Gm-Message-State: AOJu0Ywm0RngHxmR/wPkgE4YenCjg4hz9zLU55RqOEXXVOuptKiKw82T
	ZPRlWN9I+jgPpEIzK84FjbMN5ZUZv4eAXfjbvAWYXZW2+t4Wps/bxjhS9tJgZRhqyOvk7u66xMG
	dKq0=
X-Google-Smtp-Source: AGHT+IE+/G4ECIgsFtUBhykxWlBkXDlSpfPnU0aaylW6ZHG1lbHuIcuLJucq/vsTrFSIEnXijfAMPQ==
X-Received: by 2002:a05:6a00:80e8:b0:702:301f:e513 with SMTP id d2e1a72fcca58-705d712bc99mr10636787b3a.13.1718625942214;
        Mon, 17 Jun 2024 05:05:42 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/22] p11-kit: ignore various issues fatal with gcc-14 (for 32bit MACHINEs)
Date: Mon, 17 Jun 2024 05:04:48 -0700
Message-Id: <10d2ba3bf2328d74edfbf6624f4f4ac52b3e9655.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200821

From: Martin Jansa <martin.jansa@gmail.com>

* these are reproducible only with 32bit MACHINEs and probably related
  to time64.inc

* http://errors.yoctoproject.org/Errors/Build/183154/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fa2b8a494e641faab095487af90c5b78d9e33868)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.25.3.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
index b7ebd44abc..2ede38deba 100644
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
2.34.1


