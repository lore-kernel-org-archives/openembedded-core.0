Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942A3D149E3
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 18:29:52 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.2616.1729880986725307880
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 11:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yNWD+z5s;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so1556279b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 11:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729880986; x=1730485786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sru7QwhknTR7xgYonFRwu/ixGLwivp11n9bpmRzMV1M=;
        b=yNWD+z5s0/KWafkSZHK+Ebm5NAehgMxy78Ns5vOupBk7UTXytWVB2F8+nviQCKyc/S
         D0ToKwhjICXLy0sibBp1a8h2lqSdxPnAHRMfGAZeQav5aahhAHFFU04hDLvcVsde7r9Y
         gK4ludH1rSlK/2lAsSvY/fVELb1IfkjiF3AyZvDXjjrJtJOxFHpr55nqowl9xFLuNaCz
         EbaGcvv7aDyhFjLledAbM4Qp2W67DZjZYyPL2h+O/yVe3snb5lhrb0OxlF9Vo3a9TCw1
         WyLdF+IlA8K0ToFnNT5yoGhyRI9CbojKVHo1qUeD455l2CeUsd2I+Kpj/3K/AUOD8eI+
         EnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880986; x=1730485786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sru7QwhknTR7xgYonFRwu/ixGLwivp11n9bpmRzMV1M=;
        b=CkWB11nKB2raP405YbFQgZyc0dnZyOqiaMDumhIotpiXp9dBfqVQhcJxNwptXMHSo8
         s7dkqtYcuMuxK1LRS4WJ9/QFF48HXkdHfowTB3CxPHjObu9zXOWslwtI3mWc/ub1MXsi
         /MwfJBvInmXhuDu7p/gN+qCa+UD8dh1z18Liv2rpFWoAZMw50vp9uVp1nMRHSruEyO1X
         WPDTaQwvsPVr6N+71itMImzUeFVMH1yB5zxyPo+itHsaY9IpEiDTpUV6XTzNOdCz13Vp
         gpKoXNAGjNDI8Am2dSa+w4OBghsYmPFM6XjpeIPfxGL+sFM0+yKjxsfAg5l2JaWv4oT4
         XrAQ==
X-Gm-Message-State: AOJu0YwaYfI95eqyApJWG+E3cBAVwQRFpu11/rAMuc8276lNsBntqzLl
	XnfKiwNj/OG/RBwvrIRJptvEtIzehu98nlWRC11cMdx5VW9ZuZBjWl53qQOHG8330QJRwj7D22y
	N
X-Google-Smtp-Source: AGHT+IHpjegK0odRHi5Rb0q+JUSy/3KXLtrXmozrk9p6K0DtO0zOZv1ygSniyD80UJIJBfkKmZh0Pw==
X-Received: by 2002:a05:6a20:9e06:b0:1d9:aa7:d6cc with SMTP id adf61e73a8af0-1d9a8409c41mr199568637.24.1729880985843;
        Fri, 25 Oct 2024 11:29:45 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7a51:eecd:55a5:9cd2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a4780esm1394972a12.86.2024.10.25.11.29.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 11:29:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/11] sqlite3: upgrade 3.45.1 -> 3.45.3
Date: Fri, 25 Oct 2024 11:29:24 -0700
Message-Id: <3d42e2e7328bfc0066cf3a7a90ae447f3961c5f4.1729880682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729880682.git.steve@sakoman.com>
References: <cover.1729880682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 18:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206364

From: Anuj Mittal <anuj.mittal@intel.com>

(From OE-Core rev: a5c24e05e8397e2e353d2d27d9da98375f6ec036)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/{sqlite3_3.45.1.bb => sqlite3_3.45.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.45.1.bb => sqlite3_3.45.3.bb} (69%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.1.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
similarity index 69%
rename from meta/recipes-support/sqlite/sqlite3_3.45.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 50612feb25..03d70bbd38 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "cd9c27841b7a5932c9897651e20b86c701dd740556989b01ca596fcfa3d49a0a"
+SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.34.1


