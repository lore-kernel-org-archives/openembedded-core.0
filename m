Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E418AC369A2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 15:47:53 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.52804.1744645670346659724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 08:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I/aRT/7D;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2c769da02b0so3013544fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 08:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744645669; x=1745250469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8CPlTGvyseJtes/MwM9OXjznwEWqQXq4P+JUGEO5hKQ=;
        b=I/aRT/7DJWra+cnskLR4238EWPhmNB7ys3GxBBxxKVuebxsnfoJZvy3ePOT14gFtVg
         tLJYZssFD7rt/1XmU+6IP/p6IjEwGO5ME0KscnLYhzaA2GcgGZyv+n4QJMmoEvCnx3U2
         h2q/thVRLZc4hu6h+teLhwKKSokxypvHghpdh5S7eLz0xAhS7/uooLC8KNDw7fbl0FqY
         isc4+kVL1yEO2AcndqJrbYBKB61gXFEXD/pvYsuzNk9KFAT1pJ0sfEIurH6TM7Di9f+u
         wUs3lTOvWoE371roNHS1vYc9Ex7votlJS3C4j3MOTBoR0eNa4EQcHSAhobF5dM7vr62C
         yvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744645669; x=1745250469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CPlTGvyseJtes/MwM9OXjznwEWqQXq4P+JUGEO5hKQ=;
        b=l5T8UEdNOdEM7kz7klzsPmfnrQuky0zpLnml3KE694R1cY0rrBi8PyFLW5cN9PBNIB
         DzQSwKtEHYgVC9FL9wP8/sTkNam+rgMAE5WKhVC1/qsDlHdi/rVBq9/gtwH6u4l8N6el
         zdOJ48TdIIjbLXZySZl2aqdF0DYpaMd4U59mPLiQDelqqaDuQSDiinNSsPG6w7mC9HhV
         hwfQ7l7O+zqmoYGWk6fUBrPcu/d+irnDghLWCdfNbtNunAx+Q7HGJFu4ZO18CamJS3Jg
         wsMgw/gVNxjA5E79b2ULbjDqd5E4UGSjzmkooP3s8elrlHCCJArEWjJVezsb1Gi2wsAX
         tB5g==
X-Gm-Message-State: AOJu0YxHdDImmouNagW2eMPbKjRpItaN7r5hWJA2P/p47ozgz2JH6DHP
	yjJz94vZLQzSowpLKC7L5zVi+konz9kJY8cxUOdU3H+439JRn5F3JU9c2w==
X-Gm-Gg: ASbGnctHU8DkxhRtJd4JvMe9d047pnLlolLzFrUI9mK150UBrc1RZtJ5D/VAMzgn1o7
	r8yHKmx0RikVQhomL0TCfkpCZeK2T7gTsbcdaR7bner6NIAtqF+1z8PGfgJQFtgQLaS4lAJIgON
	zHb7+Q8ZzS+sPkhG2AYqj/vCZ6NN8eDxq2gIJfLx5/OHdQoM0H4Z1BWiAO6Fwt9TdLzqxGyg4uz
	AWXp65ddDEtPoTpSAyBBgwPL/xXrtjAbDb+DvAB3Nja1ab+SN8yrsEZ9jDnwkMlnOeArhMFgn6K
	Tg8fnPw3RkoICfN7qXCBl3V+puldmVwU/1rJXxc=
X-Google-Smtp-Source: AGHT+IEK7wPKqD7bdD6fEIug2TNPuzdneQNd9gg00GGADj4f7PRyJRj7WoNOSsfU2dsbyy/z9gLQig==
X-Received: by 2002:a05:6871:3a85:b0:2c1:4090:9263 with SMTP id 586e51a60fabf-2d0d5fc797fmr7765567fac.35.1744645668828;
        Mon, 14 Apr 2025 08:47:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::bf01])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d096cdadd3sm2414409fac.32.2025.04.14.08.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 08:47:47 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib: oe: cve_check: Mark variable flag dependencies
Date: Mon, 14 Apr 2025 09:47:44 -0600
Message-ID: <20250414154744.1452161-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 15:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214803

Marks CVE check functions which depend on non-constant variable flags as
depending on the variables. This allows changes in the flags to
correctly trigger a rebuild

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/cve_check.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 5c272ba4ff3..5ace3cf5533 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -153,6 +153,7 @@ def parse_cves_from_patch_file(patch_file):
     return cve_ids
 
 
+@bb.parse.vardeps("CVE_STATUS")
 def get_patched_cves(d):
     """
     Determines the CVE IDs that have been solved by either patches incuded within
@@ -289,6 +290,7 @@ def convert_cve_version(version):
 
     return version + update
 
+@bb.parse.vardeps("CVE_STATUS", "CVE_CHECK_STATUSMAP")
 def decode_cve_status(d, cve):
     """
     Convert CVE_STATUS into status, vendor, product, detail and description.
-- 
2.49.0


