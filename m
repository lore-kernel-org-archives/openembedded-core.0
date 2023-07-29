Return-Path: <tom.isaacson@teknique.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6314C0015E
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 19:05:15 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.59964.1690657514879561980
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jul 2023 12:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@teknique-com.20221208.gappssmtp.com header.s=20221208 header.b=idg1Xh/x;
 spf=none, err=SPF record not found (domain: teknique.com, ip: 209.85.214.177, mailfrom: tom.isaacson@teknique.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1bb893e6365so20226585ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 12:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teknique-com.20221208.gappssmtp.com; s=20221208; t=1690657514; x=1691262314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cDHr82RKGqLevgomvhdYncuBQoZwDP/3a6Vi1rG+axo=;
        b=idg1Xh/xBqZp35rAktuwz4Q1YOQgUFojFh5MpgcXrA0c1lBCeMyzqMWFM+GneixVqk
         8cCQGsnMyFhF79C3vCKgfPRMR7WJeagOmgO//3lh0UIg0ijNXuyaTkLYoQVXdU70tX+y
         dYgfOWbSBU6mjb8fYek/QMl3ch2ZkGDMyG5NdJa15gfNyyjLlyrp+BS+7PXWemxcwqjc
         MWk3sAqWvfKMS92tsR9OZ/lih+prET4X1GI4WHBCQZVbL/H/4obg56PZgWqKaD3W/Cak
         6b1/Zdg2xYnlUGQEgZXgWKYLoqC8jzFAfe9SPwIFfErrrs27oK9h2yfREO02rSQ+l9CJ
         x5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690657514; x=1691262314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDHr82RKGqLevgomvhdYncuBQoZwDP/3a6Vi1rG+axo=;
        b=Hw49T9uglQ0eJD7jnhLJNzDavcx2yNdeJPmDObJWCW84NmJodQAJHAT229WRrrChsE
         dVBvP7exJCBjpdlr87pJZsFqiQBnD2vK9vvts9OAEZl8OgKzCN+PMloyIdsfWxYA6UhP
         OQY5XHV93uOqnRMFUCX2toc1SqTNWZJErnfTrDVCJiSpUrTnxaBNTocK/uN/3r7vq0dw
         er+fDr0UlOP1xObrO9wMoey3k/j0ffL18x0ZI43g/tItvrX+MOKDqLsMMU//EPTxS2GH
         tm6SdrSqL5QN1JM5sqJ+iAwMLIrGIUdL53b6Lf/k7e5IqnHiHfwY0lfKvChTu8xSGzCw
         bDoA==
X-Gm-Message-State: ABy/qLb/vXZnpxtw9htre6ofQv2gxW8hrZeDqaykDvpOe1q1A5LJJVwA
	9CZ9QyGsMnsDgxz6mklPbZJf6hxWMCGeT+tLqfE=
X-Google-Smtp-Source: APBJJlFKNZSRwZog6V7rYj7d+dclEbK8U/jNVMVU81HpqrqLzqLhzY6f5mqsaVAkSKdH9QKKjXtghA==
X-Received: by 2002:a17:902:7242:b0:1b8:e2a:9ede with SMTP id c2-20020a170902724200b001b80e2a9edemr4741645pll.25.1690657513837;
        Sat, 29 Jul 2023 12:05:13 -0700 (PDT)
Received: from localhost.localdomain ([14.1.36.195])
        by smtp.gmail.com with ESMTPSA id ix14-20020a170902f80e00b001b9bebb7a9dsm5623190plb.90.2023.07.29.12.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 12:05:13 -0700 (PDT)
From: Tom Isaacson <tom.isaacson@teknique.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Isaacson <tom.isaacson@teknique.com>
Subject: [meta][PATCH] Upgrade 9.3p1 to 9.3p2 for CVE-2023-38408
Date: Sun, 30 Jul 2023 07:05:05 +1200
Message-Id: <20230729190505.2711-1-tom.isaacson@teknique.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 19:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185058

Signed-off-by: Tom Isaacson <tom.isaacson@teknique.com>
---
 .../openssh/{openssh_9.3p1.bb => openssh_9.3p2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.3p1.bb => openssh_9.3p2.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.3p1.bb b/meta/recipes-connectivity/openssh/openssh_9.3p2.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_9.3p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.3p2.bb
index 3edc123b9a..5fb2dccdfc 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.3p2.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://add-test-support-for-busybox.patch \
            file://7280401bdd77ca54be6867a154cc01e0d72612e0.patch \
            "
-SRC_URI[sha256sum] = "e9baba7701a76a51f3d85a62c383a3c9dcd97fa900b859bc7db114c1868af8a8"
+SRC_URI[sha256sum] = "200ebe147f6cb3f101fd0cdf9e02442af7ddca298dffd9f456878e7ccac676e8"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.34.1


