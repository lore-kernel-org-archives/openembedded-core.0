Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3FFC001DE
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 07:06:27 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.6313.1691132786532947414
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 00:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qir7jXKl;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b8ad356f03so12484255ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 00:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691132785; x=1691737585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RbD6PMH6NrDA9G47kEbWCUUB53wQYf0cBaoXtKLm2D0=;
        b=qir7jXKlDud89DGXJYrvkjMyVIZlMOrvTX82ctW2demX4W0Zkpw/vDUeDP5GKRhE2z
         CSVtvZraiKuE17RbklCK195F7G/2JI4N0ZECFTSU7gsgu/DIvDMSNzvVvzDLa+d7PVnW
         BSBXwVGJb2od82hqlNAO+J4u7R/njr9r2LIx07860cQYbgJkY6XdrcEnhfttUPtZjwDk
         ybs+iKyL/gKK/aNbP5nEMnzYyHrpsn8EgtNJfj+MJJFGKabcjoCpsJ6gNJ37rqkkoo+e
         plNijpfh58Nz/mvCoj7WG8a5CrZNJqmdK+/VRak+d2JtOOyC6OR+Asyv6KEB95mgzLIY
         xd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691132785; x=1691737585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbD6PMH6NrDA9G47kEbWCUUB53wQYf0cBaoXtKLm2D0=;
        b=ayDeLeKdO7BIFd+2psXfcR58/CGh5oZmTJW/Ir5LWJYw5LmLoJiiwyYRtYSkgcA68i
         TtMZM9T1jiCYNYouYAmp3WEYo68mgxPvEzicjvnBqUma6VADD3uns/16YMuF/6cT8cxo
         fMcICXiiA9zzQJXqgRpz1hUjQiauKJApYzPnIeeXeMJcBrJRvhC/j72yXmobQugaKCrQ
         kjP58NLmH0m2ossUTFbbpaiBGkkCl9KZVv+TFSlW4NFtKeeYXX1yZjJb3dUHCxTe5Y9v
         i3+gB2VD+395Z2Ip4JVgv4BxdKeI/FZgvYqIVyGPrxyiR8XR8cXSsnuFr8HoSeiqJrPi
         sCHg==
X-Gm-Message-State: AOJu0Yx+OqRaj4giq96fS0SRY4Qv9gryMg85MbqGWsnKgTVtpZME20vX
	cjPDOxP45PlPlQG60xnxGfv88uSbgcM=
X-Google-Smtp-Source: AGHT+IENRT5EEEJrd3PA1WvB9dNirbeBci5g+LD9n/gs1HnrMRafDNMWvIs1yHkDg0yFN5lPzb+krw==
X-Received: by 2002:a17:903:487:b0:1bc:4adb:ed with SMTP id jj7-20020a170903048700b001bc4adb00edmr731784plb.38.1691132785347;
        Fri, 04 Aug 2023 00:06:25 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:8005:8fc9:b43a:ffa3:6ed8:9b69])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902e5cd00b001ac95be5081sm969033plf.307.2023.08.04.00.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 00:06:24 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] kea: upgrade to v2.5.0
Date: Fri,  4 Aug 2023 08:06:13 +0100
Message-Id: <20230804070613.8928-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 07:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185510

Changes:
Update license checksum: change in copyright year.
Update sha256sum for new version.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 meta/recipes-connectivity/kea/{kea_2.2.0.bb => kea_2.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.2.0.bb => kea_2.5.0.bb} (94%)

diff --git a/meta/recipes-connectivity/kea/kea_2.2.0.bb b/meta/recipes-connectivity/kea/kea_2.5.0.bb
similarity index 94%
rename from meta/recipes-connectivity/kea/kea_2.2.0.bb
rename to meta/recipes-connectivity/kea/kea_2.5.0.bb
index 2c2e5a74dd..066e3ee301 100644
--- a/meta/recipes-connectivity/kea/kea_2.2.0.bb
+++ b/meta/recipes-connectivity/kea/kea_2.5.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=97ce14bdd2733f5b84ab5e29380d057d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -18,7 +18,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "da7d90ca62a772602dac6e77e507319038422895ad68eeb142f1487d67d531d2"
+SRC_URI[sha256sum] = "5b1553cd50928976925b82e5f7f2792f8e9e9244cad66820bc640fb3d50428f8"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.39.2


