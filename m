Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFD7C369BD
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 20:52:38 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.4857.1744750356592044010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 13:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jMlhNWB5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c277331eso51643b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744750356; x=1745355156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXieEfS+8UMNLWsbwn0dr/sD3mK+Sj9teizFx6Ol4aw=;
        b=jMlhNWB58ItCAjYATZxvsXWNY0hkDlK4Qb7HYbTd7/p83muu/AJl7GkZPGr1vacab2
         XBUp3WvKFieJtYs05G5ajl3gMiP/yaWPIIoPlWAH5L9L67IWmEGR4AaHYT2OnKm0JVYn
         jDQNubrsWCMAH6ZGIh+IsRqBlhlm8uQf22SSEmUO0AluOJirx1dkTaKMJQqvk4ErLqiD
         WKrurDc6Kp4Kav9HxEMdO57uUM3K4jeelD0oyr7ufQYyeQNYUYkiAZSNFKue9ZdVwNOn
         fsMj+2UqQO8oh4997qg6zdyy0Q2vEYgdURANCazBaP3nQkjd/3jMfHpF/ng9YnYpsOwt
         0grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744750356; x=1745355156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXieEfS+8UMNLWsbwn0dr/sD3mK+Sj9teizFx6Ol4aw=;
        b=tuSyeJTZUMYcnXqEOZpeXpxidI1q/TDrHM72nvgKMxfO/e2WRxxZ6C165gQ+r7KZRL
         b8eo92EsPxYRKWcnPPy8rHyMrj6cJnAiao3h/H/Md9yK/UgxNTapFmR1AI7Eplkbrm7t
         vB8b5JP2oWrRG72JfL6rgMJbWSKvz0gGi1XrP5kW0kosh4rc5CnfflVqKVhzv41EexLa
         vX0FnPEtghL7Ur8/2PyVIS0+PDzadz+vXA2zhUSfAXek06GK5GCAi1UaERT/fXy7O1e+
         rjLkm1XtqiRRy7W6mNr+EFfJ68yB4Y6VSOu/RMnTnRyWgUXW8b0tJfserIt4jCEunfRt
         9peg==
X-Gm-Message-State: AOJu0YzCkeiMOGKrJxws0AoV0prmtF2aHVMHQlyrIfzj6ifc4R12sS+n
	OZtIfsNmyx9jvIQkMCS7OMBAxC4/Jq+sDaMrPSKRGI6bG+wi21TbfmR1EWQpOUWaQup0Qn3XUUS
	a
X-Gm-Gg: ASbGncsPjl6OJ4RmGsJUb3hsUuMBEtRpgIgXTkaUXxPBwa+IROcuNRRfADgj+1tD8JX
	QgHNoAgovb/omFK7YQMr6cx+K++RASguDe1Vtdp9i95+of1ZrKFtxv9PdYYEJgrAAWFrWCfGO4c
	BLj9LT4hdYd35zXvfcw6EHddGELJBjKuCJiz+LlKrV2MVjiCTUNOp4u6d6LhgmGcmMOkBcCOEW7
	MNm2RvvcpFp7i8oa3aZGQbjeT7tuKpATG+hkOYemV2eT/XWq8prwWfsjFc8SV/LV8wIrLfyVnDK
	qEj9DB7M5SaXp9UdrB/vMu748UMoEIsF
X-Google-Smtp-Source: AGHT+IHnOrXLLwv+USVBNb2MDBAI2v4rRhOhgBiJjRXQIn6eRWuNppcwWWzlKr4eENPAnTzLU9XWJA==
X-Received: by 2002:a05:6a21:107:b0:1fd:f4df:ab67 with SMTP id adf61e73a8af0-203acb7139fmr1238361637.21.1744750355687;
        Tue, 15 Apr 2025 13:52:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6144:9704:3eb2:ee31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd23332a3sm8978307b3a.161.2025.04.15.13.52.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 13:52:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/4] systemd: ignore CVEs which reappeared after upgrade to 250.14
Date: Tue, 15 Apr 2025 13:52:23 -0700
Message-ID: <b86129da823c55a3e08ee72c99675301948949f8.1744750227.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744750227.git.steve@sakoman.com>
References: <cover.1744750227.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 20:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214969

From: Peter Marko <peter.marko@siemens.com>

Upgrade from 250.5 to 250.14 removed patches for these CVEs because they
were interated in the new version.
However NVD DB does not contain information about these backports to
v250 branch, so they need to be ignored.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 86ae4793c3..70ba1d1f77 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -19,3 +19,6 @@ SRCBRANCH = "v250-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
+
+# cpe-stable-backport: patches were backported to v250 stable branch
+CVE_CHECK_IGNORE += "CVE-2022-3821 CVE-2022-4415 CVE-2022-45873"
-- 
2.43.0


