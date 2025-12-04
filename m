Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0567BD24462
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:08:58 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50321.1764871730595253117
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 10:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=SKuK2f/Y;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b3016c311bso123183485a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 10:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764871729; x=1765476529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhXVSms3IGraJR1AftbJj5A6wIbByeFMJyqlhT2Xiwg=;
        b=SKuK2f/Y3EAE30/cfT2U98wwMwEkon3L3RhNTr3K1NrfByxgey84ZWCQYJQX/cOk74
         wSTgzIQW6rHOsS1yPRptBuhIr2UA0Pi0jZzltVghO7uIKnOsPHvLjP2ldGKWjC+HIqcy
         ZzwepM5agS4dkKnIqjXnPeQX/VtYQBO2yfzL+msjCCkl6Ts95ntvhxCe3RsPcPMWOwsG
         zkwTC32IwgMX0nwVd1rcoLV4MCFQ19ySWckv9S1mkhnsHQz5crDD/GgO/ibJTMZmYTTG
         h0h7DttBbdmSTkTF0tiL4qMoZgrjgFjwyU8oAyw2vOancxWzUXPdAp8atgNS5wkPMcyx
         YoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764871729; x=1765476529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zhXVSms3IGraJR1AftbJj5A6wIbByeFMJyqlhT2Xiwg=;
        b=rBREHnQW879PsAO86OtQugpEWoDglxMJDpMLLjSiarA1d3yS9mbtpVHEhcKXwp5HuK
         d1VBUCUzyJrrRzK3Dh4qEEjtvPHmxnhdU1tiY9KNv/yg7aLVDz7azTXcyTEy7hJUaX6a
         yZBYLI7SP0+AbIAZXI2HzEsVu5blgcl+YRZZl8Ytg8Txjd2JribIikKfTi3tSatDf7DF
         iNktnwx37Pw20JyT4uhFZNi8N75+QKUPGcZ8+HuULacsf2GTRCe7dgeDkxTKUnF1kQAF
         vS3VRUZAkpl6ASQhz2NOjAgIipuGFeXZht9ojv6WKNT1EZ0v0V/J+B967nV+1gGwduCB
         vv4Q==
X-Gm-Message-State: AOJu0Yzh+LBNSKhNY7f/x+p7kF1rrsAS3RuvP2RJxuvVEBYC09S0qtPx
	EUCUaS8ZAhI63iS/CzxHgKK7n3UxqmcApwQNGmD2ETQXkdIOe3ZkKHPC8romOC7/3zMZu+3R1g3
	6Qsy9zB4=
X-Gm-Gg: ASbGnctFY1/dDEiDB18VpKHgHYyZrfx+YmxuFnkgC3wPEO+tw/u9LFP8wZg8XeNBPm+
	8OHVcUt9PHK56LezWxiCBBsWouEGmlfZELkt56lsT7rKuh8vRH+MbKAfyTgtpcFPcKHdWdR4KJF
	BbqEND22m5ujKlhQ16vynloYDyK+Nca4XRXg6PLZ5Zh7N9liUbTEc5zO1T02jKA+ugfS32eMpfi
	YPFTNIAA15eK4cR8hwZ2jzCVzCFUBZuSVlDzkAaDJgwaSEOdIt90g13SY8wQEC/kZpslgZqsGwq
	y7fRJynX3ejeqkKu56+3Aq6uebw/GU5wdKneQIav69ozNOQGLMObPzp9ZvI76mSiGn0tLll9Pca
	Jx6tdyCxKL7aZIrMscfZkRSpuNdVc23jSaNZkAyybJh3p53/fuY7X4Aut5FmtYsBgin322QMVYD
	MeoCOiY/fz5VVAJe4=
X-Google-Smtp-Source: AGHT+IFRKXS+r8cM1dJNTiztEJY42hMzpGYCoz5I+3FVJyPld9SYxc5sUhSJh0AQNn47KcN66I+KOw==
X-Received: by 2002:a05:620a:460d:b0:8a1:b435:984a with SMTP id af79cd13be357-8b5e6f7b163mr1018580985a.69.1764871728441;
        Thu, 04 Dec 2025 10:08:48 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b627a79ce1sm188454185a.31.2025.12.04.10.08.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:08:47 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/6] rpm: handle CMake Python paths in do_configure
Date: Thu,  4 Dec 2025 13:08:35 -0500
Message-ID: <20251204180837.3112045-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204180837.3112045-1-tgamblin@baylibre.com>
References: <20251204180837.3112045-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 18:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227314

With the Python 3.14.0 upgrade, rpm is finding the wrong paths with
CMake, leading to a QA issue for files that we have listed in FILES
already:

|ERROR: QA Issue: rpm: Files/directories were installed but not shipped in any package:
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm-4.20.1-py3.14.egg-info
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/_rpm.so
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/transaction.py
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/__init__.py
|Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
|rpm: 4 installed and not shipped files. [installed-vs-shipped]

Add a do_configure:prepend() step to make sure the right ones are found.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
index ba967ec1fa..8aa63def61 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
@@ -101,6 +101,11 @@ WRAPPER_TOOLS = " \
 
 base_bindir_progs = "sed tar rm mv mkdir cp cat chown chmod gzip grep"
 
+do_configure:prepend() {
+    # Force CMake to use target Python paths, not native
+    sed -i 's|${Python3_SITEARCH}|${PYTHON_SITEPACKAGES_DIR}|g' ${S}/python/CMakeLists.txt
+}
+
 do_install:append:class-native() {
         for tool in ${WRAPPER_TOOLS}; do
                 test -x ${D}$tool && create_wrapper ${D}$tool \
-- 
2.52.0


