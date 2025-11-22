Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36C8CFD2FF
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:14:43 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3744.1763849677562813380
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:14:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Rm7y8BdN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29806bd47b5so19265825ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849677; x=1764454477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4KHufZ11gDbUMpOjLLwT4JzLv3M7MYiGrj5xrheH9c=;
        b=Rm7y8BdN1zB6yTYmi3ph0/KLOtzMhqRZiyMjfbyDf5m7Tm7hPzC0E3Fx+vMNSlPSz5
         dZYXLFJmvcwAqdzk8TVhP7W+Mz698NzjisB3laeXBDfcnao1MacmtYWNUV+9SpHgarin
         NCeJsDDnEDjOIpBq6s9MDbRXQzUX4+y0uHKduwqni3zecxMjAnz8/pZBq279KJyqnRqg
         sucaXtyGmZ1IdVeasjWfRGGnbcTCQGzabQG71TaGt9pOva404KsAy2fi58ZmRAie6BDD
         nt6/pOFcFre3zw7RzPvJkkuPdYzUO/D0gnPkkcYb7h5k52x+a2CdnX1dcDergO6vikGC
         2Inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849677; x=1764454477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U4KHufZ11gDbUMpOjLLwT4JzLv3M7MYiGrj5xrheH9c=;
        b=j+C6dmDNVvrw4QYO518xU3cVP1uFIs1U8VGT8NB44PK3QzfpEe3XyHCQMATACeNjci
         qcK4eCLHRacIuLwiTyspDgwvVu2dgDCSZFROyYe2NHdV7vsCVmuDjSHGNJ+TEWafQLj9
         A9BNwyhtAFxE7VODytSnjSimNCVqjGhiKARy+nZCtI86pxGM3MFsHfC6tesPeJbDIvk/
         uzpw8e7Bo27K93NQ9zA/tcAY+OlCJERjxD3da8hwC3TYk+VlglYmyR32A0AX8zHPmxTa
         9JYhJR7o+3miIp0LUIvbswqW4gFM9UxxteFR+E0snzU4FiECJ83RzQPFhvvO47FnCkht
         fsOg==
X-Gm-Message-State: AOJu0YyXYuvyMJ84onlKJCKDm28sEeTLGZvdCg6PpEniC617GVQSBTD3
	PHuuwxkdzpGxjTyajWL5LT1xpq7RFOailkJyeAZ1rjMeZlvBIwWYNLXwocZsw2Vzy8BF/mkgn1e
	+1O4Z
X-Gm-Gg: ASbGncsi6qrBOVNigOibwxf4JeLG9jT5BtM9jcmM7ROBoUxEkW+YhBoAXIxIKiKynnj
	bbYlw52a/Pq/GnKb92Jya0k1RbasKEkl1QfDjsrz1FJO+mCYG6jCcKsfgu7WH3PCkI4oVZpMlOo
	sn84Xfn54eCQO+uYh5jcyYEiwZAeEvUVAvg6K5V1vcfzC92V01EXaKaXEZuZLmvrq8SKZJa5Lzm
	1BiOg0o87IeWImzN3GQWwKLUVWS7BeVelEZd9rCOFYZZk2sugYpPC2VJVtLFIaHc4T2pweyhxYl
	hjgztdAvr1c+QLYhnRB68uloP9EBjtihepHWSAP3Ib0mDJhHE7HZcywKbdJ3rjCeJ4vmMF+guLS
	qJ2ZkUX3+9HSAkZi31JU2TDdpxYww7z+AubaQEzb7OlAMS1nKaUrT+J0Mn6vCdu8aIc0RfHJ1Ze
	hSPg==
X-Google-Smtp-Source: AGHT+IF9jQ1PDnFyfYRASZf3tyai1hgFAD9EFIBrI0KVqG7Qhw6AIbevWzsMvwkjKYXLFhvnB24k7Q==
X-Received: by 2002:a17:90b:2b50:b0:343:653d:31c with SMTP id 98e67ed59e1d1-34733e4cb69mr5948319a91.5.1763849676758;
        Sat, 22 Nov 2025 14:14:36 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.14.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:14:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/21] spdx30: Provide software_packageUrl field in SPDX 3.0 SBOM
Date: Sat, 22 Nov 2025 14:14:08 -0800
Message-ID: <60724efdb3a243bc796b390ad0c478584a0fb7fa.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226700

From: Hongxu Jia <hongxu.jia@windriver.com>

Define var-SPDX_PACKAGE_URL to provide software_packageUrl field [1][2]
in SPDX 3.0 SBOM, support to override with package name
SPDX_PACKAGE_URL:<pkgname>

Currently, the format of purl is not defined in Yocto, set empty for now
until we have a comprehensive plan for what Yocto purls look like.
But users could customize their own purl by setting var-SPDX_PACKAGE_URL

[1] https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Properties/packageUrl/
[2] https://spdx.github.io/spdx-spec/v3.0.1/annexes/pkg-url-specification/

(From OE-Core rev: c8e6953a0b6f59ffca994c440069db39e60b12d2)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx-3.0.bbclass | 5 +++++
 meta/lib/oe/spdx30_tasks.py          | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 044517d9f7..c0a5436ad6 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -117,6 +117,11 @@ SPDX_PACKAGE_VERSION ??= "${PV}"
 SPDX_PACKAGE_VERSION[doc] = "The version of a package, software_packageVersion \
     in software_Package"
 
+SPDX_PACKAGE_URL ??= ""
+SPDX_PACKAGE_URL[doc] = "Provides a place for the SPDX data creator to record \
+the package URL string (in accordance with the Package URL specification) for \
+a software Package."
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 8115088ab8..a2d316301f 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -632,6 +632,14 @@ def create_spdx(d):
             set_var_field("SUMMARY", spdx_package, "summary", package=package)
             set_var_field("DESCRIPTION", spdx_package, "description", package=package)
 
+            if d.getVar("SPDX_PACKAGE_URL:%s" % package) or d.getVar("SPDX_PACKAGE_URL"):
+                set_var_field(
+                    "SPDX_PACKAGE_URL",
+                    spdx_package,
+                    "software_packageUrl",
+                    package=package
+                )
+
             pkg_objset.new_scoped_relationship(
                 [oe.sbom30.get_element_link_id(build)],
                 oe.spdx30.RelationshipType.hasOutput,
-- 
2.43.0


