Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3B8EB64DC
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 08:31:21 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.3883.1686904277557080708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 01:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=a/WAKhqY;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6664a9f0b10so458197b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 01:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686904277; x=1689496277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDIksNOCa7PX+Y9Dll2NtZY8i9JRSaVb2wT3kE67sxY=;
        b=a/WAKhqYKwDk5c2DEla4tWDNkvSKBj2yTnlXPtKjm1lkm0WFZwe+d5AAVwNhuDqHEZ
         Xu3FdbDEpwsZsi8QW99jsfZ+te1vgZwG/na/EIv0w0/lADQMy30jQQdD28Q+B53YPSnN
         OB82KeLtmoLKFHgzYUlst7NLwc6SpDN4YUmrVZaAdNJBf3GPodOEieQH+jgrs4yF7D1G
         ocVuEtvBDdcs55f3fRRdjp4qTITJfwNMwx8iB+4vjDP9vljVw8rPo3g3hIk6WlHzE0kO
         s1L6T7A9uwalDXUQ0d576/zu7p3lDJUzftF5By7vD+whVWVKPiGobIce82pWJ4h6mSc3
         IN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686904277; x=1689496277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDIksNOCa7PX+Y9Dll2NtZY8i9JRSaVb2wT3kE67sxY=;
        b=kVQpX3ybrYQ5CnnmdX1pMS6oH4lQ3kkE90HraWgBVMel1AzX7xnSJYHe/KHwmyI5mB
         NX6E7p5cYvZEGk992j9szrEcbu+7hBUK5dA6+YOGb4Ec26xCbjTRdzOhMtMof0dJZfCq
         XuPjP8AHZGUpF7XXIR8YcOadznTQf4JqRMBH0obzaKW+uCXAxfWZDouWngVat1BR6d8s
         7Gc5h7OvZ3Nc8ceqLl+XIZW76k8k8iQXvagQdDWgBSHMr3PE2iAkMPAEMlYRwSI6yGIA
         4gW8LQNYHvBbPhpCex8dNMBQcfpDzm1NI7T1FgnJBpO51PaXTBEsqp+eB6X4mzHa014l
         I4yA==
X-Gm-Message-State: AC+VfDxcZiNJuX4l4oqhxDnI1yHEiTZyU52kEuwtykI5ys9546KcqjEq
	/NL91mKVMw2d74mIqFrBbBBVEPFRQyQ=
X-Google-Smtp-Source: ACHHUZ7p//ciRThL3DSUxQTRta3D2gR5lS8ho7LjbJPpmVtejbfgeT2s+A8od1sehGvTjixmVsfzNA==
X-Received: by 2002:a05:6a20:1596:b0:10c:663c:31c3 with SMTP id h22-20020a056a20159600b0010c663c31c3mr1763421pzj.29.1686904276492;
        Fri, 16 Jun 2023 01:31:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id s18-20020aa78d52000000b00653dc27acadsm12969145pfe.205.2023.06.16.01.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 01:31:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/5] go-helloworld: Upgrade to tip of trunk
Date: Fri, 16 Jun 2023 01:31:10 -0700
Message-ID: <20230616083111.3007680-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230616083111.3007680-1-raj.khem@gmail.com>
References: <20230616083111.3007680-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 08:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183004

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 5483ecc307b..ce6ec08c59b 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https"
-SRCREV = "2e68773dfca072cb81f219fc3b97ad34fe9d9f94"
+SRCREV = "5bec756976671f30903223ec46ff8a70dced4954"
 UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "golang.org/x/example"
-- 
2.41.0


