Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3E8C021AF
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:10:18 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.7189.1739913013230294968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=A3cR8tF6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f441791e40so8783640a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913012; x=1740517812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVnJjPPfM9UgUGrk7dqY76Z6GfJLp23pxtgHKca0QkE=;
        b=A3cR8tF6EDjmh93PoyV9Q0E6THDHRdxaS1NE9cJg+d1whWUeLQ4dyXSL/bxaMvRXbf
         X3GgZcvBkf6ZMuXUmlkJb9kmeQYscSZ7GJH8xR3+TvgUpMVs98jw6Bwsi0r+hUeJ7Vd7
         P2UyAPrg+8uSBzCkwqlJ5ucktVU7KFwd/ETc1Vjy5Y+j4emINXSFEGR7c9ROaqdZ7vGE
         Ji2YxSLboGotG4Xw0XQ7+qDW0Baox/UanecWvK0adOYdRjA9v/P78cNAfrj+MTVT6x1f
         7TlpG6kUVCkaFWGsIOEIeYXoUYLYrANvQhTQg3C/vbXxTS0qPkqJ+JsEQO0qA4oObtit
         +wHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913012; x=1740517812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVnJjPPfM9UgUGrk7dqY76Z6GfJLp23pxtgHKca0QkE=;
        b=hAZyybtJehpaIhLQrGqI93MK9yax8vHMsSXhNag9O2356mevIz0Onl9AZj4csStbGh
         V3GCABMuSN/N7HlTIKrcLv8hyZLWoKaBTjJbxYZgtUmGar0dmkCDlDgxdFxssTGuXNkn
         4rcxlNPk0qHlZkrr8zS33meq2K+hHyaX0Ef8lMawnzpw7M34QdsOM+i4c2gd2yWrWoNe
         J62XljWMWgoVaeGzUC8IYHxBvM0cQJeNDk+x4ef1DY1o5lx/6tkdo9gGVAdLQDmPrelg
         sIzUjWpG149IAOFuH22Q2GnKOJTkRw3ajUAnp1N/Q5uYMjCX197qmAkyOb6NDYLbRdID
         jTNQ==
X-Gm-Message-State: AOJu0YyYaOk9uL8rXgugQdudxGj8bXbNXCUZPT5VdWs7vVo+8Cs3bUJx
	VG2Hs2DTnga+aGCBZLCdUbjRgq38DMh15sLctyv/VSUQdfdbpGCVuiBosnC9C02uhoEnFAlIUlR
	W
X-Gm-Gg: ASbGncu6jafBxVvWqYW46Lt7yJxa08j5o6aVXDL4Q2SIXjujZPofCi+DIYgRU20eHNt
	Nl8kwh3lQASH+CmkRTJ694hgddLkJKR9jxsodHDtu47UnpkTjGCBJsQSRu7yVR2qYVhMbptU8Ji
	n0AfQvx4S5ba1RRjC2n1bUXX3C1PRIY/1BDpySyYHcvg2n21pezl/CAh981XeBITpnGznHet8Vd
	5KWtQxq8n79NiaQaRLAVNKpCvsMgMtxNyATbShE3Z15FiKk3EV7E5Kyj/T4yMWC+8Oo9jbH1hLz
	leiXtSQ=
X-Google-Smtp-Source: AGHT+IGKxuEYzlnjzrA82W6l0S8uFjl8gSZhwJn6q5rUhVxxAN1FfCYkI78oC4XLBmAHBqi5GJKQew==
X-Received: by 2002:a17:90b:4fcf:b0:2ee:a4f2:b311 with SMTP id 98e67ed59e1d1-2fc40f1040dmr21790618a91.8.1739913012564;
        Tue, 18 Feb 2025 13:10:12 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b326bsm12820720a91.1.2025.02.18.13.10.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:10:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/12] subversion: ignore CVE-2024-45720
Date: Tue, 18 Feb 2025 13:09:54 -0800
Message-ID: <3a3488c8c4c0e19e32504e03e6bb73777ac7c72e.1739912869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739912869.git.steve@sakoman.com>
References: <cover.1739912869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211640

From: Peter Marko <peter.marko@siemens.com>

Reference: https://nvd.nist.gov/vuln/detail/CVE-2024-45720

This CVE is relevant only for subversion running on Windows.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/subversion/subversion_1.14.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.2.bb b/meta/recipes-devtools/subversion/subversion_1.14.2.bb
index 35da95f39d..a979e63c60 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.2.bb
@@ -19,6 +19,9 @@ inherit autotools pkgconfig gettext python3native
 
 CVE_PRODUCT = "apache:subversion"
 
+# not-applicable-platform: Issue only applies on Windows
+CVE_CHECK_IGNORE += "CVE-2024-45720"
+
 PACKAGECONFIG ?= ""
 
 PACKAGECONFIG[boost] = "--with-boost=${RECIPE_SYSROOT}${exec_prefix},--without-boost,boost"
-- 
2.43.0


