Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B91FF60DB
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 06:57:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14606.1774940250318637524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 23:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s1ql/s6I;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483487335c2so56089745e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 23:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774940248; x=1775545048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9l50duf5zEDAhHdXAmfFwGnkBPanJVJv49TAJEdyPQ=;
        b=s1ql/s6IWJS6Wlv1gUTWkpTFMSglT/NXlFOfAw/Vvd/jl1XbUyzjAQ8ber6y9JBH9P
         VD+QAjO3hv94dxgxcoy84+fTnYtg8yufWcbtz9+VbDklAsSKENOKrV9J/IFBVKJHJnHl
         zzRK5ozsj0j+MUc52Px4R4ON0sOnk2SWDgrkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774940248; x=1775545048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k9l50duf5zEDAhHdXAmfFwGnkBPanJVJv49TAJEdyPQ=;
        b=MI0LW+k8gmjjwGY93l7jXBUBLip+z1q9QZs0hFR/a7Dtwa07HxPq1oTxfZ9xFojU/w
         aq044Jadv/Ob+BL00aejfhacou8lUeMKDkb44WsioVpxH1HJEE5OgYc9rSkbKbWDDenj
         KkcEdiAnEJ106qiIYQCDEGJdDnz34LBYMsyaEHxDmDEuuaX8k9aKBPuopeUtv7ZsjjHA
         LbpRrC7hTmAhyDAWPhImMcnrOflQR/unP9X0N8U4Bi1PbRufMFyql2yENasmSiLdRAyp
         td++peI6BHXafvc37OZlMrkNm2RmyFeUm01YDwHe16gkU1g694Z0KYKI6I5btAdj+L/x
         AEdA==
X-Gm-Message-State: AOJu0Ywfy68sAk4kteKvg19ORNOT+2/cfl+GKIgcxA1FyNTtWBp1V44k
	Sl61t+En2aam2BSP6R6/2cpU8Z+6w68MhoF/P8IGnC6YysiD/PIqebZsAfmAg/Ssbnb7FbjbI81
	qtjmD4xc=
X-Gm-Gg: ATEYQzzeTA6O7lyuT6TQXj5NWeGg1QG++FbJ/Cj+8NEhNolZACRYzJRQ5hRE+EwkW0s
	sA5fTlDNhjMw1zVoLc+E8QhJmmNyFifEk10YBmUvK/PWEqv+uSgbzQfrBmW0WHFa/BjdTheIH23
	ev2uQP5HVL3wtNlTB5GWn8h6xa6b80ElLMc9PdoqfeVr+uMNI0Kc+5xtgKI+eKJ33NlOCVGF5sH
	IK+A20k8dYzJjEpCnrfsRXkLhkNdmhln/bcScstu284jFUuFSFDJXyJtI6CyUWvsl6ZZelDFOak
	vhLAHUGxc6lgbykTGkC4auFQ+eOBpX6xKsybtRG/tMssZhE0UaA4uzkaXWjsiapRrIEn1imsN1A
	paQ7Tp2IJJWvZlSxOcUX3U5A3Nd+K0qrF+oPcgdZD61HN300+LQAJ1m6wn/97pxnsMbf33SkgIu
	zRm8WEj4SuPx+ZiWnXHTqQpq3AWa5t765no3FADw43/OfDUgpeu3HBcv1bPmCuNhpwq60Jj5ZuR
	sQhoOriFuYElFIvL7pbRH8dHgA=
X-Received: by 2002:a05:600c:6814:b0:486:fbe1:2499 with SMTP id 5b1f17b1804b1-48727f7be29mr260082645e9.22.1774940248407;
        Mon, 30 Mar 2026 23:57:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8a546esm11016455e9.5.2026.03.30.23.57.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:57:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 3/6] spdx: add option to include only compiled sources
Date: Tue, 31 Mar 2026 08:57:00 +0200
Message-ID: <1c7dfab26d69a87bb026e05b3bbf6a266858c0d1.1774939987.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774939987.git.yoann.congal@smile.fr>
References: <cover.1774939987.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 06:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234265

From: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>

When SPDX_INCLUDE_COMPILED_SOURCES is enabled, only include the
source code files that are used during compilation.

It uses debugsource information generated during do_package.

This enables an external tool to use the SPDX information to disregard
vulnerabilities that are not compiled.

As example, when used with the default config with linux-yocto, the spdx size is
reduced from 156MB to 61MB.

(From OE-Core rev: c6a2f1fca76fae4c3ea471a0c63d0b453beea968)
Adapted to existing files for SPDX3.0

Tested with:
- bitbake world on oe-core
- oe-selftest --run-tests spdx.SPDX30Check

Regarding SPDX2.2, the respective backport was already performed in
OE-Core rev: a2866934e58fb377a73e87576c8594988a63ad1b

Signed-off-by: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/spdx-common.bbclass |  3 +++
 meta/lib/oe/spdx30_tasks.py      | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 713a7fc651e..ca0416d1c7f 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -26,6 +26,7 @@ SPDX_TOOL_VERSION ??= "1.0"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
+SPDX_INCLUDE_COMPILED_SOURCES ??= "0"
 
 SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
 SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdocs"
@@ -40,6 +41,8 @@ SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 python () {
     from oe.cve_check import extend_cve_status
     extend_cve_status(d)
+    if d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") == "1":
+        d.setVar("SPDX_INCLUDE_SOURCES", "1")
 }
 
 def create_spdx_source_deps(d):
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a8970dcca0f..9c422d17573 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -145,6 +145,8 @@ def add_package_files(
     ignore_dirs=[],
     ignore_top_level_dirs=[],
 ):
+    import oe.spdx
+
     source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
     if source_date_epoch:
         source_date_epoch = int(source_date_epoch)
@@ -156,6 +158,11 @@ def add_package_files(
         bb.note(f"Skip {topdir}")
         return spdx_files
 
+    check_compiled_sources = d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") == "1"
+    if check_compiled_sources:
+        compiled_sources, types = oe.spdx.get_compiled_sources(d)
+        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
+
     for subdir, dirs, files in os.walk(topdir, onerror=walk_error):
         dirs[:] = [d for d in dirs if d not in ignore_dirs]
         if subdir == str(topdir):
@@ -171,6 +178,11 @@ def add_package_files(
             filename = str(filepath.relative_to(topdir))
             file_purposes = get_purposes(filepath)
 
+            # Check if file is compiled
+            if check_compiled_sources:
+                if not oe.spdx.is_compiled_source(filename, compiled_sources, types):
+                    continue
+
             spdx_file = objset.new_file(
                 get_spdxid(file_counter),
                 filename,

