Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42ADC35FF8
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:38:55 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.2866.1742323129354497911
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GWu/lTEB;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff80290debso5561552a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323128; x=1742927928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Jo6wVv5sH6f+xu5+yscyvr9mQs6TlekCIsEgIMf5Lc=;
        b=GWu/lTEBGCMP7mDgO/liXJx9MwH0+H9QcUgd43kfAlooob6TIgXdVu9chVRLDWJm32
         nChFiBQkBDdVOIjV9O1Dh3OJ/79+15c7XaBGrQ64aRiM/ZAP+XQCKG29qaGxb/s4maIT
         nlzzEOcbv9Gmj/IWksAK727UCC8o2c0pkx+K2agsct7HiVxgEqpvmvgDt8P4ogWiGLg+
         4v9lMZl8Kw3eL1T5jj21RRPA8JNvEROLIehwsqcxkbCvzfnsSR8n+bDbschOnIS17y2j
         zDTDTNueKHO0UD+SW8AJOjQ4ySMcYdOPo4enMCy5QQvuCioLE2w9b5qYJaziXoHvclv0
         H7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323128; x=1742927928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jo6wVv5sH6f+xu5+yscyvr9mQs6TlekCIsEgIMf5Lc=;
        b=LRqsR4wszbCOb4chU5s64sn/T4M76o6if9H86SZcakIEWdttR/Ov8hgQvgxPRteRMt
         ylJw70n30T2rTNF98C1a5aTvKWHR0qt4vbDIsgwLcXdIe75UQ6pb9QaEqu1PIQy+wZ7j
         Z6eTJ3SWPKuQjgQE6+Vgoy9xAYTAtEGg8a/C7FfVxmSfmlgmhhzlAbaMl9b5SjM6xuC4
         4mHIyzp0y3NzILczq7mg5P7R30uXzlNgOS9lN8YT0eVUUtl3kn5piA/CtnjczJHMtjme
         y1PxW5Om/11HE3lbVQME9/PFG7ORDYQ/DNgl2W6Jpw0xV6hkTWR2g/ufURfg3XbLQLPA
         l3kQ==
X-Gm-Message-State: AOJu0YyxQcQU1McPqp9AVrI2OOB0tvYMqZ9ZBwZz6gqfw7KqA2BvvNst
	AvF796SUZ0XyeS3tcwqNImdsWTg7fKeVjIhXVb6OkFJ6sMMVZnaqNfSBEauz
X-Gm-Gg: ASbGnctxpIRI5QQwoEkEQUD2WsKlxHFU/+BJieGx1EmkKSV+zW88Kf75t16oJrgYx0L
	4/51oQLzoM4wtNlOZyuCJV4zonfFEyKPRG40a/ia7bFXYvsuoeqRP/qlbsCQaeGR7MWUv6egdTR
	3IVZIpOyPyzubBQ2Vz3w0GaHHmP76EO8n+NNa/1wogYz5N25qZTP5EuWKKW2Pk8vt6D+qkCI4Hh
	/m/cy2kZszm4oniSJ7NV82WNrCcyklIJIr4PctmmCvAKWQ2hLpcJknv8S2MR3KasSqVpVX75gEI
	dlMkdGH0NM3S+gZEynneolZx23biOSZd5WfM
X-Google-Smtp-Source: AGHT+IG6CfWmas35sEcEvDI7kWk7zRrUOzSh2y0lV7AXu8lDeaaxbUKcJSA+M80M6VT/SjfFk0xnUg==
X-Received: by 2002:a17:90b:180e:b0:2ff:6a5f:9b39 with SMTP id 98e67ed59e1d1-301ba0f3ca6mr338419a91.18.1742323128567;
        Tue, 18 Mar 2025 11:38:48 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 05/25] gdbm: Use C11 standard
Date: Tue, 18 Mar 2025 11:38:20 -0700
Message-ID: <20250318183842.2256284-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213231

GCC15 is switching defaults to C23 and gdbm is not yet ready to
compile using C23 std.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gdbm/gdbm_1.24.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gdbm/gdbm_1.24.bb b/meta/recipes-support/gdbm/gdbm_1.24.bb
index 88f9fa47cf5..8e3cec42957 100644
--- a/meta/recipes-support/gdbm/gdbm_1.24.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.24.bb
@@ -23,6 +23,9 @@ EXTRA_OECONF = "--enable-libgdbm-compat --without-readline"
 # Stop presence of dbm/nbdm on the host contaminating builds
 CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
 
+# Not yet ready for C23
+CFLAGS += "-std=gnu11"
+
 BBCLASSEXTEND = "native nativesdk"
 
 do_install:append () {

