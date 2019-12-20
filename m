Return-Path: <ross.burton@intel.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id A94B97FD06
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 17:16:44 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 195so4676207pfw.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 09:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bBRU6ZyKwVtTaRdc7dXO2W/PocL8RDJhhVSAH8GDjRg=;
	b=ZcT9ymfD603OQTqI2Lw4w3FNBwgl/MyawRMn4+Lphbqg0sz769YE6Jj/bAtjAd7nBp
	Z6EDm9hu+pjP3Q85cX8pshQ61q3CJ0bE1l/0MyErzF18OA3zOGEj3wKiQzjZ2wsksrSq
	r9gGiSafuqxh9MYxOBAMwXmzSTNfmhfJhJfxJkOfc/EcC1fZdTxmojktfUoXU1AoFIXG
	+jkB9hGIG0BlTDhN1gt7ClvafCQAk9fZEiJdftV4kmihg6q1lQ8h0EAuy7b7ybuRXj/L
	8RQYqr969fyU9K5FXiv3MtCPdZ98xkXQDgZUcWtKML6EJ82pdlAFxzlvSRa1PYyHn3hL
	8eQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bBRU6ZyKwVtTaRdc7dXO2W/PocL8RDJhhVSAH8GDjRg=;
	b=MsYo29u67aHMSmtY7YE+gJMEU/8U3MRMVxd9osSNOP3xBav0J3KW3GveBsA/nrQbrp
	A+sFYtzoMM/cq2BJCyH4olqebdVImGV61Lhoh+jI6NAhMN128qx7jnQlICN5HIbWgHHD
	R3DonvAMk6wkcM+gFajPSzFK7/sx1r5PxOMnSapmO5usn91eMHtH+JCxxML/si0LVdDp
	aNYLDNye+y6gfGu1F8lEtzwlUi1G2SwI1kxDBStauC3C6S74eHVGJZ2C6p3mJBbt+hr3
	Hq1ZiXzcQNPkZmcLDhRNzhKunhSwfzGYDfkdlpmKTjAMDUE6mZHxBfLpkaBx042+h0l1
	dZqA==
X-Gm-Message-State: APjAAAVqqQVmRBsX0PQgvvVuAOVdjtxSjgnidJ77u814FxN8Vr2gm2+l
	GyRfYBgCdrDS8byiodZzq7oUI0UWoq8=
X-Google-Smtp-Source: APXvYqy8Gu1jDN0NmjCMKxQhJG25a2bZS90vtYtNBUwl/L9fAbN6QN3KuAcI2D4pAwdqmxWeondVfg==
X-Received: by 2002:a62:f251:: with SMTP id y17mr17674167pfl.204.1576862205710;
	Fri, 20 Dec 2019 09:16:45 -0800 (PST)
Received: from flashheart.ger.corp.intel.com ([192.55.55.43])
	by smtp.gmail.com with ESMTPSA id
	z30sm14031004pff.131.2019.12.20.09.16.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 09:16:45 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 17:16:36 +0000
Message-Id: <20191220171636.1632-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] meson: map the system property in the cross file
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
X-List-Received-Date: Fri, 20 Dec 2019 17:16:44 -0000
Content-Transfer-Encoding: 8bit

We can't just use HOST_OS, as in meta-mingw SDKs that is 'mingw32' but Meson
expects 'windows'.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/meson.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index e1a13bbbf74..71f9de1a570 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -62,6 +62,15 @@ def meson_cpu_family(var, d):
     else:
         return arch
 
+# Map our OS values to what Meson expects:
+# https://mesonbuild.com/Reference-tables.html#operating-system-names
+def meson_operating_system(var, d):
+    os = d.getVar(var)
+    if "mingw" in os:
+        return "windows"
+    else:
+        return os
+
 def meson_endian(prefix, d):
     arch, os = d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
     sitedata = siteinfo_data_for_machine(arch, os, d)
@@ -97,13 +106,13 @@ cpp_link_args = ${@meson_array('LDFLAGS', d)}
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


