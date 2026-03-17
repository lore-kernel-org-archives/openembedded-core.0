Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8576F506FF
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 05:43:27 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69919.1773726204659652519
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 22:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dCso1lrr;
 spf=pass (domain: mvista.com, ip: 74.125.82.175, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ba895adfeaso5175462eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 22:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773726204; x=1774331004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhHR53Ouh/AvH5HjM6/bomtaA2I31IUxaCcPAK3V4ww=;
        b=dCso1lrrpU15eVBUWaeKIAZTQw6bujd+ioLwwMQZp5l9z9bpUsBCRp/hU7ptfsPBl0
         Nn1SX3oTaIfoPVY2M9l0cCMA4Uy4R4sLXTn7bb478WuMcFvl0mDIZ3tp6O07eB1a6X5q
         hoZtPgto+sKKvrUinSKznvUMAqKHKZOLnQ43I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773726204; x=1774331004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BhHR53Ouh/AvH5HjM6/bomtaA2I31IUxaCcPAK3V4ww=;
        b=NXU9PprlUVFtD8CCZAlSBDHKcc/1f9PMcZO2pGWlkbt7e0bn85kfeUVgc8AvN4+II5
         ZmpqzsjMR8loz1eerSNBhEw3itVFPuFQ32EZoobNmKSldihb0jXeY0K3lfseRGCyGE2k
         29v7U5NTDw3yV99KK1PBtH5FAbQRu+ERirvHghX3+eJ7v3nXB6TTRA9nq51kUEu296dQ
         yOW+pBTgclgDdMSAJDE4hwXehHEKkj2Sa+jNNsZJvHbbotyNNj8SXC7Eyox8M1Ny/Iij
         QmBFuVZvpImP+PM5yYHtm3CtO1dk6KnnhpwgcCD6SeUJXxeWS+UihP6fgLmsH3r/lKfM
         H+QA==
X-Gm-Message-State: AOJu0YxE4P9S4XC9cQ1q+6w10/1QzwWOPdCiq4QXfFoHkVjAYzcVf2JH
	TTa62zdjVGGeaia7WRFsGHqbICCcXrp6gqDn5KkNKhqdi0Kox/OJsCkAD88asOJDRvPWbSZz4sq
	uCB24
X-Gm-Gg: ATEYQzzkMmQ4VLBGxd7skUPEE8L7dpMwVT1G2ZvtdffaYTa7dVTxBOLZq2hARjcPR8Z
	eA+KUH+bwPSlHJ/K/+6/E1PJoZ+TcvP6tk492W6oJF3EkjiACKHUcGwNtVKmpE/1m/ql6q+sOIE
	OB9/5a7k/mUPBTbITRDX7HN91/UR0cq1Oci6d9AJQfCJkO1DA+LTMwk5TW8c6Ib6eCV4W+ZfE6m
	+ho1oPtlWDjZ2qKJAWEc9r/GdqOmEkZyF4mgtc+bib5KcIbxCvZjms/qyyU7y/wvZ6nCbTb4KMS
	UezJdWIBBljz7gIdCBzDFIIy6SNKgpeLoEW9sXL65n26SqSXfIAJCm3qkt6Y8N3gpdE2Mik+Owz
	EkvXO/Ky3z36Kw71gqpadripNswTP/7gJKTTgdabqvehigECk2g4xgM08TcZNOQgOV3z56eUWyk
	MSmi4PL3wDk8htElUdp0KbybyEjNvhZJ+N9Udz
X-Received: by 2002:a05:7300:80c2:b0:2be:723:a9b0 with SMTP id 5a478bee46e88-2bea543ac63mr5778514eec.5.1773726203841;
        Mon, 16 Mar 2026 22:43:23 -0700 (PDT)
Received: from MVIN00013.mvista.com ([152.59.0.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0b1fc876csm12772419eec.29.2026.03.16.22.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 22:43:23 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH 2/2] vim: Upgrade 9.1.2128 -> 9.1.2144
Date: Tue, 17 Mar 2026 11:03:41 +0530
Message-ID: <20260317053341.42864-2-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317053341.42864-1-hprajapati@mvista.com>
References: <20260317053341.42864-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 05:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233298

Upgrade from 9.1.2128 to 9.1.2144 to include the fix for
CVE-2026-25749 [1] [2].

[1] https://github.com/vim/vim/security/advisories/GHSA-5w93-4g67-mm43
[2] https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 0ce6aa71a4..7a7bedf863 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2128"
-SRCREV = "392b428d1239e963020b73682cd03f17ffb538b3"
+PV .= ".2144"
+SRCREV = "55c12373f073bacfc97d757e8f4da3daf472e4ac"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.50.1


