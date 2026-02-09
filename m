Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D46FE7E0AF
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:47 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43996.1770629377830000150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SlJPsYGf;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43770c94dfaso662088f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629376; x=1771234176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4KrseN+Jk69L6Yih8CoN0UKLC2V7CLZQh5+MGWFhQk=;
        b=SlJPsYGflitmpyni4VIBWRo/+H4PAimQ3n8jH6NF1Gl5pi1EJk7Xm2RjxsXWu5ESAv
         xqcDgDrouj5ukhz234pJMPtjiRf/pQoSNzdoGf7/2usVNFpgvvJGxOgqqywnox9vMni6
         29OHWKTeaO1gqhg6NvDP9RFGxI18aeIfyaKBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629376; x=1771234176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4KrseN+Jk69L6Yih8CoN0UKLC2V7CLZQh5+MGWFhQk=;
        b=Mi7t2kOBkQRax3bizIkBY053Gd9CwVcvkRzfvl7bcemxEqAVt0THpoHjBzeIg+kMmh
         6HylhILA3SHyWcp2FNjc2tUDT47UB1ccwQma4MrtINNtN5le5W4KfI77wwxKKTWMtKCN
         JcyP6g63h1AVRS5a1sVZmSJ4TH075nj0CTwTy3GG0CMnVYPHvhajE99S1jt9t5bXGCXc
         XypxbwBoaLkL/VT+Wsq6kOmcVPBXGLqy+9+ZzOBgZdq2XQ/dlowzxFVEFV08qthetiWL
         h1pXtvCxE9k5oqGUSuslzsIlkfF9hB4py0Kok+OrjElxPP4z3uLVeshk7XDHN6FmnJSf
         MHaQ==
X-Gm-Message-State: AOJu0YztQcWm9Addjsp2PSjc7F+swpV0GSVh259ya0HH/pqqYhR6Vyxq
	XXspb0x5x96OLaV0mfD3jr/W4kWtJ78XM1gsw6nl9xFoVxkhWUnzy8MfL+ZIRVf/LdrW+8GPq95
	SJ9PH4Pzy4Q==
X-Gm-Gg: AZuq6aJjs/tGGUOrkWO5l4zez8I/9mFwfta7LgGIHL0yG7IvQWiBeH1zEv/Y3UKDNEP
	CmWLEyB0d/iQRSEIs8laTd/zoZ6EWvALh6dh5BuBNTjlei5YBoD3FXt6XZSryfiHJjg6WJR9XaB
	XMWW8MedRRNfdYG6sMlOT6H3wt4JUlZEI6GCQvcPNv3CQCE4gqIl322ZkFaEcMgfGl4HlXm0SK6
	h6l9CGBtvUzwDM0GmpFrRaycYcelabqMjE+FWh5cxsQFM1mC7aSneGdNnjBaz32M3KJhP0JSdk9
	OGsX1c7DMpzxAry2RFQcLbZsWn7osT858o7as+vujjq9331MRgAGYoJ8WY1u3RC2x182JLbEWbg
	C44dcqgbvtRr8VwzlwSjP1S/eGewzlxS1+jPwniGHHqB9BfmD8nzsMVO3+cqxTscv0////lJIZE
	CDi60J0qqiNBmMtgv+6xjs/EqE5CLS2pFlvKuYKtre5ndaNIY0N4pBIEYEo86QJeUTiboss71Tf
	IUY2govZGmfTIQ=
X-Received: by 2002:a05:6000:402c:b0:435:db6e:e3b3 with SMTP id ffacd0b85a97d-43629381a45mr15529907f8f.36.1770629375854;
        Mon, 09 Feb 2026 01:29:35 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:35 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/25] meta/classes: fix missing vardeps for CVE status variables
Date: Mon,  9 Feb 2026 10:29:03 +0100
Message-ID: <7c522722b89e5882bf46e472cf98cacb5fb586b5.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230771

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

Several CVE helper functions (get_patched_cves() and decode_cve_status())
implicitly depend on the CVE_STATUS and CVE_CHECK_STATUSMAP variables, but
these were not declared in the vardeps of their callers.

On Scarthgap, the upstream fix (2cc43c72ff28aa39a417dd8d57cd7c8741c0e541)
cannot be cherry-picked cleanly, as it also requires BitBake changes.

As a workaround, explicitly add CVE_STATUS and CVE_CHECK_STATUSMAP to the
vardeps of all tasks invoking these helpers, ensuring correct task
re-execution when CVE status changes.

This keeps CVE-related metadata generation consistent without requiring
BitBake modifications.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/create-spdx-2.2.bbclass | 1 +
 meta/classes/create-spdx-3.0.bbclass | 2 ++
 meta/classes/cve-check.bbclass       | 1 +
 meta/classes/vex.bbclass             | 1 +
 4 files changed, 5 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index aaa2e78fe21..037193bb4b9 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -710,6 +710,7 @@ python do_create_spdx() {
 
             oe.sbom.write_doc(d, package_doc, pkg_arch, "packages", indent=get_json_indent(d))
 }
+do_create_spdx[vardeps] += "CVE_STATUS"
 do_create_spdx[vardepsexclude] += "BB_NUMBER_THREADS"
 # NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
 addtask do_create_spdx after do_package do_packagedata do_unpack do_collect_spdx_deps before do_populate_sdk do_build do_rm_work
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 6125e8b5479..388497054b0 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -159,6 +159,8 @@ do_create_spdx[vardeps] += "\
     SPDX_PROFILES \
     SPDX_NAMESPACE_PREFIX \
     SPDX_UUID_NAMESPACE \
+    CVE_STATUS \
+    CVE_CHECK_STATUSMAP \
     "
 
 addtask do_create_spdx after \
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index f5bbaa5d159..3f4704fb4ec 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -187,6 +187,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build
+do_cve_check[vardeps] += "CVE_STATUS CVE_CHECK_STATUSMAP"
 do_cve_check[depends] = "cve-update-nvd2-native:do_unpack"
 do_cve_check[nostamp] = "1"
 
diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 707e6f45a19..45a15348724 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -160,6 +160,7 @@ python do_generate_vex () {
 
     cve_write_data_json(d, cve_data, cves_status)
 }
+do_generate_vex[vardeps] += "CVE_STATUS CVE_CHECK_STATUSMAP"
 
 addtask generate_vex before do_build
 

