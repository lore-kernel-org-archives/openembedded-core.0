Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9353BF3C9B9
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:30:24 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24305.1771950614206000973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=itlGDWse;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48372efa020so45948895e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950612; x=1772555412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeuwgmZk9vW2lEdn59n64JLeF8pYee4PoSv5DD0/l7c=;
        b=itlGDWsenx//PvaY7zPpTPTQ0HThUTUxwlacgTixcorz2wG9xO9MSsqjIC4JCH4Y48
         Em0nzBVLe1JBxM5v70EoGv9qj7cDciU6YBGM+vG8X4ntp7bNkHkNPST+Lizy78D7VGYR
         LgSmzJf72FzS1HJ+eCjVIR4CjiYjn/kSr7cr6G9RX5CigM4+SttvdK9Tgv8huCGjGlqt
         wYy1gR5BJ32NZ0ucwCE4MJTGFGdfbShzpoxT/oEYTlkkb5zRPuC8Vy1r6racYIZftD3E
         +2+SPFdCZHm1pJdccT3EUvQzzx0kFsn6KD6WaCCOehRG7ncEE/EjnhyvVGh6bctJxG3z
         T/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950612; x=1772555412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oeuwgmZk9vW2lEdn59n64JLeF8pYee4PoSv5DD0/l7c=;
        b=EYFRLdMyMvbaPOU6msN1YKHpYpdzbnCYMDno0UtcaztrApQl3JKvTQcNhwJ5QV2Oq0
         2cSnOR+hvRognyYh028gO5RYSlzO6ktuebrbgV21yjhn3cRkEfhsnGGwXveteJR90HT8
         xfwPCrnl8g2uRCFMwKbTMUaSoE9jTzPfSi7LL7cnOvO8+f2i/ThI6ZQ8mrZqkw3itkD3
         /1IM9RC3qSNbCVTE/6XoMHjahVJFJRwqYETLh13AHEA73XuZ2qy/PPaNQRSBF7etHXIq
         X5sa33Yi5S6r14Jm8ujEyTijlB685Gz7lOy7+/rKrHRWLBAtJUvOghIxwHM793EXfa70
         AAGw==
X-Gm-Message-State: AOJu0YyGt+yh+ValuycnV0STW5HLVJOpK9IsaROluWmTYc1/6v8APXtg
	xIUtBTza4YLIfL2fZOPCtLMbUChk+wAJ8J42QcAinxYNXpfYV5+AFPtJcLa63Q==
X-Gm-Gg: AZuq6aJ4PjR7bOQ2jsojqzPjJ8tz4Bzr2kmb6Xl3sk4v56zjLy4ZOKYXxburtwzLoK9
	Lk5fk3kjGMkD30H9UvEEFTM4kdI4067WJLaU0NQhWuXxBCINcsJBbtdCSwJ/Ov3+tD6b1yPI/sb
	J/4OYPHuE0S3/NcSb2LSkGL/sa19hWo3gdNV0Z3ZZVO1MUgSvmqvKwegIXYMNyMh9tTXzeIhOcw
	Zk8HU/nq5AlbGe4ETshyeC7Q9e8OVacY7IKoIu6BGgZ/DIX0AbOoFPcIHuK1jGAu6y5VVcC/bp9
	BWbgwtqhjcMAA/eLEvJJDcWN65csFhW3e5kg2mhRA11xI9GAM4dcieQ7kBzv6BV5zTOsEfdtJnH
	3q6uFhjSCZLPTpoyq4rKg9xXcA8hZ8EqTsRFpcm47m5YpwyDBhs+2vT7vb2+9peEBVHav/9OgmU
	lrtZLc8P4sQ6kR4DSf8ewAsuvbWe13zbZ+VpbHyX1Qa1fJIg56WuccIcfr0QHfy41W9rP5XAsaz
	fcZoUSO
X-Received: by 2002:a05:600c:5287:b0:47e:e807:a05a with SMTP id 5b1f17b1804b1-483a963c238mr208581915e9.33.1771950612147;
        Tue, 24 Feb 2026 08:30:12 -0800 (PST)
Received: from fedora (mob-194-230-144-218.cgn.sunrise.net. [194.230.144.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f3124sm9716355e9.1.2026.02.24.08.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:30:10 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v3 07/11] spdx30: Include recipe base PURL in package external identifiers
Date: Tue, 24 Feb 2026 17:29:42 +0100
Message-ID: <20260224162946.4000445-8-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224162946.4000445-1-stondo@gmail.com>
References: <20260224162946.4000445-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231884

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Include the recipe's base PURL (from oe.purl.get_base_purl) in the
external identifiers for built packages alongside any PURLs from
SPDX_PACKAGE_URLS.

This ensures that every built package has a pkg:yocto PURL (e.g.,
pkg:yocto/core/zlib@1.3.1) in its external identifiers, improving
tool interoperability and supply chain tracking.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 7fc831225a..ecab9895ef 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -853,6 +853,7 @@ def create_spdx(d):
         [oe.sbom30.get_element_link_id(recipe_spdx_license)],
     )
 
+
     dep_sources = {}
     if oe.spdx_common.process_sources(d) and include_sources:
         bb.debug(1, "Adding source files to SPDX")
@@ -886,6 +887,8 @@ def create_spdx(d):
     debug_source_ids = set()
     source_hash_cache = {}
 
+    recipe_purl = oe.purl.get_base_purl(d)
+
     # Write out the package SPDX data now. It is not complete as we cannot
     # write the runtime data, so write it to a staging area and a later task
     # will write out the final collection
@@ -947,7 +950,12 @@ def create_spdx(d):
             if purls:
                 spdx_package.software_packageUrl = purls[0]
 
-            for p in sorted(set(purls)):
+            # Combine SPDX_PACKAGE_URLS with recipe base PURL
+            all_purls = set(purls)
+            if recipe_purl:
+                all_purls.add(recipe_purl)
+
+            for p in sorted(all_purls):
                 spdx_package.externalIdentifier.append(
                     oe.spdx30.ExternalIdentifier(
                         externalIdentifierType=oe.spdx30.ExternalIdentifierType.packageUrl,
-- 
2.53.0


