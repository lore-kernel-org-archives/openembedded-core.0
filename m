Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A647CC47079
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 11:12:34 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.4387.1704712352937503273
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 03:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=izlf8WU2;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d858c56cbso22818905e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 03:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704712351; x=1705317151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uvXm2+dG0dhMODNAfSELXcJBga1CjSMRE/i4Id5LXk=;
        b=izlf8WU2kWU+nRHX1q5lQPoOb2maj915PuI3OngTq6BJkfQEKPdMesOTuoZqlyCdLu
         H3CAxKocwMLXidlPPpru/eia43QQRXX4ctcKEiPtPidpem/adY7jvQ3+nyF7B7jxwGiE
         03k4emwOOuPYpTTZ2AW91nEVnpPOasYHD3GL1ovwXYR7y7kNttixsZQQES9g4qrhGbUf
         LnWmiYpbfYzZqrFbbri8h/LMC5HUwKU9ADPkq9PwKbkZqQBFzNRbwFrBdp7xhGbbSJA3
         IBPY0pmkHY/c5IrWQwEc0NvVkJQEbvyHKLeaE9HKkeMK+/IvR5hUO9rOvVjG3ZUFdmfk
         JLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704712351; x=1705317151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uvXm2+dG0dhMODNAfSELXcJBga1CjSMRE/i4Id5LXk=;
        b=fQeC5uJ++nY5PwsTY+oWEws4VU7Clx2ME2XNr2xzJW62J3eTI2QYtBBK8urN028BtL
         fPLYW2fpZdHIjPZnzDoV7E20xisE07TJnJ7ZiW1obSQ2aT9Wic0U+c4XsKT/BHJyQiHH
         e7ZObYwOoCgcEjCWhfjyzcTIKyptZDVekefmWaG+kuW4UXfrSPLxnz1ZEpABMEiCNnRd
         YjkijQxhX2lkw/wv5N2HefZnyg7IhW0v7IEajPUTJdsGkBUCM/sv3Z0rb/PGpVG4vtJn
         a8Ks9k2nVYbkLd1DXN4wq+Is7J8rLhQK+ceZeKLkB3rKGlTcelQXjywbBOYdzeE1Q4lH
         lZ4g==
X-Gm-Message-State: AOJu0Yw5joGu+qCHya/X31Ttwy7urN1E34qkmemHaCjOHo8bYe2bhUQo
	h5X4rSgqbAwwcyi5bLhtuNRKSmpyP4U=
X-Google-Smtp-Source: AGHT+IHhNeoW3jPDvf3Gq51uQdPbHdGV53dbCoUNVW1UhZ97+KWYBuBstD0oWvLBbOPy4yrU4+A69Q==
X-Received: by 2002:a05:600c:c0a:b0:40e:4618:ee5b with SMTP id fm10-20020a05600c0c0a00b0040e4618ee5bmr895634wmb.157.1704712351048;
        Mon, 08 Jan 2024 03:12:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s11-20020a05600c45cb00b0040e395cd20bsm10523886wmo.7.2024.01.08.03.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 03:12:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] libpcre2: fix upstream version check
Date: Mon,  8 Jan 2024 12:12:26 +0100
Message-Id: <20240108111227.3261354-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240108111227.3261354-1-alex@linutronix.de>
References: <20240108111227.3261354-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 11:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193399

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/libpcre/libpcre2_10.42.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.42.bb b/meta/recipes-support/libpcre/libpcre2_10.42.bb
index cd65493c482..f471b3f90a3 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.42.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.42.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=41bfb977e4933c506588724ce69bf5d2"
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 
 GITHUB_BASE_URI = "https://github.com/PhilipHazel/pcre2/releases"
-UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>.+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
 SRC_URI[sha256sum] = "8d36cd8cb6ea2a4c2bb358ff6411b0c788633a2a45dabbf1aeb4b701d1b5e840"
 
-- 
2.39.2


