Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.335.1614638650659396688
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 14:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PY7Vso+c;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: flowergom@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id o6so564019pjf.5
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 14:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NDtXcPqCB+8/WWcQCIIDfxeqRnR01WLjvu9Lwi1mo9Q=;
        b=PY7Vso+cb/Rsqv77khMTXxecqhHchpWOc37i/tkWkGY7zRW/y1DuDLCkdeb5aQ8aJ5
         BFQIh36yfAx8wwkJJy8LCjFWb+qvk/iR0qcgy9lZtEjSbTEOmptRNiVd2mESeW7w5ZRP
         oW0WYbE6wWZuYk7+6mI4wh8D9s1VLRkfzaFLKhN0/GhAA6RGKqwIp34Ydd0WJXawNspS
         XVbYwv9x/7QtayvXweW8ym/+8kngALx3qaQ1SrkypPE6oSytVk6pjL3crbCZk6JvwXB+
         dL8Olwi4FZBv/STvATzJsexOTxq5hS3MbqgJZH8QOKK8S6VPmKKR2KuRhDT5qHLMvRzX
         qswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NDtXcPqCB+8/WWcQCIIDfxeqRnR01WLjvu9Lwi1mo9Q=;
        b=jbRd4UrD92iR5mijf6YSWNSZnA+X9ks5DoDoDQ+adzuBV2TekTIg9nxKCzyp4thf1I
         hBQNvtDgHkeBlghZQjmFTbX7idr3zH8Wuyk7BieOHpKLyYgdxE5G0whNA/oCUlRXPKd8
         pwvHflnplLBZUYSUkwKl2Qrq2YQ5NIQuLWYv8wZIeP3Y+IGjXU3KhFsrxXXXg7x44uw5
         pwTQ747k2osq1AwOTu0I/QYtASNtcH9I8PTj26WmAl95Zq9lTNcIK28E+ZnM9WTPmSd0
         JY8kBSmO8azeqCD2yJ5325qzslpqsiOBY3deIEnRZnt0DBEgS4fgWufWhIpNfEMFWDOQ
         OmDA==
X-Gm-Message-State: AOAM531xkq/+2xUIW4oTNB5m8ZMJm/SGSqZhTxFoo3TmckTSrIeA74k5
	fGH57FfwWp1H9g7gyqfMdNCRaBlQ/XBHUQ==
X-Google-Smtp-Source: ABdhPJywPRN3hrNoPs5GW97HqACIHkOMMuE0e2XFv9JQmhe60H+cFH+FUZ0ggwTxLnlodN9AO3zDRw==
X-Received: by 2002:a17:90a:3e04:: with SMTP id j4mr1127380pjc.7.1614638649814;
        Mon, 01 Mar 2021 14:44:09 -0800 (PST)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id s138sm20082442pfc.135.2021.03.01.14.44.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 14:44:09 -0800 (PST)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [gatesgarth][PATCH] bind: fix CVE-2020-8625
Date: Tue,  2 Mar 2021 07:43:42 +0900
Message-Id: <20210301224342.2898-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BIND Operational Notification: Zone journal (.jnl) file incompatibility

Upstream-Status: Backporting [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
CVE: CVE-2020-8625
Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 .../bind/bind-9.16.7/CVE-2020-8625.patch        | 17 +++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.16.7.bb   |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.16.7/CVE-2020-8625.patch

diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/CVE-2020-8625.patch b/meta/recipes-connectivity/bind/bind-9.16.7/CVE-2020-8625.patch
new file mode 100644
index 0000000000..b0b51e7030
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.16.7/CVE-2020-8625.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Acepted [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
+CVE: CVE-2020-8625
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+
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

