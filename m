Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A194C25B0F
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:06 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.22450.1659940971095808254
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=po/BmA3V;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id j8so14771575ejx.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ifAPpm5iDY7sBirbPUn6mFoJxoMEp4B19s1HpiH6Lc=;
        b=po/BmA3VpamPz7s0ohwiGIxdqZ1eusfmDkaY8KiAw7tJqTRA6HWWQqdoDCmxePrCL/
         QJBNtYohNDJS7wbVn9iBDjppMcj4OvYcL2evXI8uiaJ+DUSpKH2jl9WUoneHrFyix8hq
         Tgw0Fl8uGyU3vouz5oSU+ONNY8kF8XyW4wCp7+RdSvC3NndMgVudkgFQQ5W/NFRWD5m/
         BBEEKVShzAnqN7ZVCiY/JeS6CEp4bkUR4HYlaAEuaNXHIzJyilUa8vf0/kF6FQiTpHqO
         KT99wM4uQJgg/Rn/ylD2M39LHK7ce59pDlWVhUNP63drCLJIrXXEgz0MoUDfmob+KXvi
         6A4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ifAPpm5iDY7sBirbPUn6mFoJxoMEp4B19s1HpiH6Lc=;
        b=ASPIYFlz4qKbhSaJg9ss+cRTjBkwzjm+IvjP3mgIUlQAHwbkhTqw/Cjr8CO8q4pfOi
         RMW6QuGBaBGdgfM0T2SaGdvG6+YPWM4vRISgvxHu4GVr9RwFaCjeQIl6mYhqOxHcHV41
         hwHbA107cOKnIAfyly3DLuu1+r6hO53q6BkhzgGFbmyXquiHFa6uLNwALzncTOYYAWyW
         DX/Y+/SUY4EH53M4Fw4P7gY9FqA5QQt8dY0HZMqAC63B3AFXBnUSYXdwCGk2auYqbXe1
         7+2rGvZDo1LEY+E1+uKbt6rBNjaktfUDNIDUVLtK8DmbL72+CFvZHWFy71iL37MdKkXt
         w8qg==
X-Gm-Message-State: ACgBeo3kw/FvS+PfcF7CopvYy5AC3WWhMWPjxd/8b8KJCEcEhfS3zAA5
	J1ek5r1ha+FU8EXc8dQHJH8/NQ3h824=
X-Google-Smtp-Source: 
 AA6agR5VMyko33xidYLSPDzgQ1lGnzz4J3C/VU5R3KNrxXV6puVpUV6T5w+Xo7uM4tfQgSU977RBpg==
X-Received: by 2002:a17:906:8a63:b0:730:9e5c:b456 with SMTP id
 hy3-20020a1709068a6300b007309e5cb456mr12476215ejc.571.1659940978667;
        Sun, 07 Aug 2022 23:42:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 20/44] kea: upgrade 2.0.2 -> 2.2.0
Date: Mon,  8 Aug 2022 08:42:13 +0200
Message-Id: <20220808064237.3975347-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169043

License-Update: Apache licensed bits removed
(see https://github.com/isc-projects/kea/commit/65c988f475a028b162054a4d8e8b2e2acbfe3530)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-connectivity/kea/{kea_2.0.2.bb => kea_2.2.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.0.2.bb => kea_2.2.0.bb} (93%)

diff --git a/meta/recipes-connectivity/kea/kea_2.0.2.bb b/meta/recipes-connectivity/kea/kea_2.2.0.bb
similarity index 93%
rename from meta/recipes-connectivity/kea/kea_2.0.2.bb
rename to meta/recipes-connectivity/kea/kea_2.2.0.bb
index 13da1f858d..2c2e5a74dd 100644
--- a/meta/recipes-connectivity/kea/kea_2.0.2.bb
+++ b/meta/recipes-connectivity/kea/kea_2.2.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "ISC Kea DHCP Server"
 DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It supports both DHCPv4 and DHCPv6 protocols along with their extensions, e.g. prefix delegation and dynamic updates to DNS."
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
-LICENSE = "MPL-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b4ecee995eeb6780a17dd7e539e97abc"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=97ce14bdd2733f5b84ab5e29380d057d"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -18,7 +18,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "8d28213bdc8e2bb870a383b30ac1e53d54e1eba43d2f86e5151b08b66aa6cf32"
+SRC_URI[sha256sum] = "da7d90ca62a772602dac6e77e507319038422895ad68eeb142f1487d67d531d2"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.30.2


