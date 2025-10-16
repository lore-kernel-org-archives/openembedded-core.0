Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F2ACCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 20:45:34 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.850.1760647530031407894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 13:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XhT5MOUs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.44, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-87a092251eeso45261556d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 13:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760647528; x=1761252328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4EmoSiMut+Z3yTrN36tOPdmxOY5M4l3N3CdcqgMGE8=;
        b=XhT5MOUsxebcrKznpHK1Fdb4qDrUW20coK/8ufSVW64TftzqrDFf2nkQhisjxlyTjB
         Nin+2lJ94wL4yPHXdMB9UrTqgCe0zGVdUD4dRNzBHXDgDIqGxOcLNwhSBD4DMcFIaQpR
         sOh7lTThDFj6r5R3WVU+p29AFIjCH/bbAIkow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760647528; x=1761252328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4EmoSiMut+Z3yTrN36tOPdmxOY5M4l3N3CdcqgMGE8=;
        b=PW099Jit4xyf9m/EfkO0GdmA870JEVoERMUHnAhsb9p6hCfQBE3qF7FkHhC38rLIju
         2V5NYvFlmXvL3dWVoPmfzY7hjWsMM/g8tRUl2U64cx85r2AyVn2ocK4hrMDtauxFzN2w
         m8FAWLezi0EmCAqxSmnAVCF1bUX049vagun95vsDSFHLJdOBudQFW5/moz6nt7BMGH9S
         7JnEbrOx4unA4C9sXBJnhMA1I5MbbOxXi49RbHYLRcBLnJmO874AXZlJ8K2WwHqD8Enw
         PYUdERrtMH7yub7d+Z7cDhKvDtn61G9LU3/JXRDavrET6svvnyClS1ij3OGngHQA43GI
         8ZLQ==
X-Gm-Message-State: AOJu0YyWkxa4JeDR41TrattDEWxCQi/BeMcqMUTiDOty3q0t4UWYVIUj
	DAQGlPzfJwzoI3/BH2+XpuNC3g8y5VzbVCx4XAQWS6hULx5WSiEcp0GXl0FPqy2uKrBgoQF3oJT
	mMKz6WRu7AQ==
X-Gm-Gg: ASbGncsEW8xuydA44xmJpZsNQWmcGyvVN/WfrFicYXUpBasXhagUmlCKLOfSdrBul6y
	ay1nZmnetVzjFaUZBdevtYZCjywXJ6yLKc1CTKXX+DVZd2i6mFCFjuUv5QBgqCX4Obn+rHyv6cJ
	x7RxBjaDcX7HkqcuiGlT6BQOhmgPfalxkfPskcUnjsXIn9sKAhSuXDfqviVI1Yy37FC+0/Lashw
	rfG1U+HXCGp6K7cGnKhkpbCOv4tRrskaD0IkDAb596IrKGmmKPxor2V52G7bMCIvINxMZRyre4U
	FGwcOfvo342mSZcCHuzfcgDIUtOot+G1hqkbT86RwhSWfQy9glCPb6dyeEYP7gaiC7qbeyRc869
	rDoXPy9oMJreRgzVXFuM+lMWOy/JMEWorl/szHlX1x+VrQ87+v9JCCvG2q0dsaPdxJZ6xQlc9Br
	bk3L1egpYas9jZ+OxAEWZq8ZD9urLLALAt1stZdx2AA1135tu6TAiw9xuZbO4OhEcjYD6HHV7Q0
	rvIWw==
X-Google-Smtp-Source: AGHT+IF9IkdeXC6xXhCQbcrm2Ce6osoDqOGEa3Iepjbw6XDKhK9K1vGm/2gUIqHra5rUQ9Q2yFcJ0w==
X-Received: by 2002:ac8:6692:0:b0:4e8:9151:b743 with SMTP id d75a77b69052e-4e89151baaemr45266811cf.10.1760647528209;
        Thu, 16 Oct 2025 13:45:28 -0700 (PDT)
Received: from yoctolap.taild15c8.ts.net (static-23-234-86-38.cust.tzulo.com. [23.234.86.38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c78dsm47338076d6.41.2025.10.16.13.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:45:27 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH 1/1] meta/conf/distro/include/yocto-uninative.inc
Date: Thu, 16 Oct 2025 13:44:41 -0700
Message-ID: <20251016204441.51589-2-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016204441.51589-1-mhalstead@linuxfoundation.org>
References: <20251016204441.51589-1-mhalstead@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 20:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224983

yocto-uninative: Update to 5.0 for needed patchelf updates

Solves some segfaults on relocated qemu-img binaries.

[YOCTO #16003]

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 3ced03d477..e9dc6c8640 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.42"
-UNINATIVE_VERSION = "4.9"
+UNINATIVE_VERSION = "5.0"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "812045d826b7fda88944055e8526b95a5a9440bfef608d5b53fd52faab49bf85"
-UNINATIVE_CHECKSUM[i686] ?= "5cc28efd0c15a75de4bcb147c6cce65f1c1c9d442173a220f08427f40a3ffa09"
-UNINATIVE_CHECKSUM[x86_64] ?= "4c03d1ed2b7b4e823aca4a1a23d8f2e322f1770fc10e859adcede5777aff4f3a"
+UNINATIVE_CHECKSUM[aarch64] ?= "a25f2174d0cefcb22af005e9bc72ac01ae83b011c5b6d6d5bf00dac979877f76"
+UNINATIVE_CHECKSUM[i686] ?= "959cc2539b692f9b9862825c7324a0fe4d061fca742f6c259f67f581c59af956"
+UNINATIVE_CHECKSUM[x86_64] ?= "96045e8b1e242c8a849426a8506c7043f354b39f2bc0035192780e8205e23e9d"
-- 
2.51.0


