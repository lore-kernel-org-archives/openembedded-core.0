Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id AE3B67FCBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 17:15:16 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id p17so10004056wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 09:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=coTMf/v+3cFSczdU+0UgqQjT9WqGu1g6TV4p5cDZY3I=;
	b=QYfbLN9l5gmbl0H1CzuT5pJhuG/Z1KLyp8ERwgBtFr2EldBJfoWLFvMp/IbKllX9j8
	tP0BRY7TPVa9bcWNj2wi4EXbRPbnvL//tRVr/3qTTFSjMH11OPnvXsmb+4CaKRh3JxQC
	KFp/DCwU6znOrcWcvYAPLgCVZ2a48IE8F3Glhm0+lYe9zMCuq6L4BiI8l1ymhouCXFDk
	9HZyu2duk2UaQFadEIMY0Tu+7faYYMG7ZqS038NluKLqSrFpBgO6SAj8iJPpF3iPZrOh
	gGkYU4F72O1dI0n2kMq7T2E/Uz+lzrcfT2+M5jQ/nYyYsImkE1LA2ZhT4fC/8Xp0JDsS
	Zi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=coTMf/v+3cFSczdU+0UgqQjT9WqGu1g6TV4p5cDZY3I=;
	b=L4QrV6QnIXvVaFpljZWXr992J8eqlxATYz4XujyYNFq72ibj3L8BRuxCkSWr8IyHyf
	Muo5YVeaRTSain8ETTvJdARXqtuM5COdvUVZk9Eu2wqm1c8R4wGq3q4eqq1Wh3WoRO91
	TmYD5bAkLVNN+7BIfKZTBQm09FJuMn3AJkY2wcb5Y6RlRUtqIFngf18vS1t0lec1SELI
	EksneH9J+zaJRzE3qK7wdIukKnS4pN5PS5ouHQOgT/WNezT8WJ9TjpQD1LfHcGXLriDi
	9JCTQmwb8n1cZ9JCKeMf05r8ItNcmmjCHn4GAHD+ar2KktzvKLT1h+etUZ2zdb7zwfkX
	SyTQ==
X-Gm-Message-State: APjAAAVPuP/uYTCgfMwVcdlMY91ZB4YVPpLhqFcpjPrKz4AnNKP5Mhm9
	xZi89wUOQaAYaHiyh+BNL4AjDxtwYao=
X-Google-Smtp-Source: APXvYqxbj1BAmFdz6cN6tANTwj6PQOyuz8nB1Qe2OHPognuW70NauI6D8DGspYbRreTMCrAmiKZ73Q==
X-Received: by 2002:a1c:1bc3:: with SMTP id b186mr17607482wmb.79.1576862116868;
	Fri, 20 Dec 2019 09:15:16 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p18sm2487469wmg.4.2019.12.20.09.15.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 09:15:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 17:15:13 +0000
Message-Id: <20191220171513.1140-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] meson: map the system property in the cross file
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
X-List-Received-Date: Fri, 20 Dec 2019 17:15:17 -0000
Content-Transfer-Encoding: 8bit

We can't just use HOST_OS, as in meta-mingw SDKs that is 'mingw32' but Meson
expects 'windows'.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/meson.bbclass | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index e1a13bbbf74..9e7ce42a701 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -62,6 +62,16 @@ def meson_cpu_family(var, d):
     else:
         return arch
 
+# Map our OS values to what Meson expects:
+# https://mesonbuild.com/Reference-tables.html#operating-system-names
+def meson_operating_system(var, d):
+    import re
+    os = d.getVar(var)
+    if "mingw" in os:
+        return "windows"
+    else:
+        return os
+
 def meson_endian(prefix, d):
     arch, os = d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
     sitedata = siteinfo_data_for_machine(arch, os, d)
@@ -97,13 +107,13 @@ cpp_link_args = ${@meson_array('LDFLAGS', d)}
 gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
 
 [host_machine]
-system = '${HOST_OS}'
+system = '${@meson_operating_system('HOST_OS', d)}'
 cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
 cpu = '${HOST_ARCH}'
 endian = '${@meson_endian('HOST', d)}'
 
 [target_machine]
-system = '${TARGET_OS}'
+system = '${@meson_operating_system('TARGET_OS', d)}'
 cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
 cpu = '${TARGET_ARCH}'
 endian = '${@meson_endian('TARGET', d)}'
-- 
2.20.1


