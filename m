Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C254C7EE2C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 02:34:49 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.4695.1685500488963882696
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 19:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=kF2nBdo+;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.41, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5559cd68b67so2691684eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 19:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685500488; x=1688092488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvsJnlNyBSdkgD197HK0TQcZu+GCVg5e9V/BRhOEAPE=;
        b=kF2nBdo+ZH0z/+zihX14s0iwRxjw5pnhPxs6I+GSzgyN3NrtXMc3tyLy3T0CUYEHeo
         S605Yjp7lTshU+nUMu7iFBLM2wSpjDD9+KXJpIhTRRcod2uwftR9su/QIFt5a5TpdhXU
         k4fnnOtgqxc57OsD5+2o+behIEyo0xvL5obAdfWrCgeUX+0kgcmXQzcds5bkchbDW7zT
         R69R0TUmIbDAgTVTyhc1Lkr1PP19YNUliIBDUk2+a6hFJe2lqNZeKN/uc58jzbDqhAxG
         jvZf+YEqFW1P0UsXaVbkR2tGEK9zWS8EswWUlsz2cr0cZlPyOtEXNO5+n+gH5PqTx4BV
         u5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500488; x=1688092488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvsJnlNyBSdkgD197HK0TQcZu+GCVg5e9V/BRhOEAPE=;
        b=Ntpku0DJ9lS+a7IbxQRDcvt48zh1tDa4mUGljpL5cwNB7z9Ajb2J61AlVdtbRdkJ2/
         Ok3WdRUWi+BCXMSSioyZd3VO556eh7FSOOQKWzmdVjfMthtzQInGqHg4ZYOePm+AGnjS
         6nYWgeboxPpvyLKtPT+ZxTLTChdc4FCTkVeTUvWpa6MH4qyhDvGBoM4jzsvy/mSvN5NO
         7pwJfdDO8ylAr7bbwzRa/3AQioGjOZENrUrMuU6ywwcQ5FfIk45+L1VC+YYAgMSSVUm1
         /mHFbryDl8ZL1MtDtyw6CMFqmELX+1T4jmbFsgJpBoQIdnZBaDh55Rq4HxN9iY2KkFcf
         QFNw==
X-Gm-Message-State: AC+VfDzdfxRJs6yayhO30YmLkoZqspXKgTxszEhwYorN9L45EMHFhKAa
	siwYJqLilEALZLK0uItcpdzxQ+9wyC1Fu1zaQCk=
X-Google-Smtp-Source: ACHHUZ6d931Vz9JCHvRyQw3Yxl1Loga0SAa+dLt3kihSRlEiEobHAZZVyxEoClMpWEwSw7ylAy9RvQ==
X-Received: by 2002:a05:6358:9490:b0:125:7fa2:eb81 with SMTP id i16-20020a056358949000b001257fa2eb81mr275492rwb.32.1685500487821;
        Tue, 30 May 2023 19:34:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k91-20020a17090a3ee400b0023a9564763bsm92877pjc.29.2023.05.30.19.34.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/13] kernel-devicetree: make shell scripts posix compliant
Date: Tue, 30 May 2023 16:34:18 -1000
Message-Id: <b7d6fc07462e6fca09d0db7f43a62920250ef053.1685500244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685500244.git.steve@sakoman.com>
References: <cover.1685500244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 02:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181980

From: Martin Jansa <Martin.Jansa@gmail.com>

Use the notation suggested by Martin Jansa to avoid a bashism. Also
switch KERNEL_DTBVENDORED to the more common 0/1 notation instead of
true/false.

Fixes: 04ab57d200 (kernel-devicetree: allow specification of dtb
directory, 2023-05-02)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-devicetree.bbclass | 4 ++--
 meta/classes/kernel.bbclass            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 11b57adc92..e1e67cbc56 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -76,7 +76,7 @@ do_install:append() {
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
 		dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
-		if [ ${KERNEL_DTBVENDORED} == "false" ]; then
+		if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
 			dtb_ext=${dtb##*.}
 			dtb_base_name=`basename $dtb .$dtb_ext`
 			dtb=$dtb_base_name.$dtb_ext
@@ -91,7 +91,7 @@ do_deploy:append() {
 		dtb_ext=${dtb##*.}
 		dtb_base_name=`basename $dtb .$dtb_ext`
 		install -d $deployDir
-		if [ ${KERNEL_DTBVENDORED} == "false" ]; then
+		if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
 			dtb=$dtb_base_name.$dtb_ext
 		fi
 		install -m 0644 ${D}/${KERNEL_DTBDEST}/$dtb $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 87dd46e6fa..3d5422b09e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -211,7 +211,7 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
 KERNEL_IMAGEDEST ?= "boot"
 KERNEL_DTBDEST ?= "${KERNEL_IMAGEDEST}"
-KERNEL_DTBVENDORED ?= "false"
+KERNEL_DTBVENDORED ?= "0"
 
 #
 # configuration
-- 
2.34.1


