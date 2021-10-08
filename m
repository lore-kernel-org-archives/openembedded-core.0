Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B078EC433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 08:53:47 +0000 (UTC)
Received: from avasout04.plus.net (avasout04.plus.net [212.159.14.19])
 by mx.groups.io with SMTP id smtpd.web11.6757.1633683224615938711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 01:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=ga8TznLr;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.19, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id YldGmNDfm8YYhYldHm6VKX; Fri, 08 Oct 2021 09:53:37 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=PtkIkzE3 c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=8gfv0ekSlNoA:10 a=-An2I_7KAAAA:8 a=rZwJ_2cFA_g3EcyDxyUA:9
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=pRrVDlxXUR5/LfnjNFkf/qxhSoQqAtet975jgoDsWZ8=; b=ga
	8TznLrsWtBbncAY7fieOswKNSCMlqfn5ZNKkcMb6tQqj8La1qIkDHPG5CTNB9iV3LZW60cDPa8Wwz
	bSflBJjKB3KUrDGChpvGhGJnxveKQFnufp72zz4RbWuJCEPEeVdov+9BLvCdlUA8Xno/KhPBSzg0t
	YcuhRfQX8P0KkKqiIWqdd35NS2HZ4A/xW6wRX570hy4QE6sDRqlH33kFbv6gl5IY9FhixSFBBBMR7
	i6nmdzms6C3BjK0duTqh4UL85zhTgzwLRWsKKx0o5YJUwW+saZ4dVjH0J5U93RXT2xx5thnFVGK8E
	Qf6S1lL+DpSp5a1qSg9ZdLr/jtf3tBrA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mYldF-0094PM-Fh; Fri, 08 Oct 2021 09:53:33 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] license: Allow treating missing license as error
Date: Fri,  8 Oct 2021 09:53:30 +0100
Message-Id: <20211008085330.3031018-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: 
 MS4wfKTczYuoxDTzH4iokMlDeZwqWXwcorRv8+xjVnXSVJO+ngehme9DqDV570mOYt3HOKtohC0Cty+nGZK8TA3T9IswuMFmWXNP9NOamKdxRfooM7RGT207
 czOGG0jMYhXfWz/nZ43WUImASai5jXf9UZ1Lyj5+w3gV8IuWRmS1pDA/tMxxzGodFlHrjuVrvMv0Sg==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 08:53:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156773

Use mechanism inspired by insane.bbclass to allow individual recipes or
other configuration to determine whether a missing licence should be
treated as a warning (as it is now) or as an error. This is controlled
by whether the error class is in WARN_LICENSE or ERROR_LICENSE.

Use bb.fatal in the error case to ensure that the task really fails. If
only bb.error is used then do_populate_lic isn't re-run on subsequent
builds which could lead to the error being missed.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/license.bbclass | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 45d912741d..1805f18076 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -12,6 +12,23 @@ LICENSE_CREATE_PACKAGE ??= "0"
 LICENSE_PACKAGE_SUFFIX ??= "-lic"
 LICENSE_FILES_DIRECTORY ??= "${datadir}/licenses/"
 
+# Elect whether a given type of error is a warning or error, they may
+# have been set by other files.
+WARN_LICENSE ?= "no-license"
+ERROR_LICENSE ?= ""
+WARN_LICENSE[doc] = "Space-separated list of license problems that should be reported only as warnings"
+ERROR_LICENSE[doc] = "Space-separated list of license problems that should be reported as errors"
+
+def package_license_handle_error(error_class, error_msg, d):
+    if error_class in (d.getVar("ERROR_LICENSE") or "").split():
+        package_qa_write_error(error_class, error_msg, d)
+        bb.fatal("License Issue: %s [%s]" % (error_msg, error_class))
+    elif error_class in (d.getVar("WARN_LICENSE") or "").split():
+        package_qa_write_error(error_class, error_msg, d)
+        bb.warn("License Issue: %s [%s]" % (error_msg, error_class))
+    else:
+        bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
+
 addtask populate_lic after do_patch before do_build
 do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
@@ -190,7 +207,7 @@ def find_license_files(d):
             # Add explicity avoid of CLOSED license because this isn't generic
             if license_type != 'CLOSED':
                 # And here is where we warn people that their licenses are lousy
-                bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
+                package_license_handle_error("no-license", "%s: No generic license file exists for: %s in any provider" % (pn, license_type), d)
             pass
 
     if not generic_directory:
-- 
2.30.2


