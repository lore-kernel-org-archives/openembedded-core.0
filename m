Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D93BC02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 10:03:39 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.39956.1737540211265962738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 02:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LjfkUyeY;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43622267b2eso66196905e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 02:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737540210; x=1738145010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F3NlX3fEZbJDxR+R0n9LSgRqqt8g3Jc19Qh0iqkMqAk=;
        b=LjfkUyeYzSjlZVhHeI82z9SzsLfL4hmwyh+e9b1nZ+PlcDOqM4DzgJvfwZlWaR9v5v
         PJ6fT+KdNojtDg/JsoM372BUUusO7tHLUlTPfXUxHxwjVSs8Dz4agSzg5aeXssASO8UH
         FloK7LN/6/oAbidHv45UAgiODc6tjaJrfN660iq2D0kC2dZWqHsgJYBSlMx3Hu1UmDHr
         /+CQL78dYPDM5sRNhMV3aWTJ+9K0Gnmq3V1pXVNx1AOJ+3Hn/t2+oGarwrVdnC9/ip76
         Ru7YQy+f3zOjbW93PdVia5GMYWJTgW1ITXUHEAVSft9SiwnxnyG1wxzEEtJfOtJt8OaJ
         9J/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737540210; x=1738145010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3NlX3fEZbJDxR+R0n9LSgRqqt8g3Jc19Qh0iqkMqAk=;
        b=sXd8CFVhfWv9Uqms+cshWTi6gt0//xnGRxnN5cVRj0V8kUCm5lHJNm0oR+WkG37YJb
         tCfMX58SKqk+z5Tpd1WuAtndSPsPDm/tzDFxs7ywhhWMfn1gImgAiuo1p1WOYoZCNHJk
         USf0ug+kGa8Vy4RKw8DQM7UMaUoAYSqnHGTPt1BKwXU2JqK6yJdJkLF/w2AMJcJpCflM
         F8ZNpcVYYNomhNgv74D762oO0YmnHPsVYYvZ16BEoQ9KYKWso92wtrDjGEksvRbc44k2
         ivBPTzkBrvIQCmfpa+07GX1//TgfPLdfDw3VmqpLLd3UHxvYS49jgywkpIZwpTjE9+TG
         sCqA==
X-Gm-Message-State: AOJu0Yy+Ypl/gM4dTU8kZ3n0rtg8jlSIzVsrU9lg/D/M1AN1o4x9F9em
	6iJEW/Aw5ngaxgYri6m/Gk8siGx/UY9Sc+x5LwiccHK5RIkZQQosFpRdfg==
X-Gm-Gg: ASbGncsDUjW9df8GgV7/aoOsIaJ4KcdM+qeVyjjj+YKaQyiU9V7rnJIIM1D8jzw9Mub
	1sjVUU9Q4x1HlA2YtDp1eOhb1eLcPFbmJkG94mGedXj4yJOgS5oExq443Ghln7Kxw6zbFf1WbYB
	D4Ur1V2RkTAKVTdZ7wGpCT8h5EamPyWKtGmqkqFOo4P9wCKV/+rn9VC6vyQjaVYuSeQcuwGU2tp
	vhpjjsjw6vzOVP3FcW3afstxvoF93B15Jm+QSCQZeF3Xl+NZfaHyeh1YbBn38oyFqrBjdJbvKWu
	LwBn/fIbf40+ofYlKKlcbNB4n1pSf7c=
X-Google-Smtp-Source: AGHT+IH4QiGEPwxpeW9j/1/sgoptivPpJM+JACEJGUQ1TsvG2OIav1crFR/dCR2IVq5SQ4ztg6zhxg==
X-Received: by 2002:a05:600c:c87:b0:434:ff30:a159 with SMTP id 5b1f17b1804b1-438912d54b1mr218549275e9.0.1737540209290;
        Wed, 22 Jan 2025 02:03:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221bf0sm15606997f8f.28.2025.01.22.02.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:03:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] tcl: disable 'zipfs' feature
Date: Wed, 22 Jan 2025 11:03:22 +0100
Message-Id: <20250122100324.1561841-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 10:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210140

From: Alexander Kanavin <alex@linutronix.de>

zipfs is a new facility in tcl 9.x where various data files are bundled
into a zip archive, rather being separately installed.

Then that zip is embedded into libtcl.so from Makefile, thusly:

cat ${TCL_ZIP_FILE} >> ${LIB_FILE}

This is a major case of face meeting palm: any binary object
processing on the resulting .so file discards the extra data
at the end, and that's exactly what happens in do_package(),
resulting in a tcl installation without any language libraries.
This is not caught by ptest because it runs against a private
copy of the source tree.

Additionally, it helps to have data files on target systems
as files that can be viewed and edited.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/tcltk/tcl_9.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
index 0ba7288a600..485b293768d 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
@@ -37,7 +37,7 @@ inherit autotools ptest binconfig
 AUTOTOOLS_SCRIPT_PATH = "${S}/unix"
 EXTRA_AUTORECONF = "--exclude=aclocal"
 
-EXTRA_OECONF = "--disable-rpath --enable-man-suffix=tcl9"
+EXTRA_OECONF = "--disable-rpath --enable-man-suffix=tcl9 --disable-zipfs"
 
 # Prevent installing copy of tzdata based on tzdata installation on the build host
 # It doesn't install tzdata if one of the following files exist on the host:
-- 
2.39.5


