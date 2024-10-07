Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41CDCFB424
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 01:55:19 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.43999.1728266118401287638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Oct 2024 18:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jXjK7z90;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e06acff261so2684363a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 18:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728266117; x=1728870917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZaIN2rrl8cioMY0bFPMre+0q1boxaCOHWB9Zgq8LqnM=;
        b=jXjK7z90VjTWH7YoLY0+LqRZl14LmkQ0BgeV4OQENpnKl45yTnbGVgiqPceO4A9uNB
         irnFyg/m7ZOcDKU7GekssJu9hmJ/QVNwtjA9vDfH8pcnqkkHlH1IuOGwKOjPRQVq0m8S
         7/itTWVleMIwcup0EPheeoMvn18DFsmhHBP0eaHNKRAsOSYo+2Nl5crm6dpv8NSo2MJ4
         CZwWeMMfaTXsXFrP3D1EhM7Xwpy+duW2FTzadFJeC8+x8r/OKIAeVUwCQ5Adzy/YiRHR
         XBHR2R1bXzmyLPN1LE6kBGhoKEQ7K+iEI/o6aqoLBWABm/9X4J2etUSXrI7i44F0VuFN
         vq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728266117; x=1728870917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZaIN2rrl8cioMY0bFPMre+0q1boxaCOHWB9Zgq8LqnM=;
        b=PqPVshrIeOkDqfs1svvXYIOZDOTb68sjsBO4SUuKxeFuo7Ah9nOTyf2JspmpOdomLj
         Ck70kg2COXB2ochoMY4IzAZ+1YzT1NdVyXf9mS387OAvTSHhBVjPAZFtZK1p4Nzh20eH
         HL5xmYSTek37mfhHxhhOmFZOFwQW+kfaS3xgusjwwJ3pIopOwW/mV5Q+dMhpqBurZm35
         tiFkiJW/equXB92bq1cRhRDfMFhLA3RcZP9ZnHQC5+fDl6cSbt2DC1IqbeH6emBvjAPN
         4dA8HazdRmxJO1G3gqnZzULg1MeWw4b2eMnzvCzZHC1Q1yHNNXCQIKXQW0gR/EuPLOuu
         YzMQ==
X-Gm-Message-State: AOJu0Yx63NaQHSHVTt9Id5v5zJPog/LMxA3+oPeTS5zXTS0I7HE2lbqr
	/P6qV6TCpzerlxizsDEQEoWvbEWK7XeyTUS/lvJQseAFUMy9iM477W/sZnBRux3tNJAHcVyO3iK
	jz3w=
X-Google-Smtp-Source: AGHT+IGy1wSFH6vjQkAuN4GQftTt7qX19CbroX38opjxpyXmuWKUuMf/u+8hs3awVgCcKsmuvrGyBA==
X-Received: by 2002:a17:90a:7c03:b0:2e1:9431:af51 with SMTP id 98e67ed59e1d1-2e1e63bda11mr11870045a91.38.1728266117473;
        Sun, 06 Oct 2024 18:55:17 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20aebb70asm4074938a91.19.2024.10.06.18.55.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 18:55:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/10] wpa-supplicant: Patch security advisory 2024-2
Date: Sun,  6 Oct 2024 18:54:58 -0700
Message-Id: <44f1d5f08c6dfbd03d2997fc6fa8f257339589fa.1728266000.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728266000.git.steve@sakoman.com>
References: <cover.1728266000.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 01:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205253

From: Peter Marko <peter.marko@siemens.com>

Pick patches according to
http://w1.fi/security/2024-2/sae-h2h-and-incomplete-downgrade-protection-for-group-negotiation.txt
SAE H2E and incomplete downgrade protection for group negotiation

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...valid-Rejected-Groups-element-length.patch | 52 +++++++++++++++++++
 ...valid-Rejected-Groups-element-length.patch | 50 ++++++++++++++++++
 ...id-Rejected-Groups-element-in-the-pa.patch | 38 ++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |  3 ++
 4 files changed, 143 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
