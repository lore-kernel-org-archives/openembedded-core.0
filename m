Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25567C02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 11:24:00 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.41052.1737545036033494950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 03:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QbP3USPa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38632b8ae71so5450504f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737545034; x=1738149834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eFL3x2UTJqUqcCJpH9Ad5J/oXKe60IvYfM1EhttKduU=;
        b=QbP3USPaxEjYM/ypIn0ScwjueEyyeA8S6CYjssblTou1AhxZYt7qS6L6LHtLw1IBay
         C8QT7xSaSMqp5pqeiNDSGTD7crfiy0LQ7r/nwqn5oHnDabPXvTW5pg3ObNnBv+Zot2dI
         iJ/V7BG6vYHnLNu7qcl8Cgsknj2l6MRznm3kI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737545034; x=1738149834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eFL3x2UTJqUqcCJpH9Ad5J/oXKe60IvYfM1EhttKduU=;
        b=VR0QmSAjR5vFST7TZ9BQkqQyQxYe3lxFY+N4KfR1RuY/Q8FSUL8a/aqimGBoUxfO9b
         oZhb3R+NJ3FLS7aVu4UzvXFt0rbdKZioJ0aBRRwf6LMGzgENan9qhBF3npklSijTpLyT
         Jgj5vMp12c/5JoJBk+94XZUHSSACQeathTlJ9GTMbsjN/nD5YS44855+PJH6OJTP9o03
         Xq8Rt2t+cFhekdUhwfSMYBKeeTDPn5KRm1C+CBHqrNr8VF6qAWArwEw9JWNhPT+dCSfA
         DY1ASq3eJNpZNsKJ3VT2f5dwJM+f7fmcxo4U/oV/FpL8REcrmDntTfJbAReN9n+hjqpk
         wyHA==
X-Gm-Message-State: AOJu0Yx1Tl9XUJIRu920y0cdA/lPe+X6L0UeX3UESKwF8G1WJf6Ew9gc
	9TXEMXa/aO7tnvg5WpwsEJJu7MhCTP+gMl7kzSGdkEG2nQ+8WkNx3gvLQAT2xC/Ldvj3XqP/qeV
	aGfk=
X-Gm-Gg: ASbGncs/73kYuFjflrDGc9GGW7DHyjv6xQU9/wb4rHC6zlPDVEtYm2fJaFPcoqRZDrK
	KAW7x9wp2bWu5r1Va7gScB0gR2aHOccQ8URLs/MCFgd2ES/2zWiYDBfu2mIndhg3584ZjrgT/sG
	2q1k4S6y0KrNouHnWyxBoUdiEBIvc++ePxlhMKNOrUd7jvbvnVE26Sve+Ym2VaPbjbRSFfG+kms
	03T3B7J2hGf+EGyDGTxB7AgJYd75ApUlNmP/BaCSPxDW4ZeqTIJhAoc50hvdS+0Bt7j4nZHVhjw
	PdIFHjl2X0yW/bSsOEng
X-Google-Smtp-Source: AGHT+IEgrPimBd2isPwmU/ZYgY33lQh1WvAHKZqGK5ijzlRE5uDhv9ZoXwVTBfsZlb955fRm5I8PIA==
X-Received: by 2002:a05:6000:402a:b0:386:3327:9d07 with SMTP id ffacd0b85a97d-38bf59ef829mr20415895f8f.54.1737545033852;
        Wed, 22 Jan 2025 03:23:53 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bd38:1d:73cc:d341])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf321504asm16268405f8f.17.2025.01.22.03.23.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 03:23:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-cffi: Add missing pkgconfig dependency
Date: Wed, 22 Jan 2025 11:23:52 +0000
Message-ID: <20250122112352.1945986-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 11:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210145

With gcc posioning fixed, this recipe showed errors, using an incorrect include
path looking at the host system. If pkgconfig is present, the correct include
paths are used. Therefore add the missing dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-cffi_1.17.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-cffi_1.17.1.bb b/meta/recipes-devtools/python/python3-cffi_1.17.1.bb
index 99979a73e8b..fbe9051a90b 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.17.1.bb
+++ b/meta/recipes-devtools/python/python3-cffi_1.17.1.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789
 
 SRC_URI += "file://run-ptest"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest pkgconfig
 
 do_install_ptest() {
     cp -r ${S}/testing ${D}${PTEST_PATH}

