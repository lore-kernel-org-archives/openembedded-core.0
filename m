Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE175C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 14:26:41 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.12202.1739456799778955484
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 06:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3HcxIpRL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f3c119fe6so22275755ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739456799; x=1740061599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljOT/4vMaRXZ0pUg9IGukepS1UmOAlNeuEPW0/qcLA4=;
        b=3HcxIpRLFczm29VMwUo3n0iQNS7LfS9l5uNj1S+jiZOtw1MwwCYKmt3Ho61qS6vI4H
         fSVbIUubgWwJDuvM/4r+BwrpYn1irGAcFZQkklJH7PWY2Qj+Cz3eVm/mAdEHLmEHF8od
         +XEXiEzSwMoyULzbl+vqqCN+AIY5q1m489Rto1OnzE+QapxgDnDp1QWx4kaGMVE/uxsn
         S97ldpQi+127p2PitkR29sbCyhjj38SPpKce/RqTz3IA6GhtTtIg90rwMIo2Ce7zt3Jr
         4RmV4ZQwEsQwon34BEBwrSaeQF6XLEacWiiOeZKvM7gw8DcvTaQ6vw20+yPYC5lXLoGg
         OZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739456799; x=1740061599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljOT/4vMaRXZ0pUg9IGukepS1UmOAlNeuEPW0/qcLA4=;
        b=Ga+u24O1kie+ImsQAA9gFxS9bjuHNX/YcPrjXcGcF0kQiod9u00amGBFjh9ae6gM31
         Tl/pzKyGmdkNMYlHD3ib7m/ZpThWpda7yDX/t/MZMjbRdmA1tO//JPRUy5V71WGbd9Cx
         e4UwYcb0pTIr1ufr3U1KUV0ofsRlVRG81awKV/aATo3UBOGnAt7PDzZjMWRMH6Aig/+X
         k0a4w/YeJsd8x81qYm+UT7wC2y+O9B5GhKH+NZhexJRXeL4y+60j9jQ61bESjUOLM5O6
         A2+BIvQeHGp17xSxzXlug9Ecb3pqPm8praB0lxb+BAE3MfH/4jD23p0/zGO1aK+LyRXk
         4+Mg==
X-Gm-Message-State: AOJu0YzF/v3ITfcYU7g2oBzT1mK4cKCKB030ecKhhQJ1Peqz62QG/Sda
	ImF2Es3fGeE2MLPXHbW4CsN3tccQeKe24ZKUKB9t8U8y1ASDQz/uwcDpO2kRjotprwdnUjMFIQa
	W
X-Gm-Gg: ASbGncujXjxNhcnAZ37+oEx3J0/ijHqKeAJFwNQrTkbZjzXowhBlXHwUxv1hTdxhlCr
	yjk3vfw2dT/1GmTTcfyNq/ivAvICZCtNFB6z5DBqTGqYJv5nxt5GwxQaZP6mvs1fZ0sRCSxGZ1H
	uTldoeRkCHURP/oM+R+ag2GQ1lNO+0+8lH7v3psNDEJ7vzQKkK8WilwfXu1VaA2EgNa8s9NtRqK
	mDIzZO2gmi+WVMZbSXBoYsXQGm/uEC6O2iD/PwmtIgOccoyGgUaoVOL6BA2pvWlK2ChuUcMXS3o
	qGCg
X-Google-Smtp-Source: AGHT+IGuSqGWbMppMLcxrKNg1Us6132h6eKlAoNcHHQUvIh4Eh8HN7ObdMGykjOlJ33AiPirzg2t+A==
X-Received: by 2002:a05:6a00:b95:b0:730:8a0a:9ef9 with SMTP id d2e1a72fcca58-7322c417953mr12351526b3a.22.1739456799006;
        Thu, 13 Feb 2025 06:26:39 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732425467b9sm1342377b3a.30.2025.02.13.06.26.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:26:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/3] lib/packagedata.py: Add API to iterate over rprovides
Date: Thu, 13 Feb 2025 06:26:30 -0800
Message-ID: <579717212ba2892e32315788ccd65320556d32a3.1739455358.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739455358.git.steve@sakoman.com>
References: <cover.1739455358.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 14:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211339

From: Joshua Watt <JPEWhacker@gmail.com>

Adds an API that makes it easier to iterate over the package data for a
all providers of a runtime dependency.

(From OE-Core rev: 68bdc219a4a819e83217f5b54c463624af8d3b9e)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/packagedata.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 212f048bc6..205800a407 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -108,3 +108,18 @@ def recipename(pkg, d):
     """Return the recipe name for the given binary package name."""
 
     return pkgmap(d).get(pkg)
+
+def foreach_runtime_provider_pkgdata(d, rdep, include_rdep=False):
+    pkgdata_dir = d.getVar("PKGDATA_DIR")
+    possibles = set()
+    try:
+        possibles |= set(os.listdir("%s/runtime-rprovides/%s/" % (pkgdata_dir, rdep)))
+    except OSError:
+        pass
+
+    if include_rdep:
+        possibles.add(rdep)
+
+    for p in sorted(list(possibles)):
+        rdep_data = read_subpkgdata(p, d)
+        yield p, rdep_data
-- 
2.43.0


