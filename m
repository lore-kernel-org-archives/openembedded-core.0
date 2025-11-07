Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD7CCCFA19
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 07:08:28 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6163.1762499306134160117
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 23:08:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hfX8W1h+;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-340bcc92c7dso444809a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 23:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762499305; x=1763104105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9YhTwRcAitcByU6qU9+QWSZB7OeJGH+eynQ51PhacM=;
        b=hfX8W1h++IqR9bROftNMc3PmVv12ij4zXHi7nP7rrJUZMlNY5icbIP1QeE8yVWRqRV
         2U0wG/XLjKrCxLR4oM+/l2N6oAz1yzlV56pL24WicHVnmWmbMZhUQARN0TPNSGIM1X4b
         fh19DkSKAK/6c3mGsdk5X4PQirrSrph9enyGXrHDD3B4G32F2uvcC4lKUkjQ5wiAS7Ov
         ip/wR8GCeQIAR5+ErMrZGjqR5EUDz2cAt1lQBlWmm+Ngg3g8unOwuA8A/f6eS5dk7bqb
         PciIvovUmCg0/qIKowoC/tjDu4lFsVlym9RKcBqEYpO0BPiBiZondp3Y5AzxmjuvQPCz
         gL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762499305; x=1763104105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h9YhTwRcAitcByU6qU9+QWSZB7OeJGH+eynQ51PhacM=;
        b=uNbFKACJ+oK9NySweI4ZZ40NGYYrdI+4chTBKgnOqtVHW5Y9jXKS/xz+F1CYpb1wCq
         xE7q5I+wfAx2MfAMHKtqkm5XRRCyp3t3Bs9VyvywQBi1V38Nc4Ciwt+s1r2CBH5CzDbp
         cEyhkBtSts56gf7jOOI8+KlSTJAyE2Yu0eQSdWB65+hkAyVXVGrzaO5BnPouEkGiX/T6
         eX27Lezit/BiN8xO0a5SX1gIpi2qgwgbJkMxX1dVgVwYybeqmqYU7lKXqwzh8SdX6cp5
         JqmiYwQgWauKgyGj7qq4u+itUjlaI7twY6pyUFbah+fHPq65K/VNJRmTFBvM1PlSFUpb
         qKuQ==
X-Gm-Message-State: AOJu0YymWsFXsf9IS2NUFg8752DkpS5JpfZsgodjK/0nxwbmn1mJoMcU
	rlDCc59TD459ZV0Nk4t78h7nx5IG1xo/rAWAMCv74E2XqnZqKxWfrV8+8wh0B4S/qmw=
X-Gm-Gg: ASbGncuiAhedOZs8NVXBs9Y6ay/cpinojhrW4eVxDgAoKTGhlBOr1fWuDM8rEkLiajG
	iPm5sDo8PmOigijm8YdM7TRNNj1QH0AH0rWlBkvbee4ruyI+wJID2hxwlODOEI4JIW5HZlbcMfB
	XJl66UzXFvU9Aprx+lrs2BbZ8MBZVuXKQ7a3H/o54d3WM5obHeO5nkyHPDnBrtsXmY+L6pXkbNe
	qD9IIJgA8cld2z1eUkrsMY0L/lXpUWxMB0bk/HbFkNyz1wedazjxW7xfMu51gU0OqmT9tI+d1oO
	gvHN17XC/Z936qoREHV6cv1D1BGKL3pwNY/aPhWxM8H8G6GwD8L4HjIac8oc5yC3uGbM4wzRHFM
	FmZKk6NKfrVzgNzCQrXzvIFN6VId2LduR/zBTW8WLUvsAy2vEtJEf5A6QyHP77HIw6FxKIGr5D/
	GLbrtCAxGckweQvar12kEQGnW+RphEWJe0w9XiNqW1xRYqJIhsJpVUUCE+T0Hi+SOdLyvXnXxt
X-Google-Smtp-Source: AGHT+IEPGYsLKoSXTQxin3B5UlbT6jB8cNQzL/v1XqbP2OE9GgcJk/P4/qxAHssUnRfLCLzZ4DKwKg==
X-Received: by 2002:a17:90b:384a:b0:32e:15e9:2cbc with SMTP id 98e67ed59e1d1-3435360dd67mr931780a91.5.1762499305170;
        Thu, 06 Nov 2025 23:08:25 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a67e2f82sm8561625a91.0.2025.11.06.23.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 23:08:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/5] libedit: upgrade 20250104-3.1 -> 20251016-3.1
Date: Thu,  6 Nov 2025 23:08:18 -0800
Message-ID: <20251107070819.3751599-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107070819.3751599-1-raj.khem@gmail.com>
References: <20251107070819.3751599-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 07:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226011

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/libedit/libedit/stdc-predef.patch     | 2 +-
 .../{libedit_20250104-3.1.bb => libedit_20251016-3.1.bb}    | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/libedit/{libedit_20250104-3.1.bb => libedit_20251016-3.1.bb} (76%)

diff --git a/meta/recipes-devtools/libedit/libedit/stdc-predef.patch b/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
index 0ce6d127a94..88e87aa551f 100644
--- a/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
+++ b/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
@@ -1,4 +1,4 @@
-From 32918b3a91d9fe4719bba78a44ec3262a2994e68 Mon Sep 17 00:00:00 2001
+From f14c2e24556d6c7937bf0b0c538e7fb436a368bc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 31 Jul 2019 10:48:19 -0700
 Subject: [PATCH] libedit: Move from meta-oe
diff --git a/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb b/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
similarity index 76%
rename from meta/recipes-devtools/libedit/libedit_20250104-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
index cad24d8d654..2ea75bba878 100644
--- a/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
@@ -13,13 +13,9 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "23792701694550a53720630cd1cd6167101b5773adddcb4104f7345b73a568ac"
+SRC_URI[sha256sum] = "21362b00653bbfc1c71f71a7578da66b5b5203559d43134d2dd7719e313ce041"
 
 # configure hardcodes /usr/bin search path bypassing HOSTTOOLS
 CACHED_CONFIGUREVARS += "ac_cv_path_NROFF=/bin/false"
 
-# remove at next version upgrade or when output changes
-PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
-
 BBCLASSEXTEND = "native nativesdk"

