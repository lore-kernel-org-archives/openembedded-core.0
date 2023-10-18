Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A386CDB483
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:48:47 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.285066.1697644125841995098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iEkVTvab;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-27cefb5ae1fso4203035a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697644125; x=1698248925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vA/lmQnpfNsroiRoF3tJzv7te+uxZQYYWfM/R/WMRDo=;
        b=iEkVTvabuPlbioLGocmcHld7EAugKzueI+Rj+Wvss5pZuwkVsRWaRhiYZ27dOx0G17
         aW5nFzTFAIEBYoDdW77eGFu9h/Q0hA/iVa5I7uXatFzee6LjOt+fAS2hQC7jSfMTX/BC
         cTstHbnJSyPVyovtIDMSsoo2CO+gsX2yCBkKPR9vl1o1aVXRDkfgLdFku/pdvIinVkFN
         EIe0ULKd5SQyAQ6q+nJ2H+54RGBfj87VRs3kCeK022z9Sduyw2vo93f7/P5H8SqQRkuT
         Swz//skKUKZ3Eha7zVeyht/A7XHzbu3/vSfae0BwN7oIF6lVZylhuZrMAei8QFiCicgb
         tANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697644125; x=1698248925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vA/lmQnpfNsroiRoF3tJzv7te+uxZQYYWfM/R/WMRDo=;
        b=LM223OJw6d19nHZQj3OeWdMZgED00lww/Bg4X68/DS+k74FswvN348IeIRJ7a3Ddrn
         m59fNOK12jyrPghKnAOvgpLSoS9v2Km3rOJjcsDMf07iyNhC/TdGEl+kBnYqGCqypB9B
         5be8NpuE8+Q2ehiX5g+yxQrqSIG3twAdTbOtMSQxGuwDgatoTSlcC6U0U4RvunLhP20J
         zqkF2GDWWVJkoJT9xIf4Sg0P379ZJ1rdL2JbbrpHM29fiAEn1c6WdMVvEaw2aVYFdwGH
         aHNolDG1Tja+SAvjiRwf8t+/gbWqveROIRjnFgpxyImEzMW0ycg97zSnSAbg9ZRWgRHe
         zhiQ==
X-Gm-Message-State: AOJu0Yzh4xzq4E4L/QJ010mFya9qTVhKVv/SI9nWh6mmUE0hMu/xp8HB
	QSSdevkUlAAerUPtRwijjK7aBYoKIyaQwrPBjoc=
X-Google-Smtp-Source: AGHT+IEIur22G9Ywz+G3HGayFVUD4sYq7Bt7GspnZqTQbvrZjHCtB9XcgYc3mSUK8DyAi08jQY3FWQ==
X-Received: by 2002:a17:90a:ab8c:b0:27d:bc2:7c6e with SMTP id n12-20020a17090aab8c00b0027d0bc27c6emr5422204pjq.20.1697644124851;
        Wed, 18 Oct 2023 08:48:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o14-20020a17090ab88e00b002636dfcc6f5sm43268pjr.3.2023.10.18.08.48.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:48:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/10] binutils: Fix CVE-2022-47011
Date: Wed, 18 Oct 2023 05:48:24 -1000
Message-Id: <5ff2e3c880705c2e920a4a61a5165810fadd7b84.1697642997.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697642997.git.steve@sakoman.com>
References: <cover.1697642997.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 15:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189404

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0028-CVE-2022-47011.patch        | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0028-CVE-2022-47011.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 125af13d74..c25b49f8b0 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -57,6 +57,7 @@ SRC_URI = "\
      file://0026-CVE-2023-1972.patch \
      file://0025-CVE-2023-25588.patch \
      file://0027-CVE-2022-47008.patch \
+     file://0028-CVE-2022-47011.patch \
      file://0029-CVE-2022-48065-1.patch \
      file://0029-CVE-2022-48065-2.patch \
      file://0029-CVE-2022-48065-3.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0028-CVE-2022-47011.patch b/meta/recipes-devtools/binutils/binutils/0028-CVE-2022-47011.patch
new file mode 100644
index 0000000000..73ae46e218
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0028-CVE-2022-47011.patch
@@ -0,0 +1,35 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 20 Jun 2022 01:09:13 +0000 (+0930)
+Subject: PR29261, memory leak in parse_stab_struct_fields
+X-Git-Tag: binutils-2_39~225
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=8a24927bc8dbf6beac2000593b21235c3796dc35
+
+PR29261, memory leak in parse_stab_struct_fields
+
+	PR 29261
+	* stabs.c (parse_stab_struct_fields): Free "fields" on failure path.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=8a24927bc8dbf6beac2000593b21235c3796dc35]
+
+CVE: CVE-2022-47011
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/binutils/stabs.c b/binutils/stabs.c
+index 796ff85b86a..bf3f578cbcc 100644
+--- a/binutils/stabs.c
++++ b/binutils/stabs.c
+@@ -2367,7 +2367,10 @@ parse_stab_struct_fields (void *dhandle,
+ 
+       if (! parse_stab_one_struct_field (dhandle, info, pp, p, fields + c,
+ 					 staticsp, p_end))
+-	return false;
++	{
++	  free (fields);
++	  return false;
++	}
+ 
+       ++c;
+     }
-- 
2.34.1


