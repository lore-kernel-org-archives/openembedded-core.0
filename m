Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E73CA0ED1
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 22:56:38 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.609.1755557789365841938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 15:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nYjIEC+p;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7acfde3so642987566b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 15:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755557788; x=1756162588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r8moIYpXhI4gNLsywxkoV4qc5OTVHT2tquPAySFn4oc=;
        b=nYjIEC+pZYYXMfuA9Urtdkgpms6Ds56AP2iCed53Lrhdzobx43zCbeQu6W6uB/SN3J
         mnzY+0nnJ26u4wO74Q2Cq/HDhn3SWcVimOxlX9C1M5GvwANIeIMwGTYsw0oJbdaB35WE
         dk98mEbpD3L/JMOYqYiWPdECShYSxT0bhAgUC224YAjs2y14MWzCoCpFmDjuRmp6TFcI
         5m9plh+SdPqvat8JjRt6VghMfRIbUeQMY61GSK4tY8LJJzd6vKXiKuYLj40bVlUZQVsF
         75oeLMl12M1RilyHZlJbd9uBDnd7eSsGVnraVWxWFwVQtUi3NDfA4UjpOrlOT4LmIHwN
         IeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755557788; x=1756162588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8moIYpXhI4gNLsywxkoV4qc5OTVHT2tquPAySFn4oc=;
        b=s4Ab/t5Q2uOL2ykDBUF8+t9e1JZ1DMUltKfNqUOhGy7TnpHorm1H6yAkiTehHY3M4H
         d9ozpSCh3O4BUTboL4C6fcWeab1IsIVtPcztgHGNmFz4bn4X+Hwiu5n4EpONTPnnQjI7
         R85eeMhm+ordc9mCsr6e3Ui7X53agZaPR3Ye3YkpzbEP7HUBIhKOCZDXlQYpzP1F2n19
         PpsaNSeCQCOrw1PcsIgr7DmcrUcmBJKrUnxwHBXAuhjZ2NIQur/hFfv7YHhz1EKkPlVc
         wGmXRMcoyBE5YMzXrFBf41fdIBujidPAYthFFm6uFrtx3JIPqHyMI3NJf43NIo0WjEz/
         o9WA==
X-Gm-Message-State: AOJu0YzP7D7BWWiZobCm/i1+oHizNDVwaa0QwHp4YwYQGnA1cQMvktoB
	28d7lNnt4LfO9HKMK+JAoRcHAAKq8BFOQhBDU8LPKnZqJ9UBQ5FpfrnKHgdQ79zitVc=
X-Gm-Gg: ASbGnctT7XJ8/M8rnNmtC/eFa6r5G8jxLzsYHeF+NjVgLKFAEaDij/v5SBLldbHVoSX
	EmgsG/S0WW5fWtX9BLtydof2HmFcPwkyUSe9kIPzIL9sI8U87e9za63RuzCoyoe8P8pwNNgDXdO
	7YJh3nGRsRDX00g2YYOua9mPUsS7fRqmQSnA1xT+FszF75HU7OkFggPI+uBli5+fxBe8b+H58TV
	4nnJX+iKnP50e1KBPB7o/HmOnqPGMJxsG0FqVCz/s/BeMyda9huK7Uaz77Lx+La3UnVd7aCXll4
	gKR4bi4sCfn4XuNkGMlTLcnD/2RPoZBHc4/csrzFpPJ5sbKRwNvXFGAnOVSztf8DbSZRiqLnlv4
	MunBm5T8474NtFf1KjB0xoQz0p7L7L9i7rZ3Lj7RLzo354pvYQMxjrFGmMqBS7Osv0lUyLrAQeo
	97mv7/6+xxVoT7bzcs2H22UphIk1m3Dq1BERwbOQ==
X-Google-Smtp-Source: AGHT+IE0hgPjg5tOy5ugNMum5kYR+DKelQX0eDwAkPaVbHLLKp1WIeZs+mEwbNfrXMj9U2OxmC/P1w==
X-Received: by 2002:a17:906:6a25:b0:ae3:c6a3:f855 with SMTP id a640c23a62f3a-afddcfbd7dbmr39792066b.31.1755557787372;
        Mon, 18 Aug 2025 15:56:27 -0700 (PDT)
Received: from DESKTOP-RK42V0R.localdomain (ipservice-092-210-202-008.092.210.pools.vodafone-ip.de. [92.210.202.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a755ff4e0sm594284a12.20.2025.08.18.15.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 15:56:25 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] init-system-helpers: upgrade 1.68 -> 1.69
Date: Tue, 19 Aug 2025 00:56:22 +0200
Message-ID: <20250818225622.1057866-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 22:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222054

Changes:
Add postinst to hotfix an upgrade bug on certain newly live-installed
systems built using Trixie's live-build (Closes: #1111039)

full changelog:
https://salsa.debian.org/debian/init-system-helpers/-/blob/debian/1.69/debian/changelog

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 ...{init-system-helpers_1.68.bb => init-system-helpers_1.69.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/initscripts/{init-system-helpers_1.68.bb => init-system-helpers_1.69.bb} (96%)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.68.bb b/meta/recipes-core/initscripts/init-system-helpers_1.69.bb
similarity index 96%
rename from meta/recipes-core/initscripts/init-system-helpers_1.68.bb
rename to meta/recipes-core/initscripts/init-system-helpers_1.69.bb
index 48ac7792d3..83320e6877 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.68.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.69.bb
@@ -16,7 +16,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=c4ec20aa158fa9de26ee1accf78dcaae"
 
-SRCREV = "78486a4a2a305170b66ce4d907bedadbaed10daf"
+SRCREV = "592518fcedf96c9b763f214a9acbdc1109aaa385"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))(?!_exp)"
 
-- 
2.43.0


