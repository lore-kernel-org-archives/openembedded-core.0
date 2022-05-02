Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF00CC433FE
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:25:59 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.11156.1651501558062035024
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 07:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HmJg+L9M;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: rybczynska@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id k23so28117838ejd.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 07:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PlTmZn7Up68vcim6fuJYPl82KYqU1FXHmgggcZZcmQY=;
        b=HmJg+L9MrG8DIGiO9ZVFWQoLuWfWcjLrSgu+k3ldnqx4ecT3gNR9EHj+UZnjg/B9z1
         dComEe1nQprAPuepR1PGp+lp6z7Xrliu4JLgVSDb0UocTYwcEXgeU4nq7xweySJiagpv
         KLzFxfdyfGo+Vk7l5e2KaBwU57JEXHS5rfKkUDqEe1okXGi6JGePJYF2MxGPXTMCYl6c
         Z/As34oYwaa08QsYMbeJVksjIWuJDy66bk7LN1MnujqeSRxItzlbqyPHCSZ185a6NQJv
         DvHZMOGUgReux9jrtOmzf7Skcvmcb+gP2klu+nnWp+dArrRqv3Yi4u5oZjX5E5cXgFed
         JTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PlTmZn7Up68vcim6fuJYPl82KYqU1FXHmgggcZZcmQY=;
        b=iNwqRBp0lnb4WWJrGp7ZOiCGycvAldOxpIFBoG/oHtEw4VaZjqzaSowlr/1DvVXE+x
         2SI+LnCZ08g18dkxChfDBQ3eJ3EmIMg733EtsrINwQad+WYPaBOjLGMVxe6ssO6R7fla
         wCHvU2eWZBFvqYkw/8lVf8SwvVv9WxJ06FiomHvitBrUblQ45m1G0KdkItLOSyJklrhT
         tk/VK2csTcALagA27r+7E8tB+rRLBljbZNVV8OAUhncprJ5euYyv5htgi38ZfCzDZVdI
         m6+DgDX8OSJNex82e4hg1xYgRSo0avP9h1UaVqKyHd31JuRQiel9nxW/uITeMK+FGRAD
         Vfnw==
X-Gm-Message-State: AOAM533L5PArKqbAb7xm4eChD3EgIZeZ6nI5pdn89Tc4+gS5kZ3GzrMj
	u7x/0zUPDCx5atJ33GB0cTcOz1b4ZgM=
X-Google-Smtp-Source: 
 ABdhPJzJefmFJNbUbImbjekpCKSGNiGZiXWziguuHl6jj4yq9klbErmWD2smZngF2S4K77eRTqMGPQ==
X-Received: by 2002:a17:907:6d87:b0:6f3:d7cd:7df6 with SMTP id
 sb7-20020a1709076d8700b006f3d7cd7df6mr11130513ejc.248.1651501556005;
        Mon, 02 May 2022 07:25:56 -0700 (PDT)
Received: from localhost.localdomain ([80.215.178.199])
        by smtp.gmail.com with ESMTPSA id
 zp26-20020a17090684fa00b006f3ef214e62sm3634874ejb.200.2022.05.02.07.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:25:55 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [OE-core][PATCH v2 2/2] cve-update-db-native: let the user to drive
 the update interval
Date: Mon,  2 May 2022 16:25:36 +0200
Message-Id: <20220502142536.1654021-2-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220502142536.1654021-1-rybczynska@gmail.com>
References: <20220502142536.1654021-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165170

Add a new variable CVE_DB_UPDATE_INTERVAL allowing the user to set
the database update interval.
 - a positive value sets an interval (in seconds)
 - a zero ("0") forces the database update

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>

---
Changes from v1:
- allow to set the interval, not only force the update
---
 meta/recipes-core/meta/cve-update-db-native.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index af39480dda..c8c1cbf115 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -13,6 +13,9 @@ deltask do_install
 deltask do_populate_sysroot
 
 NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
+# CVE database update interval, in seconds. By default: once a day (24*60*60).
+# Use 0 to force the update
+CVE_DB_UPDATE_INTERVAL ?= "86400"
 
 python () {
     if not bb.data.inherits_class("cve-check", d):
@@ -44,11 +47,16 @@ python do_fetch() {
             os.remove(db_file)
 
     # The NVD database changes once a day, so no need to update more frequently
+    # Allow the user to force-update
     try:
         import time
-        if time.time() - os.path.getmtime(db_file) < (24*60*60):
+        update_interval = int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
+        if (update_interval < 0):
+            update_interval = 0
+        if time.time() - os.path.getmtime(db_file) < update_interval:
             bb.debug(2, "Recently updated, skipping")
             return
+
     except OSError:
         pass
 
-- 
2.33.0


