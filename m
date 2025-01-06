Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B09E77198
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 16:09:53 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.63411.1736179792768587161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 08:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D29h+aYb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436a03197b2so52104885e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 08:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736179791; x=1736784591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IVT5vfNWfHqhwfga+Lvddf5ygvz03jSQEI1CskkYPg=;
        b=D29h+aYbteoeQ37PJuytifL+dc3B0Aa7WnKzs/XloQZc9mNW7KrgWVBxj1LPiM7hfO
         06rLmJDYljEcxPyvzd1JklZDMSYNVPcr+C0naxHyk5cgdNVZ8wzje3PHKl3L5C1PQdWO
         SCUARJhX2MayJQOFW1GbQo2XueFL3fotPja+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736179791; x=1736784591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IVT5vfNWfHqhwfga+Lvddf5ygvz03jSQEI1CskkYPg=;
        b=UjHEHpUlQJ/PUO0istetm4OPNFMBpqjwOMPsz61pHy8V4VSo2mG2EgfBNLRi2Uw+TU
         YwnYGV2xZC3qqY7xQj73q9q8NqYYE4oX+/9ze5AG/ijgxPc72e6z6WUmM3glxwgUN/iQ
         FtMgEAYRPqXO25p6ohMr1wuxmMdB8Mm9G6wgM2ZJD2bzhGy8q7Cjlbw6Um1h2GN70tNI
         0MDlvcLzE9nGEByykZUP3JRJZJ2GXOv5dQaXzq1OunBnNzBFq07i0R7KRER/uSdElkz2
         HyaZUpxmtBdZIUxy6MoG0UP65oU84pSPcg9/F1Hs46EGtkst/pLCRnnhiwvRlcbGjBKb
         dI+g==
X-Gm-Message-State: AOJu0YxsAy7cQhdXqQ5imp6LRzvcuglnMDbcy6sVc+CxrzC/pMlBFYIh
	qUaZPiM5UjgTKk8a4kXcpYoE9AxD0uH1MACGbTMOT3QompstibhRoawMxs2Juimoo3IlddRWYPc
	EnRg=
X-Gm-Gg: ASbGnctY0kTJsYk4GXgTYYnua9RjRJCGQ7mHolSE/TE7pSEIX7C8r9gOvXsGvOYTV8e
	20u11wMThoqFrXsDVKW3nxPh9hdBxqIZzPND/kErZiaZmjobrySUBy2TLKTwWWCZnaAodJ5sGJ1
	goxJXU4NT6UDr/ReRTOhsbUsJAuqUk9YbMOZcqU00K8oo9TpxNdHuTDZGg9qqG9y95Cz210gcp0
	MrCj+OH/1icqC6U0vdUY8a88WNH57VjszKpSTlWj0DFMTC+aTAUfXD97X5U9tRZrJi8p4BY5Rtl
	y3UI46+UhA==
X-Google-Smtp-Source: AGHT+IFVISouDggoph36Ld7qCDwx7Ndo0afjbsxBHUDyijSrvJS5wAcXurMSy4SJ8bmXWoHMoJn8QQ==
X-Received: by 2002:a05:600c:458e:b0:434:ff25:1988 with SMTP id 5b1f17b1804b1-43668b7a3e3mr437018255e9.32.1736179790778;
        Mon, 06 Jan 2025 08:09:50 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3607:7267:e27a:36e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm600024525e9.12.2025.01.06.08.09.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 08:09:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] coreutils: Improve core-utils-native dependency handling
Date: Mon,  6 Jan 2025 16:09:46 +0000
Message-ID: <20250106160948.803305-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250106160948.803305-1-richard.purdie@linuxfoundation.org>
References: <20250106160948.803305-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 16:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209429

bash-dev-native does not exist, nor should it. Tweak the recipe so that if/as/when
we fix native ${PN}-XXX handling, this doesn't break. Use variable indirection
as the least worse solution as an override directly will get overwritten with
variable renaming, resulting in a warning.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/coreutils/coreutils_9.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.5.bb b/meta/recipes-core/coreutils/coreutils_9.5.bb
index af0fcdcc4cf..ae07cba164a 100644
--- a/meta/recipes-core/coreutils/coreutils_9.5.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.5.bb
@@ -182,7 +182,9 @@ RDEPENDS:${PN}-ptest += "bash findutils gawk make perl perl-modules python3-core
 # may need tweaking if DEPENDS changes
 # Can't use ${PN}-dev here since flags with overrides and key expansion not supported
 RRECOMMENDS:coreutils-dev[nodeprrecs] = "1"
-RRECOMMENDS:${PN}-dev += "acl-dev attr-dev gmp-dev libcap-dev bash-dev findutils-dev gawk-dev shadow-dev"
+DEVDEPS = "acl-dev attr-dev gmp-dev libcap-dev bash-dev findutils-dev gawk-dev shadow-dev"
+DEVDEPS:class-native = ""
+RRECOMMENDS:${PN}-dev += "${DEVDEPS}"
 
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests

