Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F35E6ADE5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87822.1766434120334167646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WFCqyJAJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so3253472a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434119; x=1767038919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A76x+ZuAzT+6rF+ySe3uiKn/rebCabTIB8ojmQSDrz8=;
        b=WFCqyJAJ0q2b/fbHQ2+tXdmF70w4yNFnU7ZAMfX6/GTxwJWHVBwBeCRP/8MpprFirk
         P5lSw7nE4rDgJuYzKlD3otzbQ7BmNPvv3HQqpvfEuAuVoRtkNVk2C7+96CkQvnW1p77K
         yGy79NOLFj0W+odLr/47AAHBEsBcMmlAiL2/MHB/6w56ffo6DhDqwxJARjdRURYIuwQM
         ODEw+p2YAqh4hlveD5ff+g0estq9xLlrkEBwPSkS+Hf0z0F8M9T3RLr0eHX8utPknZqe
         W7hYQsEscy8SJgnlZot7GBR/fqCRlmYZMGcsvQeXyAlpDF/8DokXMIjSpFwJ8K5UgXys
         q/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434119; x=1767038919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A76x+ZuAzT+6rF+ySe3uiKn/rebCabTIB8ojmQSDrz8=;
        b=LNjZf/PIQtU8mXHV1M0k1bqJQrOzzov+l+RBa5DkPsyWCnwDu3O5MVnNGHH2Md0vbU
         JU0gZVKWio3cqIUHE78k0Yk5cWZUjizQhmtenHSg6I82NABviHlycimWt6ML6XZRZd1o
         APleGX3Yo2QpWMsqd+Nz01ZCS0Az7wwzbVryo3mWLjX/YP/lFZs1bopv3FFAu9hWnTiB
         6wx+DG+jU8vGKCRA86cBBrsI7V9J+bOcrTaYKr2rLuecWunQBbYZfm4PgapV+Go9tK5T
         97DAEElDz9KFPXvATunTKlfRsEC0UvjgNATMvQoWTyc5iRFryd+SnsqOCTYU7ARAVCSc
         ouSQ==
X-Gm-Message-State: AOJu0YyUzjSLjBHTc9MOJMz80XdcU+Lj0cy+vtXgJe86NWpLEIuoo48q
	mZusxEVU/u7W5VxPrBcJNyyKYPqTNQR/SwFWEaUu+lJ2FG9v2K372PRLtNhjFw==
X-Gm-Gg: AY/fxX4BGa3NPBwIVyhZVjc+Kx3akjQwIOfuYLRpuolOdSGvZcnSi9gK5gXuV13nCvq
	NG08Mm3H5Bga7IKDTfxfIBIx9xdEFvSXWztHCypy7hpSKlkOtItBWEQ6venxCyBE9XJ09ohg7ue
	bX02dW++FlRuhMdTMOsV4tDOiDQ7Oknve++MMLaCQ7FG7kjqVU5lOr7RC4wRgFDpSBt14giZ+7H
	YZYPmetAVtZWUmufGZcfINfYG9RjFEPVt0LawkcgYcwDnuC5izs6Bd10KWQxNB9Hc4/5xeWMW/g
	Od/VgmaLc1u8HE62i8yLEozTiGHEMvXXoy729JQHAwM1eUG3ObSjeabnLfZp3nXGYlyXExYMuof
	KbJuOIPzJY6zuSk/ODQiyUYx5o4RmBgJgMSMYwefEOYAQKGx54R6u+poOX8Ww/WGXhf5xxnXnwW
	/HiREdtk9dDZKu7BAhoVfv1Q0qfYx19mtleMWQyGyTIBefmCM=
X-Google-Smtp-Source: AGHT+IF6MVckezkj6689A32xPYNP/z94eVN75H+Q++emOf7UrTJfKROGn9mlqerU1EgsomIJ1P0jlQ==
X-Received: by 2002:a17:907:8686:b0:b7c:e5d6:2462 with SMTP id a640c23a62f3a-b8036f60923mr1340604166b.28.1766434118532;
        Mon, 22 Dec 2025 12:08:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 077/114] python3-rdflib: upgrade 7.1.4 -> 7.5.0
Date: Mon, 22 Dec 2025 21:06:59 +0100
Message-ID: <20251222200739.2278706-77-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228402

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-rdflib_7.1.4.bb => python3-rdflib_7.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-rdflib_7.1.4.bb => python3-rdflib_7.5.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-rdflib_7.1.4.bb b/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-rdflib_7.1.4.bb
rename to meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
index 01841cda4f..e421aa2bac 100644
--- a/meta/recipes-devtools/python/python3-rdflib_7.1.4.bb
+++ b/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7006e973486c4700556f6d58cba0ab6c"
 
-SRC_URI[sha256sum] = "fed46e24f26a788e2ab8e445f7077f00edcf95abb73bcef4b86cefa8b62dd174"
+SRC_URI[sha256sum] = "663083443908b1830e567350d72e74d9948b310f827966358d76eebdc92bf592"
 
 inherit pypi python_poetry_core
 
-- 
2.47.3


