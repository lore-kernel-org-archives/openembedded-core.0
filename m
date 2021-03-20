Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.1290.1616227763727023463
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 01:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IFGLmaOb;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id l4so13226172ejc.10
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 01:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P0peeCVICkdjOIcOK35tVWxxeFAWH1b+2TKqpM0kGe0=;
        b=IFGLmaObtQ4z+xj3rrc1v8GSrhCnacuY6zHOZ1VEMfftMghgRX/0HZOK/YkZd260kP
         FZCcjce9CvWyYQRzUjfrrWq/0BVh7pJoCc33FeUpCUErM3dV3gZKm/6xYYTSAbko/dvX
         UM27OwLR2lHxeVKloEuKh5c+SEUyUkQ0ki/0VP4exsDWInOMv73P3xTF+RDVu000Ulvw
         3E34SsCGlfHqHmILAIkc9H4fMtCQASdpGIO3ipIfEHHTFOVBpz3tY9DvrqfABGt8o78g
         KunJY4M1VqM3thYMNReVlupxrsZ57V/9A4hAaUTqEsa7UDVaNLo6R9rDCFoB4bddwREf
         W3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P0peeCVICkdjOIcOK35tVWxxeFAWH1b+2TKqpM0kGe0=;
        b=Bf2RNjnRbF/RDFvFU8ROYMu56AoPQzesZW2+fxvl9aACmTvQNyAaIbhN2KvHXILnhJ
         mQOX4TYWJuBSfJTorfwF8hBTFNZZF4Rqa81I650XLuE/nPrYnK35FcIhkaUYeIUBx5VP
         sDoKWZBCaHsaxbzPeCXl9plOIeOguf63LN9G4AGHRyRH3oZ9psyJmENcZRTfXCYwiBqs
         OSfAuDELKswKOrPOaKxJmXc+74vuJ/88T+y1HSdKjDBSbQ5P8cbQnvkcV9FKGZx2zOI9
         8KCUAgMXZdYWlNKfN9t9n5l7EyTVoX6B7L2gGEeEtwQbNn4oFLyb+A3gaRlmZrsLNNfL
         PB/w==
X-Gm-Message-State: AOAM530gOk76H54eq/HkysL8wvt5TBAAy7LHg5j7vBLHrC1F4Ng8v2yd
	KUfSDUxV+be0rjO4lkOYbZ58WXch+Jc=
X-Google-Smtp-Source: ABdhPJx7nEBZAer44C/5+POwhyftYr5+6bnR71p2+Nql9jzUe6Z8KtjCH8jS1yy0aKw3+M9zugz+3A==
X-Received: by 2002:a17:906:8447:: with SMTP id e7mr8762345ejy.523.1616227762175;
        Sat, 20 Mar 2021 01:09:22 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v8sm5617300edx.38.2021.03.20.01.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 01:09:21 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	Stefan Ghinea <stefan.ghinea@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [gatesgarth][PATCH] wpa-supplicant: fix CVE-2021-27803
Date: Sat, 20 Mar 2021 09:09:18 +0100
Message-Id: <20210320080918.19512-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Ghinea <stefan.ghinea@windriver.com>

A vulnerability was discovered in how p2p/p2p_pd.c in wpa_supplicant
before 2.10 processes P2P (Wi-Fi Direct) provision discovery requests.
It could result in denial of service or other impact (potentially
execution of arbitrary code), for an attacker within radio range.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-27803

Upstream patches:
https://w1.fi/cgit/hostap/commit/?id=8460e3230988ef2ec13ce6b69b687e941f6cdb32

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../wpa-supplicant/CVE-2021-27803.patch       | 58 +++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
new file mode 100644
index 0000000000..004b1dbd19
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
@@ -0,0 +1,58 @@
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
+Upstream-Status: Backport
+CVE: CVE-2021-27803
+
+Reference to upstream patch:
+[https://w1.fi/cgit/hostap/commit/?id=8460e3230988ef2ec13ce6b69b687e941f6cdb32]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ src/p2p/p2p_pd.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/src/p2p/p2p_pd.c b/src/p2p/p2p_pd.c
+index 3994ec0..05fd593 100644
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
+2.17.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 85ac28d881..0f2b7407e9 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
            file://0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
            file://CVE-2021-0326.patch \
+           file://CVE-2021-27803.patch \
           "
 SRC_URI[md5sum] = "2d2958c782576dc9901092fbfecb4190"
 SRC_URI[sha256sum] = "fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17"
-- 
2.30.2

