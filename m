Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id A2F877FAA5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 07:21:28 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id s7so4391842pjc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jan 2020 23:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZVwbOQhCFJsl10fRd+43xTxiriuPogGC90Kd+A+2VKc=;
	b=ZIifVbAbg7xHEEJ2HFbj50b+Il92Afkg3VlUANtgqiX2mWcMJpHDMaUKevIkN42qlM
	HbG1MPlJDvF3XTjBCrqgzPugyc+3MZO2UMCbn8Z/QtQLBZbJ6u/eSVyhDeklVezsRUlb
	YRGxuOXX9XlPW/CtDCAKhTr94YmHtTHfVZmfOkcd8UXI5QR5/dBoG2zFq3s+pTOgIi9k
	NC9k6QZ0y5HveKiXLRUpDrw/gxO7bKFDGX55nVePZAiZpp1g41fg3Ee7NlWwMbxfoRLE
	Fsc5CTwXo03Zknhqg/sxbTA8vwhzPmsmzsHmmbnSWRNLpFC2ONCeY7pAZbxqy8djF101
	66eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZVwbOQhCFJsl10fRd+43xTxiriuPogGC90Kd+A+2VKc=;
	b=IAQYmtPRNAbcY/CoGZB0IHHg7zULFNaAEfH6zxHj3SCOuyDsDIdgaTdIDMgzUQBQtP
	V/V4ppwFhXp7pyV05QQCtIV+JMNtT+jFma+zRE2rNySi4/W1/3jykEqfo+RrEGmqC3wV
	CziN3zEMYt7DhNUfdFzb9a6O5g+S0lOFXEMjzvZ9sUtXBeHuFCE5k55o5EQQO1pRPBUE
	D5v5ima9k4CQzLEqWTXdGK4vZqAoMjn9VxL2AdvxyC6m613+LHEg/V3xXpeEDH4WasA4
	7yjKMTA9jj35rlEO+MWc8HmcWgmDT5IWGiWH6n+ZRQ32TYZJKYBkWQs+tKr4uSMH9tCR
	Mj5w==
X-Gm-Message-State: APjAAAWBJ6bEvE38SBqGulYHLgQPxEbE9jzwsrwpQpFYcRUigJnV4nis
	+wZWZfYtwU1FwBPLBmGrjv2DAtniYkw=
X-Google-Smtp-Source: APXvYqw0dHPuWYDJzdO+j0zI6m0xBCBKlzuGOa+Gf3HeGT5nZKMn2BkcMW+s3VohsgfLQMRT13Oq1A==
X-Received: by 2002:a17:90a:a88d:: with SMTP id
	h13mr23947171pjq.55.1578036089520; 
	Thu, 02 Jan 2020 23:21:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	i66sm35163470pfg.85.2020.01.02.23.21.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 23:21:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jan 2020 23:21:22 -0800
Message-Id: <5c6e77fa2c33e38254395b6f315bd78b62c5c695.1578035913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578035913.git.raj.khem@gmail.com>
References: <cover.1578035913.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] musl: Build outside of source tree
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jan 2020 07:21:29 -0000
Content-Transfer-Encoding: 8bit

musl does not use cmake/autotools etc. but plane old makefile basded
build system, which means it does not get B defined to be outside S
therefore define B explicitly to be outside S

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 9aea2c39c8..e5cc869cb9 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -25,3 +25,5 @@ MIPS_INSTRUCTION_SET = "mips"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 ARM_INSTRUCTION_SET_armv4 = "arm"
 
+# Enable out of tree build
+B = "${WORKDIR}/build"
-- 
2.24.1


