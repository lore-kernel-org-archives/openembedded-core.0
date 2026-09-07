Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5A0C79FA0
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34923.1788788159809161177
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GHuFs8N2;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso14227575e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788158; x=1789392958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bBiyxr3t8s+9CHD++vKffwVgGF4TLdbPr4DszMESfck=;
        b=GHuFs8N2GU5nRMsfASnhFY5CiX1pR2bxjoJSvw76S4atBb4azplHJlz1BL4bwNO1Gj
         SrJWhl5Zu94wnsIwM2CYEqG/hFriT0uU4Lx9PZnDN5Sq5bY/HbrguyEfO6R4mxKOt/I5
         NSE3ZmFIpTSpUWWuPMZhQitSyd+/0kaC7BWLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788158; x=1789392958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bBiyxr3t8s+9CHD++vKffwVgGF4TLdbPr4DszMESfck=;
        b=Q3gARktittoMyXtSyYMoyQdYiCnUQiRAwBzGDa8hRvXT5ytHLOOWb67+UyrxGnMvsY
         77hdtW46haf2GJMp+y6vhOUQZN8SGrsvg1OwUZBXVhBcwFRaQs6Crstey8jAbq/AgqHt
         KVxcjys4N23ayJ9OxYLaaPJUtRdByqUS4+JSGnYYaH0K4LVzigDw85KIwK/OUfU1DwQ9
         4SJ6nMFhCTSLj8SO/HgGjycjevmvooOTxl0GQjlOUv48ybKIirbz3OsegkT9E+wrBxmI
         5vuMy98d+bOcrWqyB+vyO87QdK8VOU6F7oC3c22vI8Dhu0e1Mh5C+S1yLA1mEFiP6j3t
         eUaA==
X-Gm-Message-State: AFuF++mIQuT9k3isFpDTw6leUH0IqnNB3s43jCkqFwSCvOFdUnmh0L81
	AT2w1BK4PWNwCApbZCVBQYPQzZDyKBlXqxFd6JEOxlkCOOJPv0XyfTFm9xG+VKGNctyNd1HIGne
	R+DRKhRY=
X-Gm-Gg: AYBFou0Z2gH9nEPMEmoFTEGciTghJwfjxIXMlsM+z9FyeJV39qvUpmMjICCt+JqcGcV
	dtU0YkBN99FNShBDWuK0WoYDMHva37AK2ryOKEL8dyDPxHHjWjD2U2NCEIzTBFqEugJVEsZpCsW
	n7PzdOM1KOp4lqOhLFOVxsBQbJZ10zGrJbYaOLsdzjcDNYQm88lRobQXuaFuJHKQ9KZOd/MPznG
	4QqUT0UWusRYr3jCuY5rb5KEl/h1PJOv/1HjFh4OqmtT+bOEOl2PLPatd4Y7EEePsNvbkBi4Jq+
	2nLbuZzxUlEEWOaJLWb+BzhggDVvRdzNBNpacUyJ52MvPhwM7d+g2+hQd8U4S0+9kZlplYGJ5uw
	mtTrjbhkXoti+gRvCaX6l8OtQt7Wew+i2UJG49zSFSeSDsWigrrpRcHZnQYJOllB2xx6tnH8VFo
	cGHmX8eNRpvYs58fn1/nKE6qY8m1gPuQlbzBdY/k1smmbgn1haCMfEFtjJo4kv5NEk7M2nrh1QE
	GBrVFL/VyAEi4toM8t8pyCEoVEpSdc+28EA3THiErrYilrOGb+/KfCXRvpzmWzGNA==
X-Received: by 2002:a05:600c:1f91:b0:49d:13f7:89d3 with SMTP id 5b1f17b1804b1-49d13f78a8cmr32901175e9.14.1788788158029;
        Mon, 07 Sep 2026 06:35:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/35] gnutls: fix CVE-2026-42010
Date: Mon,  7 Sep 2026 15:35:09 +0200
Message-ID: <2b1ed475e021c0eb13014a170911e96b1b0aed28.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245271

From: Jakub Szczudlo (Nokia) <jakub.szczudlo@nokia.com>

Backport patch to fix CVE-2026-42010.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-42010

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/cb1833afd9b6309563211b1c0a7c291f52ca98d5

Tested with ptest

Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-42010.patch        | 41 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch
new file mode 100644
index 00000000000..b94a32afffc
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch
@@ -0,0 +1,41 @@
+From cb1833afd9b6309563211b1c0a7c291f52ca98d5 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Tue, 21 Apr 2026 19:26:10 +0200
+Subject: [PATCH] lib/auth/rsa_psk: fix binary PSK identity lookup
+
+A server looking up PSK username with a NUL-character in it
+was wrongfully matching username truncated at a NUL-character.
+Fix the check to compare up to the full username length.
+
+CVE: CVE-2026-42010
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/cb1833afd9b6309563211b1c0a7c291f52ca98d5]
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1850
+Fixes: CVE-2026-42010
+Fixes: GNUTLS-SA-2026-04-29-4
+CVSS: 7.1 High CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:L/A:N
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+ lib/auth/rsa_psk.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/auth/rsa_psk.c b/lib/auth/rsa_psk.c
+index cc92b4aa96..27caf18769 100644
+--- a/lib/auth/rsa_psk.c
++++ b/lib/auth/rsa_psk.c
+@@ -321,8 +321,7 @@ static int _gnutls_proc_rsa_psk_client_kx(gnutls_session_t session,
+ 	 * filled in if the key is not found.
+ 	 */
+ 	ret = _gnutls_psk_pwd_find_entry(session, info->username,
+-					 strlen(info->username), &pwd_psk,
+-					 NULL);
++					 info->username_len, &pwd_psk, NULL);
+ 	if (ret < 0)
+ 		return gnutls_assert_val(ret);
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 0eabc517ce5..6f1c2f21723 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -46,6 +46,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42009_p1.patch \
            file://CVE-2026-42009_p2.patch \
            file://CVE-2026-3833.patch \
+           file://CVE-2026-42010.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"

