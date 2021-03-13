Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.2533.1615661399286164733
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TdzBaqKA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id n23so5182482otq.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6Qb8HkXe7zvAYK/p+8igYQ57llSJoHI+wrLUsfuP8Rs=;
        b=TdzBaqKAZ6LUyVpsClxq/hkgOwN34GFTaw5P/UAGD9kbVimYHQxiX1g1Tvolx8qSZz
         Wwf2YYFSgBbyOjmCshBT1YUXw5mu6dpNbB83SxoOLTQyH5BzBJHe9h98/hn9X8gFxCt1
         5zH2wrPqIQOEP6sg677DwBSYacCKhZHdOcwT26zyLdmGYqsnL/z0JQuWMjF//SIZjk+Q
         rbQdlrmuBTW/noDH8MHTFicri7/uWI6GeKx5ivVwhpj0IneVMJaCVOdi4l1SWQ0/RGB8
         1qfWp9J4smaBmEPKwUqAvU/pzFJ4ACVtzU3eemGpFw+dm+/wXisE6QMz15ELqGw3US2i
         lVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Qb8HkXe7zvAYK/p+8igYQ57llSJoHI+wrLUsfuP8Rs=;
        b=ifEYBr/PB7etDyW7fz+MDgiFBp1/cW3orZYq4Iz1zekVPf4kMknjNCypLFLoZGJInW
         zVIyXMYRzjWk/dydvB+3wnAzGS0aDQfIgvArsiFEnjBM5FNu/yLqNeG/KpgP4k9TNssV
         Bh93U93frU2vEOmVAqOno+ZUZbQYx6SmlQXJL/j2s5VPzVEE6dxtld56t/vMtEwSQnaR
         EmB9/dlfkDsEd8SOl34WkNMnH7IPqhptSslzOweRkRMf0dRhHyxElSnjKXYVWueKsK8b
         IxnhG6bqtAlnOd9j55DN8SBC5OKeA7lASHvnB//+QM/C4uUVMVv2O9CyiOI6hiOAeIRB
         IGXQ==
X-Gm-Message-State: AOAM533g9Yf4kSWG5dZo+BrnrDo8Np1MGRYeTN4Z2KURZyn6zSbRqzNZ
	DOhXxB4P9KVNQpJX8Y8+y6u4TR7Ee05kyGk+
X-Google-Smtp-Source: ABdhPJzMxTC43KkYYwksAQkU9qplgHqST5Tp9HbiIRp3F7F970zhtdbJk7/F9VDy70ScAE6btDK7FQ==
X-Received: by 2002:a9d:788:: with SMTP id 8mr8196774oto.197.1615661398108;
        Sat, 13 Mar 2021 10:49:58 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.49.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:49:57 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/38] wpa-supplicant: fix CVE-2021-27803
Date: Sat, 13 Mar 2021 08:48:50 -1000
Message-Id: <2877d0d42ffb656a6afa1f99084490ec4d84115b.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minjae Kim <flowergom@gmail.com>

A vulnerability was discovered in how p2p/p2p_pd.c in wpa_supplicant
before 2.10 processes P2P (Wi-Fi Direct) provision discovery requests.
It could result in denial of service or other impact
(potentially execution of arbitrary code), for an attacker within radio range.

Upstream-Status: Acepted [https://w1.fi/cgit/hostap/commit/?id=8460e3230988ef2ec13ce6b69b687e941f6cdb32]
CVE: CVE-2021-27803
Signed-off-by: Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index caa6018ce8..357c28634a 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
            file://0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
            file://CVE-2021-0326.patch \
+           file://CVE-2021-27803.patch \
           "
 SRC_URI[md5sum] = "2d2958c782576dc9901092fbfecb4190"
 SRC_URI[sha256sum] = "fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17"
-- 
2.25.1

