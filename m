Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.35518.1615211172179555184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 05:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c0DgC3iK;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: flowergom@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so3000844pjh.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 05:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wg7KA2QqM9FxStb+B15su2CG9dWLKviLWx5XZW+SGck=;
        b=c0DgC3iKfFGXQULGSp9KP2o6/xhqL36FtAAuomU80hNWn+X3NR1ylKg+LbGPDncuqE
         3vJbBwzneU0itkFJyUw231B722MIPM44FRWLcma9R/KqA9OuNVCp6aB5CkWrvjYZrK2c
         gk7NUfRmw3vaixoI3wkl3qpvgMQHvNCn8FNYxnUm+k4OCgjma0vMCKX+FY+gzcKTsAB8
         uhg4SSQfGQ2O2e0jTGWHjqFep9W1cxiDma1b1Rd2F1kMCM2fKXM9jXb1y1qEypS5FeFJ
         4q+zPBmSbzI9t2EqVMsA4jFmUe3vghZTCueGBb8/ieD+Ycd05V5M1HafXSIKUluSoxhf
         gkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wg7KA2QqM9FxStb+B15su2CG9dWLKviLWx5XZW+SGck=;
        b=iJsTz8AEvL/orxbPtj7+O+ilr/JfKfGDmfbYJy5PGOmvGyMOKXtamn0uCn43p6Ti8Q
         5rfsITPHmd/cWbxbp8gBfqnPcLEL+Q5pkv9HmpPozCKogHxqxG5jYk7Ifm/KvaFwCF4Q
         baSFr9u2F5bBtIGfOM3tALC90hMfaVdnUtnUcTaEITygF4aP8wxGBdG8WowAt67vr2NZ
         or/1Z0VPh4Q/ds88npHeCpgkRxpXlA4345yAXqEUUc5FMXEr7bcuEzoSjQC90EHzVULU
         Mtc/EODj9xjttWL8883+0GJYqvrOTcKBFuDJDC0vSDa/QzvtZRfKfjnZWT8tqocK8afC
         Z6mQ==
X-Gm-Message-State: AOAM533soGHpbkQ+UhpODxxZWb+n3MqApAVOJAejzk4si9PQopE5ZPrE
	/hqHvv8Spx2Gtm00dXw4f7WHcawASoRCZQ==
X-Google-Smtp-Source: ABdhPJynODooaWobWZi5iTp5CuWLHawnmJfpitOdy+xqcxCYutMWHsHF/GDwB5EA4XhCQQasrPkT6w==
X-Received: by 2002:a17:902:ec83:b029:e3:ec1f:9def with SMTP id x3-20020a170902ec83b02900e3ec1f9defmr21161186plg.11.1615211164834;
        Mon, 08 Mar 2021 05:46:04 -0800 (PST)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id w25sm10431513pfn.106.2021.03.08.05.46.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Mar 2021 05:46:04 -0800 (PST)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH 1/2] wpa-supplicant: fix CVE-2021-27803
Date: Mon,  8 Mar 2021 22:45:52 +0900
Message-Id: <20210308134553.1250-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A vulnerability was discovered in how p2p/p2p_pd.c in wpa_supplicant
before 2.10 processes P2P (Wi-Fi Direct) provision discovery requests.
It could result in denial of service or other impact
(potentially execution of arbitrary code), for an attacker within radio range.

Upstream-Status: Acepted [https://w1.fi/cgit/hostap/commit/?id=8460e3230988ef2ec13ce6b69b687e941f6cdb32]
CVE: CVE-2021-27803
Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 .../wpa-supplicant/CVE-2021-27803.patch       | 54 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
new file mode 100644
index 0000000000..dc576d1a11
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
@@ -0,0 +1,54 @@
+From 8460e3230988ef2ec13ce6b69b687e941f6cdb32 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Tue, 8 Dec 2020 23:52:50 +0200
+Subject: [PATCH] P2P: Fix a corner case in peer addition based on PD Request
+
+p2p_add_device() may remove the oldest entry if there is no room in the
+peer table for a new peer. This would result in any pointer to that
+removed entry becoming stale. A corner case with an invalid PD Request
+frame could result in such a case ending up using (read+write) freed
+memory. This could only by triggered when the peer table has reached its
+maximum size and the PD Request frame is received from the P2P Device
+Address of the oldest remaining entry and the frame has incorrect P2P
+Device Address in the payload.
+
+Fix this by fetching the dev pointer again after having called
+p2p_add_device() so that the stale pointer cannot be used.
+
+Fixes: 17bef1e97a50 ("P2P: Add peer entry based on Provision Discovery Request")
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+
+Upstream-Status: Acepted [https://w1.fi/cgit/hostap/commit/?id=8460e3230988ef2ec13ce6b69b687e941f6cdb32]
+CVE: CVE-2021-27803
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ src/p2p/p2p_pd.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/src/p2p/p2p_pd.c b/src/p2p/p2p_pd.c
+index 3994ec03f86b..05fd593494ef 100644
+--- a/src/p2p/p2p_pd.c
++++ b/src/p2p/p2p_pd.c
+@@ -595,14 +595,12 @@ void p2p_process_prov_disc_req(struct p2p_data *p2p, const u8 *sa,
+ 			goto out;
+ 		}
+ 
++		dev = p2p_get_device(p2p, sa);
+ 		if (!dev) {
+-			dev = p2p_get_device(p2p, sa);
+-			if (!dev) {
+-				p2p_dbg(p2p,
+-					"Provision Discovery device not found "
+-					MACSTR, MAC2STR(sa));
+-				goto out;
+-			}
++			p2p_dbg(p2p,
++				"Provision Discovery device not found "
++				MACSTR, MAC2STR(sa));
++			goto out;
+ 		}
+ 	} else if (msg.wfd_subelems) {
+ 		wpabuf_free(dev->info.wfd_subelems);
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 7cc03fef7d..cfd1b7f140 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch \
            file://0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
            file://0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
+           file://CVE-2021-27803.patch \
           "
 SRC_URI[md5sum] = "2d2958c782576dc9901092fbfecb4190"
 SRC_URI[sha256sum] = "fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17"
-- 
2.24.3 (Apple Git-128)

