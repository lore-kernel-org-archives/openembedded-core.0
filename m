Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61955C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 14:13:58 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.5737.1640009636828289294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 06:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BbzelMtF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id e5so20373656wrc.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 06:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S3/w8Ux8N7aGg/i4rC3gszAJq2osxNShzUblsm9pMIw=;
        b=BbzelMtFQX8dWwjve06jk0bGvmTi2YAp6HlpCaq4DCF7/asw0RuUVqJYyXp8pKHzRm
         D/OzBRHG1H+WzQCTRlreYjJn1lByCmsfxqkTiPqTy4k+0fkoQyroq1yqzFM5GX8hafyf
         yXfnmGXzx5mBzhUeiJ1YdRUWifcyDctu7gzvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S3/w8Ux8N7aGg/i4rC3gszAJq2osxNShzUblsm9pMIw=;
        b=0UYKkbf6duU5VDaZK0989/YcO3u0uPFKESw7MNMU4zMNihZjIOcC4IDngQUdPYPdS/
         QpLyB6Ao+3GsixZe6fRbFvcnZHpAOugwwWaSqWbsj+l/+a17TJUgFD33Iwp0e6eoD6t2
         PTDS5hVGOKNnDYOqx40+YXpuMuPaZ1gxBadLbNvFqvkIZIvkKEO6j5MKk6YDr5W8FQQ5
         VosNnSxPrK4qSn2u5b36XePUu0eRZNqnfK0x3EG+dezbVJrRhZ8XpzyAWnBA/OK00SE2
         +yKrTOtsE7t5HoZvmDM9gRJvmIQxigenrfh7OX5E/bWzVAmUUUelIAnLQgiIqvu0eH5h
         f9xA==
X-Gm-Message-State: AOAM533xaVsG+QBzsolk7I4mXF7ZBtc5s+3yegAaFmRWN7KKntgIDxlp
	53XBQ9VbXytvGxA8JAz2OmXgLBwg087gkQ==
X-Google-Smtp-Source: 
 ABdhPJz/AQ9K3zxQGAnjye1VfnfulvtIQA529sfYNSeiqVcG6lus98J7jOG4gyGnmrP02+YNok81vQ==
X-Received: by 2002:adf:804f:: with SMTP id 73mr12998013wrk.476.1640009634789;
        Mon, 20 Dec 2021 06:13:54 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2f2b:ae5:15d4:240b])
        by smtp.gmail.com with ESMTPSA id
 h2sm15110212wrz.23.2021.12.20.06.13.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 06:13:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/bbtests: Use YP sources mirror instead of GNU
Date: Mon, 20 Dec 2021 14:13:53 +0000
Message-Id: <20211220141353.955880-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 14:13:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159868

The gnu sources server has been known to disappear. Use the YP sources
mirror instead. If that breaks, the autobuilder is broken anyway. This
should reduce test failures from upstream network issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index a74576bc02b..246cb032bfb 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -160,7 +160,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
 
-        data = 'SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz;downloadfilename=test-aspell.tar.gz"'
+        data = 'SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/aspell-${PV}.tar.gz;downloadfilename=test-aspell.tar.gz"'
         self.write_recipeinc('aspell', data)
         result = bitbake('-f -c fetch aspell', ignore_status=True)
         self.delete_recipeinc('aspell')
-- 
2.32.0


