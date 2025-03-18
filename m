Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9606C35FF9
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:00 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.4268.1742272731905261921
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PnlhDAyq;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22403cbb47fso94141945ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272731; x=1742877531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV6uWN8IBH6f8kurRbIW2u6AxknqU5t6DlOUOOHNNXg=;
        b=PnlhDAyq2pnp9MGetbH7gZLEZDE4hVL5Z4WoOZ/F+cHnJ2stH9IldLEj8j1bp+lqiB
         zqw4sWTy51gHz5GvbFiKZkTtxmYx1p+p6CjkFK7LczMi96gWgXnIpPnc2kdxAyUk1dvv
         bpN9fp7RDunbzFeHDzOc+xRkcySOcLPvZGMjQAeN9Ap2mdXuI/1gnd4r9ZZYo4hkjyJJ
         p4pl3M7414n9PajrswImbHC3pYovCmhQuOL0ap9XdJLG0qQqLYJbUor0ypG3tXxDh1Jh
         QfMd9wkguJLgeoBUjL63u658cJ6cOpCLLSNJ4KD2xYCEXsyLU29sVYTL/C2k/kw48AjC
         L5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272731; x=1742877531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wV6uWN8IBH6f8kurRbIW2u6AxknqU5t6DlOUOOHNNXg=;
        b=wS8k/kF4kua8dNKdkByXeQ3DhXiYj6djdmIrqLAFuBbEvHU4rXU0jbi9+zWm24LZkW
         WfrewfACgAhIv6WuzisMzG9euBTsva8yO4wqBZtx5ssH+SZamnoDq4DYzePNWZM3/8Ng
         lNYuL6OudsqvX6+IUBb2GVwPb1yYDU0/0iDRGCf9Y5C4oce1riABd04nuDzumP4E95kw
         SvHwIe+V0MNnEbM0kZP6VqdZ5xJGphV+lkZNW5vsm5viEDMPAa1wkoaCPei0SH5GK2fc
         IFA/bRC6D5jyFyt0iRrJsCefe1bofVF28s7ZWBnVBZk5GpALoERikr7zPUPR8ra183Yr
         bOZQ==
X-Gm-Message-State: AOJu0YzYwXJcWiSCur3wEiK4z/nWYwO4wlXCarZTQUubs+F+GGsnj8eW
	mjTXbQGxBh+JUHbqjuwu2kEaI24/0NZSVgmXQIgwyCSQAJ7I9NV7alAn9SMM
X-Gm-Gg: ASbGncs+fecZ+s6P1BxRZXl0RUlCJz9835d3ZLcQS7nGMIZNFPlS+r3kDGNiHrWVEGR
	pGD3t7OUjTq7a97p7nndJoSi2HzJkbasA9Jq34CVQbe3Y3T2n3aPgQ8KQA7/3QXg1O2SrA5A8q2
	q4+Um4gszKMqeueQvhchY6B3060qbnHPBLn7Y2P7qW1ElJCGLHao1f1nwVrA6z/8xVmbE6oF/Cu
	k+dXg1kqwubBvy9Z3DWvmOQ6pCRnUK+2eyrUU3MAtaLr2+etdKjqCNejNk4UrhFfZobs/X5Un5O
	crnLJHVuwmrRCSP1Jc9JBWv8GJ3IidcsdXMy
X-Google-Smtp-Source: AGHT+IEyIoNE5ol0GPKIwZlb0Pb9w5DtvlM8O3VRFp95dmVH+eB5Jc/6WOtzsquSoGvntWrCQBv7tA==
X-Received: by 2002:a17:902:ce0a:b0:223:3630:cd32 with SMTP id d9443c01a7336-225e0b2fa2amr203194015ad.53.1742272730897;
        Mon, 17 Mar 2025 21:38:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:38:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 02/24] webkitgtk: Add packageconfig for assertions
Date: Mon, 17 Mar 2025 21:38:22 -0700
Message-ID: <20250318043846.2422141-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213136

assertions have new knob in 2.48, add a packageconfig to control it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.48.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
index cb4e09662f7..ea16b23994e 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
@@ -55,6 +55,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11',
                    ${PACKAGECONFIG_SOUP} \
                   "
 
+PACKAGECONFIG[assertions] = "-DUSE_CXX_STDLIB_ASSERTIONS=ON,-DUSE_CXX_STDLIB_ASSERTIONS=OFF,"
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
 PACKAGECONFIG[angle] = "-DUSE_ANGLE_WEBGL=ON,-DUSE_ANGLE_WEBGL=OFF"
 PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11 libxcomposite libxdamage libxrender libxt"

