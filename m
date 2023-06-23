Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B76CEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 05:19:33 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.36229.1687497563872646779
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 22:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=aOlsrJEm;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-668730696a4so64347b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 22:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687497562; x=1690089562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=858pKBjEBDQbPag9FMlNXeHS0dHUItPV2QdDdPX3aiw=;
        b=aOlsrJEmJ6EEpe5vkMmyzLpqiBGsRVKTU5NwTQQWwTxRzfWQI0ZqxRDp+MsVevGEOd
         iHcQNUuom3cpfDja8CvLS1jGSuC3AGaT9poJa2LPOsh0Ub74yg3iLe3BXpbsuUKARGSH
         JjgevxjxSwztcnsJ+jT7PQdBx3Qt1OZdVAWNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687497562; x=1690089562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=858pKBjEBDQbPag9FMlNXeHS0dHUItPV2QdDdPX3aiw=;
        b=Hm+6bmMvNbEokhjUWEOuC6aoe6UJdHXYKKW8NiIoW2NMeuen7emGHkACt4ACcNiP2u
         R7Uf928s9sxcnY8EMiy3RxbuCTj6McIyT+ZXp4Dcvpu0zF80dNOjzOFD0doGNu0nIPWG
         fben6GWz2xuJoaNOiClJeS5EvBg+HFh3mH9QdPKZYoMRLDsW5MPTtTzsQbdd9hhgu6Iv
         p0xBsjmj9W48U7su/Nu/XGuHIzO727kqR550d3iq9TYPUyaofTkkIK6sFY3SDQ+iGzLm
         lm/wieFHN4P+IaQmqyYshLEh2XCnGxjAUZntzGkmI5z379YLxTfUtMPYa2jvfQUSyboy
         vMiA==
X-Gm-Message-State: AC+VfDxCMxbtEgaK2Qr4xIX370UyD0X4EO4tJVqQaa+L6+/ERnh+9DTQ
	tB/fAYRtMgo3T+l8WKxDW18BaUc0hONpT1CfPsU=
X-Google-Smtp-Source: ACHHUZ6haYy7uz5zaW0lyUKpGewrxIVgh8IaCchUea7/kfytYKun/nfWzV1BvNLeVA6pJ0bDpgZ0Wg==
X-Received: by 2002:a05:6a20:431f:b0:125:aeeb:f8f1 with SMTP id h31-20020a056a20431f00b00125aeebf8f1mr692884pzk.40.1687497562416;
        Thu, 22 Jun 2023 22:19:22 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.73.110.51])
        by smtp.googlemail.com with ESMTPSA id w15-20020a170902e88f00b001b01547d0e8sm6225751plg.142.2023.06.22.22.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 22:19:22 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libcap: CVE-2023-2603 Integer Overflow in _libcap_strdup()
Date: Fri, 23 Jun 2023 10:49:13 +0530
Message-Id: <20230623051913.843560-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 05:19:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183306

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../libcap/files/CVE-2023-2603.patch          | 31 +++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.66.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2023-2603.patch

diff --git a/meta/recipes-support/libcap/files/CVE-2023-2603.patch b/meta/recipes-support/libcap/files/CVE-2023-2603.patch
new file mode 100644
index 0000000000..c5ecb70896
--- /dev/null
+++ b/meta/recipes-support/libcap/files/CVE-2023-2603.patch
@@ -0,0 +1,31 @@
+From 8785077d6c69482a2814a2f771aaada2f6ea1894 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Wed, 24 May 2023 06:55:47 -0700
+Subject: Tidy up the overview example for the "cap" package.
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?%20id=422bec25ae4a1ab03fd4d6f728695ed279173b18]
+CVE: CVE-2023-2603
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ cap/cap.go | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/cap/cap.go b/cap/cap.go
+index 784bf65..df32436 100644
+--- a/cap/cap.go
++++ b/cap/cap.go
+@@ -17,7 +17,8 @@
+ //
+ //   // Read and display the capabilities of the running process
+ //   c := cap.GetProc()
+-//   log.Printf("this process has these caps:", c)
++//   iab := cap.IABGetProc()
++//   log.Printf("this process has these caps: %q [%v]", c, iab)
+ //
+ //   // Drop any privilege a process might have (including for root,
+ //   // but note root 'owns' a lot of system files so a cap-limited
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libcap/libcap_2.66.bb b/meta/recipes-support/libcap/libcap_2.66.bb
index c50e9d8cc7..844ae58506 100644
--- a/meta/recipes-support/libcap/libcap_2.66.bb
+++ b/meta/recipes-support/libcap/libcap_2.66.bb
@@ -19,6 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
+           file://CVE-2023-2603.patch \
            "
 SRC_URI[sha256sum] = "15c40ededb3003d70a283fe587a36b7d19c8b3b554e33f86129c059a4bb466b2"
 
-- 
2.25.1


