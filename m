Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D613C5DF8B
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:24:43 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14440.1771647876134646481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:24:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NTGYninA;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483487335c2so24829475e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647874; x=1772252674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1Nkb+inbDZXtmF5/xVFA2cY5GeygR6vJkAvCs+fRrE=;
        b=NTGYninArzkm17FjJXvwYZFZ2oLV0u0Gs4Mvn3X51OZxXQbwLvNv5lGJOWpT/h8n+U
         7mKYUSmBwg++l+BNbUvjxRDltYHDuLkgNvlmUMBaLyGA1SxCinn8TcYE6LLLkzU3IzTm
         ls1Efn4UvJi3R+NN6E8Xa0zhiyCDzVB0M1pf2XCgE5w9ecBy0J0RcDSZYYgOYZYgaM9J
         G3haAyZp/nrr9j+HgeEdnQ+T9ak8WGxCE8TyyZn2bVk5Up6WV61fItA6IJ05nDcZR3Q5
         F3InCjN9Vz4Q+28IZ5XNTVrSbfHSD2IujyYjTx2hF3yxVUN7TClmjoaN457SfeG42wh5
         rtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647874; x=1772252674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r1Nkb+inbDZXtmF5/xVFA2cY5GeygR6vJkAvCs+fRrE=;
        b=GKMkDWk1p6XBBotN1UgdRZZkIHojLP/aGbHUW7G6roGeqm8oPiyfTh0iay1FNFhp19
         XigKmKmSZug1mhc7mAmq/7Ol6s0wppK39OSexNVbqGemirDZEafPcLW66pIEU3kMfApt
         QREu0joMIyycqa9cRe/u6f+dmdPpj/NkdZFVjgVyxjfNKOQpFQaS5EEbNLMcixw8V14B
         UDYoc0+W15Lu8PS9UqsN5mq+vEeKds0tu+HTdGJWVHwEhV6OKrrM4x66UE22hpD28Bus
         K9W00IkLkF4hYMcAURvaVshF0FxqJmRJfoh/EztbGgQMYDmHW5bRdTO2WgKzZG1G/pgh
         qXIQ==
X-Gm-Message-State: AOJu0YweX3BxXvt2hQuRo33qfbHRmmnMwycxF+Z63vXe5QhahduyK16K
	0To5nNXrTIUFBMBz4fcoYdEf7NOSDdKB9ZtXoQkM/Bhuesz0QwLW+29AhTltzg==
X-Gm-Gg: AZuq6aJcuRQ4ZBJtoKS0PDN42m7bQM098v23zzyxi8MM+IhR1JB9wG4Glji5o1tWhQ4
	VWZELxA+KuTWOz5/bY3cRQv5amFMJCreGHGkcBZnWLR6RPKZ3OriflMfZCCzojpfQmyPdJliHoR
	bXzK/Qb7zfiYOwtB6m5vyzM5qSKbZ9h/+4YZnTYOs2Q9wGHGclN8rA7bmmiHnobqAZD+qrOp6Z8
	8wx/QpGWrBZlbzJPwOYSJs00PjsrcuxpuxXWV5zlPzWpng/zmuCq6N7B5jZiEj7fv8vdo0bPgz/
	S23b8KWHNsLaEsfJ+J0t73TX0DVAED1C5MzOHKJ96LWlQxq1VvP3fWKXGwU8RgJhzGlxMLCF4dR
	kXdVb58FbZVGSbUZNaRlsfyKPZEH0PddqxijlhiEGcnZN6hxQkZSH4jJINSiyyzX6gcIxLAGUt5
	ABC/KufKtRln3Fjjt9AQCz2oWcxiQ2SKtL5WA=
X-Received: by 2002:a05:600c:45ce:b0:483:a895:9d85 with SMTP id 5b1f17b1804b1-483a95b3e18mr30379995e9.2.1771647874142;
        Fri, 20 Feb 2026 20:24:34 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm117340865e9.15.2026.02.20.20.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:24:33 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 10/14] spdx30_tasks: Fix non-deterministic BUILDNAME in image package version
Date: Sat, 21 Feb 2026 05:24:14 +0100
Message-ID: <20260221042418.317535-11-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221042418.317535-1-stondo@gmail.com>
References: <20260221042418.317535-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231566

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

BUILDNAME is a timestamp set by buildstats.bbclass that changes
between builds, causing non-deterministic BitBake task hashes.

This was causing basehash mismatch errors:
  ERROR: When reparsing ...do_create_image_spdx, the basehash value
  changed from X to Y. The metadata is not deterministic.

Root Cause:
  The image_package metadata uses BUILDNAME as packageVersion.
  BUILDNAME varies between builds (e.g., "20260120151200" vs "")
  making it unsuitable for deterministic builds.

Fix:
  Replace BUILDNAME with DISTRO_VERSION which is:
  - Deterministic across builds
  - Semantically appropriate for image versioning
  - Falls back to "1.0" for nodistro builds

This ensures clean builds without basehash errors while maintaining
meaningful version information in the SBOM.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 0d62de61a3..12b8e68fbe 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1505,7 +1505,7 @@ def create_image_spdx(d):
             _id=objset.new_spdxid("image", "root"),
             creationInfo=objset.doc.creationInfo,
             name=f"{image_basename}-{machine}",
-            software_packageVersion=d.getVar("BUILDNAME") or "1.0",
+            software_packageVersion=d.getVar("DISTRO_VERSION") or "1.0",
             software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.container,
             description=d.getVar("IMAGE_DESCRIPTION") or f"{image_basename} image for {machine}",
         )
-- 
2.53.0


