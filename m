Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E945CEE33F
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 16:59:00 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1950.1763485132579647797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 08:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jClaRMfX;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47755de027eso39787555e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 08:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763485131; x=1764089931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UV9BUUc8FW4Cd6RdcwLAFjQDnAq6+j1geJ3UDSqqkvo=;
        b=jClaRMfXDWrp2ch9rEV4tfKR4ixb0XsEvzMeuL7GOk2lgSRyS1ySVIF5in692/SpDD
         TbNk3nh5LIjStTpozf23rMDtP8qk4YF2uBrLI7Ph2LtSv1003kgizRFFbsX/BT5E0MCd
         8JQOqYfPKkN47x0ltUHU4UmtRmRYXrx85f1YZEzMotyw3bj03b9bMRViXHz+jKqCG7JB
         6SMQYlB2KxTWzbAUAHQ+chRmlGPNpUbqsnF9k3CoH8ob2Dwy1Poxu+wc7E/Y23SBOt6D
         aNhMTApEg4iil4J5kMfpkK12x55a9s1v8i1FhlBjTDJhpX/E80GfFX5QUyhuykV9oVKr
         iFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763485131; x=1764089931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UV9BUUc8FW4Cd6RdcwLAFjQDnAq6+j1geJ3UDSqqkvo=;
        b=V4oeTPjOJTjCm1PRNPhF6/7RIRwpCfSchv2W7k25iXffyqSW7TVS+NFVIpn7tB0+KX
         4+jj8SQx5mCgYZ/8VTxenJjF3uDVVYM1m5EuR76XWld6tX1h1cblfDPa0EgHWV6zszm3
         wM4PURKUpBqpN9IoMNgibK4Umke4PJxlJ993r+O2wo9BY7PsP224UIbm+Oj0DstaA/Am
         qq7MLA40xSrbc5U7irzMowmAg+YwNccE/l0uehXMKGO8B2k645BnxRY239E+GqGsFVSD
         kTCA17BCC87/XOiajE2YsFvIP9B5q9FkOw1IRHCo2IemhBQZcghsS3UJL/ROeexbBoXX
         d+8g==
X-Gm-Message-State: AOJu0Yxfb1J6oUw0cC7IWoGIM7j/4PyG5Mik3jp2szi6CHPV50pxW2Si
	PFUBPzdI20J67nvggAd7/fqH8vU6CQxgzgA5Xg/pChaEkn5DH2Tv+pDN/NEIFA==
X-Gm-Gg: ASbGncvViU4GUZycOsXCk3UZzLKdI2BhFSK5ba5BmHGfC0oLdIzje4uDnm5bvJuR+Vl
	kFPvtneg5M9xdaDL9ZlvYn1smkmhQ2zG8uLD9fCas7BTbeaptHS9LEnGgUNo51TpSMjJcg/At1N
	j+4XQ6rg6oP2ZDtveLWQ/GSZTxIfgz+nm39mdEMRmKM2REFquZS2bxI6KQ+4cxxUL85QaoKH/i9
	wHejVsdd83wZIVu5yw06ohbnutru3PwpZpVWJPhpFncUr54LNh3pEyytR4ZVxc9kjDqUqlk80cf
	yFnGZThoUXjZZaPEqZ1BT0nvyOLhmdyQSga3SvLPXn7Pr2GkZSGo5MSsM8kTajfEPbU2O3NxcbZ
	iKcvkLLSbvlVZwTLyyk9zG+6EVrBdxl0Vu9aGpmd3nOws94aD3XoDMh4eymom0mUjhTiv3LHoqx
	VE4G0i4k5KYCyG51duAwr8kLbzmBp3thb7yPlI4dL5Iy1j83NFtOxHa/bTVQ==
X-Google-Smtp-Source: AGHT+IEsjedduPKpMaPmDFgLgh4smQiGKKY7nx8wUbQG3TzUPlzL4LD+ey689SfoBjFOW8z/3P1gjQ==
X-Received: by 2002:a05:600c:4f0d:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-4778fe41c75mr157243325e9.6.1763485130813;
        Tue, 18 Nov 2025 08:58:50 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e6acsm387883405e9.9.2025.11.18.08.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:58:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] local.conf.sample: comment out the root-with-empty-password setting
Date: Tue, 18 Nov 2025 17:58:43 +0100
Message-Id: <20251118165843.3674407-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251118165843.3674407-1-alex.kanavin@gmail.com>
References: <20251118165843.3674407-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 16:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226533

From: Alexander Kanavin <alex@linutronix.de>

This was not a good default; the autobuilder relied on it, but this
has been fixed, there's now a separate fragment as well, and testimage
has a check for the needed image features. Let's take this out and
be more secure by default everywhere.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/templates/default/local.conf.sample | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/conf/templates/default/local.conf.sample b/meta/conf/templates/default/local.conf.sample
index 2639be3ddf1..fb6ed2c3bf2 100644
--- a/meta/conf/templates/default/local.conf.sample
+++ b/meta/conf/templates/default/local.conf.sample
@@ -122,8 +122,10 @@ MACHINE ??= "qemux86-64"
 # There are other features that can be used here too, see
 # meta/classes-recipe/image.bbclass and
 # meta/classes-recipe/core-image.bbclass for more details.
-# We default to allowing root login without a password for convenience.
-EXTRA_IMAGE_FEATURES ?= "allow-empty-password empty-root-password allow-root-login"
+#
+# The following will allow root login without a password for convenience.
+# Use with care, and never in product builds.
+#EXTRA_IMAGE_FEATURES ?= "allow-empty-password empty-root-password allow-root-login"
 
 #
 # Additional image features
-- 
2.39.5


