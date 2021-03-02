Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.9112.1614695303601336358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 06:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kV9GFGRi;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: flowergom@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id o38so13897820pgm.9
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 06:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v/PhHUwXFvlX7owKk1OGarlnRRvdtdSCIHTRpGFu6Yo=;
        b=kV9GFGRiO/c6arMuJmrjs3ruqNRrjrM8AAKCKsPF+ZcZPRHrqXCbvhWHNH1pXbhJgd
         vB6pVmakjCJthvxCYjxjDcHihSoKSHiKYPNM1M2ctu0ro/t/d/n8Sm4k1nd6iD8ZWota
         2dGz3vVnIa5kmTb3a0sERfTtvXuHgDpJ1L7rBFol3TXjTF5u2M86x1yM2J8GB94od4bs
         mQx8bV1LO8UrnnScJKJdXJiEWR6JMevYEhUjbNvWwUcOF2Eswk7UCPwrpMG9ZnOk3IJ7
         u/NE4z/C1Mmacd3r48288mSb4CJkLbsssBil46aTheCimb+Y8D0LQRTBZtnlwJmaJc14
         nbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v/PhHUwXFvlX7owKk1OGarlnRRvdtdSCIHTRpGFu6Yo=;
        b=VYlj8WSqmuZYjoSwpx5clnHLLxBKvTwaNy5TwhVbJkktLD9m5ziOLnvtJY74h4qklE
         Fv80CKmH7HRPjYEhecLyP/60ZxWNxvijnm2ZQBqQxgW/GIyEFdkloaRGW1Mv3OE7L1ap
         QeqHd9tbeQMQWIPqqYO7rHNts5cyA8gBAkXRT5XyV47ENYb9vQLhaavBTV8v1e3LQxY+
         9acsWBrmPDvKZmuNex3pF+NaFLNkpXshU+76UFfVbX6aeBAsUdlEdLn0xdTbVwGBdm86
         QuG2uvbcezxyKSM87nEfepES58b3rtzY89H4hQrQIAsVkQS/GyUVtPgVaVOfRu3Gcpif
         6GrQ==
X-Gm-Message-State: AOAM532d1M3KrHz7fTM9lnKl+kDHLk5WMhNOPniM9PA+62zkzUAC2TzC
	2BF10zbZ6GT6GV0fbDg9fXuq8BF1eha87A==
X-Google-Smtp-Source: ABdhPJxU2H72y4VkYiRsIQbSp4L0TjJLgdyyrrJjcK0MHQM9AlHV+Va3Ts1Z4dl+AJjqcTS5YUCPiw==
X-Received: by 2002:aa7:9848:0:b029:1ed:ce13:71f4 with SMTP id n8-20020aa798480000b02901edce1371f4mr3543263pfq.62.1614695302480;
        Tue, 02 Mar 2021 06:28:22 -0800 (PST)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id c10sm21907612pfj.28.2021.03.02.06.28.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Mar 2021 06:28:21 -0800 (PST)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [gatesgarth][PATCH v2] bind: fix CVE-2020-8625
Date: Tue,  2 Mar 2021 23:28:15 +0900
Message-Id: <20210302142815.1848-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BIND Operational Notification: Zone journal (.jnl) file incompatibility

Upstream-Status: Backporting [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
CVE: CVE-2020-8625
Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 .../bind/bind-9.16.7/CVE-2020-8625.patch      | 29 +++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.16.7.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.16.7/CVE-2020-8625.patch

diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/CVE-2020-8625.patch b/meta/recipes-connectivity/bind/bind-9.16.7/CVE-2020-8625.patch
new file mode 100644
index 0000000000..d3e165b9ae
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.16.7/CVE-2020-8625.patch
@@ -0,0 +1,29 @@
+From 5b671538216af78a0a7ef7464dc52ab2241ea7db Mon Sep 17 00:00:00 2001
+From: Minjae Kim <flowergom@gmail.com>
+Date: Tue, 2 Mar 2021 14:03:49 +0000
+Subject: [PATCH] BIND Operational Notification: Zone journal (.jnl) file
+ incompatibility
+
+Upstream-Status: Backported [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
+CVE: CVE-2020-8625
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ lib/dns/spnego.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/dns/spnego.c b/lib/dns/spnego.c
+index 671838c..82fd49a 100644
+--- a/lib/dns/spnego.c
++++ b/lib/dns/spnego.c
+@@ -846,7 +846,7 @@ der_get_oid(const unsigned char *p, size_t len, oid *data, size_t *size) {
+ 		return (ASN1_OVERRUN);
+ 	}
+ 
+-	data->components = malloc(len * sizeof(*data->components));
++	data->components = malloc((len + 1) * sizeof(*data->components));
+ 	if (data->components == NULL) {
+ 		return (ENOMEM);
+ 	}
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/bind/bind_9.16.7.bb b/meta/recipes-connectivity/bind/bind_9.16.7.bb
index 5fc2c1d3cd..82c1bb66df 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.7.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.7.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2020-8625.patch \
            "
 
 SRC_URI[sha256sum] = "9f7d1812ebbd26a699f62b6fa8522d5dec57e4bf43af0042a0d60d39ed8314d1"
-- 
2.24.3 (Apple Git-128)

