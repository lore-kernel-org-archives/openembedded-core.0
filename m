Return-Path: <lukakrstic031@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F46CD66BA4
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 20:40:59 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24728.1766004056768798422
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 12:40:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l0E05vXb;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: lukakrstic031@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b72b495aa81so1088385666b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766004055; x=1766608855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RK3kHhVA/jQPhbC+3hfSsvY7m+DUI+/V+6dY+A6WK8=;
        b=l0E05vXbHFAAbYc+AxngCKgoTKIvqFcbCXe4QvkYAD7Pou2fdV8Sca3DEPjYku7rPK
         MG0d4+E/ci2t8czAsLp/XG4YJpOwx4bcAQFf1278hLCMQeF365/OIjxyxaiC+4nHW56E
         P0RRWiSeBG9lEzBZeG0IXN/uZQkM6tioGAcN0acPg60l30zSk1bOT8ky+qvV3jKH/6SE
         pU6sdle+U29SpvOv6eWoe/xT56tGJaxPqFuOy/X+EilEmyazTAxpQWnN2Zkin6so7xRU
         xCScKiFDdbmMHbpfCWqC7uVN8HGPs+TGIbHCCBQj5+yXX0yZnCroWp1hntfFn1Ziwr2v
         eFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766004055; x=1766608855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1RK3kHhVA/jQPhbC+3hfSsvY7m+DUI+/V+6dY+A6WK8=;
        b=wQLDUNWiTinMLHDsjzncGyzrSqR7JhRVkU4cXTgsmXUjT3xgw8u2hIraQCtPeEsXSe
         M6d0VunH6V1TOMoHNLwBNu3QL8vxbyHYWupsWT6hzerqN6tpIB6jm7mw8W1B92pnOfTN
         wMrTwDUFSfDpd5Tpld5dyg8WHhxUhutV2RDDfFgrf391Ks5zZTwVIRz7/Z6RpVH/UxFh
         iB7fe+U+PGnHi7wM6GBY7nYKb44CxGOMMzXcqdaWj/R47wrA9yJTk8hQ9mYkpHUKVorJ
         6TPWxOUlaK/sQ8kFpevuv1A1uNadVhC5f92c2s5BQhIe64cxHJ2Pg+wOK5/WZObIhoao
         Su7g==
X-Gm-Message-State: AOJu0Yzmcj6U07mI6Yzjmy1DyWKbpdo9rr6UL1aW0mcxUskEpacVB9Oc
	vT7MSTqAMjs1Fg6fnt4pq4tQfSwFajyDQn0MJt/dxbYQ5Njjk5w/skW1GmjXaA==
X-Gm-Gg: AY/fxX4VcfPQ20XXtGdmly5FyH0AUn/gePDIxQ/SIz1IYXusWmC4LDg7sJDonTj7W3y
	2kHLbds/lO9mlCWBpUMmLtEVJvkLHLQHF936+T2JX8PrC2MBAMRHblpmDMn5OTQY2GJdyBE7pG9
	dlKExEIvPQaQyXvIjaK8M5LM6HXlcHZHsT+8gKRW4NHFbAThu1rZFuU512xbrlKUx5xZh7kP09k
	GW7ez7ux349T044svp+WDV7yLRI/+N7k6Ct7YHhE4Mkh74eDV9brcYT1M+4dSKSuxHpJBV1UdmY
	qEtVxzMFv6uSMKUS5W5/Cb//22zv1PnKTxeUEQ6wfFFObh8/CRi5rCeEMI383wP3cM8l7RSBoVg
	y0wy6oauTpcGn3GtiV4TK8gA5rQImeGu5Oy3fm5u9DlhSv1EtrAd/lURXfWOd40FISOSS7UKRhu
	kmvTGtGEDym6tvmR0OW1zVkGzwPYTXSq4j4RXmYRyrmIngzpEOSdENINodlbWBFC2RyCZr0KcmA
	LSLaw==
X-Google-Smtp-Source: AGHT+IEV6gIIJ+dw19lNuNkp8DctsBHkowsk5jrPp6dLigvKcuTrNHNULzmierr9OfRiYTWNxTeXgg==
X-Received: by 2002:a17:907:2d1f:b0:b73:58a0:e064 with SMTP id a640c23a62f3a-b7d23b884admr2067540066b.50.1766004054680;
        Wed, 17 Dec 2025 12:40:54 -0800 (PST)
Received: from lukak-ThinkBook-15-G2-ITL.. (178-223-29-172.dynamic.isp.telekom.rs. [178.223.29.172])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80230d3779sm21259166b.20.2025.12.17.12.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 12:40:54 -0800 (PST)
From: Luka Krstic <lukakrstic031@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Luka Krstic <lukakrstic031@gmail.com>
Subject: [PATCH v2] patchtest: reject Upstream-Status after scissors
Date: Wed, 17 Dec 2025 21:26:07 +0100
Message-ID: <20251217204031.3022279-2-lukakrstic031@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217204031.3022279-1-lukakrstic031@gmail.com>
References: <DF0HJNZXHLW4.2ZJNCZUGHYZ9F@bootlin.com>
 <20251217204031.3022279-1-lukakrstic031@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 20:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228075

Upstream-Status must be placed in the patch header before the
scissors line. patchtest currently accepts tags that appear
only after the scissors, which means the tag is lost when the
patch is refreshed by git or devtool.

Update test_upstream_status_presence_format() to distinguish
between tags in the header and tags after the scissors, and
reject the latter.

