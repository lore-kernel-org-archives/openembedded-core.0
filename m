Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9AFCD98F0
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:48 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5786.1781637405378465837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GFiTYbCW;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso1748885e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637403; x=1782242203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmLVIMvXod71qHAK6ybseDRNPe8rimZIPKiJDc1GEbA=;
        b=GFiTYbCWrI/EGR8AWDo8y261mF9w3UO9sgOCyvin8MbZaX2TT/Bvf6XZqa45mFHEW+
         2FMRmaB6oTWQ4KX9e9kJpcGrHQ59xmhhHD9lHqFly11fU6ynqTDZM1O1U/yD0hcJ2kBG
         hC4deID+uwy7MwTjTvAZghUxXCDniftILhVitmZ3qHCgHR0xQ9AJ9V/9IlOET4B5L7iJ
         Abs5M51iGpl/OhduKlTh0vURDG0W/BLvttOrYBZPIhZGp8i3GnB2cVvEVtQWDRvuovab
         6y1HNYul0iLu16awmKCR2Srqsj6eEjWB7Vyo6jZ2WBjkUcEoXCW3a87GJ9W1qwPIaXf1
         0RKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637403; x=1782242203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JmLVIMvXod71qHAK6ybseDRNPe8rimZIPKiJDc1GEbA=;
        b=F8B8/cN2ha3JDQ78zNBtFeNSLbo4a4gYeK7Jn6epAD3xMWLPiMaDJ+PVbovmCPqbZK
         Pl9MsBmnhVhjfjXAXjj19KPBMwpckWmRAz51aESFkDOI63nCxP0W5CpIjf5AXvifUJ8z
         4gmSKKusNbJLk7b51QZiJpkNAVK/h9l8EUXs6LHnrvczFqNwA2H89QzYASMXO4ZEVLeq
         Oq4O/dnjQkG9UUtHf+0ehTNsVx8antt73W7iqt34aAyqq8CXWKZsFXmdEdP3qVoVEqMw
         UnSuiYjNLL8lEhXjAKCs1i11Bw6uDVlOdJqXF2FHiYBoIhlKJnpfzkUID161AC0j523Q
         5rPw==
X-Gm-Message-State: AOJu0YzSNOUBtWKGtNdyUrKwI5El4h2shL+decEclkJ6dj+FQmC5erL1
	tDWaFvZbCLqf0iUfjtR85aSdP4UY7krXZXefgSBiB1m7/twu9Q+P4rYUMl4wqtHE
X-Gm-Gg: Acq92OGUC8u2A8EM8DrV3YF1JCTZCSv0EN5+0q9F5kx2JsT+LaF4lxIyHN64t+RzCxk
	OohmMucIYS4M6gD6JroFqptqjlRZnL7lvvXKV0n+44JedsbwNovFvCSuznlqpdE/SxvLrY9bUz+
	gVmjo/qredPdi02OMeLeb99UMosMZ39LaeI4Am1leZkOnqriFSqTzFAmP3v3slFgyKEU0ZhxX/4
	tIs8Vniz4RQLlSU8596GpR2URYTL1e8B9RV0/9TWwcWIMVEZqy4uq5T2/rg9HtH81D6BbCQZ4FE
	YOMKIv+xm1KrhFHTlTB/uLF9As1favr1m81Vnt4cLOL9YCRpyTF/g9w5bn+S/FtcXzjYFmzs8dh
	EI8s6n8LDvIIuB8u5Btg+Nj8Gzm5LPtmtPqtfRMn/xUbzUjEzED1Q6YPWINOlnWX4YQFsWqeb/t
	b/63zAeFBqkCFS9vP/E6flQYsRSZYhNaJkC9w72zfcE48B82ZqzsVisFbpSRA=
X-Received: by 2002:a05:600c:34c9:b0:490:b4a8:e031 with SMTP id 5b1f17b1804b1-492340bc986mr926075e9.4.1781637403399;
        Tue, 16 Jun 2026 12:16:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/30] libslirp: upgrade 4.9.1 -> 4.9.3
Date: Tue, 16 Jun 2026 21:16:07 +0200
Message-ID: <20260616191628.2014553-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238936

From: Alexander Kanavin <alex@linutronix.de>

License-Update: license moved to a separate file
https://gitlab.com/qemu-project/libslirp/-/commit/d6cfac6d060d57c0e38a9c61157eaf6962b6c257

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../slirp/{libslirp_4.9.1.bb => libslirp_4.9.3.bb}           | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.1.bb => libslirp_4.9.3.bb} (70%)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
similarity index 70%
rename from meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
index 50577fd4ae..734e59a59b 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
@@ -2,10 +2,11 @@ SUMMARY = "A general purpose TCP-IP emulator"
 DESCRIPTION = "A general purpose TCP-IP emulator used by virtual machine hypervisors to provide virtual networking services."
 HOMEPAGE = "https://gitlab.freedesktop.org/slirp/libslirp"
 LICENSE = "BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95a9bf4a7e411164fe843697ccda59e \
+                    file://LICENSE;md5=cfea6044642fd63b90ce9d79f5db64d9"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
-SRCREV = "9c744e1e52aa0d9646ed91d789d588696292c21e"
+SRCREV = "dd76415fce457e319d665eb8210d05c5731360ba"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0"
-- 
2.47.3


