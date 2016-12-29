Return-Path: <kergoth@gmail.com>
Received: from mail-wj0-f180.google.com (mail-wj0-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8DAB6601F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 18:06:16 +0000 (UTC)
Received: by mail-wj0-f180.google.com with SMTP id c11so158231795wjx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 10:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ehUJfOqMdOu3hZfYhplcYFzCtPD4J4dRy69nQxGrk2U=;
	b=dffUHKENIM2I3odN2k8ZWvOmwPCoPPu78QQoCPoYcSjlLizritMrX7SXi6v6vzNYeH
	2cxRifm/Vj75My1CQJ7LgOBSXpqJSVL7X9Euk/L3EY3atSY/J3OZGZt9s7Y1LUiXPev1
	Oyh/ZThyvlc2CMUuRujFisGCpAq5Ud3vrdYwOCbhwF/8+K8u/p4DcOHkw46buyDIlcBT
	q/wWh1GsczyC+8gLKWPdGbAosfNV0ziOJRFX/Z+O+xcR3PMb8m+1385DWfw4FRZpWrcl
	T5khOREmELQL8pGdcJKbvCPcZaX9AzHOdrA+d/cWJTqd3CrLfefadCb3FpLnRB9+vE2M
	15RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ehUJfOqMdOu3hZfYhplcYFzCtPD4J4dRy69nQxGrk2U=;
	b=f+fUAb1mNJwwd3CwV96ynAgeeaxveAiVcGImTZbAfFL1J9iUgnilSIsuTaRByYbAwk
	v232q9D3Z/gVGwGho9ASjKde0PSxOMjWXusayDWpccw+R63+w1KHqKkz8+aAqvMZ1WkF
	kJX7rzljAXrCcMe3Bnm5TFieL81CsLRx1GraeQrgLs1OFBuQ/ywj1ORPfcqbuimoqol0
	doGtkwnovKNXA73Pvk6liuVWV+WS8yhqis5FnD3iGKFJrcredKwSsvLgnZba3yWAqG+9
	BDvPBXWYmehfUU5jndCJQuT85cBtqQVPmsl6DFC8wr7mHgCSzI8o8aHl9DyvemJEcVBA
	p+Vg==
X-Gm-Message-State: AIkVDXLAH7Bs6f3RvpM4XA2O0+50oJsh5YV0mauFuku+raiygV7Awaq9bbFhPzG5A6yUTQ==
X-Received: by 10.194.20.68 with SMTP id l4mr37903519wje.49.1483034777893;
	Thu, 29 Dec 2016 10:06:17 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	k2sm70111877wjv.11.2016.12.29.10.06.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 10:06:16 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Dec 2016 11:06:09 -0700
Message-Id: <1483034769-15179-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] sysroot-relativelinks: also consider links to dirs on the host
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
X-List-Received-Date: Thu, 29 Dec 2016 18:06:18 -0000

From: Christopher Larson <chris_larson@mentor.com>

Dead symlinks, or symlinks to existing files will show up in 'files' of an
os.walk, but symlinks to existing directories show up in 'dirs', so we need to
consider both.

As one specific example, the symlink from /usr/lib/ssl/certs was left pointing
to /etc/ssl/certs rather than the relative path when the sdk was built on
hosts where the latter exists.

JIRA: SB-8374

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/sysroot-relativelinks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sysroot-relativelinks.py b/scripts/sysroot-relativelinks.py
index e44eba2..ffe2547 100755
--- a/scripts/sysroot-relativelinks.py
+++ b/scripts/sysroot-relativelinks.py
@@ -24,7 +24,7 @@ def handlelink(filep, subdir):
     os.symlink(os.path.relpath(topdir+link, subdir), filep)
 
 for subdir, dirs, files in os.walk(topdir):
-    for f in files:
+    for f in dirs + files:
         filep = os.path.join(subdir, f)
         if os.path.islink(filep):
             #print("Considering %s" % filep)
-- 
2.8.0


