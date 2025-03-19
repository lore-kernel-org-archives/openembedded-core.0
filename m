Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4FAC35FFF
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:18 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.2936.1742372177912746933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q/u5rtU5;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224171d6826so33721745ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372177; x=1742976977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FkonGlWmIlM3IsS5leGH/uKmdN3husJG9W9mDrXSm4=;
        b=Q/u5rtU5xqrUHWkBao3qZI57w6i90K+zA8ETIrXBF89bF8CHz2VgBIIAuoSB9CEg1C
         uPdFnu2A+DfIpGErjLC7Q6CVvAv/YePoBs5YmQbVJiAzq1HYJ12BwodX6n4qPSxBogI1
         abgSq1v8SlTbnDc2ORZ8UF3u9UUsA4qMGRxfL/pLd6NqeME/4Ofeg8v1jsoJW5iQH04h
         VSaZVGuCEYhCt8uHw3bhoHUBJJ8KLtz6NIJylb93ooJgLG9xZEZTLbxigC0DVCoThNu2
         5z7xQ8xrbNSC6ypkl/g7kpQqBWLZ7key5eSvtgaMd0imlN1Yx1BlNdYkaSMwGB+JqlGw
         tMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372177; x=1742976977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FkonGlWmIlM3IsS5leGH/uKmdN3husJG9W9mDrXSm4=;
        b=VWpzQhA4YK7llPMEUzMOqG6ifnNsA2DkTQmt+ie57hXCdvvLJa8JWCKkjLUfVsAmGe
         u0AUiDdU7uqlCGpmkFfPSOkOiL+cnadZHai5fKZG+H7pLE5yHjjq83i04c80TIG+W6ZR
         O6bI8E/KdMYStlntRpjdhfipORKs+Vf7ejMCxIFHcT8fmUkQBp9NmiZvsBvNM17sItwH
         g1Nwa3PKnG/MwMznSlwrtSQk/TODAnkFedaH48oQPJnQrBp2/J96PUeUBYCXOxuHmwlm
         0FMYGP8iFwnuYxtHf314bYU4KfGeFdeehdviksRfEq04BpjhI0qkmyCKzRY8FTKuQKa+
         bI4Q==
X-Gm-Message-State: AOJu0YzZAOrasSrS5GAu5oV1GD4WsNOGV9anUwSD+OP/j4s7KWJNb9MO
	SHPzskNEx/4luJjgr3SUPiUbgXTNnHFS2TUTimGXal9yGCtXtv1ZvsauI1oV
X-Gm-Gg: ASbGncsm+bGxiBxu08K0edsM/g/SciwqxBcbW0U6Ki13q449Y7vJLKej4mfJ+jNfMOO
	fiIdf9m983h88n1Pz41F0sAIpfFg4CY0gSGntuzxO8wMAgJbvMFuWtl8f1HjSQXKmHCWV1aHl2J
	1+/49hR7Ijarw6alWTXmaAPEF2JExBufp+39blroakOvJ0U6TPcswSI/YKhQtVYI0IbHGic//av
	V6eihX55zdatYTh+johg+CsEQcY2xUKntXvCaeROjlN8NkJRJTMOyGHn0YtAxga42vmNgq0G8jC
	fg7pLbQbtCis9UfijXAWTtiskJEEwqIelaz7
X-Google-Smtp-Source: AGHT+IG6phnMtDJegQeueJifGrZ25RsVzVGoAFJJlL/jwzil1NGIoXvlyxuWvjCGIWjgDyTyyaidIQ==
X-Received: by 2002:a05:6a20:430d:b0:1f5:8e94:2e7f with SMTP id adf61e73a8af0-1fbecd48014mr2463372637.33.1742372177103;
        Wed, 19 Mar 2025 01:16:17 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kai Kang <kai.kang@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 04/27] libpam: add ptest cases back
Date: Wed, 19 Mar 2025 01:15:32 -0700
Message-ID: <20250319081610.3536475-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213270

From: Kai Kang <kai.kang@windriver.com>

It removes the installation of ptest cases when upgrade libpam to 1.7.0.
Add them back to make ptest work. And 2 more cases in libpam 1.7.0.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/pam/libpam_1.7.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.7.0.bb b/meta/recipes-extended/pam/libpam_1.7.0.bb
index 1be3c9e2bb9..4abc52bd93b 100644
--- a/meta/recipes-extended/pam/libpam_1.7.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.0.bb
@@ -142,6 +142,12 @@ do_install:append() {
 	fi
 }
 
+do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}/tests
+    find ${B}/tests -maxdepth 1 -type f -exec cp {} ${D}${PTEST_PATH}/tests \;
+    install -m 0644 ${S}/tests/confdir ${D}${PTEST_PATH}/tests
+}
+
 pkg_postinst:${PN}() {
          if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
                  /etc/init.d/populate-volatile.sh update

