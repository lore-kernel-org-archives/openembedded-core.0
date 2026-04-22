Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D724FF9EDF8
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 15:19:12 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85242.1776871150112006898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 08:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ULhTJXnR;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d70b3e159so2838161f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 08:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776871148; x=1777475948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBUbx3NOz1ugc22kir0qApPpflo+vqQAQ0FJpa2ojxM=;
        b=ULhTJXnRIF39ULJZ9po+mo39XrR7E1EiSUi62aBDAI5Fm81BodI5yrABamERGqmxtf
         kpFytU6RbF2PBvuZ6BeefFIBeyB5m/ulVik1uB4TqW90w9noDDXSMhbMh8fjC1JMyYRV
         TPnhz7dfHjoVhhI71ayyGvAxYaRwHM7WCOeBrScvNkK6R1uqQjhvzy7P/MiIxVD1jORY
         XkF/8fVFV6K5TOAJkdXpCVv0eR5TpDj2z9AdsaJpD1ZQfVpAGP9iS8A+1ta4dZ4zsTNb
         pfp3vaYHx5g4Bv8Giay6IaqV9DUmNU8AsHy9yCE4YVXNu/+ElLxAd+eEsEJpNkOvtrEo
         y28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776871148; x=1777475948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBUbx3NOz1ugc22kir0qApPpflo+vqQAQ0FJpa2ojxM=;
        b=g4+SCjsnixWp+/8s9PpeMeA9rjDy99O8IL8B/baxHfRF6RrGRi0vl95Mou/NdRAEkG
         ILA33MTU2V3MTKTpM8cgk9COAvBJ318ZouBzOuH8hlpWmC8YdxrB33K9PN+vOygjVmHP
         y9BnCXAed7LkHYBG4DHSE5JCer/r9ToeM/LsblNJ38FNCIji1p8wXMenR+wL1SiGSdu4
         0FKxsJrWI6R9Ymnw2SlOAcAx3BJz4G0TbDWmOFsBJdiNgQg9/7EAhdGPeiwYZvgIFIg9
         JF9yfXyiZ2yD2XcOkX7BloQVZrbgnyqHyY9iFjiDu2ZTMVKeCWoRMV0YV+l8L2hFeN4j
         2RLQ==
X-Gm-Message-State: AOJu0YyvX8HSJUf7d3U2za1fKIzv8+ZLoU3ZZ/EuerkJ8ojYBe5sML0f
	R0TneFftoPcYJEaDMEQEedNcq94y9L3VwCk5bG0Y0eHx+6sUkcdlGdB3mSFF+Q==
X-Gm-Gg: AeBDietqkkwfyVRls9WNuesvpTJhSQ4Qw5QofSnUoF3hb993Wfet+EJ9X+qDY0ZNvl5
	J68E47i9mmS64cXMG4SvLd19q6N26YwPxlN+5rk7ALzg76cJP4SCOfZtEuClJnPMSPhVA/yMKMq
	nQW8s7chVRqCKcpzHfdnH4EOsl3b1UYuGPzl6LZjktYvQFql7Il1q1W7yWWGTaJVTlgEIC7IHBb
	bNo4LtBZv1/ke/8Wwv94spOgAXJUNs44bD5ilC5vvsBeLf+/HNgFqA5ALAMdwc+UOJYIb+xq3G4
	Lww7QvNeGJa5CXYjZIP6Zgs4TpdLxvhRbbq7Ver+SYGgOUcmt2yoasj8k7/QxzGeB7nzHhEMpGa
	G4qvfgvbOoelU2O9BkjaRDnCeSR0q//XU5aloWZz0w1pnea951KDoyjwwwkmS+tW2xIAqL6nXoR
	8/CXeSckiWBO3lGO6Yr8IexB/cExNqWtSaOGfnmFza6f3kdO/BvUk/K7qyuUXUU6yrraaRhg==
X-Received: by 2002:a5d:5889:0:b0:43d:7a97:78b5 with SMTP id ffacd0b85a97d-43fe3e0a448mr34077896f8f.33.1776871147830;
        Wed, 22 Apr 2026 08:19:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc07bbsm49384206f8f.11.2026.04.22.08.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:19:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] sbom-cve-check: exclude recipes from version checks and version updates
Date: Wed, 22 Apr 2026 17:18:58 +0200
Message-ID: <20260422151858.2598801-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422151858.2598801-1-alex.kanavin@gmail.com>
References: <20260422151858.2598801-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 15:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235729

From: Alexander Kanavin <alex@linutronix.de>

These recipes rely on AUTOREV enabled with a fragment, and upstream otherwise
updates them far too often to make regular version updates feasible.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
index fbdc561e8c..8f8639ab6c 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
@@ -2,6 +2,7 @@
 
 INHIBIT_DEFAULT_DEPS = "1"
 EXCLUDE_FROM_WORLD = "1"
+RECIPE_NO_UPDATE_REASON = "Recipe is enabled via fragment that also sets AUTOREV, and so it doesn't require manual updates"
 
 inherit native
 require conf/sbom-cve-check-config.inc
-- 
2.47.3


