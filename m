Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1377AC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 17:37:02 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.94313.1738604221129861480
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 09:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cObgPSfM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so47376965e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 09:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738604219; x=1739209019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zZ8U/ciXBe/bLNkrQT5C2lC1aCDjQliio4hNSfEs+w=;
        b=cObgPSfM6Ad/IeSzTDTu0Qj0P7C8B+dVkmZEw3d9CNnYL3uQBpNqWA+Ap7TJGtqTSW
         kvLfZwnYfVfbJrLD3DEL8qTzzMoHXQoAZdXymIHiFkFuhIA7jCfmXZeHW6MyrW8isafY
         GiQNnBr1ygn02G5n5Ldu7BZfrpME4KptDRMXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738604219; x=1739209019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zZ8U/ciXBe/bLNkrQT5C2lC1aCDjQliio4hNSfEs+w=;
        b=OStNymg5Bf+GtRY2HIl8rgOhdwl4P16X3eWGjTZq1Uo+71WMO9tvFaIMSxxWhzmXKg
         SFTt20fYKq4G/SRiuo2BkHkDfppExWreBCaME4Qk80186tbJesFg9ZF+7PDdlKGNGtxf
         kANp71ntK3PqpcjDWBSwaCrcoZIvJXv3RaBNHLtQRcIPslTPSx2ibjnBLCBQ5OKOt39x
         3YR9ye+14XNMJscijMpzO6r84Xf43OytJurOLdeD301Le7U5cQu+vUly4C0AAbI+ERdq
         WCsYHlXDLwMwnT3AeQGfwumpJz7vHJ7Gk8F4al3ENT/8U5pAkpsoowFeX1lWmA63l823
         Y0zA==
X-Gm-Message-State: AOJu0YwDRVMeFLTI7sLdLYcYYFR4l73EuixWiEgAau/kVcuR8bQo/IE/
	aL2zreXt7SJnD/+na/g8yHP2qgG5gvWEeUOExu1m+7OwQyMLdC2oWdsFs/3rMU+u2Vi9mPhgNgw
	r
X-Gm-Gg: ASbGnctpU8iSHzZX8mX643zErKrk3BPUdCqQOglROKO1A+avrzutTAP8LTNaNlqJUdZ
	D3Gyg/GJ+yMC0itG0AA+lLkgy9N+XkaXBmDed3zIcM3cfyk7PmRhGPCaiCHqq1XfZzRPD/9KjWv
	tqjUaOE2djyUiSpcVzB7oWYTrXexgbPMMioEvINsf4W9PYe95sdiKMAz8WFHyTar5Q65kD3xUPq
	ftMCF2v0BykMvBVaz3XL9PZ0otk7kJtVmcatNwjfwi/4nrCkui50JlEnLd8Rk8LwPNj68Gjf1Ox
	RmaAhZDqzFFmP3U3qlc8itWW3J26/BmBKy2hK4pNIl/z
X-Google-Smtp-Source: AGHT+IGYRDbFLQJF1nVBCNQYtW6nDpZypDDSZqGExTrcUOFIibq0NAAP3xXvSHXeA67OORa9aT+Hdw==
X-Received: by 2002:a05:600c:154f:b0:436:30e4:459b with SMTP id 5b1f17b1804b1-438dc3ca451mr202888735e9.18.1738604219234;
        Mon, 03 Feb 2025 09:36:59 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244f403sm161056515e9.25.2025.02.03.09.36.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:36:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] ed: upgrade 1.20.2 -> 1.21
Date: Mon,  3 Feb 2025 17:36:53 +0000
Message-ID: <20250203173656.3412275-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203173656.3412275-1-richard.purdie@linuxfoundation.org>
References: <20250203173656.3412275-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 17:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210720

License-Update: Copyright years updated, FSF web address added
and postal address removed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/ed/{ed_1.20.2.bb => ed_1.21.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.20.2.bb => ed_1.21.bb} (74%)

diff --git a/meta/recipes-extended/ed/ed_1.20.2.bb b/meta/recipes-extended/ed/ed_1.21.bb
similarity index 74%
rename from meta/recipes-extended/ed/ed_1.20.2.bb
rename to meta/recipes-extended/ed/ed_1.21.bb
index 2b78b080ba3..4308fac6757 100644
--- a/meta/recipes-extended/ed/ed_1.20.2.bb
+++ b/meta/recipes-extended/ed/ed_1.21.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://www.gnu.org/software/ed/"
 DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, display, modify and otherwise manipulate text files, both interactively and via shell scripts. A restricted version of ed, red, can only edit files in the current directory and cannot execute shell commands."
 
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
-                    file://ed.h;endline=20;md5=c3212b6c53b09668107420af9368c0ef \
-                    file://main.c;endline=17;md5=e5d2ae5ddd1ecb87dc71702c06dd06dc \
+LIC_FILES_CHKSUM = "file://COPYING;md5=cca7f74ec83b7a9ce7ccd195aad471bd \
+                    file://ed.h;endline=20;md5=a24e7f91c0fb83e65a746f5994762a49 \
+                    file://main.c;endline=17;md5=fd6ad9f1853f123f4ae7a31d59761f09 \
                     "
 
 SECTION = "base"
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "65fec7318f48c2ca17f334ac0f4703defe62037bb13cc23920de077b5fa24523"
+SRC_URI[sha256sum] = "60e24998727d453a5cf02c54664b97536de46a2b34cd1f4f67c1c1a61bbbad75"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 

