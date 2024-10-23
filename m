Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957D1CF5376
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:21 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.7694.1729686914822471391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NwpBPGjU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c714cd9c8so67741595ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686914; x=1730291714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GuiAwVhXY4d4v/En1HkWwqV0ORjBCY8BCRaNWioOXI=;
        b=NwpBPGjUuA2gvsjbPwcdIfhjHaHMzEc6ht9Einw7g3MQs624isazR/zlsn9SXzZfzj
         IRtzJ6cZFLCuXZYWs1m2dBivevPu1d+rTo/tBVGgg5Uqzb5z5m8XNAgmIVkIN1DWxckd
         eyvdatq07A46wA3OK6yeSzn3UQrwrqJUhHVPXiPYmIy+JwjHXamC+vf5i3DDy0Q+P98R
         AP3H7bcadYYxwI7wlEYqmTlg6ER/Rnk/1or/AV8y0uWTRYDJliFYOII7xCucNMWJo7gX
         NeC7vrhzTyu0MBpRTyh+lec+tleM6FTVQNP8XnOTZK4loSK7nFiRFtqtJw/tjBLbKI6I
         VBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686914; x=1730291714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GuiAwVhXY4d4v/En1HkWwqV0ORjBCY8BCRaNWioOXI=;
        b=QpvVV1GlcySdwLG7fg6gs4IKUxcG+b8mNSIJbx89qZGrcyxPCDPDQi/wFDQFQ/S8T9
         5PKsaQl3e5G6bJg/6nIL4ldl1Co2rqNdbuWlerP/mvcF48QlTm2xhiAxdtT1NRnDvz9o
         3BWa99luVS/pX5Mfo+WR91BZB210IRUya9P4DQoc0pP2OdXE4+cbUe45tloJTN/Wbn0q
         WyUbwWfqHd4ApHeFo99pA5BBGglYYAuQvz2nylOve2lL2l6Oi9JC1mlbDqcHS2XKMX7Z
         1InTPUjcGy+WKO2I27dBm6FE7erVLMEXQ4Ms+hNjBdsybyQgHjD751sD05XSuZGHOeK3
         FI8Q==
X-Gm-Message-State: AOJu0YyVDQAjP6EQG/oo679amaj24WcumSVx/BcOo0eV9/UMlArQROYV
	u53WQXV40LZFQJj1NaSTYJRLdOuoN0umf8lFGhF9C8XrmpTBNw/yUFM8o0jQwXp+uTCZWhxPcWe
	G
X-Google-Smtp-Source: AGHT+IEkt8JfqZp6M0+fsdkUFzSnhy8ysxxKExLSodBc7gsc5fI3LALgnIpzB2kxrGvVPhODRwuecw==
X-Received: by 2002:a17:903:41cb:b0:20c:774b:5aeb with SMTP id d9443c01a7336-20fa9dea1c0mr34980365ad.3.1729686914146;
        Wed, 23 Oct 2024 05:35:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 19/27] libpam: use libdir in conditional
Date: Wed, 23 Oct 2024 05:34:27 -0700
Message-Id: <ba11742291bccc9ac4d30ca85b058576cbc17427.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206230

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Using the usrmerge distro feature for this check causes the -native
variant's build to fail. Simplify the test to be correct for both
native and target builds.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 105e6fbdd28238cef41f280c0c28939b24d1a96e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/pam/libpam_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.6.1.bb b/meta/recipes-extended/pam/libpam_1.6.1.bb
index b9ef564f56..c9ef40bf23 100644
--- a/meta/recipes-extended/pam/libpam_1.6.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.6.1.bb
@@ -155,7 +155,7 @@ do_install() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		echo "session optional pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session
 	fi
-	if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','true',d)}; then
+	if [ "${base_libdir}" != "${libdir}" ]; then
 		install -d ${D}/${libdir}/
 		mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
 	fi
-- 
2.34.1


