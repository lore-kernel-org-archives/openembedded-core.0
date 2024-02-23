Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB68C54E4F
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 13:25:48 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.10423.1708694741005357877
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 05:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=yCxdfe/v;
 spf=pass (domain: baylibre.com, ip: 209.85.221.42, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33d32f74833so437015f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 05:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708694739; x=1709299539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7s0jYH3p2f8i8kU2ab3hX2akhry3jIJ7/rjn58WBII=;
        b=yCxdfe/vzvkpqKX52livNTxXAmJZ1nVDhtkFJys5JOyXCA1oHelLX17MGTiZWMT9+X
         /cgwUCTtIPjZWcsyBIB7+fklzxdY9UgpLxf78AZUEuRvmAWg7BYVxSEi1MVyP8lb4c/+
         ooPTX7GpUPvspYdvGTtOrdN/7dnj6KBuGRaLfwJNvormv8JlCmXL+AhC0VPVa1xaDsHK
         JSL8ncVz0iW1QTXC+zQkkJfr5XzE418pZk5ud+4ks4k/X5yUOWsrza7QQS4egAh2MsKm
         w4Y2QbAPjfI9ep0wZct4tAB8kY3GWmx7XSk8/etioMBRl69V3PUXxHlx1wYylrf/z/fN
         3ppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708694739; x=1709299539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7s0jYH3p2f8i8kU2ab3hX2akhry3jIJ7/rjn58WBII=;
        b=N+48FWPxKImDNOsiXeN2hjZwJcegcjY+TRSiAZ9TpRBd477dfe3XJpxfpa+IcgGo17
         u+rA/G61WN1Srl4ROOJ857v0V1jcz6ofVNQpeA4ss2j8z+uL512mz8QCyNkeU4EIoRtt
         cjg02O1xhmF92o1/t5081RI6KTgKZ8GgiGV/QCC5qOTxCIKhsIj+MfsFHj2COqghaOsj
         VamdpjwvAeoEmqnnllWLn27OCo9Z3pMNeSLDRwjlRaUstPPxPvxVN73QANCl9Tl7psSJ
         ov0HWje1eMk8+b96SDFjt5nfNA4/7Q0k9CUyf0Ta7XevHhD6M1+aaSe3uUqwx8USO05b
         ZDHQ==
X-Gm-Message-State: AOJu0Yy0oJGpGQBxy9npUwhVmdEWauWJHUcF/htwgYaNaEF9qhB8Vm47
	+NWEpdZa4JB4BXmF4GPCTJIbLeDHyBMZGQdhpReYfAwei9+VUq4nQNS/cy1lNjsUVCp52zS9XOA
	Dr4U=
X-Google-Smtp-Source: AGHT+IGTISZW+aJ/SBVOBIq5FiYKgeIvjJLDrF9ufR9Hq1Ay/q0iq/0vjvymuYq5QgQACcEkhz5/qw==
X-Received: by 2002:a5d:55cd:0:b0:33d:4630:a106 with SMTP id i13-20020a5d55cd000000b0033d4630a106mr1575557wrw.37.1708694739596;
        Fri, 23 Feb 2024 05:25:39 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id cx16-20020a056000093000b0033d3b8820f8sm2793450wrb.109.2024.02.23.05.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 05:25:39 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH v3 3/3] creategroup*: Remove coreutils-native as a DEPENDS
Date: Fri, 23 Feb 2024 13:25:22 +0000
Message-Id: <cdb29e2b45d7f2e691b4c662b7bc09e8505f264d.1708694024.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708694024.git.pidge@baylibre.com>
References: <cover.1708694024.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196078

There isn't any reason for coreutils-native as a DEPENDS, so
remove it to speed up tests.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta-selftest/recipes-test/selftest-users/creategroup1.bb | 2 --
 meta-selftest/recipes-test/selftest-users/creategroup2.bb | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta-selftest/recipes-test/selftest-users/creategroup1.bb b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
index ebbbfaa83d3..afd23ed1eea 100644
--- a/meta-selftest/recipes-test/selftest-users/creategroup1.bb
+++ b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
@@ -3,8 +3,6 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 LICENSE = "MIT"
 
-DEPENDS = "coreutils-native"
-
 S = "${WORKDIR}"
 
 inherit useradd allarch
diff --git a/meta-selftest/recipes-test/selftest-users/creategroup2.bb b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
index ef697f09b4d..f776f43aedf 100644
--- a/meta-selftest/recipes-test/selftest-users/creategroup2.bb
+++ b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
@@ -3,7 +3,6 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 LICENSE = "MIT"
 
-DEPENDS = "coreutils-native"
 USERADD_DEPENDS = "creategroup1"
 
 S = "${WORKDIR}"
-- 
2.34.1


