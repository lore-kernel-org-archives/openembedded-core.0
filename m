Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33369CD4F21
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 13:56:57 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23910.1779026214474092063
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2026 06:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kgClLyK+;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39396f873adso23350641fa.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 06:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779026212; x=1779631012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFbSjXBIwpQQASnFjFhKZ4HPGsuFSsvFDMIL6gCoQAo=;
        b=kgClLyK+yTIbSqLj6yN8sYq6D3eRTPRJh5bcRM/1BYgzncZfU18kJyFnEYuN80wPSV
         VvCwls0DVrvRlpaNA6zhG9OfU/lkfGR8kmN1dNRzU2NWOTpsl9mQ0/QbZz900Q632bae
         w+RrMtnfwSmmgztP3ae1W+ZqseHIQ7+i97j0faTUJjacJABTJL5m4K+y1Ar14KflUD/+
         a5NG0429qV808hq8QchrJ9gMmRIdzQ7P0REkxpd2mzuDqzGfWzbULfP3uy4kQw5NPdoo
         hHYzZU+kMOhvHaFP2qTY3m049qaMbLCT5B5z3Oa+zoNYfbbzzTwIAt2kJ43Abp9ZBZML
         bqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779026212; x=1779631012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFbSjXBIwpQQASnFjFhKZ4HPGsuFSsvFDMIL6gCoQAo=;
        b=cDXmLD8h17xNErI0DGdn6KmGKPAFGL09KXWBacOVrL4WN0zG6Mk9i2z7B39DcBlxkh
         hdIAql7Fg7++hpFIagwvcy/A2oC9/Hb62LHvUZJ1aIe65IcUksMJM0oqWc9iG2ymACuz
         l8ruon1BLFDlI/ReDkRpB9QrA1OSGRabXEiqcOt0Zq1p9rGBw4WhXQCRGIEcj3dOAQ2e
         DlxwbM7JpL6i8irp62yDWX3CyLDCBWaSdQJhkmiZeGOzh/j0WWfVsanDc5AxSNHMmq5Q
         vo1pE5vzrM8rLlGfaRSaDQs0/9P5Fbrm2UsY8Z1uwRbFgWJwQwJ2F/X9rM0/UIDjbWxU
         Eyjg==
X-Gm-Message-State: AOJu0Yx6fWA8bK4enlJtNksICzllI5NFtb/oZzIGOhl7+LW+7NA7djIw
	P4sxzNy4gBqqflGPNxZ4Nafi82ItiNhW3N9ose0ZebOBnYyQy353p/6wzoXYaw==
X-Gm-Gg: Acq92OFDiuu8BhJdrjlRyR+0MgfMhFP9hytIipOU2xRhMG8xPalPIu3wMnazftWPwd1
	6wTv2UPc9PzULN1aw/Z3zPtxI1yPMrY1WxVOFafRUyPy4+m8uKv17GTfoMkMfbyFV/cGD7Zu2h6
	c0Nf8STalJo01w2ouQLZTHifdxtPy+BpgDhLZ+bDIeYh3fCIWK2ifvT7Apqik2WmooYl2tFZ+n5
	o6QN8OhaVakootP1OQLinkYPZ0eccX7w+568Sbi2y33tmk7fn8HGTNAeOHAwj2GRTFOgQY5jmRi
	xUZW26GJ6znxpECove6dHnsAWgJEQtx6pYljh/n5TUIRGKmhMcDQimmeJ4xDb1lW0or+qyceCzg
	pAhCeuw0c/qaeyThYUaIgQjWz/TWB5ZCI0rXXb32xbkKWKEfmy1cTunbR3LghQ4wCetx4CyhrsA
	192Y6o27jJ0pSyJ+R5J+YZFK+EQgn+2jKieLUGrmsdzPR565IWUunITtGcyQTRq24TpHjDimV5S
	ShFf1ylJFbBhS+zhaX6BmYoTaAsos1OECQ+pZkWuIw7oSEP//WDBB1Hf47cYv7MLgDgHYdEdQ==
X-Received: by 2002:a05:651c:1602:b0:393:a2ec:da3f with SMTP id 38308e7fff4ca-39561c0cdb0mr29952141fa.4.1779026211777;
        Sun, 17 May 2026 06:56:51 -0700 (PDT)
Received: from peterliu-precision-5680.emea.group.atlascopco.com (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882822ccsm5319001fa.8.2026.05.17.06.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 06:56:51 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] dos2unix: pass BUILD_LDFLAGS to native build
Date: Sun, 17 May 2026 15:56:46 +0200
Message-ID: <20260517135646.11831-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 13:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237190

BUILD_LDFLAGS is missing for native build, add it in.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-support/dos2unix/dos2unix_7.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
index aa078ed200..cb7102942d 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
@@ -25,7 +25,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[nls] = "ENABLE_NLS=1,ENABLE_NLS=,po4a-native"
 
 EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS} LDFLAGS_USER='${LDFLAGS}'"
-EXTRA_OEMAKE:class-native = "ENABLE_NLS="
+EXTRA_OEMAKE:class-native = "ENABLE_NLS= LDFLAGS_USER='${BUILD_LDFLAGS}'"
 
 do_install () {
 	oe_runmake DESTDIR="${D}${base_prefix}" install
-- 
2.43.0


