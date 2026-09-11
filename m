Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97D0C88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50890.1789164948911248161
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 15:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZvNlCQgB;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso16454795e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789164947; x=1789769747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aAN30IEOMwnmAP8OM+2Pr/cy83LElup7yjPQU4Zs0GM=;
        b=ZvNlCQgBQkOjEUt/Mpx+6eEnI+XsxrwilVj6PLNZcah1fOlU3hyDmcRBxYovAWC4Da
         JJPGLmPqRi133q812i5aB0PX5/LyCgfKlqyl9O8wYXNvE7icHO1qK8RQvsNaPJukqZhm
         Abh7Ztsbx59DujgFjp+LgrZGRDmA2/BVpIPLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164947; x=1789769747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aAN30IEOMwnmAP8OM+2Pr/cy83LElup7yjPQU4Zs0GM=;
        b=Bkp3YBrR5dFwiHRghfUGvJSTVGyNWg3LviTP6eG4oXguM0RR/rAg+eRlJggM7QxlsI
         IBZy8GvkxdWW4NAgGgJqe96BTzOE9uFNN/ymQ1G4VQMxkMI5tpEx+YNSQxobgyJhBPxJ
         j70+LMWIBk+qIAED+CJa0IcfBOg/7Ly+g+FQDiZJVJEAAZ4OaiXtI9WtbAbsP792WbGl
         q0pSokDAxz9gfkF32YevqjueSG3sZvoiyk/QEvU2YqmzwqfbkuzXrU7N1OO3hN+9B3rJ
         /z8B8VEOritIWW9bLc/Y0KKqGTeRAyH3/3X9h1a+r0KxTPY44dnw58tmCCPmzRlbCi6E
         8WUg==
X-Gm-Message-State: AFuF++msfIiUl49TlJ6+vShU6KB0Cn2/T/MF7hGEX4K/S2Sokoahuviv
	OuJoRdWx1WeHjiAw+8XD29dz/zQ+YIQSgLXviJnrIAYXlLTjCit1PI25alQd5hbXe3OkaVctpXR
	/Pb+a9WU=
X-Gm-Gg: AYBFou39dW4HE8eH9W5tFH8jBbLg+lMaSMs+oexFtwIjQIRo/xPht/5KGWZEI6QQa5y
	At+yYJKCUhxyITHiubUgkQWaG5HNTWHXEzPPr/0pAt7DyG0sHwJ8DclzPIwIxaPIrsLh6O81iok
	jH2XWYA1q8Hhx3hW3kTFVbmcGlJyRITe9OCTCqfUnbycLvV81qc08TcC2kYHWRF0Xwk2r4t8JHx
	L6t8ABvwxSKbLqxPdaKXst2SyyHHm16fCwy6LH1scTISV3KtbwdAgnNzoAucyYBzyRmA+sEG1cX
	4+Bh/UeJdE297hXDx8quK5dwO9izJlEqPXAfdoKVny9BjwHLSJ1OjFesSdReZulFpDPnRRse/Q6
	iOl7v9ZLR8/nM3nZkNIs3f/SiX1EwETGnAd6sMCcUEtpPHVVtkS9W/wimBbYPNlPXmZQZoYbL5W
	o/OgKlrepbm3kboPU2Jv5+tMPGiDFq0+igAWdG9/PMa7qG0yg8JhKXNrlRFsvjeWVfXKS7U4YPi
	XDaiLnN8HvcWXBpX826fPpA1ultEk+O+lKNDi8HraBPETF8d/brwtKzDmyaxPaa1YfYNuIRwPOy
	qZCU9gSeoJI=
X-Received: by 2002:a05:600d:6414:10b0:49c:fc6c:be16 with SMTP id 5b1f17b1804b1-49e619c64cfmr51966335e9.28.1789164947161;
        Fri, 11 Sep 2026 15:15:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm8434045e9.11.2026.09.11.15.15.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/13] binutils: fix CVE-2026-3441 and CVE-2026-3442
Date: Sat, 12 Sep 2026 00:15:01 +0200
Message-ID: <4f81bf96e18efd7951c2171581afd2ea80e09bc2.1789163914.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789163914.git.yoann.congal@smile.fr>
References: <cover.1789163914.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 22:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245677

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix [1], which addresses two out-of-bounds
read issues in bfd/xcofflink.c within xcoff_link_add_symbols(). The changes
shown in [2] are referenced by [3] and [4].

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c2bf7de1eb77a91d7a3c86d56408bf57de540faf
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=blobdiff;f=bfd/xcofflink.c;h=1781182fa6a3f92e5e91996f8b0dcf3ab192679b;hp=fde21c9f9583baff05e72e390e6bb896d02f9d43;hb=c2bf7de1eb77a91d7a3c86d56408bf57de540faf;hpb=d7f532cb3a46527
[3] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2026-3441
[4] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2026-3442

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-3441
https://nvd.nist.gov/vuln/detail/CVE-2026-3442
https://www.suse.com/security/cve/CVE-2026-3441.html
https://www.suse.com/security/cve/CVE-2026-3442.html

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../CVE-2026-3441_CVE-2026-3442.patch         | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index d395ae1b1e0..8665a2549aa 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -82,5 +82,6 @@ SRC_URI = "\
      file://CVE-2025-8224.patch \
      file://CVE-2026-15003.patch \
      file://CVE-2026-18220.patch \
+     file://CVE-2026-3441_CVE-2026-3442.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
new file mode 100644
index 00000000000..61b1c7dc198
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
@@ -0,0 +1,51 @@
+From 0f650fc3fc147b05f819ef96af02238cee02c68e Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 28 Feb 2026 13:16:40 +1030
+Subject: [PATCH 1/2] xcofflink buffer overflows
+
+This fixes two fuzzed object file out-of-bounds accesses.
+
+	* xcofflink.c (xcoff_link_add_symbols): Properly bounds check
+	XTY_LD x_scnlen index.  Sanity check r_symndx before using it
+	to index sym hashes.
+
+CVE: CVE-2026-3441 CVE-2026-3442
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c2bf7de1eb77a91d7a3c86d56408bf57de540faf]
+
+(cherry picked from commit c2bf7de1eb77a91d7a3c86d56408bf57de540faf)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ bfd/xcofflink.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index a48cc94fed0..dbfa17c6d58 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -1888,12 +1888,9 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 	     follow its appropriate XTY_SD symbol.  The .set pseudo op can
+ 	     cause the XTY_LD to not follow the XTY_SD symbol. */
+ 	  {
+-	    bool bad;
+-
+-	    bad = false;
+-	    if (aux.x_csect.x_scnlen.u64
+-		>= (size_t) (esym - (bfd_byte *) obj_coff_external_syms (abfd)))
+-	      bad = true;
++	    bool bad = (aux.x_csect.x_scnlen.u64
++			>= ((esym - (bfd_byte *) obj_coff_external_syms (abfd))
++			    / symesz));
+ 	    if (! bad)
+ 	      {
+ 		section = xcoff_data (abfd)->csects[aux.x_csect.x_scnlen.u64];
+@@ -2259,6 +2256,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 		 functions imported from dynamic objects.  */
+ 	      if (info->output_bfd->xvec == abfd->xvec
+ 		  && *rel_csect != bfd_und_section_ptr
++		  && (unsigned long) rel->r_symndx < obj_raw_syment_count (abfd)
+ 		  && obj_xcoff_sym_hashes (abfd)[rel->r_symndx] != NULL)
+ 		{
+ 		  struct xcoff_link_hash_entry *h;
+-- 
+2.44.4
+

