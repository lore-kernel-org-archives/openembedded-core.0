Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.11571.1595300985893258177
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 20:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries-io.20150623.gappssmtp.com header.s=20150623 header.b=flxtQ4ak;
 spf=softfail (domain: foundries.io, ip: 209.85.160.196, mailfrom: ricardo@foundries.io)
Received: by mail-qt1-f196.google.com with SMTP id a32so15135738qtb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 20:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries-io.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HxvCY9AIwdSaIXkvNSbHTGHhfXH5M+ticf8UC6t3bKs=;
        b=flxtQ4akiRVKQsRPFSD02TxgD6SsOOk/vpbvfE/prE2DuhZEkUC5jIHep46LN+z540
         TuJ2prSQnxJdI3b9gSZ/CKQvGyWVfm8NXHGpK+CkmUYdRKfTUpXXjKdqQbOhsGq8aH3E
         r+aQfSvlam0H9AuE6YYJo+buAGV4b5CvWgzISOfFGaJe/SRR3+dfJ/6JS3MF+K5IQ1nz
         +ZRh/7fIfScRvZL9ZvW8v+ybCMwyiYCTbJRhthKkPQGnRUG+yvlKfXfiHqaHrjEvn+UL
         QQucFF2tQjGanz3efaB7Cfop3Oeb5gqD6PR7RXOiaW2hxVtot5cLmPSXjN3AmB1oAdaq
         Gpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HxvCY9AIwdSaIXkvNSbHTGHhfXH5M+ticf8UC6t3bKs=;
        b=drVAIKtRVLCV2SLGP31RQQnfrB38mZthaXzbjHuruooWEkT4Hi598HdL6WAE5taw7G
         J9v4HShNJvHCC+2MvOM+mstxDqW9tN5T1GZ+ezzeQ4VkAbhzrT43VykvtpjPqnCyEIo/
         Di+iAomK5s+gEjCya59Qj47hN4/aITz+8pSW6SgnNcgaj+xw+JOV40FjREtBK5+OB7JH
         sLPxtBqkwh0Fueg6h/wq4535tcqAnAQswTuGMVUBxljPPvoq8QbfF5QwEUyrArmS284g
         mAU4fKXsLKg+ujqaKRBOb7LOVetskpZWSxa50lpLRsFDsAtEvlLc/pJXA1TpqpLrsgFG
         n7Vw==
X-Gm-Message-State: AOAM5316Liewu8C7rxexiI47wTSowk5JxlbWZ3+6mYJoXSnfeDqO6Gfu
	XTb0VSB9M0UAi8p6yI6KzY3mb9go4g==
X-Google-Smtp-Source: ABdhPJyuXuyBjyQUGxuMV3AZf0+3yTSaNp9pyKcGwlYarr0vLPGBQVXAMMsk8kT6fm8KJ+KDr4VU1w==
X-Received: by 2002:ac8:34e8:: with SMTP id x37mr27714365qtb.291.1595300984683;
        Mon, 20 Jul 2020 20:09:44 -0700 (PDT)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f480:fae7:ed55:c24c:450f:a455])
        by smtp.gmail.com with ESMTPSA id e2sm1351747qkm.115.2020.07.20.20.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 20:09:44 -0700 (PDT)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Subject: [PATCH] sudo: set with-rundir to /run/sudo
Date: Tue, 21 Jul 2020 00:09:26 -0300
Message-Id: <20200721030926.31939-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set with-rundir to a known path instead of letting configure decide
which is the best folder to store the timestamp files. This is required
otherwise it might end up at /sudo, which will cause errors on a ro
filesystem.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta/recipes-extended/sudo/sudo_1.9.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.1.bb b/meta/recipes-extended/sudo/sudo_1.9.1.bb
index aac505af60..d6bc1a9c3a 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.1.bb
@@ -22,6 +22,7 @@ CACHED_CONFIGUREVARS = " \
 EXTRA_OECONF += " \
              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
              ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-tmpfiles.d=${nonarch_libdir}/tmpfiles.d', '--disable-tmpfiles.d', d)} \
+             --with-rundir=/run/sudo \
              --with-vardir=/var/lib/sudo \
              "
 
@@ -38,7 +39,7 @@ do_install_append () {
 	chmod 0440 ${D}${sysconfdir}/sudoers
 
 	# Explicitly remove the /sudo directory to avoid QA error
-	rmdir -p --ignore-fail-on-non-empty ${D}/sudo
+	rmdir -p --ignore-fail-on-non-empty ${D}/run/sudo
 }
 
 FILES_${PN} += "${nonarch_libdir}/tmpfiles.d"
-- 
2.27.0

