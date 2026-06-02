Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DBACD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 15:00:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.364.1780412423299002651
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 08:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FB6rA82x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4906238c62eso94576175e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 08:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780412422; x=1781017222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4p3uADFcdSBbtz6rvw0O5dleK/URIEoXyH3xop5idw0=;
        b=FB6rA82xGAdd3k56xZbJqRryRSIwYAQp4BmECOtOfoI54z5az0Oh4GQ8/0r4EdjVfc
         3OKRcDERUKLCB1XwMFH2vT4o8rdv0G2j0NYMi8LwGTCPrHIBb5W6htoGOeCTNd2ngZjg
         GvzGMVhqgp32BzzdnbIiBGYGQGNkygU/19A3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780412422; x=1781017222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4p3uADFcdSBbtz6rvw0O5dleK/URIEoXyH3xop5idw0=;
        b=bQF3AGuhzk0hHAMHLEh+81VbhKKQcSpenwpDyvDhnfpp+rozaPWl1IdcyS7pumH+/r
         3rJGrb4Lz/0ofDFyIK2aUADmVTjOjegV8aW3gPREmOy7qulnQFNoIrDLAlw27P2mzZ3w
         C8iywuU675+eFTK6M43hdHaw6eWks2RJApfdii5rp34yt/kb6Ud85og6RoH7CKffH4Dd
         drw13xBjtB2CAmJCVuNn9lWyUuZKiLyzDgMKTu/D/7/3x+9g16raV+fx6FpxYoWY19x3
         K1/R02kLDkoUEufh+eTgs+K8FyLLRaXcUIVys6MhU0pdE1gSyMVB+VlUn1hdjvDXM6hf
         aKJw==
X-Gm-Message-State: AOJu0YxuOdm4G4J593YY7SajcJL4PFhkGmrd6YRjfRsKXd/oNlAtpK/0
	IJE7kPosDXMA3LUkcrPahq8w2IdTs76smegtNk39im/TIJiknoceJONXhjSNLJhQJtyeOdUKxtY
	5R/db
X-Gm-Gg: Acq92OF4vcWPRTOuIc0mEtNk7y8kvUbXiGAN5oWeCHmmsEYZdce7qvw6vJS2bdhkDFF
	dVmxAPBMYvS+6QYGkCj6SVNozg5U8mJlXunJkFUjn1KrRkXHn0PPbt3/Gqo+aVZN5qc76KF3ZIq
	XmSQb7jJ2ia01cCIvYAwUNTpVaFDBlmKpANNlssKJXxXr8vX1XT8J2JI7GVt+UykjRn7HTRsyMa
	mvCIwHDeDsdHz0Eu5KfEnKrKarT8i32Dh8HcXyh7fhTaapUlpckeZbmngsYIkbfOKTecAWmHFRO
	MfZfgMgMJ3LkmCbKB/Qz9Rz1dZ4D1WbU1cpsX0uXLljsGy2Vk5Pp3MaPzOVX9rKfKInpVFEb4v8
	I4LLEqTTq84oLvuUiYJUwi8EAa7urfzLraG/B7p3/XvJYhzCd0iLJxSeQ0wvoeeLoG8ZEO6St5G
	aRIudpQ94yTHCm7XQFeKGr1S9WA+rCFLhpF7PnQ1gmGacDXbCKfIePdOLKBGE4hoE=
X-Received: by 2002:a05:600c:5254:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-490b50c3f35mr505295e9.33.1780412421489;
        Tue, 02 Jun 2026 08:00:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:60b8:c7e8:3832:2c23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b00d02afsm36455725e9.8.2026.06.02.08.00.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 08:00:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dropbear: Clarify LICENSE and drop PD
Date: Tue,  2 Jun 2026 16:00:18 +0100
Message-ID: <20260602150018.189097-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 15:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238058

The "public-domain" code has a MIT license header so we can remove
that from LICENSE (MIT is already listed).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/dropbear/dropbear_2025.89.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb b/meta/recipes-core/dropbear/dropbear_2025.89.bb
index 957a0901fb0..ece065265ff 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
@@ -5,7 +5,8 @@ SECTION = "console/network"
 
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
-LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & PD"
+# The 'public-domain' file is headered as MIT
+LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=25cf44512b7bc8966a48b6b1a9b7605f"
 
 DEPENDS = "zlib virtual/crypt"

