Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1F6C54ED0
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 04:00:21 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.3430.1748145614009924270
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 21:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=a6ba+gc5;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: asharma@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74264d1832eso1389275b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 21:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1748145613; x=1748750413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gCIDZOcga0gZVajz3yonHpcTpyX0L3gZR3bWv4D2/Jw=;
        b=a6ba+gc5+fF66dz4FojcCI6hECTKDgm/wYkPMJjunxEwGMP/bzf4oQQajOoJQzcbUi
         jr1XXIU2edz43XNWXrrki0BnV7fAZF/Z83PeuJ6m4F6jqluOuUxg5M2qhtW6L+hgiDcV
         EtM3HBzt6l816dh5qnrGVsML6v4ftAKzRjhOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748145613; x=1748750413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCIDZOcga0gZVajz3yonHpcTpyX0L3gZR3bWv4D2/Jw=;
        b=k/hdeteHO3QPAFepWY2uefrNcl2NpLfQnAh5LZlJebrRsvaKQbAq4ZlqTI2X31IoHO
         3udB15g7FMyW0iKZw8FN6RXkoBBTPX7ICE77hzhAzU/z0Fgmx9k6rzD6We7oiwpvS6Zp
         NyDrLb2lWzvzK+q05nJrCGl8iK34kEn0BcA5GDwnyaGdJE3ycTHNJDx76tHtf9z5npls
         8hJveH8/XuH9gioPO7AE7mB7f521XRt20ByAdYpjTMLvtcWrhF1nLOpuEX+HmkiYJYO/
         t3960OQ9I3DxZZI6bc8gIXSihyFtumItAVTc8PU1xlnv/fWoW3MXMXKxhwNK4hdfhxvA
         Yldg==
X-Gm-Message-State: AOJu0Yx2mN7+lH5Cv2vqCy9Rp/tKaqh8KoKDOAvaOAkllYadpxoPwQVv
	s3XAknZWdti5txdhi5ClbqduEgy4JJLK2PG2rhuq6+hjOzcNKbeV2x+mBpzXcV2ShCnIqWkwSgh
	t/GRWKQc=
X-Gm-Gg: ASbGncsBMSZj1dj4gjzXp5BXGyqyB3ieb+/wlJ9o+KZhDK6teDGvj2wCth3dC1Ry4OO
	Rx7URjfwakSwNnxzu+Qz5PrERDsVXnYIiPeoejMVwPZfgaPf1LtdW/73GszEAiMXV3tUteHoL8J
	rHyseD0ZTX4re1cJDW/AoLagZ0T5ZFbtSWuu3iVDyC4LszxLGhI082/ak4eIlXJoaYhoTZHSsRZ
	f9n/BhBVUO9nLDFv2vyc4Ff81+sIKhiNbuz4Rqof9yTOwkAGUFNNbVvcCsAAEFgSDfqFBe1WdWP
	913JN4/66CM3tfg2o+1YsapSi9J0YBpKPvayzRWLYs//Yi/YZg==
X-Google-Smtp-Source: AGHT+IG6wW0HIeCWkAmjVkOdQs4G5Q9JHRZjdGFgSrtDsF5PzHR+08mEN4ThF5WXQvoCzwGEZGjCDA==
X-Received: by 2002:a05:6a20:439f:b0:1f5:9098:e448 with SMTP id adf61e73a8af0-2188c2001b4mr5650742637.5.1748145612977;
        Sat, 24 May 2025 21:00:12 -0700 (PDT)
Received: from MVIN00043 ([2401:4900:1c69:8ad5:1cdc:e472:e5d7:c4c0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2714c27cbcsm10253770a12.16.2025.05.24.21.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 21:00:12 -0700 (PDT)
Received: by MVIN00043 (sSMTP sendmail emulation); Sun, 25 May 2025 09:30:07 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][scarthgap][PATCH] libsoup: patch CVE-2025-4476
Date: Sun, 25 May 2025 09:30:06 +0530
Message-Id: <20250525040006.5363-1-asharma@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 04:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217239

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../libsoup/libsoup-3.4.4/CVE-2025-4476.patch | 38 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4476.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4476.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4476.patch
new file mode 100644
index 0000000000..cd5619d620
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4476.patch
@@ -0,0 +1,38 @@
+From e64c221f9c7d09b48b610c5626b3b8c400f0907c Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 8 May 2025 09:27:01 -0500
+Subject: [PATCH] auth-digest: fix crash in
+ soup_auth_digest_get_protection_space()
+
+We need to validate the Domain parameter in the WWW-Authenticate header.
+
+Unfortunately this crash only occurs when listening on default ports 80
+and 443, so there's no good way to test for this. The test would require
+running as root.
+
+Fixes #440
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c]
+CVE: CVE-2025-4476
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+
+ libsoup/auth/soup-auth-digest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth-digest.c
+index d8bb2910..292f2045 100644
+--- a/libsoup/auth/soup-auth-digest.c
++++ b/libsoup/auth/soup-auth-digest.c
+@@ -220,7 +220,7 @@ soup_auth_digest_get_protection_space (SoupAuth *auth, GUri *source_uri)
+ 			if (uri &&
+                             g_strcmp0 (g_uri_get_scheme (uri), g_uri_get_scheme (source_uri)) == 0 &&
+ 			    g_uri_get_port (uri) == g_uri_get_port (source_uri) &&
+-			    !strcmp (g_uri_get_host (uri), g_uri_get_host (source_uri)))
++			    !g_strcmp0 (g_uri_get_host (uri), g_uri_get_host (source_uri)))
+ 				dir = g_strdup (g_uri_get_path (uri));
+ 			else
+ 				dir = NULL;
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 8cca980faf..d3a0840044 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -30,6 +30,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32906-2.patch \
            file://CVE-2025-46420.patch \
            file://CVE-2025-32914.patch \
+           file://CVE-2025-4476.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


