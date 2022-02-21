Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A07AC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:10 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.5694.1645406889601938970
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oYQOqg9k;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 27so7717066pgk.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=m3gEm37hQFtUD3Ua9/H4cKIM7eBOc/uatVaNihsgMRE=;
        b=oYQOqg9k2B3mfCGy/oW+wH/VYGFr6kganvPTX7njR2+uDmhr8gnVfwxXCXtbuApiPd
         rQXVRVsxzrGcaAaURuCd9SjwdT1gFu86UnEC+8yahUU6uFNKSRamx5p6JWkkIeE21kyF
         pGFNUzaG8UNS7uHWQj4SZRv3DONwHZ23vo1GZI7iPXlLT1z5aDByUl8LAJdvhZyLvI1V
         TV7JtYt2tF9tYjJyJWz33AxLQ6N0qJX/ua9kkV/X540tRxgZ690fwBZ7zC28MjlcWRgo
         wLKfFGER9th26stn4f8QidTBXSmyDgI0FxRYtPxWFgYhJet9jTztfapvdwZBPA4oSLUo
         8rFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m3gEm37hQFtUD3Ua9/H4cKIM7eBOc/uatVaNihsgMRE=;
        b=E/O34ppCl8ThFKHpOOymIvx0pHVhuYO1JHKVgJVGdt+HV43p6d4NFqh+qz4zBzZULc
         BBjksS3HYJ7PXs7HT5l5LSDcMT74rVlui4rMKJSy+z18ZlOzKf2PKNWoVs8zLLKPOsOz
         UMqmfl661DBEMGUnDOr2Q400/zX8Q4MkPZhm/qBufSANyw1XT0fCNrC+VcrBzIuNtHl7
         RzQWMaZi+azCcNDXdNxyy3qBMB1V4vpeg4Kc8zxMnum10h364aF+iMJOvJ/MKaC8ErfU
         6h1HwxLuW9WJbnelQN7CEdZfJv94mUjI+XqHcvwASPz85E8pDoONHmIWQB/6ISTrt3tr
         KOQg==
X-Gm-Message-State: AOAM530kUgMX63kdmc5ClvVoOqJRXod50cPtju9UeINxppkcrHHKziNZ
	QXO3GjhWzleHCcYHDgRdxraAmYHRUDALAg==
X-Google-Smtp-Source: 
 ABdhPJzWwbpkrXyhUcr36eXemNflWAJukPlZRWXTXDAleyr4dJtIaWWvEImDfIci/EwXKbv7cEAV1w==
X-Received: by 2002:a63:2d44:0:b0:34b:3f1b:952a with SMTP id
 t65-20020a632d44000000b0034b3f1b952amr14229569pgt.522.1645406888728;
        Sun, 20 Feb 2022 17:28:08 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:08 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/19] setuptools_build_meta.bbclass: add helper class
Date: Sun, 20 Feb 2022 17:27:36 -0800
Message-Id: 
 <5fa6b209a9e8cfffeb59f5597224ce5994bae3c6.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161999

This class uses the PEP 517 compliant setuptools.buil_meta to build
wheels.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/setuptools_build_meta.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/classes/setuptools_build_meta.bbclass

diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/setuptools_build_meta.bbclass
new file mode 100644
index 00000000000..b1441e65dd5
--- /dev/null
+++ b/meta/classes/setuptools_build_meta.bbclass
@@ -0,0 +1,18 @@
+inherit pip_install_wheel setuptools3-base
+
+DEPENDS += "python3 python3-setuptools-native python3-wheel-native"
+
+setuptools_build_meta_do_configure () {
+    mkdir -p ${S}/dist
+    cat > ${S}/build-it.py << EOF
+from setuptools import build_meta
+wheel = build_meta.build_wheel('./dist')
+print(wheel)
+EOF
+}
+
+setuptools_build_meta_do_compile () {
+    nativepython3 ${S}/build-it.py
+}
+
+EXPORT_FUNCTIONS do_configure do_compile
-- 
2.30.2


