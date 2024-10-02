Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D86CCF31BE
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:14 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.6934.1727874792288892438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QskZHSIo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71dbdb7afe7so1343912b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874791; x=1728479591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gasso1a3az8MBEwZllFqliRRxFyfcduAEnwzg6AhEpw=;
        b=QskZHSIoZAWJEEZ5PpvA/vr4NLu9JdhcbFoGsWWh3ujU/6BhM/5hoN/OaHcDmHMakp
         vahwkdVnBSD3KMT97ZLX9mknUeKFXt7ZYn3oeZkhtGd0Y+Bp1pThGOz49BiLUXT5+fqH
         5eWEXxHkDif7L5jTS+51qynZcC3U31XCR81DeXxYtrp17S0JleuYC4YDG4nps2S+PJrL
         YFj/nf04D0aHU/ifDJFwt/LiPOJGEo/498EDHcY2gfnLgnbS+ThuEjKDGpiMqp9Aq9OT
         kzT0EneFagr5cJ3h1FjffbxB9VRh7ygcRm82cLrv2JEhZbJakjaiIyjtvQlkTqAUmyb5
         5VIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874791; x=1728479591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gasso1a3az8MBEwZllFqliRRxFyfcduAEnwzg6AhEpw=;
        b=k2iPJmznGsCALDb7u5c+zZDf9cVgWY+S4zM8fEvRIjB9qjY/FXtmxzoyCvBp1v9Vic
         Grt7BD8RdPoocvvqoZEp3Wc8IOcjiiG/+WcGcsoFTEmvV5z7lE7ov0ttM8+aRS7WAe54
         l6oO0n1EO8n1XuRSKrNkn9J4N0SHatXSFz9LzO9tiD7m4W3sD8U1jJ5KwfURU7Cctzxy
         DIvGjFNLUVEUuRbRZYQAP06h0DMhZvn6bWVSoBDQiKEqBGi5zU1ogyyfXtDM3nfB1uA5
         MzhI9GAQhOboyF2j4N5VhzQHye53eDRU52EDBTJ6t4RRvgh1uasGvKVbwyDcYJ0SDs22
         Mjjg==
X-Gm-Message-State: AOJu0YxYR5eaTHeIgE3EZDgzFRJSUCQ/+9wSp31j1w6rROBkEYRr+rxL
	QEw88Zavl9VKbfOKUKvdRYx448R3n8PrmYqwPV6QejA2F/oc9rgOn1CjOV4exyG8OH0CE8xb4bO
	YKMg=
X-Google-Smtp-Source: AGHT+IGD1xnWiqFDAgt19W0aXapragGlMDr4HSQ0VuQgKldloQP5N4oqFLsDM24qrU2FOXrbiYeyMg==
X-Received: by 2002:a05:6a20:c990:b0:1cf:7123:86a6 with SMTP id adf61e73a8af0-1d5e2dc0cc9mr5128588637.49.1727874791405;
        Wed, 02 Oct 2024 06:13:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/16] wpa-supplicant: Patch security advisory 2024-2
Date: Wed,  2 Oct 2024 06:12:45 -0700
Message-Id: <58b8ad7e33f47f06409be84430a8c2a22b4dd92f.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205189

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
index f5e9dce17c..459039d01e 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -35,6 +35,9 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
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


