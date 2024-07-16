Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A9BC3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 16:17:33 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.761.1721146651897030918
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 09:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CQf9VS+9;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4267345e746so39476865e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721146649; x=1721751449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rG3l0WJGVetnpAVAMt/8mQfUdqPA6Qp0agdpVMBMoRk=;
        b=CQf9VS+9QDSYpxbaTvRJsd97/+HYuQ8yT7DZIYpfyAOEJo7JSpalP3zyFasSGneVi3
         HgB2sd/2uXmtZ+3YpNEM7rslhiSdud1M9dUREDuGhiL50ZUcwxFbsEbN3cEy9Phm05Zc
         i9qq5qx8uqXXePXuLuRBOkYQUFdUdjaUq1fb00orILFDn2n3zmDI6z/Z2nRmuaMJxFYY
         bgBVxa+02RABjd7eBmRVXYrC95uL/ObRFBXMTlQQrf82sEMzKZYy8KSVFKPnAgaASppn
         12y4lNsnmrEKYkOjWzJvwzNfkL89AES9gGJyhXZsTwHkOI6q3TKpNmLklqBbG3QP7S43
         45pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721146649; x=1721751449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rG3l0WJGVetnpAVAMt/8mQfUdqPA6Qp0agdpVMBMoRk=;
        b=BHSCXgpwkoO5l0COYvpgxTQzbuMXzKhSSdSvbndyQBvcx2lz9QDBA0qHffBioKcB93
         gRXqUJi8mz3pvPf2KYF+Ox0i0weq6shjyi+2YGShj2GWnwCdUUndIZ+9bbRfvKOKN1eF
         dlvOMi3WVo3fO8gm1NJzb/iMUWeDYNqifj6Ck7IYbuO/BvVk15wsonLx3oAgyf6Fc/WE
         MUgmpxobRNMV9m5feqU+mt9mnaahbkoW14fBZ3+uyf3q/njFRet0pfmMMz3B4HNn5JTW
         PRwytztDcG3pmC9M/586O1j+PRaQ9vHbimENN90OdlSTfrC+eMp+93O5tKPYDG4pNp+U
         2qFw==
X-Gm-Message-State: AOJu0YwBwyFQ3K6Kc1pyB2Eximc4r8u8tedNDtFWcQULscX+pQMCJnkl
	x7W2pLxNte+VhkA2bT9ru6aCIgCAxC7pc3pBsXFenounrRU3UbXiYZMn+Q==
X-Google-Smtp-Source: AGHT+IElWQIMSLfTXFyayynxW3Z5aVGrSG/t/fL4pEKbIRzSwCgSkECENg4VjlOftVASEhISDLT7bg==
X-Received: by 2002:a5d:574d:0:b0:367:8c64:d969 with SMTP id ffacd0b85a97d-368261446f0mr1781623f8f.39.1721146648566;
        Tue, 16 Jul 2024 09:17:28 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db048a8sm9447257f8f.111.2024.07.16.09.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 09:17:27 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: cleanup redundant backslashes
Date: Tue, 16 Jul 2024 16:17:19 +0000
Message-Id: <20240716161719.4519-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 16:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202125

Noticed in the installation logs a few paths have
double slahes '//'. Doesn't seem to do any harm, though
it is good to clean this up for consistency.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 55aea1f3c7..a29af692cd 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -102,13 +102,13 @@ do_install:append() {
 	install -d ${D}${INIT_D_DIR}
 	install -m 0755 ${UNPACKDIR}/init ${D}${INIT_D_DIR}/bluetooth
 
-	if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
-		sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/bluetooth
+	if [ -f ${D}${sysconfdir}/init.d/bluetooth ]; then
+		sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${sysconfdir}/init.d/bluetooth
 	fi
 
 	# Install desired tools that upstream leaves in build area
 	for f in ${NOINST_TOOLS} ; do
-		install -m 755 ${B}/$f ${D}/${bindir}
+		install -m 755 ${B}/$f ${D}${bindir}
 	done
 
 	# Patch python tools to use Python 3; they should be source compatible, but
-- 
2.34.1


