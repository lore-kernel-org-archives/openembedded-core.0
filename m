Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A500C433FE
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 23:45:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.44634.1638747937527736183
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 15:45:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dk5JV4iD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so6422181wmd.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 15:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rpZ+uez2u565gindSERWvCTBiYHa5apxYSHJHmp4MEs=;
        b=dk5JV4iD1QiUoA+POQjSy0gZf57tta6k5lf+dDOt+nfnUMjM6BRhpCYJh++H/3AHAb
         XL0QQMaMpMm+/yDUvbV5aB1XIKaWZ2TwDHMqfVMs5GBXOUsoUXxWaey8Xy3cvOe8GRse
         RFKzgkr8MfvUGIQsu4xIW1ELS7WQMt/+b069U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rpZ+uez2u565gindSERWvCTBiYHa5apxYSHJHmp4MEs=;
        b=steIvAxzAFd6LCHh6AAG6nWm8tEbgUr18UJCCHUyUfoRJ3hQN9VXStZtfpdEokkkUh
         rbprIxfGJf1HaFaaX4cWMjTT6vnEDQoXJ0fWsNM6/TeQlZVQ2LEf2aHWIjbJuZRP+wiN
         V/VShpATVRxesEg/tUs9MW86GxfAzaUvo6dRv80a3OZNScNLXutp15JIrFt2nj0mEWEM
         27/paq15MukceVNRxs0rk1N9sVXuRBusP4wepC9huRjIA7BZoWudGwfqvg32phkNKbXr
         CwgnAhF1WRi94wPLChrf0I6WRs8vRer3k0aLrH3dgvLJpnFmWuQQmcBfYoG5JE9RN8Wb
         JU/Q==
X-Gm-Message-State: AOAM532ZiGJPB07oAQja93RDHXVcK+6p4zSl8/X3NsXtnPNoZg29y7fm
	ROFbvUGSYRlD4tYzZs72h+d0V2UqLTLntw==
X-Google-Smtp-Source: 
 ABdhPJzpBUe75h9D5xUSQMMjxBZFbbUjZZQoL4Odk+28ibPUKw5ViJGTEW+xLc5ifrOM+o99sxleAg==
X-Received: by 2002:a7b:c756:: with SMTP id w22mr35100275wmk.34.1638747936080;
        Sun, 05 Dec 2021 15:45:36 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:50e7:dab5:2141:24aa])
        by smtp.gmail.com with ESMTPSA id
 b15sm11984071wri.62.2021.12.05.15.45.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 15:45:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] debian: Fix renaming packagedata dependencies
Date: Sun,  5 Dec 2021 23:45:33 +0000
Message-Id: <20211205234534.480206-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211205234534.480206-1-richard.purdie@linuxfoundation.org>
References: <20211205234534.480206-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 23:45:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159202

We've recently seen issues where libxkbcommon was changed in/out of debian
renaming and weston which DEPENDS but doesn't RDEPEND on it would show build
failures.

Looking at the sigdata file for weston:do_package_write_XXX, there were
dependencies on packagedata for RDEPENDS but not DEPENDS. Some items like
libxkbcommon are in DEPENDS but become autodetected RDEPENDS. The debian
class already handles RDEPENDS but needs to handle DEPENDS in a similar way
to avoid failures since bitbake treats them as two separate namespaces (unlike
recrdepends).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/debian.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 39b1a1a08b6..8367be9f37f 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -14,6 +14,10 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
 inherit package
 
 DEBIANRDEP = "do_packagedata"
+do_package_write_ipk[deptask] = "${DEBIANRDEP}"
+do_package_write_deb[deptask] = "${DEBIANRDEP}"
+do_package_write_tar[deptask] = "${DEBIANRDEP}"
+do_package_write_rpm[deptask] = "${DEBIANRDEP}"
 do_package_write_ipk[rdeptask] = "${DEBIANRDEP}"
 do_package_write_deb[rdeptask] = "${DEBIANRDEP}"
 do_package_write_tar[rdeptask] = "${DEBIANRDEP}"
-- 
2.32.0


