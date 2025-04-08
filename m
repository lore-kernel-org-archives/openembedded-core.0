Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1A4C369A5
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 20:51:36 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.6783.1744145489338380410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 13:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z/Xh0Jdc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227aaa82fafso52568535ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744145488; x=1744750288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tn96zjXxT3J8VL78iwtCoYl0nrQyScFHpB950HXyfSc=;
        b=z/Xh0JdcTeEvgolvkaiX4lIPf8E+JhX84iFpKCKTqPbV9HEdflVe0qkrnfo/+LUG3K
         hccGQs30WnSShrpzsv+g9X5nEwwfbJD79IeEy4PJqgKCWye+p0ZztiP1pHduc5jI+Bo3
         mNdmk429fXO/OIWNeQ92kCBqBrWAQWOEy64G83JMZqDVOVe7apy5AjlubBHFTHWvPlSC
         DwATFtxAzv/cufZF6GgOm+qUxZOZx0p4SDVckBbo1dWxVa1z33d5R7mPGZvm5z8JpRAZ
         B+E87eQmIuP3yyxb7fTCWWAuWNpRgBBVsDYUkfS84aPSuG15BV9Z5agJ1dRZKgnqdX5Y
         bpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145488; x=1744750288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn96zjXxT3J8VL78iwtCoYl0nrQyScFHpB950HXyfSc=;
        b=ixabxJ67+ewl/+ulUVRLFPmHPCndsmtVwOiFwOn0r8PBUGUBELavME9NGnwOg1PP6F
         kGf9tAONaCAQHr2zx6YUcGM9eBm8id8bmnR+KHm/DifX3fPcKDSHKmBpCDkkKLBtrZk5
         wSzd7e7Dejx72srCU4/GEMDW7gcWAHMxqZTN1mGq5myLXBPcr+wiJOMs1suxDLjTnTnb
         SbAs+JgZ18vYv0sh/ORvsOhzhqIlRgre3GdonxRbYdwYWWth2I96KjqshT5SpzD8bNLu
         5EyQnVJby0MlM4S7hbiyLIbubBL2Op0UMYr5wa55kICoUxJzF0+uSTcJW5qWDjs/ofU2
         hyvw==
X-Gm-Message-State: AOJu0YyYSNqgtvUzPkDQYS9r3kV+941Rk8pUB9Bw5krEwiwWBlw8OWkK
	TE7sC+EhZ+Y+98QYS9TwxJJkqHcBzUdiWiHKqJDKV+T4G8NDn0jtrhwAwCRShbi718sHl/xDC58
	m
X-Gm-Gg: ASbGncup+gU0dTWmNFwjTVorhCT872J8ZpMHBJS4IYE+6mTS67z9HqxxSKf9ot2OAR/
	ZNDL7MwnVmSHkqE6kc0Gdx1ien+69fM7oGqSqyJOH7ZxZyTM+z5fc01basWKE/WTRjMVOn3P+LM
	waTRTDu+818NGlBAWr7Qh2Be02C+kkT53ITOGysFaQcYDLYKQ1G+rSzIZP2/c5SCmoVbUATiAVC
	MwtvBE/OmdYsA97SJhYVIIbdDEmx3+kVIep7GPmTBuWlHiQDSyclNI/4NdJVbrmXedI2r9/3egH
	c2NPpbaVImZ06ewgj1dvfADbk62IL6aNji1/
X-Google-Smtp-Source: AGHT+IErnz6rLmleStWJMfjjLVR1Jm3jY+ciEnLoePwbCOX8jvFxx9lXvX4cOjSLLg6WqrJgqgOYSA==
X-Received: by 2002:a17:902:dacc:b0:224:2717:7992 with SMTP id d9443c01a7336-22ac3fee4e7mr1525185ad.33.1744145488499;
        Tue, 08 Apr 2025 13:51:28 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:70d0:2b27:66e1:8cba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e242sm105497755ad.164.2025.04.08.13.51.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:51:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/10] qemu: ignore CVE-2023-1386
Date: Tue,  8 Apr 2025 13:51:05 -0700
Message-ID: <b6b026e8e1965f8902780b519aa60bb818f920a5.1744145328.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744145328.git.steve@sakoman.com>
References: <cover.1744145328.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 20:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214564

From: Peter Marko <peter.marko@siemens.com>

Upstream Repository: https://gitlab.com/qemu-project/qemu.git

Bug Details:  https://nvd.nist.gov/vuln/detail/CVE-2023-1386
Type: Security Advisory
CVE: CVE-2023-1386
Score: 3.3

Analysis:
- According to redhat[1] this CVE has closed as not a bug.

Reference:
[1] https://bugzilla.redhat.com/show_bug.cgi?id=2223985

(From OE-Core rev: 6a5d9e3821246c39ec57fa483802e1bb74fca724)

Signed-off-by: Madhu Marri <madmarri@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>

(Converted to old CVE_CHECK_IGNORE syntax)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bee30cd56f..cae33459e6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -161,6 +161,9 @@ CVE_CHECK_IGNORE += "CVE-2023-2680"
 #       due to the rocker device not falling within the virtualization use case.
 CVE_CHECK_IGNORE += "CVE-2022-36648"
 
+# disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985
+CVE_CHECK_IGNORE += "CVE-2023-1386"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.43.0


