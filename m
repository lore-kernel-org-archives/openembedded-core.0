Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C0ACF64A3
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:58:06 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.45592.1727661477832485281
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DXt60+FW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20b7463dd89so8256585ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661477; x=1728266277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+R5+pkKjPjo1slzx7nYAFXfP4hOzH4L5sLxg73A/Pg=;
        b=DXt60+FWa8sTbUZdEbxWkgQHIuG5D826mZ8bXFvtzC1DgnazQ8Orm1Fv5UXSz8ojDc
         3IpJb2NbDCdYPg0P1cVuK7X61oqtV0N/Cd5DWTx/oQsFtKQidMCRDbjUdn9UGZyZjHom
         1gTw1w/faoxTNYXafaXkoqFpbIYG+E/WW4l5pDu4be67gFNwbAlqW/1rDpBWSYMt/qU9
         TzUxc2x+i4ZP/5DOSgGX3Y/OT4CF4vb7ZVdOs8dZS+sSFwiIPUFAuNLJKgytHDzZlatX
         MHkxFZ6mPK/oKTuHVNIAhTafoS/O6yThpRfZbUPW9FJ9or3aYXl9zeQDMv0on2XsmSXc
         GAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661477; x=1728266277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+R5+pkKjPjo1slzx7nYAFXfP4hOzH4L5sLxg73A/Pg=;
        b=M8JuX8GoGu41khXzff6JvXfKJF/0dcJwqNFRuI1wQMcWYfyiK03GQU0b/v56SgnYfQ
         Lkr3itc6pZq6txvYT6KO6CdiV3G4Eo1IItl+ruBU6GtlKONwdCRkzAX1NN5v0lf+Xgxb
         74qB6k1xiOBzlnXjy+/43uUwRg4Y2mDKhuurhP6lSSeOOqYDxK2IhODavhCP4nJou+gq
         zbxBqohMtQvJ5UbwzrhshCKROZhxMbExxWm6SrMpaQ7CRAYdNkRuH41dD5GOuzKa/ymM
         cBRZgHqf41c4lrDvddM8RErC70zrr13NrY5frPZJTbI2V7VqNpDmQV/zIGpV8NhKG3Mk
         l3tQ==
X-Gm-Message-State: AOJu0YzT30XJtvlVhrqGZ42FKHAkF6EgHBHopdgs0zL1tCOpBO7J0Mfz
	WeMtJKgFMLcVvHoxSOaH9Q8HUuZ+JfcXvuoPMi6oiCnzOkK1nAdkRqZ7eAEJ50GETg8FezgaXLs
	wYB0=
X-Google-Smtp-Source: AGHT+IGWyHw2dcTCPV3D5FxSwtTbaFawAwBAcP9fEiRizN8C4dmfEhjgjLZvUfLsA3RAlDWQjrFXjw==
X-Received: by 2002:a17:902:fb47:b0:202:4666:f018 with SMTP id d9443c01a7336-20b3767449dmr137507265ad.15.1727661477160;
        Sun, 29 Sep 2024 18:57:57 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/27] testexport: fallback for empty IMAGE_LINK_NAME
Date: Sun, 29 Sep 2024 18:57:11 -0700
Message-Id: <bd723b611e937b8532ebcd485db61a3eae46091d.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205078

From: Konrad Weihmann <kweihmann@outlook.com>

if IMAGE_LINK_NAME is set empty to disable the symlinking
for image artifacts in deploy, testexport fails, as the path assembly
is incorrect.
In that case fallback to IMAGE_NAME

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c1d098e6dd08fa3a5aafca656457ac6badcef89)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/testexport.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
index 572f5d9e76..57f7f15885 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -50,7 +50,7 @@ def testexport_main(d):
     from oeqa.runtime.context import OERuntimeTestContextExecutor
 
     image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
-                             d.getVar('IMAGE_LINK_NAME')))
+                             d.getVar('IMAGE_LINK_NAME') or d.getVar('IMAGE_NAME')))
 
     tdname = "%s.testdata.json" % image_name
     td = json.load(open(tdname, "r"))
-- 
2.34.1


