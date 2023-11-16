Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECF0C5AE4A
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:48:51 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.20277.1700174930939628554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:48:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=av+6SNPZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9d216597f64so188441866b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 14:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174929; x=1700779729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSpne9tcPtjN5X4ATJj2VXqWSRsuq3aCu1/pTO3fi4E=;
        b=av+6SNPZlRZM/2yEnF1E3wxTrFoseCZp1gkogfVTkAwzypdKSTmL2KY74VHIFJ/twP
         wEbwy+1jyhMGnFddHn9ONvWuH/gIXT6wT3MctgTcZj8gCGkQIcXWewJrznYRlVesYVJn
         FgwD/o+mNHl3eUnv4VicBnJ0wkXRFIr9vG/cADJuRqTNXFZtin2ARjLwYQxC7rp8AjJf
         fN9OanlgJGuo1TjJ9qULWlENsQziCeCwr1fKvGEHH1CiJi1o3U+Gboy0kqvWmSCOq1+n
         5tg+dzqcoT+B6GFcjhvp++WQN3tFM2Gq6ecaECqV+1T+jZWJVaVlZh2aHYMiIPEKxS9I
         9vOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174929; x=1700779729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSpne9tcPtjN5X4ATJj2VXqWSRsuq3aCu1/pTO3fi4E=;
        b=N5tQe6NdkpZRWmptBraeOE1B1iVOWxGGu9BCBJ6cH6ETa7cfAtgZzawBeCDILf9lY8
         ZPwNfU/9QVQSXfOX7iq1ovXmtFdF0O7KvjK8hTSxDqsmDdImOrJnolOtAYcwRU/tydU+
         N16x1sAVzab3WNYElKbEW7kKuyPtfUFfgKm2E07WKfF8THW+v9Z7wQzH3zMrdGF3L2h5
         1wqVqPLhBF4yeATLFZPyOO0Ct5IZUm0GH7exXTUxCgZ7YsJzZ3u7V7fixRtLmIoS+DNh
         SeB6V60YgiyuX9uAKla2D0adUHarJY8EudG1yDunC9FopuSw46LlkprtL8KvICoEw0FM
         wSWw==
X-Gm-Message-State: AOJu0YwivoLhoRlh8UMUP9aDylLTjR14k6hOoOaC/NY2oROX2iTbfmPf
	8rzDJ9yeuREmQSRbeygR2tuBJF1ieaE=
X-Google-Smtp-Source: AGHT+IGDevX1IenW1/bU8z/QXX+YXmcUMBERlUmFnEKNTOjI1cfGjmf54AuAESskh9jH7Lc7CTtwlw==
X-Received: by 2002:a17:906:79c6:b0:9e7:3af8:1fcd with SMTP id m6-20020a17090679c600b009e73af81fcdmr10740613ejo.76.1700174929403;
        Thu, 16 Nov 2023 14:48:49 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j4-20020a170906410400b009de3fd8cbfasm138557ejk.0.2023.11.16.14.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:48:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2 11/12] python3-cython: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 23:48:35 +0100
Message-ID: <20231116224836.2696913-11-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116224836.2696913-1-martin.jansa@gmail.com>
References: <20231116224836.2696913-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 22:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190825

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python/python3-cython_0.29.36.bb           | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-devtools/python/python3-cython_0.29.36.bb
index 78be2b94ed..07638d7ad7 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.36.bb
+++ b/meta/recipes-devtools/python/python3-cython_0.29.36.bb
@@ -20,17 +20,17 @@ do_install:append() {
 PACKAGESPLITFUNCS =+ "cython_fix_sources"
 
 cython_fix_sources () {
-	for f in ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/FlowControl.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/FusedNode.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Scanning.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Visitor.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Actions.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Scanners.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Runtime/refnanny.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Tempita/_tempita.c \
+	for f in ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/FlowControl.c \
+		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/FusedNode.c \
+		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/Scanning.c \
+		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/Visitor.c \
+		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Actions.c \
+		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Scanners.c \
+		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Runtime/refnanny.c \
+		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Tempita/_tempita.c \
 		${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do
 		if [ -e $f ]; then
-			sed -i -e 's#${WORKDIR}/Cython-${PV}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' $f
+			sed -i -e 's#${WORKDIR}/Cython-${PV}#${TARGET_DBGSRC_DIR}#g' $f
 		fi
 	done
 }
-- 
2.42.1


