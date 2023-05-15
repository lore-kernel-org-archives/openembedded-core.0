Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B43FC7EE24
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 17:37:52 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.460.1684172268851402290
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 10:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qBSFZ7YT;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f450815d0bso65422435e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 10:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684172267; x=1686764267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EIRCvkiUDc6mjEJNlGcpZviq0PLurklRD+8/Rwwu9Nk=;
        b=qBSFZ7YTGYQaEjYUbgCwdQ3T9hTqPu71k0p6B2eOuImDyFBV9+PrHp9JnxD8ue5URZ
         rD0+rpHnZsovGGPMIRwf6sUN35nE8ZGwinlD/f8vxqjtjN5rEQo32st0hoPFhDeuABFx
         O/FVO+Wg8UUnn5oX7akUG62h/oSIP7j8PkDugFA9ZRGem2ekhADilv7NrusaVnJczRjd
         q1OsuEG4QqcJfKt83LRt6aKjSMle6ZAJEApfny8rjs6H83IIv1Ga3sacYBVMxD29ccTr
         fprTW64vLGaa3XyQcBbomu5daV8t63yCDk2/6FZm1AOeXfWE9nuuaa5Lp7ILDZhYWPW8
         oW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684172267; x=1686764267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIRCvkiUDc6mjEJNlGcpZviq0PLurklRD+8/Rwwu9Nk=;
        b=lyHIA5gK3iK11bQbxNm4WukQA96Ha7AescvG2was3Yj1VLgvNYnvBlBoXqkV5t0oXE
         FIn3t2ZIsMk7ZSuzlwyLrxONxi6AJ+kWTCJ+SVprMJywDUDcNWLC+u7Rsru0pvx5I2G7
         3UzIQGaPvtNO/sIbph0H6XWis4ZrYptohrQOgmC9yFbCsguKUcJ5q3XY0elUKewb2Egg
         lTEyDPoYbTcE5x2vG1pO/yRriBBlKBQebBCFwipNK+u+SyXYradFyqD0MXOv3ZH1RS/m
         oU0YdCawLNSqO5rc3+h7Q1QosQvl5rx+oS6eAzGiytjLdlTIyfsMyo7Iwp9Hik+WOt1y
         MCMQ==
X-Gm-Message-State: AC+VfDwhL3m7v60GgpMRq7zNw5E/sNMy55nSPJaMJQ6eoLZ5DNUl6dgX
	gpS+LEbvo3cuZTwDgUcQNRzuLdVkU0o=
X-Google-Smtp-Source: ACHHUZ7jjkLbaUOXr14C+AF0XoLyDJgRdUP/RMWz64eVK9hKBNDg2TmL6+bLp4Mu+27C47anJUYCJQ==
X-Received: by 2002:a1c:750a:0:b0:3f4:16bc:bd19 with SMTP id o10-20020a1c750a000000b003f416bcbd19mr22615431wmc.23.1684172266988;
        Mon, 15 May 2023 10:37:46 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f12-20020a7bcc0c000000b003f423dfc686sm42219wmh.45.2023.05.15.10.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 10:37:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] go.bbclass: don't use test to check output from ls
Date: Mon, 15 May 2023 19:37:39 +0200
Message-Id: <20230515173740.2095615-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 17:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181269

* avoids possibly confusing error message in log.do_install like:
  ls: cannot access 'etcd/3.5.7-r0/build/bin/linux_arm64/': No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes-recipe/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index b02a83a561..39bfaa5156 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -132,7 +132,7 @@ go_do_install() {
 	tar -C ${B} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' pkg | \
 		tar -C ${D}${libdir}/go --no-same-owner -xf -
 
-	if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
+	if ls ${B}/${GO_BUILD_BINDIR}/* >/dev/null 2>/dev/null ; then
 		install -d ${D}${bindir}
 		install -m 0755 ${B}/${GO_BUILD_BINDIR}/* ${D}${bindir}/
 	fi
-- 
2.40.1


