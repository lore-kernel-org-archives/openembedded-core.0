Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBB1C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:10 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2972.1787945886689913902
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bpZyysCc;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so10720745e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945885; x=1788550685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3U2mVcRi6YMp1VqQC/HN1zW4uVCnsd5muJsa1jWBAwA=;
        b=bpZyysCcXBNbHix3VIu/yKayBnxxmodTz2z/Ic9Jon+y99thVHdi4RnhNAkMDlqtVD
         /jr9eR/gv/kTfYdoJbKmf5iQQXDkC2T3ISZOAZTQCoLggAZdDR1tE53HR0s6Tpnbv4CC
         ClcgxwpOAmXLWXXVsbLMlxJrx2GQCe6JQYTSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945885; x=1788550685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3U2mVcRi6YMp1VqQC/HN1zW4uVCnsd5muJsa1jWBAwA=;
        b=DaKaOP9s0tFKnIR5cbxN0h/UocR7adBhe1JQF7h8NFjVe5xuYd6ojjVafigYDxTor8
         YkTIH7KegieiK3MvzxEGgL8d+Yb9H8j/G1Qoe1qRsKetZ/iwsa10Mz+JoiraS+97h2jn
         ZVn2yF27FVvGPEwZYBxVHTlxyFvg9jqOUbK7N2gD0AWygwcnka+XVrKHOBVhkf1uVISB
         CHLou+fn1uN3eTWweZI+5DNzn9QXfas1/4WHG2BITw38lICdCcfdtFnJWZlq0lp6eD/U
         Hn1CDt1mpjLIpKPZ9HmVpIB3vJRtSNNp/Vi6850biUUcSUvkZUXROjkSXnVZ/YiggiA9
         W2Ag==
X-Gm-Message-State: AFuF++mcsfb9LD8Dn4hx/ijtDKScgcGpQxYUyBL8qcJKKVhgN5CYDok6
	fiHdUjOiEFPNejmJVIzksKw2D4ds2bcLSQlNzyKz5yOGeBv9sF/EsPIOlctlo22jgsPEG1UVwZK
	z7Pi894I=
X-Gm-Gg: AR+sD11KIxsSceB0I9gHd18I1kVG94xzAzdHkQ+PpVcVTmLU/hY24NMa+nZGxm/UAoU
	ambRftI+tymxANvwSGaUtPwsFwZhX3Bc2qUr3ozPeURizQojTszzSmfcsnIURvBgTREiTKYuxuD
	bXCpQMwvT1Z/1KJIxwVhgK2soCtTLPO/YkgGxVPxaRKHGBivP94vDoQPJc5MIN1ZCfwPhvgNOcJ
	WDpoJn3aUm5AjTOytGsiYKyv7J/xMFdfVBv6Jui3XGpegnAdA7qZQrIyyTSaAREwgE1M1Aqu5Mq
	+VJ9JRFmHuAeTouHDnBOUogf18iTeFKhJbaDVPHcHjuoQY7Y9y3sRP5p2Xgxlnf4gQyDTabRrIG
	VDYfeb0VeHEL6UgNsW5sjw8qg7La5xlZDf5r/NXrpnAV29bd2r6UXUzBkDJ3RCSASMHgYHRMiBU
	rDWGoD5GFVLP2HlGIhr+u3fIq1w+MXDAhTx+FtAjXklC803/nvkrRJ/C/lUiUXnHkG0Lk+/r9xO
	ic0nI6wwI1yRL8WlMWCbRoUIuMMg/LjX5r8xEsApzDKK1UxKpMKVxvCxFvtPjo2
X-Received: by 2002:a05:600c:698c:b0:499:adb5:e7b2 with SMTP id 5b1f17b1804b1-49b91c3ddc7mr183484815e9.11.1787945884806;
        Fri, 28 Aug 2026 12:38:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/56] binutils: fix CVE-2026-3441 and CVE-2026-3442
Date: Fri, 28 Aug 2026 21:35:11 +0200
Message-ID: <6e0d67c283a14f89564dd0662ac7c2a4216d9be0.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244562

From: Sudhir Dumbhare <sudumbha@cisco.com>

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

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.46.inc                |  1 +
 .../CVE-2026-3441_CVE-2026-3442.patch         | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index f8d926b22e2..cae7c1c872e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -42,4 +42,5 @@ SRC_URI = "\
      file://CVE-2026-6846.patch \
      file://CVE-2026-15003.patch \
      file://CVE-2026-18220.patch \
+     file://CVE-2026-3441_CVE-2026-3442.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
new file mode 100644
index 00000000000..be63bb295cb
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
@@ -0,0 +1,51 @@
+From be1339394f1b64ba8b5d4f55343522cbea26131b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 28 Feb 2026 13:16:40 +1030
+Subject: [PATCH] xcofflink buffer overflows
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
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ bfd/xcofflink.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index 691acc854ae..e1716262871 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -1908,12 +1908,9 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
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
+@@ -2279,6 +2276,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 		 functions imported from dynamic objects.  */
+ 	      if (info->output_bfd->xvec == abfd->xvec
+ 		  && *rel_csect != bfd_und_section_ptr
++		  && (unsigned long) rel->r_symndx < obj_raw_syment_count (abfd)
+ 		  && obj_xcoff_sym_hashes (abfd)[rel->r_symndx] != NULL)
+ 		{
+ 		  struct xcoff_link_hash_entry *h;
+-- 
+2.51.0
+

