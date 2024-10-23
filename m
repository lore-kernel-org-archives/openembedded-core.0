Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72227CF5370
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:34:51 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.7680.1729686885916326514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OlyR2hBV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20ce5e3b116so53577645ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686885; x=1730291685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knR5VOLi6Av9TlRf/l3PW3IHbaXEQZnuV0/wNZpvKW8=;
        b=OlyR2hBVzea5qB2MbB690SS6zYjmvHtTXs1Xkw4RUDhjl47VCIUC+T4ck1Ik10+p73
         NS1RpyliQB34XLvcKm62/y0wcqsJbcB/Xp4QKdUx4z5ZZ8eYfjcM1k6hMestYn/LkMRf
         5tEwcBHHHomr9J9D+gpMXVdumugtDrsjrR5XSjMNvgHyOah6uent3xoTQgXcpgn7eW99
         F3k7ZhqXuywBu79I6wsZHAx8yOq868XgvxsOPdSoNOQ0iaJQsBmkuzatQFBCwO13mIXx
         0EinJvBp/zT3iejekKLEhwSCeksb2eh4VcaDmDvcnE0kj4ic7KXXbDIP3xC0Bqvhdowf
         hytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686885; x=1730291685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knR5VOLi6Av9TlRf/l3PW3IHbaXEQZnuV0/wNZpvKW8=;
        b=T7hi/hb16h952RfgvuRVFDaea3w3r6B3xnBi+hMv8YesbO6gsDAH4WwmhHGJ7AXDTX
         xT5AIeb/gn7kQVT5Yo/8OVl27LFC4707Rg7TPTBZVhIZFw2L0b+CpmMwS1F3YTTXCASY
         Kddj6YkIbDVyxSTmlRUB9bDdyMvQ+mCu9Sbf+QnV0krONVfaPe7hEpKQhnBccU4dwbxb
         AMCThzJ+nDuD92wuQmyfLMBMSu7+uNEvMoxzUbG13xnal2ETW0uczwSCQkKxT9A7RE7U
         y59SNSF14d4V1saS6vxbTMInR67f7xr0MwVjWFGw6RuVICQ22RUlnRL3lErfGntFP3Np
         j1XA==
X-Gm-Message-State: AOJu0Yyj4AF5wL6c9SSP5SQzpuXvvGwcALdFJe7XAKfdxYgCVfZdI/Hz
	Z8vD/m2+iGIpD0KhMihyYT8s6NWRh7cBtf9e0JYZMKDnNl7q0RH+X8v8l2tevAjTYW5rWSoCKM3
	L
X-Google-Smtp-Source: AGHT+IFcUFroPJIJ33m3h4xVMw0OoIpLylMWQgJjmvuVLe1rDETWWQRTAYUd8L6j1X7V1sPKvBsRRg==
X-Received: by 2002:a17:902:d511:b0:205:2a59:a28c with SMTP id d9443c01a7336-20fa9deaa62mr34894105ad.1.1729686885163;
        Wed, 23 Oct 2024 05:34:45 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.34.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:34:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 01/27] wpa-supplicant: Ignore CVE-2024-5290
Date: Wed, 23 Oct 2024 05:34:09 -0700
Message-Id: <617cf25b0f49b732f961f1fa4d1390e8e883f12b.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206212

From: Peter Marko <peter.marko@siemens.com>

NVD CVE report [1] links Ubuntu bug [2] which has a very good
description/discussion about this issue.
It applies only to distros patching wpa-supplicant to allow non-root
users (e.g. via netdev group) to load modules.
This is not the case of Yocto.

Quote:
So upstream isn't vulnerable as they only expose the dbus interface to
root. Downstreams like Ubuntu and Chromium added a patch that grants
access to the netdev group. The patch is the problem, not the upstream
code IMHO.

There is also a commit [3] associated with this CVE, however that only
provides build-time configuration to limit paths which can be accessed
but it acts only as a mitigation for distros which allow non-root users
to load crafted modules.

The patch is included in version 2.11, however NVD has this CVE
version-less, so explicit ignore is necessary.

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-5290
[2] https://bugs.launchpad.net/ubuntu/+source/wpa/+bug/2067613
[3] https://w1.fi/cgit/hostap/commit/?id=c84388ee4c66bcd310db57489eac4a75fc600747

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6cb794d44a8624784ec0f76dca764616d81ffbf5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 257ef43b6e..ac99d0db49 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -29,6 +29,8 @@ PACKAGECONFIG[openssl] = ",,openssl"
 
 CVE_PRODUCT = "wpa_supplicant"
 
+CVE_STATUS[CVE-2024-5290] = "not-applicable-platform: this only affects Ubuntu and other platforms patching wpa-supplicant"
+
 EXTRA_OEMAKE = "'LIBDIR=${libdir}' 'INCDIR=${includedir}' 'BINDIR=${sbindir}'"
 
 do_configure () {
-- 
2.34.1


