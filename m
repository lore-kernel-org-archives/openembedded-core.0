Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52334F357C2
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21685.1771943591419116270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dyUY+/1f;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so69580865e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943589; x=1772548389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvCN7cs8APyUxlH9nkWDKXo/sLqGHirXZEGQisX2PXA=;
        b=dyUY+/1fE+AbkYT/wdSY7dB4cfi50hBzyKk2zKtvk3CYc9dYpOXEDbGH+CVdT7n8qW
         Jv70KIqvsLTTr9e+ooelzvdQOxHbFOTV5DuS79ZVEGbSSqTugHIdUL3Uw/GzKqp1HWPb
         RDkahoZG24aOI8sWqISrcPFu35ys57ie7ohwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943590; x=1772548390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mvCN7cs8APyUxlH9nkWDKXo/sLqGHirXZEGQisX2PXA=;
        b=BEDhUODVns6V4H1av3NeptaqeHGQIoLaJ/8EakqXKlCtjU779jPXjwl1OEKMbUa//d
         rlsbpfHaqcj8koRAOUoWJY9bcsIxWwGa8pT5esAQwFQGUqsJAM5bAtlf7nDIb88PdZUQ
         2V4J0s0IhAintGOB/BjoYLhtogskRMxRTkFMz0DE//OFExPmJD+fb+2gafPYh61d2xJ8
         mxWhBHI1qBOT+Rbt6S7FZhp6DmGUGaqdjuqfGTrWMie/Os93OEAH3GVlLbLoopHO62to
         uW7H3fm3sqFFAWR5kGS8xoDPclhn0azKu9xbefX3yTzIorDWQSWtoeju+HKaBO52tPH1
         aBSQ==
X-Gm-Message-State: AOJu0YxpdvIatjiZM5zpHbGSg8ahbvuSlMxErGd9RnyYqj5iGdmEr6Iq
	OY588Wjj4Pp11DcRgct5azPqC68OA3JPsFguZwAPCIfzhmq6O+U4PFQEZoNjhbhCSVMQz1eYzH0
	rSZGh
X-Gm-Gg: AZuq6aKbIvhX4xP5a/6IXdvrLJtid451SvpIuETKwwX3XlPevm0Itl5K9fsIce2GlD9
	SM93RYOloSENtbxwHNHDyVBDa9/hufDmFYPH3iM5vweGDWUuGzYIiM4kJOi/2oA62wlEXFTZChd
	U9yPdyxvqFcux9GJmkPaqT/f78h+OuHEiMy7+KtsAij7qaZ9/UHGBGm7vMRVeOi/kuAtpfUOzHS
	FZZVO532AGdaFDVEx/i5xdTG69beifMjfZn6/nK3RCnPus94aqAknONQIAHV44WhDMa/OFa0aFJ
	yjiehxydzYmIvFDS5vl1677/+VE+YJfTJS0p2Xr4xCNAblSH3yHLnmys7JzvhkBN7pyvla/dD/X
	coy+Rg1IU/mpuBkS7/ZtyYzEkNjAaaYScy/a7Q7JwhgeKohPArZdFA6QTvWTEZmRwG8CpAH0qDw
	9LEaoN3F790ciLBSyAb2LLgXA7wvsnNXu/CPJP6J//6MK2J4daDDQpUcWiJ/UhiLCsp4nJKJg9/
	J7pZhaBQIg/QlpkYraYQ21g+O7wLfoE0w==
X-Received: by 2002:a05:600c:6206:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-483a95b6debmr196087775e9.6.1771943589546;
        Tue, 24 Feb 2026 06:33:09 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 29/44] go-vendor: Fix absolute paths issue
Date: Tue, 24 Feb 2026 15:31:57 +0100
Message-ID: <e21e30a2f0b679c4eeb7f1a3397d6d53dd0cafc2.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231836

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When building with the class, avoid errors like:

"sstate found an absolute path symlink /xxx/vendor pointing at
/xxx/import/vendor. Please replace this with a relative link."

Use relative symlinks instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Thomas Vandenabeele <thomas@bootzero.one>
(cherry picked from commit fc4f589cc7a8e5feba7940ccb244a74bd5f96371)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/go-vendor.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 1bbb99ac794..e58cfaf0e14 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -70,7 +70,7 @@ python do_go_vendor() {
     if os.path.exists(vendor_dir):
         # Nothing to do except re-establish link to actual vendor folder
         if not os.path.exists(linkname):
-            os.symlink(vendor_dir, linkname)
+            oe.path.relsymlink(vendor_dir, linkname)
         return
 
     bb.utils.mkdirhier(vendor_dir)
@@ -202,10 +202,10 @@ python do_go_vendor() {
         symlink_target = os.path.join(source_dir, *['src', go_import, replaced_path])
         symlink_name = os.path.join(vendor_dir, vendored_name)
         bb.debug(1, "vendored name %s, symlink name %s" % (vendored_name, symlink_name))
-        os.symlink(symlink_target, symlink_name)
+        oe.path.relsymlink(symlink_target, symlink_name)
 
     # Create a symlink to the actual directory
-    os.symlink(vendor_dir, linkname)
+    oe.path.relsymlink(vendor_dir, linkname)
 }
 
 addtask go_vendor before do_patch after do_unpack

