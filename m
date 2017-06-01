Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id CCD8271976
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 01:33:32 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id i206so3580477ita.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 18:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=cK8bAIShY5nM8hJCRP+z4FOzE5yVcN9E0EXDe6XK0WY=;
	b=ja53Ru01sclNd6McZe9IVvSJ+YuXmkNINtd4XYFHJDqRiteVK8nNGzbiqsVvPfnyXc
	bKY6/D48lkm8Rm8SHSau0T8L7gUpV9BhrLX/fvG5p9vG2RcGDDx27uQ5XCMW2vRS+4ov
	J1Qd1c0sRFwhZgYZZpHYvgqJJrO8K7toyfMneh8VRWepwgh83c6kCwrZaT5O4Mnjx71J
	ey2sGhzYus1S3uv9Cyb6bMZEAfonqdZOuzWr/i1+ASSgwkoQQJUnvl6t0oIQLW/CEfDn
	pSfgxpayAMyhEM6EPwB6ZbplyTYAx1XUQtG8CE/uEZG6OKObw2BTA2rxGA8mWQs9LvE0
	Iong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cK8bAIShY5nM8hJCRP+z4FOzE5yVcN9E0EXDe6XK0WY=;
	b=i1w5v1cOoEw+LGsTlszqLWjfpZrMcBQ7SArXN9CTNqMDGZ5InhE54X/FmlqUO7N4SD
	LssrxJOBviuMEmSMNXe6sGwZXencC1Pm38S887vmdr33vni0IxDdR/AQsIMdeXG2Zjtn
	DnwWQSBIwT2wWu1hKHzydOf8dO0SrbV9d0QrLFQqv2/7JE6jy+TQU7NxtFkaKs6tuhxr
	clLQgcG9soVItueTONJsk7oLS7WaSopQa4kpoeKJadl59vpLB+lxe3HJRWZdHXQqC0j2
	tnHKMJsy+qYnYMoa4milXAFCfaoGLunfFjb8vEW5W/4mB/4iOvWF+oqBJpyQ95oIEr6O
	qobg==
X-Gm-Message-State: AODbwcC7QS0Ox7cTXpE04HvF9bV9cGo605L4xQ6Kaqw5DFEGRTjSdOiV
	Wr89YKgKx9l8Si45nrE=
X-Received: by 10.36.53.6 with SMTP id k6mr10737226ita.5.1496280813546;
	Wed, 31 May 2017 18:33:33 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id c1sm8211500itd.15.2017.05.31.18.33.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 May 2017 18:33:32 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 20:33:19 -0500
Message-Id: <20170601013319.25260-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH v2] archiver: Escape recipe name in regex
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
X-List-Received-Date: Thu, 01 Jun 2017 01:33:33 -0000

The recipe name needs to be escaped when it is used in a regular expression so
that any special characters are treated literally

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/archiver.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 2c04557..9cc9fb5 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -349,8 +349,8 @@ python do_ar_recipe () {
     bbappend_files = d.getVar('BBINCLUDED').split()
     # If recipe name is aa, we need to match files like aa.bbappend and aa_1.1.bbappend
     # Files like aa1.bbappend or aa1_1.1.bbappend must be excluded.
-    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" %pn)
-    bbappend_re1 = re.compile( r".*/%s\.bbappend$" %pn)
+    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" % re.escape(pn))
+    bbappend_re1 = re.compile( r".*/%s\.bbappend$" % re.escape(pn))
     for file in bbappend_files:
         if bbappend_re.match(file) or bbappend_re1.match(file):
             shutil.copy(file, outdir)
-- 
2.9.4


