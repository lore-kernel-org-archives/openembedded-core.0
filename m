Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id A99DA71AB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:34:23 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id 77so43067490wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=lV0L1NNXH1vmJN3LcRhawg67BjiV4riyhEfrXEgwdKk=;
	b=Srg6HHYm+GS7mlQYkH0G+b94RGX8lz22GF7TnGS79uTu8874A8/82v0uXKotC85sf3
	sXRQS9gOh2BLIF8hK16yIKm0FxYf/Ewa2acvurCQk2TYYJSf7SuAMdqlOm4723Dv7dHl
	DhY5fB2y8luyzJtOr/l66s0D43Ki1wMG6aYmUPkpRDC0y9tejf+9bt2S/CAhaUyLq1zU
	ML+QvvskpUaEXJDXaIeOX4QhYCgMEi7L7fJXLd2v9XQa4ZQPf0YnB2KdyEFVHasY1sD1
	HbKQnhAxKUh7fHhtVjLiihVySrY13dNdOUrNrLngAixtz7Lr52cn/Ubg/cwHvhBgq4lh
	5l9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lV0L1NNXH1vmJN3LcRhawg67BjiV4riyhEfrXEgwdKk=;
	b=bTcov5HqjsfDG9WshNzVxY/5ZHOu7+vLxyNqGokWV5cuJ9MHBmVb3H/wtiw5kM/hox
	z393g2J39ofFs5TYvURV9LV9Gh5X2e952zBitfVV0nawppEDjfPNNro672fhcMD68VZ+
	M0lBL6kUOJLURwZ9BSrCAu0atMfyiFJXVWOqg7UEYMcc2YJqbRMjOW/T5dXXsert+MG3
	bLBTdLqx6+iY2wbaTNVAqB7JZUtyo22eIJ1Tt2J8CruTWKAGEWaaAGZOgrrvkJdRfGS5
	L2A0PAZO5DWNB1i7wXDWYXB/n8AEBgFthjQ2jtIBn3lG4sdgbHH8ZI/y4OECUqC1yzhd
	XVdw==
X-Gm-Message-State: AIVw111qmsLJZUoDWnuVhtZfeYUqyJ7Fbd5NSxAJzNgcrAJgGrwXf+bm
	MICMYZxeeXKkj7pmq4I=
X-Received: by 10.223.142.143 with SMTP id q15mr74940wrb.180.1499888064039;
	Wed, 12 Jul 2017 12:34:24 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 52sm3081352wra.56.2017.07.12.12.34.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 12:34:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 20:34:18 +0100
Message-Id: <20170712193418.23631-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] classes/sanity: check for case-sensitive file systems
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
X-List-Received-Date: Wed, 12 Jul 2017 19:34:24 -0000

Case-insensitive file systems fail during builds in very mysterious ways, such
as mpfr:

  ERROR: patch_do_patch: Not a directory

The problem here being that mpfr has a PATCHES file, so when we try to copy the
patches into ${S}/patches/ it fails.

We can't and won't support case-insensitive file systems so add a sanity check
to abort the build if one is found.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b746b173b79..5699287a4a2 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -350,6 +350,14 @@ def check_not_nfs(path, name):
         return "The %s: %s can't be located on nfs.\n" % (name, path)
     return ""
 
+# Check that the path is on a case-sensitive file system
+def check_case_sensitive(path, name):
+    import tempfile
+    with tempfile.NamedTemporaryFile(prefix='TmP', dir=path) as tmp_file:
+        if os.path.exists(tmp_file.name.lower()):
+            return "The %s (%s) can't be on a case-insensitive file system.\n" % (name, path)
+        return ""
+
 # Check that path isn't a broken symlink
 def check_symlink(lnk, data):
     if os.path.islink(lnk) and not os.path.exists(lnk):
@@ -672,6 +680,10 @@ def check_sanity_version_change(status, d):
     # Check that TMPDIR isn't located on nfs
     status.addresult(check_not_nfs(tmpdir, "TMPDIR"))
 
+    # Check for case-insensitive file systems (such as Linux in Docker on
+    # macOS with default HFS+ file system)
+    status.addresult(check_case_sensitive(tmpdir, "TMPDIR"))
+
 def sanity_check_locale(d):
     """
     Currently bitbake switches locale to en_US.UTF-8 so check that this locale actually exists.
-- 
2.11.0


