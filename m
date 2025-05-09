Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEB5C3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 16:17:24 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.2671.1746807441811478227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 09:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yEeCG9YK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7394945d37eso2139613b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 09:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746807441; x=1747412241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D4GqnM+p5BUuaDEa90dSzqFqMRaIHPZvzJ//m3mSvqs=;
        b=yEeCG9YKaHKwNkmcIkcW5HMQhcT/oT/N4KSBdEU160xxGZu/Bf5Y5L+nusV0ya4HEP
         PbNzzQkNk/uW7WzaIrU5MObvNeyFCXdcerlPCreSLbUdQ9TlufzUv8LAnO/Lnh64EU2y
         xsYyZUJaMwWJmXbDGrcUagAtBSsbfWOX2uaNN4UXcUrbBFmmxKCV/rHl1XkKJwQPrjg/
         t0o+57T8DndJKQ3KaTYjpCKJ8DtL4NH6ygekY+QJjMsXroc6tTJZkm4bAP6F+MT6IBXP
         MB+Yx2qnV2IaDeiJ3MjvHyK/VNVkw3kx7KsgZTqP5TJ0pk//V030tR8bLchTAglsFQsU
         Ok2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807441; x=1747412241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4GqnM+p5BUuaDEa90dSzqFqMRaIHPZvzJ//m3mSvqs=;
        b=nDdbwkTwHgFzLkZg6GpTXeeU3t6qV2wkgB6IIFT73s8qkoZlJ8NokAW5nqodHSqobb
         yB/ySPEqB64sWVo9RnNlWASC6t3mnitprVFWyfTxixXEhr3mUkRiHs5AFMEGwciMqy6M
         TrN8j4QgbQT3JFjfwQGlamMWziAwQisxIIwklf0vkoBwoBi483TOUbiRpi+NR2SNd9/8
         wmLVqjw8VzyxeNeL6EbsC+WZLy+mipQPYVnKp1bIVPij35R2uiVuxnOD72AemPKs82wP
         3MWFZGNP2JdydFCLtkPDoxpOuudC+TCk+nR4LGTBlK0m6tJAyou3Y/EpaXFH83aRBljl
         RUJw==
X-Gm-Message-State: AOJu0YygRkZNWs0TqQ+2Gv6Qx86oZpSUEUd1tua0SaAadF/RfICTvAGu
	7ExHJCsm8cwsjB/2VL4PdPKKVtNuuVtQWAExm4A7f/jMqRAslPOHVbL39eauHu+SGASK9myraJg
	+
X-Gm-Gg: ASbGncvYY4R4CcYucgIm7naCSoxn51pzV/z+3/4xd+orLx6n8nJ8K7AwIFIq3Z3CkgX
	0oYCgm+wMKtoQFkyQkxjYXb3Z0aesBqkNDYNc9PptB2Dk6e+4gWFUc2XGju+czRJDi6EILZBo1d
	4LsSqNc4G+J5L1O0YjwczxYhFc0L/bNdnVeil1SvG2KVDsQm1QmiIDkIdFvJnNe2bCGflUzWLoj
	fxwhlYFeN5zKiv/d9lwcTVaOX5057ZyRgTR99+2GGJ/aN0qwyOzNCAybn2RnBZPFZHRoJt0Z1N1
	zkKpAjzonS9KObSX98r4wX4yiRs+uIC6
X-Google-Smtp-Source: AGHT+IFz6hTBpK27qheuaUssRsrGJWTGikGGMlW7uzK8urDX98NsT/Nump5JCVLH8JqwRp1hikJNIg==
X-Received: by 2002:a05:6a00:17a7:b0:740:6f86:a0e6 with SMTP id d2e1a72fcca58-7423bc5ba52mr5141322b3a.6.1746807440814;
        Fri, 09 May 2025 09:17:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742377050fesm1919134b3a.24.2025.05.09.09.17.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:17:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/6] Patch review
Date: Fri,  9 May 2025 09:16:38 -0700
Message-ID: <cover.1746806788.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 16:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216236

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, May 13

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1554

The following changes since commit 25ba9895b98715adb66a06e50f644aea2e2c9eb6:

  Revert "cve-update-nvd2-native: Tweak to work better with NFS DL_DIR" (2025-04-29 07:45:33 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Haixiao Yan (1):
  glibc: Add single-threaded fast path to rand()

Hitendra Prajapati (1):
  busybox: fix CVE-2023-39810

Peter Marko (3):
  ghostscript: ignore CVE-2025-27837
  ghostscript: ignore CVE-2024-29507
  qemu: ignore CVE-2023-1386

Praveen Kumar (1):
  connman :fix CVE-2025-32743

 .../connman/connman/CVE-2025-32743.patch      |  43 ++++++
 .../connman/connman_1.41.bb                   |   1 +
 .../busybox/busybox/CVE-2023-39810.patch      | 131 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
 ...dd-single-threaded-fast-path-to-rand.patch |  47 +++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 .../ghostscript/ghostscript_9.55.0.bb         |   4 +-
 8 files changed, 230 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-39810.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path-to-rand.patch

-- 
2.43.0


