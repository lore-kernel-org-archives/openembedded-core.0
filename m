Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81964D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:44 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4245.1768908275595273540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xSD0FE8t;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso2837812f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908274; x=1769513074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjYg8/cKk0NNwhQAPrABSAmyDrCqhO1DyhX1lDbRscE=;
        b=xSD0FE8t7GvpHp+rBS1eGykUf0f2cpLIU3+xbtNiY9IOimtOlCzWkG2vVHars/XcbU
         2fPLSTMalv78LlAiTGWjtpHnD7y85NviLzojQ01HxuPR0sMvxELjaEppflGzRmEGM+u1
         P5sznvHaDUnZHxRuXCUVnxxdHc/dAFo5Co4Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908274; x=1769513074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IjYg8/cKk0NNwhQAPrABSAmyDrCqhO1DyhX1lDbRscE=;
        b=b/Rmb9XLRF0IFtxiTeD4XVYTjCvC/mr3pqzW7Jmq7xAcgsG14y5KTizrMeOL5MDJVz
         ecvGXWXhf6O8U+0YXzN2zHnn++8QXn3UQhwHsoSlbAAt6v+20OcHO9rpK3nzy8Pu5eF3
         vZYe47F1JTNsfRPIQJvY/jMlXhjGJNQSq5ZW6CILRNnQmKxRxCoHW1SXGNSeBk9oH/xN
         G4lkxyu5kezPez1NWStFVsDZ4KSY6uJRUyMWvO0KBDP017JV/1D6iW7N/+HaCgkMOtHm
         jBNBkONwv+TUCBmM6n5vE3tK9aZjSwcR1XMflUPbWqsAho15+dnnUBRFA/At1L6jM0Rf
         PBBQ==
X-Gm-Message-State: AOJu0YwtzfyLoclLqdwXibhOMr9b85sqsWb9Jutgc/tRq57Z/SvXrRid
	P5zSyx0zg3aaISpVh9S6astSloSwCY5W7WFkEyUQzQLzooElJlQdfJIYCl/n5Bejknn+zeVWvok
	DYBCF
X-Gm-Gg: AZuq6aJhO6nWP1VWeH1MGvZ3TFs1cOX+pATTljedUtKfy2E1NMopoOGCrndLcyUDpru
	ukXIqyWDh7y/coChmRo5vzmck4oe9nEiMbpJFXvoZjgCHPULGJQjHI/ix0SA9g3R7q0xGaUe8uD
	b9jzzaN3ihMZTHmgq9AtwgX1uli9DvgsLrsxT6HXEWh20dJ+NltBSSWYNBP8YcIV7hs9RNZ07hK
	g7BpMURX9JXbhWP+zavycD3q8f7tp3iWRVcKU8Xk5y+fR5WnzRcMxQJa8A6FwCM9v3WCEHbK73B
	Ygnktf+SnjXOcecnrHG/611H/uq0CzKhnQE98H8F+jOraXdX9UtUuQXT3Fh7aJOj3ADS5ym0atw
	APtqO5Gp+96j2SqhEmbBwWOr1ql7bs7HuoiYOV7gbPFfP6PEsWYiQWxS+RO0EVZVfO6cpRpQlYl
	TsnyYKOm1+k3uTGxzD7qRvN/zLrcx3tbYhXXbDEYuurytWWfPmZG2fbYAhCbeCoAAfwNdbCor3V
	ZlsqViiNBsIiN2FCEM6Nw==
X-Received: by 2002:a5d:5f43:0:b0:430:f3fb:35ea with SMTP id ffacd0b85a97d-4358ff44565mr2126793f8f.18.1768908273704;
        Tue, 20 Jan 2026 03:24:33 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:33 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 15/15] libarchive: upgrade 3.8.4 -> 3.8.5
Date: Tue, 20 Jan 2026 12:24:00 +0100
Message-ID: <e7891f39ae90d1c23bfcb59af0064591513a671d.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229675

From: Peter Marko <peter.marko@siemens.com>

Fixes regression of fix for CVE-2025-60753

Release notes [1]:
Libarchive 3.8.5 is a bugfix release.
Notable bugxies:
* bsdtar: fix regression from 3.8.4 zero-length pattern issue bugfix (#2809)
* various small bugfixes in code and documentation

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libarchive/{libarchive_3.8.4.bb => libarchive_3.8.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.4.bb => libarchive_3.8.5.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.4.bb b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.4.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.5.bb
index e89638f5c6..fcfaf5d231 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "b2c75b132a0ec43274d2867221befcb425034cd038e465afbfad09911abb1abb"
+SRC_URI[sha256sum] = "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b7eaa2102f03b7ffd"
 
 inherit autotools update-alternatives pkgconfig
 

