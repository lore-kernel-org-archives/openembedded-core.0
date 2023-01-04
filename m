Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9A9C54EBD
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.9362.1672830366643340608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qE1SAxKw;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d4so24591945wrw.6
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkHPJzkJHo3C8aBGUfIOgMM+b8OHWzIMUWDsnZa7N1k=;
        b=qE1SAxKwKKfb6At44/FlY+fSzmtyxPBhGp+jDHaqvQpkUqq/zF+CQtgghxRdnjCY9+
         PoKckfph8rQtdkBRNi7hhvaYw+fi6gqUdIYYCjE/rMg90GMVBhshpBU+yFfKsVGV9woB
         7yHnOdTfMdew7wa6aaSRcetV6PprRZxVEECFUcTk93G1aLbt3JDv8kNIBhlWl8BK90/H
         kKLqDjK1GMGYVwyTEWvVmqAu3UYsmgylHduT49z3sS5fdDcSeFrVYgpX1dhgYezb/3NP
         fwlPwkGQs7oQGXB8utLgXltRYZocoLahn/KfJzcpYB01aMNl5FIBtoaNKBZ/A7MWEerb
         6TnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkHPJzkJHo3C8aBGUfIOgMM+b8OHWzIMUWDsnZa7N1k=;
        b=mIe1EYfdR66QDmIthtWEXu72Tqf8mOGlXxpHAcGpG/1UFozKjNLUOhDpIJ9ZVO/X6M
         x9B9DoPngfvvooE9YVdivIgY10pYt4Lz1ikH1O1Kz+01LeE6w+J6aOwI+G4mRujRUP1n
         jh62mEEy9+Yp3eDxm7DiCwJtV3tmUGJf9osoTvM5dkRAFnukWHkWduPKkZLGvpAQWQGu
         TZkbQS6QIPZoQPSYbzwXTAtClToF4L3qItbW7TPMsUAadFx1aZF7bXbVvNAMzHo4UhZ0
         pNG4ZMUlc8FutSmtjhJfCKztmN2RYHdzoBA+qB+pmLcGfaC5TkyETE7BHZXloKBW8Ulo
         K9yw==
X-Gm-Message-State: AFqh2koo1XfKeW3gh0JaVJ5jRgN7mWOuA1iQG3/Ix6lxUE+lYUc8zgOT
	IiF0tjCb+bniTKc4Pc8VaaCwU7Kl2yE=
X-Google-Smtp-Source: AMrXdXtOaLeTYMDPUjIrdtz26fA8ZJfKOvOXIWqt069LUP4m9pENc3LRzWOP0o8M2ZVkegGlWLQ+ug==
X-Received: by 2002:adf:f74e:0:b0:22e:6227:34e4 with SMTP id z14-20020adff74e000000b0022e622734e4mr28190755wrp.0.1672830365165;
        Wed, 04 Jan 2023 03:06:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/77] python3-setuptools-scm: upgrade 7.0.5 -> 7.1.0
Date: Wed,  4 Jan 2023 12:04:47 +0100
Message-Id: <20230104110548.2537259-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175402

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-setuptools-scm_7.0.5.bb => python3-setuptools-scm_7.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_7.0.5.bb => python3-setuptools-scm_7.1.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_7.0.5.bb b/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-setuptools-scm_7.0.5.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb
index a1e719f54b..7961ff7198 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_7.0.5.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "setuptools_scm handles managing your Python package versions in S
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "031e13af771d6f892b941adb6ea04545bbf91ebc5ce68c78aaf3fff6e1fb4844"
+SRC_URI[sha256sum] = "6c508345a771aad7d56ebff0e70628bf2b0ec7573762be9960214730de278f27"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi python_setuptools_build_meta
-- 
2.30.2


