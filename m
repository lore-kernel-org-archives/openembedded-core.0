Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FF8CF537D
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:31 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.7925.1729686922854522248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mAmF2Qig;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20ca388d242so48550495ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686922; x=1730291722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1xsP6VRRTB3DiRpysMEsqbJzFp3xDtjQk62uaeYGa8=;
        b=mAmF2QigK7ojPqKnrp27WJACRR6DO87XTN8SnUuF1S/AklWpDmJIqsUTu5JMnJNMWd
         +o9lnN0gubcu4co7RH5S7gAsy3iQlHCWc4ZKyBLWFqqUMJvLQFn+5dDA764fJV40TtY8
         wL75qf8tYxcGhmZYQUSPabzqAFbz8QWOwgIE4T9Wm2HaRY6Ea0S94NNFwTEbVTrlULTr
         hittbjoJ9oTSaqtSZcGFKs/0avxGQ1e6KYbHzTvTB1W7kDvaqH2Y6g0tA74chXUkCVFI
         1h3BKiwn30EJvvkc8VORuySUMeRJ4OEFzVUZsZEAbPjcBya6fyjZyCXF/iQ+eWKG7w1Z
         H/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686922; x=1730291722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1xsP6VRRTB3DiRpysMEsqbJzFp3xDtjQk62uaeYGa8=;
        b=iSo/hoKuXL+rbJKmsWd0UQrEuKcUIr53n/6cUzQosyvHtt7XWHRWCpKG3UbiSOlUlr
         Bb8yF/PYkO0o53kZDLfN5NxlalqOAGi1GzwYyRM/f30z7BjTvJy7lZj7iOsEb6ySig99
         0UDn3Wm8kRJSpByp46O3A3BL+8bEBCd5yXRhrCdGiHykLY1xziIXBxsT/S/pe+kqoZC1
         QTZf3cWS61vExsUcwSLp4tIehLRpIxsWGg38IRAbfHatvUD+Qh/DCwzhJFbqs9nB/6r9
         mzJWLZ3CzGH3AGBqOe7gtYZVunq6Py6lMLMyjZ3JeNQYpaa/Ga1PKNge+HGbekO0IwjP
         p48g==
X-Gm-Message-State: AOJu0YxO56bumV0FiHuRPXJF8UDyGtPvjfgiHlJYtJSnvbep86Jbrism
	ogAVQXtDF7jWZibZ+XkiXOzJxUzoiD93leVIP1639BI/5Uu+yqNohIkR3Ua/vBi2ivtAhil7Y1K
	M
X-Google-Smtp-Source: AGHT+IE9DziDT3R5qcs138cWRl1klEqjpECqDeNv6UJ+aayl79v0vSTiaMcgpBUS7IlbDxqF7wS9Fw==
X-Received: by 2002:a17:902:ceca:b0:20c:528d:7063 with SMTP id d9443c01a7336-20fa9e0aa82mr32943245ad.19.1729686922188;
        Wed, 23 Oct 2024 05:35:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 24/27] lsb-release: fix Distro Codename shell escaping
Date: Wed, 23 Oct 2024 05:34:32 -0700
Message-Id: <168bed0e3d339ec75973faa682d47269ec96d599.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206235

From: Sergei Zhmylev <s.zhmylev@yadro.com>

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b5824c547b1348713e992a8bebd40577a0c5709)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/lsb/lsb-release_1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
index 00d8183a4f..a7039ea4d1 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -29,7 +29,7 @@ do_install() {
 	echo "DISTRIB_ID=${DISTRO}" >> ${D}${sysconfdir}/lsb-release
 	echo "DISTRIB_RELEASE=${DISTRO_VERSION}" >> ${D}${sysconfdir}/lsb-release
 	if [ -n "${DISTRO_CODENAME}" ]; then
-		echo "DISTRIB_CODENAME=${DISTRO_CODENAME}" >> ${D}${sysconfdir}/lsb-release
+		echo "DISTRIB_CODENAME=\"${DISTRO_CODENAME}\"" >> ${D}${sysconfdir}/lsb-release
 	fi
 	echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}${sysconfdir}/lsb-release
 }
-- 
2.34.1


