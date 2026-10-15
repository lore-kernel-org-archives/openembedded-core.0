Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BEDCC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 20:58:59 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7819.1792097932440928956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 13:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=Wf4SGUBV;
 dkim=pass header.i=@valla.it header.s=default header.b=qXv4Tj0k;
 spf=pass (domain: valla.it, ip: 185.56.87.10, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-82tq.prod.antispam.mailspamprotection.com; s=arckey; t=1792097932;
	 b=Ye2YsS9flVMbJM+iLYGLD5OTpeHxpRXUAruoIAJhjiHgSZKn5nTDUlJxO+qiFXz8Aah/VFWIh/
	  bwXFv0K+I4h2CP/+o7RW/I+hNvgt0ILXvZpiAVf47iymkx4ZeIbdZMT2NFu+Ot7rM34ysZ2WCg
	  v4aR6zf4wtGikGpZBOVbNnpGNijWx7sARuu8NfOKJaA9+ykmExSBL4VD5Fvz2fdf5r/8v83OgT
	  Do/OFiUy6xT3SOnvnMSLUHu8RNckunxsmtiY6PzcdwuXstqXcDFvI8OgeG5ibp00AVVzRn4aFO
	  8acClwMxGwLvPzUl259tDTszLvZEQvnmRqr5AYJx6wQseg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-82tq.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-82tq.prod.antispam.mailspamprotection.com; s=arckey; t=1792097932;
	bh=6OUfLzW9wfBwQKxAXpi8H2Zq/KzD8jI7uHfoBJrNXNg=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=gR4j8qHGq//SPQOQNCv2tXIFrCgn/aSTg9lPoqWik6W5VlKkYiTYGBY4vg+ZD6aNr6niTjOqWI
	  IhqUqYPjzuZ0NsMqtFcbI3jCiwHGoHlSm60gT+jvLbo6zmsJMy9kHmB9KVdhmx0ftV8OMyBB/o
	  9X0EyQMovb3MXAV7EsIh1ZtrMq9i+CMMI1xET6rM1yRvKCCwBzCIlx3CrT0SwPKjwsvwAc8iaP
	  JdiJUvlXk8dTxzAatVfWzifjYmtG9V38ZyMS6FJO3THcPzA/1PV104fmykVDVUr/jNxXinzJmI
	  0DsOXKmljHSU4VKlkysE06AO9zUZA/BWruhzFD+M9DqqTQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=zSMumyfUE0E7MfOmZyFW3uxb6Rj3SWT4AYuU0GdQLmI=; b=Wf4SGUBV0PzT/Jlv+T9CsoeMsV
	wPhLUyKm7hTVzrqCXKW0r9Fu+RN/ALm2zqSL8a7uXJ7lZ4+eXaOoVXX6dnxynoVI3e+wcHFJZl5T+
	Gd7i8IrXjBGaQDtTx4CcSwQ2k17A6+4b8NxSqyKNdZNgjsVrgsTT6C82ktvIIuFM7T7I=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-82tq.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xHSXK-00000005xms-0HuE
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Oct 2026 20:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=zSMumyfUE0E7MfOmZyFW3uxb6Rj3SWT4AYuU0GdQLmI=; b=qXv4Tj0k7fQI1RYxgZZIVSM7iX
	6KgeVq6d1XJU+QZ6bMhQnZSgERXSbGoQ4LQea0liHjxOb0TvsEUtHSowBfmIC1uCx8X5dFgrhS5Jy
	8p/I1EHewrSEQXUV2E++rrll8i36bzp5FK9EFZtfhZTIGNmXNTkgcHaj9fDL1t8C+P8s=;
Received: from [82.89.62.246] (port=64902 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xHSXF-00000000GlX-1A0W;
	Thu, 15 Oct 2026 20:58:45 +0000
From: Francesco Valla <francesco@valla.it>
Date: Thu, 15 Oct 2026 22:58:26 +0200
Subject: [PATCH] spdx_common: fix source inclusion with externalsrc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-spdx_externalsrc-v1-1-553edd1570f2@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrA0kadHaq4gUTUadIqnMqATEu
 zfq8i3+30GQCQXe2Q6MGwn9QoLJM3BjGwZU5JPBalsYbZ5KZh8/GBfk0E7CTpmXtw9b9rqqNKR
 sZuwpXsu6uS1r90W3nB84jj+QpfW2dAAAAA==
X-Change-ID: 20261014-spdx_externalsrc-18d2327f0990
To: openembedded-core@lists.openembedded.org
Cc: Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3156; i=francesco@valla.it;
 h=from:subject:message-id; bh=6OUfLzW9wfBwQKxAXpi8H2Zq/KzD8jI7uHfoBJrNXNg=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkX7ao32CYZb/5WMF9weSfjXuGd19ra4jxUX3kvdxOMv
 bhu2uyKjlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAivCYMf0UKXon96+qfFnZF
 e8LC+uwakf3Gz4/+idFS2ZPxJmlLSjMjw6X/Vd451ha3/u9J3MV9TO7dSgdOa7PH7gfU4hoefpV
 ewQwA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 6cf7c33048e5862ae2a3d6cfb0745ae5
X-AntiAbuse: ID - 6cf7c33048e5862ae2a3d6cfb0745ae5
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xHSXK-00000005xms-0HuE-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-82tq.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 20:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247896

The source inclusion logic activated by SPDX_INCLUDE_SOURCES creates a
dedicated source directory and fills it either:

 - calling do_unpack and do_patch into that directory, or
 - copying sources from the work-shared directory for recipes that use
   one.

This mechanism however does not work properly when coupled with the
externalsrc class, which deletes the do_unpack and do_patch tasks as
part of its logic; one notable use case is the devtool development flow.
In this case, the following issues are observed:

  - the tools required by the removed tasks (e.g.: quilt for do_patch)
    are not included in the recipe sysroot, leading to a failure when
    the task is forcibly executed as part of the spdx source collection;
  - for a recipe inheriting kernel.bbclass, the directory hosting the
    external source is deleted (because is moved to spdx_workdir and
    then wiped) and the kernel-source symlink pointing to it is
    replaced with an empty directory.

As a solution, treat the external source directory case just like the
work-shared case, copying the source code from the externalsrc location
to the SPDX dedicated directory instead of re-unpacking it there.

It should be noted that if an in-tree build is performed while using
externalsrc (i.e., if EXTERNALSRC_BUILD is equal or under EXTERNALSRC),
build artifacts will be treated as source files and added to the
generated SPDX files.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 meta/lib/oe/spdx_common.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index ad2bc0ffda31..07bf9650e21e 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -42,6 +42,10 @@ def is_work_shared_spdx(d):
     return "/work-shared/" in d.getVar("S")
 
 
+def is_external_src_spdx(d):
+    return bb.data.inherits_class("externalsrc", d) and bool(d.getVar("EXTERNALSRC"))
+
+
 def load_spdx_license_data(d):
     with open(d.getVar("SPDX_LICENSES"), "r") as f:
         data = json.load(f)
@@ -174,8 +178,9 @@ def get_patched_src(d):
     """
     spdx_workdir = d.getVar("SPDXWORK")
 
-    # Do not unpack the sources again for the recipe using work-shared
-    if not is_work_shared_spdx(d):
+    # Do not unpack the sources again for the recipe using work-shared or an
+    # external source directory
+    if not is_work_shared_spdx(d) and not is_external_src_spdx(d):
         localdata = d.createCopy()
 
         # Change the UNPACKDIR to make do_unpack do_patch run in another dir.
@@ -196,7 +201,7 @@ def get_patched_src(d):
             if not os.path.exists(kernel_dst_path):
                 shutil.move(kernel_src_path, kernel_dst_path)
 
-    # Copy source from work-shared to spdx_workdir
+    # Copy source from work-shared or external source directory to spdx_workdir
     else:
         share_src = d.getVar("S")
 

---
base-commit: 7803450fd5ecc1bb714abadfbe3ec340e930139a
change-id: 20261014-spdx_externalsrc-18d2327f0990

Best regards,
--  
Francesco Valla <francesco@valla.it>


