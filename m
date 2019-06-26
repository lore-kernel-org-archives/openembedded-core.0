Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8526C149
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:30:46 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x4so3471834wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PUosoxQI15xH9xzGoTgw470oRzzbiwxQVsk8NSraaBE=;
	b=fCZRDsc3obJRWlaWAD3D/7cftOsdC257ZX2LvnJdY87SQxqJ8Yt1fa7jhloq/+oZ3F
	vVpc59fIQ/qU864OHCeW/w771mJCNgRMmJjpCWNkkWvvWcYrqKMKDHgfr2OtmPWHoM6Y
	f6N8Ln/ux20HFQkkYgn8qJeRwfiGr7kChrbl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PUosoxQI15xH9xzGoTgw470oRzzbiwxQVsk8NSraaBE=;
	b=BkJtYVjVjyqN8P06rEppj+e2zWKSSS3FUuLSIEBBPfwGHkOZpk+axfjqkukzna4ZLM
	oNzz+IaZJlHgwlmXiWm5aYvLE2NTrVfjke1tUqBokZkf7j3rVbjsChk1q7rafNI0o809
	WVnfoDQOM7FqiJVlD9EAFr05V8KEyLkOQsX9WW1Z48IYuhUZuqqOT71oFANcvo5KSBFb
	dv6jB8Qu0WLuguO1NnU7wyYFP3pGUoRtMAq6RNnppkoYQelCTtlnB+xzw0w5rLx2IH+S
	Oks0o0sbZRQsqSSzfz0juYUlNejxmCJIy5RvJSxXsAY+1CehcT25cFN8GH0O/Ntq7xrH
	9SGA==
X-Gm-Message-State: APjAAAU8gkhx8MJjEJcJkCR5f4d3xI91J3z4eltWvH5W9yX/X5vQcvBR
	DnoPFloPAbj/RpgRl3vrYNl4fE5FV5Y=
X-Google-Smtp-Source: APXvYqzZCBy4lOjBi3NDGvzQArSnk5GS2rsHzPfUi7eO0ONHqSQuLKMJN2eVHuUKfwLI3Eb2D42ScQ==
X-Received: by 2002:a5d:6242:: with SMTP id m2mr3478238wrv.310.1561566646666; 
	Wed, 26 Jun 2019 09:30:46 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s63sm1484460wme.17.2019.06.26.09.30.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 26 Jun 2019 09:30:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 17:30:40 +0100
Message-Id: <20190626163044.4606-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/5] multilib_global: Fix KERNEL_VERSION expansion problems
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
X-List-Received-Date: Wed, 26 Jun 2019 16:30:46 -0000
Content-Transfer-Encoding: 8bit

KERNEL_VERSION gets expanded at runtime to contain the real kernel
version. There is code to ensure the signatures are determinisic but
the multilib expansion code breaks this.

Exclude the variable from the datastore used for expansion to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/multilib_global.bbclass | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 11ac5b04579..98f65c8aae2 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -172,21 +172,27 @@ python multilib_virtclass_handler_global () {
     if bb.data.inherits_class('kernel', e.data) or \
             bb.data.inherits_class('module-base', e.data) or \
             d.getVar('BPN') in non_ml_recipes:
+
+            # We need to avoid expanding KERNEL_VERSION which we can do by deleting it
+            # from a copy of the datastore
+            localdata = bb.data.createCopy(d)
+            localdata.delVar("KERNEL_VERSION")
+
             variants = (e.data.getVar("MULTILIB_VARIANTS") or "").split()
 
             import oe.classextend
             clsextends = []
             for variant in variants:
-                clsextends.append(oe.classextend.ClassExtender(variant, e.data))
+                clsextends.append(oe.classextend.ClassExtender(variant, localdata))
 
             # Process PROVIDES
-            origprovs = provs = e.data.getVar("PROVIDES") or ""
+            origprovs = provs = localdata.getVar("PROVIDES") or ""
             for clsextend in clsextends:
                 provs = provs + " " + clsextend.map_variable("PROVIDES", setvar=False)
             e.data.setVar("PROVIDES", provs)
 
             # Process RPROVIDES
-            origrprovs = rprovs = e.data.getVar("RPROVIDES") or ""
+            origrprovs = rprovs = localdata.getVar("RPROVIDES") or ""
             for clsextend in clsextends:
                 rprovs = rprovs + " " + clsextend.map_variable("RPROVIDES", setvar=False)
             if rprovs.strip():
@@ -194,7 +200,7 @@ python multilib_virtclass_handler_global () {
 
             # Process RPROVIDES_${PN}...
             for pkg in (e.data.getVar("PACKAGES") or "").split():
-                origrprovs = rprovs = e.data.getVar("RPROVIDES_%s" % pkg) or ""
+                origrprovs = rprovs = localdata.getVar("RPROVIDES_%s" % pkg) or ""
                 for clsextend in clsextends:
                     rprovs = rprovs + " " + clsextend.map_variable("RPROVIDES_%s" % pkg, setvar=False)
                     rprovs = rprovs + " " + clsextend.extname + "-" + pkg
-- 
2.20.1


