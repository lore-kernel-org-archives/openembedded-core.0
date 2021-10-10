Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4068CC433F5
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 17:23:06 +0000 (UTC)
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
 by mx.groups.io with SMTP id smtpd.web11.965.1633886583194122657
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 10:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=V4kV05pj;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.17, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id ZcXJmpQjprasdZcXKmYTqE; Sun, 10 Oct 2021 18:22:59 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=dIE9ZNRb c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=8gfv0ekSlNoA:10 a=-An2I_7KAAAA:8 a=rZwJ_2cFA_g3EcyDxyUA:9
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=SdEisMx6leS105Tlhzp3FoA9RfSsW6fECWWK6ydFOo4=; b=V4
	kV05pjTZOBYFepBAqJWfyvt3r0SaXY+nu1YyC/o5wpcjqarD2U12d5uP6Qw9LiG6NqGTTc0CmQGfJ
	eopa1QqEMpT0m1KOoMPupXeEq8znoL+mkTwC0X/oDpsQz8OXR1CA898KekSw1KwG6aqbnrS3K7cq9
	ZOGnsoW5mj51dsMfqSPciaYSlijGr3w3V5IPvgICawrn6zEVk22ZysZfBNrAGgAaDBK8DvHt2Pbvc
	pUXcKR3AgaiiTpe4kN1tMPlkByv2tcxiMcPYhqUJ9JMv634UJuFvJ6ItLcNc1b3bOptWdb8m5pXSy
	n4LM5/P9YGXcgJr6LC5OItCZQW1TPWgg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mZcXI-00CP20-0o; Sun, 10 Oct 2021 18:22:56 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH v2] license: Allow treating missing license as error
Date: Sun, 10 Oct 2021 18:20:38 +0100
Message-Id: <20211010172038.206959-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: 
 MS4wfPOQjMcwYHEv3sfyw8DF3IAJVW/dtqUaCEKCENg0/BpldObQNqS1FSlN2nVO4axFMW6pfQCL1rWMjPwvZzE7C4GvKOGyFwoLAOYjgZu37jDKIKDmHNXO
 +agMfkxpHXJVfGNiIYEXchE9peYRX3SqkU01pgAbBu0eOGOpAL/SxLqSNK09L6mTWQm+P+erpU339w==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Oct 2021 17:23:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156793

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
index 45d912741d..f0a6c0c20e 100644
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
+        bb.note("License Issue: %s [%s]" % (error_msg, error_class))
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


