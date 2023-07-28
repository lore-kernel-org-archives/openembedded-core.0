Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B81C001DF
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 03:48:14 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.25562.1690516086695561734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 20:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jlcqgKqt;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-26809f86bd5so998734a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 20:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690516086; x=1691120886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ftF8BaxQdmA1UhJsvyxw4749zN5j0jlfny5zU0XmSiE=;
        b=jlcqgKqt/xJMBx/Qk1ne545md1Ipt1cKfCUCtv/mrspKK+AtxmOALY11TKu+5C9qY6
         9v4gQQC7GIFqcRcEjpBCvLeuMa+E1+EO0tFpKEbuExxsO5guWnlRnPtGz0BA3bHLY9Ao
         BB4lu1yiUvntcERvZ1FfBbVgIAO2fEnFhFdj1nT7kjL6FvtC8gl5xv8yaGt8NsAIZdao
         KBhLtelLQa/xuwc+eitkm4cPacLWxvcaSbIZtu5lLXV5qZYKfLBt0cd0oEWR2kxg+nf8
         gJV81l88M58rGrT7W0hiaxkjY47x7y8kVfoVeX+bqi1GwtzP9PGo8CeXmzecrX1ht0in
         Y0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690516086; x=1691120886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftF8BaxQdmA1UhJsvyxw4749zN5j0jlfny5zU0XmSiE=;
        b=iWCu90YQll5mG8I/ObAuBAcpyUQL3/KAJdyqi8qKXvZlr0tzLlnPyozZ1Af7KNkltF
         8ZWMer34M4DPvGf6DOTr3+YC9YxumjAz3O9db/DhMDBrhTOylTpJ6zFilYpZz2YhsKW0
         +X4a2GPfwgdWuOM5g60Eg9is8aEr/8t+uN5p4PO7twnOVxjwdIYuVA7bHkDFPd/6ozY/
         56dwmcarONXKvgz3EbT+Ifc8xNFuinb0DzoteI2H5pSXB/uy2gxlFjn2+5SvQcCffpGr
         IMmpOWx/pajscgdlBXK/4ELMvgk9Xt2txEkA4/3NnuKAUGe0KnOgVWL9eVXIeXRzDpPA
         KF7g==
X-Gm-Message-State: ABy/qLac67mVY62rJqAeh0rsoDwljV1OZ/LRcVTOZLdPpJlBz47ug1DR
	SpOWlcwvhbyqVAK2ZUGl5Fgk1BrSFo66tA==
X-Google-Smtp-Source: APBJJlHU7KDRdeTl8KBtdpYwHyf/xh8GxIQis6cR4oCZDlTeexhpNIL7XLlYqbFu0MWhp4jsJ+qZDg==
X-Received: by 2002:a17:90a:13c4:b0:268:47c2:e490 with SMTP id s4-20020a17090a13c400b0026847c2e490mr453338pjf.1.1690516085842;
        Thu, 27 Jul 2023 20:48:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::6608])
        by smtp.gmail.com with ESMTPSA id ms19-20020a17090b235300b00263f446d432sm3460532pjb.43.2023.07.27.20.48.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 20:48:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] x32-linux: Do not cache ac_cv_sys_file_offset_bits
Date: Thu, 27 Jul 2023 20:47:58 -0700
Message-ID: <3cdc8a355d5861c8e0bb1b9cf7984d469935cd9d.1690515949.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1690515949.git.raj.khem@gmail.com>
References: <cover.1690515949.git.raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 03:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185010

This variable is used on some packages e.g. gpgme/libimobiledevice [1]
but with new autoconf, its better to let autconf detect it than cache it
here

[1] https://github.com/gpg/gpgme/blob/master/configure.ac#L659-L670

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/x32-linux | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/site/x32-linux b/meta/site/x32-linux
index cf4ef147f7a..2e120480c35 100644
--- a/meta/site/x32-linux
+++ b/meta/site/x32-linux
@@ -1,5 +1,4 @@
 # general
 ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
 ac_cv_sizeof_dev_t=${ac_cv_sizeof_dev_t=8}
-ac_cv_sys_file_offset_bits=${ac_cv_sys_file_offset_bits=64}
 ac_cv_alignof_double=8
-- 
2.41.0


