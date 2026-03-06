Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFD8F01800
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:10 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64468.1772781783609485246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1P1OHVfZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so101969515e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781782; x=1773386582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzRtz2kQKFk0agpovMJatOOGc0oV13I2FcQL+YGZZeg=;
        b=1P1OHVfZOUJ0QB9li9YsvwyU4D6diJn3cYWeuP4C56FJeDvKQut/avCTgqb5jjn3je
         p1TxA8/LaW6Y2IeH2GRVL3HovtM5vBXmVud5c17VsQLzn1/BPdGzrubF/aJ2lPlSRwBx
         RAyQJw93CEmCzJZYdPFLdui0rFQyZvFv2cevw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781782; x=1773386582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pzRtz2kQKFk0agpovMJatOOGc0oV13I2FcQL+YGZZeg=;
        b=WDBxUat30ztFw8YywDVdxxG4Aj0ZsDqeHX4GBocK5kZHvoO+hPgudNFkTZEiqFZS8E
         7B3iovj8bbbj1gE6gbKdP11iCth3MXck1OpF+4Z+MWoKND6hO4CRlPTvLk7IpItZVxZ1
         RmuXn+3O2vqzIXmg6f0xxU2zEF2DBsjlLEojdmwh7BpDolu+DVGAu+TI8JJONjBkzVz2
         1BKY1wx/qID4QJ+czk0oDNIleVeFUvvmh1Y9ldINSQbCL5o2GtiOWRQMKaK0A7Kwq7J+
         cDuWh69yoVNQ+J60rclt1tP/Oi7rRBi+XkJ/A2uHV5bDzfMve5Z+hP9xGyitW4acOdJM
         MW6g==
X-Gm-Message-State: AOJu0YzMoRVgthzBbATye54FmpFXjm54l/z49kSlpH7S7iUBAcSm3djl
	ZDS0ZTs/bjwom511pVqlhR4Kfb9w4IT0d2ze/xtIIjlJpffkJpOXfgq8L+8O2CXJ1Fn9i8mrb7N
	dL3Qj
X-Gm-Gg: ATEYQzxmZ6Q8bIhFiD8IPqZoL3bUBdfBGzDAAiWegcjNxGTC/qWeigoNHrbxA70Z6Dj
	WtnlS9DbdQht/mkkcP4/YsOoOvYCu1qZ/9L3kEAFFoiI/EwUX1PdU4ZA6PN7t2p2wmW9wVo+JDj
	7OYYgyZJHvMUSC2jiXgc7zGJwonoipET98H3DfiqUrVl8se/tu7/U/q/+YkAQkcKh7xr6FHpIyO
	smCFg1hYODkedr6Ry3L5BSGejhu9daTF0VVagfe7Etr4ZGrD28ayW2oFV2khRkMvnvJ21E2t4Ig
	/sDXdPnmj+9IxdzQuSTq/9d8bteKA0btddb5sVfXfYl8XaJMAkDQyQQ5kZup//KY+JZCVeWBrRH
	vM93Bw5mC5zPAs9wryxZPZZiCZDX9fEOZHRz2vw9LN8Be3gX03VzQm8hOq+YAReieugUOD2FQGU
	vkuIFprc2absfGmDjML7mnszoNkzZqWQb5R9MrPeq2KWw7mpTzqV0IM0NxUYWwwV0hVPZotfN9e
	aIFinjQJ7fqmUlQIfD1dnZE5siU
X-Received: by 2002:a05:600c:6299:b0:483:54cc:cd89 with SMTP id 5b1f17b1804b1-48526923b3cmr14482995e9.9.1772781781600;
        Thu, 05 Mar 2026 23:23:01 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.23.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:23:01 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 05/16] cve-exclusions: set status for 5 CVEs
Date: Fri,  6 Mar 2026 08:22:05 +0100
Message-ID: <896237f72aa5c5b46023fcb39de64935da11dfda.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232544

From: Peter Marko <peter.marko@siemens.com>

Reuse work of Debian researchers and set status for fixed CVEs
accordingly.
These are not tracked by kernel itself, so generated exclusions won't
help here.

* https://security-tracker.debian.org/tracker/CVE-2022-38096
* https://security-tracker.debian.org/tracker/CVE-2023-39176
* https://security-tracker.debian.org/tracker/CVE-2023-39179
* https://security-tracker.debian.org/tracker/CVE-2023-39180
* https://security-tracker.debian.org/tracker/CVE-2023-6535

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 699dbbdf3ab2693bae8a7e0425e2519250fdfec4)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-kernel/linux/cve-exclusion.inc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index 80c76433ef2..7d68a9bbaac 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -157,3 +157,19 @@ CVE_STATUS[CVE-2023-7042] = "fixed-version: Fixed from 6.9rc1"
 
 #Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=7315dc1e122c85ffdfc8defffbb8f8b616c2eb1a
 CVE_STATUS[CVE-2024-0193] = "fixed-version: Fixed from 6.7"
+
+# Fix https://git.kernel.org/linus/517621b7060096e48e42f545fa6646fc00252eac
+CVE_STATUS[CVE-2022-38096] = "fixed-version: Fixed from 6.9"
+
+# Fix https://git.kernel.org/linus/5aa4fda5aa9c2a5a7bac67b4a12b089ab81fee3c
+# Fix https://git.kernel.org/linus/79ed288cef201f1f212dfb934bcaac75572fb8f6
+CVE_STATUS[CVE-2023-39176] = "fixed-version: Fixed from 6.5"
+
+# Fix https://git.kernel.org/linus/e202a1e8634b186da38cbbff85382ea2b9e297cf
+CVE_STATUS[CVE-2023-39179] = "fixed-version: Fixed from 6.5"
+CVE_STATUS[CVE-2023-39180] = "fixed-version: Fixed from 6.5"
+
+# Fix https://git.kernel.org/linus/efa56305908ba20de2104f1b8508c6a7401833be
+# Fix https://git.kernel.org/linus/0849a5441358cef02586fb2d60f707c0db195628
+# Fix https://git.kernel.org/linus/9a1abc24850eb759e36a2f8869161c3b7254c904
+CVE_STATUS[CVE-2023-6535] = "fixed-version: Fixed from 6.8"

