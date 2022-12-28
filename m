Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B12C46467
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 15:23:45 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.183664.1672241024884122970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 07:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R0SMYReg;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id y16so15225046wrm.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4gQi8OuYoeZcVag7RZJ3HkFSj96ezDIqCzNwhzZp4I=;
        b=R0SMYRegxJ9qCFhlWUgJr7+nSURUNUSPvAEuirTKvU4U7b2IqC5/Q7QgFliOcfbmVL
         078B5EuI5gPrz9ZmnctYDO6UXAJiC9NITTYHzT7IGM1jgVYBnbQpt256CNfl7tT0k1J8
         bGkcnHBdfYmBq5Q9agqlK10RPgTva042+zxCKfrxEz8jokfa3388TvgZ1xzL6njB52Hz
         b3aPMi1/UmGzETnKikQYbrThsdR9g96VxiE9DlwJ88/+N38G6EfwnaKvoIzL55CwfFA3
         D0F8qw591EBkO7QFc5/5tecZh1nb/2nYX9/LE717/3mHRH7jI2nRjd+EY5w4UIG5qI5E
         yOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4gQi8OuYoeZcVag7RZJ3HkFSj96ezDIqCzNwhzZp4I=;
        b=VNMttTHd90DxLtlX9SH9ytaxdvHSZHgT/Tgql5sBG4yYRT/JG+pAa/hzZ2ZSfLNCbU
         3NuKNi0JzsWbPoQCttzo2/o6RdXJWffsFui2j3jy58aZiYnqYdbLw6DJ2rbS9X8D9eXN
         SqqueJofNPLDFfVu589HxK6Glx8EyzMx5Qz4SJ5uooEpUyUdyzkMoXNkJUg/UHOtNOxx
         yR3BiIY4EpymaS00XW1ypZVhweJ/IOh/afMVxnlE2D//PgBNw1eHaVFAY6hXS4bTmVug
         SMsXBi0SJp1mt7afgBHdCjuN45FHdlwhb1NVnBtOJptmzxMMC2D8NKKcuK/pfOv+FRbk
         qlSQ==
X-Gm-Message-State: AFqh2kpPL0Z1NY3SZSH0e/hXLJDlAegDIwqyl2Q4nZ+eCW6ixNxuTyft
	mIaJfZ0vSW3CciO7rlx3LLqoaaKdEqQ=
X-Google-Smtp-Source: AMrXdXt2rIw7Hi7KWXtUfJnM4tvDkokEiOAsYzxuXOdMeT0tF1Zk8w8HFswko8axBOljqJo8iSVlRQ==
X-Received: by 2002:a5d:5587:0:b0:288:c07a:bac5 with SMTP id i7-20020a5d5587000000b00288c07abac5mr1324295wrv.49.1672241023221;
        Wed, 28 Dec 2022 07:23:43 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id r17-20020adfdc91000000b0027973315213sm10884893wrj.89.2022.12.28.07.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 07:23:42 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v5 02/12] rust-llvm: Update LLVM_VERSION to match embedded version
Date: Wed, 28 Dec 2022 15:23:24 +0000
Message-Id: <20221228152334.25449-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228152334.25449-1-alex.kiernan@gmail.com>
References: <20221228152334.25449-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 15:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175072

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-devtools/rust/rust-llvm_1.66.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
index e1baeb78574f..4cf244bb67f5 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.rust-lang.org"
 
 # check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
 #
-LLVM_RELEASE = "14.0.5"
+LLVM_RELEASE = "15.0.2"
 
 require rust-source.inc
 
-- 
2.39.0


