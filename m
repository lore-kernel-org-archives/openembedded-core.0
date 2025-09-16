Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2667CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 14:18:05 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.21273.1758032279719117470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 07:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f68rtJv/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-323266cdf64so4934861a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758032279; x=1758637079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxfU6dKVn2iu+OsykENuZISm9uGEf8ShHij524DfZdM=;
        b=f68rtJv/jScPQ+qFSJEOks24X31td31inVWFII0zLdpnTukO5OZYE1AthSn5+621uQ
         08K53jrg07wjU03ulKz2WcAcBg3OZQ+A/dPQnhYiovZ2A9jlAlLfqX8o4IGIHQxp4LiW
         814tz1x3Mvg/mVjYvFh2JKPl8ZKmS4fX26LswbS0cVlqmJq8Xuaqyf2ADjyB+WzQMmAv
         FrMIT9CwezPQVm0MX5MXl7e3bRtBFZs8serrnz7Tu3mrN5UQhjWcCzmP1/5srCm/gPdp
         gy7mSHE5W9ouz+kWed2ZknFhqiRON1f5F8Z/He9dRj/A71Ft0QOf2D6ssy4TiTW/c5L2
         5WpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758032279; x=1758637079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxfU6dKVn2iu+OsykENuZISm9uGEf8ShHij524DfZdM=;
        b=ExmAlv1FEWWJVFu7eRod1Ml6HkBRRu9jS6MWjvPduAhY05308j3+LmZptTF8xSeY9y
         mYIsr9JN+fBam9cUgecqDtmEoLpfbLlwhhB2AbcpK3fPC5gQZIM3XjCVMnd/p23zbze+
         Amr3F6+a2AAaITC7jfcQDQvY2PU3NTomaSG1n/5jxO+hLS0vKvsMSRkU66iHek7WLDQR
         oYHxt0fiyvJ8rhP6x+fAfptFcQJAUw/pQoQ3sPqFhDpZIxB64KuJVBU9B13YVEZc1+qk
         EYK90POjjw9+yuVKCd9zSadpe7BksfROPXs9aFAhzE6/PsJ6S+5RNR7Ao4jbeb2lgt+9
         w+cg==
X-Gm-Message-State: AOJu0Yw5SP4VjJ+Pn0Z5G+uGFdywa1X9TuJkMnQT5zFSWfeJ/UQsZ+Hb
	2KNYsmMNViRC/eTu9HwC63jdIudot64Nz5NmwMrZzyxTJn/x8/1s1cJzwuUJgHt1MOCzo2oXONM
	auYLh
X-Gm-Gg: ASbGncsvCHpOMON2uGaP5S6yzDQ3KsXEflYaQ9VEkWTdrYOJiOM9WuOstsW7O45y9Di
	7ifojmRp3a1ZWBIXwOdqk9qkRkm71upAb3xm6DC3vK9cJpyxlL+LI2UN20moof4bDbhoLgVnhGf
	FgOWRbGACKbpKDjWfXlVFZRSVtmDLbqS3HQ3cCcsmrDBJRlr8qLDqc/KMeeQbl5vxA98kOzwFjw
	LOPyHMc7hhOtXlM2i25s9b0KLfRuVkgsKnAWu6cqQmQsxd1kgblZSEhnS13/LyoOM71X1EMWphw
	WAuz/UW/JAvJrle/h2gf69cFOfaUfN6K0zvIwO2Vn0/9oTzIkU4BPQgDMWjUILazWKJvFooK+OJ
	AsZgFxOfpzdvyDA==
X-Google-Smtp-Source: AGHT+IHfM0FOcXVoIUbprgjlMEsjqD6iSEK04lDIP9WwHh6UGHgCew4lPmS/QOUa2HfWWnaVVcZ3/Q==
X-Received: by 2002:a17:90b:5910:b0:321:9366:5865 with SMTP id 98e67ed59e1d1-32de5165da3mr19016679a91.33.1758032278917;
        Tue, 16 Sep 2025 07:17:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a7d1:d8f6:b364:5fab])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a3aa47c0sm14534083a12.53.2025.09.16.07.17.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:17:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/3] insane: Ensure that `src-uri-bad` fails correctly
Date: Tue, 16 Sep 2025 07:17:48 -0700
Message-ID: <4b593ea8df9b1d3dda0adf38786845168360311f.1758032126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758032126.git.steve@sakoman.com>
References: <cover.1758032126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 14:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223558

From: Philip Lorenz <philip.lorenz@bmw.de>

`src-uri-bad` is missing the required call to `oe.qa.exit_if_errors` so
the corresponding task is not marked as failed when the QA check is
classified as an error.

This issue was fixed by the introduction of the do_recipe_qa task in
OE-core (e0c71367ab59021fc430ef215bbfc3b525036ba4) which is not part
of kirkstone yet.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 99340c1752..6b3cc5228a 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1338,6 +1338,7 @@ python do_qa_unpack() {
         bb.warn('%s: the directory %s (%s) pointed to by the S variable doesn\'t exist - please set S within the recipe to point to where the source has been unpacked to' % (d.getVar('PN'), d.getVar('S', False), s_dir))
 
     unpack_check_src_uri(d.getVar('PN'), d)
+    oe.qa.exit_if_errors(d)
 }
 
 # The Staging Func, to check all staging
-- 
2.43.0


