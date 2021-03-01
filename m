Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.1.1614637434508023586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 14:23:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qvHeS8ap;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: flowergom@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id z7so10805677plk.7
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 14:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Qx6XQ3px+KpQ1+0k0oMFkZslAyxskNGdmkwhmbAF/s=;
        b=qvHeS8apau5o2VyVGjRu65yV+pe4wdWMtHr/c7oXjyYcRqq+aQ1ppjuSytopCoWaLk
         MMySXcRKumBZlICwK9qMSZhhLHt9WWJ1VganpOzDehmETY2Zyo+DzJvBDXhbHDQOEcwO
         z648MC4iqjCpkohuxFRRI7xW5ot6uLhYEbHg6tYRc58AQjNaa4/G27uafapKnGWYtA0t
         F0YGw9lOIcn5Mx8Hz/DjqtTglcZpqUTBHrc0HgX5mVtpBBXR5VIaAlHX0uFBT4CFU8F0
         c1jrmPuBcleWT0qwfe+V028rlQfm/TpPuCCGkJwpBrNgSmHJPrl81amSaVBzpI3oaUbG
         +NBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Qx6XQ3px+KpQ1+0k0oMFkZslAyxskNGdmkwhmbAF/s=;
        b=sPWtE1xV+vfct+Ff3/iLug4pg9s91Wg8aVTvjRNG/QXnLfb/Bxa36rzi+dhwEhH1dK
         TPSx0u5LGEcEhVV+TykAaBlb5anT735OP6oU8OHtJB0Rie7FjOcuxenqqCfZApXjNc0u
         1ZE2EcY1SE1zALakEeMN0JfYa82nhO8S+3197wGyxpR7qZOF+w7CGSs3ru7z8N0X1+j+
         8f0Aobed1hpNoQ/6R3bWPPPG9n/Z5StXRMX/x0uf0jDZuBPUlP9Mt7JItDXhChN5Z4c0
         0095ry68aMt+x3r2aovNMMGCx0ZbUukvpB3vtXABtqOG7rSkUq1UrmPBv9lfQ+vudbp3
         vV/w==
X-Gm-Message-State: AOAM533eidsny/u1HqD0V3Sh01Ge2zynm/AtTD0rpLAbyzLQgykHOcsI
	Tqm6hQ5+EIvR4HN8/b8UcSPYuHAND6V1AA==
X-Google-Smtp-Source: ABdhPJzUWo/b/kvMYbpVBCr8g7LzWn8/X1sJxpqIsQovcqcPBDr9sH/gP/iPdOB0uCBFEOtd2hJm8g==
X-Received: by 2002:a17:90a:8:: with SMTP id 8mr1084740pja.6.1614637433472;
        Mon, 01 Mar 2021 14:23:53 -0800 (PST)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id h20sm18143615pfv.164.2021.03.01.14.23.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 14:23:53 -0800 (PST)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [PATCHv2] bind: fix CVE-2020-8625
Date: Tue,  2 Mar 2021 07:23:27 +0900
Message-Id: <20210301222327.2618-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BIND Operational Notification: Zone journal (.jnl) file incompatibility

Upstream-Status: Acepted [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
CVE: CVE-2020-8625
Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 .../bind/bind-9.16.11/CVE-2020-8625.patch        | 16 ++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.16.11.bb   |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.16.11/CVE-2020-8625.patch

diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/CVE-2020-8625.patch b/meta/recipes-connectivity/bind/bind-9.16.11/CVE-2020-8625.patch
new file mode 100644
index 0000000000..0d469ce23c
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.16.11/CVE-2020-8625.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Acepted [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
+CVE: CVE-2020-8625
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+diff --git a/lib/dns/spnego.c b/lib/dns/spnego.c
+index e61d1c600f2..753dc8049fa 100644
+--- a/lib/dns/spnego.c
++++ b/lib/dns/spnego.c
+@@ -848,7 +848,7 @@ der_get_oid(const unsigned char *p, size_t len, oid *data, size_t *size) {
+               return (ASN1_OVERRUN);
+       }
+
+-      data->components = malloc(len * sizeof(*data->components));
++      data->components = malloc((len + 1) * sizeof(*data->components));
+       if (data->components == NULL) {
+               return (ENOMEM);
+       }
diff --git a/meta/recipes-connectivity/bind/bind_9.16.11.bb b/meta/recipes-connectivity/bind/bind_9.16.11.bb
index f48cc74c2e..91e07723be 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.11.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.11.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2020-8625.patch \
            "
 
 SRC_URI[sha256sum] = "0111f64dd7d8f515cfa129e181cce96ff82070d1b27f11a21f6856110d0699c1"
-- 
2.24.3 (Apple Git-128)

