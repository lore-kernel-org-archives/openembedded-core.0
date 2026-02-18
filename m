Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677BDE9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 06:42:49 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6818.1771396963015715364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 22:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MdArp2ui;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81df6a302b1so4961581b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 22:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771396962; x=1772001762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SKt6Z5SM2V0qPMf9zq38KqbmENupJxyuI66gHuEhjKg=;
        b=MdArp2uiu1WzasY5+NwisC2QcCAFZXFwyFDVdnPqJ/DjPG26+hObxfCk2o1G6f+yeC
         sk0b+SfQROwPVpvv1FwLSVNEa5Oo5lsYaECw2COHf4lwAeId6HN66WE7F1etvP1xpcMS
         MqJlAOgId+DWXhgRNx2TGvV8R8CL+EnnRW+E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771396962; x=1772001762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKt6Z5SM2V0qPMf9zq38KqbmENupJxyuI66gHuEhjKg=;
        b=jFgkfiI4BoNo11kOirUMKDdFZPyUz0Yp5DAv4sANT62EAfVbD/zoqi+y7CoJ3aOGQy
         vDkl90YEQFRI0qMk7YfYKIhTj13yQ6bSr7+ZQC9Vv5EpHilYI3Y2lGzQqENTtpsP0pVv
         gjs8YBGy52ISykm3m0fCe6V6Ih2lOFrdiSiGz4TiidZnfvE4dRcOo96mjJ4u7Q+EKstc
         wh0xW6oAaaAGFtYXA6AEkyPnGnCXbDtLSAEpVzJAm+asKeuqtNkYrZ75VjBJU55pzxB8
         E8vGdXC+bNLWqLn8IIXq4suqjv6d8oh6BB6Oi2wKsWxUTab/CsOTmRFhYbjOM+xh9G3s
         ZP1w==
X-Gm-Message-State: AOJu0YxAtnZb0iWfqJX4geKrZqXZ90nYv893b0vCAN4RIdE5E6CdjZFT
	EG24Mgx3VXa7Xpkn7qQ16tPiixMJYqx9GXVl3r9iN19I4NqlzAn5i+lbUloyCPbwt5SgsTxDUQ/
	wvFyK2WI=
X-Gm-Gg: AZuq6aLr4uq5+FrGWpWQLzC2CEblsPWZv5yQZ07/Hi7nw68F7f9hAYir21QBIYsLDYO
	zoBC+mfFLKxDse3/Xjwxu0HeTXZZQNZfYRrdajqXJdWTxLoQhZqG5cYd0uAelFmb+xrZXm+UEvs
	WVvdTRzakgTBaEGuQQ2/klTIkJ6EM3X1nNIXKWNxbYfkVEzoWD+ZCd7eHMXEDHAXKOFtz7PFoAL
	bsrG/zMgjfcHVzOntAaAOeYbpCmAS8WG3v6AFY6yytSxLx8XTdHNPQmconF4y2P/m8dQ1wSNthA
	Zw33eW0xAHEqAzv9u1GtfHYuhkZdk5D7TWjz96SPs/3b6UnsuQariEt2s/vz+rYiGTBr6YppPs/
	KuGB/MN/ZqC5xROzot54ckmq8nuAlFtyNcH2A2YotS0iQDobPya2uGrEpCqwYjh0QAMtt172nES
	bZl7Ydule11n5pyOfhKrDw8vDQ093YL8F3aA==
X-Received: by 2002:a05:6a00:1591:b0:822:bd7:e94f with SMTP id d2e1a72fcca58-824d9626680mr11320465b3a.53.1771396962243;
        Tue, 17 Feb 2026 22:42:42 -0800 (PST)
Received: from MVIN00013.mvista.com ([27.121.101.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bb9875sm15041125b3a.65.2026.02.17.22.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 22:42:41 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libsoup-2.4: fix CVE-2025-32049
Date: Wed, 18 Feb 2026 12:12:34 +0530
Message-ID: <20260218064234.34789-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 06:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231283

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/448
https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/408 (simplified)

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32049.patch  | 36 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049.patch
new file mode 100644
index 0000000000..465f8ed3fb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049.patch
@@ -0,0 +1,36 @@
+From 6ec7c5be50b48d6ce0a09aa3468f2c5725406a97 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Wed, 21 May 2025 10:42:51 -0500
+Subject: [PATCH] Add size limit for total message size
+
+This size limit could break applications, but it will close the denial
+of service issue.
+
+Reference : https://access.redhat.com/errata/RHSA-2025:8132
+
+CVE: CVE-2025-32049
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/6ec7c5be50b48d6ce0a09aa3468f2c5725406a9]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libsoup/soup-websocket-connection.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
+index 9d5f4f8..9493fdf 100644
+--- a/libsoup/soup-websocket-connection.c
++++ b/libsoup/soup-websocket-connection.c
+@@ -913,6 +913,11 @@ process_contents (SoupWebsocketConnection *self,
+ 		switch (pv->message_opcode) {
+ 		case 0x01:
+ 		case 0x02:
++			/* Safety valve */
++			if (pv->message_data->len + payload_len > pv->max_incoming_payload_size) {
++				too_big_error_and_close (self, (pv->message_data->len + payload_len));
++				return;
++			}
+ 			g_byte_array_append (pv->message_data, payload, payload_len);
+ 			break;
+ 		default:
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 0cc90a17cc..bd3960e2f7 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4948.patch \
            file://CVE-2025-4476.patch \
            file://CVE-2025-4945.patch \
+           file://CVE-2025-32049.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.50.1