new file mode 100644
index 0000000000..5780f27f8b
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
@@ -0,0 +1,52 @@
+From 364c2da8741f0979dae497551e70b94c0e6c8636 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sun, 7 Jul 2024 11:46:49 +0300
+Subject: [PATCH 1/3] SAE: Check for invalid Rejected Groups element length
+ explicitly
+
+Instead of practically ignoring an odd octet at the end of the element,
+check for such invalid case explicitly. This is needed to avoid a
+potential group downgrade attack.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=364c2da8741f0979dae497551e70b94c0e6c8636]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/ap/ieee802_11.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/ap/ieee802_11.c b/src/ap/ieee802_11.c
+index db4104928..1a62e30cc 100644
+--- a/src/ap/ieee802_11.c
++++ b/src/ap/ieee802_11.c
+@@ -1258,7 +1258,7 @@ static int check_sae_rejected_groups(struct hostapd_data *hapd,
+ 				     struct sae_data *sae)
+ {
+ 	const struct wpabuf *groups;
+-	size_t i, count;
++	size_t i, count, len;
+ 	const u8 *pos;
+ 
+ 	if (!sae->tmp)
+@@ -1268,7 +1268,15 @@ static int check_sae_rejected_groups(struct hostapd_data *hapd,
+ 		return 0;
+ 
+ 	pos = wpabuf_head(groups);
+-	count = wpabuf_len(groups) / 2;
++	len = wpabuf_len(groups);
++	if (len & 1) {
++		wpa_printf(MSG_DEBUG,
++			   "SAE: Invalid length of the Rejected Groups element payload: %zu",
++			   len);
++		return 1;
++	}
++
++	count = len / 2;
+ 	for (i = 0; i < count; i++) {
+ 		int enabled;
+ 		u16 group;
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-SAE-Check-for-invalid-Rejected-Groups-element-length.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
new file mode 100644
index 0000000000..3e96ae9e2e
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
@@ -0,0 +1,50 @@
+From 593a7c2f8c93edd6b552f2d42e28164464b4e6ff Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Tue, 9 Jul 2024 23:33:38 +0300
+Subject: [PATCH 2/3] SAE: Check for invalid Rejected Groups element length
+ explicitly on STA
+
+Instead of practically ignoring an odd octet at the end of the element,
+check for such invalid case explicitly. This is needed to avoid a
+potential group downgrade attack.
+
+Fixes: 444d76f74f65 ("SAE: Check that peer's rejected groups are not enabled")
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=593a7c2f8c93edd6b552f2d42e28164464b4e6ff]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ wpa_supplicant/sme.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/wpa_supplicant/sme.c b/wpa_supplicant/sme.c
+index 7f43216c6..c7289f6a8 100644
+--- a/wpa_supplicant/sme.c
++++ b/wpa_supplicant/sme.c
+@@ -1222,14 +1222,21 @@ static int sme_sae_is_group_enabled(struct wpa_supplicant *wpa_s, int group)
+ static int sme_check_sae_rejected_groups(struct wpa_supplicant *wpa_s,
+ 					 const struct wpabuf *groups)
+ {
+-	size_t i, count;
++	size_t i, count, len;
+ 	const u8 *pos;
+ 
+ 	if (!groups)
+ 		return 0;
+ 
+ 	pos = wpabuf_head(groups);
+-	count = wpabuf_len(groups) / 2;
++	len = wpabuf_len(groups);
++	if (len & 1) {
++		wpa_printf(MSG_DEBUG,
++			   "SAE: Invalid length of the Rejected Groups element payload: %zu",
++			   len);
++		return 1;
++	}
++	count = len / 2;
+ 	for (i = 0; i < count; i++) {
+ 		int enabled;
+ 		u16 group;
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch
new file mode 100644
index 0000000000..5e9e8bc01d
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch
@@ -0,0 +1,38 @@
+From 9716bf1160beb677e965d9e6475d6c9e162e8374 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Tue, 9 Jul 2024 23:34:34 +0300
+Subject: [PATCH 3/3] SAE: Reject invalid Rejected Groups element in the parser
+
+There is no need to depend on all uses (i.e., both hostapd and
+wpa_supplicant) to verify that the length of the Rejected Groups field
+in the Rejected Groups element is valid (i.e., a multiple of two octets)
+since the common parser can reject the message when detecting this.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=9716bf1160beb677e965d9e6475d6c9e162e8374]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/common/sae.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/common/sae.c b/src/common/sae.c
+index c0f154e91..620bdf753 100644
+--- a/src/common/sae.c
++++ b/src/common/sae.c
+@@ -2076,6 +2076,12 @@ static int sae_parse_rejected_groups(struct sae_data *sae,
+ 		return WLAN_STATUS_UNSPECIFIED_FAILURE;
+ 	epos++; /* skip ext ID */
+ 	len--;
++	if (len & 1) {
++		wpa_printf(MSG_DEBUG,
++			   "SAE: Invalid length of the Rejected Groups element payload: %u",
++			   len);
++		return WLAN_STATUS_UNSPECIFIED_FAILURE;
++	}
+ 
+ 	wpabuf_free(sae->tmp->peer_rejected_groups);
+ 	sae->tmp->peer_rejected_groups = wpabuf_alloc(len);
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 56c01ede54..c1a4383b47 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -28,6 +28,9 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://CVE-2024-3596_06.patch \
            file://CVE-2024-3596_07.patch \
            file://CVE-2024-3596_08.patch \
+           file://0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch \
+           file://0002-SAE-Check-for-invalid-Rejected-Groups-element-length.patch \
+           file://0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch \
            "
 SRC_URI[sha256sum] = "20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f"
 
-- 
2.34.1


