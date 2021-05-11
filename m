Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.12099.1620737502083845125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 05:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h3yH9DwT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id l2so20011975wrm.9
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mz3ei+S3YMn6MLM07NMwbNcuw3NKL/4MZkvLG1/Y7kI=;
        b=h3yH9DwTAVpy7TFTU6RdpWFCVJ8WMOt3Ni2fma+CB/OG4GaiFh9xrBnfrZ5ZgzThRg
         BBwS7PL1Hb+rAVuSaFxNAK4BLZaUjf7PYP5aNOVpY3qU+KoelyV1QBGtHHM0tnMLPxa0
         NrGBfbUrBj6F8EqkpbaLLvn1qmg+z1g31MJ+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mz3ei+S3YMn6MLM07NMwbNcuw3NKL/4MZkvLG1/Y7kI=;
        b=qHQ7gW9ThrC22tk61ZwUVXZIc2dSkreaPLYf5xXst3tN7JmTwd1FVadGQQnYuHYgQV
         FR6wnZ7dMv47GPjDfNeMLsZUI5ENwjPEY3tyhIMVtT8wMa49HfRVXNzKdfZIAwLQ9ZMT
         WatwcPAr2pRVNab3dp89629tidxWHe3+GBnqIyl8epktDs46Dvdv0oVkY5Vge929q1DE
         Nh+csryHf5bycR/rhKhvhtTEBFnDsL5NTptLGoniQ11wPV2t1zYoPwFEOD+YuXBq5vn+
         1OEUqGA+Hi2NXmKMB5f2v/QmFKiDh/qNCmPaZ/EcqcbbMfGEWkrk8USPCp0JMFc5SKCT
         zIjw==
X-Gm-Message-State: AOAM530rKZbLd6Z9HTxMqlRZFsjmoY2YEuv835aepH5yw/9YaXo4xgF2
	yUu4ueYCSJ0FiWmSqoLMC7Ta5ehlLC8BHA==
X-Google-Smtp-Source: ABdhPJw6wRmkwvp+vvOwP6lkvg9ka4C2Wwn7VazfAw+EJFkzi4FEAT/DP3cZsRhzonZwlZFSKHZvYw==
X-Received: by 2002:a5d:525c:: with SMTP id k28mr37350714wrc.158.1620737500375;
        Tue, 11 May 2021 05:51:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:29c0:3873:464b:b647])
        by smtp.gmail.com with ESMTPSA id y14sm27119099wrs.64.2021.05.11.05.51.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 05:51:39 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] bind: Exclude CVE-2019-6470 from cve-check
Date: Tue, 11 May 2021 13:51:31 +0100
Message-Id: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issue only affects dhcpd with recent bind versions. We don't ship dhcpd anymore
so the issue doesn't affect us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/bind/bind_9.16.13.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.16.13.bb b/meta/recipes-connectivity/bind/bind_9.16.13.bb
index 6127b13e8dc..38825f1cf77 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.13.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.13.bb
@@ -26,6 +26,10 @@ UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
 UPSTREAM_CHECK_REGEX = "(?P<pver>9.(16|20|24|28)(\.\d+)+(-P\d+)*)/"
 
+# Issue only affects dhcpd with recent bind versions. We don't ship dhcpd anymore
+# so the issue doesn't affect us.
+CVE_CHECK_WHITELIST += "CVE-2019-6470"
+
 inherit autotools update-rc.d systemd useradd pkgconfig multilib_header update-alternatives
 
 # PACKAGECONFIGs readline and libedit should NOT be set at same time
-- 
2.30.2

