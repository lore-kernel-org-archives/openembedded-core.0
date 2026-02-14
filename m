Return-Path: <thomas@bootzero.one>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA12EF584B
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 16:08:54 +0000 (UTC)
Received: from mailrelay-egress12.pub.mailoutpod3-cph3.one.com (mailrelay-egress12.pub.mailoutpod3-cph3.one.com [46.30.211.251])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8739.1771085333648055114
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Feb 2026 08:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootzero.one header.s=rsa1 header.b=qwNnuHaK;
 dkim=pass header.i=@bootzero.one header.s=ed1 header.b=yzrISdwU;
 spf=none, err=permanent DNS error (domain: bootzero.one, ip: 46.30.211.251, mailfrom: thomas@bootzero.one)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1771085331; x=1771690131;
	d=bootzero.one; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=TRDiza125T3QQVGMY18wPLpMhTqYYkfZmybyfdgMZ90=;
	b=qwNnuHaK3tzOcsVHrJhO+tNyu2rESEyCKldWRqT2jVMAH4BOGLENrUfywKXinHOTH4tJQsdXHpA37
	 LagWtSqnKPZ/Q8ZYiwtIyLFJG5RfgXyW7Grg+l/IwRf/GLRBATWjQ/LT6BJAvmhyjjWMmVGFUpSKsw
	 wOyJnBDd5RtPH5H6nHa7wJrXYz1LRVTg/ydWiUiv++1cEXPzKam9FnI/mTr9cgZw52on1kaakiegx8
	 TVxtD8EvUothT7LdopgKMDR6TVjJHxG62nMlxef7uYAtulAfyr1EBCOKZmFtMHV0JnRN2a1TNoyv3B
	 uRoFk8nS1wypsoI/CZbbBbqAO54z3DQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1771085331; x=1771690131;
	d=bootzero.one; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=TRDiza125T3QQVGMY18wPLpMhTqYYkfZmybyfdgMZ90=;
	b=yzrISdwUiseVugsFTnWx7e6BnDqgEFkhyxttKZmYKrO0oVkii2c8dRD3/p0tkLMyV+9vG/OblbjZv
	 j3N/vMbDg==
X-HalOne-ID: 73515693-09bf-11f1-b1f8-fb5fec76084d
Received: from localhost.localdomain (d54c358d2.access.telenet.be [84.195.88.210])
	by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 73515693-09bf-11f1-b1f8-fb5fec76084d;
	Sat, 14 Feb 2026 16:08:51 +0000 (UTC)
From: Thomas Vandenabeele <thomas@bootzero.one>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Thomas Vandenabeele <thomas@bootzero.one>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] [scarthgap] go-vendor: Fix absolute paths issue
Date: Sat, 14 Feb 2026 17:08:06 +0100
Message-Id: <20260214160806.3043158-1-thomas@bootzero.one>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Feb 2026 16:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231152

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When building with the class, avoid errors like:

"sstate found an absolute path symlink /xxx/vendor pointing at
/xxx/import/vendor. Please replace this with a relative link."

Use relative symlinks instead.

Fixes [OE-Core 15683] in scarthgap

(From OE-Core rev: fc4f589cc7a8e5feba7940ccb244a74bd5f96371)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Thomas Vandenabeele <thomas@bootzero.one>
Cc: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/go-vendor.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 1bbb99ac79..e58cfaf0e1 100644
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

