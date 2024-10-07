Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54EECFB445
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 01:55:19 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.44007.1728266115055948334
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Oct 2024 18:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GS20/rqN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso3116306a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 18:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728266114; x=1728870914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peFkGyDUGdPjBermcx2yrs9wpBwY6dn9H7pvrZItDr0=;
        b=GS20/rqNgW0MDihjOW/v8QWNDcy5FidGaT6bqLLN4d/+oulEcGrytG5H9zIR7khLmp
         conp6bUbaieuMqfnj3cPYxdezpuTFL1ZgZze3QM2G0nzaSkPdBpjjvAz8dxsRxdHjnR/
         btgeL6hGzdH2JJyxRqe/ITqxns8TN12bYwWDNG2xIjNLU0n5uVIBJdpefGifcI1/sYqd
         5oIReLuLx00kyBMOnqnnieOibPj/o/gXDKSSGJD3RtsSFQivzix2sMuuqUPLwOapu90x
         YDC9fT/UAlIwVaQ0IzMJTgmZyHOIyR7j1pN8OO1OBuwj0D+KrA4G5ErfmnViiVB0N5z5
         Ki6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728266114; x=1728870914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peFkGyDUGdPjBermcx2yrs9wpBwY6dn9H7pvrZItDr0=;
        b=lT6ZyEEt5RpgG3KCbjGlPAyILMus6M1ZOck6Bb5tdlaspOr/U+ioS3Lz4p77FS8Dtt
         Ph0Yb7FMjnXBdjsNdwuxdHnUdQZOphu8iJrvLhesW1M99V+gw8ZOc0T29mmleYWEzOIb
         TCOxHAgrPjtU9AMZN7THLvojkdyv7VTy8QP+/YcBP1llSJZnW+g1vfvN7R6HFWoHqw/G
         75cN5LrJdCLjN6jEXm/FYdUTNt9Uk8Kmn6Dl5bLoqGdNFaYPxOiCU1RrY7JGUTqGQ/+N
         fl7Z0mdJAh0z9G9lKFhiDCY+l7zznOcV9XYD4GO12I1CfYIzcc9EC+Aqp6pHOhKbTsMu
         OMWg==
X-Gm-Message-State: AOJu0YyFzXzasIAkrbvPFByOnXrjyxAVZv3cnYALzokiZqTsvfIZskYy
	TIp4l+x8OU8TXW/lxaONXI7VmVNa6r4gXFbkFLX4hyfR+oqS1cwpU6UswvxYQRulpPLMIJrkn3N
	vhxY=
X-Google-Smtp-Source: AGHT+IH56SN84migTcv9pF9BwlQnZRAhjB5VrL6XyAv5YYMHLESa11zXHZff7RiCq3xUNr8BAtsWBA==
X-Received: by 2002:a17:90a:e593:b0:2c8:6bfa:bbf1 with SMTP id 98e67ed59e1d1-2e1e626bbd4mr13540952a91.23.1728266114288;
        Sun, 06 Oct 2024 18:55:14 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20aebb70asm4074938a91.19.2024.10.06.18.55.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 18:55:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/10] wpa-supplicant: Ignore CVE-2024-5290
Date: Sun,  6 Oct 2024 18:54:56 -0700
Message-Id: <33548479f66164f486efdb6aeba2de7da2b5b0c9.1728266000.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728266000.git.steve@sakoman.com>
References: <cover.1728266000.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 01:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205251

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

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-5290
[2] https://bugs.launchpad.net/ubuntu/+source/wpa/+bug/2067613
[3] https://w1.fi/cgit/hostap/commit/?id=c84388ee4c66bcd310db57489eac4a75fc600747

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 22028ce957..01dc72b385 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -32,6 +32,8 @@ PACKAGECONFIG[openssl] = ",,openssl"
 
 CVE_PRODUCT = "wpa_supplicant"
 
+CVE_STATUS[CVE-2024-5290] = "not-applicable-platform: this only affects Ubuntu and other platforms patching wpa-supplicant"
+
 EXTRA_OEMAKE = "'LIBDIR=${libdir}' 'INCDIR=${includedir}' 'BINDIR=${sbindir}'"
 
 do_configure () {
-- 
2.34.1


