Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B778DC87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 18:57:54 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.33167.1754506668371706812
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 11:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U4sy+NJR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.174, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b0770954faso3532601cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 11:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754506666; x=1755111466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uC5lbmx40/XaB+QOpPvu1TS9COFHNGB2sIxj7Y9x1F8=;
        b=U4sy+NJRsBTnCllF3/sq3L2mPLsojNSf0qk5GU2682NkJbtjDRefB5Rv96xcFByHaf
         4CpZsvyKznndmKFM2Ral13JZVFLEe8FbHgQvzNsP1W7llk6w0BR8tRBGuqHquagj+9Cy
         ZTWgy3c9U3P0ELN6m2bBWDDytQ0cRQIJ66f5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754506666; x=1755111466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uC5lbmx40/XaB+QOpPvu1TS9COFHNGB2sIxj7Y9x1F8=;
        b=UQxNvIagr0wyCLBKLoPD4LPg1HXI+cb6VJgcIedUkxynAiXJg4qqOZN3QCdmoeBph0
         Tmox1FRXYbbup67Y59Onc6REKndeM0zVkzbP5wW6Ic0gNFKwM1mpvieNnBF/mIWejMn6
         HcZW1csRbOxuVxDHABCCKa1HUdy4auM/YPz2HAHgpaxmN6QVABbue31y4GlHK4NnA/G5
         VYm8xhKJW2RlluUI/j2U6cvi85htqzpVUeLO6IYJqKGkdZjCAuMMxTuUi7W+f/cvBLkp
         KNYGzVjs/ZHbZLr285RRzMfzgTXu2VUhrlGCZ4Aibk3xGWnmfo61NXEIpcFnWVSSKWX2
         dEdw==
X-Gm-Message-State: AOJu0YxigktDtDAtwpYEhoPsmP+jJXmD+HvAcY0wO7KmfJQGnlcu+wX2
	PE9HPB3+zr4wMlqCN/UKWID/6ylQ/yCNvbNa5/Ucl9fg71gADcMZgrUppHSldL9loGFnQKrK5jj
	um4YD
X-Gm-Gg: ASbGnctca8NLrw0P//3fR2I/SztGVfT6xENXbSC5jnG3itqoCaS5326xBDsvoJyqX8q
	RNiFSPvfcjgwXxtXtIKw1DO2Zh8ICadkTbdGXVHWwSNn29nlhL28mBg7HZrAzQMnPTL46MtXZTa
	wjJv6xMrUPsB6eIYS2iPzOslB3dBb9VbYo9HvAvarL9S4UkB1yJYL1Rzu5PTzOG/aTpUUxKiwZq
	M0CDJxQFOAHxsVPzJxmWJKyz4+32xbT7qPu/wRzAZ6QfBD6pxMqjVRHprpsVPGfX9u4KDjIuNgH
	4xMb+91LtnKWU6F4SzkZGKzzaM4QZvndiKYYcSyAOQQMNkhaqeVF3rXiC3gy8nz8CeswFA4TG+3
	NfZ6fppZ6Evz2F4wXgSraOjtFXYnHJJMBn+wbRl7k9JvPm9mjDwXf4rKt+9u5b+/uf0tinWgWnL
	LgY/Q=
X-Google-Smtp-Source: AGHT+IFkYnoDVJEKeTsGG4O2dKS9Q1j6KsVn93IDx8j1LVwZ/oUSkSorE65Uze+eY+ES4xCyDNjNAA==
X-Received: by 2002:ac8:7fd4:0:b0:4b0:677f:db03 with SMTP id d75a77b69052e-4b0913405f4mr47574111cf.15.1754506666398;
        Wed, 06 Aug 2025 11:57:46 -0700 (PDT)
Received: from yoctolap (static-23-234-102-24.cust.tzulo.com. [23.234.102.24])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b069ca56e5sm42048241cf.40.2025.08.06.11.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 11:57:45 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH 1/1] yocto-uninative: Update to 4.9 for glibc 2.42
Date: Wed,  6 Aug 2025 11:57:18 -0700
Message-ID: <20250806185718.20832-2-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806185718.20832-1-mhalstead@linuxfoundation.org>
References: <20250806185718.20832-1-mhalstead@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 18:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221549

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index dabd604e8e..3ced03d477 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.41"
-UNINATIVE_VERSION = "4.8"
+UNINATIVE_MAXGLIBCVERSION = "2.42"
+UNINATIVE_VERSION = "4.9"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "0d75ae3cc6e8245be40f55d48612285248ad331896ca3f4c772ed2fb34239fcf"
-UNINATIVE_CHECKSUM[i686] ?= "2cbfd7ad3e1362538764999dd4962eb2511211867ae17a327b65631f64f38e31"
-UNINATIVE_CHECKSUM[x86_64] ?= "6d5e28258176c52b9eecf882d4553033fa700902e60ba80d4b7ce0edacbe41d6"
+UNINATIVE_CHECKSUM[aarch64] ?= "812045d826b7fda88944055e8526b95a5a9440bfef608d5b53fd52faab49bf85"
+UNINATIVE_CHECKSUM[i686] ?= "5cc28efd0c15a75de4bcb147c6cce65f1c1c9d442173a220f08427f40a3ffa09"
+UNINATIVE_CHECKSUM[x86_64] ?= "4c03d1ed2b7b4e823aca4a1a23d8f2e322f1770fc10e859adcede5777aff4f3a"
-- 
2.50.1


