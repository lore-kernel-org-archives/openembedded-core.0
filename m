Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8ED7CD25
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 03:21:23 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id s22so10732568pfh.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 19:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xQHSr6TedbUfkFQnHnM64nCEzoeek4N4xDN5zJCmMnE=;
	b=o31xQ/X2h9hsF62z0LHvNWOwA2zKUVZIZWVCrGTtBglQzm5Y7QRLw5S/hRyHB+VxzE
	m0rBFAUhgnvyT3T4BNPVPE4QKiPAO+l59XUBvx/z1lS9UbXqpnydgJJCd5LE/+HsyNnD
	Jd818tMmFxjGqjtU8S3nu1KGo5aUggBmqu71Nf9emhLBLFsKSB1hg2wYeeJUhMJ/URB1
	2Ko9imOiiaATiifxcXzRSNC486AG834+bRvSWiHXkihIm2G93It+AkIls9/DxpE3QyfO
	cDoFYo2oHikKgZyo+FDg97o9CJRiaBl30DDWeTM6UALZahlr8nQRAq8FgKfu8eoTN2Ac
	vhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xQHSr6TedbUfkFQnHnM64nCEzoeek4N4xDN5zJCmMnE=;
	b=VJetw8rbPGZRc6o+LIkMpxC95SAiEPTvwi6lV+74ENbdR602zeQRTLXJOyrVo4+4ZE
	OK4cCWG0NXdOb9FnY3n3nOZxjYxRMG/SeOm7+U2pwAatT+QyibfQsH0ecS6bMzINQv6I
	eqwfKMjpTy9XjnEUWe7GJaiWJB+sQfHSX5y+CgFfwQcfIk0x3IaLT8gDndyWEOeOuotn
	iLWI6fPuVm2VjRmRK0gjPkw9GLnvaKLgaIUrOkqDt703Dn+L3cg2MiZbaNtndqSvcpaw
	djizmAWJoGFe7btKMaYB+jaAWyaf+QkqUGYVAuLIFS/n+4cpuic2MxVxkCtLhLF6QEJT
	Hxgw==
X-Gm-Message-State: APjAAAVclQGwgrycTraL9QIeX5velOwLr5DKVOzM5C7asjbyvdQW74iQ
	T8LM1IDTVRWuKTI4QlRIT+RnEtq5
X-Google-Smtp-Source: APXvYqxmLf9szqaOZPwTFirGCB1BJq22AkydW9bMAz5Dtu2tEugpwDUPFvtvCQe2NECvSk4kI9Wl/A==
X-Received: by 2002:a63:c204:: with SMTP id b4mr2623526pgd.335.1551410483963; 
	Thu, 28 Feb 2019 19:21:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	z127sm37612096pfb.80.2019.02.28.19.21.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 19:21:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 19:21:11 -0800
Message-Id: <20190301032112.38191-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190301032112.38191-1-raj.khem@gmail.com>
References: <20190301032112.38191-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] perf: Set libunwind dir explicitly to point into staging sysroot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2019 03:21:23 -0000
Content-Transfer-Encoding: 8bit

This helps it find the unwind library in sysroot always and not
look around and confuse with host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 515a78b859..9120766858 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -80,6 +80,7 @@ EXTRA_OEMAKE = '\
     NO_GTK2=1 \
     ${PACKAGECONFIG_CONFARGS} \
     TMPDIR="${B}" \
+    LIBUNWIND_DIR=${STAGING_EXECPREFIXDIR} \
 '
 
 EXTRA_OEMAKE += "\
-- 
2.21.0


