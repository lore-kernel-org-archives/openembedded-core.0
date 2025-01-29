Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512E2C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 09:54:45 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.9207.1738144481550770357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 01:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BGW/syPG;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5da12292b67so10805443a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 01:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738144480; x=1738749280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8lEX4ri/B9NLUHb8IDley5QJ6Nt8m8CuyMa7R6jcbX0=;
        b=BGW/syPGceetC88L3o3tPrf38BMhH2VOzUjCMRIQyK0QOHcG3+4egVgrRBn6JiKqpw
         obNZ1E7ct7b+uCVNAnUe88/epNjW8SMmmb8pjsV5avwvkUj1DytrHVuygG53VNciBw2o
         KYhHKoLYakTqwT4zUs1rI2HFo+vTJgGKKzX+jyeVN/K5YbLHnqcr6PwS3xDFLBkTEhaJ
         D9syRC3GaL2I1LBNbZBMS8bA83uBltnNDUPUraxJcbdvhoZ+yPr6dSz/JisTVPBN/SDp
         FNC1Yn8pnZJS+itn1bgjHoBNvy4TwcIJzOAIKbzOuqiWggSkdreJaEBtuYcXzAwr3ldM
         9YgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738144480; x=1738749280;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lEX4ri/B9NLUHb8IDley5QJ6Nt8m8CuyMa7R6jcbX0=;
        b=cx9lkQEgs2kHJIFuvsJhIFgD1woPpZiE9LZuN96q+e6fd4q8CgSKRXzhC5UqUJ/AuX
         Q3H4YOC4oO8ui14cTlogiefGznYHgiHS7SzPpcU4TrtyzrgSSTT1N10CBLiMDDeZyDB1
         rma+kW4VPKoFq7VjnI1H+/ud8FnWZtkVS7RCFYKHFPU0xmkhNyxSSBZG5LG9ixnJzgwv
         KhYQH/KgdwrhLUIMHB/qmXJhbDuGIWMbNICE63aPDfhd1sqEk1NNBMmbDBaH3gDusr0n
         mkwA7T8yGAgwHgiauanJ2mrKOTWE5dytKz+T92FZPQBaWjaB4fStEDG67pf8QRxunHTe
         Q8cw==
X-Gm-Message-State: AOJu0YwwaeAYinupONd+Ar9tALF3fybEDLhI4QZf6i2Nnir46Jajkzcu
	OVD/ltbOppv3xXfx1C6/kqOJTtXQuN2CAI9oxFKLFC7BK0XqCXm2AW4lOA==
X-Gm-Gg: ASbGncvpp6Nap9CEarfAhoAG1HMhnOynY54X3cmJiGWl71QkWk3ZSQtaGb88yqUrWNn
	gL8yuxyMWqWfuoV1AHMzYkRiJi0LRlerCoKwFuGqHL4R8qeCJdg/SGkaPaVtBVH9EjdBVKTEP2I
	kkfiX8/LuDEE/hvF1f826QCJb06ozDk364f65AoFQLNfxTYJm1wUkcXbO9DzkqGtCkO0QP18D+2
	1SF6QWs0+NKnMSg/rihGVzL0ESrqUBCfMC4GSch50odn6X38/ZR5Kbye5Sl7fv2UExAbdeuj8TG
	8b0zX0dpDmpeGNQBOz5xQp0AkdFsweTG
X-Google-Smtp-Source: AGHT+IGXku2SxPU6Em3qvh/SXpxHAi5pMeSorW1T7QyUPh1tt0SJRwD/TLGE89XMprhDO/ni+/v4oQ==
X-Received: by 2002:a05:6402:1ed5:b0:5d0:ed92:cdf6 with SMTP id 4fb4d7f45d1cf-5dc5efc5e30mr5707512a12.19.1738144479637;
        Wed, 29 Jan 2025 01:54:39 -0800 (PST)
Received: from nac45008.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760ab2c3sm946062266b.100.2025.01.29.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 01:54:39 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [PATCH] openssh: update SRC_URI to use https
Date: Wed, 29 Jan 2025 10:53:09 +0100
Message-Id: <20250129095308.3710568-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.39.5
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 09:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210361

From: Jermain Horsman <jermain.horsman@nedap.com>

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/recipes-connectivity/openssh/openssh_9.9p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.9p1.bb b/meta/recipes-connectivity/openssh/openssh_9.9p1.bb
index 6d9dac3497..cb47ae7c07 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.9p1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=78ffb36e5a48c0d8c5648603a3b6c8eb"
 DEPENDS = "zlib openssl virtual/crypt"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
+SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
            file://sshd_config \
            file://ssh_config \
            file://init \
-- 
2.39.5


