Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD8FC44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:40:45 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6248.1783510836918365086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eMthk+fz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47def004ba8so112179f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 04:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783510835; x=1784115635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hEZwBbkp7j9ryh0CnBfEd4TebNTtKQPM+Z493kjQ2E=;
        b=eMthk+fzif0dyJBT+A/HU/+uPqQSk1MUZK3n5ByWNAT8yjlr5fVzrb+mo22ed1A9JC
         siwpPAp/urKchqK4bqI9TXQZp137BKNqy/g+1r6sMktooG+ftdAbgNl5x4icIfWu4IFo
         t9pph7HHOliwOSaTSljfbnfzj7ATcFyLD9Wo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510835; x=1784115635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4hEZwBbkp7j9ryh0CnBfEd4TebNTtKQPM+Z493kjQ2E=;
        b=jYFR9Isy3rsImpF7AF3jNAVKL/n70j8ImiXMHZ6VuIKW3NqMNunittfwHrNt6oNuFc
         /lxJLOy3YzCBzDp72a/72z7BoHxx39g2zflc2pPaUf78+QYZkH/q9QK+W81fGxB+fLFw
         fTORgfzghHALCUXruJltTpDYa4nhWxlfeLNPBBpiKCBfeRenodxoV1KNCtA3welDhKFS
         DqG8Pm/w/AvzcqWPN30E6dQntGn1CBXAcXhghTlQuRhYehH3k7EdUQuV30/Sr39T1NcU
         LEjtR6psIFacMPawQHebtRERZ/nWSO39vJT1suTxAmATS7DDYWJgeKdQekWVy9rt9lY6
         2n1g==
X-Gm-Message-State: AOJu0Yz96mMZHK9ttYSgn5aujMLO/zKKlQWcEohm+msgN28Iwb5NbvGI
	iDgEZ7+07GG9YHW0dRoNojUbc8dh0GJOBP4K0n2wVHpHetDIolZLM8EAiCx0e/jf5h7f4URB91c
	wrgjX4wo=
X-Gm-Gg: AfdE7cmtX1FBG3h+eDW6v4GaXZgG1uOK7UxHxPf9rB9TQYtP/rpe2eXlrNrBeT6SXmu
	OM81AN5CA8HtEuKxhellWO7+2NL/qG06erDCbkGRycSjcz95aaOtZqVWBgToJN/4PRkzmaH/bPV
	lZ3jB/3n3TREHZHDx0WJw78Ub6OYYSwNa5OcmWrl57LJH0GrKCmnOrKb4lLVesCOnyGs5ljRgrh
	xj295cyzDXS5ffQesAiH9F9Sed2s/NqWGK4pwt9Z2uDUrI8jjZNCDYl7QtAb5026JeQTaYPxFjL
	HjBXEX53lCyphg9IFz8P0udx2BgXNgLHIzfx5St3hLho4xjyO3mJ0SNTBhJ/MYlJJPzlhuO6aRG
	/aheSAlfKatDU+CTw+urMfUjL254F/5JmXturuECWvZqeE28t+5UnEo5Lqcvwh7nIxtqcYOWCgk
	tVt+Tzi3eO/cwn4jFG7+oXz4H2o+dYiVznZ8h9sVWylg==
X-Received: by 2002:a05:600c:19d0:b0:493:cce0:3724 with SMTP id 5b1f17b1804b1-493e68aed4dmr19182615e9.4.1783510834983;
        Wed, 08 Jul 2026 04:40:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b60a:b356:19ef:1131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f51193sm131183165e9.12.2026.07.08.04.40.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:40:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/11] repo: upgrade 2.64 -> 2.65
Date: Wed,  8 Jul 2026 12:40:21 +0100
Message-ID: <20260708114021.3484868-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
References: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240474

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/repo/{repo_2.64.bb => repo_2.65.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.64.bb => repo_2.65.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.64.bb b/meta/recipes-devtools/repo/repo_2.65.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.64.bb
rename to meta/recipes-devtools/repo/repo_2.65.bb
index 8cbf223571a..2a235b7ec55 100644
--- a/meta/recipes-devtools/repo/repo_2.64.bb
+++ b/meta/recipes-devtools/repo/repo_2.65.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "2d54384a5e59fddd0626ec091cc0ad11511d834e"
+SRCREV = "35bbf701d04de5c6a71937279bc3d16f6ce36808"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 

