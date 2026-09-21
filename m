Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B22C982E6
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 14:58:50 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50864.1790002723628562449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 07:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XG9mU+u1;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so2118065f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790002722; x=1790607522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pm4MnKYT3PEtkN0de0iEZXSh4g9RtZFRU16eS4LswUs=;
        b=XG9mU+u1Y1UE/2JaGpg7ibuQ+IpmRqdpzq537sLNLro9sxk6F+BeAe0Z/jdgU46ZXv
         T+SSBthXTE4A57Y5F/uXcigNucz1jpEnlSGCLuN30wPdBo2hC351or3oNj3L+V60peXJ
         BIM7m2LWVvmOMc9ibvjFwQyq8MGKt5ctIYRYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002722; x=1790607522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pm4MnKYT3PEtkN0de0iEZXSh4g9RtZFRU16eS4LswUs=;
        b=L3fk+x8QL4yke3pmOl9bIvsSH7dxngujQfKFI6EFNaNllwOFUytsOJwnho5x8fucFF
         u8tB4Jbd3+4MIbf3RophSeWNfG3cfc0xEQNgpE99KGvVjL0nqH9StydQwa7Cffua6trl
         UYeX++vyNisYuvzMcEmBZBDX6g0rm8cLPYjhxKHtTDj5FakpEdGwxx6KF2i9U/N5+c4D
         iYA2T6SxUV/RlOtv91RMrqtMGWKeezYZkkd8eqq5Jkl9/nTOagDdOioRAKEs5ATrksow
         cdfMlh+0HOGygiajSIT0a5grdThoNVDTqWrTwfeJejuwVuydt85bBf13SdKhX+v5SLod
         xLDg==
X-Gm-Message-State: AFuF++mTk6vsSO27iy+f9cOiOe6944t1FBaxTSiFk92L/KfZzSBQEtjS
	c/cEqZC72Aq5xXMi17dvCMgcwkEZR/TmkEDIfhE0ja8QbCTxxJNPNXHxHroXKD7sBDkgOzpO1KO
	qJhtpwnU=
X-Gm-Gg: AYBFou3Y4K9PYDFygt9YmaqVHoZlrE/7RJ8wJsnD5IPTNL8sBnTeEOZNuzrLzLKab1Z
	mq6EaNu4BpI9IC7TH+wcFKFvTrUsOX41w5GTd995lzWn5sWNivZ8DNOav50opiTPqA1rZQclXxh
	o9CleD2HYzz3YwYzh/40p9Lv1eslteWoRFF5nWA3TS05kTxAjkMCEKGT8u9Qqn8iv8VJKy9YPIc
	9R02UKvBw50pIA80PqqXcOwwFC5YGUPIRWqKtBp+Oka2/qmfdrEE8t9WrQIFCmpAgYn9qIJ4MCH
	R3UtDMT3u9dOZkJMzBQOkMqoNprXXkQY6ZXzcQeF51RbZ9EzLh3/xt7nT11yKDOnACRx/hhMCTb
	GMRg0via+VI2F6NyN2qRurHgcn6QSSy8OeJjxZEiMoLOpGN5/97Kdiy3v2Td6xRgpiMGbTBZ8J/
	SCKTU10zbpxWM2GUZwS1X04UU5km2bVS3KiURy7bE1rzToxJBO2/fy1YvogvGdyKDS/lefHuq2j
	/bJKk6V7r9RwUUrwOHgXIOUe5A=
X-Received: by 2002:a05:6000:38f:b0:487:27f9:83d with SMTP id ffacd0b85a97d-48727f90ba9mr8767740f8f.50.1790002721880;
        Mon, 21 Sep 2026 07:58:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a46d:d671:f81e:e5f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724596604sm23856287f8f.30.2026.09.21.07.58.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:58:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] utfcpp: upgrade 4.2.0 -> 4.2.1
Date: Mon, 21 Sep 2026 15:58:35 +0100
Message-ID: <20260921145835.1106731-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921145835.1106731-1-richard.purdie@linuxfoundation.org>
References: <20260921145835.1106731-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 14:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246338

3d1ff6d Release 4.2.1
32e3ed1 next16: report invalid_utf16 for a lone trail surrogate at the end of a range (#147)
30e55c2 Add utf8cpp::utf8cpp target available when consuming directly (#146)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/utfcpp/{utfcpp_4.2.0.bb => utfcpp_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.2.0.bb => utfcpp_4.2.1.bb} (94%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.2.0.bb b/meta/recipes-support/utfcpp/utfcpp_4.2.1.bb
similarity index 94%
rename from meta/recipes-support/utfcpp/utfcpp_4.2.0.bb
rename to meta/recipes-support/utfcpp/utfcpp_4.2.1.bb
index c56d03b7c74..e891b7fc576 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.2.0.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.2.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
 SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest"
 
-SRCREV = "2d8e20b22dcb3e9b3c4f52103182ebda949c6089"
+SRCREV = "3d1ff6dbf54e471c846dff55dda6c8ee10c0ee5c"
 
 inherit cmake ptest
 

