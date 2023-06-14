Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C63C00528
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.7360.1686734988034717189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=COkRcDFt;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso11030302a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734986; x=1689326986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpy8xXbLvyKA+ZtS+TI08lc96eosM0Nmpi47OBrUUSo=;
        b=COkRcDFtWObi9Pr9oVUWgdfoGK2coM4Qam4AZ9aFmiWITwfzRz1pkygZ68Wx9Cna5x
         4vpQuharYTIr2QQ+/DmH1dGC2yqR4zLmO5ArS00+Gwa6TXUqQeceUxZ2SFw0ygqb7IjK
         UOp6IdVNKxHxUfWD8Op161M+cpPboZIQYW5TzfeWHRQNOG5IsBHBNbe1obaqq+lPSl9r
         GWgi6o+UmSHTCE3Ydg01oFhxfDuwxnSf623kBo2K43yrnnkyOeRCADugwV+XGwU5a7s/
         m+1rBPcdQ7ddB2dYAMnVh3zp94WpvIHnyB2bcGKBViFK6/rYdbDGHOxTBv2v/TX2yjXz
         iSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734986; x=1689326986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpy8xXbLvyKA+ZtS+TI08lc96eosM0Nmpi47OBrUUSo=;
        b=lRs38b5cAAQ3gU+aedb02tq2z5nhZ7hzIaUXbpt9/8IXT55LSpdBUiVaaEWpaIIc3G
         hxtyK9K+Z9D9BwxsMZlygurswfET8DcKFWjkM2KfUd0a9U7YVNUymLZp/6iInuCjy8x5
         GdRxXaqg1lgrP49zZzpnj1BNO5dlT3MGrK2tDAI8zLEfig3oyhTfhU+nrSg0As/YDPHY
         Yx8r5BRwHu0B6Pp6Ot4JpB5KPj72kyfCJm//0udXZitqHbarvRUC+xdw3YTso0cZnT3E
         mTcKu0Yw69Kgf5oBYB43kwLV3TnttMyotwSSKsnUSvtb9yj2JqgAT/eGmTizSQLHZrkg
         DtLw==
X-Gm-Message-State: AC+VfDykaMOd5TJww7iEleJxK8ZxF8myaeKBKr8jftKdmSoFvxdsc9aC
	7IFA4IRZdpe1JGy97RP+w7iYcp2IlX0=
X-Google-Smtp-Source: ACHHUZ5i8CgLsosWShrbt0JCSZegUyiZ/R5hkNC0xDYTEFlC+7CjRoIBX4jpj2/WfisDLtZ7TNwCdA==
X-Received: by 2002:a17:907:60cd:b0:982:26c4:e4b0 with SMTP id hv13-20020a17090760cd00b0098226c4e4b0mr6014443ejc.6.1686734986218;
        Wed, 14 Jun 2023 02:29:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/55] nghttp2: upgrade 1.52.0 -> 1.53.0
Date: Wed, 14 Jun 2023 11:28:57 +0200
Message-Id: <20230614092918.4065570-34-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182779

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../nghttp2/{nghttp2_1.52.0.bb => nghttp2_1.53.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.52.0.bb => nghttp2_1.53.0.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.53.0.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.52.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.53.0.bb
index f57a15954d8..88d5f31083a 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.53.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "3ea9f0439e60469ad4d39cb349938684ffb929dd7e8e06a7bffe9f9d21f8ba7d"
+SRC_URI[sha256sum] = "b867184254e5a29b0ba68413aa14f8b0ce1142a371761374598dec092dabb809"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.30.2