Fixes: [YOCTO #15940]
Signed-off-by: Luka Krstic <lukakrstic031@gmail.com>
---
 meta/lib/patchtest/tests/test_patch.py | 153 ++++++++++++++++---------
 1 file changed, 99 insertions(+), 54 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index d08b8a5019..3b33b5a199 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -45,62 +45,107 @@ class TestPatch(base.Base):
 
         for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
-            if not patchtest_patterns.upstream_status_regex.search_string(payload):
-                self.fail(
-                    "Added patch file is missing Upstream-Status: <Valid status> in the commit message",
-                    data=[
-                        ("Standard format", self.standard_format),
-                        ("Valid status", self.valid_status),
-                    ],
-                )
-            for line in payload.splitlines():
+            lines = payload.splitlines()
+
+            scissors_index = None
+            for idx, line in enumerate(lines):
+                if line.lstrip("+") == "---":
+                    scissors_index = idx
+                    break
+
+            header_has_upstream = False
+            body_has_upstream = False
+
+            for idx, line in enumerate(lines):
+                if not patchtest_patterns.upstream_status_regex.search_string(line):
+                    continue
+
+                if scissors_index is not None and idx > scissors_index:
+                    body_has_upstream = True
+                else:
+                    header_has_upstream = True
+
+            if not header_has_upstream:
+                if body_has_upstream:
+                    self.fail(
+                        'Upstream-Status is present only after the patch scissors. '
+                        "It must be placed in the patch header before the scissors line.",
+                        data=[
+                            ("Standard format", self.standard_format),
+                            ("Valid status", self.valid_status),
+                        ],
+                    )
+                else:
+                    self.fail(
+                        "Added patch file is missing Upstream-Status: <Valid status> in the commit message",
+                        data=[
+                            ("Standard format", self.standard_format),
+                            ("Valid status", self.valid_status),
+                        ],
+                    )
+
+            for idx, line in enumerate(lines):
                 if patchtest_patterns.patchmetadata_regex.match(line):
                     continue
-                if patchtest_patterns.upstream_status_regex.search_string(line):
-                    if patchtest_patterns.inappropriate.searchString(line):
-                        try:
-                            patchtest_patterns.upstream_status_inappropriate_info.parseString(
-                                line.lstrip("+")
-                            )
-                        except pyparsing.ParseException as pe:
-                            self.fail(
-                                "Upstream-Status is Inappropriate, but no reason was provided",
-                                data=[
-                                    ("Current", pe.pstr),
-                                    (
-                                        "Standard format",
-                                        "Upstream-Status: Inappropriate [reason]",
-                                    ),
-                                ],
-                            )
-                    elif patchtest_patterns.submitted.searchString(line):
-                        try:
-                            patchtest_patterns.upstream_status_submitted_info.parseString(
-                                line.lstrip("+")
-                            )
-                        except pyparsing.ParseException as pe:
-                            self.fail(
-                                "Upstream-Status is Submitted, but it is not mentioned where",
-                                data=[
-                                    ("Current", pe.pstr),
-                                    (
-                                        "Standard format",
-                                        "Upstream-Status: Submitted [where]",
-                                    ),
-                                ],
-                            )
-                    else:
-                        try:
-                            patchtest_patterns.upstream_status.parseString(line.lstrip("+"))
-                        except pyparsing.ParseException as pe:
-                            self.fail(
-                                "Upstream-Status is in incorrect format",
-                                data=[
-                                    ("Current", pe.pstr),
-                                    ("Standard format", self.standard_format),
-                                    ("Valid status", self.valid_status),
-                                ],
-                            )
+
+                if not patchtest_patterns.upstream_status_regex.search_string(line):
+                    continue
+
+                if scissors_index is not None and idx > scissors_index:
+                    self.fail(
+                        'Upstream-Status must be placed in the patch header before the scissors line, '
+                        "but was found afterwards.",
+                        data=[
+                            ("Current", line.lstrip("+")),
+                            ("Standard format", self.standard_format),
+                            ("Valid status", self.valid_status),
+                        ],
+                    )
+
+                if patchtest_patterns.inappropriate.searchString(line):
+                    try:
+                        patchtest_patterns.upstream_status_inappropriate_info.parseString(
+                            line.lstrip("+")
+                        )
+                    except pyparsing.ParseException as pe:
+                        self.fail(
+                            "Upstream-Status is Inappropriate, but no reason was provided",
+                            data=[
+                                ("Current", pe.pstr),
+                                (
+                                    "Standard format",
+                                    "Upstream-Status: Inappropriate [reason]",
+                                ),
+                            ],
+                        )
+                elif patchtest_patterns.submitted.searchString(line):
+                    try:
+                        patchtest_patterns.upstream_status_submitted_info.parseString(
+                            line.lstrip("+")
+                        )
+                    except pyparsing.ParseException as pe:
+                        self.fail(
+                            "Upstream-Status is Submitted, but it is not mentioned where",
+                            data=[
+                                ("Current", pe.pstr),
+                                (
+                                    "Standard format",
+                                    "Upstream-Status: Submitted [where]",
+                                ),
+                            ],
+                        )
+                else:
+                    try:
+                        patchtest_patterns.upstream_status.parseString(line.lstrip("+"))
+                    except pyparsing.ParseException as pe:
+                        self.fail(
+                            "Upstream-Status is in incorrect format",
+                            data=[
+                                ("Current", pe.pstr),
+                                ("Standard format", self.standard_format),
+                                ("Valid status", self.valid_status),
+                            ],
+                        )
 
     def test_signed_off_by_presence(self):
         if not TestPatch.newpatches:
-- 
2.43.0


