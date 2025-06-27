Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C39C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 21:24:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.1814.1751059471371404078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 14:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a/50csvd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d6ade159so1947725e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 14:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751059469; x=1751664269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSjQULQRe7I455VPFCtgWb1yNgEQrZc1PMmOrcuUoU8=;
        b=a/50csvdqN7hru7W9Ndt+rI0BbKrH449KgarotIPO/dRGb2r7K0WIZk9U8qm+VFxvb
         bPbXHl+WJVHXUFrJGr2tPoSl6P4Xn8E9l1LWg+wj1TLkNXZ5Xd+3t/7q/jWMt3zYu9PU
         6nxmFpH0Pc3KFgqwITv5icR6Eb4w4nOpS5OAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751059469; x=1751664269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSjQULQRe7I455VPFCtgWb1yNgEQrZc1PMmOrcuUoU8=;
        b=K+3k4TWztCgbVaAENkp4n7p/wOhYfolfU5ZfQaACFkLC5IFg5CeUaTYaBQc8w76LDU
         /eXw5T2NeMcYyIH9Lu/IqxfVNy+oTMiNHSLEe/wQ2N5lJ6+sE6K2TijGEMjUiDCZ45L8
         36hQpgsIQthFwKWrfZ72AXxNmfAJQ3Eu21CgMgResfXZ0aqEWzKdSxxQYzvyAn728J4K
         kDy0HmCXD+ktQ06XneKWK+tcJgH9uXqM7PqvRj+VDV/AahZiDjPxukL7NpWtTpBKMOPG
         LqhZxfrM5Z8YC57wqVm4yuZJt7JXY69fy+89nUW5SE37OzbCySlOp/BlTYB1LNulXljI
         fLXQ==
X-Gm-Message-State: AOJu0Yxu8zd07qPvMC26aApDPbYVEvnA9+enUMRlTNmWHo2fWNM98GF9
	1Mh+/uOtr8r8VNRMxbpAIbL/gRnvNfa2QC0hYstcKaouk8ocC6IsO+e58RUBsjcREu81l0XL0ed
	xCuu2
X-Gm-Gg: ASbGncuI8eZyGIL22/FZ/A0Acym5lSWqyTYcSZx1SZlmpP2SovQSgYkriu89naEye2T
	zyErRbHo5SU2wcU4Pcv3IU8tu+SSckqbDAEb8PmQgTgShaWFELO0iMZmj12HOOmGrx9E6n8IzFq
	gKYwfrmB/P7KD/YPowkAHWHUIBTpXYJpMao7Bu9TzS8c6itlfwqw+MvVM4umGb6w2Xu5D/tVMw8
	GVzkMdCaBG4d8wauB1bIHAz4r7lV9mBt6MxK3/ANm7STU/aG2ETzwt3PUvnmNGSC+zV5w32FEXG
	Zz0tp0qghPCILSc+dPjpizvKwbaGaWX3dZxWpT71gH2/PphHxoV0444EDPmWVNmS3DnHrmQEiVn
	KJ8oBkABU9dFoY4s=
X-Google-Smtp-Source: AGHT+IHZ0DGfZOLiHCjIkPRDzfVRP+ozMilV3Uz2O08AQv4ZpwovWYpmH0YcDn+1NIup2dgQ+Z16Cg==
X-Received: by 2002:a05:600c:4f4f:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-453917ee4e0mr43911085e9.16.1751059469300;
        Fri, 27 Jun 2025 14:24:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b1d:fac1:a77f:a658])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a6716sm61505305e9.11.2025.06.27.14.24.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 14:24:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] base: Use DEFAULT_SHARED_UMASK for do_fetch
Date: Fri, 27 Jun 2025 22:24:23 +0100
Message-ID: <20250627212423.3315152-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250627212423.3315152-1-richard.purdie@linuxfoundation.org>
References: <20250627212423.3315152-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 21:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219434

The intent has always been to share DL_DIR, so set the umask accordingly
to the new DEFAULT_SHARED_UMASK variable and match expectations.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index b86f50e2839..77bdbd03dcb 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -154,6 +154,7 @@ do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
 do_fetch[file-checksums] += " ${@get_lic_checksum_file_list(d)}"
 do_fetch[prefuncs] += "fetcher_hashes_dummyfunc"
 do_fetch[network] = "1"
+do_fetch[umask] = "${DEFAULT_SHARED_UMASK}"
 python base_do_fetch() {
 
     src_uri = (d.getVar('SRC_URI') or "").split()

