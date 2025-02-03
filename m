Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A968CC02196
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:20 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.92268.1738600870983376475
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GXCF4vew;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so2421188f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600869; x=1739205669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DXIWB3yR/nOksML2SljDj0BJ2fG8Da98vpkZ40mjiU=;
        b=GXCF4vewfXZznSCGwwWl+cQd7Qa15SwdHSJNuOXrhNoeqPyrfPWzpI+jeNiryNbn/b
         C5gbYA1SJReQkbD4NeL9LDRzN+NmoiS12gAhwaMt8O7kpY3sdGJ8Gbssz8lNtBSjGu3l
         lqHLMdZt6WxouLSG2z+gftLrq1NmzSlM58nmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600869; x=1739205669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DXIWB3yR/nOksML2SljDj0BJ2fG8Da98vpkZ40mjiU=;
        b=rXRkaLmAI3B6dILkopc2DtXMpUmrDHAgzQrpUVWApJFih+k0ArRv71/s/amCaofpN/
         nDadmhdZOQmAfbOJeI6NT9BJXS9cYUAHyiP1SsCbRU+TZn1XsQntVFVp0ZykajMT+TBC
         q2oNpkxzJAQxaP4PF0jlm2vvuFFCbEhe5QORX3iEKdEWgvr74JZsvzhGSQgkftO/6Oj3
         mKjJtYtxP0XILk0ac9gKSNFyJo1bkNiqwhGuafymCm7cYU2iDfapOiqsqYWuwo/xji+i
         1Sa6/L7r1Njt9A9VHrQJgyWeIAjYcgl62dC0oumb9uoTnAXE1MTsPdrXjRcW4Ps6tNNb
         5Sug==
X-Gm-Message-State: AOJu0Yz5pyt0u+EK3i5ASY3PWz2raycYGakF3JgquAaKxZHZEMZgmyUP
	KHELfuA7v/ChTgQpHeyQ3EYpAJetNhy6pkEHsXKAzqTe936mbJEnm7clWqABcMZnedB2Dci8IBt
	3
X-Gm-Gg: ASbGncvln3F6jdYh+560Z9AANpv6aUV/3Mt9zwjJozrcTtVqeBh5BjgPgd6dYvFYH5S
	RjPKmYB4tbiM7w1gKUAWTwsLDsYrMiYYNrQz7ioPlAFmU2n30GQag83wgiTrXOyzfp9WSTd/cIS
	3cTcvvMrl5BbY8mGffyygqpEGQtOCdVxAdeY6hRMK5cETTohmnqMqlw7CMemmRZrU6oEAXOMrk9
	EGyA+48t7dZ8SFV6HqXTFs4Hj4qXvYdEoijFPHphlgR895z0b51AQ0PpNLUMPHpVj5xBwMkIZJj
	FCxmxUTETFJym+mWii6vzHJhyeOYMWtP/DkaNvHLg03h
X-Google-Smtp-Source: AGHT+IGf98la8qINplKfwRcYddAYitFFluF42x6/g0e129BOf/PCwBL/xQd/8C50Y1j91frOBhRANg==
X-Received: by 2002:a05:6000:4025:b0:38a:5a37:4a46 with SMTP id ffacd0b85a97d-38c5194bccfmr16131555f8f.17.1738600869075;
        Mon, 03 Feb 2025 08:41:09 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1d0bbfsm13479806f8f.98.2025.02.03.08.41.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:08 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/47] diffoscope: upgrade 284 -> 287
Date: Mon,  3 Feb 2025 16:40:21 +0000
Message-ID: <20250203164104.3403226-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164104.3403226-1-richard.purdie@linuxfoundation.org>
References: <20250203164104.3403226-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210670

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_284.bb => diffoscope_287.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_284.bb => diffoscope_287.bb} (95%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_284.bb b/meta/recipes-support/diffoscope/diffoscope_287.bb
similarity index 95%
rename from meta/recipes-support/diffoscope/diffoscope_284.bb
rename to meta/recipes-support/diffoscope/diffoscope_287.bb
index 77717d42385..8f8f114054f 100644
--- a/meta/recipes-support/diffoscope/diffoscope_284.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_287.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c672e97ce3e69c229858419e8d368563bb583101a9cfc5eb70e28d441502b1b7"
+SRC_URI[sha256sum] = "51702676957edb4c16ad93bcfc25bfdbcdb0c39fa7d1d16f657db71cfaa58ceb"
 
 RDEPENDS:${PN} += "\
         binutils \

