Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97215C44512
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:20 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1646.1784055858372857402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gjGvVH40;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6a17e36fa79so1636673eaf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055857; x=1784660657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAxoTOlb6J/TqJBMSDiqpNZCBSPZ/ATNUtknjN0pHbI=;
        b=gjGvVH40mJtO0lMTghKM4hPDf2n8IX5/j8UUxd1ylvF6vb0ZRLi+O8UF8ffBAcygz/
         CUVt+gBIliliTf3LtNL+2tluP1d4U+vQ6dJmIaJnLX6JbNg/7NedgnQk7f/JEoJxfYoE
         97jw7ehaSP81i4rSg9/v0tJE2vrWci6lHjN+p+99jNvmZAx8UYunNLkhJzcFpm1pdwge
         R9kybSbgK0z16s3aKxX7IaRYR+XkwTWuX05JAP+BPIKa3b59pXQW3/g2pWxndbti9huY
         1rqjlCNT7StQ4uzQrTiTRF8y02xaIW1CLXvMTiRP/y6SdTgEuJxnHz+Sgx90sJrRDZEc
         /JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055857; x=1784660657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cAxoTOlb6J/TqJBMSDiqpNZCBSPZ/ATNUtknjN0pHbI=;
        b=tE3LsDybm4zGwau0YqUhIAYo06YVTlPW4MfFMPxZ9rtW+WvlWXntEVmF0Llzmu2gR3
         H/3rZjgq42vivgfvDGghMXLB+dg/MhdlfrVC9C9mNy2qeR+yyZNOtwZ4tgU2koyEQFDu
         dv/QvVUY1gCoa5Kf+3hXwsOJ0dJvN1oK8cw5j3r8LocH7fwlWf5eehXyJn4lkxfLFIiR
         7KLp3+GT54Ph0xj95xNRWBV9YMwgIYHugTm0yBqThujE6RIWnIonGPZzUop9yqv5+ftj
         zJAXtUDuXyc11IndAfoK0DKchnRBWsK4fu7Ao0Z+uYpovhLf8NwnT0d3YMnAApphjyvm
         PLxw==
X-Gm-Message-State: AOJu0YyqLa5gQigGpWvQ9iSQ6Cgn9Z9or/lIimJp3vjMPM4IZIno3TUY
	XxxymhBNhS1bOwxAG6QTjhkuqOi3MRtlzkA4GxiI5zDUWB3vmNkQXTRBnYbVyg==
X-Gm-Gg: AfdE7clKJGTcvXNPmfU9YC1wBnSXTfCmDiqs6bhceSLMPi5YmP8y5rel6pUGe8LPB0J
	Mpqshzw2L+I+e/ots9rB8dWljqGyOVEsR9imxGS77f51clsJSdqxDoO5gbPEo9AhJKxiBr6QQMA
	p8c74tmAcjKLZSVj3JR2PW5KcPXabTItJV/MOZDlGrugTCD+sRzTIkU8uUUyhNNfhiRtQAvPAEQ
	E9rLfiPBiH0CMW/R+ceTeOXwyRME3nx/Fm2k6NHN3QmeC+Nb59NiKBLklYR2hE5NmZtdSEINntO
	dPeigl/8xTMCMUogUk9flRGbJgY7HGWA6F6NSyX8dGOS6vkhozR+301ItiWtma9/mH9VQ6iqw+g
	gZIvnMdlnhBQbtumJ8dhRwTiOIYKAIfcfuPuFfuB5do/wUKvxbFWr6NViah1sjZJDFqRNg/fWGx
	1vSDR7Xxs5mA==
X-Received: by 2002:a05:6820:81c2:b0:6a3:74cf:5f93 with SMTP id 006d021491bc7-6a3cb6898f8mr1998588eaf.0.1784055857497;
        Tue, 14 Jul 2026 12:04:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:17 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 11/22] autoconf-archive: Replace deprecated SPDX identifier
Date: Tue, 14 Jul 2026 12:31:21 -0600
Message-ID: <20260714190405.3328796-12-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240919

GPL-3.0-with-autoconf-exception is deprecated. Replace it with
"GPL-3.0-or-later WITH Autoconf-exception-3.0"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../autoconf-archive/autoconf-archive_2024.10.16.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb
index 46d1b91d65..c243d632c3 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb
@@ -1,7 +1,7 @@
 SUMMARY = "a collection of freely re-usable Autoconf macros"
 HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
 SECTION = "devel"
-LICENSE = "GPL-3.0-with-autoconf-exception"
+LICENSE = "GPL-3.0-or-later WITH Autoconf-exception-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
     file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
 
-- 
2.54.0


