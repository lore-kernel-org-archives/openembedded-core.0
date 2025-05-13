Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373D4C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:08:44 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.84925.1747163319458912531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eLswGGkZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736c277331eso151111b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747163319; x=1747768119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvwkcbKXnEgLZQvCo//elhXndmR/rgItj3QyGtdlbX8=;
        b=eLswGGkZm4/3JeS07a1RJz+2vopHEbiEasguJnIN+EjzcblMfiOrwQZ/fIUfXQUatd
         qWeA4IQdoRtF9PmtETYjVDwYoRnfZd94TdAw5qI/7Qz4kY2zx3ffjKOkmZi4+oUGKE8n
         tPIhVEWyz0qUKQ+m4qcrnmzALWYXfoDE+efFcAWvTuoLfO88MqwWNcaddZquFWFAnvmM
         /5+k3d0l6eGAGyEruQ7h/nL0tQTxFrGCn80cRgaGjMmQcaye0Ph3A8l65daoY340DNOO
         KjBr3symChar1HlYl5QVIKuIv8Xm85T5sGXxhgPcfzjAZB5/pJ6C1XjDFs9Eo9wph5f+
         HVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163319; x=1747768119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvwkcbKXnEgLZQvCo//elhXndmR/rgItj3QyGtdlbX8=;
        b=wVPdH5Zp1yOVKvfXdwJO76YVuQ7uzNVmiNb1fbn3fnYeXFhlPW9/RySrtQV3BVcl1P
         cx3jfQz30WXRXiOFLLqm9jn0AGknGQIP716VpsTnY7oA7WHTZSU6HVUWau2r5gEtzxBn
         ElWtfPq+65iDw+T18c+TzzHw7Yi8Y2zasZA1h62Q9ag18+yHpD8Lm7iHFOsPEqBswV8C
         AGvBbxkBORYZCT0TZkyBkXs9N3jGgzsgy1VJd0xmqLTiIhLf2wEJhZhX5mKU+GnrhR1i
         /EuzTMPmx/qsznceJs/pYcJoSqa9JJ+6r/+UOtpLvckcFr9WfS/918rT5MfECnZI1Q3T
         WBZQ==
X-Gm-Message-State: AOJu0Yz0MC9w5abd26KMRLdrgKBl+IRHVBlkKX1+8W6xC6btF3+zu3ik
	PaEUTm35Sr06kI4DqQ5s/O7LioVoRkSzWOUWEOtO6sBvIkmr5072Bqbf/RfCCytotjL09t0bBy5
	F
X-Gm-Gg: ASbGncv3bou6HhSm13yFIg3GGpSxSam3cfTCEwTJzkWBkkz4OF5tHvYYIFAVfgc340/
	gAVi29LdkfUSdcJ9aDHCtf+6Pqhinb+77ovcqltIiAXk3XrPPqqobLDlVQ7AU9gShxNwEYODBw2
	9trNKpCqEV9tKANlpbqzco5nrREMVTOBK7I4/GJqTZPf4bBg2Xuj/w+1XWtpq0PCYEpC5v6Xx8q
	XmGeuhJkxQVIH7deLLLSgAyopsb+77SCAEvtKOzuWJuiyDf5poLKrL+ikrx7T+kC082DtNwwetw
	hYseesMW3lJlF62kvgUUjbXaUpYqHd8O5oaJ7Px/6EQ=
X-Google-Smtp-Source: AGHT+IEPYy8gvZecGyi4sK0N7fh9kWCY1y1eBAmc8Ov4HBBVIWhPjg/tBe6EyXzwn+8FzTgCyUT+Uw==
X-Received: by 2002:a17:903:1a4e:b0:22e:50f2:1450 with SMTP id d9443c01a7336-23197fc77f2mr9033175ad.22.1747163318692;
        Tue, 13 May 2025 12:08:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:37ec:faaf:5b57:6b2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d425sm84851005ad.202.2025.05.13.12.08.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:08:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/15] glibc: stable 2.35 branch updates
Date: Tue, 13 May 2025 12:08:10 -0700
Message-ID: <70e9ae425e34221af6a7bdda6b83f2f8e7848278.1747163155.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747163155.git.steve@sakoman.com>
References: <cover.1747163155.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216446

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

d2febe7c40 math: Improve layout of exp/exp10 data
20b5d5ce26 AArch64: Use prefer_sve_ifuncs for SVE memset
9569a67a58 AArch64: Add SVE memset
59f67e1b82 math: Improve layout of expf data
904c58e47b AArch64: Remove zva_128 from memset
8042d17638 AArch64: Optimize memset
be451d6053 AArch64: Improve generic strlen
8b3d09dc0d assert: Add test for CVE-2025-0395
29d9b1e59e assert: Reformat Makefile.

Testresults:
Before update	|After update	 |Difference
PASS:  4832	|PASS:4833  	 |PASS:  +1
FAIL:  132	|FAIL:132	 |FAIL:  0
XPASS: 6	|XPASS:6 	 |XPASS: 0
XFAIL: 16	|XFAIL:16 	 |XFAIL: 0
UNSUPPORTED: 200|UNSUPPORTED:200 |UNSUPPORTED: 0

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index d98b6a4911..34b199c02b 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "549d8315791aa8176ff1537db3e09c185c6e602f"
+SRCREV_glibc ?= "d2febe7c407665c18cfea1930c65f41899ab3aa3"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.43.0


