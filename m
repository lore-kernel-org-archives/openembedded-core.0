Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDDFC41513
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:31 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.77636.1690740089922760978
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=wU8Qp/kn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-686c06b806cso2618472b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740089; x=1691344889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Cv2O1i7EIHS2n26YVDqSZ5xnl2ckxZHr9OrviA6p6M=;
        b=wU8Qp/knHx2ai+ypZZOQPYAsRTNsx4ABTK9RgpmERE5t6M7MdVnh+gVVciMuXvwJ/N
         P6nutU9nM4Prw+nhIrMUX76jwm6F2t/SqcgaDhPnmJ8xqNiAietgkzdj0dOwj/pbSodp
         hTfQnP/ajCoGdTB/UrlODU5/hgI+nviM/I4PEqmM0wtDSGptfkTelFMtgxgwdIB9eHg3
         yfqWKI0UpEPnYmpyf9zfHLQ5Y7Hy6dIsCnucf5ZJDOYMdgEASapGznTT+t07VQffs4fs
         UlR4IDmML/OndFk+evfE/ZS0o49y3bq3YXLfbOjjVC+hbSJh+qdylKzqtRN7SLjrr5Cz
         d3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740089; x=1691344889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Cv2O1i7EIHS2n26YVDqSZ5xnl2ckxZHr9OrviA6p6M=;
        b=drUnQwzwMpEJYj/9OJglOhm9s5vO0bAkLwqXpZix7cjaAiwPcnBNFXnfJFYQJlOO3m
         H+bVNHWTIeHFHFJYkVAQ/0a47tvU1ITh3lU6Zup537S8rmCmKVAR4Jh5ki7+hxYvGFbr
         WC3reiB45E8oLc8UEnDGhyr7DofUyP9yyiQORJ8yniDaj91E6OLycrgFydqTcWp9hdUM
         86u6O5yKLM8nPo5HRH7HoJa2O42svkFIb7L97nJZrNEDr7A/Kul6yd23ImK8bht/M2y9
         Jh107O25z+CU8Vaf6zw/2yIDK3JMIy6xZghWMPfG4ahLqYm3lZU4MxhbASsgHF9qxEwx
         ic6w==
X-Gm-Message-State: ABy/qLaGCNU44+1VnoJ6PXRP8Q381HphKP1V3ORxjRmGOWLX7nVGEoRk
	EGaT8T+RuWDXSIc97ImR9pWM5Vedk179YrfEjpfhzg==
X-Google-Smtp-Source: APBJJlH1SZvX4OLvLmsYkPgNE5GjjLNMskwtl8TVa/qVQ13pSqKWMVvwoxg+uoIV2TcYF13YJuzzww==
X-Received: by 2002:a05:6a00:170f:b0:686:254c:9d4e with SMTP id h15-20020a056a00170f00b00686254c9d4emr9609415pfc.14.1690740089002;
        Sun, 30 Jul 2023 11:01:29 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/30] kernel: add missing path to search for debug files
Date: Sun, 30 Jul 2023 08:00:39 -1000
Message-Id: <c43da86824bf8be47edbcadb9c63d2273ae5e3f8.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185094

From: Andrej Valek <andrej.valek@siemens.com>

Since explicit debug package creation via ${KERNEL_PACKAGE_NAME}-dbg has
been added to kernel, it has to cover all PACKAGE_DEBUG_SPLIT_STYLE
options. For ex. when the variable "debug-file-directory" package search
path has to be set explicitly, otherwise it will not find any files.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c39da147683dcaaa244b3ddc4531c4408ad5c9e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index fc48737869..a82e4cf942 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -672,6 +672,7 @@ FILES:${KERNEL_PACKAGE_NAME}-image = ""
 FILES:${KERNEL_PACKAGE_NAME}-dev = "/${KERNEL_IMAGEDEST}/System.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
 FILES:${KERNEL_PACKAGE_NAME}-modules = ""
+FILES:${KERNEL_PACKAGE_NAME}-dbg = "/usr/lib/debug /usr/src/debug"
 RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (= ${EXTENDPKGV})"
 # Allow machines to override this dependency if kernel image files are
 # not wanted in images as standard
-- 
2.34.1


